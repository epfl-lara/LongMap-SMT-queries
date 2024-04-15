; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73546 () Bool)

(assert start!73546)

(declare-fun b_free!14479 () Bool)

(declare-fun b_next!14479 () Bool)

(assert (=> start!73546 (= b_free!14479 (not b_next!14479))))

(declare-fun tp!50941 () Bool)

(declare-fun b_and!23911 () Bool)

(assert (=> start!73546 (= tp!50941 b_and!23911)))

(declare-fun b!860051 () Bool)

(declare-fun e!479238 () Bool)

(declare-fun e!479234 () Bool)

(declare-fun mapRes!26522 () Bool)

(assert (=> b!860051 (= e!479238 (and e!479234 mapRes!26522))))

(declare-fun condMapEmpty!26522 () Bool)

(declare-datatypes ((V!27201 0))(
  ( (V!27202 (val!8355 Int)) )
))
(declare-datatypes ((ValueCell!7868 0))(
  ( (ValueCellFull!7868 (v!10774 V!27201)) (EmptyCell!7868) )
))
(declare-datatypes ((array!49389 0))(
  ( (array!49390 (arr!23726 (Array (_ BitVec 32) ValueCell!7868)) (size!24168 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49389)

(declare-fun mapDefault!26522 () ValueCell!7868)

(assert (=> b!860051 (= condMapEmpty!26522 (= (arr!23726 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7868)) mapDefault!26522)))))

(declare-fun b!860052 () Bool)

(declare-fun e!479233 () Bool)

(declare-fun e!479235 () Bool)

(assert (=> b!860052 (= e!479233 e!479235)))

(declare-fun res!584519 () Bool)

(assert (=> b!860052 (=> res!584519 e!479235)))

(declare-datatypes ((array!49391 0))(
  ( (array!49392 (arr!23727 (Array (_ BitVec 32) (_ BitVec 64))) (size!24169 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49391)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!860052 (= res!584519 (not (= (select (arr!23727 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11044 0))(
  ( (tuple2!11045 (_1!5533 (_ BitVec 64)) (_2!5533 V!27201)) )
))
(declare-datatypes ((List!16845 0))(
  ( (Nil!16842) (Cons!16841 (h!17972 tuple2!11044) (t!23581 List!16845)) )
))
(declare-datatypes ((ListLongMap!9803 0))(
  ( (ListLongMap!9804 (toList!4917 List!16845)) )
))
(declare-fun lt!387515 () ListLongMap!9803)

(declare-fun lt!387514 () ListLongMap!9803)

(declare-fun +!2291 (ListLongMap!9803 tuple2!11044) ListLongMap!9803)

(declare-fun get!12512 (ValueCell!7868 V!27201) V!27201)

(declare-fun dynLambda!1105 (Int (_ BitVec 64)) V!27201)

(assert (=> b!860052 (= lt!387515 (+!2291 lt!387514 (tuple2!11045 (select (arr!23727 _keys!868) from!1053) (get!12512 (select (arr!23726 _values!688) from!1053) (dynLambda!1105 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!584520 () Bool)

(declare-fun e!479241 () Bool)

(assert (=> start!73546 (=> (not res!584520) (not e!479241))))

(assert (=> start!73546 (= res!584520 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24169 _keys!868))))))

(assert (=> start!73546 e!479241))

(declare-fun tp_is_empty!16615 () Bool)

(assert (=> start!73546 tp_is_empty!16615))

(assert (=> start!73546 true))

(assert (=> start!73546 tp!50941))

(declare-fun array_inv!18846 (array!49391) Bool)

(assert (=> start!73546 (array_inv!18846 _keys!868)))

(declare-fun array_inv!18847 (array!49389) Bool)

(assert (=> start!73546 (and (array_inv!18847 _values!688) e!479238)))

(declare-fun mapNonEmpty!26522 () Bool)

(declare-fun tp!50942 () Bool)

(declare-fun e!479236 () Bool)

(assert (=> mapNonEmpty!26522 (= mapRes!26522 (and tp!50942 e!479236))))

(declare-fun mapKey!26522 () (_ BitVec 32))

(declare-fun mapRest!26522 () (Array (_ BitVec 32) ValueCell!7868))

(declare-fun mapValue!26522 () ValueCell!7868)

(assert (=> mapNonEmpty!26522 (= (arr!23726 _values!688) (store mapRest!26522 mapKey!26522 mapValue!26522))))

(declare-fun b!860053 () Bool)

(declare-fun res!584510 () Bool)

(assert (=> b!860053 (=> (not res!584510) (not e!479241))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860053 (= res!584510 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24169 _keys!868))))))

(declare-fun b!860054 () Bool)

(declare-fun res!584507 () Bool)

(assert (=> b!860054 (=> (not res!584507) (not e!479241))))

(assert (=> b!860054 (= res!584507 (and (= (select (arr!23727 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860055 () Bool)

(declare-fun res!584514 () Bool)

(declare-fun e!479239 () Bool)

(assert (=> b!860055 (=> res!584514 e!479239)))

(declare-datatypes ((List!16846 0))(
  ( (Nil!16843) (Cons!16842 (h!17973 (_ BitVec 64)) (t!23582 List!16846)) )
))
(declare-fun noDuplicate!1317 (List!16846) Bool)

(assert (=> b!860055 (= res!584514 (not (noDuplicate!1317 Nil!16843)))))

(declare-fun b!860056 () Bool)

(declare-fun res!584513 () Bool)

(assert (=> b!860056 (=> (not res!584513) (not e!479241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860056 (= res!584513 (validKeyInArray!0 k0!854))))

(declare-fun b!860057 () Bool)

(assert (=> b!860057 (= e!479234 tp_is_empty!16615)))

(declare-fun b!860058 () Bool)

(declare-fun e!479240 () Bool)

(assert (=> b!860058 (= e!479240 (not e!479233))))

(declare-fun res!584508 () Bool)

(assert (=> b!860058 (=> res!584508 e!479233)))

(assert (=> b!860058 (= res!584508 (not (validKeyInArray!0 (select (arr!23727 _keys!868) from!1053))))))

(declare-fun lt!387513 () ListLongMap!9803)

(assert (=> b!860058 (= lt!387513 lt!387514)))

(declare-fun lt!387516 () ListLongMap!9803)

(declare-fun v!557 () V!27201)

(assert (=> b!860058 (= lt!387514 (+!2291 lt!387516 (tuple2!11045 k0!854 v!557)))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27201)

(declare-fun zeroValue!654 () V!27201)

(declare-fun lt!387511 () array!49389)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2921 (array!49391 array!49389 (_ BitVec 32) (_ BitVec 32) V!27201 V!27201 (_ BitVec 32) Int) ListLongMap!9803)

(assert (=> b!860058 (= lt!387513 (getCurrentListMapNoExtraKeys!2921 _keys!868 lt!387511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860058 (= lt!387516 (getCurrentListMapNoExtraKeys!2921 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29251 0))(
  ( (Unit!29252) )
))
(declare-fun lt!387512 () Unit!29251)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!483 (array!49391 array!49389 (_ BitVec 32) (_ BitVec 32) V!27201 V!27201 (_ BitVec 32) (_ BitVec 64) V!27201 (_ BitVec 32) Int) Unit!29251)

(assert (=> b!860058 (= lt!387512 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!483 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860059 () Bool)

(assert (=> b!860059 (= e!479236 tp_is_empty!16615)))

(declare-fun mapIsEmpty!26522 () Bool)

(assert (=> mapIsEmpty!26522 mapRes!26522))

(declare-fun b!860060 () Bool)

(declare-fun res!584517 () Bool)

(assert (=> b!860060 (=> (not res!584517) (not e!479241))))

(declare-fun arrayNoDuplicates!0 (array!49391 (_ BitVec 32) List!16846) Bool)

(assert (=> b!860060 (= res!584517 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16843))))

(declare-fun b!860061 () Bool)

(declare-fun res!584512 () Bool)

(assert (=> b!860061 (=> res!584512 e!479239)))

(declare-fun contains!4209 (List!16846 (_ BitVec 64)) Bool)

(assert (=> b!860061 (= res!584512 (contains!4209 Nil!16843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860062 () Bool)

(declare-fun res!584518 () Bool)

(assert (=> b!860062 (=> (not res!584518) (not e!479241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860062 (= res!584518 (validMask!0 mask!1196))))

(declare-fun b!860063 () Bool)

(assert (=> b!860063 (= e!479239 true)))

(declare-fun lt!387517 () Bool)

(assert (=> b!860063 (= lt!387517 (contains!4209 Nil!16843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860064 () Bool)

(assert (=> b!860064 (= e!479235 e!479239)))

(declare-fun res!584509 () Bool)

(assert (=> b!860064 (=> res!584509 e!479239)))

(assert (=> b!860064 (= res!584509 (or (bvsge (size!24169 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24169 _keys!868)) (bvsge from!1053 (size!24169 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860064 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387509 () Unit!29251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29251)

(assert (=> b!860064 (= lt!387509 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860064 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16843)))

(declare-fun lt!387510 () Unit!29251)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49391 (_ BitVec 32) (_ BitVec 32)) Unit!29251)

(assert (=> b!860064 (= lt!387510 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860065 () Bool)

(assert (=> b!860065 (= e!479241 e!479240)))

(declare-fun res!584516 () Bool)

(assert (=> b!860065 (=> (not res!584516) (not e!479240))))

(assert (=> b!860065 (= res!584516 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860065 (= lt!387515 (getCurrentListMapNoExtraKeys!2921 _keys!868 lt!387511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860065 (= lt!387511 (array!49390 (store (arr!23726 _values!688) i!612 (ValueCellFull!7868 v!557)) (size!24168 _values!688)))))

(declare-fun lt!387518 () ListLongMap!9803)

(assert (=> b!860065 (= lt!387518 (getCurrentListMapNoExtraKeys!2921 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860066 () Bool)

(declare-fun res!584515 () Bool)

(assert (=> b!860066 (=> (not res!584515) (not e!479241))))

(assert (=> b!860066 (= res!584515 (and (= (size!24168 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24169 _keys!868) (size!24168 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860067 () Bool)

(declare-fun res!584511 () Bool)

(assert (=> b!860067 (=> (not res!584511) (not e!479241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49391 (_ BitVec 32)) Bool)

(assert (=> b!860067 (= res!584511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73546 res!584520) b!860062))

(assert (= (and b!860062 res!584518) b!860066))

(assert (= (and b!860066 res!584515) b!860067))

(assert (= (and b!860067 res!584511) b!860060))

(assert (= (and b!860060 res!584517) b!860053))

(assert (= (and b!860053 res!584510) b!860056))

(assert (= (and b!860056 res!584513) b!860054))

(assert (= (and b!860054 res!584507) b!860065))

(assert (= (and b!860065 res!584516) b!860058))

(assert (= (and b!860058 (not res!584508)) b!860052))

(assert (= (and b!860052 (not res!584519)) b!860064))

(assert (= (and b!860064 (not res!584509)) b!860055))

(assert (= (and b!860055 (not res!584514)) b!860061))

(assert (= (and b!860061 (not res!584512)) b!860063))

(assert (= (and b!860051 condMapEmpty!26522) mapIsEmpty!26522))

(assert (= (and b!860051 (not condMapEmpty!26522)) mapNonEmpty!26522))

(get-info :version)

(assert (= (and mapNonEmpty!26522 ((_ is ValueCellFull!7868) mapValue!26522)) b!860059))

(assert (= (and b!860051 ((_ is ValueCellFull!7868) mapDefault!26522)) b!860057))

(assert (= start!73546 b!860051))

(declare-fun b_lambda!11813 () Bool)

(assert (=> (not b_lambda!11813) (not b!860052)))

(declare-fun t!23580 () Bool)

(declare-fun tb!4593 () Bool)

(assert (=> (and start!73546 (= defaultEntry!696 defaultEntry!696) t!23580) tb!4593))

(declare-fun result!8805 () Bool)

(assert (=> tb!4593 (= result!8805 tp_is_empty!16615)))

(assert (=> b!860052 t!23580))

(declare-fun b_and!23913 () Bool)

(assert (= b_and!23911 (and (=> t!23580 result!8805) b_and!23913)))

(declare-fun m!800331 () Bool)

(assert (=> b!860060 m!800331))

(declare-fun m!800333 () Bool)

(assert (=> b!860065 m!800333))

(declare-fun m!800335 () Bool)

(assert (=> b!860065 m!800335))

(declare-fun m!800337 () Bool)

(assert (=> b!860065 m!800337))

(declare-fun m!800339 () Bool)

(assert (=> b!860058 m!800339))

(declare-fun m!800341 () Bool)

(assert (=> b!860058 m!800341))

(declare-fun m!800343 () Bool)

(assert (=> b!860058 m!800343))

(assert (=> b!860058 m!800341))

(declare-fun m!800345 () Bool)

(assert (=> b!860058 m!800345))

(declare-fun m!800347 () Bool)

(assert (=> b!860058 m!800347))

(declare-fun m!800349 () Bool)

(assert (=> b!860058 m!800349))

(declare-fun m!800351 () Bool)

(assert (=> b!860063 m!800351))

(declare-fun m!800353 () Bool)

(assert (=> mapNonEmpty!26522 m!800353))

(declare-fun m!800355 () Bool)

(assert (=> b!860061 m!800355))

(declare-fun m!800357 () Bool)

(assert (=> b!860056 m!800357))

(declare-fun m!800359 () Bool)

(assert (=> start!73546 m!800359))

(declare-fun m!800361 () Bool)

(assert (=> start!73546 m!800361))

(declare-fun m!800363 () Bool)

(assert (=> b!860064 m!800363))

(declare-fun m!800365 () Bool)

(assert (=> b!860064 m!800365))

(declare-fun m!800367 () Bool)

(assert (=> b!860064 m!800367))

(declare-fun m!800369 () Bool)

(assert (=> b!860064 m!800369))

(declare-fun m!800371 () Bool)

(assert (=> b!860062 m!800371))

(declare-fun m!800373 () Bool)

(assert (=> b!860054 m!800373))

(declare-fun m!800375 () Bool)

(assert (=> b!860055 m!800375))

(declare-fun m!800377 () Bool)

(assert (=> b!860052 m!800377))

(declare-fun m!800379 () Bool)

(assert (=> b!860052 m!800379))

(declare-fun m!800381 () Bool)

(assert (=> b!860052 m!800381))

(declare-fun m!800383 () Bool)

(assert (=> b!860052 m!800383))

(assert (=> b!860052 m!800379))

(assert (=> b!860052 m!800341))

(assert (=> b!860052 m!800381))

(declare-fun m!800385 () Bool)

(assert (=> b!860067 m!800385))

(check-sat (not b_next!14479) (not b!860055) (not b!860065) (not b!860064) b_and!23913 (not b!860060) (not b!860063) (not start!73546) (not b!860061) (not mapNonEmpty!26522) (not b!860062) (not b!860058) (not b_lambda!11813) tp_is_empty!16615 (not b!860056) (not b!860052) (not b!860067))
(check-sat b_and!23913 (not b_next!14479))
