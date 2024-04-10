; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132108 () Bool)

(assert start!132108)

(declare-fun b_free!31821 () Bool)

(declare-fun b_next!31821 () Bool)

(assert (=> start!132108 (= b_free!31821 (not b_next!31821))))

(declare-fun tp!111715 () Bool)

(declare-fun b_and!51231 () Bool)

(assert (=> start!132108 (= tp!111715 b_and!51231)))

(declare-datatypes ((array!103392 0))(
  ( (array!103393 (arr!49898 (Array (_ BitVec 32) (_ BitVec 64))) (size!50448 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103392)

(declare-datatypes ((V!59239 0))(
  ( (V!59240 (val!19126 Int)) )
))
(declare-fun zeroValue!436 () V!59239)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70382 () Bool)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18138 0))(
  ( (ValueCellFull!18138 (v!21927 V!59239)) (EmptyCell!18138) )
))
(declare-datatypes ((array!103394 0))(
  ( (array!103395 (arr!49899 (Array (_ BitVec 32) ValueCell!18138)) (size!50449 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103394)

(declare-fun minValue!436 () V!59239)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((tuple2!24630 0))(
  ( (tuple2!24631 (_1!12326 (_ BitVec 64)) (_2!12326 V!59239)) )
))
(declare-datatypes ((List!36117 0))(
  ( (Nil!36114) (Cons!36113 (h!37558 tuple2!24630) (t!50811 List!36117)) )
))
(declare-datatypes ((ListLongMap!22239 0))(
  ( (ListLongMap!22240 (toList!11135 List!36117)) )
))
(declare-fun call!70385 () ListLongMap!22239)

(declare-fun getCurrentListMapNoExtraKeys!6588 (array!103392 array!103394 (_ BitVec 32) (_ BitVec 32) V!59239 V!59239 (_ BitVec 32) Int) ListLongMap!22239)

(assert (=> bm!70382 (= call!70385 (getCurrentListMapNoExtraKeys!6588 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58849 () Bool)

(declare-fun mapRes!58849 () Bool)

(declare-fun tp!111714 () Bool)

(declare-fun e!862306 () Bool)

(assert (=> mapNonEmpty!58849 (= mapRes!58849 (and tp!111714 e!862306))))

(declare-fun mapValue!58849 () ValueCell!18138)

(declare-fun mapRest!58849 () (Array (_ BitVec 32) ValueCell!18138))

(declare-fun mapKey!58849 () (_ BitVec 32))

(assert (=> mapNonEmpty!58849 (= (arr!49899 _values!470) (store mapRest!58849 mapKey!58849 mapValue!58849))))

(declare-fun bm!70383 () Bool)

(declare-fun call!70386 () ListLongMap!22239)

(declare-fun call!70389 () ListLongMap!22239)

(assert (=> bm!70383 (= call!70386 call!70389)))

(declare-fun b!1549145 () Bool)

(declare-fun res!1061432 () Bool)

(declare-fun e!862307 () Bool)

(assert (=> b!1549145 (=> (not res!1061432) (not e!862307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549145 (= res!1061432 (validKeyInArray!0 (select (arr!49898 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58849 () Bool)

(assert (=> mapIsEmpty!58849 mapRes!58849))

(declare-fun b!1549146 () Bool)

(declare-fun e!862308 () ListLongMap!22239)

(assert (=> b!1549146 (= e!862308 call!70386)))

(declare-fun res!1061430 () Bool)

(declare-fun e!862311 () Bool)

(assert (=> start!132108 (=> (not res!1061430) (not e!862311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132108 (= res!1061430 (validMask!0 mask!926))))

(assert (=> start!132108 e!862311))

(declare-fun array_inv!38793 (array!103392) Bool)

(assert (=> start!132108 (array_inv!38793 _keys!618)))

(declare-fun tp_is_empty!38097 () Bool)

(assert (=> start!132108 tp_is_empty!38097))

(assert (=> start!132108 true))

(assert (=> start!132108 tp!111715))

(declare-fun e!862314 () Bool)

(declare-fun array_inv!38794 (array!103394) Bool)

(assert (=> start!132108 (and (array_inv!38794 _values!470) e!862314)))

(declare-fun b!1549147 () Bool)

(declare-fun res!1061429 () Bool)

(assert (=> b!1549147 (=> (not res!1061429) (not e!862311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103392 (_ BitVec 32)) Bool)

(assert (=> b!1549147 (= res!1061429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70384 () Bool)

(declare-fun call!70387 () ListLongMap!22239)

(declare-fun call!70388 () ListLongMap!22239)

(assert (=> bm!70384 (= call!70387 call!70388)))

(declare-fun b!1549148 () Bool)

(declare-fun e!862312 () ListLongMap!22239)

(declare-fun +!4963 (ListLongMap!22239 tuple2!24630) ListLongMap!22239)

(assert (=> b!1549148 (= e!862312 (+!4963 call!70389 (tuple2!24631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549149 () Bool)

(assert (=> b!1549149 (= e!862307 (not true))))

(declare-fun lt!667692 () ListLongMap!22239)

(declare-fun lt!667693 () V!59239)

(declare-fun apply!1079 (ListLongMap!22239 (_ BitVec 64)) V!59239)

(assert (=> b!1549149 (= (apply!1079 lt!667692 (select (arr!49898 _keys!618) from!762)) lt!667693)))

(declare-datatypes ((Unit!51608 0))(
  ( (Unit!51609) )
))
(declare-fun lt!667695 () Unit!51608)

(declare-fun lt!667689 () ListLongMap!22239)

(declare-fun addApplyDifferent!621 (ListLongMap!22239 (_ BitVec 64) V!59239 (_ BitVec 64)) Unit!51608)

(assert (=> b!1549149 (= lt!667695 (addApplyDifferent!621 lt!667689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49898 _keys!618) from!762)))))

(declare-fun lt!667697 () V!59239)

(assert (=> b!1549149 (= lt!667697 lt!667693)))

(assert (=> b!1549149 (= lt!667693 (apply!1079 lt!667689 (select (arr!49898 _keys!618) from!762)))))

(assert (=> b!1549149 (= lt!667697 (apply!1079 (+!4963 lt!667689 (tuple2!24631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49898 _keys!618) from!762)))))

(declare-fun lt!667694 () Unit!51608)

(assert (=> b!1549149 (= lt!667694 (addApplyDifferent!621 lt!667689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49898 _keys!618) from!762)))))

(declare-fun contains!10086 (ListLongMap!22239 (_ BitVec 64)) Bool)

(assert (=> b!1549149 (contains!10086 lt!667692 (select (arr!49898 _keys!618) from!762))))

(assert (=> b!1549149 (= lt!667692 (+!4963 lt!667689 (tuple2!24631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667696 () Unit!51608)

(declare-fun addStillContains!1274 (ListLongMap!22239 (_ BitVec 64) V!59239 (_ BitVec 64)) Unit!51608)

(assert (=> b!1549149 (= lt!667696 (addStillContains!1274 lt!667689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49898 _keys!618) from!762)))))

(assert (=> b!1549149 (= lt!667689 (getCurrentListMapNoExtraKeys!6588 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549150 () Bool)

(declare-fun res!1061433 () Bool)

(assert (=> b!1549150 (=> (not res!1061433) (not e!862311))))

(assert (=> b!1549150 (= res!1061433 (and (= (size!50449 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50448 _keys!618) (size!50449 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549151 () Bool)

(assert (=> b!1549151 (= e!862306 tp_is_empty!38097)))

(declare-fun b!1549152 () Bool)

(declare-fun res!1061427 () Bool)

(assert (=> b!1549152 (=> (not res!1061427) (not e!862311))))

(assert (=> b!1549152 (= res!1061427 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50448 _keys!618))))))

(declare-fun b!1549153 () Bool)

(declare-fun res!1061431 () Bool)

(assert (=> b!1549153 (=> (not res!1061431) (not e!862311))))

(declare-datatypes ((List!36118 0))(
  ( (Nil!36115) (Cons!36114 (h!37559 (_ BitVec 64)) (t!50812 List!36118)) )
))
(declare-fun arrayNoDuplicates!0 (array!103392 (_ BitVec 32) List!36118) Bool)

(assert (=> b!1549153 (= res!1061431 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36115))))

(declare-fun b!1549154 () Bool)

(assert (=> b!1549154 (= e!862308 call!70387)))

(declare-fun b!1549155 () Bool)

(declare-fun e!862309 () ListLongMap!22239)

(assert (=> b!1549155 (= e!862309 call!70386)))

(declare-fun b!1549156 () Bool)

(declare-fun e!862313 () Bool)

(assert (=> b!1549156 (= e!862314 (and e!862313 mapRes!58849))))

(declare-fun condMapEmpty!58849 () Bool)

(declare-fun mapDefault!58849 () ValueCell!18138)

(assert (=> b!1549156 (= condMapEmpty!58849 (= (arr!49899 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18138)) mapDefault!58849)))))

(declare-fun b!1549157 () Bool)

(assert (=> b!1549157 (= e!862313 tp_is_empty!38097)))

(declare-fun bm!70385 () Bool)

(declare-fun c!142323 () Bool)

(declare-fun c!142324 () Bool)

(assert (=> bm!70385 (= call!70389 (+!4963 (ite c!142323 call!70385 (ite c!142324 call!70388 call!70387)) (ite (or c!142323 c!142324) (tuple2!24631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549158 () Bool)

(assert (=> b!1549158 (= e!862312 e!862309)))

(declare-fun lt!667691 () Bool)

(assert (=> b!1549158 (= c!142324 (and (not lt!667691) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549159 () Bool)

(declare-fun c!142325 () Bool)

(assert (=> b!1549159 (= c!142325 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667691))))

(assert (=> b!1549159 (= e!862309 e!862308)))

(declare-fun b!1549160 () Bool)

(assert (=> b!1549160 (= e!862311 e!862307)))

(declare-fun res!1061428 () Bool)

(assert (=> b!1549160 (=> (not res!1061428) (not e!862307))))

(assert (=> b!1549160 (= res!1061428 (bvslt from!762 (size!50448 _keys!618)))))

(declare-fun lt!667690 () ListLongMap!22239)

(assert (=> b!1549160 (= lt!667690 e!862312)))

(assert (=> b!1549160 (= c!142323 (and (not lt!667691) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549160 (= lt!667691 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70386 () Bool)

(assert (=> bm!70386 (= call!70388 call!70385)))

(assert (= (and start!132108 res!1061430) b!1549150))

(assert (= (and b!1549150 res!1061433) b!1549147))

(assert (= (and b!1549147 res!1061429) b!1549153))

(assert (= (and b!1549153 res!1061431) b!1549152))

(assert (= (and b!1549152 res!1061427) b!1549160))

(assert (= (and b!1549160 c!142323) b!1549148))

(assert (= (and b!1549160 (not c!142323)) b!1549158))

(assert (= (and b!1549158 c!142324) b!1549155))

(assert (= (and b!1549158 (not c!142324)) b!1549159))

(assert (= (and b!1549159 c!142325) b!1549146))

(assert (= (and b!1549159 (not c!142325)) b!1549154))

(assert (= (or b!1549146 b!1549154) bm!70384))

(assert (= (or b!1549155 bm!70384) bm!70386))

(assert (= (or b!1549155 b!1549146) bm!70383))

(assert (= (or b!1549148 bm!70386) bm!70382))

(assert (= (or b!1549148 bm!70383) bm!70385))

(assert (= (and b!1549160 res!1061428) b!1549145))

(assert (= (and b!1549145 res!1061432) b!1549149))

(assert (= (and b!1549156 condMapEmpty!58849) mapIsEmpty!58849))

(assert (= (and b!1549156 (not condMapEmpty!58849)) mapNonEmpty!58849))

(get-info :version)

(assert (= (and mapNonEmpty!58849 ((_ is ValueCellFull!18138) mapValue!58849)) b!1549151))

(assert (= (and b!1549156 ((_ is ValueCellFull!18138) mapDefault!58849)) b!1549157))

(assert (= start!132108 b!1549156))

(declare-fun m!1428431 () Bool)

(assert (=> b!1549145 m!1428431))

(assert (=> b!1549145 m!1428431))

(declare-fun m!1428433 () Bool)

(assert (=> b!1549145 m!1428433))

(assert (=> b!1549149 m!1428431))

(assert (=> b!1549149 m!1428431))

(declare-fun m!1428435 () Bool)

(assert (=> b!1549149 m!1428435))

(declare-fun m!1428437 () Bool)

(assert (=> b!1549149 m!1428437))

(declare-fun m!1428439 () Bool)

(assert (=> b!1549149 m!1428439))

(assert (=> b!1549149 m!1428431))

(declare-fun m!1428441 () Bool)

(assert (=> b!1549149 m!1428441))

(assert (=> b!1549149 m!1428431))

(declare-fun m!1428443 () Bool)

(assert (=> b!1549149 m!1428443))

(assert (=> b!1549149 m!1428437))

(assert (=> b!1549149 m!1428431))

(declare-fun m!1428445 () Bool)

(assert (=> b!1549149 m!1428445))

(declare-fun m!1428447 () Bool)

(assert (=> b!1549149 m!1428447))

(assert (=> b!1549149 m!1428431))

(declare-fun m!1428449 () Bool)

(assert (=> b!1549149 m!1428449))

(assert (=> b!1549149 m!1428431))

(declare-fun m!1428451 () Bool)

(assert (=> b!1549149 m!1428451))

(assert (=> b!1549149 m!1428431))

(declare-fun m!1428453 () Bool)

(assert (=> b!1549149 m!1428453))

(declare-fun m!1428455 () Bool)

(assert (=> bm!70385 m!1428455))

(declare-fun m!1428457 () Bool)

(assert (=> mapNonEmpty!58849 m!1428457))

(declare-fun m!1428459 () Bool)

(assert (=> b!1549148 m!1428459))

(declare-fun m!1428461 () Bool)

(assert (=> b!1549153 m!1428461))

(declare-fun m!1428463 () Bool)

(assert (=> start!132108 m!1428463))

(declare-fun m!1428465 () Bool)

(assert (=> start!132108 m!1428465))

(declare-fun m!1428467 () Bool)

(assert (=> start!132108 m!1428467))

(assert (=> bm!70382 m!1428439))

(declare-fun m!1428469 () Bool)

(assert (=> b!1549147 m!1428469))

(check-sat (not b!1549147) (not start!132108) (not b!1549145) (not bm!70382) (not b!1549148) (not b!1549153) (not bm!70385) (not b!1549149) b_and!51231 tp_is_empty!38097 (not b_next!31821) (not mapNonEmpty!58849))
(check-sat b_and!51231 (not b_next!31821))
