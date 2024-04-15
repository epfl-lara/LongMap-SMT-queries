; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132050 () Bool)

(assert start!132050)

(declare-fun b_free!31813 () Bool)

(declare-fun b_next!31813 () Bool)

(assert (=> start!132050 (= b_free!31813 (not b_next!31813))))

(declare-fun tp!111691 () Bool)

(declare-fun b_and!51205 () Bool)

(assert (=> start!132050 (= tp!111691 b_and!51205)))

(declare-fun mapNonEmpty!58837 () Bool)

(declare-fun mapRes!58837 () Bool)

(declare-fun tp!111692 () Bool)

(declare-fun e!862003 () Bool)

(assert (=> mapNonEmpty!58837 (= mapRes!58837 (and tp!111692 e!862003))))

(declare-datatypes ((V!59229 0))(
  ( (V!59230 (val!19122 Int)) )
))
(declare-datatypes ((ValueCell!18134 0))(
  ( (ValueCellFull!18134 (v!21919 V!59229)) (EmptyCell!18134) )
))
(declare-fun mapRest!58837 () (Array (_ BitVec 32) ValueCell!18134))

(declare-fun mapValue!58837 () ValueCell!18134)

(declare-fun mapKey!58837 () (_ BitVec 32))

(declare-datatypes ((array!103304 0))(
  ( (array!103305 (arr!49855 (Array (_ BitVec 32) ValueCell!18134)) (size!50407 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103304)

(assert (=> mapNonEmpty!58837 (= (arr!49855 _values!470) (store mapRest!58837 mapKey!58837 mapValue!58837))))

(declare-fun b!1548640 () Bool)

(declare-fun res!1061218 () Bool)

(declare-fun e!862007 () Bool)

(assert (=> b!1548640 (=> (not res!1061218) (not e!862007))))

(declare-datatypes ((array!103306 0))(
  ( (array!103307 (arr!49856 (Array (_ BitVec 32) (_ BitVec 64))) (size!50408 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103306)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103306 (_ BitVec 32)) Bool)

(assert (=> b!1548640 (= res!1061218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548641 () Bool)

(declare-fun e!862005 () Bool)

(assert (=> b!1548641 (= e!862007 e!862005)))

(declare-fun res!1061215 () Bool)

(assert (=> b!1548641 (=> (not res!1061215) (not e!862005))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1548641 (= res!1061215 (bvslt from!762 (size!50408 _keys!618)))))

(declare-datatypes ((tuple2!24698 0))(
  ( (tuple2!24699 (_1!12360 (_ BitVec 64)) (_2!12360 V!59229)) )
))
(declare-datatypes ((List!36159 0))(
  ( (Nil!36156) (Cons!36155 (h!37601 tuple2!24698) (t!50845 List!36159)) )
))
(declare-datatypes ((ListLongMap!22307 0))(
  ( (ListLongMap!22308 (toList!11169 List!36159)) )
))
(declare-fun lt!667302 () ListLongMap!22307)

(declare-fun e!862000 () ListLongMap!22307)

(assert (=> b!1548641 (= lt!667302 e!862000)))

(declare-fun c!142199 () Bool)

(declare-fun lt!667299 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548641 (= c!142199 (and (not lt!667299) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548641 (= lt!667299 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70287 () Bool)

(declare-fun call!70290 () ListLongMap!22307)

(declare-fun call!70293 () ListLongMap!22307)

(assert (=> bm!70287 (= call!70290 call!70293)))

(declare-fun b!1548642 () Bool)

(declare-fun e!862006 () Bool)

(declare-fun tp_is_empty!38089 () Bool)

(assert (=> b!1548642 (= e!862006 tp_is_empty!38089)))

(declare-fun b!1548643 () Bool)

(declare-fun res!1061216 () Bool)

(assert (=> b!1548643 (=> (not res!1061216) (not e!862007))))

(assert (=> b!1548643 (= res!1061216 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50408 _keys!618))))))

(declare-fun b!1548644 () Bool)

(declare-fun e!862008 () ListLongMap!22307)

(declare-fun call!70292 () ListLongMap!22307)

(assert (=> b!1548644 (= e!862008 call!70292)))

(declare-fun b!1548645 () Bool)

(declare-fun res!1061219 () Bool)

(assert (=> b!1548645 (=> (not res!1061219) (not e!862007))))

(declare-datatypes ((List!36160 0))(
  ( (Nil!36157) (Cons!36156 (h!37602 (_ BitVec 64)) (t!50846 List!36160)) )
))
(declare-fun arrayNoDuplicates!0 (array!103306 (_ BitVec 32) List!36160) Bool)

(assert (=> b!1548645 (= res!1061219 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36157))))

(declare-fun b!1548646 () Bool)

(assert (=> b!1548646 (= e!862008 call!70290)))

(declare-fun b!1548647 () Bool)

(assert (=> b!1548647 (= e!862003 tp_is_empty!38089)))

(declare-fun zeroValue!436 () V!59229)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70288 () Bool)

(declare-fun minValue!436 () V!59229)

(declare-fun call!70291 () ListLongMap!22307)

(declare-fun getCurrentListMapNoExtraKeys!6617 (array!103306 array!103304 (_ BitVec 32) (_ BitVec 32) V!59229 V!59229 (_ BitVec 32) Int) ListLongMap!22307)

(assert (=> bm!70288 (= call!70291 (getCurrentListMapNoExtraKeys!6617 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1061220 () Bool)

(assert (=> start!132050 (=> (not res!1061220) (not e!862007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132050 (= res!1061220 (validMask!0 mask!926))))

(assert (=> start!132050 e!862007))

(declare-fun array_inv!38969 (array!103306) Bool)

(assert (=> start!132050 (array_inv!38969 _keys!618)))

(assert (=> start!132050 tp_is_empty!38089))

(assert (=> start!132050 true))

(assert (=> start!132050 tp!111691))

(declare-fun e!862001 () Bool)

(declare-fun array_inv!38970 (array!103304) Bool)

(assert (=> start!132050 (and (array_inv!38970 _values!470) e!862001)))

(declare-fun b!1548648 () Bool)

(declare-fun e!862002 () ListLongMap!22307)

(assert (=> b!1548648 (= e!862000 e!862002)))

(declare-fun c!142200 () Bool)

(assert (=> b!1548648 (= c!142200 (and (not lt!667299) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548649 () Bool)

(declare-fun res!1061214 () Bool)

(assert (=> b!1548649 (=> (not res!1061214) (not e!862007))))

(assert (=> b!1548649 (= res!1061214 (and (= (size!50407 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50408 _keys!618) (size!50407 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70289 () Bool)

(declare-fun call!70294 () ListLongMap!22307)

(declare-fun +!4989 (ListLongMap!22307 tuple2!24698) ListLongMap!22307)

(assert (=> bm!70289 (= call!70294 (+!4989 (ite c!142199 call!70291 (ite c!142200 call!70293 call!70290)) (ite (or c!142199 c!142200) (tuple2!24699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58837 () Bool)

(assert (=> mapIsEmpty!58837 mapRes!58837))

(declare-fun b!1548650 () Bool)

(assert (=> b!1548650 (= e!862000 (+!4989 call!70294 (tuple2!24699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548651 () Bool)

(assert (=> b!1548651 (= e!862001 (and e!862006 mapRes!58837))))

(declare-fun condMapEmpty!58837 () Bool)

(declare-fun mapDefault!58837 () ValueCell!18134)

(assert (=> b!1548651 (= condMapEmpty!58837 (= (arr!49855 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18134)) mapDefault!58837)))))

(declare-fun b!1548652 () Bool)

(declare-fun res!1061217 () Bool)

(assert (=> b!1548652 (=> (not res!1061217) (not e!862005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548652 (= res!1061217 (validKeyInArray!0 (select (arr!49856 _keys!618) from!762)))))

(declare-fun b!1548653 () Bool)

(assert (=> b!1548653 (= e!862002 call!70292)))

(declare-fun bm!70290 () Bool)

(assert (=> bm!70290 (= call!70292 call!70294)))

(declare-fun b!1548654 () Bool)

(assert (=> b!1548654 (= e!862005 (not true))))

(declare-fun lt!667295 () V!59229)

(declare-fun lt!667301 () ListLongMap!22307)

(declare-fun apply!1068 (ListLongMap!22307 (_ BitVec 64)) V!59229)

(assert (=> b!1548654 (= (apply!1068 lt!667301 (select (arr!49856 _keys!618) from!762)) lt!667295)))

(declare-datatypes ((Unit!51433 0))(
  ( (Unit!51434) )
))
(declare-fun lt!667297 () Unit!51433)

(declare-fun lt!667303 () ListLongMap!22307)

(declare-fun addApplyDifferent!606 (ListLongMap!22307 (_ BitVec 64) V!59229 (_ BitVec 64)) Unit!51433)

(assert (=> b!1548654 (= lt!667297 (addApplyDifferent!606 lt!667303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49856 _keys!618) from!762)))))

(declare-fun lt!667296 () V!59229)

(assert (=> b!1548654 (= lt!667296 lt!667295)))

(assert (=> b!1548654 (= lt!667295 (apply!1068 lt!667303 (select (arr!49856 _keys!618) from!762)))))

(assert (=> b!1548654 (= lt!667296 (apply!1068 (+!4989 lt!667303 (tuple2!24699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49856 _keys!618) from!762)))))

(declare-fun lt!667298 () Unit!51433)

(assert (=> b!1548654 (= lt!667298 (addApplyDifferent!606 lt!667303 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49856 _keys!618) from!762)))))

(declare-fun contains!10043 (ListLongMap!22307 (_ BitVec 64)) Bool)

(assert (=> b!1548654 (contains!10043 lt!667301 (select (arr!49856 _keys!618) from!762))))

(assert (=> b!1548654 (= lt!667301 (+!4989 lt!667303 (tuple2!24699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667300 () Unit!51433)

(declare-fun addStillContains!1266 (ListLongMap!22307 (_ BitVec 64) V!59229 (_ BitVec 64)) Unit!51433)

(assert (=> b!1548654 (= lt!667300 (addStillContains!1266 lt!667303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49856 _keys!618) from!762)))))

(assert (=> b!1548654 (= lt!667303 (getCurrentListMapNoExtraKeys!6617 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70291 () Bool)

(assert (=> bm!70291 (= call!70293 call!70291)))

(declare-fun b!1548655 () Bool)

(declare-fun c!142198 () Bool)

(assert (=> b!1548655 (= c!142198 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667299))))

(assert (=> b!1548655 (= e!862002 e!862008)))

(assert (= (and start!132050 res!1061220) b!1548649))

(assert (= (and b!1548649 res!1061214) b!1548640))

(assert (= (and b!1548640 res!1061218) b!1548645))

(assert (= (and b!1548645 res!1061219) b!1548643))

(assert (= (and b!1548643 res!1061216) b!1548641))

(assert (= (and b!1548641 c!142199) b!1548650))

(assert (= (and b!1548641 (not c!142199)) b!1548648))

(assert (= (and b!1548648 c!142200) b!1548653))

(assert (= (and b!1548648 (not c!142200)) b!1548655))

(assert (= (and b!1548655 c!142198) b!1548644))

(assert (= (and b!1548655 (not c!142198)) b!1548646))

(assert (= (or b!1548644 b!1548646) bm!70287))

(assert (= (or b!1548653 bm!70287) bm!70291))

(assert (= (or b!1548653 b!1548644) bm!70290))

(assert (= (or b!1548650 bm!70291) bm!70288))

(assert (= (or b!1548650 bm!70290) bm!70289))

(assert (= (and b!1548641 res!1061215) b!1548652))

(assert (= (and b!1548652 res!1061217) b!1548654))

(assert (= (and b!1548651 condMapEmpty!58837) mapIsEmpty!58837))

(assert (= (and b!1548651 (not condMapEmpty!58837)) mapNonEmpty!58837))

(get-info :version)

(assert (= (and mapNonEmpty!58837 ((_ is ValueCellFull!18134) mapValue!58837)) b!1548647))

(assert (= (and b!1548651 ((_ is ValueCellFull!18134) mapDefault!58837)) b!1548642))

(assert (= start!132050 b!1548651))

(declare-fun m!1427379 () Bool)

(assert (=> bm!70289 m!1427379))

(declare-fun m!1427381 () Bool)

(assert (=> b!1548640 m!1427381))

(declare-fun m!1427383 () Bool)

(assert (=> b!1548654 m!1427383))

(declare-fun m!1427385 () Bool)

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427387 () Bool)

(assert (=> b!1548654 m!1427387))

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427389 () Bool)

(assert (=> b!1548654 m!1427389))

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427391 () Bool)

(assert (=> b!1548654 m!1427391))

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427393 () Bool)

(assert (=> b!1548654 m!1427393))

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427395 () Bool)

(assert (=> b!1548654 m!1427395))

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427397 () Bool)

(assert (=> b!1548654 m!1427397))

(declare-fun m!1427399 () Bool)

(assert (=> b!1548654 m!1427399))

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427401 () Bool)

(assert (=> b!1548654 m!1427401))

(assert (=> b!1548654 m!1427385))

(declare-fun m!1427403 () Bool)

(assert (=> b!1548654 m!1427403))

(assert (=> b!1548654 m!1427387))

(assert (=> b!1548652 m!1427385))

(assert (=> b!1548652 m!1427385))

(declare-fun m!1427405 () Bool)

(assert (=> b!1548652 m!1427405))

(declare-fun m!1427407 () Bool)

(assert (=> b!1548645 m!1427407))

(declare-fun m!1427409 () Bool)

(assert (=> start!132050 m!1427409))

(declare-fun m!1427411 () Bool)

(assert (=> start!132050 m!1427411))

(declare-fun m!1427413 () Bool)

(assert (=> start!132050 m!1427413))

(declare-fun m!1427415 () Bool)

(assert (=> mapNonEmpty!58837 m!1427415))

(declare-fun m!1427417 () Bool)

(assert (=> b!1548650 m!1427417))

(assert (=> bm!70288 m!1427399))

(check-sat b_and!51205 (not b!1548640) (not b!1548645) (not b_next!31813) (not bm!70289) (not start!132050) (not b!1548654) tp_is_empty!38089 (not bm!70288) (not b!1548652) (not mapNonEmpty!58837) (not b!1548650))
(check-sat b_and!51205 (not b_next!31813))
