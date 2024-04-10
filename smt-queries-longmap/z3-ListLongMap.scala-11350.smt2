; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132006 () Bool)

(assert start!132006)

(declare-fun b_free!31719 () Bool)

(declare-fun b_next!31719 () Bool)

(assert (=> start!132006 (= b_free!31719 (not b_next!31719))))

(declare-fun tp!111409 () Bool)

(declare-fun b_and!51129 () Bool)

(assert (=> start!132006 (= tp!111409 b_and!51129)))

(declare-fun b!1546697 () Bool)

(declare-datatypes ((V!59103 0))(
  ( (V!59104 (val!19075 Int)) )
))
(declare-datatypes ((tuple2!24530 0))(
  ( (tuple2!24531 (_1!12276 (_ BitVec 64)) (_2!12276 V!59103)) )
))
(declare-datatypes ((List!36034 0))(
  ( (Nil!36031) (Cons!36030 (h!37475 tuple2!24530) (t!50728 List!36034)) )
))
(declare-datatypes ((ListLongMap!22139 0))(
  ( (ListLongMap!22140 (toList!11085 List!36034)) )
))
(declare-fun e!860929 () ListLongMap!22139)

(declare-fun call!69622 () ListLongMap!22139)

(assert (=> b!1546697 (= e!860929 call!69622)))

(declare-fun res!1060358 () Bool)

(declare-fun e!860937 () Bool)

(assert (=> start!132006 (=> (not res!1060358) (not e!860937))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132006 (= res!1060358 (validMask!0 mask!926))))

(assert (=> start!132006 e!860937))

(declare-datatypes ((array!103194 0))(
  ( (array!103195 (arr!49799 (Array (_ BitVec 32) (_ BitVec 64))) (size!50349 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103194)

(declare-fun array_inv!38733 (array!103194) Bool)

(assert (=> start!132006 (array_inv!38733 _keys!618)))

(declare-fun tp_is_empty!37995 () Bool)

(assert (=> start!132006 tp_is_empty!37995))

(assert (=> start!132006 true))

(assert (=> start!132006 tp!111409))

(declare-datatypes ((ValueCell!18087 0))(
  ( (ValueCellFull!18087 (v!21876 V!59103)) (EmptyCell!18087) )
))
(declare-datatypes ((array!103196 0))(
  ( (array!103197 (arr!49800 (Array (_ BitVec 32) ValueCell!18087)) (size!50350 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103196)

(declare-fun e!860930 () Bool)

(declare-fun array_inv!38734 (array!103196) Bool)

(assert (=> start!132006 (and (array_inv!38734 _values!470) e!860930)))

(declare-fun b!1546698 () Bool)

(declare-fun e!860931 () ListLongMap!22139)

(declare-fun call!69623 () ListLongMap!22139)

(assert (=> b!1546698 (= e!860931 call!69623)))

(declare-fun bm!69617 () Bool)

(declare-fun zeroValue!436 () V!59103)

(declare-fun c!141864 () Bool)

(declare-fun call!69620 () ListLongMap!22139)

(declare-fun minValue!436 () V!59103)

(declare-fun call!69621 () ListLongMap!22139)

(declare-fun call!69624 () ListLongMap!22139)

(declare-fun c!141865 () Bool)

(declare-fun +!4919 (ListLongMap!22139 tuple2!24530) ListLongMap!22139)

(assert (=> bm!69617 (= call!69620 (+!4919 (ite c!141864 call!69621 (ite c!141865 call!69624 call!69622)) (ite (or c!141864 c!141865) (tuple2!24531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546699 () Bool)

(declare-fun res!1060357 () Bool)

(assert (=> b!1546699 (=> (not res!1060357) (not e!860937))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546699 (= res!1060357 (and (= (size!50350 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50349 _keys!618) (size!50350 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546700 () Bool)

(declare-fun e!860934 () Bool)

(assert (=> b!1546700 (= e!860934 tp_is_empty!37995)))

(declare-fun bm!69618 () Bool)

(assert (=> bm!69618 (= call!69622 call!69624)))

(declare-fun b!1546701 () Bool)

(declare-fun e!860932 () ListLongMap!22139)

(assert (=> b!1546701 (= e!860932 (+!4919 call!69620 (tuple2!24531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58696 () Bool)

(declare-fun mapRes!58696 () Bool)

(declare-fun tp!111408 () Bool)

(assert (=> mapNonEmpty!58696 (= mapRes!58696 (and tp!111408 e!860934))))

(declare-fun mapRest!58696 () (Array (_ BitVec 32) ValueCell!18087))

(declare-fun mapKey!58696 () (_ BitVec 32))

(declare-fun mapValue!58696 () ValueCell!18087)

(assert (=> mapNonEmpty!58696 (= (arr!49800 _values!470) (store mapRest!58696 mapKey!58696 mapValue!58696))))

(declare-fun mapIsEmpty!58696 () Bool)

(assert (=> mapIsEmpty!58696 mapRes!58696))

(declare-fun b!1546702 () Bool)

(declare-fun res!1060361 () Bool)

(assert (=> b!1546702 (=> (not res!1060361) (not e!860937))))

(declare-datatypes ((List!36035 0))(
  ( (Nil!36032) (Cons!36031 (h!37476 (_ BitVec 64)) (t!50729 List!36035)) )
))
(declare-fun arrayNoDuplicates!0 (array!103194 (_ BitVec 32) List!36035) Bool)

(assert (=> b!1546702 (= res!1060361 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36032))))

(declare-fun b!1546703 () Bool)

(declare-fun c!141866 () Bool)

(declare-fun lt!666647 () Bool)

(assert (=> b!1546703 (= c!141866 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666647))))

(assert (=> b!1546703 (= e!860931 e!860929)))

(declare-fun b!1546704 () Bool)

(assert (=> b!1546704 (= e!860932 e!860931)))

(assert (=> b!1546704 (= c!141865 (and (not lt!666647) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69619 () Bool)

(assert (=> bm!69619 (= call!69624 call!69621)))

(declare-fun b!1546705 () Bool)

(declare-fun e!860935 () Bool)

(assert (=> b!1546705 (= e!860937 e!860935)))

(declare-fun res!1060360 () Bool)

(assert (=> b!1546705 (=> (not res!1060360) (not e!860935))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1546705 (= res!1060360 (bvslt from!762 (size!50349 _keys!618)))))

(declare-fun lt!666645 () ListLongMap!22139)

(assert (=> b!1546705 (= lt!666645 e!860932)))

(assert (=> b!1546705 (= c!141864 (and (not lt!666647) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546705 (= lt!666647 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546706 () Bool)

(assert (=> b!1546706 (= e!860935 (not true))))

(declare-fun lt!666646 () ListLongMap!22139)

(declare-fun apply!1042 (ListLongMap!22139 (_ BitVec 64)) V!59103)

(assert (=> b!1546706 (= (apply!1042 (+!4919 lt!666646 (tuple2!24531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49799 _keys!618) from!762)) (apply!1042 lt!666646 (select (arr!49799 _keys!618) from!762)))))

(declare-datatypes ((Unit!51534 0))(
  ( (Unit!51535) )
))
(declare-fun lt!666643 () Unit!51534)

(declare-fun addApplyDifferent!584 (ListLongMap!22139 (_ BitVec 64) V!59103 (_ BitVec 64)) Unit!51534)

(assert (=> b!1546706 (= lt!666643 (addApplyDifferent!584 lt!666646 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49799 _keys!618) from!762)))))

(declare-fun contains!10049 (ListLongMap!22139 (_ BitVec 64)) Bool)

(assert (=> b!1546706 (contains!10049 (+!4919 lt!666646 (tuple2!24531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49799 _keys!618) from!762))))

(declare-fun lt!666644 () Unit!51534)

(declare-fun addStillContains!1237 (ListLongMap!22139 (_ BitVec 64) V!59103 (_ BitVec 64)) Unit!51534)

(assert (=> b!1546706 (= lt!666644 (addStillContains!1237 lt!666646 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49799 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6548 (array!103194 array!103196 (_ BitVec 32) (_ BitVec 32) V!59103 V!59103 (_ BitVec 32) Int) ListLongMap!22139)

(assert (=> b!1546706 (= lt!666646 (getCurrentListMapNoExtraKeys!6548 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546707 () Bool)

(declare-fun res!1060362 () Bool)

(assert (=> b!1546707 (=> (not res!1060362) (not e!860937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103194 (_ BitVec 32)) Bool)

(assert (=> b!1546707 (= res!1060362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546708 () Bool)

(assert (=> b!1546708 (= e!860929 call!69623)))

(declare-fun b!1546709 () Bool)

(declare-fun e!860933 () Bool)

(assert (=> b!1546709 (= e!860930 (and e!860933 mapRes!58696))))

(declare-fun condMapEmpty!58696 () Bool)

(declare-fun mapDefault!58696 () ValueCell!18087)

(assert (=> b!1546709 (= condMapEmpty!58696 (= (arr!49800 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18087)) mapDefault!58696)))))

(declare-fun b!1546710 () Bool)

(declare-fun res!1060356 () Bool)

(assert (=> b!1546710 (=> (not res!1060356) (not e!860937))))

(assert (=> b!1546710 (= res!1060356 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50349 _keys!618))))))

(declare-fun bm!69620 () Bool)

(assert (=> bm!69620 (= call!69621 (getCurrentListMapNoExtraKeys!6548 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69621 () Bool)

(assert (=> bm!69621 (= call!69623 call!69620)))

(declare-fun b!1546711 () Bool)

(assert (=> b!1546711 (= e!860933 tp_is_empty!37995)))

(declare-fun b!1546712 () Bool)

(declare-fun res!1060359 () Bool)

(assert (=> b!1546712 (=> (not res!1060359) (not e!860935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546712 (= res!1060359 (validKeyInArray!0 (select (arr!49799 _keys!618) from!762)))))

(assert (= (and start!132006 res!1060358) b!1546699))

(assert (= (and b!1546699 res!1060357) b!1546707))

(assert (= (and b!1546707 res!1060362) b!1546702))

(assert (= (and b!1546702 res!1060361) b!1546710))

(assert (= (and b!1546710 res!1060356) b!1546705))

(assert (= (and b!1546705 c!141864) b!1546701))

(assert (= (and b!1546705 (not c!141864)) b!1546704))

(assert (= (and b!1546704 c!141865) b!1546698))

(assert (= (and b!1546704 (not c!141865)) b!1546703))

(assert (= (and b!1546703 c!141866) b!1546708))

(assert (= (and b!1546703 (not c!141866)) b!1546697))

(assert (= (or b!1546708 b!1546697) bm!69618))

(assert (= (or b!1546698 bm!69618) bm!69619))

(assert (= (or b!1546698 b!1546708) bm!69621))

(assert (= (or b!1546701 bm!69619) bm!69620))

(assert (= (or b!1546701 bm!69621) bm!69617))

(assert (= (and b!1546705 res!1060360) b!1546712))

(assert (= (and b!1546712 res!1060359) b!1546706))

(assert (= (and b!1546709 condMapEmpty!58696) mapIsEmpty!58696))

(assert (= (and b!1546709 (not condMapEmpty!58696)) mapNonEmpty!58696))

(get-info :version)

(assert (= (and mapNonEmpty!58696 ((_ is ValueCellFull!18087) mapValue!58696)) b!1546700))

(assert (= (and b!1546709 ((_ is ValueCellFull!18087) mapDefault!58696)) b!1546711))

(assert (= start!132006 b!1546709))

(declare-fun m!1426501 () Bool)

(assert (=> b!1546702 m!1426501))

(declare-fun m!1426503 () Bool)

(assert (=> mapNonEmpty!58696 m!1426503))

(declare-fun m!1426505 () Bool)

(assert (=> bm!69617 m!1426505))

(declare-fun m!1426507 () Bool)

(assert (=> b!1546701 m!1426507))

(declare-fun m!1426509 () Bool)

(assert (=> bm!69620 m!1426509))

(declare-fun m!1426511 () Bool)

(assert (=> b!1546712 m!1426511))

(assert (=> b!1546712 m!1426511))

(declare-fun m!1426513 () Bool)

(assert (=> b!1546712 m!1426513))

(declare-fun m!1426515 () Bool)

(assert (=> b!1546707 m!1426515))

(declare-fun m!1426517 () Bool)

(assert (=> start!132006 m!1426517))

(declare-fun m!1426519 () Bool)

(assert (=> start!132006 m!1426519))

(declare-fun m!1426521 () Bool)

(assert (=> start!132006 m!1426521))

(assert (=> b!1546706 m!1426509))

(assert (=> b!1546706 m!1426511))

(declare-fun m!1426523 () Bool)

(assert (=> b!1546706 m!1426523))

(assert (=> b!1546706 m!1426511))

(declare-fun m!1426525 () Bool)

(assert (=> b!1546706 m!1426525))

(declare-fun m!1426527 () Bool)

(assert (=> b!1546706 m!1426527))

(assert (=> b!1546706 m!1426511))

(declare-fun m!1426529 () Bool)

(assert (=> b!1546706 m!1426529))

(assert (=> b!1546706 m!1426511))

(declare-fun m!1426531 () Bool)

(assert (=> b!1546706 m!1426531))

(assert (=> b!1546706 m!1426523))

(assert (=> b!1546706 m!1426527))

(assert (=> b!1546706 m!1426511))

(declare-fun m!1426533 () Bool)

(assert (=> b!1546706 m!1426533))

(assert (=> b!1546706 m!1426511))

(declare-fun m!1426535 () Bool)

(assert (=> b!1546706 m!1426535))

(check-sat (not b!1546707) (not b_next!31719) (not b!1546702) tp_is_empty!37995 (not bm!69620) (not start!132006) (not b!1546706) (not b!1546712) (not mapNonEmpty!58696) (not b!1546701) (not bm!69617) b_and!51129)
(check-sat b_and!51129 (not b_next!31719))
