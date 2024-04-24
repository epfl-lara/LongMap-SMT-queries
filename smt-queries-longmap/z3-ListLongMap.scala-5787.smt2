; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74832 () Bool)

(assert start!74832)

(declare-fun b_free!15313 () Bool)

(declare-fun b_next!15313 () Bool)

(assert (=> start!74832 (= b_free!15313 (not b_next!15313))))

(declare-fun tp!53627 () Bool)

(declare-fun b_and!25255 () Bool)

(assert (=> start!74832 (= tp!53627 b_and!25255)))

(declare-fun mapNonEmpty!27957 () Bool)

(declare-fun mapRes!27957 () Bool)

(declare-fun tp!53628 () Bool)

(declare-fun e!490272 () Bool)

(assert (=> mapNonEmpty!27957 (= mapRes!27957 (and tp!53628 e!490272))))

(declare-datatypes ((V!28457 0))(
  ( (V!28458 (val!8826 Int)) )
))
(declare-datatypes ((ValueCell!8339 0))(
  ( (ValueCellFull!8339 (v!11274 V!28457)) (EmptyCell!8339) )
))
(declare-fun mapValue!27957 () ValueCell!8339)

(declare-fun mapRest!27957 () (Array (_ BitVec 32) ValueCell!8339))

(declare-fun mapKey!27957 () (_ BitVec 32))

(declare-datatypes ((array!51277 0))(
  ( (array!51278 (arr!24658 (Array (_ BitVec 32) ValueCell!8339)) (size!25099 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51277)

(assert (=> mapNonEmpty!27957 (= (arr!24658 _values!688) (store mapRest!27957 mapKey!27957 mapValue!27957))))

(declare-fun mapIsEmpty!27957 () Bool)

(assert (=> mapIsEmpty!27957 mapRes!27957))

(declare-fun b!880826 () Bool)

(declare-fun tp_is_empty!17557 () Bool)

(assert (=> b!880826 (= e!490272 tp_is_empty!17557)))

(declare-fun b!880827 () Bool)

(declare-fun e!490271 () Bool)

(assert (=> b!880827 (= e!490271 tp_is_empty!17557)))

(declare-fun b!880828 () Bool)

(declare-fun e!490268 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51279 0))(
  ( (array!51280 (arr!24659 (Array (_ BitVec 32) (_ BitVec 64))) (size!25100 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51279)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880828 (= e!490268 (or (not (= (select (arr!24659 _keys!868) from!1053) k0!854)) (bvsge (size!25100 _keys!868) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!25100 _keys!868))))))

(declare-datatypes ((tuple2!11614 0))(
  ( (tuple2!11615 (_1!5818 (_ BitVec 64)) (_2!5818 V!28457)) )
))
(declare-datatypes ((List!17446 0))(
  ( (Nil!17443) (Cons!17442 (h!18579 tuple2!11614) (t!24553 List!17446)) )
))
(declare-datatypes ((ListLongMap!10385 0))(
  ( (ListLongMap!10386 (toList!5208 List!17446)) )
))
(declare-fun lt!398214 () ListLongMap!10385)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398217 () ListLongMap!10385)

(declare-fun +!2525 (ListLongMap!10385 tuple2!11614) ListLongMap!10385)

(declare-fun get!12983 (ValueCell!8339 V!28457) V!28457)

(declare-fun dynLambda!1250 (Int (_ BitVec 64)) V!28457)

(assert (=> b!880828 (= lt!398217 (+!2525 lt!398214 (tuple2!11615 (select (arr!24659 _keys!868) from!1053) (get!12983 (select (arr!24658 _values!688) from!1053) (dynLambda!1250 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880829 () Bool)

(declare-fun res!598139 () Bool)

(declare-fun e!490270 () Bool)

(assert (=> b!880829 (=> (not res!598139) (not e!490270))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!880829 (= res!598139 (and (= (size!25099 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25100 _keys!868) (size!25099 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880830 () Bool)

(declare-fun res!598145 () Bool)

(assert (=> b!880830 (=> (not res!598145) (not e!490270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880830 (= res!598145 (validMask!0 mask!1196))))

(declare-fun b!880831 () Bool)

(declare-fun res!598138 () Bool)

(assert (=> b!880831 (=> (not res!598138) (not e!490270))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880831 (= res!598138 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25100 _keys!868))))))

(declare-fun b!880832 () Bool)

(declare-fun e!490267 () Bool)

(assert (=> b!880832 (= e!490267 (and e!490271 mapRes!27957))))

(declare-fun condMapEmpty!27957 () Bool)

(declare-fun mapDefault!27957 () ValueCell!8339)

(assert (=> b!880832 (= condMapEmpty!27957 (= (arr!24658 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8339)) mapDefault!27957)))))

(declare-fun b!880833 () Bool)

(declare-fun e!490266 () Bool)

(assert (=> b!880833 (= e!490270 e!490266)))

(declare-fun res!598144 () Bool)

(assert (=> b!880833 (=> (not res!598144) (not e!490266))))

(assert (=> b!880833 (= res!598144 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!28457)

(declare-fun zeroValue!654 () V!28457)

(declare-fun lt!398211 () array!51277)

(declare-fun getCurrentListMapNoExtraKeys!3250 (array!51279 array!51277 (_ BitVec 32) (_ BitVec 32) V!28457 V!28457 (_ BitVec 32) Int) ListLongMap!10385)

(assert (=> b!880833 (= lt!398217 (getCurrentListMapNoExtraKeys!3250 _keys!868 lt!398211 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28457)

(assert (=> b!880833 (= lt!398211 (array!51278 (store (arr!24658 _values!688) i!612 (ValueCellFull!8339 v!557)) (size!25099 _values!688)))))

(declare-fun lt!398216 () ListLongMap!10385)

(assert (=> b!880833 (= lt!398216 (getCurrentListMapNoExtraKeys!3250 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!598137 () Bool)

(assert (=> start!74832 (=> (not res!598137) (not e!490270))))

(assert (=> start!74832 (= res!598137 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25100 _keys!868))))))

(assert (=> start!74832 e!490270))

(assert (=> start!74832 tp_is_empty!17557))

(assert (=> start!74832 true))

(assert (=> start!74832 tp!53627))

(declare-fun array_inv!19466 (array!51279) Bool)

(assert (=> start!74832 (array_inv!19466 _keys!868)))

(declare-fun array_inv!19467 (array!51277) Bool)

(assert (=> start!74832 (and (array_inv!19467 _values!688) e!490267)))

(declare-fun b!880834 () Bool)

(declare-fun res!598136 () Bool)

(assert (=> b!880834 (=> (not res!598136) (not e!490270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880834 (= res!598136 (validKeyInArray!0 k0!854))))

(declare-fun b!880835 () Bool)

(assert (=> b!880835 (= e!490266 (not e!490268))))

(declare-fun res!598143 () Bool)

(assert (=> b!880835 (=> res!598143 e!490268)))

(assert (=> b!880835 (= res!598143 (not (validKeyInArray!0 (select (arr!24659 _keys!868) from!1053))))))

(declare-fun lt!398212 () ListLongMap!10385)

(assert (=> b!880835 (= lt!398212 lt!398214)))

(declare-fun lt!398213 () ListLongMap!10385)

(assert (=> b!880835 (= lt!398214 (+!2525 lt!398213 (tuple2!11615 k0!854 v!557)))))

(assert (=> b!880835 (= lt!398212 (getCurrentListMapNoExtraKeys!3250 _keys!868 lt!398211 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880835 (= lt!398213 (getCurrentListMapNoExtraKeys!3250 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30020 0))(
  ( (Unit!30021) )
))
(declare-fun lt!398215 () Unit!30020)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!692 (array!51279 array!51277 (_ BitVec 32) (_ BitVec 32) V!28457 V!28457 (_ BitVec 32) (_ BitVec 64) V!28457 (_ BitVec 32) Int) Unit!30020)

(assert (=> b!880835 (= lt!398215 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!692 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880836 () Bool)

(declare-fun res!598141 () Bool)

(assert (=> b!880836 (=> (not res!598141) (not e!490270))))

(assert (=> b!880836 (= res!598141 (and (= (select (arr!24659 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880837 () Bool)

(declare-fun res!598142 () Bool)

(assert (=> b!880837 (=> (not res!598142) (not e!490270))))

(declare-datatypes ((List!17447 0))(
  ( (Nil!17444) (Cons!17443 (h!18580 (_ BitVec 64)) (t!24554 List!17447)) )
))
(declare-fun arrayNoDuplicates!0 (array!51279 (_ BitVec 32) List!17447) Bool)

(assert (=> b!880837 (= res!598142 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17444))))

(declare-fun b!880838 () Bool)

(declare-fun res!598140 () Bool)

(assert (=> b!880838 (=> (not res!598140) (not e!490270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51279 (_ BitVec 32)) Bool)

(assert (=> b!880838 (= res!598140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74832 res!598137) b!880830))

(assert (= (and b!880830 res!598145) b!880829))

(assert (= (and b!880829 res!598139) b!880838))

(assert (= (and b!880838 res!598140) b!880837))

(assert (= (and b!880837 res!598142) b!880831))

(assert (= (and b!880831 res!598138) b!880834))

(assert (= (and b!880834 res!598136) b!880836))

(assert (= (and b!880836 res!598141) b!880833))

(assert (= (and b!880833 res!598144) b!880835))

(assert (= (and b!880835 (not res!598143)) b!880828))

(assert (= (and b!880832 condMapEmpty!27957) mapIsEmpty!27957))

(assert (= (and b!880832 (not condMapEmpty!27957)) mapNonEmpty!27957))

(get-info :version)

(assert (= (and mapNonEmpty!27957 ((_ is ValueCellFull!8339) mapValue!27957)) b!880826))

(assert (= (and b!880832 ((_ is ValueCellFull!8339) mapDefault!27957)) b!880827))

(assert (= start!74832 b!880832))

(declare-fun b_lambda!12435 () Bool)

(assert (=> (not b_lambda!12435) (not b!880828)))

(declare-fun t!24552 () Bool)

(declare-fun tb!4963 () Bool)

(assert (=> (and start!74832 (= defaultEntry!696 defaultEntry!696) t!24552) tb!4963))

(declare-fun result!9559 () Bool)

(assert (=> tb!4963 (= result!9559 tp_is_empty!17557)))

(assert (=> b!880828 t!24552))

(declare-fun b_and!25257 () Bool)

(assert (= b_and!25255 (and (=> t!24552 result!9559) b_and!25257)))

(declare-fun m!820979 () Bool)

(assert (=> b!880835 m!820979))

(declare-fun m!820981 () Bool)

(assert (=> b!880835 m!820981))

(declare-fun m!820983 () Bool)

(assert (=> b!880835 m!820983))

(declare-fun m!820985 () Bool)

(assert (=> b!880835 m!820985))

(assert (=> b!880835 m!820983))

(declare-fun m!820987 () Bool)

(assert (=> b!880835 m!820987))

(declare-fun m!820989 () Bool)

(assert (=> b!880835 m!820989))

(declare-fun m!820991 () Bool)

(assert (=> mapNonEmpty!27957 m!820991))

(declare-fun m!820993 () Bool)

(assert (=> b!880834 m!820993))

(declare-fun m!820995 () Bool)

(assert (=> start!74832 m!820995))

(declare-fun m!820997 () Bool)

(assert (=> start!74832 m!820997))

(declare-fun m!820999 () Bool)

(assert (=> b!880837 m!820999))

(declare-fun m!821001 () Bool)

(assert (=> b!880828 m!821001))

(declare-fun m!821003 () Bool)

(assert (=> b!880828 m!821003))

(declare-fun m!821005 () Bool)

(assert (=> b!880828 m!821005))

(declare-fun m!821007 () Bool)

(assert (=> b!880828 m!821007))

(assert (=> b!880828 m!821003))

(assert (=> b!880828 m!820983))

(assert (=> b!880828 m!821005))

(declare-fun m!821009 () Bool)

(assert (=> b!880830 m!821009))

(declare-fun m!821011 () Bool)

(assert (=> b!880836 m!821011))

(declare-fun m!821013 () Bool)

(assert (=> b!880838 m!821013))

(declare-fun m!821015 () Bool)

(assert (=> b!880833 m!821015))

(declare-fun m!821017 () Bool)

(assert (=> b!880833 m!821017))

(declare-fun m!821019 () Bool)

(assert (=> b!880833 m!821019))

(check-sat (not b!880835) (not b!880833) tp_is_empty!17557 (not b!880830) (not start!74832) (not b!880838) (not b!880828) (not mapNonEmpty!27957) (not b_lambda!12435) (not b_next!15313) (not b!880837) b_and!25257 (not b!880834))
(check-sat b_and!25257 (not b_next!15313))
