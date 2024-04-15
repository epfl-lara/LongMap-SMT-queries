; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73948 () Bool)

(assert start!73948)

(declare-fun b_free!14881 () Bool)

(declare-fun b_next!14881 () Bool)

(assert (=> start!73948 (= b_free!14881 (not b_next!14881))))

(declare-fun tp!52147 () Bool)

(declare-fun b_and!24607 () Bool)

(assert (=> start!73948 (= tp!52147 b_and!24607)))

(declare-fun mapNonEmpty!27125 () Bool)

(declare-fun mapRes!27125 () Bool)

(declare-fun tp!52148 () Bool)

(declare-fun e!484079 () Bool)

(assert (=> mapNonEmpty!27125 (= mapRes!27125 (and tp!52148 e!484079))))

(declare-datatypes ((V!27737 0))(
  ( (V!27738 (val!8556 Int)) )
))
(declare-datatypes ((ValueCell!8069 0))(
  ( (ValueCellFull!8069 (v!10975 V!27737)) (EmptyCell!8069) )
))
(declare-fun mapRest!27125 () (Array (_ BitVec 32) ValueCell!8069))

(declare-fun mapValue!27125 () ValueCell!8069)

(declare-fun mapKey!27125 () (_ BitVec 32))

(declare-datatypes ((array!50171 0))(
  ( (array!50172 (arr!24117 (Array (_ BitVec 32) ValueCell!8069)) (size!24559 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50171)

(assert (=> mapNonEmpty!27125 (= (arr!24117 _values!688) (store mapRest!27125 mapKey!27125 mapValue!27125))))

(declare-fun b!869272 () Bool)

(declare-fun res!590798 () Bool)

(declare-fun e!484078 () Bool)

(assert (=> b!869272 (=> (not res!590798) (not e!484078))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50173 0))(
  ( (array!50174 (arr!24118 (Array (_ BitVec 32) (_ BitVec 64))) (size!24560 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50173)

(assert (=> b!869272 (= res!590798 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24560 _keys!868))))))

(declare-fun b!869273 () Bool)

(declare-fun e!484080 () Bool)

(declare-fun e!484083 () Bool)

(assert (=> b!869273 (= e!484080 (and e!484083 mapRes!27125))))

(declare-fun condMapEmpty!27125 () Bool)

(declare-fun mapDefault!27125 () ValueCell!8069)

(assert (=> b!869273 (= condMapEmpty!27125 (= (arr!24117 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8069)) mapDefault!27125)))))

(declare-fun b!869274 () Bool)

(declare-fun res!590803 () Bool)

(assert (=> b!869274 (=> (not res!590803) (not e!484078))))

(declare-datatypes ((List!17163 0))(
  ( (Nil!17160) (Cons!17159 (h!18290 (_ BitVec 64)) (t!24191 List!17163)) )
))
(declare-fun arrayNoDuplicates!0 (array!50173 (_ BitVec 32) List!17163) Bool)

(assert (=> b!869274 (= res!590803 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17160))))

(declare-fun b!869276 () Bool)

(declare-fun res!590800 () Bool)

(assert (=> b!869276 (=> (not res!590800) (not e!484078))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50173 (_ BitVec 32)) Bool)

(assert (=> b!869276 (= res!590800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869277 () Bool)

(declare-fun res!590802 () Bool)

(assert (=> b!869277 (=> (not res!590802) (not e!484078))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869277 (= res!590802 (validKeyInArray!0 k0!854))))

(declare-fun b!869278 () Bool)

(declare-fun tp_is_empty!17017 () Bool)

(assert (=> b!869278 (= e!484083 tp_is_empty!17017)))

(declare-fun b!869279 () Bool)

(declare-fun res!590805 () Bool)

(assert (=> b!869279 (=> (not res!590805) (not e!484078))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869279 (= res!590805 (and (= (size!24559 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24560 _keys!868) (size!24559 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27125 () Bool)

(assert (=> mapIsEmpty!27125 mapRes!27125))

(declare-fun b!869280 () Bool)

(declare-fun res!590799 () Bool)

(assert (=> b!869280 (=> (not res!590799) (not e!484078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869280 (= res!590799 (validMask!0 mask!1196))))

(declare-fun b!869281 () Bool)

(assert (=> b!869281 (= e!484079 tp_is_empty!17017)))

(declare-fun b!869282 () Bool)

(declare-fun e!484082 () Bool)

(assert (=> b!869282 (= e!484082 (not true))))

(declare-fun lt!394592 () array!50171)

(declare-fun v!557 () V!27737)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27737)

(declare-fun zeroValue!654 () V!27737)

(declare-datatypes ((tuple2!11378 0))(
  ( (tuple2!11379 (_1!5700 (_ BitVec 64)) (_2!5700 V!27737)) )
))
(declare-datatypes ((List!17164 0))(
  ( (Nil!17161) (Cons!17160 (h!18291 tuple2!11378) (t!24192 List!17164)) )
))
(declare-datatypes ((ListLongMap!10137 0))(
  ( (ListLongMap!10138 (toList!5084 List!17164)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3077 (array!50173 array!50171 (_ BitVec 32) (_ BitVec 32) V!27737 V!27737 (_ BitVec 32) Int) ListLongMap!10137)

(declare-fun +!2446 (ListLongMap!10137 tuple2!11378) ListLongMap!10137)

(assert (=> b!869282 (= (getCurrentListMapNoExtraKeys!3077 _keys!868 lt!394592 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2446 (getCurrentListMapNoExtraKeys!3077 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11379 k0!854 v!557)))))

(declare-datatypes ((Unit!29779 0))(
  ( (Unit!29780) )
))
(declare-fun lt!394591 () Unit!29779)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!614 (array!50173 array!50171 (_ BitVec 32) (_ BitVec 32) V!27737 V!27737 (_ BitVec 32) (_ BitVec 64) V!27737 (_ BitVec 32) Int) Unit!29779)

(assert (=> b!869282 (= lt!394591 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!614 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869283 () Bool)

(assert (=> b!869283 (= e!484078 e!484082)))

(declare-fun res!590797 () Bool)

(assert (=> b!869283 (=> (not res!590797) (not e!484082))))

(assert (=> b!869283 (= res!590797 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394589 () ListLongMap!10137)

(assert (=> b!869283 (= lt!394589 (getCurrentListMapNoExtraKeys!3077 _keys!868 lt!394592 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869283 (= lt!394592 (array!50172 (store (arr!24117 _values!688) i!612 (ValueCellFull!8069 v!557)) (size!24559 _values!688)))))

(declare-fun lt!394590 () ListLongMap!10137)

(assert (=> b!869283 (= lt!394590 (getCurrentListMapNoExtraKeys!3077 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869275 () Bool)

(declare-fun res!590801 () Bool)

(assert (=> b!869275 (=> (not res!590801) (not e!484078))))

(assert (=> b!869275 (= res!590801 (and (= (select (arr!24118 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!590804 () Bool)

(assert (=> start!73948 (=> (not res!590804) (not e!484078))))

(assert (=> start!73948 (= res!590804 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24560 _keys!868))))))

(assert (=> start!73948 e!484078))

(assert (=> start!73948 tp_is_empty!17017))

(assert (=> start!73948 true))

(assert (=> start!73948 tp!52147))

(declare-fun array_inv!19112 (array!50173) Bool)

(assert (=> start!73948 (array_inv!19112 _keys!868)))

(declare-fun array_inv!19113 (array!50171) Bool)

(assert (=> start!73948 (and (array_inv!19113 _values!688) e!484080)))

(assert (= (and start!73948 res!590804) b!869280))

(assert (= (and b!869280 res!590799) b!869279))

(assert (= (and b!869279 res!590805) b!869276))

(assert (= (and b!869276 res!590800) b!869274))

(assert (= (and b!869274 res!590803) b!869272))

(assert (= (and b!869272 res!590798) b!869277))

(assert (= (and b!869277 res!590802) b!869275))

(assert (= (and b!869275 res!590801) b!869283))

(assert (= (and b!869283 res!590797) b!869282))

(assert (= (and b!869273 condMapEmpty!27125) mapIsEmpty!27125))

(assert (= (and b!869273 (not condMapEmpty!27125)) mapNonEmpty!27125))

(get-info :version)

(assert (= (and mapNonEmpty!27125 ((_ is ValueCellFull!8069) mapValue!27125)) b!869281))

(assert (= (and b!869273 ((_ is ValueCellFull!8069) mapDefault!27125)) b!869278))

(assert (= start!73948 b!869273))

(declare-fun m!810279 () Bool)

(assert (=> b!869283 m!810279))

(declare-fun m!810281 () Bool)

(assert (=> b!869283 m!810281))

(declare-fun m!810283 () Bool)

(assert (=> b!869283 m!810283))

(declare-fun m!810285 () Bool)

(assert (=> mapNonEmpty!27125 m!810285))

(declare-fun m!810287 () Bool)

(assert (=> b!869282 m!810287))

(declare-fun m!810289 () Bool)

(assert (=> b!869282 m!810289))

(assert (=> b!869282 m!810289))

(declare-fun m!810291 () Bool)

(assert (=> b!869282 m!810291))

(declare-fun m!810293 () Bool)

(assert (=> b!869282 m!810293))

(declare-fun m!810295 () Bool)

(assert (=> b!869280 m!810295))

(declare-fun m!810297 () Bool)

(assert (=> b!869276 m!810297))

(declare-fun m!810299 () Bool)

(assert (=> b!869277 m!810299))

(declare-fun m!810301 () Bool)

(assert (=> b!869274 m!810301))

(declare-fun m!810303 () Bool)

(assert (=> start!73948 m!810303))

(declare-fun m!810305 () Bool)

(assert (=> start!73948 m!810305))

(declare-fun m!810307 () Bool)

(assert (=> b!869275 m!810307))

(check-sat (not b!869277) (not start!73948) (not b_next!14881) (not b!869280) tp_is_empty!17017 (not mapNonEmpty!27125) (not b!869283) b_and!24607 (not b!869276) (not b!869274) (not b!869282))
(check-sat b_and!24607 (not b_next!14881))
