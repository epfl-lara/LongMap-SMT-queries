; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132150 () Bool)

(assert start!132150)

(declare-fun b_free!31863 () Bool)

(declare-fun b_next!31863 () Bool)

(assert (=> start!132150 (= b_free!31863 (not b_next!31863))))

(declare-fun tp!111840 () Bool)

(declare-fun b_and!51285 () Bool)

(assert (=> start!132150 (= tp!111840 b_and!51285)))

(declare-fun b!1550291 () Bool)

(declare-fun e!862972 () Bool)

(declare-fun e!862974 () Bool)

(declare-fun mapRes!58912 () Bool)

(assert (=> b!1550291 (= e!862972 (and e!862974 mapRes!58912))))

(declare-fun condMapEmpty!58912 () Bool)

(declare-datatypes ((V!59295 0))(
  ( (V!59296 (val!19147 Int)) )
))
(declare-datatypes ((ValueCell!18159 0))(
  ( (ValueCellFull!18159 (v!21948 V!59295)) (EmptyCell!18159) )
))
(declare-datatypes ((array!103474 0))(
  ( (array!103475 (arr!49939 (Array (_ BitVec 32) ValueCell!18159)) (size!50489 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103474)

(declare-fun mapDefault!58912 () ValueCell!18159)

(assert (=> b!1550291 (= condMapEmpty!58912 (= (arr!49939 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18159)) mapDefault!58912)))))

(declare-fun b!1550292 () Bool)

(declare-fun res!1061924 () Bool)

(declare-fun e!862975 () Bool)

(assert (=> b!1550292 (=> (not res!1061924) (not e!862975))))

(declare-datatypes ((array!103476 0))(
  ( (array!103477 (arr!49940 (Array (_ BitVec 32) (_ BitVec 64))) (size!50490 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103476)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550292 (= res!1061924 (validKeyInArray!0 (select (arr!49940 _keys!618) from!762)))))

(declare-fun b!1550293 () Bool)

(declare-fun e!862977 () Bool)

(declare-fun tp_is_empty!38139 () Bool)

(assert (=> b!1550293 (= e!862977 tp_is_empty!38139)))

(declare-fun b!1550294 () Bool)

(assert (=> b!1550294 (= e!862974 tp_is_empty!38139)))

(declare-fun b!1550295 () Bool)

(declare-datatypes ((tuple2!24672 0))(
  ( (tuple2!24673 (_1!12347 (_ BitVec 64)) (_2!12347 V!59295)) )
))
(declare-datatypes ((List!36154 0))(
  ( (Nil!36151) (Cons!36150 (h!37595 tuple2!24672) (t!50860 List!36154)) )
))
(declare-datatypes ((ListLongMap!22281 0))(
  ( (ListLongMap!22282 (toList!11156 List!36154)) )
))
(declare-fun e!862976 () ListLongMap!22281)

(declare-fun e!862973 () ListLongMap!22281)

(assert (=> b!1550295 (= e!862976 e!862973)))

(declare-fun c!142550 () Bool)

(declare-fun lt!668253 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1550295 (= c!142550 (and (not lt!668253) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550296 () Bool)

(declare-fun e!862979 () ListLongMap!22281)

(declare-fun call!70710 () ListLongMap!22281)

(assert (=> b!1550296 (= e!862979 call!70710)))

(declare-fun mapIsEmpty!58912 () Bool)

(assert (=> mapIsEmpty!58912 mapRes!58912))

(declare-fun b!1550297 () Bool)

(declare-fun call!70711 () ListLongMap!22281)

(assert (=> b!1550297 (= e!862979 call!70711)))

(declare-fun bm!70706 () Bool)

(declare-fun call!70712 () ListLongMap!22281)

(assert (=> bm!70706 (= call!70710 call!70712)))

(declare-fun b!1550298 () Bool)

(declare-fun res!1061926 () Bool)

(declare-fun e!862980 () Bool)

(assert (=> b!1550298 (=> (not res!1061926) (not e!862980))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103476 (_ BitVec 32)) Bool)

(assert (=> b!1550298 (= res!1061926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550299 () Bool)

(assert (=> b!1550299 (= e!862980 e!862975)))

(declare-fun res!1061928 () Bool)

(assert (=> b!1550299 (=> (not res!1061928) (not e!862975))))

(assert (=> b!1550299 (= res!1061928 (bvslt from!762 (size!50490 _keys!618)))))

(declare-fun lt!668254 () ListLongMap!22281)

(assert (=> b!1550299 (= lt!668254 e!862976)))

(declare-fun c!142549 () Bool)

(assert (=> b!1550299 (= c!142549 (and (not lt!668253) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550299 (= lt!668253 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!70709 () ListLongMap!22281)

(declare-fun zeroValue!436 () V!59295)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70707 () Bool)

(declare-fun minValue!436 () V!59295)

(declare-fun getCurrentListMapNoExtraKeys!6606 (array!103476 array!103474 (_ BitVec 32) (_ BitVec 32) V!59295 V!59295 (_ BitVec 32) Int) ListLongMap!22281)

(assert (=> bm!70707 (= call!70709 (getCurrentListMapNoExtraKeys!6606 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550300 () Bool)

(declare-fun +!4981 (ListLongMap!22281 tuple2!24672) ListLongMap!22281)

(assert (=> b!1550300 (= e!862976 (+!4981 call!70712 (tuple2!24673 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550301 () Bool)

(assert (=> b!1550301 (= e!862973 call!70710)))

(declare-fun b!1550302 () Bool)

(assert (=> b!1550302 (= e!862975 false)))

(declare-fun lt!668255 () ListLongMap!22281)

(assert (=> b!1550302 (= lt!668255 (getCurrentListMapNoExtraKeys!6606 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550303 () Bool)

(declare-fun res!1061923 () Bool)

(assert (=> b!1550303 (=> (not res!1061923) (not e!862980))))

(assert (=> b!1550303 (= res!1061923 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50490 _keys!618))))))

(declare-fun res!1061922 () Bool)

(assert (=> start!132150 (=> (not res!1061922) (not e!862980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132150 (= res!1061922 (validMask!0 mask!926))))

(assert (=> start!132150 e!862980))

(declare-fun array_inv!38827 (array!103476) Bool)

(assert (=> start!132150 (array_inv!38827 _keys!618)))

(assert (=> start!132150 tp_is_empty!38139))

(assert (=> start!132150 true))

(assert (=> start!132150 tp!111840))

(declare-fun array_inv!38828 (array!103474) Bool)

(assert (=> start!132150 (and (array_inv!38828 _values!470) e!862972)))

(declare-fun b!1550304 () Bool)

(declare-fun res!1061925 () Bool)

(assert (=> b!1550304 (=> (not res!1061925) (not e!862980))))

(assert (=> b!1550304 (= res!1061925 (and (= (size!50489 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50490 _keys!618) (size!50489 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70708 () Bool)

(declare-fun call!70713 () ListLongMap!22281)

(assert (=> bm!70708 (= call!70711 call!70713)))

(declare-fun bm!70709 () Bool)

(assert (=> bm!70709 (= call!70712 (+!4981 (ite c!142549 call!70709 (ite c!142550 call!70713 call!70711)) (ite (or c!142549 c!142550) (tuple2!24673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24673 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550305 () Bool)

(declare-fun c!142548 () Bool)

(assert (=> b!1550305 (= c!142548 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668253))))

(assert (=> b!1550305 (= e!862973 e!862979)))

(declare-fun b!1550306 () Bool)

(declare-fun res!1061927 () Bool)

(assert (=> b!1550306 (=> (not res!1061927) (not e!862980))))

(declare-datatypes ((List!36155 0))(
  ( (Nil!36152) (Cons!36151 (h!37596 (_ BitVec 64)) (t!50861 List!36155)) )
))
(declare-fun arrayNoDuplicates!0 (array!103476 (_ BitVec 32) List!36155) Bool)

(assert (=> b!1550306 (= res!1061927 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36152))))

(declare-fun bm!70710 () Bool)

(assert (=> bm!70710 (= call!70713 call!70709)))

(declare-fun mapNonEmpty!58912 () Bool)

(declare-fun tp!111841 () Bool)

(assert (=> mapNonEmpty!58912 (= mapRes!58912 (and tp!111841 e!862977))))

(declare-fun mapValue!58912 () ValueCell!18159)

(declare-fun mapRest!58912 () (Array (_ BitVec 32) ValueCell!18159))

(declare-fun mapKey!58912 () (_ BitVec 32))

(assert (=> mapNonEmpty!58912 (= (arr!49939 _values!470) (store mapRest!58912 mapKey!58912 mapValue!58912))))

(assert (= (and start!132150 res!1061922) b!1550304))

(assert (= (and b!1550304 res!1061925) b!1550298))

(assert (= (and b!1550298 res!1061926) b!1550306))

(assert (= (and b!1550306 res!1061927) b!1550303))

(assert (= (and b!1550303 res!1061923) b!1550299))

(assert (= (and b!1550299 c!142549) b!1550300))

(assert (= (and b!1550299 (not c!142549)) b!1550295))

(assert (= (and b!1550295 c!142550) b!1550301))

(assert (= (and b!1550295 (not c!142550)) b!1550305))

(assert (= (and b!1550305 c!142548) b!1550296))

(assert (= (and b!1550305 (not c!142548)) b!1550297))

(assert (= (or b!1550296 b!1550297) bm!70708))

(assert (= (or b!1550301 bm!70708) bm!70710))

(assert (= (or b!1550301 b!1550296) bm!70706))

(assert (= (or b!1550300 bm!70710) bm!70707))

(assert (= (or b!1550300 bm!70706) bm!70709))

(assert (= (and b!1550299 res!1061928) b!1550292))

(assert (= (and b!1550292 res!1061924) b!1550302))

(assert (= (and b!1550291 condMapEmpty!58912) mapIsEmpty!58912))

(assert (= (and b!1550291 (not condMapEmpty!58912)) mapNonEmpty!58912))

(get-info :version)

(assert (= (and mapNonEmpty!58912 ((_ is ValueCellFull!18159) mapValue!58912)) b!1550293))

(assert (= (and b!1550291 ((_ is ValueCellFull!18159) mapDefault!58912)) b!1550294))

(assert (= start!132150 b!1550291))

(declare-fun m!1429283 () Bool)

(assert (=> b!1550298 m!1429283))

(declare-fun m!1429285 () Bool)

(assert (=> bm!70709 m!1429285))

(declare-fun m!1429287 () Bool)

(assert (=> b!1550306 m!1429287))

(declare-fun m!1429289 () Bool)

(assert (=> mapNonEmpty!58912 m!1429289))

(declare-fun m!1429291 () Bool)

(assert (=> b!1550300 m!1429291))

(declare-fun m!1429293 () Bool)

(assert (=> b!1550302 m!1429293))

(declare-fun m!1429295 () Bool)

(assert (=> b!1550292 m!1429295))

(assert (=> b!1550292 m!1429295))

(declare-fun m!1429297 () Bool)

(assert (=> b!1550292 m!1429297))

(declare-fun m!1429299 () Bool)

(assert (=> start!132150 m!1429299))

(declare-fun m!1429301 () Bool)

(assert (=> start!132150 m!1429301))

(declare-fun m!1429303 () Bool)

(assert (=> start!132150 m!1429303))

(assert (=> bm!70707 m!1429293))

(check-sat b_and!51285 (not mapNonEmpty!58912) (not b!1550300) (not start!132150) (not b!1550306) tp_is_empty!38139 (not b!1550292) (not b!1550302) (not bm!70709) (not b_next!31863) (not b!1550298) (not bm!70707))
(check-sat b_and!51285 (not b_next!31863))
