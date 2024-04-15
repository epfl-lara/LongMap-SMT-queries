; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73588 () Bool)

(assert start!73588)

(declare-fun b_free!14521 () Bool)

(declare-fun b_next!14521 () Bool)

(assert (=> start!73588 (= b_free!14521 (not b_next!14521))))

(declare-fun tp!51067 () Bool)

(declare-fun b_and!23995 () Bool)

(assert (=> start!73588 (= tp!51067 b_and!23995)))

(declare-fun b!861088 () Bool)

(declare-fun res!585243 () Bool)

(declare-fun e!479769 () Bool)

(assert (=> b!861088 (=> (not res!585243) (not e!479769))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49471 0))(
  ( (array!49472 (arr!23767 (Array (_ BitVec 32) (_ BitVec 64))) (size!24209 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49471)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861088 (= res!585243 (and (= (select (arr!23767 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861089 () Bool)

(declare-fun e!479765 () Bool)

(declare-fun tp_is_empty!16657 () Bool)

(assert (=> b!861089 (= e!479765 tp_is_empty!16657)))

(declare-fun mapIsEmpty!26585 () Bool)

(declare-fun mapRes!26585 () Bool)

(assert (=> mapIsEmpty!26585 mapRes!26585))

(declare-fun b!861090 () Bool)

(declare-fun e!479764 () Bool)

(assert (=> b!861090 (= e!479764 true)))

(assert (=> b!861090 (not (= (select (arr!23767 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29300 0))(
  ( (Unit!29301) )
))
(declare-fun lt!388181 () Unit!29300)

(declare-fun e!479766 () Unit!29300)

(assert (=> b!861090 (= lt!388181 e!479766)))

(declare-fun c!91937 () Bool)

(assert (=> b!861090 (= c!91937 (= (select (arr!23767 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27257 0))(
  ( (V!27258 (val!8376 Int)) )
))
(declare-datatypes ((tuple2!11082 0))(
  ( (tuple2!11083 (_1!5552 (_ BitVec 64)) (_2!5552 V!27257)) )
))
(declare-datatypes ((List!16881 0))(
  ( (Nil!16878) (Cons!16877 (h!18008 tuple2!11082) (t!23659 List!16881)) )
))
(declare-datatypes ((ListLongMap!9841 0))(
  ( (ListLongMap!9842 (toList!4936 List!16881)) )
))
(declare-fun lt!388187 () ListLongMap!9841)

(declare-datatypes ((ValueCell!7889 0))(
  ( (ValueCellFull!7889 (v!10795 V!27257)) (EmptyCell!7889) )
))
(declare-datatypes ((array!49473 0))(
  ( (array!49474 (arr!23768 (Array (_ BitVec 32) ValueCell!7889)) (size!24210 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49473)

(declare-fun lt!388180 () ListLongMap!9841)

(declare-fun +!2307 (ListLongMap!9841 tuple2!11082) ListLongMap!9841)

(declare-fun get!12538 (ValueCell!7889 V!27257) V!27257)

(declare-fun dynLambda!1117 (Int (_ BitVec 64)) V!27257)

(assert (=> b!861090 (= lt!388180 (+!2307 lt!388187 (tuple2!11083 (select (arr!23767 _keys!868) from!1053) (get!12538 (select (arr!23768 _values!688) from!1053) (dynLambda!1117 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861091 () Bool)

(declare-fun res!585246 () Bool)

(assert (=> b!861091 (=> (not res!585246) (not e!479769))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861091 (= res!585246 (validMask!0 mask!1196))))

(declare-fun b!861092 () Bool)

(declare-fun e!479768 () Bool)

(declare-fun e!479762 () Bool)

(assert (=> b!861092 (= e!479768 (and e!479762 mapRes!26585))))

(declare-fun condMapEmpty!26585 () Bool)

(declare-fun mapDefault!26585 () ValueCell!7889)

(assert (=> b!861092 (= condMapEmpty!26585 (= (arr!23768 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7889)) mapDefault!26585)))))

(declare-fun b!861093 () Bool)

(declare-fun res!585241 () Bool)

(assert (=> b!861093 (=> (not res!585241) (not e!479769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861093 (= res!585241 (validKeyInArray!0 k0!854))))

(declare-fun res!585244 () Bool)

(assert (=> start!73588 (=> (not res!585244) (not e!479769))))

(assert (=> start!73588 (= res!585244 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24209 _keys!868))))))

(assert (=> start!73588 e!479769))

(assert (=> start!73588 tp_is_empty!16657))

(assert (=> start!73588 true))

(assert (=> start!73588 tp!51067))

(declare-fun array_inv!18880 (array!49471) Bool)

(assert (=> start!73588 (array_inv!18880 _keys!868)))

(declare-fun array_inv!18881 (array!49473) Bool)

(assert (=> start!73588 (and (array_inv!18881 _values!688) e!479768)))

(declare-fun b!861094 () Bool)

(declare-fun res!585237 () Bool)

(assert (=> b!861094 (=> (not res!585237) (not e!479769))))

(assert (=> b!861094 (= res!585237 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24209 _keys!868))))))

(declare-fun b!861095 () Bool)

(declare-fun Unit!29302 () Unit!29300)

(assert (=> b!861095 (= e!479766 Unit!29302)))

(declare-fun lt!388182 () Unit!29300)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49471 (_ BitVec 32) (_ BitVec 32)) Unit!29300)

(assert (=> b!861095 (= lt!388182 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16882 0))(
  ( (Nil!16879) (Cons!16878 (h!18009 (_ BitVec 64)) (t!23660 List!16882)) )
))
(declare-fun arrayNoDuplicates!0 (array!49471 (_ BitVec 32) List!16882) Bool)

(assert (=> b!861095 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16879)))

(declare-fun lt!388184 () Unit!29300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29300)

(assert (=> b!861095 (= lt!388184 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861095 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388185 () Unit!29300)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49471 (_ BitVec 64) (_ BitVec 32) List!16882) Unit!29300)

(assert (=> b!861095 (= lt!388185 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16879))))

(assert (=> b!861095 false))

(declare-fun b!861096 () Bool)

(declare-fun Unit!29303 () Unit!29300)

(assert (=> b!861096 (= e!479766 Unit!29303)))

(declare-fun b!861097 () Bool)

(declare-fun e!479767 () Bool)

(assert (=> b!861097 (= e!479769 e!479767)))

(declare-fun res!585245 () Bool)

(assert (=> b!861097 (=> (not res!585245) (not e!479767))))

(assert (=> b!861097 (= res!585245 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388178 () array!49473)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27257)

(declare-fun zeroValue!654 () V!27257)

(declare-fun getCurrentListMapNoExtraKeys!2939 (array!49471 array!49473 (_ BitVec 32) (_ BitVec 32) V!27257 V!27257 (_ BitVec 32) Int) ListLongMap!9841)

(assert (=> b!861097 (= lt!388180 (getCurrentListMapNoExtraKeys!2939 _keys!868 lt!388178 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27257)

(assert (=> b!861097 (= lt!388178 (array!49474 (store (arr!23768 _values!688) i!612 (ValueCellFull!7889 v!557)) (size!24210 _values!688)))))

(declare-fun lt!388183 () ListLongMap!9841)

(assert (=> b!861097 (= lt!388183 (getCurrentListMapNoExtraKeys!2939 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861098 () Bool)

(declare-fun res!585239 () Bool)

(assert (=> b!861098 (=> (not res!585239) (not e!479769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49471 (_ BitVec 32)) Bool)

(assert (=> b!861098 (= res!585239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861099 () Bool)

(assert (=> b!861099 (= e!479767 (not e!479764))))

(declare-fun res!585242 () Bool)

(assert (=> b!861099 (=> res!585242 e!479764)))

(assert (=> b!861099 (= res!585242 (not (validKeyInArray!0 (select (arr!23767 _keys!868) from!1053))))))

(declare-fun lt!388186 () ListLongMap!9841)

(assert (=> b!861099 (= lt!388186 lt!388187)))

(declare-fun lt!388179 () ListLongMap!9841)

(assert (=> b!861099 (= lt!388187 (+!2307 lt!388179 (tuple2!11083 k0!854 v!557)))))

(assert (=> b!861099 (= lt!388186 (getCurrentListMapNoExtraKeys!2939 _keys!868 lt!388178 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861099 (= lt!388179 (getCurrentListMapNoExtraKeys!2939 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388177 () Unit!29300)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!497 (array!49471 array!49473 (_ BitVec 32) (_ BitVec 32) V!27257 V!27257 (_ BitVec 32) (_ BitVec 64) V!27257 (_ BitVec 32) Int) Unit!29300)

(assert (=> b!861099 (= lt!388177 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!497 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861100 () Bool)

(assert (=> b!861100 (= e!479762 tp_is_empty!16657)))

(declare-fun b!861101 () Bool)

(declare-fun res!585238 () Bool)

(assert (=> b!861101 (=> (not res!585238) (not e!479769))))

(assert (=> b!861101 (= res!585238 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16879))))

(declare-fun b!861102 () Bool)

(declare-fun res!585240 () Bool)

(assert (=> b!861102 (=> (not res!585240) (not e!479769))))

(assert (=> b!861102 (= res!585240 (and (= (size!24210 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24209 _keys!868) (size!24210 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26585 () Bool)

(declare-fun tp!51068 () Bool)

(assert (=> mapNonEmpty!26585 (= mapRes!26585 (and tp!51068 e!479765))))

(declare-fun mapValue!26585 () ValueCell!7889)

(declare-fun mapKey!26585 () (_ BitVec 32))

(declare-fun mapRest!26585 () (Array (_ BitVec 32) ValueCell!7889))

(assert (=> mapNonEmpty!26585 (= (arr!23768 _values!688) (store mapRest!26585 mapKey!26585 mapValue!26585))))

(assert (= (and start!73588 res!585244) b!861091))

(assert (= (and b!861091 res!585246) b!861102))

(assert (= (and b!861102 res!585240) b!861098))

(assert (= (and b!861098 res!585239) b!861101))

(assert (= (and b!861101 res!585238) b!861094))

(assert (= (and b!861094 res!585237) b!861093))

(assert (= (and b!861093 res!585241) b!861088))

(assert (= (and b!861088 res!585243) b!861097))

(assert (= (and b!861097 res!585245) b!861099))

(assert (= (and b!861099 (not res!585242)) b!861090))

(assert (= (and b!861090 c!91937) b!861095))

(assert (= (and b!861090 (not c!91937)) b!861096))

(assert (= (and b!861092 condMapEmpty!26585) mapIsEmpty!26585))

(assert (= (and b!861092 (not condMapEmpty!26585)) mapNonEmpty!26585))

(get-info :version)

(assert (= (and mapNonEmpty!26585 ((_ is ValueCellFull!7889) mapValue!26585)) b!861089))

(assert (= (and b!861092 ((_ is ValueCellFull!7889) mapDefault!26585)) b!861100))

(assert (= start!73588 b!861092))

(declare-fun b_lambda!11855 () Bool)

(assert (=> (not b_lambda!11855) (not b!861090)))

(declare-fun t!23658 () Bool)

(declare-fun tb!4635 () Bool)

(assert (=> (and start!73588 (= defaultEntry!696 defaultEntry!696) t!23658) tb!4635))

(declare-fun result!8889 () Bool)

(assert (=> tb!4635 (= result!8889 tp_is_empty!16657)))

(assert (=> b!861090 t!23658))

(declare-fun b_and!23997 () Bool)

(assert (= b_and!23995 (and (=> t!23658 result!8889) b_and!23997)))

(declare-fun m!801459 () Bool)

(assert (=> b!861098 m!801459))

(declare-fun m!801461 () Bool)

(assert (=> b!861101 m!801461))

(declare-fun m!801463 () Bool)

(assert (=> b!861097 m!801463))

(declare-fun m!801465 () Bool)

(assert (=> b!861097 m!801465))

(declare-fun m!801467 () Bool)

(assert (=> b!861097 m!801467))

(declare-fun m!801469 () Bool)

(assert (=> b!861091 m!801469))

(declare-fun m!801471 () Bool)

(assert (=> b!861088 m!801471))

(declare-fun m!801473 () Bool)

(assert (=> b!861090 m!801473))

(declare-fun m!801475 () Bool)

(assert (=> b!861090 m!801475))

(declare-fun m!801477 () Bool)

(assert (=> b!861090 m!801477))

(declare-fun m!801479 () Bool)

(assert (=> b!861090 m!801479))

(assert (=> b!861090 m!801475))

(declare-fun m!801481 () Bool)

(assert (=> b!861090 m!801481))

(assert (=> b!861090 m!801477))

(declare-fun m!801483 () Bool)

(assert (=> mapNonEmpty!26585 m!801483))

(declare-fun m!801485 () Bool)

(assert (=> start!73588 m!801485))

(declare-fun m!801487 () Bool)

(assert (=> start!73588 m!801487))

(declare-fun m!801489 () Bool)

(assert (=> b!861099 m!801489))

(assert (=> b!861099 m!801481))

(declare-fun m!801491 () Bool)

(assert (=> b!861099 m!801491))

(assert (=> b!861099 m!801481))

(declare-fun m!801493 () Bool)

(assert (=> b!861099 m!801493))

(declare-fun m!801495 () Bool)

(assert (=> b!861099 m!801495))

(declare-fun m!801497 () Bool)

(assert (=> b!861099 m!801497))

(declare-fun m!801499 () Bool)

(assert (=> b!861093 m!801499))

(declare-fun m!801501 () Bool)

(assert (=> b!861095 m!801501))

(declare-fun m!801503 () Bool)

(assert (=> b!861095 m!801503))

(declare-fun m!801505 () Bool)

(assert (=> b!861095 m!801505))

(declare-fun m!801507 () Bool)

(assert (=> b!861095 m!801507))

(declare-fun m!801509 () Bool)

(assert (=> b!861095 m!801509))

(check-sat (not b!861097) tp_is_empty!16657 (not b_next!14521) (not start!73588) (not b!861090) (not b!861101) (not b!861098) (not b!861091) (not b_lambda!11855) (not b!861093) (not b!861095) b_and!23997 (not mapNonEmpty!26585) (not b!861099))
(check-sat b_and!23997 (not b_next!14521))
