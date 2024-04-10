; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131988 () Bool)

(assert start!131988)

(declare-fun b_free!31701 () Bool)

(declare-fun b_next!31701 () Bool)

(assert (=> start!131988 (= b_free!31701 (not b_next!31701))))

(declare-fun tp!111354 () Bool)

(declare-fun b_and!51111 () Bool)

(assert (=> start!131988 (= tp!111354 b_and!51111)))

(declare-fun b!1546265 () Bool)

(declare-datatypes ((V!59079 0))(
  ( (V!59080 (val!19066 Int)) )
))
(declare-datatypes ((tuple2!24514 0))(
  ( (tuple2!24515 (_1!12268 (_ BitVec 64)) (_2!12268 V!59079)) )
))
(declare-datatypes ((List!36021 0))(
  ( (Nil!36018) (Cons!36017 (h!37462 tuple2!24514) (t!50715 List!36021)) )
))
(declare-datatypes ((ListLongMap!22123 0))(
  ( (ListLongMap!22124 (toList!11077 List!36021)) )
))
(declare-fun e!860688 () ListLongMap!22123)

(declare-fun e!860691 () ListLongMap!22123)

(assert (=> b!1546265 (= e!860688 e!860691)))

(declare-fun c!141783 () Bool)

(declare-fun lt!666524 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546265 (= c!141783 (and (not lt!666524) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546266 () Bool)

(declare-fun e!860694 () Bool)

(declare-fun e!860692 () Bool)

(assert (=> b!1546266 (= e!860694 e!860692)))

(declare-fun res!1060167 () Bool)

(assert (=> b!1546266 (=> (not res!1060167) (not e!860692))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103160 0))(
  ( (array!103161 (arr!49782 (Array (_ BitVec 32) (_ BitVec 64))) (size!50332 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103160)

(assert (=> b!1546266 (= res!1060167 (bvslt from!762 (size!50332 _keys!618)))))

(declare-fun lt!666523 () ListLongMap!22123)

(assert (=> b!1546266 (= lt!666523 e!860688)))

(declare-fun c!141785 () Bool)

(assert (=> b!1546266 (= c!141785 (and (not lt!666524) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546266 (= lt!666524 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69482 () Bool)

(declare-fun call!69485 () ListLongMap!22123)

(declare-fun call!69487 () ListLongMap!22123)

(assert (=> bm!69482 (= call!69485 call!69487)))

(declare-fun mapNonEmpty!58669 () Bool)

(declare-fun mapRes!58669 () Bool)

(declare-fun tp!111355 () Bool)

(declare-fun e!860690 () Bool)

(assert (=> mapNonEmpty!58669 (= mapRes!58669 (and tp!111355 e!860690))))

(declare-datatypes ((ValueCell!18078 0))(
  ( (ValueCellFull!18078 (v!21867 V!59079)) (EmptyCell!18078) )
))
(declare-fun mapRest!58669 () (Array (_ BitVec 32) ValueCell!18078))

(declare-fun mapKey!58669 () (_ BitVec 32))

(declare-datatypes ((array!103162 0))(
  ( (array!103163 (arr!49783 (Array (_ BitVec 32) ValueCell!18078)) (size!50333 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103162)

(declare-fun mapValue!58669 () ValueCell!18078)

(assert (=> mapNonEmpty!58669 (= (arr!49783 _values!470) (store mapRest!58669 mapKey!58669 mapValue!58669))))

(declare-fun b!1546267 () Bool)

(declare-fun e!860687 () ListLongMap!22123)

(declare-fun call!69488 () ListLongMap!22123)

(assert (=> b!1546267 (= e!860687 call!69488)))

(declare-fun mapIsEmpty!58669 () Bool)

(assert (=> mapIsEmpty!58669 mapRes!58669))

(declare-fun b!1546268 () Bool)

(declare-fun res!1060169 () Bool)

(assert (=> b!1546268 (=> (not res!1060169) (not e!860694))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103160 (_ BitVec 32)) Bool)

(assert (=> b!1546268 (= res!1060169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546269 () Bool)

(declare-fun call!69489 () ListLongMap!22123)

(declare-fun minValue!436 () V!59079)

(declare-fun +!4912 (ListLongMap!22123 tuple2!24514) ListLongMap!22123)

(assert (=> b!1546269 (= e!860688 (+!4912 call!69489 (tuple2!24515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546270 () Bool)

(declare-fun res!1060173 () Bool)

(assert (=> b!1546270 (=> (not res!1060173) (not e!860692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546270 (= res!1060173 (validKeyInArray!0 (select (arr!49782 _keys!618) from!762)))))

(declare-fun b!1546271 () Bool)

(declare-fun e!860693 () Bool)

(declare-fun e!860686 () Bool)

(assert (=> b!1546271 (= e!860693 (and e!860686 mapRes!58669))))

(declare-fun condMapEmpty!58669 () Bool)

(declare-fun mapDefault!58669 () ValueCell!18078)

(assert (=> b!1546271 (= condMapEmpty!58669 (= (arr!49783 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18078)) mapDefault!58669)))))

(declare-fun b!1546272 () Bool)

(declare-fun call!69486 () ListLongMap!22123)

(assert (=> b!1546272 (= e!860687 call!69486)))

(declare-fun b!1546273 () Bool)

(assert (=> b!1546273 (= e!860692 (not true))))

(declare-fun zeroValue!436 () V!59079)

(declare-fun lt!666521 () ListLongMap!22123)

(declare-fun contains!10045 (ListLongMap!22123 (_ BitVec 64)) Bool)

(assert (=> b!1546273 (contains!10045 (+!4912 lt!666521 (tuple2!24515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49782 _keys!618) from!762))))

(declare-datatypes ((Unit!51526 0))(
  ( (Unit!51527) )
))
(declare-fun lt!666522 () Unit!51526)

(declare-fun addStillContains!1233 (ListLongMap!22123 (_ BitVec 64) V!59079 (_ BitVec 64)) Unit!51526)

(assert (=> b!1546273 (= lt!666522 (addStillContains!1233 lt!666521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49782 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6543 (array!103160 array!103162 (_ BitVec 32) (_ BitVec 32) V!59079 V!59079 (_ BitVec 32) Int) ListLongMap!22123)

(assert (=> b!1546273 (= lt!666521 (getCurrentListMapNoExtraKeys!6543 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060171 () Bool)

(assert (=> start!131988 (=> (not res!1060171) (not e!860694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131988 (= res!1060171 (validMask!0 mask!926))))

(assert (=> start!131988 e!860694))

(declare-fun array_inv!38721 (array!103160) Bool)

(assert (=> start!131988 (array_inv!38721 _keys!618)))

(declare-fun tp_is_empty!37977 () Bool)

(assert (=> start!131988 tp_is_empty!37977))

(assert (=> start!131988 true))

(assert (=> start!131988 tp!111354))

(declare-fun array_inv!38722 (array!103162) Bool)

(assert (=> start!131988 (and (array_inv!38722 _values!470) e!860693)))

(declare-fun bm!69483 () Bool)

(assert (=> bm!69483 (= call!69486 call!69489)))

(declare-fun b!1546274 () Bool)

(assert (=> b!1546274 (= e!860690 tp_is_empty!37977)))

(declare-fun bm!69484 () Bool)

(assert (=> bm!69484 (= call!69489 (+!4912 (ite c!141785 call!69487 (ite c!141783 call!69485 call!69488)) (ite (or c!141785 c!141783) (tuple2!24515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546275 () Bool)

(declare-fun res!1060172 () Bool)

(assert (=> b!1546275 (=> (not res!1060172) (not e!860694))))

(declare-datatypes ((List!36022 0))(
  ( (Nil!36019) (Cons!36018 (h!37463 (_ BitVec 64)) (t!50716 List!36022)) )
))
(declare-fun arrayNoDuplicates!0 (array!103160 (_ BitVec 32) List!36022) Bool)

(assert (=> b!1546275 (= res!1060172 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36019))))

(declare-fun bm!69485 () Bool)

(assert (=> bm!69485 (= call!69487 (getCurrentListMapNoExtraKeys!6543 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546276 () Bool)

(assert (=> b!1546276 (= e!860691 call!69486)))

(declare-fun bm!69486 () Bool)

(assert (=> bm!69486 (= call!69488 call!69485)))

(declare-fun b!1546277 () Bool)

(declare-fun res!1060168 () Bool)

(assert (=> b!1546277 (=> (not res!1060168) (not e!860694))))

(assert (=> b!1546277 (= res!1060168 (and (= (size!50333 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50332 _keys!618) (size!50333 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546278 () Bool)

(assert (=> b!1546278 (= e!860686 tp_is_empty!37977)))

(declare-fun b!1546279 () Bool)

(declare-fun res!1060170 () Bool)

(assert (=> b!1546279 (=> (not res!1060170) (not e!860694))))

(assert (=> b!1546279 (= res!1060170 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50332 _keys!618))))))

(declare-fun b!1546280 () Bool)

(declare-fun c!141784 () Bool)

(assert (=> b!1546280 (= c!141784 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666524))))

(assert (=> b!1546280 (= e!860691 e!860687)))

(assert (= (and start!131988 res!1060171) b!1546277))

(assert (= (and b!1546277 res!1060168) b!1546268))

(assert (= (and b!1546268 res!1060169) b!1546275))

(assert (= (and b!1546275 res!1060172) b!1546279))

(assert (= (and b!1546279 res!1060170) b!1546266))

(assert (= (and b!1546266 c!141785) b!1546269))

(assert (= (and b!1546266 (not c!141785)) b!1546265))

(assert (= (and b!1546265 c!141783) b!1546276))

(assert (= (and b!1546265 (not c!141783)) b!1546280))

(assert (= (and b!1546280 c!141784) b!1546272))

(assert (= (and b!1546280 (not c!141784)) b!1546267))

(assert (= (or b!1546272 b!1546267) bm!69486))

(assert (= (or b!1546276 bm!69486) bm!69482))

(assert (= (or b!1546276 b!1546272) bm!69483))

(assert (= (or b!1546269 bm!69482) bm!69485))

(assert (= (or b!1546269 bm!69483) bm!69484))

(assert (= (and b!1546266 res!1060167) b!1546270))

(assert (= (and b!1546270 res!1060173) b!1546273))

(assert (= (and b!1546271 condMapEmpty!58669) mapIsEmpty!58669))

(assert (= (and b!1546271 (not condMapEmpty!58669)) mapNonEmpty!58669))

(get-info :version)

(assert (= (and mapNonEmpty!58669 ((_ is ValueCellFull!18078) mapValue!58669)) b!1546274))

(assert (= (and b!1546271 ((_ is ValueCellFull!18078) mapDefault!58669)) b!1546278))

(assert (= start!131988 b!1546271))

(declare-fun m!1426235 () Bool)

(assert (=> bm!69484 m!1426235))

(declare-fun m!1426237 () Bool)

(assert (=> b!1546268 m!1426237))

(declare-fun m!1426239 () Bool)

(assert (=> b!1546273 m!1426239))

(declare-fun m!1426241 () Bool)

(assert (=> b!1546273 m!1426241))

(declare-fun m!1426243 () Bool)

(assert (=> b!1546273 m!1426243))

(declare-fun m!1426245 () Bool)

(assert (=> b!1546273 m!1426245))

(assert (=> b!1546273 m!1426241))

(assert (=> b!1546273 m!1426241))

(declare-fun m!1426247 () Bool)

(assert (=> b!1546273 m!1426247))

(assert (=> b!1546273 m!1426239))

(declare-fun m!1426249 () Bool)

(assert (=> start!131988 m!1426249))

(declare-fun m!1426251 () Bool)

(assert (=> start!131988 m!1426251))

(declare-fun m!1426253 () Bool)

(assert (=> start!131988 m!1426253))

(declare-fun m!1426255 () Bool)

(assert (=> b!1546269 m!1426255))

(declare-fun m!1426257 () Bool)

(assert (=> b!1546275 m!1426257))

(assert (=> b!1546270 m!1426241))

(assert (=> b!1546270 m!1426241))

(declare-fun m!1426259 () Bool)

(assert (=> b!1546270 m!1426259))

(assert (=> bm!69485 m!1426245))

(declare-fun m!1426261 () Bool)

(assert (=> mapNonEmpty!58669 m!1426261))

(check-sat (not bm!69485) (not bm!69484) (not start!131988) tp_is_empty!37977 (not b!1546268) (not b_next!31701) (not b!1546275) (not b!1546269) (not mapNonEmpty!58669) b_and!51111 (not b!1546273) (not b!1546270))
(check-sat b_and!51111 (not b_next!31701))
