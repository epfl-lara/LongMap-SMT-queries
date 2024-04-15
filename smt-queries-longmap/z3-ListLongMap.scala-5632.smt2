; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73558 () Bool)

(assert start!73558)

(declare-fun b_free!14491 () Bool)

(declare-fun b_next!14491 () Bool)

(assert (=> start!73558 (= b_free!14491 (not b_next!14491))))

(declare-fun tp!50977 () Bool)

(declare-fun b_and!23935 () Bool)

(assert (=> start!73558 (= tp!50977 b_and!23935)))

(declare-fun b!860369 () Bool)

(declare-fun e!479397 () Bool)

(declare-fun e!479401 () Bool)

(assert (=> b!860369 (= e!479397 e!479401)))

(declare-fun res!584767 () Bool)

(assert (=> b!860369 (=> res!584767 e!479401)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49413 0))(
  ( (array!49414 (arr!23738 (Array (_ BitVec 32) (_ BitVec 64))) (size!24180 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49413)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860369 (= res!584767 (not (= (select (arr!23738 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27217 0))(
  ( (V!27218 (val!8361 Int)) )
))
(declare-datatypes ((tuple2!11054 0))(
  ( (tuple2!11055 (_1!5538 (_ BitVec 64)) (_2!5538 V!27217)) )
))
(declare-datatypes ((List!16854 0))(
  ( (Nil!16851) (Cons!16850 (h!17981 tuple2!11054) (t!23602 List!16854)) )
))
(declare-datatypes ((ListLongMap!9813 0))(
  ( (ListLongMap!9814 (toList!4922 List!16854)) )
))
(declare-fun lt!387693 () ListLongMap!9813)

(declare-datatypes ((ValueCell!7874 0))(
  ( (ValueCellFull!7874 (v!10780 V!27217)) (EmptyCell!7874) )
))
(declare-datatypes ((array!49415 0))(
  ( (array!49416 (arr!23739 (Array (_ BitVec 32) ValueCell!7874)) (size!24181 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49415)

(declare-fun lt!387697 () ListLongMap!9813)

(declare-fun +!2296 (ListLongMap!9813 tuple2!11054) ListLongMap!9813)

(declare-fun get!12520 (ValueCell!7874 V!27217) V!27217)

(declare-fun dynLambda!1109 (Int (_ BitVec 64)) V!27217)

(assert (=> b!860369 (= lt!387693 (+!2296 lt!387697 (tuple2!11055 (select (arr!23738 _keys!868) from!1053) (get!12520 (select (arr!23739 _values!688) from!1053) (dynLambda!1109 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!584759 () Bool)

(declare-fun e!479395 () Bool)

(assert (=> start!73558 (=> (not res!584759) (not e!479395))))

(assert (=> start!73558 (= res!584759 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24180 _keys!868))))))

(assert (=> start!73558 e!479395))

(declare-fun tp_is_empty!16627 () Bool)

(assert (=> start!73558 tp_is_empty!16627))

(assert (=> start!73558 true))

(assert (=> start!73558 tp!50977))

(declare-fun array_inv!18856 (array!49413) Bool)

(assert (=> start!73558 (array_inv!18856 _keys!868)))

(declare-fun e!479403 () Bool)

(declare-fun array_inv!18857 (array!49415) Bool)

(assert (=> start!73558 (and (array_inv!18857 _values!688) e!479403)))

(declare-fun b!860370 () Bool)

(declare-fun res!584760 () Bool)

(assert (=> b!860370 (=> (not res!584760) (not e!479395))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49413 (_ BitVec 32)) Bool)

(assert (=> b!860370 (= res!584760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860371 () Bool)

(declare-fun e!479399 () Bool)

(assert (=> b!860371 (= e!479399 tp_is_empty!16627)))

(declare-fun b!860372 () Bool)

(declare-fun res!584765 () Bool)

(declare-fun e!479396 () Bool)

(assert (=> b!860372 (=> res!584765 e!479396)))

(declare-datatypes ((List!16855 0))(
  ( (Nil!16852) (Cons!16851 (h!17982 (_ BitVec 64)) (t!23603 List!16855)) )
))
(declare-fun noDuplicate!1321 (List!16855) Bool)

(assert (=> b!860372 (= res!584765 (not (noDuplicate!1321 Nil!16852)))))

(declare-fun b!860373 () Bool)

(assert (=> b!860373 (= e!479396 true)))

(declare-fun lt!387698 () Bool)

(declare-fun contains!4212 (List!16855 (_ BitVec 64)) Bool)

(assert (=> b!860373 (= lt!387698 (contains!4212 Nil!16852 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860374 () Bool)

(declare-fun res!584763 () Bool)

(assert (=> b!860374 (=> (not res!584763) (not e!479395))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860374 (= res!584763 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24180 _keys!868))))))

(declare-fun b!860375 () Bool)

(declare-fun res!584764 () Bool)

(assert (=> b!860375 (=> (not res!584764) (not e!479395))))

(assert (=> b!860375 (= res!584764 (and (= (select (arr!23738 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860376 () Bool)

(declare-fun res!584769 () Bool)

(assert (=> b!860376 (=> (not res!584769) (not e!479395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860376 (= res!584769 (validMask!0 mask!1196))))

(declare-fun b!860377 () Bool)

(declare-fun res!584771 () Bool)

(assert (=> b!860377 (=> (not res!584771) (not e!479395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860377 (= res!584771 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26540 () Bool)

(declare-fun mapRes!26540 () Bool)

(assert (=> mapIsEmpty!26540 mapRes!26540))

(declare-fun b!860378 () Bool)

(declare-fun res!584770 () Bool)

(assert (=> b!860378 (=> res!584770 e!479396)))

(assert (=> b!860378 (= res!584770 (contains!4212 Nil!16852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860379 () Bool)

(declare-fun e!479398 () Bool)

(assert (=> b!860379 (= e!479395 e!479398)))

(declare-fun res!584761 () Bool)

(assert (=> b!860379 (=> (not res!584761) (not e!479398))))

(assert (=> b!860379 (= res!584761 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387692 () array!49415)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27217)

(declare-fun zeroValue!654 () V!27217)

(declare-fun getCurrentListMapNoExtraKeys!2925 (array!49413 array!49415 (_ BitVec 32) (_ BitVec 32) V!27217 V!27217 (_ BitVec 32) Int) ListLongMap!9813)

(assert (=> b!860379 (= lt!387693 (getCurrentListMapNoExtraKeys!2925 _keys!868 lt!387692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27217)

(assert (=> b!860379 (= lt!387692 (array!49416 (store (arr!23739 _values!688) i!612 (ValueCellFull!7874 v!557)) (size!24181 _values!688)))))

(declare-fun lt!387689 () ListLongMap!9813)

(assert (=> b!860379 (= lt!387689 (getCurrentListMapNoExtraKeys!2925 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860380 () Bool)

(declare-fun res!584768 () Bool)

(assert (=> b!860380 (=> (not res!584768) (not e!479395))))

(assert (=> b!860380 (= res!584768 (and (= (size!24181 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24180 _keys!868) (size!24181 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860381 () Bool)

(assert (=> b!860381 (= e!479398 (not e!479397))))

(declare-fun res!584766 () Bool)

(assert (=> b!860381 (=> res!584766 e!479397)))

(assert (=> b!860381 (= res!584766 (not (validKeyInArray!0 (select (arr!23738 _keys!868) from!1053))))))

(declare-fun lt!387695 () ListLongMap!9813)

(assert (=> b!860381 (= lt!387695 lt!387697)))

(declare-fun lt!387691 () ListLongMap!9813)

(assert (=> b!860381 (= lt!387697 (+!2296 lt!387691 (tuple2!11055 k0!854 v!557)))))

(assert (=> b!860381 (= lt!387695 (getCurrentListMapNoExtraKeys!2925 _keys!868 lt!387692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860381 (= lt!387691 (getCurrentListMapNoExtraKeys!2925 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29259 0))(
  ( (Unit!29260) )
))
(declare-fun lt!387690 () Unit!29259)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!487 (array!49413 array!49415 (_ BitVec 32) (_ BitVec 32) V!27217 V!27217 (_ BitVec 32) (_ BitVec 64) V!27217 (_ BitVec 32) Int) Unit!29259)

(assert (=> b!860381 (= lt!387690 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!487 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860382 () Bool)

(declare-fun e!479402 () Bool)

(assert (=> b!860382 (= e!479403 (and e!479402 mapRes!26540))))

(declare-fun condMapEmpty!26540 () Bool)

(declare-fun mapDefault!26540 () ValueCell!7874)

(assert (=> b!860382 (= condMapEmpty!26540 (= (arr!23739 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7874)) mapDefault!26540)))))

(declare-fun b!860383 () Bool)

(assert (=> b!860383 (= e!479401 e!479396)))

(declare-fun res!584762 () Bool)

(assert (=> b!860383 (=> res!584762 e!479396)))

(assert (=> b!860383 (= res!584762 (or (bvsge (size!24180 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24180 _keys!868)) (bvsge from!1053 (size!24180 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860383 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387694 () Unit!29259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29259)

(assert (=> b!860383 (= lt!387694 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49413 (_ BitVec 32) List!16855) Bool)

(assert (=> b!860383 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16852)))

(declare-fun lt!387696 () Unit!29259)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49413 (_ BitVec 32) (_ BitVec 32)) Unit!29259)

(assert (=> b!860383 (= lt!387696 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!26540 () Bool)

(declare-fun tp!50978 () Bool)

(assert (=> mapNonEmpty!26540 (= mapRes!26540 (and tp!50978 e!479399))))

(declare-fun mapKey!26540 () (_ BitVec 32))

(declare-fun mapValue!26540 () ValueCell!7874)

(declare-fun mapRest!26540 () (Array (_ BitVec 32) ValueCell!7874))

(assert (=> mapNonEmpty!26540 (= (arr!23739 _values!688) (store mapRest!26540 mapKey!26540 mapValue!26540))))

(declare-fun b!860384 () Bool)

(assert (=> b!860384 (= e!479402 tp_is_empty!16627)))

(declare-fun b!860385 () Bool)

(declare-fun res!584772 () Bool)

(assert (=> b!860385 (=> (not res!584772) (not e!479395))))

(assert (=> b!860385 (= res!584772 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16852))))

(assert (= (and start!73558 res!584759) b!860376))

(assert (= (and b!860376 res!584769) b!860380))

(assert (= (and b!860380 res!584768) b!860370))

(assert (= (and b!860370 res!584760) b!860385))

(assert (= (and b!860385 res!584772) b!860374))

(assert (= (and b!860374 res!584763) b!860377))

(assert (= (and b!860377 res!584771) b!860375))

(assert (= (and b!860375 res!584764) b!860379))

(assert (= (and b!860379 res!584761) b!860381))

(assert (= (and b!860381 (not res!584766)) b!860369))

(assert (= (and b!860369 (not res!584767)) b!860383))

(assert (= (and b!860383 (not res!584762)) b!860372))

(assert (= (and b!860372 (not res!584765)) b!860378))

(assert (= (and b!860378 (not res!584770)) b!860373))

(assert (= (and b!860382 condMapEmpty!26540) mapIsEmpty!26540))

(assert (= (and b!860382 (not condMapEmpty!26540)) mapNonEmpty!26540))

(get-info :version)

(assert (= (and mapNonEmpty!26540 ((_ is ValueCellFull!7874) mapValue!26540)) b!860371))

(assert (= (and b!860382 ((_ is ValueCellFull!7874) mapDefault!26540)) b!860384))

(assert (= start!73558 b!860382))

(declare-fun b_lambda!11825 () Bool)

(assert (=> (not b_lambda!11825) (not b!860369)))

(declare-fun t!23601 () Bool)

(declare-fun tb!4605 () Bool)

(assert (=> (and start!73558 (= defaultEntry!696 defaultEntry!696) t!23601) tb!4605))

(declare-fun result!8829 () Bool)

(assert (=> tb!4605 (= result!8829 tp_is_empty!16627)))

(assert (=> b!860369 t!23601))

(declare-fun b_and!23937 () Bool)

(assert (= b_and!23935 (and (=> t!23601 result!8829) b_and!23937)))

(declare-fun m!800667 () Bool)

(assert (=> b!860372 m!800667))

(declare-fun m!800669 () Bool)

(assert (=> b!860383 m!800669))

(declare-fun m!800671 () Bool)

(assert (=> b!860383 m!800671))

(declare-fun m!800673 () Bool)

(assert (=> b!860383 m!800673))

(declare-fun m!800675 () Bool)

(assert (=> b!860383 m!800675))

(declare-fun m!800677 () Bool)

(assert (=> start!73558 m!800677))

(declare-fun m!800679 () Bool)

(assert (=> start!73558 m!800679))

(declare-fun m!800681 () Bool)

(assert (=> b!860381 m!800681))

(declare-fun m!800683 () Bool)

(assert (=> b!860381 m!800683))

(declare-fun m!800685 () Bool)

(assert (=> b!860381 m!800685))

(assert (=> b!860381 m!800683))

(declare-fun m!800687 () Bool)

(assert (=> b!860381 m!800687))

(declare-fun m!800689 () Bool)

(assert (=> b!860381 m!800689))

(declare-fun m!800691 () Bool)

(assert (=> b!860381 m!800691))

(declare-fun m!800693 () Bool)

(assert (=> b!860378 m!800693))

(declare-fun m!800695 () Bool)

(assert (=> b!860385 m!800695))

(declare-fun m!800697 () Bool)

(assert (=> b!860370 m!800697))

(declare-fun m!800699 () Bool)

(assert (=> b!860375 m!800699))

(declare-fun m!800701 () Bool)

(assert (=> b!860373 m!800701))

(declare-fun m!800703 () Bool)

(assert (=> mapNonEmpty!26540 m!800703))

(declare-fun m!800705 () Bool)

(assert (=> b!860376 m!800705))

(declare-fun m!800707 () Bool)

(assert (=> b!860379 m!800707))

(declare-fun m!800709 () Bool)

(assert (=> b!860379 m!800709))

(declare-fun m!800711 () Bool)

(assert (=> b!860379 m!800711))

(declare-fun m!800713 () Bool)

(assert (=> b!860377 m!800713))

(declare-fun m!800715 () Bool)

(assert (=> b!860369 m!800715))

(declare-fun m!800717 () Bool)

(assert (=> b!860369 m!800717))

(declare-fun m!800719 () Bool)

(assert (=> b!860369 m!800719))

(declare-fun m!800721 () Bool)

(assert (=> b!860369 m!800721))

(assert (=> b!860369 m!800717))

(assert (=> b!860369 m!800683))

(assert (=> b!860369 m!800719))

(check-sat (not b!860369) (not mapNonEmpty!26540) (not b!860383) (not b!860373) tp_is_empty!16627 (not b!860385) (not b!860377) (not b_next!14491) (not b!860379) (not b!860378) (not b_lambda!11825) (not start!73558) b_and!23937 (not b!860370) (not b!860372) (not b!860381) (not b!860376))
(check-sat b_and!23937 (not b_next!14491))
