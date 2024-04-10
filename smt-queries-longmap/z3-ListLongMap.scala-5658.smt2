; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73734 () Bool)

(assert start!73734)

(declare-fun b_free!14649 () Bool)

(declare-fun b_next!14649 () Bool)

(assert (=> start!73734 (= b_free!14649 (not b_next!14649))))

(declare-fun tp!51450 () Bool)

(declare-fun b_and!24277 () Bool)

(assert (=> start!73734 (= tp!51450 b_and!24277)))

(declare-fun mapNonEmpty!26777 () Bool)

(declare-fun mapRes!26777 () Bool)

(declare-fun tp!51451 () Bool)

(declare-fun e!481586 () Bool)

(assert (=> mapNonEmpty!26777 (= mapRes!26777 (and tp!51451 e!481586))))

(declare-datatypes ((V!27427 0))(
  ( (V!27428 (val!8440 Int)) )
))
(declare-datatypes ((ValueCell!7953 0))(
  ( (ValueCellFull!7953 (v!10865 V!27427)) (EmptyCell!7953) )
))
(declare-fun mapRest!26777 () (Array (_ BitVec 32) ValueCell!7953))

(declare-fun mapValue!26777 () ValueCell!7953)

(declare-fun mapKey!26777 () (_ BitVec 32))

(declare-datatypes ((array!49730 0))(
  ( (array!49731 (arr!23896 (Array (_ BitVec 32) ValueCell!7953)) (size!24336 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49730)

(assert (=> mapNonEmpty!26777 (= (arr!23896 _values!688) (store mapRest!26777 mapKey!26777 mapValue!26777))))

(declare-fun b!864475 () Bool)

(declare-fun res!587407 () Bool)

(declare-fun e!481591 () Bool)

(assert (=> b!864475 (=> (not res!587407) (not e!481591))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49732 0))(
  ( (array!49733 (arr!23897 (Array (_ BitVec 32) (_ BitVec 64))) (size!24337 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49732)

(assert (=> b!864475 (= res!587407 (and (= (size!24336 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24337 _keys!868) (size!24336 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864476 () Bool)

(declare-fun tp_is_empty!16785 () Bool)

(assert (=> b!864476 (= e!481586 tp_is_empty!16785)))

(declare-fun b!864477 () Bool)

(declare-fun res!587408 () Bool)

(assert (=> b!864477 (=> (not res!587408) (not e!481591))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864477 (= res!587408 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24337 _keys!868))))))

(declare-fun b!864478 () Bool)

(declare-fun res!587416 () Bool)

(assert (=> b!864478 (=> (not res!587416) (not e!481591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49732 (_ BitVec 32)) Bool)

(assert (=> b!864478 (= res!587416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864479 () Bool)

(declare-fun res!587415 () Bool)

(assert (=> b!864479 (=> (not res!587415) (not e!481591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864479 (= res!587415 (validMask!0 mask!1196))))

(declare-fun b!864480 () Bool)

(declare-fun e!481589 () Bool)

(assert (=> b!864480 (= e!481589 tp_is_empty!16785)))

(declare-fun res!587414 () Bool)

(assert (=> start!73734 (=> (not res!587414) (not e!481591))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73734 (= res!587414 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24337 _keys!868))))))

(assert (=> start!73734 e!481591))

(assert (=> start!73734 tp_is_empty!16785))

(assert (=> start!73734 true))

(assert (=> start!73734 tp!51450))

(declare-fun array_inv!18898 (array!49732) Bool)

(assert (=> start!73734 (array_inv!18898 _keys!868)))

(declare-fun e!481587 () Bool)

(declare-fun array_inv!18899 (array!49730) Bool)

(assert (=> start!73734 (and (array_inv!18899 _values!688) e!481587)))

(declare-fun mapIsEmpty!26777 () Bool)

(assert (=> mapIsEmpty!26777 mapRes!26777))

(declare-fun b!864481 () Bool)

(declare-fun res!587409 () Bool)

(assert (=> b!864481 (=> (not res!587409) (not e!481591))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!864481 (= res!587409 (and (= (select (arr!23897 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864482 () Bool)

(assert (=> b!864482 (= e!481587 (and e!481589 mapRes!26777))))

(declare-fun condMapEmpty!26777 () Bool)

(declare-fun mapDefault!26777 () ValueCell!7953)

(assert (=> b!864482 (= condMapEmpty!26777 (= (arr!23896 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7953)) mapDefault!26777)))))

(declare-fun b!864483 () Bool)

(declare-fun e!481590 () Bool)

(assert (=> b!864483 (= e!481591 e!481590)))

(declare-fun res!587412 () Bool)

(assert (=> b!864483 (=> (not res!587412) (not e!481590))))

(assert (=> b!864483 (= res!587412 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11176 0))(
  ( (tuple2!11177 (_1!5599 (_ BitVec 64)) (_2!5599 V!27427)) )
))
(declare-datatypes ((List!16981 0))(
  ( (Nil!16978) (Cons!16977 (h!18108 tuple2!11176) (t!23896 List!16981)) )
))
(declare-datatypes ((ListLongMap!9945 0))(
  ( (ListLongMap!9946 (toList!4988 List!16981)) )
))
(declare-fun lt!391234 () ListLongMap!9945)

(declare-fun lt!391238 () array!49730)

(declare-fun minValue!654 () V!27427)

(declare-fun zeroValue!654 () V!27427)

(declare-fun getCurrentListMapNoExtraKeys!2960 (array!49732 array!49730 (_ BitVec 32) (_ BitVec 32) V!27427 V!27427 (_ BitVec 32) Int) ListLongMap!9945)

(assert (=> b!864483 (= lt!391234 (getCurrentListMapNoExtraKeys!2960 _keys!868 lt!391238 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27427)

(assert (=> b!864483 (= lt!391238 (array!49731 (store (arr!23896 _values!688) i!612 (ValueCellFull!7953 v!557)) (size!24336 _values!688)))))

(declare-fun lt!391240 () ListLongMap!9945)

(assert (=> b!864483 (= lt!391240 (getCurrentListMapNoExtraKeys!2960 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864484 () Bool)

(declare-fun res!587413 () Bool)

(assert (=> b!864484 (=> (not res!587413) (not e!481591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864484 (= res!587413 (validKeyInArray!0 k0!854))))

(declare-fun b!864485 () Bool)

(declare-fun e!481592 () Bool)

(declare-fun e!481594 () Bool)

(assert (=> b!864485 (= e!481592 e!481594)))

(declare-fun res!587410 () Bool)

(assert (=> b!864485 (=> res!587410 e!481594)))

(assert (=> b!864485 (= res!587410 (= k0!854 (select (arr!23897 _keys!868) from!1053)))))

(assert (=> b!864485 (not (= (select (arr!23897 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29575 0))(
  ( (Unit!29576) )
))
(declare-fun lt!391232 () Unit!29575)

(declare-fun e!481588 () Unit!29575)

(assert (=> b!864485 (= lt!391232 e!481588)))

(declare-fun c!92194 () Bool)

(assert (=> b!864485 (= c!92194 (= (select (arr!23897 _keys!868) from!1053) k0!854))))

(declare-fun lt!391228 () ListLongMap!9945)

(assert (=> b!864485 (= lt!391234 lt!391228)))

(declare-fun lt!391230 () ListLongMap!9945)

(declare-fun lt!391225 () tuple2!11176)

(declare-fun +!2337 (ListLongMap!9945 tuple2!11176) ListLongMap!9945)

(assert (=> b!864485 (= lt!391228 (+!2337 lt!391230 lt!391225))))

(declare-fun lt!391236 () V!27427)

(assert (=> b!864485 (= lt!391225 (tuple2!11177 (select (arr!23897 _keys!868) from!1053) lt!391236))))

(declare-fun get!12623 (ValueCell!7953 V!27427) V!27427)

(declare-fun dynLambda!1163 (Int (_ BitVec 64)) V!27427)

(assert (=> b!864485 (= lt!391236 (get!12623 (select (arr!23896 _values!688) from!1053) (dynLambda!1163 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864486 () Bool)

(declare-fun Unit!29577 () Unit!29575)

(assert (=> b!864486 (= e!481588 Unit!29577)))

(declare-fun lt!391237 () Unit!29575)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49732 (_ BitVec 32) (_ BitVec 32)) Unit!29575)

(assert (=> b!864486 (= lt!391237 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16982 0))(
  ( (Nil!16979) (Cons!16978 (h!18109 (_ BitVec 64)) (t!23897 List!16982)) )
))
(declare-fun arrayNoDuplicates!0 (array!49732 (_ BitVec 32) List!16982) Bool)

(assert (=> b!864486 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16979)))

(declare-fun lt!391229 () Unit!29575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49732 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29575)

(assert (=> b!864486 (= lt!391229 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864486 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391235 () Unit!29575)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49732 (_ BitVec 64) (_ BitVec 32) List!16982) Unit!29575)

(assert (=> b!864486 (= lt!391235 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16979))))

(assert (=> b!864486 false))

(declare-fun b!864487 () Bool)

(declare-fun res!587411 () Bool)

(assert (=> b!864487 (=> (not res!587411) (not e!481591))))

(assert (=> b!864487 (= res!587411 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16979))))

(declare-fun b!864488 () Bool)

(assert (=> b!864488 (= e!481594 true)))

(declare-fun lt!391231 () tuple2!11176)

(declare-fun lt!391227 () ListLongMap!9945)

(assert (=> b!864488 (= lt!391228 (+!2337 (+!2337 lt!391227 lt!391225) lt!391231))))

(declare-fun lt!391233 () Unit!29575)

(declare-fun addCommutativeForDiffKeys!509 (ListLongMap!9945 (_ BitVec 64) V!27427 (_ BitVec 64) V!27427) Unit!29575)

(assert (=> b!864488 (= lt!391233 (addCommutativeForDiffKeys!509 lt!391227 k0!854 v!557 (select (arr!23897 _keys!868) from!1053) lt!391236))))

(declare-fun b!864489 () Bool)

(declare-fun Unit!29578 () Unit!29575)

(assert (=> b!864489 (= e!481588 Unit!29578)))

(declare-fun b!864490 () Bool)

(assert (=> b!864490 (= e!481590 (not e!481592))))

(declare-fun res!587417 () Bool)

(assert (=> b!864490 (=> res!587417 e!481592)))

(assert (=> b!864490 (= res!587417 (not (validKeyInArray!0 (select (arr!23897 _keys!868) from!1053))))))

(declare-fun lt!391226 () ListLongMap!9945)

(assert (=> b!864490 (= lt!391226 lt!391230)))

(assert (=> b!864490 (= lt!391230 (+!2337 lt!391227 lt!391231))))

(assert (=> b!864490 (= lt!391226 (getCurrentListMapNoExtraKeys!2960 _keys!868 lt!391238 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864490 (= lt!391231 (tuple2!11177 k0!854 v!557))))

(assert (=> b!864490 (= lt!391227 (getCurrentListMapNoExtraKeys!2960 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391239 () Unit!29575)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!540 (array!49732 array!49730 (_ BitVec 32) (_ BitVec 32) V!27427 V!27427 (_ BitVec 32) (_ BitVec 64) V!27427 (_ BitVec 32) Int) Unit!29575)

(assert (=> b!864490 (= lt!391239 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!540 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73734 res!587414) b!864479))

(assert (= (and b!864479 res!587415) b!864475))

(assert (= (and b!864475 res!587407) b!864478))

(assert (= (and b!864478 res!587416) b!864487))

(assert (= (and b!864487 res!587411) b!864477))

(assert (= (and b!864477 res!587408) b!864484))

(assert (= (and b!864484 res!587413) b!864481))

(assert (= (and b!864481 res!587409) b!864483))

(assert (= (and b!864483 res!587412) b!864490))

(assert (= (and b!864490 (not res!587417)) b!864485))

(assert (= (and b!864485 c!92194) b!864486))

(assert (= (and b!864485 (not c!92194)) b!864489))

(assert (= (and b!864485 (not res!587410)) b!864488))

(assert (= (and b!864482 condMapEmpty!26777) mapIsEmpty!26777))

(assert (= (and b!864482 (not condMapEmpty!26777)) mapNonEmpty!26777))

(get-info :version)

(assert (= (and mapNonEmpty!26777 ((_ is ValueCellFull!7953) mapValue!26777)) b!864476))

(assert (= (and b!864482 ((_ is ValueCellFull!7953) mapDefault!26777)) b!864480))

(assert (= start!73734 b!864482))

(declare-fun b_lambda!12001 () Bool)

(assert (=> (not b_lambda!12001) (not b!864485)))

(declare-fun t!23895 () Bool)

(declare-fun tb!4771 () Bool)

(assert (=> (and start!73734 (= defaultEntry!696 defaultEntry!696) t!23895) tb!4771))

(declare-fun result!9153 () Bool)

(assert (=> tb!4771 (= result!9153 tp_is_empty!16785)))

(assert (=> b!864485 t!23895))

(declare-fun b_and!24279 () Bool)

(assert (= b_and!24277 (and (=> t!23895 result!9153) b_and!24279)))

(declare-fun m!805821 () Bool)

(assert (=> start!73734 m!805821))

(declare-fun m!805823 () Bool)

(assert (=> start!73734 m!805823))

(declare-fun m!805825 () Bool)

(assert (=> mapNonEmpty!26777 m!805825))

(declare-fun m!805827 () Bool)

(assert (=> b!864490 m!805827))

(declare-fun m!805829 () Bool)

(assert (=> b!864490 m!805829))

(declare-fun m!805831 () Bool)

(assert (=> b!864490 m!805831))

(declare-fun m!805833 () Bool)

(assert (=> b!864490 m!805833))

(declare-fun m!805835 () Bool)

(assert (=> b!864490 m!805835))

(assert (=> b!864490 m!805833))

(declare-fun m!805837 () Bool)

(assert (=> b!864490 m!805837))

(declare-fun m!805839 () Bool)

(assert (=> b!864485 m!805839))

(declare-fun m!805841 () Bool)

(assert (=> b!864485 m!805841))

(declare-fun m!805843 () Bool)

(assert (=> b!864485 m!805843))

(declare-fun m!805845 () Bool)

(assert (=> b!864485 m!805845))

(assert (=> b!864485 m!805841))

(assert (=> b!864485 m!805833))

(assert (=> b!864485 m!805843))

(declare-fun m!805847 () Bool)

(assert (=> b!864488 m!805847))

(assert (=> b!864488 m!805847))

(declare-fun m!805849 () Bool)

(assert (=> b!864488 m!805849))

(assert (=> b!864488 m!805833))

(assert (=> b!864488 m!805833))

(declare-fun m!805851 () Bool)

(assert (=> b!864488 m!805851))

(declare-fun m!805853 () Bool)

(assert (=> b!864483 m!805853))

(declare-fun m!805855 () Bool)

(assert (=> b!864483 m!805855))

(declare-fun m!805857 () Bool)

(assert (=> b!864483 m!805857))

(declare-fun m!805859 () Bool)

(assert (=> b!864479 m!805859))

(declare-fun m!805861 () Bool)

(assert (=> b!864487 m!805861))

(declare-fun m!805863 () Bool)

(assert (=> b!864486 m!805863))

(declare-fun m!805865 () Bool)

(assert (=> b!864486 m!805865))

(declare-fun m!805867 () Bool)

(assert (=> b!864486 m!805867))

(declare-fun m!805869 () Bool)

(assert (=> b!864486 m!805869))

(declare-fun m!805871 () Bool)

(assert (=> b!864486 m!805871))

(declare-fun m!805873 () Bool)

(assert (=> b!864484 m!805873))

(declare-fun m!805875 () Bool)

(assert (=> b!864478 m!805875))

(declare-fun m!805877 () Bool)

(assert (=> b!864481 m!805877))

(check-sat (not b!864478) (not b!864479) (not b!864483) (not b!864484) (not b!864490) (not b!864486) (not b!864487) (not b!864488) (not start!73734) (not b_next!14649) (not b!864485) (not mapNonEmpty!26777) tp_is_empty!16785 (not b_lambda!12001) b_and!24279)
(check-sat b_and!24279 (not b_next!14649))
