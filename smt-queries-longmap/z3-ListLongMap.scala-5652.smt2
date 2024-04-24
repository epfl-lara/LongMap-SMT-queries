; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73864 () Bool)

(assert start!73864)

(declare-fun b_free!14611 () Bool)

(declare-fun b_next!14611 () Bool)

(assert (=> start!73864 (= b_free!14611 (not b_next!14611))))

(declare-fun tp!51338 () Bool)

(declare-fun b_and!24211 () Bool)

(assert (=> start!73864 (= tp!51338 b_and!24211)))

(declare-fun b!864428 () Bool)

(declare-datatypes ((Unit!29508 0))(
  ( (Unit!29509) )
))
(declare-fun e!481659 () Unit!29508)

(declare-fun Unit!29510 () Unit!29508)

(assert (=> b!864428 (= e!481659 Unit!29510)))

(declare-fun lt!390684 () Unit!29508)

(declare-datatypes ((array!49709 0))(
  ( (array!49710 (arr!23881 (Array (_ BitVec 32) (_ BitVec 64))) (size!24322 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49709)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49709 (_ BitVec 32) (_ BitVec 32)) Unit!29508)

(assert (=> b!864428 (= lt!390684 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16902 0))(
  ( (Nil!16899) (Cons!16898 (h!18035 (_ BitVec 64)) (t!23771 List!16902)) )
))
(declare-fun arrayNoDuplicates!0 (array!49709 (_ BitVec 32) List!16902) Bool)

(assert (=> b!864428 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16899)))

(declare-fun lt!390683 () Unit!29508)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29508)

(assert (=> b!864428 (= lt!390683 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864428 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390681 () Unit!29508)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49709 (_ BitVec 64) (_ BitVec 32) List!16902) Unit!29508)

(assert (=> b!864428 (= lt!390681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16899))))

(assert (=> b!864428 false))

(declare-fun b!864429 () Bool)

(declare-fun e!481661 () Bool)

(declare-fun tp_is_empty!16747 () Bool)

(assert (=> b!864429 (= e!481661 tp_is_empty!16747)))

(declare-fun mapNonEmpty!26720 () Bool)

(declare-fun mapRes!26720 () Bool)

(declare-fun tp!51337 () Bool)

(assert (=> mapNonEmpty!26720 (= mapRes!26720 (and tp!51337 e!481661))))

(declare-fun mapKey!26720 () (_ BitVec 32))

(declare-datatypes ((V!27377 0))(
  ( (V!27378 (val!8421 Int)) )
))
(declare-datatypes ((ValueCell!7934 0))(
  ( (ValueCellFull!7934 (v!10846 V!27377)) (EmptyCell!7934) )
))
(declare-datatypes ((array!49711 0))(
  ( (array!49712 (arr!23882 (Array (_ BitVec 32) ValueCell!7934)) (size!24323 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49711)

(declare-fun mapValue!26720 () ValueCell!7934)

(declare-fun mapRest!26720 () (Array (_ BitVec 32) ValueCell!7934))

(assert (=> mapNonEmpty!26720 (= (arr!23882 _values!688) (store mapRest!26720 mapKey!26720 mapValue!26720))))

(declare-fun b!864431 () Bool)

(declare-fun e!481656 () Bool)

(declare-fun e!481662 () Bool)

(assert (=> b!864431 (= e!481656 (and e!481662 mapRes!26720))))

(declare-fun condMapEmpty!26720 () Bool)

(declare-fun mapDefault!26720 () ValueCell!7934)

(assert (=> b!864431 (= condMapEmpty!26720 (= (arr!23882 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7934)) mapDefault!26720)))))

(declare-fun b!864432 () Bool)

(declare-fun res!587130 () Bool)

(declare-fun e!481660 () Bool)

(assert (=> b!864432 (=> (not res!587130) (not e!481660))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!864432 (= res!587130 (and (= (size!24323 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24322 _keys!868) (size!24323 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864433 () Bool)

(declare-fun Unit!29511 () Unit!29508)

(assert (=> b!864433 (= e!481659 Unit!29511)))

(declare-fun b!864434 () Bool)

(declare-fun e!481663 () Bool)

(assert (=> b!864434 (= e!481660 e!481663)))

(declare-fun res!587129 () Bool)

(assert (=> b!864434 (=> (not res!587129) (not e!481663))))

(assert (=> b!864434 (= res!587129 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11070 0))(
  ( (tuple2!11071 (_1!5546 (_ BitVec 64)) (_2!5546 V!27377)) )
))
(declare-datatypes ((List!16903 0))(
  ( (Nil!16900) (Cons!16899 (h!18036 tuple2!11070) (t!23772 List!16903)) )
))
(declare-datatypes ((ListLongMap!9841 0))(
  ( (ListLongMap!9842 (toList!4936 List!16903)) )
))
(declare-fun lt!390675 () ListLongMap!9841)

(declare-fun minValue!654 () V!27377)

(declare-fun zeroValue!654 () V!27377)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!390676 () array!49711)

(declare-fun getCurrentListMapNoExtraKeys!2986 (array!49709 array!49711 (_ BitVec 32) (_ BitVec 32) V!27377 V!27377 (_ BitVec 32) Int) ListLongMap!9841)

(assert (=> b!864434 (= lt!390675 (getCurrentListMapNoExtraKeys!2986 _keys!868 lt!390676 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27377)

(assert (=> b!864434 (= lt!390676 (array!49712 (store (arr!23882 _values!688) i!612 (ValueCellFull!7934 v!557)) (size!24323 _values!688)))))

(declare-fun lt!390682 () ListLongMap!9841)

(assert (=> b!864434 (= lt!390682 (getCurrentListMapNoExtraKeys!2986 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864435 () Bool)

(declare-fun res!587132 () Bool)

(assert (=> b!864435 (=> (not res!587132) (not e!481660))))

(assert (=> b!864435 (= res!587132 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16899))))

(declare-fun b!864436 () Bool)

(declare-fun res!587125 () Bool)

(assert (=> b!864436 (=> (not res!587125) (not e!481660))))

(assert (=> b!864436 (= res!587125 (and (= (select (arr!23881 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864437 () Bool)

(declare-fun res!587128 () Bool)

(assert (=> b!864437 (=> (not res!587128) (not e!481660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864437 (= res!587128 (validMask!0 mask!1196))))

(declare-fun b!864438 () Bool)

(declare-fun res!587124 () Bool)

(assert (=> b!864438 (=> (not res!587124) (not e!481660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864438 (= res!587124 (validKeyInArray!0 k0!854))))

(declare-fun b!864439 () Bool)

(declare-fun e!481655 () Bool)

(assert (=> b!864439 (= e!481663 (not e!481655))))

(declare-fun res!587127 () Bool)

(assert (=> b!864439 (=> res!587127 e!481655)))

(assert (=> b!864439 (= res!587127 (not (validKeyInArray!0 (select (arr!23881 _keys!868) from!1053))))))

(declare-fun lt!390674 () ListLongMap!9841)

(declare-fun lt!390689 () ListLongMap!9841)

(assert (=> b!864439 (= lt!390674 lt!390689)))

(declare-fun lt!390687 () ListLongMap!9841)

(declare-fun lt!390680 () tuple2!11070)

(declare-fun +!2339 (ListLongMap!9841 tuple2!11070) ListLongMap!9841)

(assert (=> b!864439 (= lt!390689 (+!2339 lt!390687 lt!390680))))

(assert (=> b!864439 (= lt!390674 (getCurrentListMapNoExtraKeys!2986 _keys!868 lt!390676 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864439 (= lt!390680 (tuple2!11071 k0!854 v!557))))

(assert (=> b!864439 (= lt!390687 (getCurrentListMapNoExtraKeys!2986 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390688 () Unit!29508)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!524 (array!49709 array!49711 (_ BitVec 32) (_ BitVec 32) V!27377 V!27377 (_ BitVec 32) (_ BitVec 64) V!27377 (_ BitVec 32) Int) Unit!29508)

(assert (=> b!864439 (= lt!390688 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!524 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864440 () Bool)

(declare-fun e!481657 () Bool)

(assert (=> b!864440 (= e!481655 e!481657)))

(declare-fun res!587131 () Bool)

(assert (=> b!864440 (=> res!587131 e!481657)))

(assert (=> b!864440 (= res!587131 (= k0!854 (select (arr!23881 _keys!868) from!1053)))))

(assert (=> b!864440 (not (= (select (arr!23881 _keys!868) from!1053) k0!854))))

(declare-fun lt!390686 () Unit!29508)

(assert (=> b!864440 (= lt!390686 e!481659)))

(declare-fun c!92419 () Bool)

(assert (=> b!864440 (= c!92419 (= (select (arr!23881 _keys!868) from!1053) k0!854))))

(declare-fun lt!390679 () ListLongMap!9841)

(assert (=> b!864440 (= lt!390675 lt!390679)))

(declare-fun lt!390685 () tuple2!11070)

(assert (=> b!864440 (= lt!390679 (+!2339 lt!390689 lt!390685))))

(declare-fun lt!390678 () V!27377)

(assert (=> b!864440 (= lt!390685 (tuple2!11071 (select (arr!23881 _keys!868) from!1053) lt!390678))))

(declare-fun get!12618 (ValueCell!7934 V!27377) V!27377)

(declare-fun dynLambda!1164 (Int (_ BitVec 64)) V!27377)

(assert (=> b!864440 (= lt!390678 (get!12618 (select (arr!23882 _values!688) from!1053) (dynLambda!1164 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!26720 () Bool)

(assert (=> mapIsEmpty!26720 mapRes!26720))

(declare-fun b!864441 () Bool)

(declare-fun res!587126 () Bool)

(assert (=> b!864441 (=> (not res!587126) (not e!481660))))

(assert (=> b!864441 (= res!587126 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24322 _keys!868))))))

(declare-fun b!864430 () Bool)

(declare-fun res!587133 () Bool)

(assert (=> b!864430 (=> (not res!587133) (not e!481660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49709 (_ BitVec 32)) Bool)

(assert (=> b!864430 (= res!587133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!587134 () Bool)

(assert (=> start!73864 (=> (not res!587134) (not e!481660))))

(assert (=> start!73864 (= res!587134 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24322 _keys!868))))))

(assert (=> start!73864 e!481660))

(assert (=> start!73864 tp_is_empty!16747))

(assert (=> start!73864 true))

(assert (=> start!73864 tp!51338))

(declare-fun array_inv!18944 (array!49709) Bool)

(assert (=> start!73864 (array_inv!18944 _keys!868)))

(declare-fun array_inv!18945 (array!49711) Bool)

(assert (=> start!73864 (and (array_inv!18945 _values!688) e!481656)))

(declare-fun b!864442 () Bool)

(assert (=> b!864442 (= e!481657 true)))

(assert (=> b!864442 (= lt!390679 (+!2339 (+!2339 lt!390687 lt!390685) lt!390680))))

(declare-fun lt!390677 () Unit!29508)

(declare-fun addCommutativeForDiffKeys!490 (ListLongMap!9841 (_ BitVec 64) V!27377 (_ BitVec 64) V!27377) Unit!29508)

(assert (=> b!864442 (= lt!390677 (addCommutativeForDiffKeys!490 lt!390687 k0!854 v!557 (select (arr!23881 _keys!868) from!1053) lt!390678))))

(declare-fun b!864443 () Bool)

(assert (=> b!864443 (= e!481662 tp_is_empty!16747)))

(assert (= (and start!73864 res!587134) b!864437))

(assert (= (and b!864437 res!587128) b!864432))

(assert (= (and b!864432 res!587130) b!864430))

(assert (= (and b!864430 res!587133) b!864435))

(assert (= (and b!864435 res!587132) b!864441))

(assert (= (and b!864441 res!587126) b!864438))

(assert (= (and b!864438 res!587124) b!864436))

(assert (= (and b!864436 res!587125) b!864434))

(assert (= (and b!864434 res!587129) b!864439))

(assert (= (and b!864439 (not res!587127)) b!864440))

(assert (= (and b!864440 c!92419) b!864428))

(assert (= (and b!864440 (not c!92419)) b!864433))

(assert (= (and b!864440 (not res!587131)) b!864442))

(assert (= (and b!864431 condMapEmpty!26720) mapIsEmpty!26720))

(assert (= (and b!864431 (not condMapEmpty!26720)) mapNonEmpty!26720))

(get-info :version)

(assert (= (and mapNonEmpty!26720 ((_ is ValueCellFull!7934) mapValue!26720)) b!864429))

(assert (= (and b!864431 ((_ is ValueCellFull!7934) mapDefault!26720)) b!864443))

(assert (= start!73864 b!864431))

(declare-fun b_lambda!11977 () Bool)

(assert (=> (not b_lambda!11977) (not b!864440)))

(declare-fun t!23770 () Bool)

(declare-fun tb!4725 () Bool)

(assert (=> (and start!73864 (= defaultEntry!696 defaultEntry!696) t!23770) tb!4725))

(declare-fun result!9069 () Bool)

(assert (=> tb!4725 (= result!9069 tp_is_empty!16747)))

(assert (=> b!864440 t!23770))

(declare-fun b_and!24213 () Bool)

(assert (= b_and!24211 (and (=> t!23770 result!9069) b_and!24213)))

(declare-fun m!806009 () Bool)

(assert (=> b!864428 m!806009))

(declare-fun m!806011 () Bool)

(assert (=> b!864428 m!806011))

(declare-fun m!806013 () Bool)

(assert (=> b!864428 m!806013))

(declare-fun m!806015 () Bool)

(assert (=> b!864428 m!806015))

(declare-fun m!806017 () Bool)

(assert (=> b!864428 m!806017))

(declare-fun m!806019 () Bool)

(assert (=> start!73864 m!806019))

(declare-fun m!806021 () Bool)

(assert (=> start!73864 m!806021))

(declare-fun m!806023 () Bool)

(assert (=> mapNonEmpty!26720 m!806023))

(declare-fun m!806025 () Bool)

(assert (=> b!864440 m!806025))

(declare-fun m!806027 () Bool)

(assert (=> b!864440 m!806027))

(declare-fun m!806029 () Bool)

(assert (=> b!864440 m!806029))

(declare-fun m!806031 () Bool)

(assert (=> b!864440 m!806031))

(assert (=> b!864440 m!806027))

(declare-fun m!806033 () Bool)

(assert (=> b!864440 m!806033))

(assert (=> b!864440 m!806029))

(declare-fun m!806035 () Bool)

(assert (=> b!864430 m!806035))

(declare-fun m!806037 () Bool)

(assert (=> b!864436 m!806037))

(declare-fun m!806039 () Bool)

(assert (=> b!864437 m!806039))

(declare-fun m!806041 () Bool)

(assert (=> b!864434 m!806041))

(declare-fun m!806043 () Bool)

(assert (=> b!864434 m!806043))

(declare-fun m!806045 () Bool)

(assert (=> b!864434 m!806045))

(declare-fun m!806047 () Bool)

(assert (=> b!864439 m!806047))

(declare-fun m!806049 () Bool)

(assert (=> b!864439 m!806049))

(assert (=> b!864439 m!806033))

(declare-fun m!806051 () Bool)

(assert (=> b!864439 m!806051))

(declare-fun m!806053 () Bool)

(assert (=> b!864439 m!806053))

(assert (=> b!864439 m!806033))

(declare-fun m!806055 () Bool)

(assert (=> b!864439 m!806055))

(declare-fun m!806057 () Bool)

(assert (=> b!864438 m!806057))

(declare-fun m!806059 () Bool)

(assert (=> b!864435 m!806059))

(declare-fun m!806061 () Bool)

(assert (=> b!864442 m!806061))

(assert (=> b!864442 m!806061))

(declare-fun m!806063 () Bool)

(assert (=> b!864442 m!806063))

(assert (=> b!864442 m!806033))

(assert (=> b!864442 m!806033))

(declare-fun m!806065 () Bool)

(assert (=> b!864442 m!806065))

(check-sat (not mapNonEmpty!26720) (not b!864437) tp_is_empty!16747 (not b!864430) (not b_lambda!11977) (not b!864434) b_and!24213 (not b_next!14611) (not start!73864) (not b!864428) (not b!864442) (not b!864438) (not b!864439) (not b!864440) (not b!864435))
(check-sat b_and!24213 (not b_next!14611))
