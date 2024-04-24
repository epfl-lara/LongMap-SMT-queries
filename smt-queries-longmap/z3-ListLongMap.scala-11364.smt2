; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132500 () Bool)

(assert start!132500)

(declare-fun b_free!31801 () Bool)

(declare-fun b_next!31801 () Bool)

(assert (=> start!132500 (= b_free!31801 (not b_next!31801))))

(declare-fun tp!111654 () Bool)

(declare-fun b_and!51213 () Bool)

(assert (=> start!132500 (= tp!111654 b_and!51213)))

(declare-fun b!1551101 () Bool)

(declare-datatypes ((V!59213 0))(
  ( (V!59214 (val!19116 Int)) )
))
(declare-datatypes ((tuple2!24670 0))(
  ( (tuple2!24671 (_1!12346 (_ BitVec 64)) (_2!12346 V!59213)) )
))
(declare-datatypes ((List!36141 0))(
  ( (Nil!36138) (Cons!36137 (h!37600 tuple2!24670) (t!50827 List!36141)) )
))
(declare-datatypes ((ListLongMap!22287 0))(
  ( (ListLongMap!22288 (toList!11159 List!36141)) )
))
(declare-fun e!863546 () ListLongMap!22287)

(declare-fun call!70387 () ListLongMap!22287)

(assert (=> b!1551101 (= e!863546 call!70387)))

(declare-fun b!1551102 () Bool)

(declare-fun res!1062082 () Bool)

(declare-fun e!863552 () Bool)

(assert (=> b!1551102 (=> (not res!1062082) (not e!863552))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103478 0))(
  ( (array!103479 (arr!49934 (Array (_ BitVec 32) (_ BitVec 64))) (size!50485 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103478)

(assert (=> b!1551102 (= res!1062082 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50485 _keys!618))))))

(declare-fun b!1551103 () Bool)

(declare-fun e!863548 () Bool)

(declare-fun e!863549 () Bool)

(declare-fun mapRes!58819 () Bool)

(assert (=> b!1551103 (= e!863548 (and e!863549 mapRes!58819))))

(declare-fun condMapEmpty!58819 () Bool)

(declare-datatypes ((ValueCell!18128 0))(
  ( (ValueCellFull!18128 (v!21909 V!59213)) (EmptyCell!18128) )
))
(declare-datatypes ((array!103480 0))(
  ( (array!103481 (arr!49935 (Array (_ BitVec 32) ValueCell!18128)) (size!50486 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103480)

(declare-fun mapDefault!58819 () ValueCell!18128)

(assert (=> b!1551103 (= condMapEmpty!58819 (= (arr!49935 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18128)) mapDefault!58819)))))

(declare-fun b!1551104 () Bool)

(declare-fun e!863553 () ListLongMap!22287)

(declare-fun call!70389 () ListLongMap!22287)

(declare-fun minValue!436 () V!59213)

(declare-fun +!4999 (ListLongMap!22287 tuple2!24670) ListLongMap!22287)

(assert (=> b!1551104 (= e!863553 (+!4999 call!70389 (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70382 () Bool)

(declare-fun call!70386 () ListLongMap!22287)

(declare-fun call!70388 () ListLongMap!22287)

(assert (=> bm!70382 (= call!70386 call!70388)))

(declare-fun b!1551105 () Bool)

(declare-fun tp_is_empty!38077 () Bool)

(assert (=> b!1551105 (= e!863549 tp_is_empty!38077)))

(declare-fun b!1551106 () Bool)

(declare-fun e!863545 () ListLongMap!22287)

(assert (=> b!1551106 (= e!863545 call!70387)))

(declare-fun b!1551107 () Bool)

(declare-fun res!1062077 () Bool)

(assert (=> b!1551107 (=> (not res!1062077) (not e!863552))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103478 (_ BitVec 32)) Bool)

(assert (=> b!1551107 (= res!1062077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58819 () Bool)

(assert (=> mapIsEmpty!58819 mapRes!58819))

(declare-fun res!1062078 () Bool)

(assert (=> start!132500 (=> (not res!1062078) (not e!863552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132500 (= res!1062078 (validMask!0 mask!926))))

(assert (=> start!132500 e!863552))

(declare-fun array_inv!39091 (array!103478) Bool)

(assert (=> start!132500 (array_inv!39091 _keys!618)))

(assert (=> start!132500 tp_is_empty!38077))

(assert (=> start!132500 true))

(assert (=> start!132500 tp!111654))

(declare-fun array_inv!39092 (array!103480) Bool)

(assert (=> start!132500 (and (array_inv!39092 _values!470) e!863548)))

(declare-fun b!1551108 () Bool)

(declare-fun res!1062081 () Bool)

(assert (=> b!1551108 (=> (not res!1062081) (not e!863552))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551108 (= res!1062081 (and (= (size!50486 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50485 _keys!618) (size!50486 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551109 () Bool)

(declare-fun res!1062083 () Bool)

(assert (=> b!1551109 (=> (not res!1062083) (not e!863552))))

(declare-datatypes ((List!36142 0))(
  ( (Nil!36139) (Cons!36138 (h!37601 (_ BitVec 64)) (t!50828 List!36142)) )
))
(declare-fun arrayNoDuplicates!0 (array!103478 (_ BitVec 32) List!36142) Bool)

(assert (=> b!1551109 (= res!1062083 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36139))))

(declare-fun bm!70383 () Bool)

(declare-fun call!70385 () ListLongMap!22287)

(assert (=> bm!70383 (= call!70388 call!70385)))

(declare-fun b!1551110 () Bool)

(declare-fun e!863547 () Bool)

(assert (=> b!1551110 (= e!863547 tp_is_empty!38077)))

(declare-fun b!1551111 () Bool)

(assert (=> b!1551111 (= e!863546 call!70386)))

(declare-fun zeroValue!436 () V!59213)

(declare-fun c!143033 () Bool)

(declare-fun bm!70384 () Bool)

(declare-fun c!143034 () Bool)

(assert (=> bm!70384 (= call!70389 (+!4999 (ite c!143034 call!70385 (ite c!143033 call!70388 call!70386)) (ite (or c!143034 c!143033) (tuple2!24671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551112 () Bool)

(declare-fun e!863551 () Bool)

(assert (=> b!1551112 (= e!863552 e!863551)))

(declare-fun res!1062080 () Bool)

(assert (=> b!1551112 (=> (not res!1062080) (not e!863551))))

(assert (=> b!1551112 (= res!1062080 (bvslt from!762 (size!50485 _keys!618)))))

(declare-fun lt!668330 () ListLongMap!22287)

(assert (=> b!1551112 (= lt!668330 e!863553)))

(declare-fun lt!668327 () Bool)

(assert (=> b!1551112 (= c!143034 (and (not lt!668327) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551112 (= lt!668327 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551113 () Bool)

(assert (=> b!1551113 (= e!863553 e!863545)))

(assert (=> b!1551113 (= c!143033 (and (not lt!668327) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551114 () Bool)

(declare-fun c!143035 () Bool)

(assert (=> b!1551114 (= c!143035 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668327))))

(assert (=> b!1551114 (= e!863545 e!863546)))

(declare-fun bm!70385 () Bool)

(assert (=> bm!70385 (= call!70387 call!70389)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70386 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6631 (array!103478 array!103480 (_ BitVec 32) (_ BitVec 32) V!59213 V!59213 (_ BitVec 32) Int) ListLongMap!22287)

(assert (=> bm!70386 (= call!70385 (getCurrentListMapNoExtraKeys!6631 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58819 () Bool)

(declare-fun tp!111655 () Bool)

(assert (=> mapNonEmpty!58819 (= mapRes!58819 (and tp!111655 e!863547))))

(declare-fun mapRest!58819 () (Array (_ BitVec 32) ValueCell!18128))

(declare-fun mapKey!58819 () (_ BitVec 32))

(declare-fun mapValue!58819 () ValueCell!18128)

(assert (=> mapNonEmpty!58819 (= (arr!49935 _values!470) (store mapRest!58819 mapKey!58819 mapValue!58819))))

(declare-fun b!1551115 () Bool)

(assert (=> b!1551115 (= e!863551 (not true))))

(declare-fun lt!668332 () V!59213)

(declare-fun lt!668334 () ListLongMap!22287)

(declare-fun apply!1079 (ListLongMap!22287 (_ BitVec 64)) V!59213)

(assert (=> b!1551115 (= (apply!1079 lt!668334 (select (arr!49934 _keys!618) from!762)) lt!668332)))

(declare-fun lt!668331 () ListLongMap!22287)

(declare-datatypes ((Unit!51523 0))(
  ( (Unit!51524) )
))
(declare-fun lt!668329 () Unit!51523)

(declare-fun addApplyDifferent!608 (ListLongMap!22287 (_ BitVec 64) V!59213 (_ BitVec 64)) Unit!51523)

(assert (=> b!1551115 (= lt!668329 (addApplyDifferent!608 lt!668331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49934 _keys!618) from!762)))))

(declare-fun lt!668328 () V!59213)

(assert (=> b!1551115 (= lt!668328 lt!668332)))

(assert (=> b!1551115 (= lt!668332 (apply!1079 lt!668331 (select (arr!49934 _keys!618) from!762)))))

(assert (=> b!1551115 (= lt!668328 (apply!1079 (+!4999 lt!668331 (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49934 _keys!618) from!762)))))

(declare-fun lt!668335 () Unit!51523)

(assert (=> b!1551115 (= lt!668335 (addApplyDifferent!608 lt!668331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49934 _keys!618) from!762)))))

(declare-fun contains!10127 (ListLongMap!22287 (_ BitVec 64)) Bool)

(assert (=> b!1551115 (contains!10127 lt!668334 (select (arr!49934 _keys!618) from!762))))

(assert (=> b!1551115 (= lt!668334 (+!4999 lt!668331 (tuple2!24671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668333 () Unit!51523)

(declare-fun addStillContains!1269 (ListLongMap!22287 (_ BitVec 64) V!59213 (_ BitVec 64)) Unit!51523)

(assert (=> b!1551115 (= lt!668333 (addStillContains!1269 lt!668331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49934 _keys!618) from!762)))))

(assert (=> b!1551115 (= lt!668331 (getCurrentListMapNoExtraKeys!6631 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551116 () Bool)

(declare-fun res!1062079 () Bool)

(assert (=> b!1551116 (=> (not res!1062079) (not e!863551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551116 (= res!1062079 (validKeyInArray!0 (select (arr!49934 _keys!618) from!762)))))

(assert (= (and start!132500 res!1062078) b!1551108))

(assert (= (and b!1551108 res!1062081) b!1551107))

(assert (= (and b!1551107 res!1062077) b!1551109))

(assert (= (and b!1551109 res!1062083) b!1551102))

(assert (= (and b!1551102 res!1062082) b!1551112))

(assert (= (and b!1551112 c!143034) b!1551104))

(assert (= (and b!1551112 (not c!143034)) b!1551113))

(assert (= (and b!1551113 c!143033) b!1551106))

(assert (= (and b!1551113 (not c!143033)) b!1551114))

(assert (= (and b!1551114 c!143035) b!1551101))

(assert (= (and b!1551114 (not c!143035)) b!1551111))

(assert (= (or b!1551101 b!1551111) bm!70382))

(assert (= (or b!1551106 bm!70382) bm!70383))

(assert (= (or b!1551106 b!1551101) bm!70385))

(assert (= (or b!1551104 bm!70383) bm!70386))

(assert (= (or b!1551104 bm!70385) bm!70384))

(assert (= (and b!1551112 res!1062080) b!1551116))

(assert (= (and b!1551116 res!1062079) b!1551115))

(assert (= (and b!1551103 condMapEmpty!58819) mapIsEmpty!58819))

(assert (= (and b!1551103 (not condMapEmpty!58819)) mapNonEmpty!58819))

(get-info :version)

(assert (= (and mapNonEmpty!58819 ((_ is ValueCellFull!18128) mapValue!58819)) b!1551110))

(assert (= (and b!1551103 ((_ is ValueCellFull!18128) mapDefault!58819)) b!1551105))

(assert (= start!132500 b!1551103))

(declare-fun m!1430289 () Bool)

(assert (=> start!132500 m!1430289))

(declare-fun m!1430291 () Bool)

(assert (=> start!132500 m!1430291))

(declare-fun m!1430293 () Bool)

(assert (=> start!132500 m!1430293))

(declare-fun m!1430295 () Bool)

(assert (=> b!1551107 m!1430295))

(declare-fun m!1430297 () Bool)

(assert (=> b!1551116 m!1430297))

(assert (=> b!1551116 m!1430297))

(declare-fun m!1430299 () Bool)

(assert (=> b!1551116 m!1430299))

(declare-fun m!1430301 () Bool)

(assert (=> bm!70386 m!1430301))

(declare-fun m!1430303 () Bool)

(assert (=> mapNonEmpty!58819 m!1430303))

(declare-fun m!1430305 () Bool)

(assert (=> b!1551115 m!1430305))

(declare-fun m!1430307 () Bool)

(assert (=> b!1551115 m!1430307))

(assert (=> b!1551115 m!1430297))

(declare-fun m!1430309 () Bool)

(assert (=> b!1551115 m!1430309))

(assert (=> b!1551115 m!1430301))

(assert (=> b!1551115 m!1430297))

(assert (=> b!1551115 m!1430307))

(assert (=> b!1551115 m!1430297))

(declare-fun m!1430311 () Bool)

(assert (=> b!1551115 m!1430311))

(assert (=> b!1551115 m!1430297))

(declare-fun m!1430313 () Bool)

(assert (=> b!1551115 m!1430313))

(assert (=> b!1551115 m!1430297))

(declare-fun m!1430315 () Bool)

(assert (=> b!1551115 m!1430315))

(assert (=> b!1551115 m!1430297))

(declare-fun m!1430317 () Bool)

(assert (=> b!1551115 m!1430317))

(assert (=> b!1551115 m!1430297))

(declare-fun m!1430319 () Bool)

(assert (=> b!1551115 m!1430319))

(assert (=> b!1551115 m!1430297))

(declare-fun m!1430321 () Bool)

(assert (=> b!1551115 m!1430321))

(declare-fun m!1430323 () Bool)

(assert (=> b!1551104 m!1430323))

(declare-fun m!1430325 () Bool)

(assert (=> b!1551109 m!1430325))

(declare-fun m!1430327 () Bool)

(assert (=> bm!70384 m!1430327))

(check-sat tp_is_empty!38077 b_and!51213 (not b!1551109) (not b!1551115) (not bm!70384) (not b!1551107) (not b_next!31801) (not mapNonEmpty!58819) (not start!132500) (not bm!70386) (not b!1551104) (not b!1551116))
(check-sat b_and!51213 (not b_next!31801))
