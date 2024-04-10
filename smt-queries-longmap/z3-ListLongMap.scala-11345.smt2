; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131976 () Bool)

(assert start!131976)

(declare-fun b_free!31689 () Bool)

(declare-fun b_next!31689 () Bool)

(assert (=> start!131976 (= b_free!31689 (not b_next!31689))))

(declare-fun tp!111319 () Bool)

(declare-fun b_and!51099 () Bool)

(assert (=> start!131976 (= tp!111319 b_and!51099)))

(declare-fun b!1545977 () Bool)

(declare-fun e!860525 () Bool)

(assert (=> b!1545977 (= e!860525 (not true))))

(declare-datatypes ((V!59063 0))(
  ( (V!59064 (val!19060 Int)) )
))
(declare-fun zeroValue!436 () V!59063)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103136 0))(
  ( (array!103137 (arr!49770 (Array (_ BitVec 32) (_ BitVec 64))) (size!50320 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103136)

(declare-datatypes ((tuple2!24502 0))(
  ( (tuple2!24503 (_1!12262 (_ BitVec 64)) (_2!12262 V!59063)) )
))
(declare-datatypes ((List!36010 0))(
  ( (Nil!36007) (Cons!36006 (h!37451 tuple2!24502) (t!50704 List!36010)) )
))
(declare-datatypes ((ListLongMap!22111 0))(
  ( (ListLongMap!22112 (toList!11071 List!36010)) )
))
(declare-fun lt!666452 () ListLongMap!22111)

(declare-fun contains!10040 (ListLongMap!22111 (_ BitVec 64)) Bool)

(declare-fun +!4906 (ListLongMap!22111 tuple2!24502) ListLongMap!22111)

(assert (=> b!1545977 (contains!10040 (+!4906 lt!666452 (tuple2!24503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49770 _keys!618) from!762))))

(declare-datatypes ((Unit!51516 0))(
  ( (Unit!51517) )
))
(declare-fun lt!666449 () Unit!51516)

(declare-fun addStillContains!1228 (ListLongMap!22111 (_ BitVec 64) V!59063 (_ BitVec 64)) Unit!51516)

(assert (=> b!1545977 (= lt!666449 (addStillContains!1228 lt!666452 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49770 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18072 0))(
  ( (ValueCellFull!18072 (v!21861 V!59063)) (EmptyCell!18072) )
))
(declare-datatypes ((array!103138 0))(
  ( (array!103139 (arr!49771 (Array (_ BitVec 32) ValueCell!18072)) (size!50321 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103138)

(declare-fun minValue!436 () V!59063)

(declare-fun getCurrentListMapNoExtraKeys!6538 (array!103136 array!103138 (_ BitVec 32) (_ BitVec 32) V!59063 V!59063 (_ BitVec 32) Int) ListLongMap!22111)

(assert (=> b!1545977 (= lt!666452 (getCurrentListMapNoExtraKeys!6538 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545978 () Bool)

(declare-fun e!860524 () Bool)

(declare-fun tp_is_empty!37965 () Bool)

(assert (=> b!1545978 (= e!860524 tp_is_empty!37965)))

(declare-fun b!1545979 () Bool)

(declare-fun res!1060043 () Bool)

(declare-fun e!860530 () Bool)

(assert (=> b!1545979 (=> (not res!1060043) (not e!860530))))

(assert (=> b!1545979 (= res!1060043 (and (= (size!50321 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50320 _keys!618) (size!50321 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545980 () Bool)

(declare-fun e!860527 () ListLongMap!22111)

(declare-fun call!69395 () ListLongMap!22111)

(assert (=> b!1545980 (= e!860527 call!69395)))

(declare-fun bm!69392 () Bool)

(declare-fun call!69396 () ListLongMap!22111)

(declare-fun call!69399 () ListLongMap!22111)

(assert (=> bm!69392 (= call!69396 call!69399)))

(declare-fun b!1545981 () Bool)

(declare-fun e!860531 () ListLongMap!22111)

(assert (=> b!1545981 (= e!860531 e!860527)))

(declare-fun c!141729 () Bool)

(declare-fun lt!666450 () Bool)

(assert (=> b!1545981 (= c!141729 (and (not lt!666450) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545982 () Bool)

(assert (=> b!1545982 (= e!860530 e!860525)))

(declare-fun res!1060047 () Bool)

(assert (=> b!1545982 (=> (not res!1060047) (not e!860525))))

(assert (=> b!1545982 (= res!1060047 (bvslt from!762 (size!50320 _keys!618)))))

(declare-fun lt!666451 () ListLongMap!22111)

(assert (=> b!1545982 (= lt!666451 e!860531)))

(declare-fun c!141730 () Bool)

(assert (=> b!1545982 (= c!141730 (and (not lt!666450) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545982 (= lt!666450 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!69398 () ListLongMap!22111)

(declare-fun call!69397 () ListLongMap!22111)

(declare-fun bm!69393 () Bool)

(assert (=> bm!69393 (= call!69397 (+!4906 (ite c!141730 call!69399 (ite c!141729 call!69396 call!69398)) (ite (or c!141730 c!141729) (tuple2!24503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69394 () Bool)

(assert (=> bm!69394 (= call!69395 call!69397)))

(declare-fun mapIsEmpty!58651 () Bool)

(declare-fun mapRes!58651 () Bool)

(assert (=> mapIsEmpty!58651 mapRes!58651))

(declare-fun b!1545983 () Bool)

(declare-fun e!860526 () Bool)

(assert (=> b!1545983 (= e!860526 tp_is_empty!37965)))

(declare-fun b!1545984 () Bool)

(declare-fun e!860532 () Bool)

(assert (=> b!1545984 (= e!860532 (and e!860526 mapRes!58651))))

(declare-fun condMapEmpty!58651 () Bool)

(declare-fun mapDefault!58651 () ValueCell!18072)

(assert (=> b!1545984 (= condMapEmpty!58651 (= (arr!49771 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18072)) mapDefault!58651)))))

(declare-fun b!1545985 () Bool)

(declare-fun res!1060041 () Bool)

(assert (=> b!1545985 (=> (not res!1060041) (not e!860530))))

(declare-datatypes ((List!36011 0))(
  ( (Nil!36008) (Cons!36007 (h!37452 (_ BitVec 64)) (t!50705 List!36011)) )
))
(declare-fun arrayNoDuplicates!0 (array!103136 (_ BitVec 32) List!36011) Bool)

(assert (=> b!1545985 (= res!1060041 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36008))))

(declare-fun b!1545986 () Bool)

(assert (=> b!1545986 (= e!860531 (+!4906 call!69397 (tuple2!24503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545987 () Bool)

(declare-fun res!1060042 () Bool)

(assert (=> b!1545987 (=> (not res!1060042) (not e!860525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545987 (= res!1060042 (validKeyInArray!0 (select (arr!49770 _keys!618) from!762)))))

(declare-fun b!1545988 () Bool)

(declare-fun c!141731 () Bool)

(assert (=> b!1545988 (= c!141731 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666450))))

(declare-fun e!860528 () ListLongMap!22111)

(assert (=> b!1545988 (= e!860527 e!860528)))

(declare-fun mapNonEmpty!58651 () Bool)

(declare-fun tp!111318 () Bool)

(assert (=> mapNonEmpty!58651 (= mapRes!58651 (and tp!111318 e!860524))))

(declare-fun mapValue!58651 () ValueCell!18072)

(declare-fun mapKey!58651 () (_ BitVec 32))

(declare-fun mapRest!58651 () (Array (_ BitVec 32) ValueCell!18072))

(assert (=> mapNonEmpty!58651 (= (arr!49771 _values!470) (store mapRest!58651 mapKey!58651 mapValue!58651))))

(declare-fun b!1545989 () Bool)

(assert (=> b!1545989 (= e!860528 call!69398)))

(declare-fun b!1545990 () Bool)

(assert (=> b!1545990 (= e!860528 call!69395)))

(declare-fun bm!69395 () Bool)

(assert (=> bm!69395 (= call!69399 (getCurrentListMapNoExtraKeys!6538 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545991 () Bool)

(declare-fun res!1060045 () Bool)

(assert (=> b!1545991 (=> (not res!1060045) (not e!860530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103136 (_ BitVec 32)) Bool)

(assert (=> b!1545991 (= res!1060045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1060044 () Bool)

(assert (=> start!131976 (=> (not res!1060044) (not e!860530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131976 (= res!1060044 (validMask!0 mask!926))))

(assert (=> start!131976 e!860530))

(declare-fun array_inv!38709 (array!103136) Bool)

(assert (=> start!131976 (array_inv!38709 _keys!618)))

(assert (=> start!131976 tp_is_empty!37965))

(assert (=> start!131976 true))

(assert (=> start!131976 tp!111319))

(declare-fun array_inv!38710 (array!103138) Bool)

(assert (=> start!131976 (and (array_inv!38710 _values!470) e!860532)))

(declare-fun bm!69396 () Bool)

(assert (=> bm!69396 (= call!69398 call!69396)))

(declare-fun b!1545992 () Bool)

(declare-fun res!1060046 () Bool)

(assert (=> b!1545992 (=> (not res!1060046) (not e!860530))))

(assert (=> b!1545992 (= res!1060046 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50320 _keys!618))))))

(assert (= (and start!131976 res!1060044) b!1545979))

(assert (= (and b!1545979 res!1060043) b!1545991))

(assert (= (and b!1545991 res!1060045) b!1545985))

(assert (= (and b!1545985 res!1060041) b!1545992))

(assert (= (and b!1545992 res!1060046) b!1545982))

(assert (= (and b!1545982 c!141730) b!1545986))

(assert (= (and b!1545982 (not c!141730)) b!1545981))

(assert (= (and b!1545981 c!141729) b!1545980))

(assert (= (and b!1545981 (not c!141729)) b!1545988))

(assert (= (and b!1545988 c!141731) b!1545990))

(assert (= (and b!1545988 (not c!141731)) b!1545989))

(assert (= (or b!1545990 b!1545989) bm!69396))

(assert (= (or b!1545980 bm!69396) bm!69392))

(assert (= (or b!1545980 b!1545990) bm!69394))

(assert (= (or b!1545986 bm!69392) bm!69395))

(assert (= (or b!1545986 bm!69394) bm!69393))

(assert (= (and b!1545982 res!1060047) b!1545987))

(assert (= (and b!1545987 res!1060042) b!1545977))

(assert (= (and b!1545984 condMapEmpty!58651) mapIsEmpty!58651))

(assert (= (and b!1545984 (not condMapEmpty!58651)) mapNonEmpty!58651))

(get-info :version)

(assert (= (and mapNonEmpty!58651 ((_ is ValueCellFull!18072) mapValue!58651)) b!1545978))

(assert (= (and b!1545984 ((_ is ValueCellFull!18072) mapDefault!58651)) b!1545983))

(assert (= start!131976 b!1545984))

(declare-fun m!1426067 () Bool)

(assert (=> bm!69395 m!1426067))

(declare-fun m!1426069 () Bool)

(assert (=> start!131976 m!1426069))

(declare-fun m!1426071 () Bool)

(assert (=> start!131976 m!1426071))

(declare-fun m!1426073 () Bool)

(assert (=> start!131976 m!1426073))

(declare-fun m!1426075 () Bool)

(assert (=> b!1545986 m!1426075))

(declare-fun m!1426077 () Bool)

(assert (=> mapNonEmpty!58651 m!1426077))

(declare-fun m!1426079 () Bool)

(assert (=> b!1545991 m!1426079))

(assert (=> b!1545977 m!1426067))

(declare-fun m!1426081 () Bool)

(assert (=> b!1545977 m!1426081))

(declare-fun m!1426083 () Bool)

(assert (=> b!1545977 m!1426083))

(assert (=> b!1545977 m!1426081))

(declare-fun m!1426085 () Bool)

(assert (=> b!1545977 m!1426085))

(assert (=> b!1545977 m!1426081))

(declare-fun m!1426087 () Bool)

(assert (=> b!1545977 m!1426087))

(assert (=> b!1545977 m!1426083))

(assert (=> b!1545987 m!1426081))

(assert (=> b!1545987 m!1426081))

(declare-fun m!1426089 () Bool)

(assert (=> b!1545987 m!1426089))

(declare-fun m!1426091 () Bool)

(assert (=> bm!69393 m!1426091))

(declare-fun m!1426093 () Bool)

(assert (=> b!1545985 m!1426093))

(check-sat (not b!1545977) (not b!1545991) (not b!1545985) (not bm!69395) (not mapNonEmpty!58651) b_and!51099 (not b!1545986) (not b!1545987) tp_is_empty!37965 (not bm!69393) (not start!131976) (not b_next!31689))
(check-sat b_and!51099 (not b_next!31689))
