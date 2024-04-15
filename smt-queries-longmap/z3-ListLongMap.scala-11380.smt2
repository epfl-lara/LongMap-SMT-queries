; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132196 () Bool)

(assert start!132196)

(declare-fun b_free!31897 () Bool)

(declare-fun b_next!31897 () Bool)

(assert (=> start!132196 (= b_free!31897 (not b_next!31897))))

(declare-fun tp!111952 () Bool)

(declare-fun b_and!51313 () Bool)

(assert (=> start!132196 (= tp!111952 b_and!51313)))

(declare-fun bm!70953 () Bool)

(declare-datatypes ((V!59341 0))(
  ( (V!59342 (val!19164 Int)) )
))
(declare-datatypes ((tuple2!24778 0))(
  ( (tuple2!24779 (_1!12400 (_ BitVec 64)) (_2!12400 V!59341)) )
))
(declare-datatypes ((List!36228 0))(
  ( (Nil!36225) (Cons!36224 (h!37670 tuple2!24778) (t!50932 List!36228)) )
))
(declare-datatypes ((ListLongMap!22387 0))(
  ( (ListLongMap!22388 (toList!11209 List!36228)) )
))
(declare-fun call!70957 () ListLongMap!22387)

(declare-fun call!70960 () ListLongMap!22387)

(assert (=> bm!70953 (= call!70957 call!70960)))

(declare-fun b!1551100 () Bool)

(declare-fun c!142677 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668386 () Bool)

(assert (=> b!1551100 (= c!142677 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668386))))

(declare-fun e!863442 () ListLongMap!22387)

(declare-fun e!863439 () ListLongMap!22387)

(assert (=> b!1551100 (= e!863442 e!863439)))

(declare-fun b!1551101 () Bool)

(declare-fun e!863443 () Bool)

(declare-fun tp_is_empty!38173 () Bool)

(assert (=> b!1551101 (= e!863443 tp_is_empty!38173)))

(declare-fun b!1551102 () Bool)

(declare-fun res!1062297 () Bool)

(declare-fun e!863438 () Bool)

(assert (=> b!1551102 (=> (not res!1062297) (not e!863438))))

(declare-datatypes ((array!103470 0))(
  ( (array!103471 (arr!49935 (Array (_ BitVec 32) (_ BitVec 64))) (size!50487 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103470)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551102 (= res!1062297 (validKeyInArray!0 (select (arr!49935 _keys!618) from!762)))))

(declare-fun b!1551103 () Bool)

(assert (=> b!1551103 (= e!863442 call!70957)))

(declare-fun mapIsEmpty!58972 () Bool)

(declare-fun mapRes!58972 () Bool)

(assert (=> mapIsEmpty!58972 mapRes!58972))

(declare-fun b!1551104 () Bool)

(declare-fun res!1062293 () Bool)

(declare-fun e!863435 () Bool)

(assert (=> b!1551104 (=> (not res!1062293) (not e!863435))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18176 0))(
  ( (ValueCellFull!18176 (v!21964 V!59341)) (EmptyCell!18176) )
))
(declare-datatypes ((array!103472 0))(
  ( (array!103473 (arr!49936 (Array (_ BitVec 32) ValueCell!18176)) (size!50488 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103472)

(assert (=> b!1551104 (= res!1062293 (and (= (size!50488 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50487 _keys!618) (size!50488 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!59341)

(declare-fun call!70958 () ListLongMap!22387)

(declare-fun bm!70955 () Bool)

(declare-fun call!70959 () ListLongMap!22387)

(declare-fun c!142679 () Bool)

(declare-fun call!70956 () ListLongMap!22387)

(declare-fun c!142678 () Bool)

(declare-fun minValue!436 () V!59341)

(declare-fun +!5025 (ListLongMap!22387 tuple2!24778) ListLongMap!22387)

(assert (=> bm!70955 (= call!70960 (+!5025 (ite c!142679 call!70959 (ite c!142678 call!70958 call!70956)) (ite (or c!142679 c!142678) (tuple2!24779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70956 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6648 (array!103470 array!103472 (_ BitVec 32) (_ BitVec 32) V!59341 V!59341 (_ BitVec 32) Int) ListLongMap!22387)

(assert (=> bm!70956 (= call!70959 (getCurrentListMapNoExtraKeys!6648 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551105 () Bool)

(declare-fun res!1062295 () Bool)

(assert (=> b!1551105 (=> (not res!1062295) (not e!863435))))

(assert (=> b!1551105 (= res!1062295 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50487 _keys!618))))))

(declare-fun b!1551106 () Bool)

(assert (=> b!1551106 (= e!863439 call!70957)))

(declare-fun b!1551107 () Bool)

(declare-fun e!863436 () Bool)

(assert (=> b!1551107 (= e!863436 (and e!863443 mapRes!58972))))

(declare-fun condMapEmpty!58972 () Bool)

(declare-fun mapDefault!58972 () ValueCell!18176)

(assert (=> b!1551107 (= condMapEmpty!58972 (= (arr!49936 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18176)) mapDefault!58972)))))

(declare-fun b!1551108 () Bool)

(assert (=> b!1551108 (= e!863438 (not true))))

(declare-fun lt!668383 () ListLongMap!22387)

(declare-fun lt!668380 () V!59341)

(declare-fun apply!1086 (ListLongMap!22387 (_ BitVec 64)) V!59341)

(assert (=> b!1551108 (= (apply!1086 lt!668383 (select (arr!49935 _keys!618) from!762)) lt!668380)))

(declare-datatypes ((Unit!51488 0))(
  ( (Unit!51489) )
))
(declare-fun lt!668382 () Unit!51488)

(declare-fun lt!668388 () ListLongMap!22387)

(declare-fun addApplyDifferent!622 (ListLongMap!22387 (_ BitVec 64) V!59341 (_ BitVec 64)) Unit!51488)

(assert (=> b!1551108 (= lt!668382 (addApplyDifferent!622 lt!668388 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49935 _keys!618) from!762)))))

(declare-fun lt!668381 () V!59341)

(assert (=> b!1551108 (= lt!668381 lt!668380)))

(assert (=> b!1551108 (= lt!668380 (apply!1086 lt!668388 (select (arr!49935 _keys!618) from!762)))))

(assert (=> b!1551108 (= lt!668381 (apply!1086 (+!5025 lt!668388 (tuple2!24779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49935 _keys!618) from!762)))))

(declare-fun lt!668385 () Unit!51488)

(assert (=> b!1551108 (= lt!668385 (addApplyDifferent!622 lt!668388 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49935 _keys!618) from!762)))))

(declare-fun contains!10074 (ListLongMap!22387 (_ BitVec 64)) Bool)

(assert (=> b!1551108 (contains!10074 lt!668383 (select (arr!49935 _keys!618) from!762))))

(assert (=> b!1551108 (= lt!668383 (+!5025 lt!668388 (tuple2!24779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668387 () Unit!51488)

(declare-fun addStillContains!1287 (ListLongMap!22387 (_ BitVec 64) V!59341 (_ BitVec 64)) Unit!51488)

(assert (=> b!1551108 (= lt!668387 (addStillContains!1287 lt!668388 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49935 _keys!618) from!762)))))

(assert (=> b!1551108 (= lt!668388 (getCurrentListMapNoExtraKeys!6648 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70954 () Bool)

(assert (=> bm!70954 (= call!70956 call!70958)))

(declare-fun res!1062299 () Bool)

(assert (=> start!132196 (=> (not res!1062299) (not e!863435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132196 (= res!1062299 (validMask!0 mask!926))))

(assert (=> start!132196 e!863435))

(declare-fun array_inv!39021 (array!103470) Bool)

(assert (=> start!132196 (array_inv!39021 _keys!618)))

(assert (=> start!132196 tp_is_empty!38173))

(assert (=> start!132196 true))

(assert (=> start!132196 tp!111952))

(declare-fun array_inv!39022 (array!103472) Bool)

(assert (=> start!132196 (and (array_inv!39022 _values!470) e!863436)))

(declare-fun b!1551109 () Bool)

(declare-fun e!863440 () Bool)

(assert (=> b!1551109 (= e!863440 tp_is_empty!38173)))

(declare-fun b!1551110 () Bool)

(declare-fun res!1062294 () Bool)

(assert (=> b!1551110 (=> (not res!1062294) (not e!863435))))

(declare-datatypes ((List!36229 0))(
  ( (Nil!36226) (Cons!36225 (h!37671 (_ BitVec 64)) (t!50933 List!36229)) )
))
(declare-fun arrayNoDuplicates!0 (array!103470 (_ BitVec 32) List!36229) Bool)

(assert (=> b!1551110 (= res!1062294 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36226))))

(declare-fun b!1551111 () Bool)

(declare-fun e!863441 () ListLongMap!22387)

(assert (=> b!1551111 (= e!863441 (+!5025 call!70960 (tuple2!24779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551112 () Bool)

(assert (=> b!1551112 (= e!863441 e!863442)))

(assert (=> b!1551112 (= c!142678 (and (not lt!668386) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551113 () Bool)

(assert (=> b!1551113 (= e!863435 e!863438)))

(declare-fun res!1062296 () Bool)

(assert (=> b!1551113 (=> (not res!1062296) (not e!863438))))

(assert (=> b!1551113 (= res!1062296 (bvslt from!762 (size!50487 _keys!618)))))

(declare-fun lt!668384 () ListLongMap!22387)

(assert (=> b!1551113 (= lt!668384 e!863441)))

(assert (=> b!1551113 (= c!142679 (and (not lt!668386) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551113 (= lt!668386 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58972 () Bool)

(declare-fun tp!111953 () Bool)

(assert (=> mapNonEmpty!58972 (= mapRes!58972 (and tp!111953 e!863440))))

(declare-fun mapRest!58972 () (Array (_ BitVec 32) ValueCell!18176))

(declare-fun mapValue!58972 () ValueCell!18176)

(declare-fun mapKey!58972 () (_ BitVec 32))

(assert (=> mapNonEmpty!58972 (= (arr!49936 _values!470) (store mapRest!58972 mapKey!58972 mapValue!58972))))

(declare-fun b!1551114 () Bool)

(assert (=> b!1551114 (= e!863439 call!70956)))

(declare-fun bm!70957 () Bool)

(assert (=> bm!70957 (= call!70958 call!70959)))

(declare-fun b!1551115 () Bool)

(declare-fun res!1062298 () Bool)

(assert (=> b!1551115 (=> (not res!1062298) (not e!863435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103470 (_ BitVec 32)) Bool)

(assert (=> b!1551115 (= res!1062298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132196 res!1062299) b!1551104))

(assert (= (and b!1551104 res!1062293) b!1551115))

(assert (= (and b!1551115 res!1062298) b!1551110))

(assert (= (and b!1551110 res!1062294) b!1551105))

(assert (= (and b!1551105 res!1062295) b!1551113))

(assert (= (and b!1551113 c!142679) b!1551111))

(assert (= (and b!1551113 (not c!142679)) b!1551112))

(assert (= (and b!1551112 c!142678) b!1551103))

(assert (= (and b!1551112 (not c!142678)) b!1551100))

(assert (= (and b!1551100 c!142677) b!1551106))

(assert (= (and b!1551100 (not c!142677)) b!1551114))

(assert (= (or b!1551106 b!1551114) bm!70954))

(assert (= (or b!1551103 bm!70954) bm!70957))

(assert (= (or b!1551103 b!1551106) bm!70953))

(assert (= (or b!1551111 bm!70957) bm!70956))

(assert (= (or b!1551111 bm!70953) bm!70955))

(assert (= (and b!1551113 res!1062296) b!1551102))

(assert (= (and b!1551102 res!1062297) b!1551108))

(assert (= (and b!1551107 condMapEmpty!58972) mapIsEmpty!58972))

(assert (= (and b!1551107 (not condMapEmpty!58972)) mapNonEmpty!58972))

(get-info :version)

(assert (= (and mapNonEmpty!58972 ((_ is ValueCellFull!18176) mapValue!58972)) b!1551109))

(assert (= (and b!1551107 ((_ is ValueCellFull!18176) mapDefault!58972)) b!1551101))

(assert (= start!132196 b!1551107))

(declare-fun m!1429195 () Bool)

(assert (=> mapNonEmpty!58972 m!1429195))

(declare-fun m!1429197 () Bool)

(assert (=> start!132196 m!1429197))

(declare-fun m!1429199 () Bool)

(assert (=> start!132196 m!1429199))

(declare-fun m!1429201 () Bool)

(assert (=> start!132196 m!1429201))

(declare-fun m!1429203 () Bool)

(assert (=> b!1551108 m!1429203))

(declare-fun m!1429205 () Bool)

(assert (=> b!1551108 m!1429205))

(declare-fun m!1429207 () Bool)

(assert (=> b!1551108 m!1429207))

(declare-fun m!1429209 () Bool)

(assert (=> b!1551108 m!1429209))

(assert (=> b!1551108 m!1429203))

(declare-fun m!1429211 () Bool)

(assert (=> b!1551108 m!1429211))

(assert (=> b!1551108 m!1429209))

(assert (=> b!1551108 m!1429203))

(declare-fun m!1429213 () Bool)

(assert (=> b!1551108 m!1429213))

(assert (=> b!1551108 m!1429203))

(declare-fun m!1429215 () Bool)

(assert (=> b!1551108 m!1429215))

(assert (=> b!1551108 m!1429203))

(declare-fun m!1429217 () Bool)

(assert (=> b!1551108 m!1429217))

(assert (=> b!1551108 m!1429203))

(declare-fun m!1429219 () Bool)

(assert (=> b!1551108 m!1429219))

(declare-fun m!1429221 () Bool)

(assert (=> b!1551108 m!1429221))

(assert (=> b!1551108 m!1429203))

(assert (=> b!1551108 m!1429203))

(declare-fun m!1429223 () Bool)

(assert (=> b!1551108 m!1429223))

(declare-fun m!1429225 () Bool)

(assert (=> b!1551110 m!1429225))

(declare-fun m!1429227 () Bool)

(assert (=> bm!70955 m!1429227))

(declare-fun m!1429229 () Bool)

(assert (=> b!1551111 m!1429229))

(assert (=> b!1551102 m!1429203))

(assert (=> b!1551102 m!1429203))

(declare-fun m!1429231 () Bool)

(assert (=> b!1551102 m!1429231))

(declare-fun m!1429233 () Bool)

(assert (=> b!1551115 m!1429233))

(assert (=> bm!70956 m!1429207))

(check-sat (not bm!70955) tp_is_empty!38173 (not b!1551102) b_and!51313 (not b!1551111) (not b!1551110) (not b!1551108) (not mapNonEmpty!58972) (not start!132196) (not b!1551115) (not b_next!31897) (not bm!70956))
(check-sat b_and!51313 (not b_next!31897))
