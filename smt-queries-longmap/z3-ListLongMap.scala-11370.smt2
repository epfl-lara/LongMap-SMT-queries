; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132074 () Bool)

(assert start!132074)

(declare-fun b_free!31837 () Bool)

(declare-fun b_next!31837 () Bool)

(assert (=> start!132074 (= b_free!31837 (not b_next!31837))))

(declare-fun tp!111764 () Bool)

(declare-fun b_and!51229 () Bool)

(assert (=> start!132074 (= tp!111764 b_and!51229)))

(declare-fun res!1061472 () Bool)

(declare-fun e!862330 () Bool)

(assert (=> start!132074 (=> (not res!1061472) (not e!862330))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132074 (= res!1061472 (validMask!0 mask!926))))

(assert (=> start!132074 e!862330))

(declare-datatypes ((array!103346 0))(
  ( (array!103347 (arr!49876 (Array (_ BitVec 32) (_ BitVec 64))) (size!50428 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103346)

(declare-fun array_inv!38985 (array!103346) Bool)

(assert (=> start!132074 (array_inv!38985 _keys!618)))

(declare-fun tp_is_empty!38113 () Bool)

(assert (=> start!132074 tp_is_empty!38113))

(assert (=> start!132074 true))

(assert (=> start!132074 tp!111764))

(declare-datatypes ((V!59261 0))(
  ( (V!59262 (val!19134 Int)) )
))
(declare-datatypes ((ValueCell!18146 0))(
  ( (ValueCellFull!18146 (v!21931 V!59261)) (EmptyCell!18146) )
))
(declare-datatypes ((array!103348 0))(
  ( (array!103349 (arr!49877 (Array (_ BitVec 32) ValueCell!18146)) (size!50429 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103348)

(declare-fun e!862336 () Bool)

(declare-fun array_inv!38986 (array!103348) Bool)

(assert (=> start!132074 (and (array_inv!38986 _values!470) e!862336)))

(declare-fun b!1549220 () Bool)

(declare-fun res!1061470 () Bool)

(assert (=> b!1549220 (=> (not res!1061470) (not e!862330))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1549220 (= res!1061470 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50428 _keys!618))))))

(declare-fun b!1549221 () Bool)

(declare-datatypes ((tuple2!24720 0))(
  ( (tuple2!24721 (_1!12371 (_ BitVec 64)) (_2!12371 V!59261)) )
))
(declare-datatypes ((List!36178 0))(
  ( (Nil!36175) (Cons!36174 (h!37620 tuple2!24720) (t!50864 List!36178)) )
))
(declare-datatypes ((ListLongMap!22329 0))(
  ( (ListLongMap!22330 (toList!11180 List!36178)) )
))
(declare-fun e!862332 () ListLongMap!22329)

(declare-fun call!70472 () ListLongMap!22329)

(declare-fun minValue!436 () V!59261)

(declare-fun +!4998 (ListLongMap!22329 tuple2!24720) ListLongMap!22329)

(assert (=> b!1549221 (= e!862332 (+!4998 call!70472 (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58873 () Bool)

(declare-fun mapRes!58873 () Bool)

(assert (=> mapIsEmpty!58873 mapRes!58873))

(declare-fun b!1549222 () Bool)

(declare-datatypes ((Unit!51447 0))(
  ( (Unit!51448) )
))
(declare-fun e!862329 () Unit!51447)

(declare-fun lt!667643 () Unit!51447)

(assert (=> b!1549222 (= e!862329 lt!667643)))

(declare-fun zeroValue!436 () V!59261)

(declare-fun lt!667636 () ListLongMap!22329)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6625 (array!103346 array!103348 (_ BitVec 32) (_ BitVec 32) V!59261 V!59261 (_ BitVec 32) Int) ListLongMap!22329)

(assert (=> b!1549222 (= lt!667636 (getCurrentListMapNoExtraKeys!6625 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!667635 () Unit!51447)

(declare-fun addStillContains!1273 (ListLongMap!22329 (_ BitVec 64) V!59261 (_ BitVec 64)) Unit!51447)

(assert (=> b!1549222 (= lt!667635 (addStillContains!1273 lt!667636 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49876 _keys!618) from!762)))))

(declare-fun lt!667642 () ListLongMap!22329)

(assert (=> b!1549222 (= lt!667642 (+!4998 lt!667636 (tuple2!24721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10050 (ListLongMap!22329 (_ BitVec 64)) Bool)

(assert (=> b!1549222 (contains!10050 lt!667642 (select (arr!49876 _keys!618) from!762))))

(declare-fun addApplyDifferent!613 (ListLongMap!22329 (_ BitVec 64) V!59261 (_ BitVec 64)) Unit!51447)

(assert (=> b!1549222 (= lt!667643 (addApplyDifferent!613 lt!667636 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49876 _keys!618) from!762)))))

(declare-fun lt!667639 () V!59261)

(declare-fun apply!1075 (ListLongMap!22329 (_ BitVec 64)) V!59261)

(assert (=> b!1549222 (= lt!667639 (apply!1075 (+!4998 lt!667636 (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49876 _keys!618) from!762)))))

(declare-fun lt!667641 () V!59261)

(assert (=> b!1549222 (= lt!667641 (apply!1075 lt!667636 (select (arr!49876 _keys!618) from!762)))))

(assert (=> b!1549222 (= lt!667639 lt!667641)))

(declare-fun lt!667640 () Unit!51447)

(assert (=> b!1549222 (= lt!667640 (addApplyDifferent!613 lt!667636 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49876 _keys!618) from!762)))))

(assert (=> b!1549222 (= (apply!1075 lt!667642 (select (arr!49876 _keys!618) from!762)) lt!667641)))

(declare-fun b!1549223 () Bool)

(declare-fun res!1061467 () Bool)

(assert (=> b!1549223 (=> (not res!1061467) (not e!862330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103346 (_ BitVec 32)) Bool)

(assert (=> b!1549223 (= res!1061467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549224 () Bool)

(declare-fun res!1061469 () Bool)

(assert (=> b!1549224 (=> (not res!1061469) (not e!862330))))

(declare-datatypes ((List!36179 0))(
  ( (Nil!36176) (Cons!36175 (h!37621 (_ BitVec 64)) (t!50865 List!36179)) )
))
(declare-fun arrayNoDuplicates!0 (array!103346 (_ BitVec 32) List!36179) Bool)

(assert (=> b!1549224 (= res!1061469 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36176))))

(declare-fun b!1549225 () Bool)

(declare-fun e!862333 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549225 (= e!862333 (not (validKeyInArray!0 (select (arr!49876 _keys!618) from!762))))))

(declare-fun b!1549226 () Bool)

(declare-fun res!1061466 () Bool)

(assert (=> b!1549226 (=> (not res!1061466) (not e!862330))))

(assert (=> b!1549226 (= res!1061466 (and (= (size!50429 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50428 _keys!618) (size!50429 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549227 () Bool)

(declare-fun e!862334 () ListLongMap!22329)

(declare-fun call!70470 () ListLongMap!22329)

(assert (=> b!1549227 (= e!862334 call!70470)))

(declare-fun b!1549228 () Bool)

(declare-fun c!142310 () Bool)

(declare-fun lt!667644 () Bool)

(assert (=> b!1549228 (= c!142310 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667644))))

(declare-fun e!862331 () ListLongMap!22329)

(assert (=> b!1549228 (= e!862334 e!862331)))

(declare-fun b!1549229 () Bool)

(assert (=> b!1549229 (= e!862331 call!70470)))

(declare-fun bm!70467 () Bool)

(declare-fun call!70471 () ListLongMap!22329)

(declare-fun call!70473 () ListLongMap!22329)

(assert (=> bm!70467 (= call!70471 call!70473)))

(declare-fun bm!70468 () Bool)

(declare-fun call!70474 () ListLongMap!22329)

(assert (=> bm!70468 (= call!70474 call!70471)))

(declare-fun b!1549230 () Bool)

(declare-fun e!862337 () Bool)

(assert (=> b!1549230 (= e!862337 tp_is_empty!38113)))

(declare-fun bm!70469 () Bool)

(assert (=> bm!70469 (= call!70470 call!70472)))

(declare-fun b!1549231 () Bool)

(declare-fun e!862338 () Bool)

(assert (=> b!1549231 (= e!862338 false)))

(declare-fun lt!667634 () Bool)

(declare-fun lt!667637 () ListLongMap!22329)

(assert (=> b!1549231 (= lt!667634 (contains!10050 lt!667637 (select (arr!49876 _keys!618) from!762)))))

(declare-fun b!1549232 () Bool)

(assert (=> b!1549232 (= e!862330 e!862338)))

(declare-fun res!1061468 () Bool)

(assert (=> b!1549232 (=> (not res!1061468) (not e!862338))))

(declare-fun lt!667645 () Bool)

(assert (=> b!1549232 (= res!1061468 (not lt!667645))))

(declare-fun lt!667638 () Unit!51447)

(assert (=> b!1549232 (= lt!667638 e!862329)))

(declare-fun c!142311 () Bool)

(assert (=> b!1549232 (= c!142311 (not lt!667645))))

(assert (=> b!1549232 (= lt!667645 e!862333)))

(declare-fun res!1061471 () Bool)

(assert (=> b!1549232 (=> res!1061471 e!862333)))

(assert (=> b!1549232 (= res!1061471 (bvsge from!762 (size!50428 _keys!618)))))

(assert (=> b!1549232 (= lt!667637 e!862332)))

(declare-fun c!142308 () Bool)

(assert (=> b!1549232 (= c!142308 (and (not lt!667644) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549232 (= lt!667644 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!142309 () Bool)

(declare-fun bm!70470 () Bool)

(assert (=> bm!70470 (= call!70472 (+!4998 (ite c!142308 call!70473 (ite c!142309 call!70471 call!70474)) (ite (or c!142308 c!142309) (tuple2!24721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549233 () Bool)

(assert (=> b!1549233 (= e!862332 e!862334)))

(assert (=> b!1549233 (= c!142309 (and (not lt!667644) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549234 () Bool)

(declare-fun Unit!51449 () Unit!51447)

(assert (=> b!1549234 (= e!862329 Unit!51449)))

(declare-fun mapNonEmpty!58873 () Bool)

(declare-fun tp!111763 () Bool)

(assert (=> mapNonEmpty!58873 (= mapRes!58873 (and tp!111763 e!862337))))

(declare-fun mapRest!58873 () (Array (_ BitVec 32) ValueCell!18146))

(declare-fun mapValue!58873 () ValueCell!18146)

(declare-fun mapKey!58873 () (_ BitVec 32))

(assert (=> mapNonEmpty!58873 (= (arr!49877 _values!470) (store mapRest!58873 mapKey!58873 mapValue!58873))))

(declare-fun bm!70471 () Bool)

(assert (=> bm!70471 (= call!70473 (getCurrentListMapNoExtraKeys!6625 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549235 () Bool)

(assert (=> b!1549235 (= e!862331 call!70474)))

(declare-fun b!1549236 () Bool)

(declare-fun e!862328 () Bool)

(assert (=> b!1549236 (= e!862328 tp_is_empty!38113)))

(declare-fun b!1549237 () Bool)

(assert (=> b!1549237 (= e!862336 (and e!862328 mapRes!58873))))

(declare-fun condMapEmpty!58873 () Bool)

(declare-fun mapDefault!58873 () ValueCell!18146)

(assert (=> b!1549237 (= condMapEmpty!58873 (= (arr!49877 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18146)) mapDefault!58873)))))

(assert (= (and start!132074 res!1061472) b!1549226))

(assert (= (and b!1549226 res!1061466) b!1549223))

(assert (= (and b!1549223 res!1061467) b!1549224))

(assert (= (and b!1549224 res!1061469) b!1549220))

(assert (= (and b!1549220 res!1061470) b!1549232))

(assert (= (and b!1549232 c!142308) b!1549221))

(assert (= (and b!1549232 (not c!142308)) b!1549233))

(assert (= (and b!1549233 c!142309) b!1549227))

(assert (= (and b!1549233 (not c!142309)) b!1549228))

(assert (= (and b!1549228 c!142310) b!1549229))

(assert (= (and b!1549228 (not c!142310)) b!1549235))

(assert (= (or b!1549229 b!1549235) bm!70468))

(assert (= (or b!1549227 bm!70468) bm!70467))

(assert (= (or b!1549227 b!1549229) bm!70469))

(assert (= (or b!1549221 bm!70467) bm!70471))

(assert (= (or b!1549221 bm!70469) bm!70470))

(assert (= (and b!1549232 (not res!1061471)) b!1549225))

(assert (= (and b!1549232 c!142311) b!1549222))

(assert (= (and b!1549232 (not c!142311)) b!1549234))

(assert (= (and b!1549232 res!1061468) b!1549231))

(assert (= (and b!1549237 condMapEmpty!58873) mapIsEmpty!58873))

(assert (= (and b!1549237 (not condMapEmpty!58873)) mapNonEmpty!58873))

(get-info :version)

(assert (= (and mapNonEmpty!58873 ((_ is ValueCellFull!18146) mapValue!58873)) b!1549230))

(assert (= (and b!1549237 ((_ is ValueCellFull!18146) mapDefault!58873)) b!1549236))

(assert (= start!132074 b!1549237))

(declare-fun m!1427865 () Bool)

(assert (=> b!1549231 m!1427865))

(assert (=> b!1549231 m!1427865))

(declare-fun m!1427867 () Bool)

(assert (=> b!1549231 m!1427867))

(declare-fun m!1427869 () Bool)

(assert (=> b!1549221 m!1427869))

(declare-fun m!1427871 () Bool)

(assert (=> b!1549223 m!1427871))

(assert (=> b!1549225 m!1427865))

(assert (=> b!1549225 m!1427865))

(declare-fun m!1427873 () Bool)

(assert (=> b!1549225 m!1427873))

(declare-fun m!1427875 () Bool)

(assert (=> mapNonEmpty!58873 m!1427875))

(declare-fun m!1427877 () Bool)

(assert (=> b!1549224 m!1427877))

(declare-fun m!1427879 () Bool)

(assert (=> start!132074 m!1427879))

(declare-fun m!1427881 () Bool)

(assert (=> start!132074 m!1427881))

(declare-fun m!1427883 () Bool)

(assert (=> start!132074 m!1427883))

(declare-fun m!1427885 () Bool)

(assert (=> bm!70471 m!1427885))

(declare-fun m!1427887 () Bool)

(assert (=> b!1549222 m!1427887))

(assert (=> b!1549222 m!1427865))

(assert (=> b!1549222 m!1427865))

(declare-fun m!1427889 () Bool)

(assert (=> b!1549222 m!1427889))

(assert (=> b!1549222 m!1427865))

(declare-fun m!1427891 () Bool)

(assert (=> b!1549222 m!1427891))

(assert (=> b!1549222 m!1427865))

(declare-fun m!1427893 () Bool)

(assert (=> b!1549222 m!1427893))

(assert (=> b!1549222 m!1427865))

(declare-fun m!1427895 () Bool)

(assert (=> b!1549222 m!1427895))

(declare-fun m!1427897 () Bool)

(assert (=> b!1549222 m!1427897))

(assert (=> b!1549222 m!1427865))

(declare-fun m!1427899 () Bool)

(assert (=> b!1549222 m!1427899))

(assert (=> b!1549222 m!1427865))

(declare-fun m!1427901 () Bool)

(assert (=> b!1549222 m!1427901))

(assert (=> b!1549222 m!1427897))

(assert (=> b!1549222 m!1427885))

(assert (=> b!1549222 m!1427865))

(declare-fun m!1427903 () Bool)

(assert (=> b!1549222 m!1427903))

(declare-fun m!1427905 () Bool)

(assert (=> bm!70470 m!1427905))

(check-sat tp_is_empty!38113 (not b!1549224) (not b!1549221) (not bm!70470) (not mapNonEmpty!58873) (not b_next!31837) (not start!132074) (not b!1549231) (not bm!70471) (not b!1549222) (not b!1549225) (not b!1549223) b_and!51229)
(check-sat b_and!51229 (not b_next!31837))
