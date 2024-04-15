; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74334 () Bool)

(assert start!74334)

(declare-fun b_free!15115 () Bool)

(declare-fun b_next!15115 () Bool)

(assert (=> start!74334 (= b_free!15115 (not b_next!15115))))

(declare-fun tp!53020 () Bool)

(declare-fun b_and!24865 () Bool)

(assert (=> start!74334 (= tp!53020 b_and!24865)))

(declare-fun b!874868 () Bool)

(declare-fun e!487039 () Bool)

(declare-datatypes ((V!28193 0))(
  ( (V!28194 (val!8727 Int)) )
))
(declare-datatypes ((tuple2!11538 0))(
  ( (tuple2!11539 (_1!5780 (_ BitVec 64)) (_2!5780 V!28193)) )
))
(declare-datatypes ((List!17350 0))(
  ( (Nil!17347) (Cons!17346 (h!18477 tuple2!11538) (t!24382 List!17350)) )
))
(declare-datatypes ((ListLongMap!10297 0))(
  ( (ListLongMap!10298 (toList!5164 List!17350)) )
))
(declare-fun call!38545 () ListLongMap!10297)

(declare-fun call!38544 () ListLongMap!10297)

(assert (=> b!874868 (= e!487039 (= call!38545 call!38544))))

(declare-fun b!874869 () Bool)

(declare-fun res!594613 () Bool)

(declare-fun e!487036 () Bool)

(assert (=> b!874869 (=> (not res!594613) (not e!487036))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50827 0))(
  ( (array!50828 (arr!24442 (Array (_ BitVec 32) (_ BitVec 64))) (size!24884 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50827)

(declare-datatypes ((ValueCell!8240 0))(
  ( (ValueCellFull!8240 (v!11150 V!28193)) (EmptyCell!8240) )
))
(declare-datatypes ((array!50829 0))(
  ( (array!50830 (arr!24443 (Array (_ BitVec 32) ValueCell!8240)) (size!24885 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50829)

(assert (=> b!874869 (= res!594613 (and (= (size!24885 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24884 _keys!868) (size!24885 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874870 () Bool)

(declare-fun res!594612 () Bool)

(assert (=> b!874870 (=> (not res!594612) (not e!487036))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874870 (= res!594612 (and (= (select (arr!24442 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874871 () Bool)

(declare-fun res!594619 () Bool)

(assert (=> b!874871 (=> (not res!594619) (not e!487036))))

(assert (=> b!874871 (= res!594619 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24884 _keys!868))))))

(declare-fun res!594617 () Bool)

(assert (=> start!74334 (=> (not res!594617) (not e!487036))))

(assert (=> start!74334 (= res!594617 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24884 _keys!868))))))

(assert (=> start!74334 e!487036))

(declare-fun tp_is_empty!17359 () Bool)

(assert (=> start!74334 tp_is_empty!17359))

(assert (=> start!74334 true))

(assert (=> start!74334 tp!53020))

(declare-fun array_inv!19324 (array!50827) Bool)

(assert (=> start!74334 (array_inv!19324 _keys!868)))

(declare-fun e!487034 () Bool)

(declare-fun array_inv!19325 (array!50829) Bool)

(assert (=> start!74334 (and (array_inv!19325 _values!688) e!487034)))

(declare-fun b!874872 () Bool)

(declare-fun e!487037 () Bool)

(assert (=> b!874872 (= e!487036 e!487037)))

(declare-fun res!594610 () Bool)

(assert (=> b!874872 (=> (not res!594610) (not e!487037))))

(assert (=> b!874872 (= res!594610 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395846 () ListLongMap!10297)

(declare-fun minValue!654 () V!28193)

(declare-fun zeroValue!654 () V!28193)

(declare-fun lt!395847 () array!50829)

(declare-fun getCurrentListMapNoExtraKeys!3157 (array!50827 array!50829 (_ BitVec 32) (_ BitVec 32) V!28193 V!28193 (_ BitVec 32) Int) ListLongMap!10297)

(assert (=> b!874872 (= lt!395846 (getCurrentListMapNoExtraKeys!3157 _keys!868 lt!395847 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28193)

(assert (=> b!874872 (= lt!395847 (array!50830 (store (arr!24443 _values!688) i!612 (ValueCellFull!8240 v!557)) (size!24885 _values!688)))))

(declare-fun lt!395844 () ListLongMap!10297)

(assert (=> b!874872 (= lt!395844 (getCurrentListMapNoExtraKeys!3157 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874873 () Bool)

(declare-fun e!487038 () Bool)

(assert (=> b!874873 (= e!487038 tp_is_empty!17359)))

(declare-fun mapNonEmpty!27647 () Bool)

(declare-fun mapRes!27647 () Bool)

(declare-fun tp!53021 () Bool)

(assert (=> mapNonEmpty!27647 (= mapRes!27647 (and tp!53021 e!487038))))

(declare-fun mapKey!27647 () (_ BitVec 32))

(declare-fun mapRest!27647 () (Array (_ BitVec 32) ValueCell!8240))

(declare-fun mapValue!27647 () ValueCell!8240)

(assert (=> mapNonEmpty!27647 (= (arr!24443 _values!688) (store mapRest!27647 mapKey!27647 mapValue!27647))))

(declare-fun b!874874 () Bool)

(declare-fun e!487033 () Bool)

(assert (=> b!874874 (= e!487037 (not e!487033))))

(declare-fun res!594618 () Bool)

(assert (=> b!874874 (=> res!594618 e!487033)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874874 (= res!594618 (not (validKeyInArray!0 (select (arr!24442 _keys!868) from!1053))))))

(assert (=> b!874874 e!487039))

(declare-fun c!92421 () Bool)

(assert (=> b!874874 (= c!92421 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29883 0))(
  ( (Unit!29884) )
))
(declare-fun lt!395845 () Unit!29883)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!664 (array!50827 array!50829 (_ BitVec 32) (_ BitVec 32) V!28193 V!28193 (_ BitVec 32) (_ BitVec 64) V!28193 (_ BitVec 32) Int) Unit!29883)

(assert (=> b!874874 (= lt!395845 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!664 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!874875 () Bool)

(declare-fun e!487032 () Bool)

(assert (=> b!874875 (= e!487034 (and e!487032 mapRes!27647))))

(declare-fun condMapEmpty!27647 () Bool)

(declare-fun mapDefault!27647 () ValueCell!8240)

(assert (=> b!874875 (= condMapEmpty!27647 (= (arr!24443 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8240)) mapDefault!27647)))))

(declare-fun b!874876 () Bool)

(declare-fun res!594614 () Bool)

(assert (=> b!874876 (=> (not res!594614) (not e!487036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874876 (= res!594614 (validMask!0 mask!1196))))

(declare-fun b!874877 () Bool)

(declare-fun res!594615 () Bool)

(assert (=> b!874877 (=> (not res!594615) (not e!487036))))

(declare-datatypes ((List!17351 0))(
  ( (Nil!17348) (Cons!17347 (h!18478 (_ BitVec 64)) (t!24383 List!17351)) )
))
(declare-fun arrayNoDuplicates!0 (array!50827 (_ BitVec 32) List!17351) Bool)

(assert (=> b!874877 (= res!594615 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17348))))

(declare-fun bm!38541 () Bool)

(assert (=> bm!38541 (= call!38544 (getCurrentListMapNoExtraKeys!3157 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!874878 () Bool)

(assert (=> b!874878 (= e!487033 (bvslt i!612 (size!24885 _values!688)))))

(declare-fun b!874879 () Bool)

(declare-fun res!594616 () Bool)

(assert (=> b!874879 (=> (not res!594616) (not e!487036))))

(assert (=> b!874879 (= res!594616 (validKeyInArray!0 k0!854))))

(declare-fun bm!38542 () Bool)

(assert (=> bm!38542 (= call!38545 (getCurrentListMapNoExtraKeys!3157 _keys!868 lt!395847 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!874880 () Bool)

(declare-fun +!2495 (ListLongMap!10297 tuple2!11538) ListLongMap!10297)

(assert (=> b!874880 (= e!487039 (= call!38545 (+!2495 call!38544 (tuple2!11539 k0!854 v!557))))))

(declare-fun mapIsEmpty!27647 () Bool)

(assert (=> mapIsEmpty!27647 mapRes!27647))

(declare-fun b!874881 () Bool)

(declare-fun res!594611 () Bool)

(assert (=> b!874881 (=> (not res!594611) (not e!487036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50827 (_ BitVec 32)) Bool)

(assert (=> b!874881 (= res!594611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874882 () Bool)

(assert (=> b!874882 (= e!487032 tp_is_empty!17359)))

(assert (= (and start!74334 res!594617) b!874876))

(assert (= (and b!874876 res!594614) b!874869))

(assert (= (and b!874869 res!594613) b!874881))

(assert (= (and b!874881 res!594611) b!874877))

(assert (= (and b!874877 res!594615) b!874871))

(assert (= (and b!874871 res!594619) b!874879))

(assert (= (and b!874879 res!594616) b!874870))

(assert (= (and b!874870 res!594612) b!874872))

(assert (= (and b!874872 res!594610) b!874874))

(assert (= (and b!874874 c!92421) b!874880))

(assert (= (and b!874874 (not c!92421)) b!874868))

(assert (= (or b!874880 b!874868) bm!38542))

(assert (= (or b!874880 b!874868) bm!38541))

(assert (= (and b!874874 (not res!594618)) b!874878))

(assert (= (and b!874875 condMapEmpty!27647) mapIsEmpty!27647))

(assert (= (and b!874875 (not condMapEmpty!27647)) mapNonEmpty!27647))

(get-info :version)

(assert (= (and mapNonEmpty!27647 ((_ is ValueCellFull!8240) mapValue!27647)) b!874873))

(assert (= (and b!874875 ((_ is ValueCellFull!8240) mapDefault!27647)) b!874882))

(assert (= start!74334 b!874875))

(declare-fun m!814295 () Bool)

(assert (=> b!874872 m!814295))

(declare-fun m!814297 () Bool)

(assert (=> b!874872 m!814297))

(declare-fun m!814299 () Bool)

(assert (=> b!874872 m!814299))

(declare-fun m!814301 () Bool)

(assert (=> b!874879 m!814301))

(declare-fun m!814303 () Bool)

(assert (=> b!874876 m!814303))

(declare-fun m!814305 () Bool)

(assert (=> bm!38541 m!814305))

(declare-fun m!814307 () Bool)

(assert (=> b!874874 m!814307))

(assert (=> b!874874 m!814307))

(declare-fun m!814309 () Bool)

(assert (=> b!874874 m!814309))

(declare-fun m!814311 () Bool)

(assert (=> b!874874 m!814311))

(declare-fun m!814313 () Bool)

(assert (=> start!74334 m!814313))

(declare-fun m!814315 () Bool)

(assert (=> start!74334 m!814315))

(declare-fun m!814317 () Bool)

(assert (=> b!874877 m!814317))

(declare-fun m!814319 () Bool)

(assert (=> b!874881 m!814319))

(declare-fun m!814321 () Bool)

(assert (=> mapNonEmpty!27647 m!814321))

(declare-fun m!814323 () Bool)

(assert (=> b!874880 m!814323))

(declare-fun m!814325 () Bool)

(assert (=> bm!38542 m!814325))

(declare-fun m!814327 () Bool)

(assert (=> b!874870 m!814327))

(check-sat (not start!74334) (not mapNonEmpty!27647) tp_is_empty!17359 (not b!874874) (not b!874876) (not b!874881) (not b!874877) (not bm!38541) (not bm!38542) b_and!24865 (not b!874879) (not b!874872) (not b!874880) (not b_next!15115))
(check-sat b_and!24865 (not b_next!15115))
