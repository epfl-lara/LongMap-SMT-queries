; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73408 () Bool)

(assert start!73408)

(declare-fun b_free!14155 () Bool)

(declare-fun b_next!14155 () Bool)

(assert (=> start!73408 (= b_free!14155 (not b_next!14155))))

(declare-fun tp!49969 () Bool)

(declare-fun b_and!23479 () Bool)

(assert (=> start!73408 (= tp!49969 b_and!23479)))

(declare-fun b!854700 () Bool)

(declare-fun e!476708 () Bool)

(declare-fun e!476706 () Bool)

(declare-fun mapRes!26036 () Bool)

(assert (=> b!854700 (= e!476708 (and e!476706 mapRes!26036))))

(declare-fun condMapEmpty!26036 () Bool)

(declare-datatypes ((V!26769 0))(
  ( (V!26770 (val!8193 Int)) )
))
(declare-datatypes ((ValueCell!7706 0))(
  ( (ValueCellFull!7706 (v!10618 V!26769)) (EmptyCell!7706) )
))
(declare-datatypes ((array!48829 0))(
  ( (array!48830 (arr!23441 (Array (_ BitVec 32) ValueCell!7706)) (size!23882 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48829)

(declare-fun mapDefault!26036 () ValueCell!7706)

(assert (=> b!854700 (= condMapEmpty!26036 (= (arr!23441 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7706)) mapDefault!26036)))))

(declare-fun mapIsEmpty!26036 () Bool)

(assert (=> mapIsEmpty!26036 mapRes!26036))

(declare-fun b!854701 () Bool)

(declare-fun res!580198 () Bool)

(declare-fun e!476705 () Bool)

(assert (=> b!854701 (=> (not res!580198) (not e!476705))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48831 0))(
  ( (array!48832 (arr!23442 (Array (_ BitVec 32) (_ BitVec 64))) (size!23883 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48831)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854701 (= res!580198 (and (= (select (arr!23442 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854702 () Bool)

(declare-fun res!580196 () Bool)

(assert (=> b!854702 (=> (not res!580196) (not e!476705))))

(declare-datatypes ((List!16551 0))(
  ( (Nil!16548) (Cons!16547 (h!17684 (_ BitVec 64)) (t!23144 List!16551)) )
))
(declare-fun arrayNoDuplicates!0 (array!48831 (_ BitVec 32) List!16551) Bool)

(assert (=> b!854702 (= res!580196 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16548))))

(declare-fun b!854703 () Bool)

(declare-fun res!580199 () Bool)

(assert (=> b!854703 (=> (not res!580199) (not e!476705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854703 (= res!580199 (validKeyInArray!0 k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10702 0))(
  ( (tuple2!10703 (_1!5362 (_ BitVec 64)) (_2!5362 V!26769)) )
))
(declare-datatypes ((List!16552 0))(
  ( (Nil!16549) (Cons!16548 (h!17685 tuple2!10702) (t!23145 List!16552)) )
))
(declare-datatypes ((ListLongMap!9473 0))(
  ( (ListLongMap!9474 (toList!4752 List!16552)) )
))
(declare-fun call!38366 () ListLongMap!9473)

(declare-fun bm!38362 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26769)

(declare-fun zeroValue!654 () V!26769)

(declare-fun getCurrentListMapNoExtraKeys!2809 (array!48831 array!48829 (_ BitVec 32) (_ BitVec 32) V!26769 V!26769 (_ BitVec 32) Int) ListLongMap!9473)

(assert (=> bm!38362 (= call!38366 (getCurrentListMapNoExtraKeys!2809 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854704 () Bool)

(declare-fun e!476710 () Bool)

(declare-fun e!476703 () Bool)

(assert (=> b!854704 (= e!476710 (not e!476703))))

(declare-fun res!580193 () Bool)

(assert (=> b!854704 (=> res!580193 e!476703)))

(assert (=> b!854704 (= res!580193 (not (validKeyInArray!0 (select (arr!23442 _keys!868) from!1053))))))

(declare-fun e!476707 () Bool)

(assert (=> b!854704 e!476707))

(declare-fun c!92185 () Bool)

(assert (=> b!854704 (= c!92185 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29148 0))(
  ( (Unit!29149) )
))
(declare-fun lt!385328 () Unit!29148)

(declare-fun v!557 () V!26769)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!397 (array!48831 array!48829 (_ BitVec 32) (_ BitVec 32) V!26769 V!26769 (_ BitVec 32) (_ BitVec 64) V!26769 (_ BitVec 32) Int) Unit!29148)

(assert (=> b!854704 (= lt!385328 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!397 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854705 () Bool)

(assert (=> b!854705 (= e!476703 true)))

(declare-fun lt!385326 () ListLongMap!9473)

(declare-fun lt!385331 () tuple2!10702)

(declare-fun lt!385327 () V!26769)

(declare-fun +!2194 (ListLongMap!9473 tuple2!10702) ListLongMap!9473)

(assert (=> b!854705 (= (+!2194 lt!385326 lt!385331) (+!2194 (+!2194 lt!385326 (tuple2!10703 k0!854 lt!385327)) lt!385331))))

(declare-fun lt!385333 () V!26769)

(assert (=> b!854705 (= lt!385331 (tuple2!10703 k0!854 lt!385333))))

(declare-fun lt!385325 () Unit!29148)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!318 (ListLongMap!9473 (_ BitVec 64) V!26769 V!26769) Unit!29148)

(assert (=> b!854705 (= lt!385325 (addSameAsAddTwiceSameKeyDiffValues!318 lt!385326 k0!854 lt!385327 lt!385333))))

(declare-fun lt!385330 () V!26769)

(declare-fun get!12367 (ValueCell!7706 V!26769) V!26769)

(assert (=> b!854705 (= lt!385327 (get!12367 (select (arr!23441 _values!688) from!1053) lt!385330))))

(declare-fun lt!385329 () ListLongMap!9473)

(assert (=> b!854705 (= lt!385329 (+!2194 lt!385326 (tuple2!10703 (select (arr!23442 _keys!868) from!1053) lt!385333)))))

(assert (=> b!854705 (= lt!385333 (get!12367 (select (store (arr!23441 _values!688) i!612 (ValueCellFull!7706 v!557)) from!1053) lt!385330))))

(declare-fun dynLambda!1065 (Int (_ BitVec 64)) V!26769)

(assert (=> b!854705 (= lt!385330 (dynLambda!1065 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!385334 () array!48829)

(assert (=> b!854705 (= lt!385326 (getCurrentListMapNoExtraKeys!2809 _keys!868 lt!385334 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854706 () Bool)

(declare-fun res!580200 () Bool)

(assert (=> b!854706 (=> (not res!580200) (not e!476705))))

(assert (=> b!854706 (= res!580200 (and (= (size!23882 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23883 _keys!868) (size!23882 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854707 () Bool)

(declare-fun call!38365 () ListLongMap!9473)

(assert (=> b!854707 (= e!476707 (= call!38365 (+!2194 call!38366 (tuple2!10703 k0!854 v!557))))))

(declare-fun b!854708 () Bool)

(declare-fun res!580192 () Bool)

(assert (=> b!854708 (=> (not res!580192) (not e!476705))))

(assert (=> b!854708 (= res!580192 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23883 _keys!868))))))

(declare-fun bm!38363 () Bool)

(assert (=> bm!38363 (= call!38365 (getCurrentListMapNoExtraKeys!2809 _keys!868 lt!385334 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854709 () Bool)

(assert (=> b!854709 (= e!476705 e!476710)))

(declare-fun res!580197 () Bool)

(assert (=> b!854709 (=> (not res!580197) (not e!476710))))

(assert (=> b!854709 (= res!580197 (= from!1053 i!612))))

(assert (=> b!854709 (= lt!385329 (getCurrentListMapNoExtraKeys!2809 _keys!868 lt!385334 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854709 (= lt!385334 (array!48830 (store (arr!23441 _values!688) i!612 (ValueCellFull!7706 v!557)) (size!23882 _values!688)))))

(declare-fun lt!385332 () ListLongMap!9473)

(assert (=> b!854709 (= lt!385332 (getCurrentListMapNoExtraKeys!2809 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26036 () Bool)

(declare-fun tp!49970 () Bool)

(declare-fun e!476709 () Bool)

(assert (=> mapNonEmpty!26036 (= mapRes!26036 (and tp!49970 e!476709))))

(declare-fun mapRest!26036 () (Array (_ BitVec 32) ValueCell!7706))

(declare-fun mapValue!26036 () ValueCell!7706)

(declare-fun mapKey!26036 () (_ BitVec 32))

(assert (=> mapNonEmpty!26036 (= (arr!23441 _values!688) (store mapRest!26036 mapKey!26036 mapValue!26036))))

(declare-fun b!854710 () Bool)

(declare-fun res!580195 () Bool)

(assert (=> b!854710 (=> (not res!580195) (not e!476705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48831 (_ BitVec 32)) Bool)

(assert (=> b!854710 (= res!580195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!580194 () Bool)

(assert (=> start!73408 (=> (not res!580194) (not e!476705))))

(assert (=> start!73408 (= res!580194 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23883 _keys!868))))))

(assert (=> start!73408 e!476705))

(declare-fun tp_is_empty!16291 () Bool)

(assert (=> start!73408 tp_is_empty!16291))

(assert (=> start!73408 true))

(assert (=> start!73408 tp!49969))

(declare-fun array_inv!18632 (array!48831) Bool)

(assert (=> start!73408 (array_inv!18632 _keys!868)))

(declare-fun array_inv!18633 (array!48829) Bool)

(assert (=> start!73408 (and (array_inv!18633 _values!688) e!476708)))

(declare-fun b!854711 () Bool)

(declare-fun res!580201 () Bool)

(assert (=> b!854711 (=> (not res!580201) (not e!476705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854711 (= res!580201 (validMask!0 mask!1196))))

(declare-fun b!854712 () Bool)

(assert (=> b!854712 (= e!476706 tp_is_empty!16291)))

(declare-fun b!854713 () Bool)

(assert (=> b!854713 (= e!476707 (= call!38365 call!38366))))

(declare-fun b!854714 () Bool)

(assert (=> b!854714 (= e!476709 tp_is_empty!16291)))

(assert (= (and start!73408 res!580194) b!854711))

(assert (= (and b!854711 res!580201) b!854706))

(assert (= (and b!854706 res!580200) b!854710))

(assert (= (and b!854710 res!580195) b!854702))

(assert (= (and b!854702 res!580196) b!854708))

(assert (= (and b!854708 res!580192) b!854703))

(assert (= (and b!854703 res!580199) b!854701))

(assert (= (and b!854701 res!580198) b!854709))

(assert (= (and b!854709 res!580197) b!854704))

(assert (= (and b!854704 c!92185) b!854707))

(assert (= (and b!854704 (not c!92185)) b!854713))

(assert (= (or b!854707 b!854713) bm!38363))

(assert (= (or b!854707 b!854713) bm!38362))

(assert (= (and b!854704 (not res!580193)) b!854705))

(assert (= (and b!854700 condMapEmpty!26036) mapIsEmpty!26036))

(assert (= (and b!854700 (not condMapEmpty!26036)) mapNonEmpty!26036))

(get-info :version)

(assert (= (and mapNonEmpty!26036 ((_ is ValueCellFull!7706) mapValue!26036)) b!854714))

(assert (= (and b!854700 ((_ is ValueCellFull!7706) mapDefault!26036)) b!854712))

(assert (= start!73408 b!854700))

(declare-fun b_lambda!11701 () Bool)

(assert (=> (not b_lambda!11701) (not b!854705)))

(declare-fun t!23143 () Bool)

(declare-fun tb!4449 () Bool)

(assert (=> (and start!73408 (= defaultEntry!696 defaultEntry!696) t!23143) tb!4449))

(declare-fun result!8517 () Bool)

(assert (=> tb!4449 (= result!8517 tp_is_empty!16291)))

(assert (=> b!854705 t!23143))

(declare-fun b_and!23481 () Bool)

(assert (= b_and!23479 (and (=> t!23143 result!8517) b_and!23481)))

(declare-fun m!796353 () Bool)

(assert (=> b!854711 m!796353))

(declare-fun m!796355 () Bool)

(assert (=> b!854705 m!796355))

(declare-fun m!796357 () Bool)

(assert (=> b!854705 m!796357))

(declare-fun m!796359 () Bool)

(assert (=> b!854705 m!796359))

(declare-fun m!796361 () Bool)

(assert (=> b!854705 m!796361))

(assert (=> b!854705 m!796355))

(declare-fun m!796363 () Bool)

(assert (=> b!854705 m!796363))

(declare-fun m!796365 () Bool)

(assert (=> b!854705 m!796365))

(declare-fun m!796367 () Bool)

(assert (=> b!854705 m!796367))

(declare-fun m!796369 () Bool)

(assert (=> b!854705 m!796369))

(assert (=> b!854705 m!796359))

(declare-fun m!796371 () Bool)

(assert (=> b!854705 m!796371))

(declare-fun m!796373 () Bool)

(assert (=> b!854705 m!796373))

(declare-fun m!796375 () Bool)

(assert (=> b!854705 m!796375))

(declare-fun m!796377 () Bool)

(assert (=> b!854705 m!796377))

(declare-fun m!796379 () Bool)

(assert (=> b!854705 m!796379))

(assert (=> b!854705 m!796367))

(assert (=> bm!38363 m!796365))

(assert (=> b!854704 m!796375))

(assert (=> b!854704 m!796375))

(declare-fun m!796381 () Bool)

(assert (=> b!854704 m!796381))

(declare-fun m!796383 () Bool)

(assert (=> b!854704 m!796383))

(declare-fun m!796385 () Bool)

(assert (=> b!854702 m!796385))

(declare-fun m!796387 () Bool)

(assert (=> b!854710 m!796387))

(declare-fun m!796389 () Bool)

(assert (=> start!73408 m!796389))

(declare-fun m!796391 () Bool)

(assert (=> start!73408 m!796391))

(declare-fun m!796393 () Bool)

(assert (=> mapNonEmpty!26036 m!796393))

(declare-fun m!796395 () Bool)

(assert (=> bm!38362 m!796395))

(declare-fun m!796397 () Bool)

(assert (=> b!854709 m!796397))

(assert (=> b!854709 m!796373))

(declare-fun m!796399 () Bool)

(assert (=> b!854709 m!796399))

(declare-fun m!796401 () Bool)

(assert (=> b!854703 m!796401))

(declare-fun m!796403 () Bool)

(assert (=> b!854707 m!796403))

(declare-fun m!796405 () Bool)

(assert (=> b!854701 m!796405))

(check-sat (not b!854702) (not b!854711) (not b_next!14155) tp_is_empty!16291 (not b_lambda!11701) (not start!73408) (not bm!38363) (not b!854703) (not b!854709) (not mapNonEmpty!26036) (not b!854707) b_and!23481 (not b!854710) (not b!854705) (not b!854704) (not bm!38362))
(check-sat b_and!23481 (not b_next!14155))
