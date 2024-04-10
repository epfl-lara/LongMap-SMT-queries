; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73896 () Bool)

(assert start!73896)

(declare-fun b_free!14811 () Bool)

(declare-fun b_next!14811 () Bool)

(assert (=> start!73896 (= b_free!14811 (not b_next!14811))))

(declare-fun tp!51937 () Bool)

(declare-fun b_and!24563 () Bool)

(assert (=> start!73896 (= tp!51937 b_and!24563)))

(declare-fun b!868251 () Bool)

(declare-fun res!589965 () Bool)

(declare-fun e!483601 () Bool)

(assert (=> b!868251 (=> (not res!589965) (not e!483601))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50050 0))(
  ( (array!50051 (arr!24056 (Array (_ BitVec 32) (_ BitVec 64))) (size!24496 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50050)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!868251 (= res!589965 (and (= (select (arr!24056 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868252 () Bool)

(declare-fun res!589963 () Bool)

(assert (=> b!868252 (=> (not res!589963) (not e!483601))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50050 (_ BitVec 32)) Bool)

(assert (=> b!868252 (= res!589963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868253 () Bool)

(declare-fun res!589964 () Bool)

(assert (=> b!868253 (=> (not res!589964) (not e!483601))))

(declare-datatypes ((List!17107 0))(
  ( (Nil!17104) (Cons!17103 (h!18234 (_ BitVec 64)) (t!24144 List!17107)) )
))
(declare-fun arrayNoDuplicates!0 (array!50050 (_ BitVec 32) List!17107) Bool)

(assert (=> b!868253 (= res!589964 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17104))))

(declare-fun b!868254 () Bool)

(declare-fun e!483596 () Bool)

(assert (=> b!868254 (= e!483601 e!483596)))

(declare-fun res!589962 () Bool)

(assert (=> b!868254 (=> (not res!589962) (not e!483596))))

(assert (=> b!868254 (= res!589962 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27643 0))(
  ( (V!27644 (val!8521 Int)) )
))
(declare-datatypes ((ValueCell!8034 0))(
  ( (ValueCellFull!8034 (v!10946 V!27643)) (EmptyCell!8034) )
))
(declare-datatypes ((array!50052 0))(
  ( (array!50053 (arr!24057 (Array (_ BitVec 32) ValueCell!8034)) (size!24497 (_ BitVec 32))) )
))
(declare-fun lt!394407 () array!50052)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11310 0))(
  ( (tuple2!11311 (_1!5666 (_ BitVec 64)) (_2!5666 V!27643)) )
))
(declare-datatypes ((List!17108 0))(
  ( (Nil!17105) (Cons!17104 (h!18235 tuple2!11310) (t!24145 List!17108)) )
))
(declare-datatypes ((ListLongMap!10079 0))(
  ( (ListLongMap!10080 (toList!5055 List!17108)) )
))
(declare-fun lt!394406 () ListLongMap!10079)

(declare-fun minValue!654 () V!27643)

(declare-fun zeroValue!654 () V!27643)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3024 (array!50050 array!50052 (_ BitVec 32) (_ BitVec 32) V!27643 V!27643 (_ BitVec 32) Int) ListLongMap!10079)

(assert (=> b!868254 (= lt!394406 (getCurrentListMapNoExtraKeys!3024 _keys!868 lt!394407 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!50052)

(declare-fun v!557 () V!27643)

(assert (=> b!868254 (= lt!394407 (array!50053 (store (arr!24057 _values!688) i!612 (ValueCellFull!8034 v!557)) (size!24497 _values!688)))))

(declare-fun lt!394408 () ListLongMap!10079)

(assert (=> b!868254 (= lt!394408 (getCurrentListMapNoExtraKeys!3024 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868255 () Bool)

(declare-fun res!589968 () Bool)

(assert (=> b!868255 (=> (not res!589968) (not e!483601))))

(assert (=> b!868255 (= res!589968 (and (= (size!24497 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24496 _keys!868) (size!24497 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868256 () Bool)

(declare-fun res!589970 () Bool)

(assert (=> b!868256 (=> (not res!589970) (not e!483601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868256 (= res!589970 (validMask!0 mask!1196))))

(declare-fun res!589967 () Bool)

(assert (=> start!73896 (=> (not res!589967) (not e!483601))))

(assert (=> start!73896 (= res!589967 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24496 _keys!868))))))

(assert (=> start!73896 e!483601))

(declare-fun tp_is_empty!16947 () Bool)

(assert (=> start!73896 tp_is_empty!16947))

(assert (=> start!73896 true))

(assert (=> start!73896 tp!51937))

(declare-fun array_inv!19008 (array!50050) Bool)

(assert (=> start!73896 (array_inv!19008 _keys!868)))

(declare-fun e!483599 () Bool)

(declare-fun array_inv!19009 (array!50052) Bool)

(assert (=> start!73896 (and (array_inv!19009 _values!688) e!483599)))

(declare-fun b!868257 () Bool)

(declare-fun res!589969 () Bool)

(assert (=> b!868257 (=> (not res!589969) (not e!483601))))

(assert (=> b!868257 (= res!589969 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24496 _keys!868))))))

(declare-fun mapIsEmpty!27020 () Bool)

(declare-fun mapRes!27020 () Bool)

(assert (=> mapIsEmpty!27020 mapRes!27020))

(declare-fun b!868258 () Bool)

(assert (=> b!868258 (= e!483596 (not true))))

(declare-fun +!2398 (ListLongMap!10079 tuple2!11310) ListLongMap!10079)

(assert (=> b!868258 (= (getCurrentListMapNoExtraKeys!3024 _keys!868 lt!394407 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2398 (getCurrentListMapNoExtraKeys!3024 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11311 k0!854 v!557)))))

(declare-datatypes ((Unit!29794 0))(
  ( (Unit!29795) )
))
(declare-fun lt!394405 () Unit!29794)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!592 (array!50050 array!50052 (_ BitVec 32) (_ BitVec 32) V!27643 V!27643 (_ BitVec 32) (_ BitVec 64) V!27643 (_ BitVec 32) Int) Unit!29794)

(assert (=> b!868258 (= lt!394405 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!592 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868259 () Bool)

(declare-fun res!589966 () Bool)

(assert (=> b!868259 (=> (not res!589966) (not e!483601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868259 (= res!589966 (validKeyInArray!0 k0!854))))

(declare-fun b!868260 () Bool)

(declare-fun e!483598 () Bool)

(assert (=> b!868260 (= e!483598 tp_is_empty!16947)))

(declare-fun b!868261 () Bool)

(declare-fun e!483597 () Bool)

(assert (=> b!868261 (= e!483599 (and e!483597 mapRes!27020))))

(declare-fun condMapEmpty!27020 () Bool)

(declare-fun mapDefault!27020 () ValueCell!8034)

(assert (=> b!868261 (= condMapEmpty!27020 (= (arr!24057 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8034)) mapDefault!27020)))))

(declare-fun b!868262 () Bool)

(assert (=> b!868262 (= e!483597 tp_is_empty!16947)))

(declare-fun mapNonEmpty!27020 () Bool)

(declare-fun tp!51936 () Bool)

(assert (=> mapNonEmpty!27020 (= mapRes!27020 (and tp!51936 e!483598))))

(declare-fun mapKey!27020 () (_ BitVec 32))

(declare-fun mapValue!27020 () ValueCell!8034)

(declare-fun mapRest!27020 () (Array (_ BitVec 32) ValueCell!8034))

(assert (=> mapNonEmpty!27020 (= (arr!24057 _values!688) (store mapRest!27020 mapKey!27020 mapValue!27020))))

(assert (= (and start!73896 res!589967) b!868256))

(assert (= (and b!868256 res!589970) b!868255))

(assert (= (and b!868255 res!589968) b!868252))

(assert (= (and b!868252 res!589963) b!868253))

(assert (= (and b!868253 res!589964) b!868257))

(assert (= (and b!868257 res!589969) b!868259))

(assert (= (and b!868259 res!589966) b!868251))

(assert (= (and b!868251 res!589965) b!868254))

(assert (= (and b!868254 res!589962) b!868258))

(assert (= (and b!868261 condMapEmpty!27020) mapIsEmpty!27020))

(assert (= (and b!868261 (not condMapEmpty!27020)) mapNonEmpty!27020))

(get-info :version)

(assert (= (and mapNonEmpty!27020 ((_ is ValueCellFull!8034) mapValue!27020)) b!868260))

(assert (= (and b!868261 ((_ is ValueCellFull!8034) mapDefault!27020)) b!868262))

(assert (= start!73896 b!868261))

(declare-fun m!809987 () Bool)

(assert (=> b!868258 m!809987))

(declare-fun m!809989 () Bool)

(assert (=> b!868258 m!809989))

(assert (=> b!868258 m!809989))

(declare-fun m!809991 () Bool)

(assert (=> b!868258 m!809991))

(declare-fun m!809993 () Bool)

(assert (=> b!868258 m!809993))

(declare-fun m!809995 () Bool)

(assert (=> b!868259 m!809995))

(declare-fun m!809997 () Bool)

(assert (=> mapNonEmpty!27020 m!809997))

(declare-fun m!809999 () Bool)

(assert (=> start!73896 m!809999))

(declare-fun m!810001 () Bool)

(assert (=> start!73896 m!810001))

(declare-fun m!810003 () Bool)

(assert (=> b!868252 m!810003))

(declare-fun m!810005 () Bool)

(assert (=> b!868254 m!810005))

(declare-fun m!810007 () Bool)

(assert (=> b!868254 m!810007))

(declare-fun m!810009 () Bool)

(assert (=> b!868254 m!810009))

(declare-fun m!810011 () Bool)

(assert (=> b!868256 m!810011))

(declare-fun m!810013 () Bool)

(assert (=> b!868251 m!810013))

(declare-fun m!810015 () Bool)

(assert (=> b!868253 m!810015))

(check-sat (not mapNonEmpty!27020) b_and!24563 (not b!868258) (not start!73896) tp_is_empty!16947 (not b!868256) (not b!868254) (not b!868252) (not b!868259) (not b!868253) (not b_next!14811))
(check-sat b_and!24563 (not b_next!14811))
