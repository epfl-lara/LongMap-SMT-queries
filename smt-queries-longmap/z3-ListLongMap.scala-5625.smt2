; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73516 () Bool)

(assert start!73516)

(declare-fun b_free!14449 () Bool)

(declare-fun b_next!14449 () Bool)

(assert (=> start!73516 (= b_free!14449 (not b_next!14449))))

(declare-fun tp!50852 () Bool)

(declare-fun b_and!23851 () Bool)

(assert (=> start!73516 (= tp!50852 b_and!23851)))

(declare-fun b!859256 () Bool)

(declare-fun res!583888 () Bool)

(declare-fun e!478833 () Bool)

(assert (=> b!859256 (=> (not res!583888) (not e!478833))))

(declare-datatypes ((array!49335 0))(
  ( (array!49336 (arr!23699 (Array (_ BitVec 32) (_ BitVec 64))) (size!24141 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49335)

(declare-datatypes ((List!16823 0))(
  ( (Nil!16820) (Cons!16819 (h!17950 (_ BitVec 64)) (t!23529 List!16823)) )
))
(declare-fun arrayNoDuplicates!0 (array!49335 (_ BitVec 32) List!16823) Bool)

(assert (=> b!859256 (= res!583888 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16820))))

(declare-fun b!859257 () Bool)

(declare-fun res!583890 () Bool)

(assert (=> b!859257 (=> (not res!583890) (not e!478833))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27161 0))(
  ( (V!27162 (val!8340 Int)) )
))
(declare-datatypes ((ValueCell!7853 0))(
  ( (ValueCellFull!7853 (v!10759 V!27161)) (EmptyCell!7853) )
))
(declare-datatypes ((array!49337 0))(
  ( (array!49338 (arr!23700 (Array (_ BitVec 32) ValueCell!7853)) (size!24142 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49337)

(assert (=> b!859257 (= res!583890 (and (= (size!24142 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24141 _keys!868) (size!24142 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26477 () Bool)

(declare-fun mapRes!26477 () Bool)

(assert (=> mapIsEmpty!26477 mapRes!26477))

(declare-fun b!859258 () Bool)

(declare-fun e!478836 () Bool)

(assert (=> b!859258 (= e!478836 true)))

(declare-fun lt!387065 () Bool)

(declare-fun contains!4199 (List!16823 (_ BitVec 64)) Bool)

(assert (=> b!859258 (= lt!387065 (contains!4199 Nil!16820 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859259 () Bool)

(declare-fun e!478828 () Bool)

(declare-fun e!478835 () Bool)

(assert (=> b!859259 (= e!478828 e!478835)))

(declare-fun res!583886 () Bool)

(assert (=> b!859259 (=> res!583886 e!478835)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859259 (= res!583886 (not (= (select (arr!23699 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11022 0))(
  ( (tuple2!11023 (_1!5522 (_ BitVec 64)) (_2!5522 V!27161)) )
))
(declare-datatypes ((List!16824 0))(
  ( (Nil!16821) (Cons!16820 (h!17951 tuple2!11022) (t!23530 List!16824)) )
))
(declare-datatypes ((ListLongMap!9781 0))(
  ( (ListLongMap!9782 (toList!4906 List!16824)) )
))
(declare-fun lt!387068 () ListLongMap!9781)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387060 () ListLongMap!9781)

(declare-fun +!2280 (ListLongMap!9781 tuple2!11022) ListLongMap!9781)

(declare-fun get!12493 (ValueCell!7853 V!27161) V!27161)

(declare-fun dynLambda!1096 (Int (_ BitVec 64)) V!27161)

(assert (=> b!859259 (= lt!387060 (+!2280 lt!387068 (tuple2!11023 (select (arr!23699 _keys!868) from!1053) (get!12493 (select (arr!23700 _values!688) from!1053) (dynLambda!1096 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859260 () Bool)

(declare-fun res!583885 () Bool)

(assert (=> b!859260 (=> (not res!583885) (not e!478833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859260 (= res!583885 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26477 () Bool)

(declare-fun tp!50851 () Bool)

(declare-fun e!478830 () Bool)

(assert (=> mapNonEmpty!26477 (= mapRes!26477 (and tp!50851 e!478830))))

(declare-fun mapKey!26477 () (_ BitVec 32))

(declare-fun mapValue!26477 () ValueCell!7853)

(declare-fun mapRest!26477 () (Array (_ BitVec 32) ValueCell!7853))

(assert (=> mapNonEmpty!26477 (= (arr!23700 _values!688) (store mapRest!26477 mapKey!26477 mapValue!26477))))

(declare-fun b!859262 () Bool)

(declare-fun res!583879 () Bool)

(assert (=> b!859262 (=> (not res!583879) (not e!478833))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859262 (= res!583879 (and (= (select (arr!23699 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859263 () Bool)

(declare-fun res!583882 () Bool)

(assert (=> b!859263 (=> res!583882 e!478836)))

(declare-fun noDuplicate!1309 (List!16823) Bool)

(assert (=> b!859263 (= res!583882 (not (noDuplicate!1309 Nil!16820)))))

(declare-fun b!859264 () Bool)

(declare-fun e!478832 () Bool)

(assert (=> b!859264 (= e!478833 e!478832)))

(declare-fun res!583880 () Bool)

(assert (=> b!859264 (=> (not res!583880) (not e!478832))))

(assert (=> b!859264 (= res!583880 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387067 () array!49337)

(declare-fun minValue!654 () V!27161)

(declare-fun zeroValue!654 () V!27161)

(declare-fun getCurrentListMapNoExtraKeys!2910 (array!49335 array!49337 (_ BitVec 32) (_ BitVec 32) V!27161 V!27161 (_ BitVec 32) Int) ListLongMap!9781)

(assert (=> b!859264 (= lt!387060 (getCurrentListMapNoExtraKeys!2910 _keys!868 lt!387067 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27161)

(assert (=> b!859264 (= lt!387067 (array!49338 (store (arr!23700 _values!688) i!612 (ValueCellFull!7853 v!557)) (size!24142 _values!688)))))

(declare-fun lt!387066 () ListLongMap!9781)

(assert (=> b!859264 (= lt!387066 (getCurrentListMapNoExtraKeys!2910 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859265 () Bool)

(assert (=> b!859265 (= e!478832 (not e!478828))))

(declare-fun res!583883 () Bool)

(assert (=> b!859265 (=> res!583883 e!478828)))

(assert (=> b!859265 (= res!583883 (not (validKeyInArray!0 (select (arr!23699 _keys!868) from!1053))))))

(declare-fun lt!387059 () ListLongMap!9781)

(assert (=> b!859265 (= lt!387059 lt!387068)))

(declare-fun lt!387063 () ListLongMap!9781)

(assert (=> b!859265 (= lt!387068 (+!2280 lt!387063 (tuple2!11023 k0!854 v!557)))))

(assert (=> b!859265 (= lt!387059 (getCurrentListMapNoExtraKeys!2910 _keys!868 lt!387067 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859265 (= lt!387063 (getCurrentListMapNoExtraKeys!2910 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29229 0))(
  ( (Unit!29230) )
))
(declare-fun lt!387062 () Unit!29229)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!472 (array!49335 array!49337 (_ BitVec 32) (_ BitVec 32) V!27161 V!27161 (_ BitVec 32) (_ BitVec 64) V!27161 (_ BitVec 32) Int) Unit!29229)

(assert (=> b!859265 (= lt!387062 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!472 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859266 () Bool)

(declare-fun e!478831 () Bool)

(declare-fun e!478834 () Bool)

(assert (=> b!859266 (= e!478831 (and e!478834 mapRes!26477))))

(declare-fun condMapEmpty!26477 () Bool)

(declare-fun mapDefault!26477 () ValueCell!7853)

(assert (=> b!859266 (= condMapEmpty!26477 (= (arr!23700 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7853)) mapDefault!26477)))))

(declare-fun b!859267 () Bool)

(declare-fun tp_is_empty!16585 () Bool)

(assert (=> b!859267 (= e!478834 tp_is_empty!16585)))

(declare-fun b!859268 () Bool)

(assert (=> b!859268 (= e!478835 e!478836)))

(declare-fun res!583877 () Bool)

(assert (=> b!859268 (=> res!583877 e!478836)))

(assert (=> b!859268 (= res!583877 (or (bvsge (size!24141 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24141 _keys!868)) (bvsge from!1053 (size!24141 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859268 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387061 () Unit!29229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29229)

(assert (=> b!859268 (= lt!387061 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859268 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16820)))

(declare-fun lt!387064 () Unit!29229)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49335 (_ BitVec 32) (_ BitVec 32)) Unit!29229)

(assert (=> b!859268 (= lt!387064 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859261 () Bool)

(declare-fun res!583878 () Bool)

(assert (=> b!859261 (=> (not res!583878) (not e!478833))))

(assert (=> b!859261 (= res!583878 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24141 _keys!868))))))

(declare-fun res!583887 () Bool)

(assert (=> start!73516 (=> (not res!583887) (not e!478833))))

(assert (=> start!73516 (= res!583887 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24141 _keys!868))))))

(assert (=> start!73516 e!478833))

(assert (=> start!73516 tp_is_empty!16585))

(assert (=> start!73516 true))

(assert (=> start!73516 tp!50852))

(declare-fun array_inv!18826 (array!49335) Bool)

(assert (=> start!73516 (array_inv!18826 _keys!868)))

(declare-fun array_inv!18827 (array!49337) Bool)

(assert (=> start!73516 (and (array_inv!18827 _values!688) e!478831)))

(declare-fun b!859269 () Bool)

(declare-fun res!583881 () Bool)

(assert (=> b!859269 (=> res!583881 e!478836)))

(assert (=> b!859269 (= res!583881 (contains!4199 Nil!16820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859270 () Bool)

(assert (=> b!859270 (= e!478830 tp_is_empty!16585)))

(declare-fun b!859271 () Bool)

(declare-fun res!583889 () Bool)

(assert (=> b!859271 (=> (not res!583889) (not e!478833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49335 (_ BitVec 32)) Bool)

(assert (=> b!859271 (= res!583889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859272 () Bool)

(declare-fun res!583884 () Bool)

(assert (=> b!859272 (=> (not res!583884) (not e!478833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859272 (= res!583884 (validMask!0 mask!1196))))

(assert (= (and start!73516 res!583887) b!859272))

(assert (= (and b!859272 res!583884) b!859257))

(assert (= (and b!859257 res!583890) b!859271))

(assert (= (and b!859271 res!583889) b!859256))

(assert (= (and b!859256 res!583888) b!859261))

(assert (= (and b!859261 res!583878) b!859260))

(assert (= (and b!859260 res!583885) b!859262))

(assert (= (and b!859262 res!583879) b!859264))

(assert (= (and b!859264 res!583880) b!859265))

(assert (= (and b!859265 (not res!583883)) b!859259))

(assert (= (and b!859259 (not res!583886)) b!859268))

(assert (= (and b!859268 (not res!583877)) b!859263))

(assert (= (and b!859263 (not res!583882)) b!859269))

(assert (= (and b!859269 (not res!583881)) b!859258))

(assert (= (and b!859266 condMapEmpty!26477) mapIsEmpty!26477))

(assert (= (and b!859266 (not condMapEmpty!26477)) mapNonEmpty!26477))

(get-info :version)

(assert (= (and mapNonEmpty!26477 ((_ is ValueCellFull!7853) mapValue!26477)) b!859270))

(assert (= (and b!859266 ((_ is ValueCellFull!7853) mapDefault!26477)) b!859267))

(assert (= start!73516 b!859266))

(declare-fun b_lambda!11783 () Bool)

(assert (=> (not b_lambda!11783) (not b!859259)))

(declare-fun t!23528 () Bool)

(declare-fun tb!4563 () Bool)

(assert (=> (and start!73516 (= defaultEntry!696 defaultEntry!696) t!23528) tb!4563))

(declare-fun result!8745 () Bool)

(assert (=> tb!4563 (= result!8745 tp_is_empty!16585)))

(assert (=> b!859259 t!23528))

(declare-fun b_and!23853 () Bool)

(assert (= b_and!23851 (and (=> t!23528 result!8745) b_and!23853)))

(declare-fun m!799491 () Bool)

(assert (=> b!859263 m!799491))

(declare-fun m!799493 () Bool)

(assert (=> b!859269 m!799493))

(declare-fun m!799495 () Bool)

(assert (=> mapNonEmpty!26477 m!799495))

(declare-fun m!799497 () Bool)

(assert (=> b!859262 m!799497))

(declare-fun m!799499 () Bool)

(assert (=> b!859265 m!799499))

(declare-fun m!799501 () Bool)

(assert (=> b!859265 m!799501))

(declare-fun m!799503 () Bool)

(assert (=> b!859265 m!799503))

(declare-fun m!799505 () Bool)

(assert (=> b!859265 m!799505))

(assert (=> b!859265 m!799503))

(declare-fun m!799507 () Bool)

(assert (=> b!859265 m!799507))

(declare-fun m!799509 () Bool)

(assert (=> b!859265 m!799509))

(declare-fun m!799511 () Bool)

(assert (=> b!859271 m!799511))

(declare-fun m!799513 () Bool)

(assert (=> b!859260 m!799513))

(declare-fun m!799515 () Bool)

(assert (=> b!859268 m!799515))

(declare-fun m!799517 () Bool)

(assert (=> b!859268 m!799517))

(declare-fun m!799519 () Bool)

(assert (=> b!859268 m!799519))

(declare-fun m!799521 () Bool)

(assert (=> b!859268 m!799521))

(declare-fun m!799523 () Bool)

(assert (=> start!73516 m!799523))

(declare-fun m!799525 () Bool)

(assert (=> start!73516 m!799525))

(declare-fun m!799527 () Bool)

(assert (=> b!859264 m!799527))

(declare-fun m!799529 () Bool)

(assert (=> b!859264 m!799529))

(declare-fun m!799531 () Bool)

(assert (=> b!859264 m!799531))

(declare-fun m!799533 () Bool)

(assert (=> b!859258 m!799533))

(declare-fun m!799535 () Bool)

(assert (=> b!859272 m!799535))

(declare-fun m!799537 () Bool)

(assert (=> b!859256 m!799537))

(declare-fun m!799539 () Bool)

(assert (=> b!859259 m!799539))

(declare-fun m!799541 () Bool)

(assert (=> b!859259 m!799541))

(declare-fun m!799543 () Bool)

(assert (=> b!859259 m!799543))

(assert (=> b!859259 m!799539))

(declare-fun m!799545 () Bool)

(assert (=> b!859259 m!799545))

(assert (=> b!859259 m!799503))

(assert (=> b!859259 m!799541))

(check-sat (not b!859269) b_and!23853 tp_is_empty!16585 (not b!859265) (not b!859268) (not b!859272) (not b!859259) (not b!859263) (not b_next!14449) (not mapNonEmpty!26477) (not b_lambda!11783) (not start!73516) (not b!859271) (not b!859256) (not b!859264) (not b!859258) (not b!859260))
(check-sat b_and!23853 (not b_next!14449))
