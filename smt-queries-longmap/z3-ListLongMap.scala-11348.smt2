; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131942 () Bool)

(assert start!131942)

(declare-fun b_free!31705 () Bool)

(declare-fun b_next!31705 () Bool)

(assert (=> start!131942 (= b_free!31705 (not b_next!31705))))

(declare-fun tp!111368 () Bool)

(declare-fun b_and!51097 () Bool)

(assert (=> start!131942 (= tp!111368 b_and!51097)))

(declare-fun b!1546048 () Bool)

(declare-fun e!860542 () Bool)

(declare-fun e!860549 () Bool)

(declare-fun mapRes!58675 () Bool)

(assert (=> b!1546048 (= e!860542 (and e!860549 mapRes!58675))))

(declare-fun condMapEmpty!58675 () Bool)

(declare-datatypes ((V!59085 0))(
  ( (V!59086 (val!19068 Int)) )
))
(declare-datatypes ((ValueCell!18080 0))(
  ( (ValueCellFull!18080 (v!21865 V!59085)) (EmptyCell!18080) )
))
(declare-datatypes ((array!103096 0))(
  ( (array!103097 (arr!49751 (Array (_ BitVec 32) ValueCell!18080)) (size!50303 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103096)

(declare-fun mapDefault!58675 () ValueCell!18080)

(assert (=> b!1546048 (= condMapEmpty!58675 (= (arr!49751 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18080)) mapDefault!58675)))))

(declare-fun b!1546049 () Bool)

(declare-datatypes ((tuple2!24594 0))(
  ( (tuple2!24595 (_1!12308 (_ BitVec 64)) (_2!12308 V!59085)) )
))
(declare-datatypes ((List!36066 0))(
  ( (Nil!36063) (Cons!36062 (h!37508 tuple2!24594) (t!50752 List!36066)) )
))
(declare-datatypes ((ListLongMap!22203 0))(
  ( (ListLongMap!22204 (toList!11117 List!36066)) )
))
(declare-fun e!860545 () ListLongMap!22203)

(declare-fun call!69484 () ListLongMap!22203)

(assert (=> b!1546049 (= e!860545 call!69484)))

(declare-fun b!1546050 () Bool)

(declare-fun e!860543 () Bool)

(declare-fun tp_is_empty!37981 () Bool)

(assert (=> b!1546050 (= e!860543 tp_is_empty!37981)))

(declare-fun b!1546051 () Bool)

(declare-fun res!1060086 () Bool)

(declare-fun e!860550 () Bool)

(assert (=> b!1546051 (=> (not res!1060086) (not e!860550))))

(declare-datatypes ((array!103098 0))(
  ( (array!103099 (arr!49752 (Array (_ BitVec 32) (_ BitVec 64))) (size!50304 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103098)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1546051 (= res!1060086 (and (= (size!50303 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50304 _keys!618) (size!50303 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546052 () Bool)

(declare-fun res!1060083 () Bool)

(assert (=> b!1546052 (=> (not res!1060083) (not e!860550))))

(declare-datatypes ((List!36067 0))(
  ( (Nil!36064) (Cons!36063 (h!37509 (_ BitVec 64)) (t!50753 List!36067)) )
))
(declare-fun arrayNoDuplicates!0 (array!103098 (_ BitVec 32) List!36067) Bool)

(assert (=> b!1546052 (= res!1060083 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36064))))

(declare-fun bm!69477 () Bool)

(declare-fun call!69480 () ListLongMap!22203)

(declare-fun call!69481 () ListLongMap!22203)

(assert (=> bm!69477 (= call!69480 call!69481)))

(declare-fun b!1546053 () Bool)

(declare-fun res!1060080 () Bool)

(assert (=> b!1546053 (=> (not res!1060080) (not e!860550))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1546053 (= res!1060080 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50304 _keys!618))))))

(declare-fun bm!69478 () Bool)

(declare-fun call!69482 () ListLongMap!22203)

(assert (=> bm!69478 (= call!69484 call!69482)))

(declare-fun b!1546054 () Bool)

(declare-fun e!860547 () Bool)

(assert (=> b!1546054 (= e!860547 (not true))))

(declare-fun zeroValue!436 () V!59085)

(declare-fun lt!666261 () ListLongMap!22203)

(declare-fun contains!10004 (ListLongMap!22203 (_ BitVec 64)) Bool)

(declare-fun +!4944 (ListLongMap!22203 tuple2!24594) ListLongMap!22203)

(assert (=> b!1546054 (contains!10004 (+!4944 lt!666261 (tuple2!24595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49752 _keys!618) from!762))))

(declare-datatypes ((Unit!51355 0))(
  ( (Unit!51356) )
))
(declare-fun lt!666260 () Unit!51355)

(declare-fun addStillContains!1227 (ListLongMap!22203 (_ BitVec 64) V!59085 (_ BitVec 64)) Unit!51355)

(assert (=> b!1546054 (= lt!666260 (addStillContains!1227 lt!666261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49752 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59085)

(declare-fun getCurrentListMapNoExtraKeys!6572 (array!103098 array!103096 (_ BitVec 32) (_ BitVec 32) V!59085 V!59085 (_ BitVec 32) Int) ListLongMap!22203)

(assert (=> b!1546054 (= lt!666261 (getCurrentListMapNoExtraKeys!6572 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69479 () Bool)

(assert (=> bm!69479 (= call!69481 (getCurrentListMapNoExtraKeys!6572 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546055 () Bool)

(declare-fun res!1060081 () Bool)

(assert (=> b!1546055 (=> (not res!1060081) (not e!860547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546055 (= res!1060081 (validKeyInArray!0 (select (arr!49752 _keys!618) from!762)))))

(declare-fun b!1546056 () Bool)

(assert (=> b!1546056 (= e!860549 tp_is_empty!37981)))

(declare-fun mapNonEmpty!58675 () Bool)

(declare-fun tp!111367 () Bool)

(assert (=> mapNonEmpty!58675 (= mapRes!58675 (and tp!111367 e!860543))))

(declare-fun mapKey!58675 () (_ BitVec 32))

(declare-fun mapValue!58675 () ValueCell!18080)

(declare-fun mapRest!58675 () (Array (_ BitVec 32) ValueCell!18080))

(assert (=> mapNonEmpty!58675 (= (arr!49751 _values!470) (store mapRest!58675 mapKey!58675 mapValue!58675))))

(declare-fun b!1546057 () Bool)

(declare-fun e!860546 () ListLongMap!22203)

(assert (=> b!1546057 (= e!860546 call!69484)))

(declare-fun bm!69480 () Bool)

(declare-fun c!141713 () Bool)

(declare-fun call!69483 () ListLongMap!22203)

(declare-fun c!141712 () Bool)

(assert (=> bm!69480 (= call!69482 (+!4944 (ite c!141713 call!69481 (ite c!141712 call!69480 call!69483)) (ite (or c!141713 c!141712) (tuple2!24595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1060084 () Bool)

(assert (=> start!131942 (=> (not res!1060084) (not e!860550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131942 (= res!1060084 (validMask!0 mask!926))))

(assert (=> start!131942 e!860550))

(declare-fun array_inv!38889 (array!103098) Bool)

(assert (=> start!131942 (array_inv!38889 _keys!618)))

(assert (=> start!131942 tp_is_empty!37981))

(assert (=> start!131942 true))

(assert (=> start!131942 tp!111368))

(declare-fun array_inv!38890 (array!103096) Bool)

(assert (=> start!131942 (and (array_inv!38890 _values!470) e!860542)))

(declare-fun b!1546058 () Bool)

(assert (=> b!1546058 (= e!860550 e!860547)))

(declare-fun res!1060085 () Bool)

(assert (=> b!1546058 (=> (not res!1060085) (not e!860547))))

(assert (=> b!1546058 (= res!1060085 (bvslt from!762 (size!50304 _keys!618)))))

(declare-fun lt!666262 () ListLongMap!22203)

(declare-fun e!860544 () ListLongMap!22203)

(assert (=> b!1546058 (= lt!666262 e!860544)))

(declare-fun lt!666259 () Bool)

(assert (=> b!1546058 (= c!141713 (and (not lt!666259) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546058 (= lt!666259 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546059 () Bool)

(assert (=> b!1546059 (= e!860546 call!69483)))

(declare-fun b!1546060 () Bool)

(assert (=> b!1546060 (= e!860544 (+!4944 call!69482 (tuple2!24595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58675 () Bool)

(assert (=> mapIsEmpty!58675 mapRes!58675))

(declare-fun b!1546061 () Bool)

(declare-fun res!1060082 () Bool)

(assert (=> b!1546061 (=> (not res!1060082) (not e!860550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103098 (_ BitVec 32)) Bool)

(assert (=> b!1546061 (= res!1060082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69481 () Bool)

(assert (=> bm!69481 (= call!69483 call!69480)))

(declare-fun b!1546062 () Bool)

(declare-fun c!141714 () Bool)

(assert (=> b!1546062 (= c!141714 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666259))))

(assert (=> b!1546062 (= e!860545 e!860546)))

(declare-fun b!1546063 () Bool)

(assert (=> b!1546063 (= e!860544 e!860545)))

(assert (=> b!1546063 (= c!141712 (and (not lt!666259) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!131942 res!1060084) b!1546051))

(assert (= (and b!1546051 res!1060086) b!1546061))

(assert (= (and b!1546061 res!1060082) b!1546052))

(assert (= (and b!1546052 res!1060083) b!1546053))

(assert (= (and b!1546053 res!1060080) b!1546058))

(assert (= (and b!1546058 c!141713) b!1546060))

(assert (= (and b!1546058 (not c!141713)) b!1546063))

(assert (= (and b!1546063 c!141712) b!1546049))

(assert (= (and b!1546063 (not c!141712)) b!1546062))

(assert (= (and b!1546062 c!141714) b!1546057))

(assert (= (and b!1546062 (not c!141714)) b!1546059))

(assert (= (or b!1546057 b!1546059) bm!69481))

(assert (= (or b!1546049 bm!69481) bm!69477))

(assert (= (or b!1546049 b!1546057) bm!69478))

(assert (= (or b!1546060 bm!69477) bm!69479))

(assert (= (or b!1546060 bm!69478) bm!69480))

(assert (= (and b!1546058 res!1060085) b!1546055))

(assert (= (and b!1546055 res!1060081) b!1546054))

(assert (= (and b!1546048 condMapEmpty!58675) mapIsEmpty!58675))

(assert (= (and b!1546048 (not condMapEmpty!58675)) mapNonEmpty!58675))

(get-info :version)

(assert (= (and mapNonEmpty!58675 ((_ is ValueCellFull!18080) mapValue!58675)) b!1546050))

(assert (= (and b!1546048 ((_ is ValueCellFull!18080) mapDefault!58675)) b!1546056))

(assert (= start!131942 b!1546048))

(declare-fun m!1425399 () Bool)

(assert (=> bm!69479 m!1425399))

(declare-fun m!1425401 () Bool)

(assert (=> b!1546054 m!1425401))

(declare-fun m!1425403 () Bool)

(assert (=> b!1546054 m!1425403))

(declare-fun m!1425405 () Bool)

(assert (=> b!1546054 m!1425405))

(assert (=> b!1546054 m!1425399))

(assert (=> b!1546054 m!1425403))

(assert (=> b!1546054 m!1425403))

(declare-fun m!1425407 () Bool)

(assert (=> b!1546054 m!1425407))

(assert (=> b!1546054 m!1425401))

(declare-fun m!1425409 () Bool)

(assert (=> b!1546052 m!1425409))

(declare-fun m!1425411 () Bool)

(assert (=> bm!69480 m!1425411))

(declare-fun m!1425413 () Bool)

(assert (=> start!131942 m!1425413))

(declare-fun m!1425415 () Bool)

(assert (=> start!131942 m!1425415))

(declare-fun m!1425417 () Bool)

(assert (=> start!131942 m!1425417))

(declare-fun m!1425419 () Bool)

(assert (=> mapNonEmpty!58675 m!1425419))

(declare-fun m!1425421 () Bool)

(assert (=> b!1546060 m!1425421))

(assert (=> b!1546055 m!1425403))

(assert (=> b!1546055 m!1425403))

(declare-fun m!1425423 () Bool)

(assert (=> b!1546055 m!1425423))

(declare-fun m!1425425 () Bool)

(assert (=> b!1546061 m!1425425))

(check-sat (not b!1546055) (not b_next!31705) tp_is_empty!37981 (not bm!69479) (not b!1546052) (not bm!69480) (not b!1546060) (not mapNonEmpty!58675) (not b!1546054) (not start!131942) b_and!51097 (not b!1546061))
(check-sat b_and!51097 (not b_next!31705))
