; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73696 () Bool)

(assert start!73696)

(declare-fun b_free!14629 () Bool)

(declare-fun b_next!14629 () Bool)

(assert (=> start!73696 (= b_free!14629 (not b_next!14629))))

(declare-fun tp!51391 () Bool)

(declare-fun b_and!24211 () Bool)

(assert (=> start!73696 (= tp!51391 b_and!24211)))

(declare-fun b!863736 () Bool)

(declare-fun res!586971 () Bool)

(declare-fun e!481171 () Bool)

(assert (=> b!863736 (=> (not res!586971) (not e!481171))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49683 0))(
  ( (array!49684 (arr!23873 (Array (_ BitVec 32) (_ BitVec 64))) (size!24315 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49683)

(declare-datatypes ((V!27401 0))(
  ( (V!27402 (val!8430 Int)) )
))
(declare-datatypes ((ValueCell!7943 0))(
  ( (ValueCellFull!7943 (v!10849 V!27401)) (EmptyCell!7943) )
))
(declare-datatypes ((array!49685 0))(
  ( (array!49686 (arr!23874 (Array (_ BitVec 32) ValueCell!7943)) (size!24316 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49685)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!863736 (= res!586971 (and (= (size!24316 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24315 _keys!868) (size!24316 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863738 () Bool)

(declare-fun res!586968 () Bool)

(assert (=> b!863738 (=> (not res!586968) (not e!481171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863738 (= res!586968 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26747 () Bool)

(declare-fun mapRes!26747 () Bool)

(declare-fun tp!51392 () Bool)

(declare-fun e!481175 () Bool)

(assert (=> mapNonEmpty!26747 (= mapRes!26747 (and tp!51392 e!481175))))

(declare-fun mapKey!26747 () (_ BitVec 32))

(declare-fun mapRest!26747 () (Array (_ BitVec 32) ValueCell!7943))

(declare-fun mapValue!26747 () ValueCell!7943)

(assert (=> mapNonEmpty!26747 (= (arr!23874 _values!688) (store mapRest!26747 mapKey!26747 mapValue!26747))))

(declare-fun b!863739 () Bool)

(declare-fun e!481170 () Bool)

(declare-fun tp_is_empty!16765 () Bool)

(assert (=> b!863739 (= e!481170 tp_is_empty!16765)))

(declare-fun b!863740 () Bool)

(declare-fun e!481176 () Bool)

(assert (=> b!863740 (= e!481171 e!481176)))

(declare-fun res!586969 () Bool)

(assert (=> b!863740 (=> (not res!586969) (not e!481176))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863740 (= res!586969 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11174 0))(
  ( (tuple2!11175 (_1!5598 (_ BitVec 64)) (_2!5598 V!27401)) )
))
(declare-datatypes ((List!16967 0))(
  ( (Nil!16964) (Cons!16963 (h!18094 tuple2!11174) (t!23853 List!16967)) )
))
(declare-datatypes ((ListLongMap!9933 0))(
  ( (ListLongMap!9934 (toList!4982 List!16967)) )
))
(declare-fun lt!390523 () ListLongMap!9933)

(declare-fun lt!390514 () array!49685)

(declare-fun minValue!654 () V!27401)

(declare-fun zeroValue!654 () V!27401)

(declare-fun getCurrentListMapNoExtraKeys!2981 (array!49683 array!49685 (_ BitVec 32) (_ BitVec 32) V!27401 V!27401 (_ BitVec 32) Int) ListLongMap!9933)

(assert (=> b!863740 (= lt!390523 (getCurrentListMapNoExtraKeys!2981 _keys!868 lt!390514 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27401)

(assert (=> b!863740 (= lt!390514 (array!49686 (store (arr!23874 _values!688) i!612 (ValueCellFull!7943 v!557)) (size!24316 _values!688)))))

(declare-fun lt!390519 () ListLongMap!9933)

(assert (=> b!863740 (= lt!390519 (getCurrentListMapNoExtraKeys!2981 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863741 () Bool)

(declare-fun e!481168 () Bool)

(assert (=> b!863741 (= e!481168 true)))

(declare-fun lt!390515 () tuple2!11174)

(declare-fun lt!390513 () tuple2!11174)

(declare-fun lt!390509 () ListLongMap!9933)

(declare-fun lt!390518 () ListLongMap!9933)

(declare-fun +!2351 (ListLongMap!9933 tuple2!11174) ListLongMap!9933)

(assert (=> b!863741 (= lt!390509 (+!2351 (+!2351 lt!390518 lt!390513) lt!390515))))

(declare-fun lt!390516 () V!27401)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29470 0))(
  ( (Unit!29471) )
))
(declare-fun lt!390517 () Unit!29470)

(declare-fun addCommutativeForDiffKeys!495 (ListLongMap!9933 (_ BitVec 64) V!27401 (_ BitVec 64) V!27401) Unit!29470)

(assert (=> b!863741 (= lt!390517 (addCommutativeForDiffKeys!495 lt!390518 k0!854 v!557 (select (arr!23873 _keys!868) from!1053) lt!390516))))

(declare-fun mapIsEmpty!26747 () Bool)

(assert (=> mapIsEmpty!26747 mapRes!26747))

(declare-fun b!863742 () Bool)

(assert (=> b!863742 (= e!481175 tp_is_empty!16765)))

(declare-fun b!863743 () Bool)

(declare-fun e!481174 () Bool)

(assert (=> b!863743 (= e!481176 (not e!481174))))

(declare-fun res!586976 () Bool)

(assert (=> b!863743 (=> res!586976 e!481174)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863743 (= res!586976 (not (validKeyInArray!0 (select (arr!23873 _keys!868) from!1053))))))

(declare-fun lt!390522 () ListLongMap!9933)

(declare-fun lt!390521 () ListLongMap!9933)

(assert (=> b!863743 (= lt!390522 lt!390521)))

(assert (=> b!863743 (= lt!390521 (+!2351 lt!390518 lt!390515))))

(assert (=> b!863743 (= lt!390522 (getCurrentListMapNoExtraKeys!2981 _keys!868 lt!390514 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863743 (= lt!390515 (tuple2!11175 k0!854 v!557))))

(assert (=> b!863743 (= lt!390518 (getCurrentListMapNoExtraKeys!2981 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390520 () Unit!29470)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!531 (array!49683 array!49685 (_ BitVec 32) (_ BitVec 32) V!27401 V!27401 (_ BitVec 32) (_ BitVec 64) V!27401 (_ BitVec 32) Int) Unit!29470)

(assert (=> b!863743 (= lt!390520 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!531 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863744 () Bool)

(declare-fun res!586970 () Bool)

(assert (=> b!863744 (=> (not res!586970) (not e!481171))))

(assert (=> b!863744 (= res!586970 (and (= (select (arr!23873 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863745 () Bool)

(declare-fun e!481169 () Bool)

(assert (=> b!863745 (= e!481169 (and e!481170 mapRes!26747))))

(declare-fun condMapEmpty!26747 () Bool)

(declare-fun mapDefault!26747 () ValueCell!7943)

(assert (=> b!863745 (= condMapEmpty!26747 (= (arr!23874 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7943)) mapDefault!26747)))))

(declare-fun b!863746 () Bool)

(assert (=> b!863746 (= e!481174 e!481168)))

(declare-fun res!586972 () Bool)

(assert (=> b!863746 (=> res!586972 e!481168)))

(assert (=> b!863746 (= res!586972 (= k0!854 (select (arr!23873 _keys!868) from!1053)))))

(assert (=> b!863746 (not (= (select (arr!23873 _keys!868) from!1053) k0!854))))

(declare-fun lt!390512 () Unit!29470)

(declare-fun e!481172 () Unit!29470)

(assert (=> b!863746 (= lt!390512 e!481172)))

(declare-fun c!92099 () Bool)

(assert (=> b!863746 (= c!92099 (= (select (arr!23873 _keys!868) from!1053) k0!854))))

(assert (=> b!863746 (= lt!390523 lt!390509)))

(assert (=> b!863746 (= lt!390509 (+!2351 lt!390521 lt!390513))))

(assert (=> b!863746 (= lt!390513 (tuple2!11175 (select (arr!23873 _keys!868) from!1053) lt!390516))))

(declare-fun get!12610 (ValueCell!7943 V!27401) V!27401)

(declare-fun dynLambda!1153 (Int (_ BitVec 64)) V!27401)

(assert (=> b!863746 (= lt!390516 (get!12610 (select (arr!23874 _values!688) from!1053) (dynLambda!1153 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863747 () Bool)

(declare-fun Unit!29472 () Unit!29470)

(assert (=> b!863747 (= e!481172 Unit!29472)))

(declare-fun lt!390524 () Unit!29470)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49683 (_ BitVec 32) (_ BitVec 32)) Unit!29470)

(assert (=> b!863747 (= lt!390524 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16968 0))(
  ( (Nil!16965) (Cons!16964 (h!18095 (_ BitVec 64)) (t!23854 List!16968)) )
))
(declare-fun arrayNoDuplicates!0 (array!49683 (_ BitVec 32) List!16968) Bool)

(assert (=> b!863747 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16965)))

(declare-fun lt!390511 () Unit!29470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29470)

(assert (=> b!863747 (= lt!390511 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863747 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390510 () Unit!29470)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49683 (_ BitVec 64) (_ BitVec 32) List!16968) Unit!29470)

(assert (=> b!863747 (= lt!390510 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16965))))

(assert (=> b!863747 false))

(declare-fun res!586974 () Bool)

(assert (=> start!73696 (=> (not res!586974) (not e!481171))))

(assert (=> start!73696 (= res!586974 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24315 _keys!868))))))

(assert (=> start!73696 e!481171))

(assert (=> start!73696 tp_is_empty!16765))

(assert (=> start!73696 true))

(assert (=> start!73696 tp!51391))

(declare-fun array_inv!18952 (array!49683) Bool)

(assert (=> start!73696 (array_inv!18952 _keys!868)))

(declare-fun array_inv!18953 (array!49685) Bool)

(assert (=> start!73696 (and (array_inv!18953 _values!688) e!481169)))

(declare-fun b!863737 () Bool)

(declare-fun res!586973 () Bool)

(assert (=> b!863737 (=> (not res!586973) (not e!481171))))

(assert (=> b!863737 (= res!586973 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16965))))

(declare-fun b!863748 () Bool)

(declare-fun res!586975 () Bool)

(assert (=> b!863748 (=> (not res!586975) (not e!481171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49683 (_ BitVec 32)) Bool)

(assert (=> b!863748 (= res!586975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863749 () Bool)

(declare-fun Unit!29473 () Unit!29470)

(assert (=> b!863749 (= e!481172 Unit!29473)))

(declare-fun b!863750 () Bool)

(declare-fun res!586967 () Bool)

(assert (=> b!863750 (=> (not res!586967) (not e!481171))))

(assert (=> b!863750 (= res!586967 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24315 _keys!868))))))

(declare-fun b!863751 () Bool)

(declare-fun res!586977 () Bool)

(assert (=> b!863751 (=> (not res!586977) (not e!481171))))

(assert (=> b!863751 (= res!586977 (validKeyInArray!0 k0!854))))

(assert (= (and start!73696 res!586974) b!863738))

(assert (= (and b!863738 res!586968) b!863736))

(assert (= (and b!863736 res!586971) b!863748))

(assert (= (and b!863748 res!586975) b!863737))

(assert (= (and b!863737 res!586973) b!863750))

(assert (= (and b!863750 res!586967) b!863751))

(assert (= (and b!863751 res!586977) b!863744))

(assert (= (and b!863744 res!586970) b!863740))

(assert (= (and b!863740 res!586969) b!863743))

(assert (= (and b!863743 (not res!586976)) b!863746))

(assert (= (and b!863746 c!92099) b!863747))

(assert (= (and b!863746 (not c!92099)) b!863749))

(assert (= (and b!863746 (not res!586972)) b!863741))

(assert (= (and b!863745 condMapEmpty!26747) mapIsEmpty!26747))

(assert (= (and b!863745 (not condMapEmpty!26747)) mapNonEmpty!26747))

(get-info :version)

(assert (= (and mapNonEmpty!26747 ((_ is ValueCellFull!7943) mapValue!26747)) b!863742))

(assert (= (and b!863745 ((_ is ValueCellFull!7943) mapDefault!26747)) b!863739))

(assert (= start!73696 b!863745))

(declare-fun b_lambda!11963 () Bool)

(assert (=> (not b_lambda!11963) (not b!863746)))

(declare-fun t!23852 () Bool)

(declare-fun tb!4743 () Bool)

(assert (=> (and start!73696 (= defaultEntry!696 defaultEntry!696) t!23852) tb!4743))

(declare-fun result!9105 () Bool)

(assert (=> tb!4743 (= result!9105 tp_is_empty!16765)))

(assert (=> b!863746 t!23852))

(declare-fun b_and!24213 () Bool)

(assert (= b_and!24211 (and (=> t!23852 result!9105) b_and!24213)))

(declare-fun m!804483 () Bool)

(assert (=> b!863747 m!804483))

(declare-fun m!804485 () Bool)

(assert (=> b!863747 m!804485))

(declare-fun m!804487 () Bool)

(assert (=> b!863747 m!804487))

(declare-fun m!804489 () Bool)

(assert (=> b!863747 m!804489))

(declare-fun m!804491 () Bool)

(assert (=> b!863747 m!804491))

(declare-fun m!804493 () Bool)

(assert (=> start!73696 m!804493))

(declare-fun m!804495 () Bool)

(assert (=> start!73696 m!804495))

(declare-fun m!804497 () Bool)

(assert (=> mapNonEmpty!26747 m!804497))

(declare-fun m!804499 () Bool)

(assert (=> b!863744 m!804499))

(declare-fun m!804501 () Bool)

(assert (=> b!863738 m!804501))

(declare-fun m!804503 () Bool)

(assert (=> b!863740 m!804503))

(declare-fun m!804505 () Bool)

(assert (=> b!863740 m!804505))

(declare-fun m!804507 () Bool)

(assert (=> b!863740 m!804507))

(declare-fun m!804509 () Bool)

(assert (=> b!863741 m!804509))

(assert (=> b!863741 m!804509))

(declare-fun m!804511 () Bool)

(assert (=> b!863741 m!804511))

(declare-fun m!804513 () Bool)

(assert (=> b!863741 m!804513))

(assert (=> b!863741 m!804513))

(declare-fun m!804515 () Bool)

(assert (=> b!863741 m!804515))

(declare-fun m!804517 () Bool)

(assert (=> b!863751 m!804517))

(declare-fun m!804519 () Bool)

(assert (=> b!863748 m!804519))

(declare-fun m!804521 () Bool)

(assert (=> b!863743 m!804521))

(declare-fun m!804523 () Bool)

(assert (=> b!863743 m!804523))

(assert (=> b!863743 m!804513))

(declare-fun m!804525 () Bool)

(assert (=> b!863743 m!804525))

(assert (=> b!863743 m!804513))

(declare-fun m!804527 () Bool)

(assert (=> b!863743 m!804527))

(declare-fun m!804529 () Bool)

(assert (=> b!863743 m!804529))

(declare-fun m!804531 () Bool)

(assert (=> b!863746 m!804531))

(declare-fun m!804533 () Bool)

(assert (=> b!863746 m!804533))

(declare-fun m!804535 () Bool)

(assert (=> b!863746 m!804535))

(assert (=> b!863746 m!804531))

(declare-fun m!804537 () Bool)

(assert (=> b!863746 m!804537))

(assert (=> b!863746 m!804513))

(assert (=> b!863746 m!804533))

(declare-fun m!804539 () Bool)

(assert (=> b!863737 m!804539))

(check-sat (not b_lambda!11963) (not b!863743) (not b!863747) (not b!863746) b_and!24213 (not b_next!14629) (not b!863738) (not mapNonEmpty!26747) (not b!863737) (not b!863751) (not b!863741) tp_is_empty!16765 (not start!73696) (not b!863748) (not b!863740))
(check-sat b_and!24213 (not b_next!14629))
