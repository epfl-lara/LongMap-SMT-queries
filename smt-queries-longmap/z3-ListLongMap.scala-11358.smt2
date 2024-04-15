; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132002 () Bool)

(assert start!132002)

(declare-fun b_free!31765 () Bool)

(declare-fun b_next!31765 () Bool)

(assert (=> start!132002 (= b_free!31765 (not b_next!31765))))

(declare-fun tp!111547 () Bool)

(declare-fun b_and!51157 () Bool)

(assert (=> start!132002 (= tp!111547 b_and!51157)))

(declare-fun b!1547488 () Bool)

(declare-fun e!861359 () Bool)

(declare-fun e!861355 () Bool)

(assert (=> b!1547488 (= e!861359 e!861355)))

(declare-fun res!1060713 () Bool)

(assert (=> b!1547488 (=> (not res!1060713) (not e!861355))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103212 0))(
  ( (array!103213 (arr!49809 (Array (_ BitVec 32) (_ BitVec 64))) (size!50361 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103212)

(assert (=> b!1547488 (= res!1060713 (bvslt from!762 (size!50361 _keys!618)))))

(declare-datatypes ((V!59165 0))(
  ( (V!59166 (val!19098 Int)) )
))
(declare-datatypes ((tuple2!24652 0))(
  ( (tuple2!24653 (_1!12337 (_ BitVec 64)) (_2!12337 V!59165)) )
))
(declare-datatypes ((List!36120 0))(
  ( (Nil!36117) (Cons!36116 (h!37562 tuple2!24652) (t!50806 List!36120)) )
))
(declare-datatypes ((ListLongMap!22261 0))(
  ( (ListLongMap!22262 (toList!11146 List!36120)) )
))
(declare-fun lt!666705 () ListLongMap!22261)

(declare-fun e!861354 () ListLongMap!22261)

(assert (=> b!1547488 (= lt!666705 e!861354)))

(declare-fun c!141982 () Bool)

(declare-fun lt!666703 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547488 (= c!141982 (and (not lt!666703) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547488 (= lt!666703 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69927 () Bool)

(declare-fun call!69933 () ListLongMap!22261)

(declare-fun call!69934 () ListLongMap!22261)

(assert (=> bm!69927 (= call!69933 call!69934)))

(declare-fun b!1547489 () Bool)

(declare-fun c!141984 () Bool)

(assert (=> b!1547489 (= c!141984 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666703))))

(declare-fun e!861358 () ListLongMap!22261)

(declare-fun e!861360 () ListLongMap!22261)

(assert (=> b!1547489 (= e!861358 e!861360)))

(declare-fun b!1547490 () Bool)

(declare-fun e!861356 () Bool)

(declare-fun e!861353 () Bool)

(declare-fun mapRes!58765 () Bool)

(assert (=> b!1547490 (= e!861356 (and e!861353 mapRes!58765))))

(declare-fun condMapEmpty!58765 () Bool)

(declare-datatypes ((ValueCell!18110 0))(
  ( (ValueCellFull!18110 (v!21895 V!59165)) (EmptyCell!18110) )
))
(declare-datatypes ((array!103214 0))(
  ( (array!103215 (arr!49810 (Array (_ BitVec 32) ValueCell!18110)) (size!50362 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103214)

(declare-fun mapDefault!58765 () ValueCell!18110)

(assert (=> b!1547490 (= condMapEmpty!58765 (= (arr!49810 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18110)) mapDefault!58765)))))

(declare-fun b!1547491 () Bool)

(declare-fun res!1060711 () Bool)

(assert (=> b!1547491 (=> (not res!1060711) (not e!861359))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103212 (_ BitVec 32)) Bool)

(assert (=> b!1547491 (= res!1060711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1060712 () Bool)

(assert (=> start!132002 (=> (not res!1060712) (not e!861359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132002 (= res!1060712 (validMask!0 mask!926))))

(assert (=> start!132002 e!861359))

(declare-fun array_inv!38939 (array!103212) Bool)

(assert (=> start!132002 (array_inv!38939 _keys!618)))

(declare-fun tp_is_empty!38041 () Bool)

(assert (=> start!132002 tp_is_empty!38041))

(assert (=> start!132002 true))

(assert (=> start!132002 tp!111547))

(declare-fun array_inv!38940 (array!103214) Bool)

(assert (=> start!132002 (and (array_inv!38940 _values!470) e!861356)))

(declare-fun bm!69928 () Bool)

(declare-fun call!69931 () ListLongMap!22261)

(declare-fun call!69932 () ListLongMap!22261)

(assert (=> bm!69928 (= call!69931 call!69932)))

(declare-fun zeroValue!436 () V!59165)

(declare-fun minValue!436 () V!59165)

(declare-fun bm!69929 () Bool)

(declare-fun c!141983 () Bool)

(declare-fun call!69930 () ListLongMap!22261)

(declare-fun +!4972 (ListLongMap!22261 tuple2!24652) ListLongMap!22261)

(assert (=> bm!69929 (= call!69934 (+!4972 (ite c!141982 call!69932 (ite c!141983 call!69931 call!69930)) (ite (or c!141982 c!141983) (tuple2!24653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58765 () Bool)

(assert (=> mapIsEmpty!58765 mapRes!58765))

(declare-fun b!1547492 () Bool)

(assert (=> b!1547492 (= e!861355 (not true))))

(declare-fun lt!666702 () ListLongMap!22261)

(declare-fun apply!1054 (ListLongMap!22261 (_ BitVec 64)) V!59165)

(assert (=> b!1547492 (= (apply!1054 (+!4972 lt!666702 (tuple2!24653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49809 _keys!618) from!762)) (apply!1054 lt!666702 (select (arr!49809 _keys!618) from!762)))))

(declare-datatypes ((Unit!51405 0))(
  ( (Unit!51406) )
))
(declare-fun lt!666706 () Unit!51405)

(declare-fun addApplyDifferent!592 (ListLongMap!22261 (_ BitVec 64) V!59165 (_ BitVec 64)) Unit!51405)

(assert (=> b!1547492 (= lt!666706 (addApplyDifferent!592 lt!666702 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49809 _keys!618) from!762)))))

(declare-fun contains!10029 (ListLongMap!22261 (_ BitVec 64)) Bool)

(assert (=> b!1547492 (contains!10029 (+!4972 lt!666702 (tuple2!24653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49809 _keys!618) from!762))))

(declare-fun lt!666704 () Unit!51405)

(declare-fun addStillContains!1252 (ListLongMap!22261 (_ BitVec 64) V!59165 (_ BitVec 64)) Unit!51405)

(assert (=> b!1547492 (= lt!666704 (addStillContains!1252 lt!666702 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49809 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6600 (array!103212 array!103214 (_ BitVec 32) (_ BitVec 32) V!59165 V!59165 (_ BitVec 32) Int) ListLongMap!22261)

(assert (=> b!1547492 (= lt!666702 (getCurrentListMapNoExtraKeys!6600 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547493 () Bool)

(declare-fun res!1060710 () Bool)

(assert (=> b!1547493 (=> (not res!1060710) (not e!861359))))

(declare-datatypes ((List!36121 0))(
  ( (Nil!36118) (Cons!36117 (h!37563 (_ BitVec 64)) (t!50807 List!36121)) )
))
(declare-fun arrayNoDuplicates!0 (array!103212 (_ BitVec 32) List!36121) Bool)

(assert (=> b!1547493 (= res!1060710 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36118))))

(declare-fun b!1547494 () Bool)

(declare-fun e!861357 () Bool)

(assert (=> b!1547494 (= e!861357 tp_is_empty!38041)))

(declare-fun b!1547495 () Bool)

(declare-fun res!1060714 () Bool)

(assert (=> b!1547495 (=> (not res!1060714) (not e!861359))))

(assert (=> b!1547495 (= res!1060714 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50361 _keys!618))))))

(declare-fun b!1547496 () Bool)

(assert (=> b!1547496 (= e!861358 call!69933)))

(declare-fun b!1547497 () Bool)

(declare-fun res!1060715 () Bool)

(assert (=> b!1547497 (=> (not res!1060715) (not e!861355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547497 (= res!1060715 (validKeyInArray!0 (select (arr!49809 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58765 () Bool)

(declare-fun tp!111548 () Bool)

(assert (=> mapNonEmpty!58765 (= mapRes!58765 (and tp!111548 e!861357))))

(declare-fun mapValue!58765 () ValueCell!18110)

(declare-fun mapKey!58765 () (_ BitVec 32))

(declare-fun mapRest!58765 () (Array (_ BitVec 32) ValueCell!18110))

(assert (=> mapNonEmpty!58765 (= (arr!49810 _values!470) (store mapRest!58765 mapKey!58765 mapValue!58765))))

(declare-fun b!1547498 () Bool)

(assert (=> b!1547498 (= e!861360 call!69933)))

(declare-fun b!1547499 () Bool)

(assert (=> b!1547499 (= e!861353 tp_is_empty!38041)))

(declare-fun b!1547500 () Bool)

(assert (=> b!1547500 (= e!861360 call!69930)))

(declare-fun bm!69930 () Bool)

(assert (=> bm!69930 (= call!69932 (getCurrentListMapNoExtraKeys!6600 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547501 () Bool)

(declare-fun res!1060716 () Bool)

(assert (=> b!1547501 (=> (not res!1060716) (not e!861359))))

(assert (=> b!1547501 (= res!1060716 (and (= (size!50362 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50361 _keys!618) (size!50362 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547502 () Bool)

(assert (=> b!1547502 (= e!861354 e!861358)))

(assert (=> b!1547502 (= c!141983 (and (not lt!666703) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547503 () Bool)

(assert (=> b!1547503 (= e!861354 (+!4972 call!69934 (tuple2!24653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69931 () Bool)

(assert (=> bm!69931 (= call!69930 call!69931)))

(assert (= (and start!132002 res!1060712) b!1547501))

(assert (= (and b!1547501 res!1060716) b!1547491))

(assert (= (and b!1547491 res!1060711) b!1547493))

(assert (= (and b!1547493 res!1060710) b!1547495))

(assert (= (and b!1547495 res!1060714) b!1547488))

(assert (= (and b!1547488 c!141982) b!1547503))

(assert (= (and b!1547488 (not c!141982)) b!1547502))

(assert (= (and b!1547502 c!141983) b!1547496))

(assert (= (and b!1547502 (not c!141983)) b!1547489))

(assert (= (and b!1547489 c!141984) b!1547498))

(assert (= (and b!1547489 (not c!141984)) b!1547500))

(assert (= (or b!1547498 b!1547500) bm!69931))

(assert (= (or b!1547496 bm!69931) bm!69928))

(assert (= (or b!1547496 b!1547498) bm!69927))

(assert (= (or b!1547503 bm!69928) bm!69930))

(assert (= (or b!1547503 bm!69927) bm!69929))

(assert (= (and b!1547488 res!1060713) b!1547497))

(assert (= (and b!1547497 res!1060715) b!1547492))

(assert (= (and b!1547490 condMapEmpty!58765) mapIsEmpty!58765))

(assert (= (and b!1547490 (not condMapEmpty!58765)) mapNonEmpty!58765))

(get-info :version)

(assert (= (and mapNonEmpty!58765 ((_ is ValueCellFull!18110) mapValue!58765)) b!1547494))

(assert (= (and b!1547490 ((_ is ValueCellFull!18110) mapDefault!58765)) b!1547499))

(assert (= start!132002 b!1547490))

(declare-fun m!1426437 () Bool)

(assert (=> mapNonEmpty!58765 m!1426437))

(declare-fun m!1426439 () Bool)

(assert (=> start!132002 m!1426439))

(declare-fun m!1426441 () Bool)

(assert (=> start!132002 m!1426441))

(declare-fun m!1426443 () Bool)

(assert (=> start!132002 m!1426443))

(declare-fun m!1426445 () Bool)

(assert (=> b!1547497 m!1426445))

(assert (=> b!1547497 m!1426445))

(declare-fun m!1426447 () Bool)

(assert (=> b!1547497 m!1426447))

(declare-fun m!1426449 () Bool)

(assert (=> b!1547493 m!1426449))

(declare-fun m!1426451 () Bool)

(assert (=> bm!69929 m!1426451))

(declare-fun m!1426453 () Bool)

(assert (=> b!1547492 m!1426453))

(declare-fun m!1426455 () Bool)

(assert (=> b!1547492 m!1426455))

(assert (=> b!1547492 m!1426445))

(assert (=> b!1547492 m!1426445))

(declare-fun m!1426457 () Bool)

(assert (=> b!1547492 m!1426457))

(assert (=> b!1547492 m!1426445))

(declare-fun m!1426459 () Bool)

(assert (=> b!1547492 m!1426459))

(declare-fun m!1426461 () Bool)

(assert (=> b!1547492 m!1426461))

(assert (=> b!1547492 m!1426453))

(assert (=> b!1547492 m!1426445))

(declare-fun m!1426463 () Bool)

(assert (=> b!1547492 m!1426463))

(assert (=> b!1547492 m!1426445))

(declare-fun m!1426465 () Bool)

(assert (=> b!1547492 m!1426465))

(assert (=> b!1547492 m!1426461))

(assert (=> b!1547492 m!1426445))

(declare-fun m!1426467 () Bool)

(assert (=> b!1547492 m!1426467))

(declare-fun m!1426469 () Bool)

(assert (=> b!1547491 m!1426469))

(declare-fun m!1426471 () Bool)

(assert (=> b!1547503 m!1426471))

(assert (=> bm!69930 m!1426455))

(check-sat (not b!1547493) (not b!1547492) (not b!1547491) (not b_next!31765) tp_is_empty!38041 (not bm!69929) b_and!51157 (not b!1547497) (not start!132002) (not b!1547503) (not mapNonEmpty!58765) (not bm!69930))
(check-sat b_and!51157 (not b_next!31765))
