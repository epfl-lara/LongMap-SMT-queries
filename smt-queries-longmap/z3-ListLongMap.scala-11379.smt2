; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132218 () Bool)

(assert start!132218)

(declare-fun b_free!31893 () Bool)

(declare-fun b_next!31893 () Bool)

(assert (=> start!132218 (= b_free!31893 (not b_next!31893))))

(declare-fun tp!111937 () Bool)

(declare-fun b_and!51323 () Bool)

(assert (=> start!132218 (= tp!111937 b_and!51323)))

(declare-fun b!1551211 () Bool)

(declare-fun res!1062331 () Bool)

(declare-fun e!863515 () Bool)

(assert (=> b!1551211 (=> (not res!1062331) (not e!863515))))

(declare-datatypes ((array!103538 0))(
  ( (array!103539 (arr!49969 (Array (_ BitVec 32) (_ BitVec 64))) (size!50519 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103538)

(declare-datatypes ((List!36180 0))(
  ( (Nil!36177) (Cons!36176 (h!37621 (_ BitVec 64)) (t!50890 List!36180)) )
))
(declare-fun arrayNoDuplicates!0 (array!103538 (_ BitVec 32) List!36180) Bool)

(assert (=> b!1551211 (= res!1062331 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36177))))

(declare-fun b!1551212 () Bool)

(declare-fun e!863514 () Bool)

(declare-fun tp_is_empty!38169 () Bool)

(assert (=> b!1551212 (= e!863514 tp_is_empty!38169)))

(declare-datatypes ((V!59335 0))(
  ( (V!59336 (val!19162 Int)) )
))
(declare-fun zeroValue!436 () V!59335)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun bm!70949 () Bool)

(declare-datatypes ((ValueCell!18174 0))(
  ( (ValueCellFull!18174 (v!21965 V!59335)) (EmptyCell!18174) )
))
(declare-datatypes ((array!103540 0))(
  ( (array!103541 (arr!49970 (Array (_ BitVec 32) ValueCell!18174)) (size!50520 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103540)

(declare-fun minValue!436 () V!59335)

(declare-datatypes ((tuple2!24702 0))(
  ( (tuple2!24703 (_1!12362 (_ BitVec 64)) (_2!12362 V!59335)) )
))
(declare-datatypes ((List!36181 0))(
  ( (Nil!36178) (Cons!36177 (h!37622 tuple2!24702) (t!50891 List!36181)) )
))
(declare-datatypes ((ListLongMap!22311 0))(
  ( (ListLongMap!22312 (toList!11171 List!36181)) )
))
(declare-fun call!70956 () ListLongMap!22311)

(declare-fun getCurrentListMapNoExtraKeys!6619 (array!103538 array!103540 (_ BitVec 32) (_ BitVec 32) V!59335 V!59335 (_ BitVec 32) Int) ListLongMap!22311)

(assert (=> bm!70949 (= call!70956 (getCurrentListMapNoExtraKeys!6619 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1062336 () Bool)

(assert (=> start!132218 (=> (not res!1062336) (not e!863515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132218 (= res!1062336 (validMask!0 mask!926))))

(assert (=> start!132218 e!863515))

(declare-fun array_inv!38849 (array!103538) Bool)

(assert (=> start!132218 (array_inv!38849 _keys!618)))

(assert (=> start!132218 tp_is_empty!38169))

(assert (=> start!132218 true))

(assert (=> start!132218 tp!111937))

(declare-fun e!863510 () Bool)

(declare-fun array_inv!38850 (array!103540) Bool)

(assert (=> start!132218 (and (array_inv!38850 _values!470) e!863510)))

(declare-fun b!1551213 () Bool)

(declare-fun mapRes!58963 () Bool)

(assert (=> b!1551213 (= e!863510 (and e!863514 mapRes!58963))))

(declare-fun condMapEmpty!58963 () Bool)

(declare-fun mapDefault!58963 () ValueCell!18174)

(assert (=> b!1551213 (= condMapEmpty!58963 (= (arr!49970 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18174)) mapDefault!58963)))))

(declare-fun bm!70950 () Bool)

(declare-fun call!70952 () ListLongMap!22311)

(declare-fun call!70953 () ListLongMap!22311)

(assert (=> bm!70950 (= call!70952 call!70953)))

(declare-fun bm!70951 () Bool)

(assert (=> bm!70951 (= call!70953 call!70956)))

(declare-fun b!1551214 () Bool)

(declare-fun res!1062333 () Bool)

(assert (=> b!1551214 (=> (not res!1062333) (not e!863515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103538 (_ BitVec 32)) Bool)

(assert (=> b!1551214 (= res!1062333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551215 () Bool)

(declare-fun e!863516 () ListLongMap!22311)

(assert (=> b!1551215 (= e!863516 call!70952)))

(declare-fun b!1551216 () Bool)

(declare-fun res!1062330 () Bool)

(declare-fun e!863518 () Bool)

(assert (=> b!1551216 (=> (not res!1062330) (not e!863518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551216 (= res!1062330 (validKeyInArray!0 (select (arr!49969 _keys!618) from!762)))))

(declare-fun b!1551217 () Bool)

(declare-fun e!863512 () ListLongMap!22311)

(declare-fun call!70954 () ListLongMap!22311)

(assert (=> b!1551217 (= e!863512 call!70954)))

(declare-fun b!1551218 () Bool)

(declare-fun e!863511 () Bool)

(assert (=> b!1551218 (= e!863511 tp_is_empty!38169)))

(declare-fun b!1551219 () Bool)

(declare-fun e!863513 () Bool)

(assert (=> b!1551219 (= e!863518 (not e!863513))))

(declare-fun res!1062337 () Bool)

(assert (=> b!1551219 (=> (not res!1062337) (not e!863513))))

(declare-fun lt!668553 () ListLongMap!22311)

(declare-fun contains!10112 (ListLongMap!22311 (_ BitVec 64)) Bool)

(assert (=> b!1551219 (= res!1062337 (contains!10112 lt!668553 (select (arr!49969 _keys!618) from!762)))))

(declare-fun apply!1096 (ListLongMap!22311 (_ BitVec 64)) V!59335)

(declare-fun +!4992 (ListLongMap!22311 tuple2!24702) ListLongMap!22311)

(assert (=> b!1551219 (= (apply!1096 (+!4992 lt!668553 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49969 _keys!618) from!762)) (apply!1096 lt!668553 (select (arr!49969 _keys!618) from!762)))))

(declare-datatypes ((Unit!51664 0))(
  ( (Unit!51665) )
))
(declare-fun lt!668556 () Unit!51664)

(declare-fun addApplyDifferent!634 (ListLongMap!22311 (_ BitVec 64) V!59335 (_ BitVec 64)) Unit!51664)

(assert (=> b!1551219 (= lt!668556 (addApplyDifferent!634 lt!668553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49969 _keys!618) from!762)))))

(assert (=> b!1551219 (contains!10112 (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49969 _keys!618) from!762))))

(declare-fun lt!668554 () Unit!51664)

(declare-fun addStillContains!1292 (ListLongMap!22311 (_ BitVec 64) V!59335 (_ BitVec 64)) Unit!51664)

(assert (=> b!1551219 (= lt!668554 (addStillContains!1292 lt!668553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49969 _keys!618) from!762)))))

(assert (=> b!1551219 (= lt!668553 (getCurrentListMapNoExtraKeys!6619 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551220 () Bool)

(assert (=> b!1551220 (= e!863515 e!863518)))

(declare-fun res!1062332 () Bool)

(assert (=> b!1551220 (=> (not res!1062332) (not e!863518))))

(assert (=> b!1551220 (= res!1062332 (bvslt from!762 (size!50519 _keys!618)))))

(declare-fun lt!668555 () ListLongMap!22311)

(declare-fun e!863519 () ListLongMap!22311)

(assert (=> b!1551220 (= lt!668555 e!863519)))

(declare-fun c!142728 () Bool)

(declare-fun lt!668552 () Bool)

(assert (=> b!1551220 (= c!142728 (and (not lt!668552) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551220 (= lt!668552 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!58963 () Bool)

(assert (=> mapIsEmpty!58963 mapRes!58963))

(declare-fun b!1551221 () Bool)

(assert (=> b!1551221 (= e!863519 e!863512)))

(declare-fun c!142727 () Bool)

(assert (=> b!1551221 (= c!142727 (and (not lt!668552) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551222 () Bool)

(declare-fun res!1062334 () Bool)

(assert (=> b!1551222 (=> (not res!1062334) (not e!863515))))

(assert (=> b!1551222 (= res!1062334 (and (= (size!50520 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50519 _keys!618) (size!50520 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551223 () Bool)

(declare-fun res!1062335 () Bool)

(assert (=> b!1551223 (=> (not res!1062335) (not e!863515))))

(assert (=> b!1551223 (= res!1062335 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50519 _keys!618))))))

(declare-fun bm!70952 () Bool)

(declare-fun call!70955 () ListLongMap!22311)

(assert (=> bm!70952 (= call!70955 (+!4992 (ite c!142728 call!70956 (ite c!142727 call!70953 call!70952)) (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551224 () Bool)

(declare-fun c!142726 () Bool)

(assert (=> b!1551224 (= c!142726 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668552))))

(assert (=> b!1551224 (= e!863512 e!863516)))

(declare-fun mapNonEmpty!58963 () Bool)

(declare-fun tp!111936 () Bool)

(assert (=> mapNonEmpty!58963 (= mapRes!58963 (and tp!111936 e!863511))))

(declare-fun mapValue!58963 () ValueCell!18174)

(declare-fun mapRest!58963 () (Array (_ BitVec 32) ValueCell!18174))

(declare-fun mapKey!58963 () (_ BitVec 32))

(assert (=> mapNonEmpty!58963 (= (arr!49970 _values!470) (store mapRest!58963 mapKey!58963 mapValue!58963))))

(declare-fun b!1551225 () Bool)

(assert (=> b!1551225 (= e!863513 (not (= (select (arr!49969 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!70953 () Bool)

(assert (=> bm!70953 (= call!70954 call!70955)))

(declare-fun b!1551226 () Bool)

(assert (=> b!1551226 (= e!863519 (+!4992 call!70955 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551227 () Bool)

(assert (=> b!1551227 (= e!863516 call!70954)))

(assert (= (and start!132218 res!1062336) b!1551222))

(assert (= (and b!1551222 res!1062334) b!1551214))

(assert (= (and b!1551214 res!1062333) b!1551211))

(assert (= (and b!1551211 res!1062331) b!1551223))

(assert (= (and b!1551223 res!1062335) b!1551220))

(assert (= (and b!1551220 c!142728) b!1551226))

(assert (= (and b!1551220 (not c!142728)) b!1551221))

(assert (= (and b!1551221 c!142727) b!1551217))

(assert (= (and b!1551221 (not c!142727)) b!1551224))

(assert (= (and b!1551224 c!142726) b!1551227))

(assert (= (and b!1551224 (not c!142726)) b!1551215))

(assert (= (or b!1551227 b!1551215) bm!70950))

(assert (= (or b!1551217 bm!70950) bm!70951))

(assert (= (or b!1551217 b!1551227) bm!70953))

(assert (= (or b!1551226 bm!70951) bm!70949))

(assert (= (or b!1551226 bm!70953) bm!70952))

(assert (= (and b!1551220 res!1062332) b!1551216))

(assert (= (and b!1551216 res!1062330) b!1551219))

(assert (= (and b!1551219 res!1062337) b!1551225))

(assert (= (and b!1551213 condMapEmpty!58963) mapIsEmpty!58963))

(assert (= (and b!1551213 (not condMapEmpty!58963)) mapNonEmpty!58963))

(get-info :version)

(assert (= (and mapNonEmpty!58963 ((_ is ValueCellFull!18174) mapValue!58963)) b!1551218))

(assert (= (and b!1551213 ((_ is ValueCellFull!18174) mapDefault!58963)) b!1551212))

(assert (= start!132218 b!1551213))

(declare-fun m!1429893 () Bool)

(assert (=> b!1551216 m!1429893))

(assert (=> b!1551216 m!1429893))

(declare-fun m!1429895 () Bool)

(assert (=> b!1551216 m!1429895))

(declare-fun m!1429897 () Bool)

(assert (=> bm!70949 m!1429897))

(assert (=> b!1551225 m!1429893))

(declare-fun m!1429899 () Bool)

(assert (=> bm!70952 m!1429899))

(declare-fun m!1429901 () Bool)

(assert (=> b!1551226 m!1429901))

(declare-fun m!1429903 () Bool)

(assert (=> b!1551214 m!1429903))

(declare-fun m!1429905 () Bool)

(assert (=> b!1551211 m!1429905))

(declare-fun m!1429907 () Bool)

(assert (=> mapNonEmpty!58963 m!1429907))

(declare-fun m!1429909 () Bool)

(assert (=> start!132218 m!1429909))

(declare-fun m!1429911 () Bool)

(assert (=> start!132218 m!1429911))

(declare-fun m!1429913 () Bool)

(assert (=> start!132218 m!1429913))

(assert (=> b!1551219 m!1429897))

(assert (=> b!1551219 m!1429893))

(assert (=> b!1551219 m!1429893))

(declare-fun m!1429915 () Bool)

(assert (=> b!1551219 m!1429915))

(assert (=> b!1551219 m!1429893))

(declare-fun m!1429917 () Bool)

(assert (=> b!1551219 m!1429917))

(declare-fun m!1429919 () Bool)

(assert (=> b!1551219 m!1429919))

(assert (=> b!1551219 m!1429893))

(declare-fun m!1429921 () Bool)

(assert (=> b!1551219 m!1429921))

(declare-fun m!1429923 () Bool)

(assert (=> b!1551219 m!1429923))

(assert (=> b!1551219 m!1429919))

(assert (=> b!1551219 m!1429923))

(assert (=> b!1551219 m!1429893))

(declare-fun m!1429925 () Bool)

(assert (=> b!1551219 m!1429925))

(assert (=> b!1551219 m!1429893))

(declare-fun m!1429927 () Bool)

(assert (=> b!1551219 m!1429927))

(assert (=> b!1551219 m!1429893))

(declare-fun m!1429929 () Bool)

(assert (=> b!1551219 m!1429929))

(check-sat (not b_next!31893) (not mapNonEmpty!58963) (not b!1551214) b_and!51323 (not b!1551226) (not start!132218) tp_is_empty!38169 (not b!1551219) (not bm!70949) (not b!1551216) (not b!1551211) (not bm!70952))
(check-sat b_and!51323 (not b_next!31893))
(get-model)

(declare-fun d!160959 () Bool)

(assert (=> d!160959 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132218 d!160959))

(declare-fun d!160961 () Bool)

(assert (=> d!160961 (= (array_inv!38849 _keys!618) (bvsge (size!50519 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132218 d!160961))

(declare-fun d!160963 () Bool)

(assert (=> d!160963 (= (array_inv!38850 _values!470) (bvsge (size!50520 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132218 d!160963))

(declare-fun d!160965 () Bool)

(assert (=> d!160965 (= (validKeyInArray!0 (select (arr!49969 _keys!618) from!762)) (and (not (= (select (arr!49969 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49969 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1551216 d!160965))

(declare-fun b!1551303 () Bool)

(declare-fun e!863564 () ListLongMap!22311)

(assert (=> b!1551303 (= e!863564 (ListLongMap!22312 Nil!36178))))

(declare-fun b!1551304 () Bool)

(declare-fun e!863565 () ListLongMap!22311)

(assert (=> b!1551304 (= e!863564 e!863565)))

(declare-fun c!142747 () Bool)

(assert (=> b!1551304 (= c!142747 (validKeyInArray!0 (select (arr!49969 _keys!618) from!762)))))

(declare-fun b!1551305 () Bool)

(declare-fun e!863569 () Bool)

(declare-fun e!863567 () Bool)

(assert (=> b!1551305 (= e!863569 e!863567)))

(declare-fun c!142746 () Bool)

(assert (=> b!1551305 (= c!142746 (bvslt from!762 (size!50519 _keys!618)))))

(declare-fun call!70974 () ListLongMap!22311)

(declare-fun bm!70971 () Bool)

(assert (=> bm!70971 (= call!70974 (getCurrentListMapNoExtraKeys!6619 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun d!160967 () Bool)

(declare-fun e!863570 () Bool)

(assert (=> d!160967 e!863570))

(declare-fun res!1062373 () Bool)

(assert (=> d!160967 (=> (not res!1062373) (not e!863570))))

(declare-fun lt!668588 () ListLongMap!22311)

(assert (=> d!160967 (= res!1062373 (not (contains!10112 lt!668588 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160967 (= lt!668588 e!863564)))

(declare-fun c!142749 () Bool)

(assert (=> d!160967 (= c!142749 (bvsge from!762 (size!50519 _keys!618)))))

(assert (=> d!160967 (validMask!0 mask!926)))

(assert (=> d!160967 (= (getCurrentListMapNoExtraKeys!6619 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668588)))

(declare-fun b!1551306 () Bool)

(assert (=> b!1551306 (= e!863567 (= lt!668588 (getCurrentListMapNoExtraKeys!6619 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1551307 () Bool)

(assert (=> b!1551307 (= e!863565 call!70974)))

(declare-fun b!1551308 () Bool)

(assert (=> b!1551308 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50519 _keys!618)))))

(assert (=> b!1551308 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50520 _values!470)))))

(declare-fun e!863566 () Bool)

(declare-fun get!26018 (ValueCell!18174 V!59335) V!59335)

(declare-fun dynLambda!3803 (Int (_ BitVec 64)) V!59335)

(assert (=> b!1551308 (= e!863566 (= (apply!1096 lt!668588 (select (arr!49969 _keys!618) from!762)) (get!26018 (select (arr!49970 _values!470) from!762) (dynLambda!3803 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1551309 () Bool)

(declare-fun res!1062370 () Bool)

(assert (=> b!1551309 (=> (not res!1062370) (not e!863570))))

(assert (=> b!1551309 (= res!1062370 (not (contains!10112 lt!668588 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1551310 () Bool)

(assert (=> b!1551310 (= e!863569 e!863566)))

(assert (=> b!1551310 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50519 _keys!618)))))

(declare-fun res!1062371 () Bool)

(assert (=> b!1551310 (= res!1062371 (contains!10112 lt!668588 (select (arr!49969 _keys!618) from!762)))))

(assert (=> b!1551310 (=> (not res!1062371) (not e!863566))))

(declare-fun b!1551311 () Bool)

(declare-fun e!863568 () Bool)

(assert (=> b!1551311 (= e!863568 (validKeyInArray!0 (select (arr!49969 _keys!618) from!762)))))

(assert (=> b!1551311 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1551312 () Bool)

(declare-fun lt!668587 () Unit!51664)

(declare-fun lt!668586 () Unit!51664)

(assert (=> b!1551312 (= lt!668587 lt!668586)))

(declare-fun lt!668590 () V!59335)

(declare-fun lt!668591 () (_ BitVec 64))

(declare-fun lt!668592 () ListLongMap!22311)

(declare-fun lt!668589 () (_ BitVec 64))

(assert (=> b!1551312 (not (contains!10112 (+!4992 lt!668592 (tuple2!24703 lt!668589 lt!668590)) lt!668591))))

(declare-fun addStillNotContains!511 (ListLongMap!22311 (_ BitVec 64) V!59335 (_ BitVec 64)) Unit!51664)

(assert (=> b!1551312 (= lt!668586 (addStillNotContains!511 lt!668592 lt!668589 lt!668590 lt!668591))))

(assert (=> b!1551312 (= lt!668591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1551312 (= lt!668590 (get!26018 (select (arr!49970 _values!470) from!762) (dynLambda!3803 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1551312 (= lt!668589 (select (arr!49969 _keys!618) from!762))))

(assert (=> b!1551312 (= lt!668592 call!70974)))

(assert (=> b!1551312 (= e!863565 (+!4992 call!70974 (tuple2!24703 (select (arr!49969 _keys!618) from!762) (get!26018 (select (arr!49970 _values!470) from!762) (dynLambda!3803 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1551313 () Bool)

(declare-fun isEmpty!1130 (ListLongMap!22311) Bool)

(assert (=> b!1551313 (= e!863567 (isEmpty!1130 lt!668588))))

(declare-fun b!1551314 () Bool)

(assert (=> b!1551314 (= e!863570 e!863569)))

(declare-fun c!142748 () Bool)

(assert (=> b!1551314 (= c!142748 e!863568)))

(declare-fun res!1062372 () Bool)

(assert (=> b!1551314 (=> (not res!1062372) (not e!863568))))

(assert (=> b!1551314 (= res!1062372 (bvslt from!762 (size!50519 _keys!618)))))

(assert (= (and d!160967 c!142749) b!1551303))

(assert (= (and d!160967 (not c!142749)) b!1551304))

(assert (= (and b!1551304 c!142747) b!1551312))

(assert (= (and b!1551304 (not c!142747)) b!1551307))

(assert (= (or b!1551312 b!1551307) bm!70971))

(assert (= (and d!160967 res!1062373) b!1551309))

(assert (= (and b!1551309 res!1062370) b!1551314))

(assert (= (and b!1551314 res!1062372) b!1551311))

(assert (= (and b!1551314 c!142748) b!1551310))

(assert (= (and b!1551314 (not c!142748)) b!1551305))

(assert (= (and b!1551310 res!1062371) b!1551308))

(assert (= (and b!1551305 c!142746) b!1551306))

(assert (= (and b!1551305 (not c!142746)) b!1551313))

(declare-fun b_lambda!24771 () Bool)

(assert (=> (not b_lambda!24771) (not b!1551308)))

(declare-fun t!50895 () Bool)

(declare-fun tb!12479 () Bool)

(assert (=> (and start!132218 (= defaultEntry!478 defaultEntry!478) t!50895) tb!12479))

(declare-fun result!26073 () Bool)

(assert (=> tb!12479 (= result!26073 tp_is_empty!38169)))

(assert (=> b!1551308 t!50895))

(declare-fun b_and!51327 () Bool)

(assert (= b_and!51323 (and (=> t!50895 result!26073) b_and!51327)))

(declare-fun b_lambda!24773 () Bool)

(assert (=> (not b_lambda!24773) (not b!1551312)))

(assert (=> b!1551312 t!50895))

(declare-fun b_and!51329 () Bool)

(assert (= b_and!51327 (and (=> t!50895 result!26073) b_and!51329)))

(assert (=> b!1551311 m!1429893))

(assert (=> b!1551311 m!1429893))

(assert (=> b!1551311 m!1429895))

(declare-fun m!1429969 () Bool)

(assert (=> d!160967 m!1429969))

(assert (=> d!160967 m!1429909))

(declare-fun m!1429971 () Bool)

(assert (=> b!1551309 m!1429971))

(assert (=> b!1551310 m!1429893))

(assert (=> b!1551310 m!1429893))

(declare-fun m!1429973 () Bool)

(assert (=> b!1551310 m!1429973))

(assert (=> b!1551312 m!1429893))

(declare-fun m!1429975 () Bool)

(assert (=> b!1551312 m!1429975))

(declare-fun m!1429977 () Bool)

(assert (=> b!1551312 m!1429977))

(declare-fun m!1429979 () Bool)

(assert (=> b!1551312 m!1429979))

(declare-fun m!1429981 () Bool)

(assert (=> b!1551312 m!1429981))

(declare-fun m!1429983 () Bool)

(assert (=> b!1551312 m!1429983))

(assert (=> b!1551312 m!1429979))

(assert (=> b!1551312 m!1429981))

(declare-fun m!1429985 () Bool)

(assert (=> b!1551312 m!1429985))

(assert (=> b!1551312 m!1429983))

(declare-fun m!1429987 () Bool)

(assert (=> b!1551312 m!1429987))

(assert (=> b!1551304 m!1429893))

(assert (=> b!1551304 m!1429893))

(assert (=> b!1551304 m!1429895))

(declare-fun m!1429989 () Bool)

(assert (=> b!1551306 m!1429989))

(declare-fun m!1429991 () Bool)

(assert (=> b!1551313 m!1429991))

(assert (=> bm!70971 m!1429989))

(assert (=> b!1551308 m!1429893))

(assert (=> b!1551308 m!1429979))

(assert (=> b!1551308 m!1429981))

(assert (=> b!1551308 m!1429979))

(assert (=> b!1551308 m!1429981))

(assert (=> b!1551308 m!1429985))

(assert (=> b!1551308 m!1429893))

(declare-fun m!1429993 () Bool)

(assert (=> b!1551308 m!1429993))

(assert (=> bm!70949 d!160967))

(declare-fun b!1551325 () Bool)

(declare-fun e!863577 () Bool)

(declare-fun call!70977 () Bool)

(assert (=> b!1551325 (= e!863577 call!70977)))

(declare-fun bm!70974 () Bool)

(assert (=> bm!70974 (= call!70977 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1551327 () Bool)

(declare-fun e!863579 () Bool)

(declare-fun e!863578 () Bool)

(assert (=> b!1551327 (= e!863579 e!863578)))

(declare-fun c!142752 () Bool)

(assert (=> b!1551327 (= c!142752 (validKeyInArray!0 (select (arr!49969 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1551328 () Bool)

(assert (=> b!1551328 (= e!863578 call!70977)))

(declare-fun b!1551326 () Bool)

(assert (=> b!1551326 (= e!863578 e!863577)))

(declare-fun lt!668599 () (_ BitVec 64))

(assert (=> b!1551326 (= lt!668599 (select (arr!49969 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668600 () Unit!51664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103538 (_ BitVec 64) (_ BitVec 32)) Unit!51664)

(assert (=> b!1551326 (= lt!668600 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668599 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1551326 (arrayContainsKey!0 _keys!618 lt!668599 #b00000000000000000000000000000000)))

(declare-fun lt!668601 () Unit!51664)

(assert (=> b!1551326 (= lt!668601 lt!668600)))

(declare-fun res!1062379 () Bool)

(declare-datatypes ((SeekEntryResult!13514 0))(
  ( (MissingZero!13514 (index!56454 (_ BitVec 32))) (Found!13514 (index!56455 (_ BitVec 32))) (Intermediate!13514 (undefined!14326 Bool) (index!56456 (_ BitVec 32)) (x!139129 (_ BitVec 32))) (Undefined!13514) (MissingVacant!13514 (index!56457 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103538 (_ BitVec 32)) SeekEntryResult!13514)

(assert (=> b!1551326 (= res!1062379 (= (seekEntryOrOpen!0 (select (arr!49969 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13514 #b00000000000000000000000000000000)))))

(assert (=> b!1551326 (=> (not res!1062379) (not e!863577))))

(declare-fun d!160969 () Bool)

(declare-fun res!1062378 () Bool)

(assert (=> d!160969 (=> res!1062378 e!863579)))

(assert (=> d!160969 (= res!1062378 (bvsge #b00000000000000000000000000000000 (size!50519 _keys!618)))))

(assert (=> d!160969 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!863579)))

(assert (= (and d!160969 (not res!1062378)) b!1551327))

(assert (= (and b!1551327 c!142752) b!1551326))

(assert (= (and b!1551327 (not c!142752)) b!1551328))

(assert (= (and b!1551326 res!1062379) b!1551325))

(assert (= (or b!1551325 b!1551328) bm!70974))

(declare-fun m!1429995 () Bool)

(assert (=> bm!70974 m!1429995))

(declare-fun m!1429997 () Bool)

(assert (=> b!1551327 m!1429997))

(assert (=> b!1551327 m!1429997))

(declare-fun m!1429999 () Bool)

(assert (=> b!1551327 m!1429999))

(assert (=> b!1551326 m!1429997))

(declare-fun m!1430001 () Bool)

(assert (=> b!1551326 m!1430001))

(declare-fun m!1430003 () Bool)

(assert (=> b!1551326 m!1430003))

(assert (=> b!1551326 m!1429997))

(declare-fun m!1430005 () Bool)

(assert (=> b!1551326 m!1430005))

(assert (=> b!1551214 d!160969))

(declare-fun d!160971 () Bool)

(declare-fun e!863582 () Bool)

(assert (=> d!160971 e!863582))

(declare-fun res!1062385 () Bool)

(assert (=> d!160971 (=> (not res!1062385) (not e!863582))))

(declare-fun lt!668610 () ListLongMap!22311)

(assert (=> d!160971 (= res!1062385 (contains!10112 lt!668610 (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668612 () List!36181)

(assert (=> d!160971 (= lt!668610 (ListLongMap!22312 lt!668612))))

(declare-fun lt!668611 () Unit!51664)

(declare-fun lt!668613 () Unit!51664)

(assert (=> d!160971 (= lt!668611 lt!668613)))

(declare-datatypes ((Option!806 0))(
  ( (Some!805 (v!21967 V!59335)) (None!804) )
))
(declare-fun getValueByKey!730 (List!36181 (_ BitVec 64)) Option!806)

(assert (=> d!160971 (= (getValueByKey!730 lt!668612 (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!805 (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!372 (List!36181 (_ BitVec 64) V!59335) Unit!51664)

(assert (=> d!160971 (= lt!668613 (lemmaContainsTupThenGetReturnValue!372 lt!668612 (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!501 (List!36181 (_ BitVec 64) V!59335) List!36181)

(assert (=> d!160971 (= lt!668612 (insertStrictlySorted!501 (toList!11171 call!70955) (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160971 (= (+!4992 call!70955 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668610)))

(declare-fun b!1551333 () Bool)

(declare-fun res!1062384 () Bool)

(assert (=> b!1551333 (=> (not res!1062384) (not e!863582))))

(assert (=> b!1551333 (= res!1062384 (= (getValueByKey!730 (toList!11171 lt!668610) (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!805 (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551334 () Bool)

(declare-fun contains!10114 (List!36181 tuple2!24702) Bool)

(assert (=> b!1551334 (= e!863582 (contains!10114 (toList!11171 lt!668610) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160971 res!1062385) b!1551333))

(assert (= (and b!1551333 res!1062384) b!1551334))

(declare-fun m!1430007 () Bool)

(assert (=> d!160971 m!1430007))

(declare-fun m!1430009 () Bool)

(assert (=> d!160971 m!1430009))

(declare-fun m!1430011 () Bool)

(assert (=> d!160971 m!1430011))

(declare-fun m!1430013 () Bool)

(assert (=> d!160971 m!1430013))

(declare-fun m!1430015 () Bool)

(assert (=> b!1551333 m!1430015))

(declare-fun m!1430017 () Bool)

(assert (=> b!1551334 m!1430017))

(assert (=> b!1551226 d!160971))

(declare-fun d!160973 () Bool)

(declare-fun e!863583 () Bool)

(assert (=> d!160973 e!863583))

(declare-fun res!1062387 () Bool)

(assert (=> d!160973 (=> (not res!1062387) (not e!863583))))

(declare-fun lt!668614 () ListLongMap!22311)

(assert (=> d!160973 (= res!1062387 (contains!10112 lt!668614 (_1!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668616 () List!36181)

(assert (=> d!160973 (= lt!668614 (ListLongMap!22312 lt!668616))))

(declare-fun lt!668615 () Unit!51664)

(declare-fun lt!668617 () Unit!51664)

(assert (=> d!160973 (= lt!668615 lt!668617)))

(assert (=> d!160973 (= (getValueByKey!730 lt!668616 (_1!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!805 (_2!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160973 (= lt!668617 (lemmaContainsTupThenGetReturnValue!372 lt!668616 (_1!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160973 (= lt!668616 (insertStrictlySorted!501 (toList!11171 (ite c!142728 call!70956 (ite c!142727 call!70953 call!70952))) (_1!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160973 (= (+!4992 (ite c!142728 call!70956 (ite c!142727 call!70953 call!70952)) (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668614)))

(declare-fun b!1551335 () Bool)

(declare-fun res!1062386 () Bool)

(assert (=> b!1551335 (=> (not res!1062386) (not e!863583))))

(assert (=> b!1551335 (= res!1062386 (= (getValueByKey!730 (toList!11171 lt!668614) (_1!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!805 (_2!12362 (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1551336 () Bool)

(assert (=> b!1551336 (= e!863583 (contains!10114 (toList!11171 lt!668614) (ite (or c!142728 c!142727) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160973 res!1062387) b!1551335))

(assert (= (and b!1551335 res!1062386) b!1551336))

(declare-fun m!1430019 () Bool)

(assert (=> d!160973 m!1430019))

(declare-fun m!1430021 () Bool)

(assert (=> d!160973 m!1430021))

(declare-fun m!1430023 () Bool)

(assert (=> d!160973 m!1430023))

(declare-fun m!1430025 () Bool)

(assert (=> d!160973 m!1430025))

(declare-fun m!1430027 () Bool)

(assert (=> b!1551335 m!1430027))

(declare-fun m!1430029 () Bool)

(assert (=> b!1551336 m!1430029))

(assert (=> bm!70952 d!160973))

(declare-fun b!1551347 () Bool)

(declare-fun e!863594 () Bool)

(declare-fun call!70980 () Bool)

(assert (=> b!1551347 (= e!863594 call!70980)))

(declare-fun b!1551348 () Bool)

(declare-fun e!863592 () Bool)

(declare-fun contains!10115 (List!36180 (_ BitVec 64)) Bool)

(assert (=> b!1551348 (= e!863592 (contains!10115 Nil!36177 (select (arr!49969 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1551349 () Bool)

(assert (=> b!1551349 (= e!863594 call!70980)))

(declare-fun bm!70977 () Bool)

(declare-fun c!142755 () Bool)

(assert (=> bm!70977 (= call!70980 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142755 (Cons!36176 (select (arr!49969 _keys!618) #b00000000000000000000000000000000) Nil!36177) Nil!36177)))))

(declare-fun b!1551350 () Bool)

(declare-fun e!863593 () Bool)

(assert (=> b!1551350 (= e!863593 e!863594)))

(assert (=> b!1551350 (= c!142755 (validKeyInArray!0 (select (arr!49969 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160975 () Bool)

(declare-fun res!1062394 () Bool)

(declare-fun e!863595 () Bool)

(assert (=> d!160975 (=> res!1062394 e!863595)))

(assert (=> d!160975 (= res!1062394 (bvsge #b00000000000000000000000000000000 (size!50519 _keys!618)))))

(assert (=> d!160975 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36177) e!863595)))

(declare-fun b!1551351 () Bool)

(assert (=> b!1551351 (= e!863595 e!863593)))

(declare-fun res!1062396 () Bool)

(assert (=> b!1551351 (=> (not res!1062396) (not e!863593))))

(assert (=> b!1551351 (= res!1062396 (not e!863592))))

(declare-fun res!1062395 () Bool)

(assert (=> b!1551351 (=> (not res!1062395) (not e!863592))))

(assert (=> b!1551351 (= res!1062395 (validKeyInArray!0 (select (arr!49969 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160975 (not res!1062394)) b!1551351))

(assert (= (and b!1551351 res!1062395) b!1551348))

(assert (= (and b!1551351 res!1062396) b!1551350))

(assert (= (and b!1551350 c!142755) b!1551347))

(assert (= (and b!1551350 (not c!142755)) b!1551349))

(assert (= (or b!1551347 b!1551349) bm!70977))

(assert (=> b!1551348 m!1429997))

(assert (=> b!1551348 m!1429997))

(declare-fun m!1430031 () Bool)

(assert (=> b!1551348 m!1430031))

(assert (=> bm!70977 m!1429997))

(declare-fun m!1430033 () Bool)

(assert (=> bm!70977 m!1430033))

(assert (=> b!1551350 m!1429997))

(assert (=> b!1551350 m!1429997))

(assert (=> b!1551350 m!1429999))

(assert (=> b!1551351 m!1429997))

(assert (=> b!1551351 m!1429997))

(assert (=> b!1551351 m!1429999))

(assert (=> b!1551211 d!160975))

(declare-fun d!160977 () Bool)

(declare-fun get!26019 (Option!806) V!59335)

(assert (=> d!160977 (= (apply!1096 lt!668553 (select (arr!49969 _keys!618) from!762)) (get!26019 (getValueByKey!730 (toList!11171 lt!668553) (select (arr!49969 _keys!618) from!762))))))

(declare-fun bs!44573 () Bool)

(assert (= bs!44573 d!160977))

(assert (=> bs!44573 m!1429893))

(declare-fun m!1430035 () Bool)

(assert (=> bs!44573 m!1430035))

(assert (=> bs!44573 m!1430035))

(declare-fun m!1430037 () Bool)

(assert (=> bs!44573 m!1430037))

(assert (=> b!1551219 d!160977))

(assert (=> b!1551219 d!160967))

(declare-fun d!160979 () Bool)

(assert (=> d!160979 (contains!10112 (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49969 _keys!618) from!762))))

(declare-fun lt!668620 () Unit!51664)

(declare-fun choose!2031 (ListLongMap!22311 (_ BitVec 64) V!59335 (_ BitVec 64)) Unit!51664)

(assert (=> d!160979 (= lt!668620 (choose!2031 lt!668553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49969 _keys!618) from!762)))))

(assert (=> d!160979 (contains!10112 lt!668553 (select (arr!49969 _keys!618) from!762))))

(assert (=> d!160979 (= (addStillContains!1292 lt!668553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49969 _keys!618) from!762)) lt!668620)))

(declare-fun bs!44574 () Bool)

(assert (= bs!44574 d!160979))

(assert (=> bs!44574 m!1429923))

(assert (=> bs!44574 m!1429923))

(assert (=> bs!44574 m!1429893))

(assert (=> bs!44574 m!1429925))

(assert (=> bs!44574 m!1429893))

(declare-fun m!1430039 () Bool)

(assert (=> bs!44574 m!1430039))

(assert (=> bs!44574 m!1429893))

(assert (=> bs!44574 m!1429917))

(assert (=> b!1551219 d!160979))

(declare-fun d!160981 () Bool)

(declare-fun e!863596 () Bool)

(assert (=> d!160981 e!863596))

(declare-fun res!1062398 () Bool)

(assert (=> d!160981 (=> (not res!1062398) (not e!863596))))

(declare-fun lt!668621 () ListLongMap!22311)

(assert (=> d!160981 (= res!1062398 (contains!10112 lt!668621 (_1!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!668623 () List!36181)

(assert (=> d!160981 (= lt!668621 (ListLongMap!22312 lt!668623))))

(declare-fun lt!668622 () Unit!51664)

(declare-fun lt!668624 () Unit!51664)

(assert (=> d!160981 (= lt!668622 lt!668624)))

(assert (=> d!160981 (= (getValueByKey!730 lt!668623 (_1!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!805 (_2!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160981 (= lt!668624 (lemmaContainsTupThenGetReturnValue!372 lt!668623 (_1!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160981 (= lt!668623 (insertStrictlySorted!501 (toList!11171 lt!668553) (_1!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160981 (= (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!668621)))

(declare-fun b!1551353 () Bool)

(declare-fun res!1062397 () Bool)

(assert (=> b!1551353 (=> (not res!1062397) (not e!863596))))

(assert (=> b!1551353 (= res!1062397 (= (getValueByKey!730 (toList!11171 lt!668621) (_1!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!805 (_2!12362 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1551354 () Bool)

(assert (=> b!1551354 (= e!863596 (contains!10114 (toList!11171 lt!668621) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!160981 res!1062398) b!1551353))

(assert (= (and b!1551353 res!1062397) b!1551354))

(declare-fun m!1430041 () Bool)

(assert (=> d!160981 m!1430041))

(declare-fun m!1430043 () Bool)

(assert (=> d!160981 m!1430043))

(declare-fun m!1430045 () Bool)

(assert (=> d!160981 m!1430045))

(declare-fun m!1430047 () Bool)

(assert (=> d!160981 m!1430047))

(declare-fun m!1430049 () Bool)

(assert (=> b!1551353 m!1430049))

(declare-fun m!1430051 () Bool)

(assert (=> b!1551354 m!1430051))

(assert (=> b!1551219 d!160981))

(declare-fun d!160983 () Bool)

(declare-fun e!863602 () Bool)

(assert (=> d!160983 e!863602))

(declare-fun res!1062401 () Bool)

(assert (=> d!160983 (=> res!1062401 e!863602)))

(declare-fun lt!668635 () Bool)

(assert (=> d!160983 (= res!1062401 (not lt!668635))))

(declare-fun lt!668636 () Bool)

(assert (=> d!160983 (= lt!668635 lt!668636)))

(declare-fun lt!668634 () Unit!51664)

(declare-fun e!863601 () Unit!51664)

(assert (=> d!160983 (= lt!668634 e!863601)))

(declare-fun c!142758 () Bool)

(assert (=> d!160983 (= c!142758 lt!668636)))

(declare-fun containsKey!752 (List!36181 (_ BitVec 64)) Bool)

(assert (=> d!160983 (= lt!668636 (containsKey!752 (toList!11171 lt!668553) (select (arr!49969 _keys!618) from!762)))))

(assert (=> d!160983 (= (contains!10112 lt!668553 (select (arr!49969 _keys!618) from!762)) lt!668635)))

(declare-fun b!1551361 () Bool)

(declare-fun lt!668633 () Unit!51664)

(assert (=> b!1551361 (= e!863601 lt!668633)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!498 (List!36181 (_ BitVec 64)) Unit!51664)

(assert (=> b!1551361 (= lt!668633 (lemmaContainsKeyImpliesGetValueByKeyDefined!498 (toList!11171 lt!668553) (select (arr!49969 _keys!618) from!762)))))

(declare-fun isDefined!546 (Option!806) Bool)

(assert (=> b!1551361 (isDefined!546 (getValueByKey!730 (toList!11171 lt!668553) (select (arr!49969 _keys!618) from!762)))))

(declare-fun b!1551362 () Bool)

(declare-fun Unit!51668 () Unit!51664)

(assert (=> b!1551362 (= e!863601 Unit!51668)))

(declare-fun b!1551363 () Bool)

(assert (=> b!1551363 (= e!863602 (isDefined!546 (getValueByKey!730 (toList!11171 lt!668553) (select (arr!49969 _keys!618) from!762))))))

(assert (= (and d!160983 c!142758) b!1551361))

(assert (= (and d!160983 (not c!142758)) b!1551362))

(assert (= (and d!160983 (not res!1062401)) b!1551363))

(assert (=> d!160983 m!1429893))

(declare-fun m!1430053 () Bool)

(assert (=> d!160983 m!1430053))

(assert (=> b!1551361 m!1429893))

(declare-fun m!1430055 () Bool)

(assert (=> b!1551361 m!1430055))

(assert (=> b!1551361 m!1429893))

(assert (=> b!1551361 m!1430035))

(assert (=> b!1551361 m!1430035))

(declare-fun m!1430057 () Bool)

(assert (=> b!1551361 m!1430057))

(assert (=> b!1551363 m!1429893))

(assert (=> b!1551363 m!1430035))

(assert (=> b!1551363 m!1430035))

(assert (=> b!1551363 m!1430057))

(assert (=> b!1551219 d!160983))

(declare-fun d!160985 () Bool)

(declare-fun e!863603 () Bool)

(assert (=> d!160985 e!863603))

(declare-fun res!1062403 () Bool)

(assert (=> d!160985 (=> (not res!1062403) (not e!863603))))

(declare-fun lt!668637 () ListLongMap!22311)

(assert (=> d!160985 (= res!1062403 (contains!10112 lt!668637 (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668639 () List!36181)

(assert (=> d!160985 (= lt!668637 (ListLongMap!22312 lt!668639))))

(declare-fun lt!668638 () Unit!51664)

(declare-fun lt!668640 () Unit!51664)

(assert (=> d!160985 (= lt!668638 lt!668640)))

(assert (=> d!160985 (= (getValueByKey!730 lt!668639 (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!805 (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160985 (= lt!668640 (lemmaContainsTupThenGetReturnValue!372 lt!668639 (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160985 (= lt!668639 (insertStrictlySorted!501 (toList!11171 lt!668553) (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160985 (= (+!4992 lt!668553 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668637)))

(declare-fun b!1551364 () Bool)

(declare-fun res!1062402 () Bool)

(assert (=> b!1551364 (=> (not res!1062402) (not e!863603))))

(assert (=> b!1551364 (= res!1062402 (= (getValueByKey!730 (toList!11171 lt!668637) (_1!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!805 (_2!12362 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551365 () Bool)

(assert (=> b!1551365 (= e!863603 (contains!10114 (toList!11171 lt!668637) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160985 res!1062403) b!1551364))

(assert (= (and b!1551364 res!1062402) b!1551365))

(declare-fun m!1430059 () Bool)

(assert (=> d!160985 m!1430059))

(declare-fun m!1430061 () Bool)

(assert (=> d!160985 m!1430061))

(declare-fun m!1430063 () Bool)

(assert (=> d!160985 m!1430063))

(declare-fun m!1430065 () Bool)

(assert (=> d!160985 m!1430065))

(declare-fun m!1430067 () Bool)

(assert (=> b!1551364 m!1430067))

(declare-fun m!1430069 () Bool)

(assert (=> b!1551365 m!1430069))

(assert (=> b!1551219 d!160985))

(declare-fun d!160987 () Bool)

(declare-fun e!863605 () Bool)

(assert (=> d!160987 e!863605))

(declare-fun res!1062404 () Bool)

(assert (=> d!160987 (=> res!1062404 e!863605)))

(declare-fun lt!668643 () Bool)

(assert (=> d!160987 (= res!1062404 (not lt!668643))))

(declare-fun lt!668644 () Bool)

(assert (=> d!160987 (= lt!668643 lt!668644)))

(declare-fun lt!668642 () Unit!51664)

(declare-fun e!863604 () Unit!51664)

(assert (=> d!160987 (= lt!668642 e!863604)))

(declare-fun c!142759 () Bool)

(assert (=> d!160987 (= c!142759 lt!668644)))

(assert (=> d!160987 (= lt!668644 (containsKey!752 (toList!11171 (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49969 _keys!618) from!762)))))

(assert (=> d!160987 (= (contains!10112 (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49969 _keys!618) from!762)) lt!668643)))

(declare-fun b!1551366 () Bool)

(declare-fun lt!668641 () Unit!51664)

(assert (=> b!1551366 (= e!863604 lt!668641)))

(assert (=> b!1551366 (= lt!668641 (lemmaContainsKeyImpliesGetValueByKeyDefined!498 (toList!11171 (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49969 _keys!618) from!762)))))

(assert (=> b!1551366 (isDefined!546 (getValueByKey!730 (toList!11171 (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49969 _keys!618) from!762)))))

(declare-fun b!1551367 () Bool)

(declare-fun Unit!51669 () Unit!51664)

(assert (=> b!1551367 (= e!863604 Unit!51669)))

(declare-fun b!1551368 () Bool)

(assert (=> b!1551368 (= e!863605 (isDefined!546 (getValueByKey!730 (toList!11171 (+!4992 lt!668553 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49969 _keys!618) from!762))))))

(assert (= (and d!160987 c!142759) b!1551366))

(assert (= (and d!160987 (not c!142759)) b!1551367))

(assert (= (and d!160987 (not res!1062404)) b!1551368))

(assert (=> d!160987 m!1429893))

(declare-fun m!1430071 () Bool)

(assert (=> d!160987 m!1430071))

(assert (=> b!1551366 m!1429893))

(declare-fun m!1430073 () Bool)

(assert (=> b!1551366 m!1430073))

(assert (=> b!1551366 m!1429893))

(declare-fun m!1430075 () Bool)

(assert (=> b!1551366 m!1430075))

(assert (=> b!1551366 m!1430075))

(declare-fun m!1430077 () Bool)

(assert (=> b!1551366 m!1430077))

(assert (=> b!1551368 m!1429893))

(assert (=> b!1551368 m!1430075))

(assert (=> b!1551368 m!1430075))

(assert (=> b!1551368 m!1430077))

(assert (=> b!1551219 d!160987))

(declare-fun d!160989 () Bool)

(assert (=> d!160989 (= (apply!1096 (+!4992 lt!668553 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49969 _keys!618) from!762)) (apply!1096 lt!668553 (select (arr!49969 _keys!618) from!762)))))

(declare-fun lt!668647 () Unit!51664)

(declare-fun choose!2032 (ListLongMap!22311 (_ BitVec 64) V!59335 (_ BitVec 64)) Unit!51664)

(assert (=> d!160989 (= lt!668647 (choose!2032 lt!668553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49969 _keys!618) from!762)))))

(declare-fun e!863608 () Bool)

(assert (=> d!160989 e!863608))

(declare-fun res!1062407 () Bool)

(assert (=> d!160989 (=> (not res!1062407) (not e!863608))))

(assert (=> d!160989 (= res!1062407 (contains!10112 lt!668553 (select (arr!49969 _keys!618) from!762)))))

(assert (=> d!160989 (= (addApplyDifferent!634 lt!668553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49969 _keys!618) from!762)) lt!668647)))

(declare-fun b!1551372 () Bool)

(assert (=> b!1551372 (= e!863608 (not (= (select (arr!49969 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160989 res!1062407) b!1551372))

(assert (=> d!160989 m!1429919))

(assert (=> d!160989 m!1429893))

(assert (=> d!160989 m!1429921))

(assert (=> d!160989 m!1429893))

(assert (=> d!160989 m!1429915))

(assert (=> d!160989 m!1429919))

(assert (=> d!160989 m!1429893))

(assert (=> d!160989 m!1429917))

(assert (=> d!160989 m!1429893))

(declare-fun m!1430079 () Bool)

(assert (=> d!160989 m!1430079))

(assert (=> b!1551219 d!160989))

(declare-fun d!160991 () Bool)

(assert (=> d!160991 (= (apply!1096 (+!4992 lt!668553 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49969 _keys!618) from!762)) (get!26019 (getValueByKey!730 (toList!11171 (+!4992 lt!668553 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49969 _keys!618) from!762))))))

(declare-fun bs!44575 () Bool)

(assert (= bs!44575 d!160991))

(assert (=> bs!44575 m!1429893))

(declare-fun m!1430081 () Bool)

(assert (=> bs!44575 m!1430081))

(assert (=> bs!44575 m!1430081))

(declare-fun m!1430083 () Bool)

(assert (=> bs!44575 m!1430083))

(assert (=> b!1551219 d!160991))

(declare-fun b!1551380 () Bool)

(declare-fun e!863614 () Bool)

(assert (=> b!1551380 (= e!863614 tp_is_empty!38169)))

(declare-fun condMapEmpty!58969 () Bool)

(declare-fun mapDefault!58969 () ValueCell!18174)

(assert (=> mapNonEmpty!58963 (= condMapEmpty!58969 (= mapRest!58963 ((as const (Array (_ BitVec 32) ValueCell!18174)) mapDefault!58969)))))

(declare-fun mapRes!58969 () Bool)

(assert (=> mapNonEmpty!58963 (= tp!111936 (and e!863614 mapRes!58969))))

(declare-fun mapIsEmpty!58969 () Bool)

(assert (=> mapIsEmpty!58969 mapRes!58969))

(declare-fun b!1551379 () Bool)

(declare-fun e!863613 () Bool)

(assert (=> b!1551379 (= e!863613 tp_is_empty!38169)))

(declare-fun mapNonEmpty!58969 () Bool)

(declare-fun tp!111946 () Bool)

(assert (=> mapNonEmpty!58969 (= mapRes!58969 (and tp!111946 e!863613))))

(declare-fun mapValue!58969 () ValueCell!18174)

(declare-fun mapRest!58969 () (Array (_ BitVec 32) ValueCell!18174))

(declare-fun mapKey!58969 () (_ BitVec 32))

(assert (=> mapNonEmpty!58969 (= mapRest!58963 (store mapRest!58969 mapKey!58969 mapValue!58969))))

(assert (= (and mapNonEmpty!58963 condMapEmpty!58969) mapIsEmpty!58969))

(assert (= (and mapNonEmpty!58963 (not condMapEmpty!58969)) mapNonEmpty!58969))

(assert (= (and mapNonEmpty!58969 ((_ is ValueCellFull!18174) mapValue!58969)) b!1551379))

(assert (= (and mapNonEmpty!58963 ((_ is ValueCellFull!18174) mapDefault!58969)) b!1551380))

(declare-fun m!1430085 () Bool)

(assert (=> mapNonEmpty!58969 m!1430085))

(declare-fun b_lambda!24775 () Bool)

(assert (= b_lambda!24771 (or (and start!132218 b_free!31893) b_lambda!24775)))

(declare-fun b_lambda!24777 () Bool)

(assert (= b_lambda!24773 (or (and start!132218 b_free!31893) b_lambda!24777)))

(check-sat (not b!1551350) (not b!1551310) (not b!1551327) (not b!1551353) (not b!1551304) (not b!1551354) tp_is_empty!38169 (not b_lambda!24775) (not d!160977) (not b!1551348) (not d!160981) (not b!1551361) (not b!1551326) (not b_next!31893) (not b!1551306) (not b!1551351) (not b!1551364) b_and!51329 (not d!160979) (not d!160971) (not mapNonEmpty!58969) (not b!1551309) (not d!160987) (not b!1551311) (not d!160985) (not d!160991) (not b!1551365) (not b!1551308) (not b!1551336) (not bm!70974) (not bm!70977) (not b!1551335) (not b!1551333) (not d!160989) (not b!1551363) (not b_lambda!24777) (not b!1551366) (not d!160973) (not d!160967) (not bm!70971) (not b!1551368) (not d!160983) (not b!1551313) (not b!1551312) (not b!1551334))
(check-sat b_and!51329 (not b_next!31893))
