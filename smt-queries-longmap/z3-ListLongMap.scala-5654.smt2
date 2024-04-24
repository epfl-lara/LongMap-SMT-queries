; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73876 () Bool)

(assert start!73876)

(declare-fun b_free!14623 () Bool)

(declare-fun b_next!14623 () Bool)

(assert (=> start!73876 (= b_free!14623 (not b_next!14623))))

(declare-fun tp!51374 () Bool)

(declare-fun b_and!24235 () Bool)

(assert (=> start!73876 (= tp!51374 b_and!24235)))

(declare-fun b!864728 () Bool)

(declare-fun res!587323 () Bool)

(declare-fun e!481818 () Bool)

(assert (=> b!864728 (=> (not res!587323) (not e!481818))))

(declare-datatypes ((array!49729 0))(
  ( (array!49730 (arr!23891 (Array (_ BitVec 32) (_ BitVec 64))) (size!24332 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49729)

(declare-datatypes ((List!16910 0))(
  ( (Nil!16907) (Cons!16906 (h!18043 (_ BitVec 64)) (t!23791 List!16910)) )
))
(declare-fun arrayNoDuplicates!0 (array!49729 (_ BitVec 32) List!16910) Bool)

(assert (=> b!864728 (= res!587323 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16907))))

(declare-fun b!864729 () Bool)

(declare-fun res!587332 () Bool)

(assert (=> b!864729 (=> (not res!587332) (not e!481818))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864729 (= res!587332 (validKeyInArray!0 k0!854))))

(declare-fun b!864731 () Bool)

(declare-fun res!587328 () Bool)

(assert (=> b!864731 (=> (not res!587328) (not e!481818))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49729 (_ BitVec 32)) Bool)

(assert (=> b!864731 (= res!587328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864732 () Bool)

(declare-fun e!481823 () Bool)

(declare-fun tp_is_empty!16759 () Bool)

(assert (=> b!864732 (= e!481823 tp_is_empty!16759)))

(declare-fun mapIsEmpty!26738 () Bool)

(declare-fun mapRes!26738 () Bool)

(assert (=> mapIsEmpty!26738 mapRes!26738))

(declare-fun b!864733 () Bool)

(declare-fun e!481825 () Bool)

(declare-fun e!481821 () Bool)

(assert (=> b!864733 (= e!481825 (and e!481821 mapRes!26738))))

(declare-fun condMapEmpty!26738 () Bool)

(declare-datatypes ((V!27393 0))(
  ( (V!27394 (val!8427 Int)) )
))
(declare-datatypes ((ValueCell!7940 0))(
  ( (ValueCellFull!7940 (v!10852 V!27393)) (EmptyCell!7940) )
))
(declare-datatypes ((array!49731 0))(
  ( (array!49732 (arr!23892 (Array (_ BitVec 32) ValueCell!7940)) (size!24333 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49731)

(declare-fun mapDefault!26738 () ValueCell!7940)

(assert (=> b!864733 (= condMapEmpty!26738 (= (arr!23892 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7940)) mapDefault!26738)))))

(declare-fun mapNonEmpty!26738 () Bool)

(declare-fun tp!51373 () Bool)

(assert (=> mapNonEmpty!26738 (= mapRes!26738 (and tp!51373 e!481823))))

(declare-fun mapKey!26738 () (_ BitVec 32))

(declare-fun mapValue!26738 () ValueCell!7940)

(declare-fun mapRest!26738 () (Array (_ BitVec 32) ValueCell!7940))

(assert (=> mapNonEmpty!26738 (= (arr!23892 _values!688) (store mapRest!26738 mapKey!26738 mapValue!26738))))

(declare-fun b!864734 () Bool)

(declare-fun e!481817 () Bool)

(declare-fun e!481822 () Bool)

(assert (=> b!864734 (= e!481817 e!481822)))

(declare-fun res!587322 () Bool)

(assert (=> b!864734 (=> res!587322 e!481822)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864734 (= res!587322 (= k0!854 (select (arr!23891 _keys!868) from!1053)))))

(assert (=> b!864734 (not (= (select (arr!23891 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29523 0))(
  ( (Unit!29524) )
))
(declare-fun lt!390967 () Unit!29523)

(declare-fun e!481820 () Unit!29523)

(assert (=> b!864734 (= lt!390967 e!481820)))

(declare-fun c!92437 () Bool)

(assert (=> b!864734 (= c!92437 (= (select (arr!23891 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11078 0))(
  ( (tuple2!11079 (_1!5550 (_ BitVec 64)) (_2!5550 V!27393)) )
))
(declare-datatypes ((List!16911 0))(
  ( (Nil!16908) (Cons!16907 (h!18044 tuple2!11078) (t!23792 List!16911)) )
))
(declare-datatypes ((ListLongMap!9849 0))(
  ( (ListLongMap!9850 (toList!4940 List!16911)) )
))
(declare-fun lt!390976 () ListLongMap!9849)

(declare-fun lt!390962 () ListLongMap!9849)

(assert (=> b!864734 (= lt!390976 lt!390962)))

(declare-fun lt!390973 () ListLongMap!9849)

(declare-fun lt!390963 () tuple2!11078)

(declare-fun +!2343 (ListLongMap!9849 tuple2!11078) ListLongMap!9849)

(assert (=> b!864734 (= lt!390962 (+!2343 lt!390973 lt!390963))))

(declare-fun lt!390964 () V!27393)

(assert (=> b!864734 (= lt!390963 (tuple2!11079 (select (arr!23891 _keys!868) from!1053) lt!390964))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12626 (ValueCell!7940 V!27393) V!27393)

(declare-fun dynLambda!1168 (Int (_ BitVec 64)) V!27393)

(assert (=> b!864734 (= lt!390964 (get!12626 (select (arr!23892 _values!688) from!1053) (dynLambda!1168 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864735 () Bool)

(declare-fun Unit!29525 () Unit!29523)

(assert (=> b!864735 (= e!481820 Unit!29525)))

(declare-fun b!864736 () Bool)

(declare-fun e!481819 () Bool)

(assert (=> b!864736 (= e!481819 (not e!481817))))

(declare-fun res!587327 () Bool)

(assert (=> b!864736 (=> res!587327 e!481817)))

(assert (=> b!864736 (= res!587327 (not (validKeyInArray!0 (select (arr!23891 _keys!868) from!1053))))))

(declare-fun lt!390971 () ListLongMap!9849)

(assert (=> b!864736 (= lt!390971 lt!390973)))

(declare-fun lt!390974 () ListLongMap!9849)

(declare-fun lt!390969 () tuple2!11078)

(assert (=> b!864736 (= lt!390973 (+!2343 lt!390974 lt!390969))))

(declare-fun lt!390965 () array!49731)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27393)

(declare-fun zeroValue!654 () V!27393)

(declare-fun getCurrentListMapNoExtraKeys!2990 (array!49729 array!49731 (_ BitVec 32) (_ BitVec 32) V!27393 V!27393 (_ BitVec 32) Int) ListLongMap!9849)

(assert (=> b!864736 (= lt!390971 (getCurrentListMapNoExtraKeys!2990 _keys!868 lt!390965 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27393)

(assert (=> b!864736 (= lt!390969 (tuple2!11079 k0!854 v!557))))

(assert (=> b!864736 (= lt!390974 (getCurrentListMapNoExtraKeys!2990 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!390966 () Unit!29523)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!528 (array!49729 array!49731 (_ BitVec 32) (_ BitVec 32) V!27393 V!27393 (_ BitVec 32) (_ BitVec 64) V!27393 (_ BitVec 32) Int) Unit!29523)

(assert (=> b!864736 (= lt!390966 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!528 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864737 () Bool)

(declare-fun res!587331 () Bool)

(assert (=> b!864737 (=> (not res!587331) (not e!481818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864737 (= res!587331 (validMask!0 mask!1196))))

(declare-fun b!864738 () Bool)

(assert (=> b!864738 (= e!481818 e!481819)))

(declare-fun res!587329 () Bool)

(assert (=> b!864738 (=> (not res!587329) (not e!481819))))

(assert (=> b!864738 (= res!587329 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!864738 (= lt!390976 (getCurrentListMapNoExtraKeys!2990 _keys!868 lt!390965 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864738 (= lt!390965 (array!49732 (store (arr!23892 _values!688) i!612 (ValueCellFull!7940 v!557)) (size!24333 _values!688)))))

(declare-fun lt!390968 () ListLongMap!9849)

(assert (=> b!864738 (= lt!390968 (getCurrentListMapNoExtraKeys!2990 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864739 () Bool)

(assert (=> b!864739 (= e!481822 true)))

(assert (=> b!864739 (= lt!390962 (+!2343 (+!2343 lt!390974 lt!390963) lt!390969))))

(declare-fun lt!390975 () Unit!29523)

(declare-fun addCommutativeForDiffKeys!494 (ListLongMap!9849 (_ BitVec 64) V!27393 (_ BitVec 64) V!27393) Unit!29523)

(assert (=> b!864739 (= lt!390975 (addCommutativeForDiffKeys!494 lt!390974 k0!854 v!557 (select (arr!23891 _keys!868) from!1053) lt!390964))))

(declare-fun b!864740 () Bool)

(declare-fun res!587325 () Bool)

(assert (=> b!864740 (=> (not res!587325) (not e!481818))))

(assert (=> b!864740 (= res!587325 (and (= (select (arr!23891 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864741 () Bool)

(declare-fun Unit!29526 () Unit!29523)

(assert (=> b!864741 (= e!481820 Unit!29526)))

(declare-fun lt!390977 () Unit!29523)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49729 (_ BitVec 32) (_ BitVec 32)) Unit!29523)

(assert (=> b!864741 (= lt!390977 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!864741 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16907)))

(declare-fun lt!390970 () Unit!29523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49729 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29523)

(assert (=> b!864741 (= lt!390970 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864741 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390972 () Unit!29523)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49729 (_ BitVec 64) (_ BitVec 32) List!16910) Unit!29523)

(assert (=> b!864741 (= lt!390972 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16907))))

(assert (=> b!864741 false))

(declare-fun res!587326 () Bool)

(assert (=> start!73876 (=> (not res!587326) (not e!481818))))

(assert (=> start!73876 (= res!587326 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24332 _keys!868))))))

(assert (=> start!73876 e!481818))

(assert (=> start!73876 tp_is_empty!16759))

(assert (=> start!73876 true))

(assert (=> start!73876 tp!51374))

(declare-fun array_inv!18950 (array!49729) Bool)

(assert (=> start!73876 (array_inv!18950 _keys!868)))

(declare-fun array_inv!18951 (array!49731) Bool)

(assert (=> start!73876 (and (array_inv!18951 _values!688) e!481825)))

(declare-fun b!864730 () Bool)

(declare-fun res!587324 () Bool)

(assert (=> b!864730 (=> (not res!587324) (not e!481818))))

(assert (=> b!864730 (= res!587324 (and (= (size!24333 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24332 _keys!868) (size!24333 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864742 () Bool)

(assert (=> b!864742 (= e!481821 tp_is_empty!16759)))

(declare-fun b!864743 () Bool)

(declare-fun res!587330 () Bool)

(assert (=> b!864743 (=> (not res!587330) (not e!481818))))

(assert (=> b!864743 (= res!587330 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24332 _keys!868))))))

(assert (= (and start!73876 res!587326) b!864737))

(assert (= (and b!864737 res!587331) b!864730))

(assert (= (and b!864730 res!587324) b!864731))

(assert (= (and b!864731 res!587328) b!864728))

(assert (= (and b!864728 res!587323) b!864743))

(assert (= (and b!864743 res!587330) b!864729))

(assert (= (and b!864729 res!587332) b!864740))

(assert (= (and b!864740 res!587325) b!864738))

(assert (= (and b!864738 res!587329) b!864736))

(assert (= (and b!864736 (not res!587327)) b!864734))

(assert (= (and b!864734 c!92437) b!864741))

(assert (= (and b!864734 (not c!92437)) b!864735))

(assert (= (and b!864734 (not res!587322)) b!864739))

(assert (= (and b!864733 condMapEmpty!26738) mapIsEmpty!26738))

(assert (= (and b!864733 (not condMapEmpty!26738)) mapNonEmpty!26738))

(get-info :version)

(assert (= (and mapNonEmpty!26738 ((_ is ValueCellFull!7940) mapValue!26738)) b!864732))

(assert (= (and b!864733 ((_ is ValueCellFull!7940) mapDefault!26738)) b!864742))

(assert (= start!73876 b!864733))

(declare-fun b_lambda!11989 () Bool)

(assert (=> (not b_lambda!11989) (not b!864734)))

(declare-fun t!23790 () Bool)

(declare-fun tb!4737 () Bool)

(assert (=> (and start!73876 (= defaultEntry!696 defaultEntry!696) t!23790) tb!4737))

(declare-fun result!9093 () Bool)

(assert (=> tb!4737 (= result!9093 tp_is_empty!16759)))

(assert (=> b!864734 t!23790))

(declare-fun b_and!24237 () Bool)

(assert (= b_and!24235 (and (=> t!23790 result!9093) b_and!24237)))

(declare-fun m!806357 () Bool)

(assert (=> b!864738 m!806357))

(declare-fun m!806359 () Bool)

(assert (=> b!864738 m!806359))

(declare-fun m!806361 () Bool)

(assert (=> b!864738 m!806361))

(declare-fun m!806363 () Bool)

(assert (=> start!73876 m!806363))

(declare-fun m!806365 () Bool)

(assert (=> start!73876 m!806365))

(declare-fun m!806367 () Bool)

(assert (=> b!864739 m!806367))

(assert (=> b!864739 m!806367))

(declare-fun m!806369 () Bool)

(assert (=> b!864739 m!806369))

(declare-fun m!806371 () Bool)

(assert (=> b!864739 m!806371))

(assert (=> b!864739 m!806371))

(declare-fun m!806373 () Bool)

(assert (=> b!864739 m!806373))

(declare-fun m!806375 () Bool)

(assert (=> b!864737 m!806375))

(declare-fun m!806377 () Bool)

(assert (=> b!864731 m!806377))

(declare-fun m!806379 () Bool)

(assert (=> mapNonEmpty!26738 m!806379))

(declare-fun m!806381 () Bool)

(assert (=> b!864734 m!806381))

(declare-fun m!806383 () Bool)

(assert (=> b!864734 m!806383))

(declare-fun m!806385 () Bool)

(assert (=> b!864734 m!806385))

(declare-fun m!806387 () Bool)

(assert (=> b!864734 m!806387))

(assert (=> b!864734 m!806383))

(assert (=> b!864734 m!806371))

(assert (=> b!864734 m!806385))

(declare-fun m!806389 () Bool)

(assert (=> b!864729 m!806389))

(declare-fun m!806391 () Bool)

(assert (=> b!864740 m!806391))

(assert (=> b!864736 m!806371))

(declare-fun m!806393 () Bool)

(assert (=> b!864736 m!806393))

(assert (=> b!864736 m!806371))

(declare-fun m!806395 () Bool)

(assert (=> b!864736 m!806395))

(declare-fun m!806397 () Bool)

(assert (=> b!864736 m!806397))

(declare-fun m!806399 () Bool)

(assert (=> b!864736 m!806399))

(declare-fun m!806401 () Bool)

(assert (=> b!864736 m!806401))

(declare-fun m!806403 () Bool)

(assert (=> b!864728 m!806403))

(declare-fun m!806405 () Bool)

(assert (=> b!864741 m!806405))

(declare-fun m!806407 () Bool)

(assert (=> b!864741 m!806407))

(declare-fun m!806409 () Bool)

(assert (=> b!864741 m!806409))

(declare-fun m!806411 () Bool)

(assert (=> b!864741 m!806411))

(declare-fun m!806413 () Bool)

(assert (=> b!864741 m!806413))

(check-sat (not b!864731) (not b!864737) (not b_next!14623) (not start!73876) (not b!864729) (not b_lambda!11989) (not b!864741) (not b!864739) (not b!864728) (not b!864738) b_and!24237 tp_is_empty!16759 (not b!864734) (not mapNonEmpty!26738) (not b!864736))
(check-sat b_and!24237 (not b_next!14623))
