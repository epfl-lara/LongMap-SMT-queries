; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73986 () Bool)

(assert start!73986)

(declare-fun b_free!14901 () Bool)

(declare-fun b_next!14901 () Bool)

(assert (=> start!73986 (= b_free!14901 (not b_next!14901))))

(declare-fun tp!52206 () Bool)

(declare-fun b_and!24653 () Bool)

(assert (=> start!73986 (= tp!52206 b_and!24653)))

(declare-fun b!869871 () Bool)

(declare-fun e!484411 () Bool)

(declare-fun e!484410 () Bool)

(assert (=> b!869871 (= e!484411 e!484410)))

(declare-fun res!591178 () Bool)

(assert (=> b!869871 (=> (not res!591178) (not e!484410))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869871 (= res!591178 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27763 0))(
  ( (V!27764 (val!8566 Int)) )
))
(declare-datatypes ((tuple2!11380 0))(
  ( (tuple2!11381 (_1!5701 (_ BitVec 64)) (_2!5701 V!27763)) )
))
(declare-datatypes ((List!17171 0))(
  ( (Nil!17168) (Cons!17167 (h!18298 tuple2!11380) (t!24208 List!17171)) )
))
(declare-datatypes ((ListLongMap!10149 0))(
  ( (ListLongMap!10150 (toList!5090 List!17171)) )
))
(declare-fun lt!394946 () ListLongMap!10149)

(declare-datatypes ((ValueCell!8079 0))(
  ( (ValueCellFull!8079 (v!10991 V!27763)) (EmptyCell!8079) )
))
(declare-datatypes ((array!50220 0))(
  ( (array!50221 (arr!24141 (Array (_ BitVec 32) ValueCell!8079)) (size!24581 (_ BitVec 32))) )
))
(declare-fun lt!394945 () array!50220)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50222 0))(
  ( (array!50223 (arr!24142 (Array (_ BitVec 32) (_ BitVec 64))) (size!24582 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50222)

(declare-fun minValue!654 () V!27763)

(declare-fun zeroValue!654 () V!27763)

(declare-fun getCurrentListMapNoExtraKeys!3059 (array!50222 array!50220 (_ BitVec 32) (_ BitVec 32) V!27763 V!27763 (_ BitVec 32) Int) ListLongMap!10149)

(assert (=> b!869871 (= lt!394946 (getCurrentListMapNoExtraKeys!3059 _keys!868 lt!394945 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27763)

(declare-fun _values!688 () array!50220)

(assert (=> b!869871 (= lt!394945 (array!50221 (store (arr!24141 _values!688) i!612 (ValueCellFull!8079 v!557)) (size!24581 _values!688)))))

(declare-fun lt!394948 () ListLongMap!10149)

(assert (=> b!869871 (= lt!394948 (getCurrentListMapNoExtraKeys!3059 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869872 () Bool)

(declare-fun res!591181 () Bool)

(assert (=> b!869872 (=> (not res!591181) (not e!484411))))

(assert (=> b!869872 (= res!591181 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24582 _keys!868))))))

(declare-fun b!869873 () Bool)

(declare-fun res!591185 () Bool)

(assert (=> b!869873 (=> (not res!591185) (not e!484411))))

(declare-datatypes ((List!17172 0))(
  ( (Nil!17169) (Cons!17168 (h!18299 (_ BitVec 64)) (t!24209 List!17172)) )
))
(declare-fun arrayNoDuplicates!0 (array!50222 (_ BitVec 32) List!17172) Bool)

(assert (=> b!869873 (= res!591185 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17169))))

(declare-fun mapIsEmpty!27155 () Bool)

(declare-fun mapRes!27155 () Bool)

(assert (=> mapIsEmpty!27155 mapRes!27155))

(declare-fun b!869874 () Bool)

(declare-fun res!591182 () Bool)

(assert (=> b!869874 (=> (not res!591182) (not e!484411))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869874 (= res!591182 (validKeyInArray!0 k0!854))))

(declare-fun b!869875 () Bool)

(declare-fun e!484408 () Bool)

(declare-fun e!484407 () Bool)

(assert (=> b!869875 (= e!484408 (and e!484407 mapRes!27155))))

(declare-fun condMapEmpty!27155 () Bool)

(declare-fun mapDefault!27155 () ValueCell!8079)

(assert (=> b!869875 (= condMapEmpty!27155 (= (arr!24141 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8079)) mapDefault!27155)))))

(declare-fun b!869876 () Bool)

(declare-fun res!591184 () Bool)

(assert (=> b!869876 (=> (not res!591184) (not e!484411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50222 (_ BitVec 32)) Bool)

(assert (=> b!869876 (= res!591184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869877 () Bool)

(assert (=> b!869877 (= e!484410 (not true))))

(declare-fun +!2430 (ListLongMap!10149 tuple2!11380) ListLongMap!10149)

(assert (=> b!869877 (= (getCurrentListMapNoExtraKeys!3059 _keys!868 lt!394945 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2430 (getCurrentListMapNoExtraKeys!3059 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11381 k0!854 v!557)))))

(declare-datatypes ((Unit!29858 0))(
  ( (Unit!29859) )
))
(declare-fun lt!394947 () Unit!29858)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!624 (array!50222 array!50220 (_ BitVec 32) (_ BitVec 32) V!27763 V!27763 (_ BitVec 32) (_ BitVec 64) V!27763 (_ BitVec 32) Int) Unit!29858)

(assert (=> b!869877 (= lt!394947 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!624 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869878 () Bool)

(declare-fun res!591177 () Bool)

(assert (=> b!869878 (=> (not res!591177) (not e!484411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869878 (= res!591177 (validMask!0 mask!1196))))

(declare-fun b!869879 () Bool)

(declare-fun e!484409 () Bool)

(declare-fun tp_is_empty!17037 () Bool)

(assert (=> b!869879 (= e!484409 tp_is_empty!17037)))

(declare-fun b!869880 () Bool)

(assert (=> b!869880 (= e!484407 tp_is_empty!17037)))

(declare-fun b!869881 () Bool)

(declare-fun res!591180 () Bool)

(assert (=> b!869881 (=> (not res!591180) (not e!484411))))

(assert (=> b!869881 (= res!591180 (and (= (select (arr!24142 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!591179 () Bool)

(assert (=> start!73986 (=> (not res!591179) (not e!484411))))

(assert (=> start!73986 (= res!591179 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24582 _keys!868))))))

(assert (=> start!73986 e!484411))

(assert (=> start!73986 tp_is_empty!17037))

(assert (=> start!73986 true))

(assert (=> start!73986 tp!52206))

(declare-fun array_inv!19070 (array!50222) Bool)

(assert (=> start!73986 (array_inv!19070 _keys!868)))

(declare-fun array_inv!19071 (array!50220) Bool)

(assert (=> start!73986 (and (array_inv!19071 _values!688) e!484408)))

(declare-fun b!869882 () Bool)

(declare-fun res!591183 () Bool)

(assert (=> b!869882 (=> (not res!591183) (not e!484411))))

(assert (=> b!869882 (= res!591183 (and (= (size!24581 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24582 _keys!868) (size!24581 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27155 () Bool)

(declare-fun tp!52207 () Bool)

(assert (=> mapNonEmpty!27155 (= mapRes!27155 (and tp!52207 e!484409))))

(declare-fun mapRest!27155 () (Array (_ BitVec 32) ValueCell!8079))

(declare-fun mapValue!27155 () ValueCell!8079)

(declare-fun mapKey!27155 () (_ BitVec 32))

(assert (=> mapNonEmpty!27155 (= (arr!24141 _values!688) (store mapRest!27155 mapKey!27155 mapValue!27155))))

(assert (= (and start!73986 res!591179) b!869878))

(assert (= (and b!869878 res!591177) b!869882))

(assert (= (and b!869882 res!591183) b!869876))

(assert (= (and b!869876 res!591184) b!869873))

(assert (= (and b!869873 res!591185) b!869872))

(assert (= (and b!869872 res!591181) b!869874))

(assert (= (and b!869874 res!591182) b!869881))

(assert (= (and b!869881 res!591180) b!869871))

(assert (= (and b!869871 res!591178) b!869877))

(assert (= (and b!869875 condMapEmpty!27155) mapIsEmpty!27155))

(assert (= (and b!869875 (not condMapEmpty!27155)) mapNonEmpty!27155))

(get-info :version)

(assert (= (and mapNonEmpty!27155 ((_ is ValueCellFull!8079) mapValue!27155)) b!869879))

(assert (= (and b!869875 ((_ is ValueCellFull!8079) mapDefault!27155)) b!869880))

(assert (= start!73986 b!869875))

(declare-fun m!811337 () Bool)

(assert (=> start!73986 m!811337))

(declare-fun m!811339 () Bool)

(assert (=> start!73986 m!811339))

(declare-fun m!811341 () Bool)

(assert (=> b!869871 m!811341))

(declare-fun m!811343 () Bool)

(assert (=> b!869871 m!811343))

(declare-fun m!811345 () Bool)

(assert (=> b!869871 m!811345))

(declare-fun m!811347 () Bool)

(assert (=> b!869877 m!811347))

(declare-fun m!811349 () Bool)

(assert (=> b!869877 m!811349))

(assert (=> b!869877 m!811349))

(declare-fun m!811351 () Bool)

(assert (=> b!869877 m!811351))

(declare-fun m!811353 () Bool)

(assert (=> b!869877 m!811353))

(declare-fun m!811355 () Bool)

(assert (=> b!869874 m!811355))

(declare-fun m!811357 () Bool)

(assert (=> b!869876 m!811357))

(declare-fun m!811359 () Bool)

(assert (=> b!869878 m!811359))

(declare-fun m!811361 () Bool)

(assert (=> b!869881 m!811361))

(declare-fun m!811363 () Bool)

(assert (=> b!869873 m!811363))

(declare-fun m!811365 () Bool)

(assert (=> mapNonEmpty!27155 m!811365))

(check-sat (not b!869873) tp_is_empty!17037 (not b!869876) b_and!24653 (not b!869874) (not b_next!14901) (not b!869871) (not start!73986) (not b!869877) (not mapNonEmpty!27155) (not b!869878))
(check-sat b_and!24653 (not b_next!14901))
