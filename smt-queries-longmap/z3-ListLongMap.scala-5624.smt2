; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73696 () Bool)

(assert start!73696)

(declare-fun b_free!14443 () Bool)

(declare-fun b_next!14443 () Bool)

(assert (=> start!73696 (= b_free!14443 (not b_next!14443))))

(declare-fun tp!50834 () Bool)

(declare-fun b_and!23875 () Bool)

(assert (=> start!73696 (= tp!50834 b_and!23875)))

(declare-fun b!860239 () Bool)

(declare-fun e!479482 () Bool)

(assert (=> b!860239 (= e!479482 true)))

(declare-fun lt!387569 () Bool)

(declare-datatypes ((List!16773 0))(
  ( (Nil!16770) (Cons!16769 (h!17906 (_ BitVec 64)) (t!23474 List!16773)) )
))
(declare-fun contains!4196 (List!16773 (_ BitVec 64)) Bool)

(assert (=> b!860239 (= lt!387569 (contains!4196 Nil!16770 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860240 () Bool)

(declare-fun res!584206 () Bool)

(declare-fun e!479479 () Bool)

(assert (=> b!860240 (=> (not res!584206) (not e!479479))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49387 0))(
  ( (array!49388 (arr!23720 (Array (_ BitVec 32) (_ BitVec 64))) (size!24161 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49387)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860240 (= res!584206 (and (= (select (arr!23720 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!584213 () Bool)

(assert (=> start!73696 (=> (not res!584213) (not e!479479))))

(assert (=> start!73696 (= res!584213 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24161 _keys!868))))))

(assert (=> start!73696 e!479479))

(declare-fun tp_is_empty!16579 () Bool)

(assert (=> start!73696 tp_is_empty!16579))

(assert (=> start!73696 true))

(assert (=> start!73696 tp!50834))

(declare-fun array_inv!18830 (array!49387) Bool)

(assert (=> start!73696 (array_inv!18830 _keys!868)))

(declare-datatypes ((V!27153 0))(
  ( (V!27154 (val!8337 Int)) )
))
(declare-datatypes ((ValueCell!7850 0))(
  ( (ValueCellFull!7850 (v!10762 V!27153)) (EmptyCell!7850) )
))
(declare-datatypes ((array!49389 0))(
  ( (array!49390 (arr!23721 (Array (_ BitVec 32) ValueCell!7850)) (size!24162 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49389)

(declare-fun e!479477 () Bool)

(declare-fun array_inv!18831 (array!49389) Bool)

(assert (=> start!73696 (and (array_inv!18831 _values!688) e!479477)))

(declare-fun b!860241 () Bool)

(declare-fun e!479478 () Bool)

(declare-fun e!479481 () Bool)

(assert (=> b!860241 (= e!479478 (not e!479481))))

(declare-fun res!584218 () Bool)

(assert (=> b!860241 (=> res!584218 e!479481)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860241 (= res!584218 (not (validKeyInArray!0 (select (arr!23720 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10934 0))(
  ( (tuple2!10935 (_1!5478 (_ BitVec 64)) (_2!5478 V!27153)) )
))
(declare-datatypes ((List!16774 0))(
  ( (Nil!16771) (Cons!16770 (h!17907 tuple2!10934) (t!23475 List!16774)) )
))
(declare-datatypes ((ListLongMap!9705 0))(
  ( (ListLongMap!9706 (toList!4868 List!16774)) )
))
(declare-fun lt!387573 () ListLongMap!9705)

(declare-fun lt!387572 () ListLongMap!9705)

(assert (=> b!860241 (= lt!387573 lt!387572)))

(declare-fun v!557 () V!27153)

(declare-fun lt!387566 () ListLongMap!9705)

(declare-fun +!2274 (ListLongMap!9705 tuple2!10934) ListLongMap!9705)

(assert (=> b!860241 (= lt!387572 (+!2274 lt!387566 (tuple2!10935 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!387567 () array!49389)

(declare-fun minValue!654 () V!27153)

(declare-fun zeroValue!654 () V!27153)

(declare-fun getCurrentListMapNoExtraKeys!2923 (array!49387 array!49389 (_ BitVec 32) (_ BitVec 32) V!27153 V!27153 (_ BitVec 32) Int) ListLongMap!9705)

(assert (=> b!860241 (= lt!387573 (getCurrentListMapNoExtraKeys!2923 _keys!868 lt!387567 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860241 (= lt!387566 (getCurrentListMapNoExtraKeys!2923 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29302 0))(
  ( (Unit!29303) )
))
(declare-fun lt!387570 () Unit!29302)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!468 (array!49387 array!49389 (_ BitVec 32) (_ BitVec 32) V!27153 V!27153 (_ BitVec 32) (_ BitVec 64) V!27153 (_ BitVec 32) Int) Unit!29302)

(assert (=> b!860241 (= lt!387570 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!468 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860242 () Bool)

(declare-fun e!479484 () Bool)

(assert (=> b!860242 (= e!479481 e!479484)))

(declare-fun res!584211 () Bool)

(assert (=> b!860242 (=> res!584211 e!479484)))

(assert (=> b!860242 (= res!584211 (not (= (select (arr!23720 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387571 () ListLongMap!9705)

(declare-fun get!12505 (ValueCell!7850 V!27153) V!27153)

(declare-fun dynLambda!1107 (Int (_ BitVec 64)) V!27153)

(assert (=> b!860242 (= lt!387571 (+!2274 lt!387572 (tuple2!10935 (select (arr!23720 _keys!868) from!1053) (get!12505 (select (arr!23721 _values!688) from!1053) (dynLambda!1107 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26468 () Bool)

(declare-fun mapRes!26468 () Bool)

(assert (=> mapIsEmpty!26468 mapRes!26468))

(declare-fun b!860243 () Bool)

(assert (=> b!860243 (= e!479479 e!479478)))

(declare-fun res!584205 () Bool)

(assert (=> b!860243 (=> (not res!584205) (not e!479478))))

(assert (=> b!860243 (= res!584205 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860243 (= lt!387571 (getCurrentListMapNoExtraKeys!2923 _keys!868 lt!387567 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860243 (= lt!387567 (array!49390 (store (arr!23721 _values!688) i!612 (ValueCellFull!7850 v!557)) (size!24162 _values!688)))))

(declare-fun lt!387575 () ListLongMap!9705)

(assert (=> b!860243 (= lt!387575 (getCurrentListMapNoExtraKeys!2923 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860244 () Bool)

(declare-fun res!584209 () Bool)

(assert (=> b!860244 (=> (not res!584209) (not e!479479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860244 (= res!584209 (validMask!0 mask!1196))))

(declare-fun b!860245 () Bool)

(declare-fun res!584207 () Bool)

(assert (=> b!860245 (=> res!584207 e!479482)))

(declare-fun noDuplicate!1303 (List!16773) Bool)

(assert (=> b!860245 (= res!584207 (not (noDuplicate!1303 Nil!16770)))))

(declare-fun b!860246 () Bool)

(declare-fun res!584212 () Bool)

(assert (=> b!860246 (=> (not res!584212) (not e!479479))))

(assert (=> b!860246 (= res!584212 (and (= (size!24162 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24161 _keys!868) (size!24162 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860247 () Bool)

(declare-fun e!479485 () Bool)

(assert (=> b!860247 (= e!479485 tp_is_empty!16579)))

(declare-fun b!860248 () Bool)

(declare-fun res!584216 () Bool)

(assert (=> b!860248 (=> (not res!584216) (not e!479479))))

(assert (=> b!860248 (= res!584216 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24161 _keys!868))))))

(declare-fun b!860249 () Bool)

(declare-fun res!584215 () Bool)

(assert (=> b!860249 (=> (not res!584215) (not e!479479))))

(assert (=> b!860249 (= res!584215 (validKeyInArray!0 k0!854))))

(declare-fun b!860250 () Bool)

(declare-fun res!584217 () Bool)

(assert (=> b!860250 (=> (not res!584217) (not e!479479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49387 (_ BitVec 32)) Bool)

(assert (=> b!860250 (= res!584217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26468 () Bool)

(declare-fun tp!50833 () Bool)

(declare-fun e!479480 () Bool)

(assert (=> mapNonEmpty!26468 (= mapRes!26468 (and tp!50833 e!479480))))

(declare-fun mapKey!26468 () (_ BitVec 32))

(declare-fun mapRest!26468 () (Array (_ BitVec 32) ValueCell!7850))

(declare-fun mapValue!26468 () ValueCell!7850)

(assert (=> mapNonEmpty!26468 (= (arr!23721 _values!688) (store mapRest!26468 mapKey!26468 mapValue!26468))))

(declare-fun b!860251 () Bool)

(assert (=> b!860251 (= e!479480 tp_is_empty!16579)))

(declare-fun b!860252 () Bool)

(declare-fun res!584208 () Bool)

(assert (=> b!860252 (=> res!584208 e!479482)))

(assert (=> b!860252 (= res!584208 (contains!4196 Nil!16770 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860253 () Bool)

(assert (=> b!860253 (= e!479477 (and e!479485 mapRes!26468))))

(declare-fun condMapEmpty!26468 () Bool)

(declare-fun mapDefault!26468 () ValueCell!7850)

(assert (=> b!860253 (= condMapEmpty!26468 (= (arr!23721 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7850)) mapDefault!26468)))))

(declare-fun b!860254 () Bool)

(declare-fun res!584210 () Bool)

(assert (=> b!860254 (=> (not res!584210) (not e!479479))))

(declare-fun arrayNoDuplicates!0 (array!49387 (_ BitVec 32) List!16773) Bool)

(assert (=> b!860254 (= res!584210 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16770))))

(declare-fun b!860255 () Bool)

(assert (=> b!860255 (= e!479484 e!479482)))

(declare-fun res!584214 () Bool)

(assert (=> b!860255 (=> res!584214 e!479482)))

(assert (=> b!860255 (= res!584214 (or (bvsge (size!24161 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24161 _keys!868)) (bvsge from!1053 (size!24161 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860255 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387574 () Unit!29302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49387 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29302)

(assert (=> b!860255 (= lt!387574 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860255 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16770)))

(declare-fun lt!387568 () Unit!29302)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49387 (_ BitVec 32) (_ BitVec 32)) Unit!29302)

(assert (=> b!860255 (= lt!387568 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!73696 res!584213) b!860244))

(assert (= (and b!860244 res!584209) b!860246))

(assert (= (and b!860246 res!584212) b!860250))

(assert (= (and b!860250 res!584217) b!860254))

(assert (= (and b!860254 res!584210) b!860248))

(assert (= (and b!860248 res!584216) b!860249))

(assert (= (and b!860249 res!584215) b!860240))

(assert (= (and b!860240 res!584206) b!860243))

(assert (= (and b!860243 res!584205) b!860241))

(assert (= (and b!860241 (not res!584218)) b!860242))

(assert (= (and b!860242 (not res!584211)) b!860255))

(assert (= (and b!860255 (not res!584214)) b!860245))

(assert (= (and b!860245 (not res!584207)) b!860252))

(assert (= (and b!860252 (not res!584208)) b!860239))

(assert (= (and b!860253 condMapEmpty!26468) mapIsEmpty!26468))

(assert (= (and b!860253 (not condMapEmpty!26468)) mapNonEmpty!26468))

(get-info :version)

(assert (= (and mapNonEmpty!26468 ((_ is ValueCellFull!7850) mapValue!26468)) b!860251))

(assert (= (and b!860253 ((_ is ValueCellFull!7850) mapDefault!26468)) b!860247))

(assert (= start!73696 b!860253))

(declare-fun b_lambda!11809 () Bool)

(assert (=> (not b_lambda!11809) (not b!860242)))

(declare-fun t!23473 () Bool)

(declare-fun tb!4557 () Bool)

(assert (=> (and start!73696 (= defaultEntry!696 defaultEntry!696) t!23473) tb!4557))

(declare-fun result!8733 () Bool)

(assert (=> tb!4557 (= result!8733 tp_is_empty!16579)))

(assert (=> b!860242 t!23473))

(declare-fun b_and!23877 () Bool)

(assert (= b_and!23875 (and (=> t!23473 result!8733) b_and!23877)))

(declare-fun m!801371 () Bool)

(assert (=> b!860245 m!801371))

(declare-fun m!801373 () Bool)

(assert (=> b!860254 m!801373))

(declare-fun m!801375 () Bool)

(assert (=> b!860252 m!801375))

(declare-fun m!801377 () Bool)

(assert (=> b!860240 m!801377))

(declare-fun m!801379 () Bool)

(assert (=> start!73696 m!801379))

(declare-fun m!801381 () Bool)

(assert (=> start!73696 m!801381))

(declare-fun m!801383 () Bool)

(assert (=> b!860249 m!801383))

(declare-fun m!801385 () Bool)

(assert (=> b!860255 m!801385))

(declare-fun m!801387 () Bool)

(assert (=> b!860255 m!801387))

(declare-fun m!801389 () Bool)

(assert (=> b!860255 m!801389))

(declare-fun m!801391 () Bool)

(assert (=> b!860255 m!801391))

(declare-fun m!801393 () Bool)

(assert (=> b!860242 m!801393))

(declare-fun m!801395 () Bool)

(assert (=> b!860242 m!801395))

(declare-fun m!801397 () Bool)

(assert (=> b!860242 m!801397))

(assert (=> b!860242 m!801393))

(assert (=> b!860242 m!801397))

(declare-fun m!801399 () Bool)

(assert (=> b!860242 m!801399))

(declare-fun m!801401 () Bool)

(assert (=> b!860242 m!801401))

(declare-fun m!801403 () Bool)

(assert (=> b!860239 m!801403))

(declare-fun m!801405 () Bool)

(assert (=> b!860244 m!801405))

(declare-fun m!801407 () Bool)

(assert (=> b!860241 m!801407))

(declare-fun m!801409 () Bool)

(assert (=> b!860241 m!801409))

(declare-fun m!801411 () Bool)

(assert (=> b!860241 m!801411))

(assert (=> b!860241 m!801395))

(declare-fun m!801413 () Bool)

(assert (=> b!860241 m!801413))

(assert (=> b!860241 m!801395))

(declare-fun m!801415 () Bool)

(assert (=> b!860241 m!801415))

(declare-fun m!801417 () Bool)

(assert (=> b!860250 m!801417))

(declare-fun m!801419 () Bool)

(assert (=> mapNonEmpty!26468 m!801419))

(declare-fun m!801421 () Bool)

(assert (=> b!860243 m!801421))

(declare-fun m!801423 () Bool)

(assert (=> b!860243 m!801423))

(declare-fun m!801425 () Bool)

(assert (=> b!860243 m!801425))

(check-sat (not b!860245) (not b!860249) (not b_next!14443) (not b!860244) (not b!860243) (not b_lambda!11809) (not b!860239) tp_is_empty!16579 (not b!860242) (not b!860250) b_and!23877 (not b!860252) (not mapNonEmpty!26468) (not b!860254) (not start!73696) (not b!860241) (not b!860255))
(check-sat b_and!23877 (not b_next!14443))
