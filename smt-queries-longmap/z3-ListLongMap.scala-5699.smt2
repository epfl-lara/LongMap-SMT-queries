; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73980 () Bool)

(assert start!73980)

(declare-fun b_free!14895 () Bool)

(declare-fun b_next!14895 () Bool)

(assert (=> start!73980 (= b_free!14895 (not b_next!14895))))

(declare-fun tp!52188 () Bool)

(declare-fun b_and!24647 () Bool)

(assert (=> start!73980 (= tp!52188 b_and!24647)))

(declare-fun b!869763 () Bool)

(declare-fun res!591099 () Bool)

(declare-fun e!484356 () Bool)

(assert (=> b!869763 (=> (not res!591099) (not e!484356))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869763 (= res!591099 (validMask!0 mask!1196))))

(declare-fun b!869764 () Bool)

(declare-fun res!591097 () Bool)

(assert (=> b!869764 (=> (not res!591097) (not e!484356))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869764 (= res!591097 (validKeyInArray!0 k0!854))))

(declare-fun b!869765 () Bool)

(declare-fun res!591096 () Bool)

(assert (=> b!869765 (=> (not res!591096) (not e!484356))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50208 0))(
  ( (array!50209 (arr!24135 (Array (_ BitVec 32) (_ BitVec 64))) (size!24575 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50208)

(declare-datatypes ((V!27755 0))(
  ( (V!27756 (val!8563 Int)) )
))
(declare-datatypes ((ValueCell!8076 0))(
  ( (ValueCellFull!8076 (v!10988 V!27755)) (EmptyCell!8076) )
))
(declare-datatypes ((array!50210 0))(
  ( (array!50211 (arr!24136 (Array (_ BitVec 32) ValueCell!8076)) (size!24576 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50210)

(assert (=> b!869765 (= res!591096 (and (= (size!24576 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24575 _keys!868) (size!24576 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869766 () Bool)

(declare-fun e!484353 () Bool)

(assert (=> b!869766 (= e!484356 e!484353)))

(declare-fun res!591098 () Bool)

(assert (=> b!869766 (=> (not res!591098) (not e!484353))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869766 (= res!591098 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394912 () array!50210)

(declare-datatypes ((tuple2!11378 0))(
  ( (tuple2!11379 (_1!5700 (_ BitVec 64)) (_2!5700 V!27755)) )
))
(declare-datatypes ((List!17168 0))(
  ( (Nil!17165) (Cons!17164 (h!18295 tuple2!11378) (t!24205 List!17168)) )
))
(declare-datatypes ((ListLongMap!10147 0))(
  ( (ListLongMap!10148 (toList!5089 List!17168)) )
))
(declare-fun lt!394909 () ListLongMap!10147)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27755)

(declare-fun zeroValue!654 () V!27755)

(declare-fun getCurrentListMapNoExtraKeys!3058 (array!50208 array!50210 (_ BitVec 32) (_ BitVec 32) V!27755 V!27755 (_ BitVec 32) Int) ListLongMap!10147)

(assert (=> b!869766 (= lt!394909 (getCurrentListMapNoExtraKeys!3058 _keys!868 lt!394912 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27755)

(assert (=> b!869766 (= lt!394912 (array!50211 (store (arr!24136 _values!688) i!612 (ValueCellFull!8076 v!557)) (size!24576 _values!688)))))

(declare-fun lt!394911 () ListLongMap!10147)

(assert (=> b!869766 (= lt!394911 (getCurrentListMapNoExtraKeys!3058 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869767 () Bool)

(declare-fun e!484355 () Bool)

(declare-fun tp_is_empty!17031 () Bool)

(assert (=> b!869767 (= e!484355 tp_is_empty!17031)))

(declare-fun b!869768 () Bool)

(declare-fun res!591104 () Bool)

(assert (=> b!869768 (=> (not res!591104) (not e!484356))))

(declare-datatypes ((List!17169 0))(
  ( (Nil!17166) (Cons!17165 (h!18296 (_ BitVec 64)) (t!24206 List!17169)) )
))
(declare-fun arrayNoDuplicates!0 (array!50208 (_ BitVec 32) List!17169) Bool)

(assert (=> b!869768 (= res!591104 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17166))))

(declare-fun res!591101 () Bool)

(assert (=> start!73980 (=> (not res!591101) (not e!484356))))

(assert (=> start!73980 (= res!591101 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24575 _keys!868))))))

(assert (=> start!73980 e!484356))

(assert (=> start!73980 tp_is_empty!17031))

(assert (=> start!73980 true))

(assert (=> start!73980 tp!52188))

(declare-fun array_inv!19066 (array!50208) Bool)

(assert (=> start!73980 (array_inv!19066 _keys!868)))

(declare-fun e!484357 () Bool)

(declare-fun array_inv!19067 (array!50210) Bool)

(assert (=> start!73980 (and (array_inv!19067 _values!688) e!484357)))

(declare-fun b!869769 () Bool)

(declare-fun res!591100 () Bool)

(assert (=> b!869769 (=> (not res!591100) (not e!484356))))

(assert (=> b!869769 (= res!591100 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24575 _keys!868))))))

(declare-fun mapNonEmpty!27146 () Bool)

(declare-fun mapRes!27146 () Bool)

(declare-fun tp!52189 () Bool)

(declare-fun e!484354 () Bool)

(assert (=> mapNonEmpty!27146 (= mapRes!27146 (and tp!52189 e!484354))))

(declare-fun mapKey!27146 () (_ BitVec 32))

(declare-fun mapValue!27146 () ValueCell!8076)

(declare-fun mapRest!27146 () (Array (_ BitVec 32) ValueCell!8076))

(assert (=> mapNonEmpty!27146 (= (arr!24136 _values!688) (store mapRest!27146 mapKey!27146 mapValue!27146))))

(declare-fun b!869770 () Bool)

(declare-fun res!591102 () Bool)

(assert (=> b!869770 (=> (not res!591102) (not e!484356))))

(assert (=> b!869770 (= res!591102 (and (= (select (arr!24135 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869771 () Bool)

(declare-fun res!591103 () Bool)

(assert (=> b!869771 (=> (not res!591103) (not e!484356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50208 (_ BitVec 32)) Bool)

(assert (=> b!869771 (= res!591103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869772 () Bool)

(assert (=> b!869772 (= e!484353 (not true))))

(declare-fun +!2429 (ListLongMap!10147 tuple2!11378) ListLongMap!10147)

(assert (=> b!869772 (= (getCurrentListMapNoExtraKeys!3058 _keys!868 lt!394912 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2429 (getCurrentListMapNoExtraKeys!3058 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11379 k0!854 v!557)))))

(declare-datatypes ((Unit!29856 0))(
  ( (Unit!29857) )
))
(declare-fun lt!394910 () Unit!29856)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!623 (array!50208 array!50210 (_ BitVec 32) (_ BitVec 32) V!27755 V!27755 (_ BitVec 32) (_ BitVec 64) V!27755 (_ BitVec 32) Int) Unit!29856)

(assert (=> b!869772 (= lt!394910 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!623 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869773 () Bool)

(assert (=> b!869773 (= e!484354 tp_is_empty!17031)))

(declare-fun mapIsEmpty!27146 () Bool)

(assert (=> mapIsEmpty!27146 mapRes!27146))

(declare-fun b!869774 () Bool)

(assert (=> b!869774 (= e!484357 (and e!484355 mapRes!27146))))

(declare-fun condMapEmpty!27146 () Bool)

(declare-fun mapDefault!27146 () ValueCell!8076)

(assert (=> b!869774 (= condMapEmpty!27146 (= (arr!24136 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8076)) mapDefault!27146)))))

(assert (= (and start!73980 res!591101) b!869763))

(assert (= (and b!869763 res!591099) b!869765))

(assert (= (and b!869765 res!591096) b!869771))

(assert (= (and b!869771 res!591103) b!869768))

(assert (= (and b!869768 res!591104) b!869769))

(assert (= (and b!869769 res!591100) b!869764))

(assert (= (and b!869764 res!591097) b!869770))

(assert (= (and b!869770 res!591102) b!869766))

(assert (= (and b!869766 res!591098) b!869772))

(assert (= (and b!869774 condMapEmpty!27146) mapIsEmpty!27146))

(assert (= (and b!869774 (not condMapEmpty!27146)) mapNonEmpty!27146))

(get-info :version)

(assert (= (and mapNonEmpty!27146 ((_ is ValueCellFull!8076) mapValue!27146)) b!869773))

(assert (= (and b!869774 ((_ is ValueCellFull!8076) mapDefault!27146)) b!869767))

(assert (= start!73980 b!869774))

(declare-fun m!811247 () Bool)

(assert (=> mapNonEmpty!27146 m!811247))

(declare-fun m!811249 () Bool)

(assert (=> b!869768 m!811249))

(declare-fun m!811251 () Bool)

(assert (=> b!869766 m!811251))

(declare-fun m!811253 () Bool)

(assert (=> b!869766 m!811253))

(declare-fun m!811255 () Bool)

(assert (=> b!869766 m!811255))

(declare-fun m!811257 () Bool)

(assert (=> b!869763 m!811257))

(declare-fun m!811259 () Bool)

(assert (=> b!869770 m!811259))

(declare-fun m!811261 () Bool)

(assert (=> start!73980 m!811261))

(declare-fun m!811263 () Bool)

(assert (=> start!73980 m!811263))

(declare-fun m!811265 () Bool)

(assert (=> b!869772 m!811265))

(declare-fun m!811267 () Bool)

(assert (=> b!869772 m!811267))

(assert (=> b!869772 m!811267))

(declare-fun m!811269 () Bool)

(assert (=> b!869772 m!811269))

(declare-fun m!811271 () Bool)

(assert (=> b!869772 m!811271))

(declare-fun m!811273 () Bool)

(assert (=> b!869764 m!811273))

(declare-fun m!811275 () Bool)

(assert (=> b!869771 m!811275))

(check-sat (not mapNonEmpty!27146) tp_is_empty!17031 (not b!869764) (not b!869772) b_and!24647 (not b!869768) (not start!73980) (not b_next!14895) (not b!869766) (not b!869763) (not b!869771))
(check-sat b_and!24647 (not b_next!14895))
