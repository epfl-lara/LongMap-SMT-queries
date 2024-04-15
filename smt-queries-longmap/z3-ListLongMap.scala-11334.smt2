; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131858 () Bool)

(assert start!131858)

(declare-fun b_free!31621 () Bool)

(declare-fun b_next!31621 () Bool)

(assert (=> start!131858 (= b_free!31621 (not b_next!31621))))

(declare-fun tp!111115 () Bool)

(declare-fun b_and!51013 () Bool)

(assert (=> start!131858 (= tp!111115 b_and!51013)))

(declare-fun b!1544118 () Bool)

(declare-fun e!859451 () Bool)

(declare-fun e!859455 () Bool)

(declare-fun mapRes!58549 () Bool)

(assert (=> b!1544118 (= e!859451 (and e!859455 mapRes!58549))))

(declare-fun condMapEmpty!58549 () Bool)

(declare-datatypes ((V!58973 0))(
  ( (V!58974 (val!19026 Int)) )
))
(declare-datatypes ((ValueCell!18038 0))(
  ( (ValueCellFull!18038 (v!21823 V!58973)) (EmptyCell!18038) )
))
(declare-datatypes ((array!102934 0))(
  ( (array!102935 (arr!49670 (Array (_ BitVec 32) ValueCell!18038)) (size!50222 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102934)

(declare-fun mapDefault!58549 () ValueCell!18038)

(assert (=> b!1544118 (= condMapEmpty!58549 (= (arr!49670 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18038)) mapDefault!58549)))))

(declare-fun b!1544119 () Bool)

(declare-fun e!859453 () Bool)

(assert (=> b!1544119 (= e!859453 false)))

(declare-datatypes ((tuple2!24512 0))(
  ( (tuple2!24513 (_1!12267 (_ BitVec 64)) (_2!12267 V!58973)) )
))
(declare-datatypes ((List!36000 0))(
  ( (Nil!35997) (Cons!35996 (h!37442 tuple2!24512) (t!50686 List!36000)) )
))
(declare-datatypes ((ListLongMap!22121 0))(
  ( (ListLongMap!22122 (toList!11076 List!36000)) )
))
(declare-fun lt!665850 () ListLongMap!22121)

(declare-fun e!859452 () ListLongMap!22121)

(assert (=> b!1544119 (= lt!665850 e!859452)))

(declare-fun c!141336 () Bool)

(declare-fun lt!665851 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544119 (= c!141336 (and (not lt!665851) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544119 (= lt!665851 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544120 () Bool)

(declare-fun call!68853 () ListLongMap!22121)

(declare-fun minValue!436 () V!58973)

(declare-fun +!4909 (ListLongMap!22121 tuple2!24512) ListLongMap!22121)

(assert (=> b!1544120 (= e!859452 (+!4909 call!68853 (tuple2!24513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544121 () Bool)

(declare-fun e!859456 () ListLongMap!22121)

(assert (=> b!1544121 (= e!859452 e!859456)))

(declare-fun c!141335 () Bool)

(assert (=> b!1544121 (= c!141335 (and (not lt!665851) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544122 () Bool)

(declare-fun res!1059286 () Bool)

(assert (=> b!1544122 (=> (not res!1059286) (not e!859453))))

(declare-datatypes ((array!102936 0))(
  ( (array!102937 (arr!49671 (Array (_ BitVec 32) (_ BitVec 64))) (size!50223 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102936)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102936 (_ BitVec 32)) Bool)

(assert (=> b!1544122 (= res!1059286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!58973)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!68847 () Bool)

(declare-fun call!68852 () ListLongMap!22121)

(declare-fun getCurrentListMapNoExtraKeys!6542 (array!102936 array!102934 (_ BitVec 32) (_ BitVec 32) V!58973 V!58973 (_ BitVec 32) Int) ListLongMap!22121)

(assert (=> bm!68847 (= call!68852 (getCurrentListMapNoExtraKeys!6542 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544123 () Bool)

(declare-fun e!859454 () ListLongMap!22121)

(declare-fun call!68851 () ListLongMap!22121)

(assert (=> b!1544123 (= e!859454 call!68851)))

(declare-fun bm!68848 () Bool)

(declare-fun call!68850 () ListLongMap!22121)

(assert (=> bm!68848 (= call!68851 call!68850)))

(declare-fun bm!68849 () Bool)

(assert (=> bm!68849 (= call!68850 call!68852)))

(declare-fun res!1059287 () Bool)

(assert (=> start!131858 (=> (not res!1059287) (not e!859453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131858 (= res!1059287 (validMask!0 mask!926))))

(assert (=> start!131858 e!859453))

(declare-fun array_inv!38833 (array!102936) Bool)

(assert (=> start!131858 (array_inv!38833 _keys!618)))

(declare-fun tp_is_empty!37897 () Bool)

(assert (=> start!131858 tp_is_empty!37897))

(assert (=> start!131858 true))

(assert (=> start!131858 tp!111115))

(declare-fun array_inv!38834 (array!102934) Bool)

(assert (=> start!131858 (and (array_inv!38834 _values!470) e!859451)))

(declare-fun b!1544124 () Bool)

(declare-fun res!1059284 () Bool)

(assert (=> b!1544124 (=> (not res!1059284) (not e!859453))))

(declare-datatypes ((List!36001 0))(
  ( (Nil!35998) (Cons!35997 (h!37443 (_ BitVec 64)) (t!50687 List!36001)) )
))
(declare-fun arrayNoDuplicates!0 (array!102936 (_ BitVec 32) List!36001) Bool)

(assert (=> b!1544124 (= res!1059284 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35998))))

(declare-fun bm!68850 () Bool)

(declare-fun call!68854 () ListLongMap!22121)

(assert (=> bm!68850 (= call!68854 call!68853)))

(declare-fun b!1544125 () Bool)

(declare-fun c!141334 () Bool)

(assert (=> b!1544125 (= c!141334 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665851))))

(assert (=> b!1544125 (= e!859456 e!859454)))

(declare-fun mapNonEmpty!58549 () Bool)

(declare-fun tp!111116 () Bool)

(declare-fun e!859458 () Bool)

(assert (=> mapNonEmpty!58549 (= mapRes!58549 (and tp!111116 e!859458))))

(declare-fun mapRest!58549 () (Array (_ BitVec 32) ValueCell!18038))

(declare-fun mapValue!58549 () ValueCell!18038)

(declare-fun mapKey!58549 () (_ BitVec 32))

(assert (=> mapNonEmpty!58549 (= (arr!49670 _values!470) (store mapRest!58549 mapKey!58549 mapValue!58549))))

(declare-fun mapIsEmpty!58549 () Bool)

(assert (=> mapIsEmpty!58549 mapRes!58549))

(declare-fun b!1544126 () Bool)

(declare-fun res!1059288 () Bool)

(assert (=> b!1544126 (=> (not res!1059288) (not e!859453))))

(assert (=> b!1544126 (= res!1059288 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50223 _keys!618))))))

(declare-fun b!1544127 () Bool)

(assert (=> b!1544127 (= e!859458 tp_is_empty!37897)))

(declare-fun b!1544128 () Bool)

(assert (=> b!1544128 (= e!859454 call!68854)))

(declare-fun b!1544129 () Bool)

(assert (=> b!1544129 (= e!859455 tp_is_empty!37897)))

(declare-fun b!1544130 () Bool)

(assert (=> b!1544130 (= e!859456 call!68854)))

(declare-fun bm!68851 () Bool)

(assert (=> bm!68851 (= call!68853 (+!4909 (ite c!141336 call!68852 (ite c!141335 call!68850 call!68851)) (ite (or c!141336 c!141335) (tuple2!24513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544131 () Bool)

(declare-fun res!1059285 () Bool)

(assert (=> b!1544131 (=> (not res!1059285) (not e!859453))))

(assert (=> b!1544131 (= res!1059285 (and (= (size!50222 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50223 _keys!618) (size!50222 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!131858 res!1059287) b!1544131))

(assert (= (and b!1544131 res!1059285) b!1544122))

(assert (= (and b!1544122 res!1059286) b!1544124))

(assert (= (and b!1544124 res!1059284) b!1544126))

(assert (= (and b!1544126 res!1059288) b!1544119))

(assert (= (and b!1544119 c!141336) b!1544120))

(assert (= (and b!1544119 (not c!141336)) b!1544121))

(assert (= (and b!1544121 c!141335) b!1544130))

(assert (= (and b!1544121 (not c!141335)) b!1544125))

(assert (= (and b!1544125 c!141334) b!1544128))

(assert (= (and b!1544125 (not c!141334)) b!1544123))

(assert (= (or b!1544128 b!1544123) bm!68848))

(assert (= (or b!1544130 bm!68848) bm!68849))

(assert (= (or b!1544130 b!1544128) bm!68850))

(assert (= (or b!1544120 bm!68849) bm!68847))

(assert (= (or b!1544120 bm!68850) bm!68851))

(assert (= (and b!1544118 condMapEmpty!58549) mapIsEmpty!58549))

(assert (= (and b!1544118 (not condMapEmpty!58549)) mapNonEmpty!58549))

(get-info :version)

(assert (= (and mapNonEmpty!58549 ((_ is ValueCellFull!18038) mapValue!58549)) b!1544127))

(assert (= (and b!1544118 ((_ is ValueCellFull!18038) mapDefault!58549)) b!1544129))

(assert (= start!131858 b!1544118))

(declare-fun m!1424385 () Bool)

(assert (=> start!131858 m!1424385))

(declare-fun m!1424387 () Bool)

(assert (=> start!131858 m!1424387))

(declare-fun m!1424389 () Bool)

(assert (=> start!131858 m!1424389))

(declare-fun m!1424391 () Bool)

(assert (=> mapNonEmpty!58549 m!1424391))

(declare-fun m!1424393 () Bool)

(assert (=> b!1544122 m!1424393))

(declare-fun m!1424395 () Bool)

(assert (=> bm!68847 m!1424395))

(declare-fun m!1424397 () Bool)

(assert (=> bm!68851 m!1424397))

(declare-fun m!1424399 () Bool)

(assert (=> b!1544124 m!1424399))

(declare-fun m!1424401 () Bool)

(assert (=> b!1544120 m!1424401))

(check-sat (not start!131858) tp_is_empty!37897 (not b!1544124) (not b!1544120) (not bm!68851) b_and!51013 (not b!1544122) (not bm!68847) (not mapNonEmpty!58549) (not b_next!31621))
(check-sat b_and!51013 (not b_next!31621))
