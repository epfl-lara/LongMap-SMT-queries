; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73732 () Bool)

(assert start!73732)

(declare-fun b_free!14479 () Bool)

(declare-fun b_next!14479 () Bool)

(assert (=> start!73732 (= b_free!14479 (not b_next!14479))))

(declare-fun tp!50941 () Bool)

(declare-fun b_and!23947 () Bool)

(assert (=> start!73732 (= tp!50941 b_and!23947)))

(declare-fun b!861193 () Bool)

(declare-fun res!584969 () Bool)

(declare-fun e!479969 () Bool)

(assert (=> b!861193 (=> (not res!584969) (not e!479969))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861193 (= res!584969 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26522 () Bool)

(declare-fun mapRes!26522 () Bool)

(assert (=> mapIsEmpty!26522 mapRes!26522))

(declare-fun res!584961 () Bool)

(assert (=> start!73732 (=> (not res!584961) (not e!479969))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49455 0))(
  ( (array!49456 (arr!23754 (Array (_ BitVec 32) (_ BitVec 64))) (size!24195 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49455)

(assert (=> start!73732 (= res!584961 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24195 _keys!868))))))

(assert (=> start!73732 e!479969))

(declare-fun tp_is_empty!16615 () Bool)

(assert (=> start!73732 tp_is_empty!16615))

(assert (=> start!73732 true))

(assert (=> start!73732 tp!50941))

(declare-fun array_inv!18854 (array!49455) Bool)

(assert (=> start!73732 (array_inv!18854 _keys!868)))

(declare-datatypes ((V!27201 0))(
  ( (V!27202 (val!8355 Int)) )
))
(declare-datatypes ((ValueCell!7868 0))(
  ( (ValueCellFull!7868 (v!10780 V!27201)) (EmptyCell!7868) )
))
(declare-datatypes ((array!49457 0))(
  ( (array!49458 (arr!23755 (Array (_ BitVec 32) ValueCell!7868)) (size!24196 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49457)

(declare-fun e!479971 () Bool)

(declare-fun array_inv!18855 (array!49457) Bool)

(assert (=> start!73732 (and (array_inv!18855 _values!688) e!479971)))

(declare-fun b!861194 () Bool)

(declare-fun res!584971 () Bool)

(assert (=> b!861194 (=> (not res!584971) (not e!479969))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861194 (= res!584971 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24195 _keys!868))))))

(declare-fun mapNonEmpty!26522 () Bool)

(declare-fun tp!50942 () Bool)

(declare-fun e!479964 () Bool)

(assert (=> mapNonEmpty!26522 (= mapRes!26522 (and tp!50942 e!479964))))

(declare-fun mapValue!26522 () ValueCell!7868)

(declare-fun mapKey!26522 () (_ BitVec 32))

(declare-fun mapRest!26522 () (Array (_ BitVec 32) ValueCell!7868))

(assert (=> mapNonEmpty!26522 (= (arr!23755 _values!688) (store mapRest!26522 mapKey!26522 mapValue!26522))))

(declare-fun b!861195 () Bool)

(declare-fun res!584974 () Bool)

(assert (=> b!861195 (=> (not res!584974) (not e!479969))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49455 (_ BitVec 32)) Bool)

(assert (=> b!861195 (= res!584974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861196 () Bool)

(declare-fun res!584966 () Bool)

(assert (=> b!861196 (=> (not res!584966) (not e!479969))))

(assert (=> b!861196 (= res!584966 (and (= (select (arr!23754 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861197 () Bool)

(declare-fun res!584973 () Bool)

(assert (=> b!861197 (=> (not res!584973) (not e!479969))))

(declare-datatypes ((List!16804 0))(
  ( (Nil!16801) (Cons!16800 (h!17937 (_ BitVec 64)) (t!23541 List!16804)) )
))
(declare-fun arrayNoDuplicates!0 (array!49455 (_ BitVec 32) List!16804) Bool)

(assert (=> b!861197 (= res!584973 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16801))))

(declare-fun b!861198 () Bool)

(declare-fun e!479963 () Bool)

(assert (=> b!861198 (= e!479963 tp_is_empty!16615)))

(declare-fun b!861199 () Bool)

(declare-fun res!584970 () Bool)

(declare-fun e!479967 () Bool)

(assert (=> b!861199 (=> res!584970 e!479967)))

(declare-fun noDuplicate!1315 (List!16804) Bool)

(assert (=> b!861199 (= res!584970 (not (noDuplicate!1315 Nil!16801)))))

(declare-fun b!861200 () Bool)

(assert (=> b!861200 (= e!479964 tp_is_empty!16615)))

(declare-fun b!861201 () Bool)

(declare-fun res!584962 () Bool)

(assert (=> b!861201 (=> (not res!584962) (not e!479969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861201 (= res!584962 (validMask!0 mask!1196))))

(declare-fun b!861202 () Bool)

(declare-fun e!479965 () Bool)

(assert (=> b!861202 (= e!479965 e!479967)))

(declare-fun res!584972 () Bool)

(assert (=> b!861202 (=> res!584972 e!479967)))

(assert (=> b!861202 (= res!584972 (or (bvsge (size!24195 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24195 _keys!868)) (bvsge from!1053 (size!24195 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861202 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29326 0))(
  ( (Unit!29327) )
))
(declare-fun lt!388114 () Unit!29326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29326)

(assert (=> b!861202 (= lt!388114 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!861202 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16801)))

(declare-fun lt!388108 () Unit!29326)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49455 (_ BitVec 32) (_ BitVec 32)) Unit!29326)

(assert (=> b!861202 (= lt!388108 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!861203 () Bool)

(declare-fun e!479966 () Bool)

(assert (=> b!861203 (= e!479966 e!479965)))

(declare-fun res!584965 () Bool)

(assert (=> b!861203 (=> res!584965 e!479965)))

(assert (=> b!861203 (= res!584965 (not (= (select (arr!23754 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!10964 0))(
  ( (tuple2!10965 (_1!5493 (_ BitVec 64)) (_2!5493 V!27201)) )
))
(declare-datatypes ((List!16805 0))(
  ( (Nil!16802) (Cons!16801 (h!17938 tuple2!10964) (t!23542 List!16805)) )
))
(declare-datatypes ((ListLongMap!9735 0))(
  ( (ListLongMap!9736 (toList!4883 List!16805)) )
))
(declare-fun lt!388107 () ListLongMap!9735)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388106 () ListLongMap!9735)

(declare-fun +!2287 (ListLongMap!9735 tuple2!10964) ListLongMap!9735)

(declare-fun get!12530 (ValueCell!7868 V!27201) V!27201)

(declare-fun dynLambda!1120 (Int (_ BitVec 64)) V!27201)

(assert (=> b!861203 (= lt!388106 (+!2287 lt!388107 (tuple2!10965 (select (arr!23754 _keys!868) from!1053) (get!12530 (select (arr!23755 _values!688) from!1053) (dynLambda!1120 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861204 () Bool)

(assert (=> b!861204 (= e!479971 (and e!479963 mapRes!26522))))

(declare-fun condMapEmpty!26522 () Bool)

(declare-fun mapDefault!26522 () ValueCell!7868)

(assert (=> b!861204 (= condMapEmpty!26522 (= (arr!23755 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7868)) mapDefault!26522)))))

(declare-fun b!861205 () Bool)

(declare-fun e!479968 () Bool)

(assert (=> b!861205 (= e!479969 e!479968)))

(declare-fun res!584963 () Bool)

(assert (=> b!861205 (=> (not res!584963) (not e!479968))))

(assert (=> b!861205 (= res!584963 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388111 () array!49457)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27201)

(declare-fun zeroValue!654 () V!27201)

(declare-fun getCurrentListMapNoExtraKeys!2936 (array!49455 array!49457 (_ BitVec 32) (_ BitVec 32) V!27201 V!27201 (_ BitVec 32) Int) ListLongMap!9735)

(assert (=> b!861205 (= lt!388106 (getCurrentListMapNoExtraKeys!2936 _keys!868 lt!388111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27201)

(assert (=> b!861205 (= lt!388111 (array!49458 (store (arr!23755 _values!688) i!612 (ValueCellFull!7868 v!557)) (size!24196 _values!688)))))

(declare-fun lt!388112 () ListLongMap!9735)

(assert (=> b!861205 (= lt!388112 (getCurrentListMapNoExtraKeys!2936 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861206 () Bool)

(declare-fun res!584968 () Bool)

(assert (=> b!861206 (=> (not res!584968) (not e!479969))))

(assert (=> b!861206 (= res!584968 (and (= (size!24196 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24195 _keys!868) (size!24196 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861207 () Bool)

(assert (=> b!861207 (= e!479967 true)))

(declare-fun lt!388110 () Bool)

(declare-fun contains!4210 (List!16804 (_ BitVec 64)) Bool)

(assert (=> b!861207 (= lt!388110 (contains!4210 Nil!16801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!861208 () Bool)

(assert (=> b!861208 (= e!479968 (not e!479966))))

(declare-fun res!584964 () Bool)

(assert (=> b!861208 (=> res!584964 e!479966)))

(assert (=> b!861208 (= res!584964 (not (validKeyInArray!0 (select (arr!23754 _keys!868) from!1053))))))

(declare-fun lt!388115 () ListLongMap!9735)

(assert (=> b!861208 (= lt!388115 lt!388107)))

(declare-fun lt!388109 () ListLongMap!9735)

(assert (=> b!861208 (= lt!388107 (+!2287 lt!388109 (tuple2!10965 k0!854 v!557)))))

(assert (=> b!861208 (= lt!388115 (getCurrentListMapNoExtraKeys!2936 _keys!868 lt!388111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861208 (= lt!388109 (getCurrentListMapNoExtraKeys!2936 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388113 () Unit!29326)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!478 (array!49455 array!49457 (_ BitVec 32) (_ BitVec 32) V!27201 V!27201 (_ BitVec 32) (_ BitVec 64) V!27201 (_ BitVec 32) Int) Unit!29326)

(assert (=> b!861208 (= lt!388113 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!478 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861209 () Bool)

(declare-fun res!584967 () Bool)

(assert (=> b!861209 (=> res!584967 e!479967)))

(assert (=> b!861209 (= res!584967 (contains!4210 Nil!16801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!73732 res!584961) b!861201))

(assert (= (and b!861201 res!584962) b!861206))

(assert (= (and b!861206 res!584968) b!861195))

(assert (= (and b!861195 res!584974) b!861197))

(assert (= (and b!861197 res!584973) b!861194))

(assert (= (and b!861194 res!584971) b!861193))

(assert (= (and b!861193 res!584969) b!861196))

(assert (= (and b!861196 res!584966) b!861205))

(assert (= (and b!861205 res!584963) b!861208))

(assert (= (and b!861208 (not res!584964)) b!861203))

(assert (= (and b!861203 (not res!584965)) b!861202))

(assert (= (and b!861202 (not res!584972)) b!861199))

(assert (= (and b!861199 (not res!584970)) b!861209))

(assert (= (and b!861209 (not res!584967)) b!861207))

(assert (= (and b!861204 condMapEmpty!26522) mapIsEmpty!26522))

(assert (= (and b!861204 (not condMapEmpty!26522)) mapNonEmpty!26522))

(get-info :version)

(assert (= (and mapNonEmpty!26522 ((_ is ValueCellFull!7868) mapValue!26522)) b!861200))

(assert (= (and b!861204 ((_ is ValueCellFull!7868) mapDefault!26522)) b!861198))

(assert (= start!73732 b!861204))

(declare-fun b_lambda!11845 () Bool)

(assert (=> (not b_lambda!11845) (not b!861203)))

(declare-fun t!23540 () Bool)

(declare-fun tb!4593 () Bool)

(assert (=> (and start!73732 (= defaultEntry!696 defaultEntry!696) t!23540) tb!4593))

(declare-fun result!8805 () Bool)

(assert (=> tb!4593 (= result!8805 tp_is_empty!16615)))

(assert (=> b!861203 t!23540))

(declare-fun b_and!23949 () Bool)

(assert (= b_and!23947 (and (=> t!23540 result!8805) b_and!23949)))

(declare-fun m!802379 () Bool)

(assert (=> mapNonEmpty!26522 m!802379))

(declare-fun m!802381 () Bool)

(assert (=> b!861203 m!802381))

(declare-fun m!802383 () Bool)

(assert (=> b!861203 m!802383))

(declare-fun m!802385 () Bool)

(assert (=> b!861203 m!802385))

(declare-fun m!802387 () Bool)

(assert (=> b!861203 m!802387))

(assert (=> b!861203 m!802383))

(declare-fun m!802389 () Bool)

(assert (=> b!861203 m!802389))

(assert (=> b!861203 m!802385))

(declare-fun m!802391 () Bool)

(assert (=> start!73732 m!802391))

(declare-fun m!802393 () Bool)

(assert (=> start!73732 m!802393))

(declare-fun m!802395 () Bool)

(assert (=> b!861201 m!802395))

(declare-fun m!802397 () Bool)

(assert (=> b!861197 m!802397))

(declare-fun m!802399 () Bool)

(assert (=> b!861209 m!802399))

(declare-fun m!802401 () Bool)

(assert (=> b!861202 m!802401))

(declare-fun m!802403 () Bool)

(assert (=> b!861202 m!802403))

(declare-fun m!802405 () Bool)

(assert (=> b!861202 m!802405))

(declare-fun m!802407 () Bool)

(assert (=> b!861202 m!802407))

(declare-fun m!802409 () Bool)

(assert (=> b!861193 m!802409))

(declare-fun m!802411 () Bool)

(assert (=> b!861195 m!802411))

(declare-fun m!802413 () Bool)

(assert (=> b!861208 m!802413))

(declare-fun m!802415 () Bool)

(assert (=> b!861208 m!802415))

(assert (=> b!861208 m!802389))

(declare-fun m!802417 () Bool)

(assert (=> b!861208 m!802417))

(assert (=> b!861208 m!802389))

(declare-fun m!802419 () Bool)

(assert (=> b!861208 m!802419))

(declare-fun m!802421 () Bool)

(assert (=> b!861208 m!802421))

(declare-fun m!802423 () Bool)

(assert (=> b!861196 m!802423))

(declare-fun m!802425 () Bool)

(assert (=> b!861207 m!802425))

(declare-fun m!802427 () Bool)

(assert (=> b!861205 m!802427))

(declare-fun m!802429 () Bool)

(assert (=> b!861205 m!802429))

(declare-fun m!802431 () Bool)

(assert (=> b!861205 m!802431))

(declare-fun m!802433 () Bool)

(assert (=> b!861199 m!802433))

(check-sat (not mapNonEmpty!26522) (not b!861201) (not b!861203) (not b!861199) (not b!861197) (not b!861209) tp_is_empty!16615 (not b!861195) (not b_lambda!11845) (not b!861207) (not b_next!14479) (not b!861202) (not start!73732) (not b!861193) (not b!861205) (not b!861208) b_and!23949)
(check-sat b_and!23949 (not b_next!14479))
