; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73468 () Bool)

(assert start!73468)

(declare-fun b_free!14401 () Bool)

(declare-fun b_next!14401 () Bool)

(assert (=> start!73468 (= b_free!14401 (not b_next!14401))))

(declare-fun tp!50707 () Bool)

(declare-fun b_and!23755 () Bool)

(assert (=> start!73468 (= tp!50707 b_and!23755)))

(declare-fun b!858174 () Bool)

(declare-fun res!583068 () Bool)

(declare-fun e!478253 () Bool)

(assert (=> b!858174 (=> (not res!583068) (not e!478253))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49241 0))(
  ( (array!49242 (arr!23652 (Array (_ BitVec 32) (_ BitVec 64))) (size!24094 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49241)

(assert (=> b!858174 (= res!583068 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24094 _keys!868))))))

(declare-fun b!858175 () Bool)

(declare-fun e!478250 () Bool)

(assert (=> b!858175 (= e!478250 true)))

(declare-datatypes ((V!27097 0))(
  ( (V!27098 (val!8316 Int)) )
))
(declare-datatypes ((tuple2!10984 0))(
  ( (tuple2!10985 (_1!5503 (_ BitVec 64)) (_2!5503 V!27097)) )
))
(declare-datatypes ((List!16784 0))(
  ( (Nil!16781) (Cons!16780 (h!17911 tuple2!10984) (t!23442 List!16784)) )
))
(declare-datatypes ((ListLongMap!9743 0))(
  ( (ListLongMap!9744 (toList!4887 List!16784)) )
))
(declare-fun lt!386468 () ListLongMap!9743)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!386472 () ListLongMap!9743)

(declare-datatypes ((ValueCell!7829 0))(
  ( (ValueCellFull!7829 (v!10735 V!27097)) (EmptyCell!7829) )
))
(declare-datatypes ((array!49243 0))(
  ( (array!49244 (arr!23653 (Array (_ BitVec 32) ValueCell!7829)) (size!24095 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49243)

(declare-fun +!2261 (ListLongMap!9743 tuple2!10984) ListLongMap!9743)

(declare-fun get!12461 (ValueCell!7829 V!27097) V!27097)

(declare-fun dynLambda!1080 (Int (_ BitVec 64)) V!27097)

(assert (=> b!858175 (= lt!386472 (+!2261 lt!386468 (tuple2!10985 (select (arr!23652 _keys!868) from!1053) (get!12461 (select (arr!23653 _values!688) from!1053) (dynLambda!1080 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858177 () Bool)

(declare-fun res!583059 () Bool)

(assert (=> b!858177 (=> (not res!583059) (not e!478253))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858177 (= res!583059 (validKeyInArray!0 k0!854))))

(declare-fun b!858178 () Bool)

(declare-fun e!478251 () Bool)

(declare-fun e!478249 () Bool)

(declare-fun mapRes!26405 () Bool)

(assert (=> b!858178 (= e!478251 (and e!478249 mapRes!26405))))

(declare-fun condMapEmpty!26405 () Bool)

(declare-fun mapDefault!26405 () ValueCell!7829)

(assert (=> b!858178 (= condMapEmpty!26405 (= (arr!23653 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7829)) mapDefault!26405)))))

(declare-fun b!858179 () Bool)

(declare-fun e!478252 () Bool)

(assert (=> b!858179 (= e!478252 (not e!478250))))

(declare-fun res!583065 () Bool)

(assert (=> b!858179 (=> res!583065 e!478250)))

(assert (=> b!858179 (= res!583065 (not (validKeyInArray!0 (select (arr!23652 _keys!868) from!1053))))))

(declare-fun lt!386474 () ListLongMap!9743)

(assert (=> b!858179 (= lt!386474 lt!386468)))

(declare-fun lt!386469 () ListLongMap!9743)

(declare-fun v!557 () V!27097)

(assert (=> b!858179 (= lt!386468 (+!2261 lt!386469 (tuple2!10985 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!386473 () array!49243)

(declare-fun minValue!654 () V!27097)

(declare-fun zeroValue!654 () V!27097)

(declare-fun getCurrentListMapNoExtraKeys!2893 (array!49241 array!49243 (_ BitVec 32) (_ BitVec 32) V!27097 V!27097 (_ BitVec 32) Int) ListLongMap!9743)

(assert (=> b!858179 (= lt!386474 (getCurrentListMapNoExtraKeys!2893 _keys!868 lt!386473 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858179 (= lt!386469 (getCurrentListMapNoExtraKeys!2893 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29189 0))(
  ( (Unit!29190) )
))
(declare-fun lt!386471 () Unit!29189)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!457 (array!49241 array!49243 (_ BitVec 32) (_ BitVec 32) V!27097 V!27097 (_ BitVec 32) (_ BitVec 64) V!27097 (_ BitVec 32) Int) Unit!29189)

(assert (=> b!858179 (= lt!386471 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!457 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858180 () Bool)

(declare-fun res!583066 () Bool)

(assert (=> b!858180 (=> (not res!583066) (not e!478253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858180 (= res!583066 (validMask!0 mask!1196))))

(declare-fun b!858181 () Bool)

(declare-fun res!583063 () Bool)

(assert (=> b!858181 (=> (not res!583063) (not e!478253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49241 (_ BitVec 32)) Bool)

(assert (=> b!858181 (= res!583063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858182 () Bool)

(declare-fun res!583062 () Bool)

(assert (=> b!858182 (=> (not res!583062) (not e!478253))))

(declare-datatypes ((List!16785 0))(
  ( (Nil!16782) (Cons!16781 (h!17912 (_ BitVec 64)) (t!23443 List!16785)) )
))
(declare-fun arrayNoDuplicates!0 (array!49241 (_ BitVec 32) List!16785) Bool)

(assert (=> b!858182 (= res!583062 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16782))))

(declare-fun mapIsEmpty!26405 () Bool)

(assert (=> mapIsEmpty!26405 mapRes!26405))

(declare-fun mapNonEmpty!26405 () Bool)

(declare-fun tp!50708 () Bool)

(declare-fun e!478254 () Bool)

(assert (=> mapNonEmpty!26405 (= mapRes!26405 (and tp!50708 e!478254))))

(declare-fun mapRest!26405 () (Array (_ BitVec 32) ValueCell!7829))

(declare-fun mapValue!26405 () ValueCell!7829)

(declare-fun mapKey!26405 () (_ BitVec 32))

(assert (=> mapNonEmpty!26405 (= (arr!23653 _values!688) (store mapRest!26405 mapKey!26405 mapValue!26405))))

(declare-fun b!858183 () Bool)

(declare-fun tp_is_empty!16537 () Bool)

(assert (=> b!858183 (= e!478249 tp_is_empty!16537)))

(declare-fun res!583064 () Bool)

(assert (=> start!73468 (=> (not res!583064) (not e!478253))))

(assert (=> start!73468 (= res!583064 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24094 _keys!868))))))

(assert (=> start!73468 e!478253))

(assert (=> start!73468 tp_is_empty!16537))

(assert (=> start!73468 true))

(assert (=> start!73468 tp!50707))

(declare-fun array_inv!18790 (array!49241) Bool)

(assert (=> start!73468 (array_inv!18790 _keys!868)))

(declare-fun array_inv!18791 (array!49243) Bool)

(assert (=> start!73468 (and (array_inv!18791 _values!688) e!478251)))

(declare-fun b!858176 () Bool)

(declare-fun res!583061 () Bool)

(assert (=> b!858176 (=> (not res!583061) (not e!478253))))

(assert (=> b!858176 (= res!583061 (and (= (size!24095 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24094 _keys!868) (size!24095 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858184 () Bool)

(assert (=> b!858184 (= e!478253 e!478252)))

(declare-fun res!583060 () Bool)

(assert (=> b!858184 (=> (not res!583060) (not e!478252))))

(assert (=> b!858184 (= res!583060 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858184 (= lt!386472 (getCurrentListMapNoExtraKeys!2893 _keys!868 lt!386473 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858184 (= lt!386473 (array!49244 (store (arr!23653 _values!688) i!612 (ValueCellFull!7829 v!557)) (size!24095 _values!688)))))

(declare-fun lt!386470 () ListLongMap!9743)

(assert (=> b!858184 (= lt!386470 (getCurrentListMapNoExtraKeys!2893 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858185 () Bool)

(assert (=> b!858185 (= e!478254 tp_is_empty!16537)))

(declare-fun b!858186 () Bool)

(declare-fun res!583067 () Bool)

(assert (=> b!858186 (=> (not res!583067) (not e!478253))))

(assert (=> b!858186 (= res!583067 (and (= (select (arr!23652 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73468 res!583064) b!858180))

(assert (= (and b!858180 res!583066) b!858176))

(assert (= (and b!858176 res!583061) b!858181))

(assert (= (and b!858181 res!583063) b!858182))

(assert (= (and b!858182 res!583062) b!858174))

(assert (= (and b!858174 res!583068) b!858177))

(assert (= (and b!858177 res!583059) b!858186))

(assert (= (and b!858186 res!583067) b!858184))

(assert (= (and b!858184 res!583060) b!858179))

(assert (= (and b!858179 (not res!583065)) b!858175))

(assert (= (and b!858178 condMapEmpty!26405) mapIsEmpty!26405))

(assert (= (and b!858178 (not condMapEmpty!26405)) mapNonEmpty!26405))

(get-info :version)

(assert (= (and mapNonEmpty!26405 ((_ is ValueCellFull!7829) mapValue!26405)) b!858185))

(assert (= (and b!858178 ((_ is ValueCellFull!7829) mapDefault!26405)) b!858183))

(assert (= start!73468 b!858178))

(declare-fun b_lambda!11735 () Bool)

(assert (=> (not b_lambda!11735) (not b!858175)))

(declare-fun t!23441 () Bool)

(declare-fun tb!4515 () Bool)

(assert (=> (and start!73468 (= defaultEntry!696 defaultEntry!696) t!23441) tb!4515))

(declare-fun result!8649 () Bool)

(assert (=> tb!4515 (= result!8649 tp_is_empty!16537)))

(assert (=> b!858175 t!23441))

(declare-fun b_and!23757 () Bool)

(assert (= b_and!23755 (and (=> t!23441 result!8649) b_and!23757)))

(declare-fun m!798369 () Bool)

(assert (=> b!858175 m!798369))

(declare-fun m!798371 () Bool)

(assert (=> b!858175 m!798371))

(declare-fun m!798373 () Bool)

(assert (=> b!858175 m!798373))

(declare-fun m!798375 () Bool)

(assert (=> b!858175 m!798375))

(assert (=> b!858175 m!798371))

(declare-fun m!798377 () Bool)

(assert (=> b!858175 m!798377))

(assert (=> b!858175 m!798373))

(declare-fun m!798379 () Bool)

(assert (=> b!858181 m!798379))

(declare-fun m!798381 () Bool)

(assert (=> b!858177 m!798381))

(declare-fun m!798383 () Bool)

(assert (=> start!73468 m!798383))

(declare-fun m!798385 () Bool)

(assert (=> start!73468 m!798385))

(declare-fun m!798387 () Bool)

(assert (=> b!858186 m!798387))

(declare-fun m!798389 () Bool)

(assert (=> b!858180 m!798389))

(declare-fun m!798391 () Bool)

(assert (=> b!858179 m!798391))

(assert (=> b!858179 m!798377))

(declare-fun m!798393 () Bool)

(assert (=> b!858179 m!798393))

(assert (=> b!858179 m!798377))

(declare-fun m!798395 () Bool)

(assert (=> b!858179 m!798395))

(declare-fun m!798397 () Bool)

(assert (=> b!858179 m!798397))

(declare-fun m!798399 () Bool)

(assert (=> b!858179 m!798399))

(declare-fun m!798401 () Bool)

(assert (=> b!858184 m!798401))

(declare-fun m!798403 () Bool)

(assert (=> b!858184 m!798403))

(declare-fun m!798405 () Bool)

(assert (=> b!858184 m!798405))

(declare-fun m!798407 () Bool)

(assert (=> mapNonEmpty!26405 m!798407))

(declare-fun m!798409 () Bool)

(assert (=> b!858182 m!798409))

(check-sat (not b!858177) (not b!858181) (not b!858180) (not b!858175) tp_is_empty!16537 (not b_lambda!11735) b_and!23757 (not mapNonEmpty!26405) (not b_next!14401) (not b!858179) (not b!858182) (not start!73468) (not b!858184))
(check-sat b_and!23757 (not b_next!14401))
