; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74328 () Bool)

(assert start!74328)

(declare-fun b_free!15109 () Bool)

(declare-fun b_next!15109 () Bool)

(assert (=> start!74328 (= b_free!15109 (not b_next!15109))))

(declare-fun tp!53003 () Bool)

(declare-fun b_and!24859 () Bool)

(assert (=> start!74328 (= tp!53003 b_and!24859)))

(declare-fun mapIsEmpty!27638 () Bool)

(declare-fun mapRes!27638 () Bool)

(assert (=> mapIsEmpty!27638 mapRes!27638))

(declare-fun b!874740 () Bool)

(declare-fun res!594533 () Bool)

(declare-fun e!486970 () Bool)

(assert (=> b!874740 (=> (not res!594533) (not e!486970))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50815 0))(
  ( (array!50816 (arr!24436 (Array (_ BitVec 32) (_ BitVec 64))) (size!24878 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50815)

(assert (=> b!874740 (= res!594533 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24878 _keys!868))))))

(declare-fun b!874742 () Bool)

(declare-fun res!594534 () Bool)

(assert (=> b!874742 (=> (not res!594534) (not e!486970))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28185 0))(
  ( (V!28186 (val!8724 Int)) )
))
(declare-datatypes ((ValueCell!8237 0))(
  ( (ValueCellFull!8237 (v!11147 V!28185)) (EmptyCell!8237) )
))
(declare-datatypes ((array!50817 0))(
  ( (array!50818 (arr!24437 (Array (_ BitVec 32) ValueCell!8237)) (size!24879 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50817)

(assert (=> b!874742 (= res!594534 (and (= (size!24879 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24878 _keys!868) (size!24879 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun lt!395811 () array!50817)

(declare-datatypes ((tuple2!11532 0))(
  ( (tuple2!11533 (_1!5777 (_ BitVec 64)) (_2!5777 V!28185)) )
))
(declare-datatypes ((List!17346 0))(
  ( (Nil!17343) (Cons!17342 (h!18473 tuple2!11532) (t!24378 List!17346)) )
))
(declare-datatypes ((ListLongMap!10291 0))(
  ( (ListLongMap!10292 (toList!5161 List!17346)) )
))
(declare-fun call!38526 () ListLongMap!10291)

(declare-fun bm!38523 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28185)

(declare-fun zeroValue!654 () V!28185)

(declare-fun getCurrentListMapNoExtraKeys!3154 (array!50815 array!50817 (_ BitVec 32) (_ BitVec 32) V!28185 V!28185 (_ BitVec 32) Int) ListLongMap!10291)

(assert (=> bm!38523 (= call!38526 (getCurrentListMapNoExtraKeys!3154 _keys!868 lt!395811 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!874743 () Bool)

(declare-fun call!38527 () ListLongMap!10291)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun e!486968 () Bool)

(declare-fun v!557 () V!28185)

(declare-fun +!2493 (ListLongMap!10291 tuple2!11532) ListLongMap!10291)

(assert (=> b!874743 (= e!486968 (= call!38526 (+!2493 call!38527 (tuple2!11533 k0!854 v!557))))))

(declare-fun b!874744 () Bool)

(assert (=> b!874744 (= e!486968 (= call!38526 call!38527))))

(declare-fun b!874745 () Bool)

(declare-fun e!486973 () Bool)

(declare-fun e!486971 () Bool)

(assert (=> b!874745 (= e!486973 (and e!486971 mapRes!27638))))

(declare-fun condMapEmpty!27638 () Bool)

(declare-fun mapDefault!27638 () ValueCell!8237)

(assert (=> b!874745 (= condMapEmpty!27638 (= (arr!24437 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8237)) mapDefault!27638)))))

(declare-fun bm!38524 () Bool)

(assert (=> bm!38524 (= call!38527 (getCurrentListMapNoExtraKeys!3154 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!874746 () Bool)

(declare-fun tp_is_empty!17353 () Bool)

(assert (=> b!874746 (= e!486971 tp_is_empty!17353)))

(declare-fun b!874747 () Bool)

(declare-fun res!594527 () Bool)

(assert (=> b!874747 (=> (not res!594527) (not e!486970))))

(assert (=> b!874747 (= res!594527 (and (= (select (arr!24436 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874748 () Bool)

(declare-fun e!486967 () Bool)

(assert (=> b!874748 (= e!486970 e!486967)))

(declare-fun res!594529 () Bool)

(assert (=> b!874748 (=> (not res!594529) (not e!486967))))

(assert (=> b!874748 (= res!594529 (= from!1053 i!612))))

(declare-fun lt!395808 () ListLongMap!10291)

(assert (=> b!874748 (= lt!395808 (getCurrentListMapNoExtraKeys!3154 _keys!868 lt!395811 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!874748 (= lt!395811 (array!50818 (store (arr!24437 _values!688) i!612 (ValueCellFull!8237 v!557)) (size!24879 _values!688)))))

(declare-fun lt!395809 () ListLongMap!10291)

(assert (=> b!874748 (= lt!395809 (getCurrentListMapNoExtraKeys!3154 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27638 () Bool)

(declare-fun tp!53002 () Bool)

(declare-fun e!486972 () Bool)

(assert (=> mapNonEmpty!27638 (= mapRes!27638 (and tp!53002 e!486972))))

(declare-fun mapValue!27638 () ValueCell!8237)

(declare-fun mapKey!27638 () (_ BitVec 32))

(declare-fun mapRest!27638 () (Array (_ BitVec 32) ValueCell!8237))

(assert (=> mapNonEmpty!27638 (= (arr!24437 _values!688) (store mapRest!27638 mapKey!27638 mapValue!27638))))

(declare-fun b!874749 () Bool)

(declare-fun res!594535 () Bool)

(assert (=> b!874749 (=> (not res!594535) (not e!486970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50815 (_ BitVec 32)) Bool)

(assert (=> b!874749 (= res!594535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!594531 () Bool)

(assert (=> start!74328 (=> (not res!594531) (not e!486970))))

(assert (=> start!74328 (= res!594531 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24878 _keys!868))))))

(assert (=> start!74328 e!486970))

(assert (=> start!74328 tp_is_empty!17353))

(assert (=> start!74328 true))

(assert (=> start!74328 tp!53003))

(declare-fun array_inv!19320 (array!50815) Bool)

(assert (=> start!74328 (array_inv!19320 _keys!868)))

(declare-fun array_inv!19321 (array!50817) Bool)

(assert (=> start!74328 (and (array_inv!19321 _values!688) e!486973)))

(declare-fun b!874741 () Bool)

(declare-fun res!594528 () Bool)

(assert (=> b!874741 (=> (not res!594528) (not e!486970))))

(declare-datatypes ((List!17347 0))(
  ( (Nil!17344) (Cons!17343 (h!18474 (_ BitVec 64)) (t!24379 List!17347)) )
))
(declare-fun arrayNoDuplicates!0 (array!50815 (_ BitVec 32) List!17347) Bool)

(assert (=> b!874741 (= res!594528 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17344))))

(declare-fun b!874750 () Bool)

(declare-fun res!594530 () Bool)

(assert (=> b!874750 (=> (not res!594530) (not e!486970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874750 (= res!594530 (validMask!0 mask!1196))))

(declare-fun b!874751 () Bool)

(declare-fun res!594532 () Bool)

(assert (=> b!874751 (=> (not res!594532) (not e!486970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874751 (= res!594532 (validKeyInArray!0 k0!854))))

(declare-fun b!874752 () Bool)

(assert (=> b!874752 (= e!486972 tp_is_empty!17353)))

(declare-fun b!874753 () Bool)

(assert (=> b!874753 (= e!486967 (not (bvslt from!1053 (size!24878 _keys!868))))))

(assert (=> b!874753 e!486968))

(declare-fun c!92412 () Bool)

(assert (=> b!874753 (= c!92412 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29879 0))(
  ( (Unit!29880) )
))
(declare-fun lt!395810 () Unit!29879)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!662 (array!50815 array!50817 (_ BitVec 32) (_ BitVec 32) V!28185 V!28185 (_ BitVec 32) (_ BitVec 64) V!28185 (_ BitVec 32) Int) Unit!29879)

(assert (=> b!874753 (= lt!395810 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!662 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74328 res!594531) b!874750))

(assert (= (and b!874750 res!594530) b!874742))

(assert (= (and b!874742 res!594534) b!874749))

(assert (= (and b!874749 res!594535) b!874741))

(assert (= (and b!874741 res!594528) b!874740))

(assert (= (and b!874740 res!594533) b!874751))

(assert (= (and b!874751 res!594532) b!874747))

(assert (= (and b!874747 res!594527) b!874748))

(assert (= (and b!874748 res!594529) b!874753))

(assert (= (and b!874753 c!92412) b!874743))

(assert (= (and b!874753 (not c!92412)) b!874744))

(assert (= (or b!874743 b!874744) bm!38523))

(assert (= (or b!874743 b!874744) bm!38524))

(assert (= (and b!874745 condMapEmpty!27638) mapIsEmpty!27638))

(assert (= (and b!874745 (not condMapEmpty!27638)) mapNonEmpty!27638))

(get-info :version)

(assert (= (and mapNonEmpty!27638 ((_ is ValueCellFull!8237) mapValue!27638)) b!874752))

(assert (= (and b!874745 ((_ is ValueCellFull!8237) mapDefault!27638)) b!874746))

(assert (= start!74328 b!874745))

(declare-fun m!814205 () Bool)

(assert (=> bm!38524 m!814205))

(declare-fun m!814207 () Bool)

(assert (=> start!74328 m!814207))

(declare-fun m!814209 () Bool)

(assert (=> start!74328 m!814209))

(declare-fun m!814211 () Bool)

(assert (=> b!874750 m!814211))

(declare-fun m!814213 () Bool)

(assert (=> b!874743 m!814213))

(declare-fun m!814215 () Bool)

(assert (=> mapNonEmpty!27638 m!814215))

(declare-fun m!814217 () Bool)

(assert (=> bm!38523 m!814217))

(declare-fun m!814219 () Bool)

(assert (=> b!874753 m!814219))

(declare-fun m!814221 () Bool)

(assert (=> b!874749 m!814221))

(declare-fun m!814223 () Bool)

(assert (=> b!874751 m!814223))

(declare-fun m!814225 () Bool)

(assert (=> b!874748 m!814225))

(declare-fun m!814227 () Bool)

(assert (=> b!874748 m!814227))

(declare-fun m!814229 () Bool)

(assert (=> b!874748 m!814229))

(declare-fun m!814231 () Bool)

(assert (=> b!874741 m!814231))

(declare-fun m!814233 () Bool)

(assert (=> b!874747 m!814233))

(check-sat b_and!24859 (not b!874743) tp_is_empty!17353 (not b!874753) (not b!874741) (not b_next!15109) (not bm!38524) (not mapNonEmpty!27638) (not b!874748) (not b!874751) (not b!874750) (not b!874749) (not start!74328) (not bm!38523))
(check-sat b_and!24859 (not b_next!15109))
