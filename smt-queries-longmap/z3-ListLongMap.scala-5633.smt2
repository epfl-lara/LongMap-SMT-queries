; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73584 () Bool)

(assert start!73584)

(declare-fun b_free!14499 () Bool)

(declare-fun b_next!14499 () Bool)

(assert (=> start!73584 (= b_free!14499 (not b_next!14499))))

(declare-fun tp!51000 () Bool)

(declare-fun b_and!23977 () Bool)

(assert (=> start!73584 (= tp!51000 b_and!23977)))

(declare-fun b!860810 () Bool)

(declare-fun res!585023 () Bool)

(declare-fun e!479646 () Bool)

(assert (=> b!860810 (=> (not res!585023) (not e!479646))))

(declare-datatypes ((array!49444 0))(
  ( (array!49445 (arr!23753 (Array (_ BitVec 32) (_ BitVec 64))) (size!24193 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49444)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49444 (_ BitVec 32)) Bool)

(assert (=> b!860810 (= res!585023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26552 () Bool)

(declare-fun mapRes!26552 () Bool)

(declare-fun tp!51001 () Bool)

(declare-fun e!479652 () Bool)

(assert (=> mapNonEmpty!26552 (= mapRes!26552 (and tp!51001 e!479652))))

(declare-datatypes ((V!27227 0))(
  ( (V!27228 (val!8365 Int)) )
))
(declare-datatypes ((ValueCell!7878 0))(
  ( (ValueCellFull!7878 (v!10790 V!27227)) (EmptyCell!7878) )
))
(declare-fun mapRest!26552 () (Array (_ BitVec 32) ValueCell!7878))

(declare-fun mapValue!26552 () ValueCell!7878)

(declare-fun mapKey!26552 () (_ BitVec 32))

(declare-datatypes ((array!49446 0))(
  ( (array!49447 (arr!23754 (Array (_ BitVec 32) ValueCell!7878)) (size!24194 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49446)

(assert (=> mapNonEmpty!26552 (= (arr!23754 _values!688) (store mapRest!26552 mapKey!26552 mapValue!26552))))

(declare-fun b!860811 () Bool)

(declare-fun res!585024 () Bool)

(assert (=> b!860811 (=> (not res!585024) (not e!479646))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!860811 (= res!585024 (and (= (size!24194 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24193 _keys!868) (size!24194 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860812 () Bool)

(declare-fun e!479648 () Bool)

(declare-fun e!479650 () Bool)

(assert (=> b!860812 (= e!479648 (and e!479650 mapRes!26552))))

(declare-fun condMapEmpty!26552 () Bool)

(declare-fun mapDefault!26552 () ValueCell!7878)

(assert (=> b!860812 (= condMapEmpty!26552 (= (arr!23754 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7878)) mapDefault!26552)))))

(declare-fun b!860813 () Bool)

(declare-fun res!585021 () Bool)

(assert (=> b!860813 (=> (not res!585021) (not e!479646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860813 (= res!585021 (validMask!0 mask!1196))))

(declare-fun b!860814 () Bool)

(declare-datatypes ((Unit!29347 0))(
  ( (Unit!29348) )
))
(declare-fun e!479653 () Unit!29347)

(declare-fun Unit!29349 () Unit!29347)

(assert (=> b!860814 (= e!479653 Unit!29349)))

(declare-fun lt!388054 () Unit!29347)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49444 (_ BitVec 32) (_ BitVec 32)) Unit!29347)

(assert (=> b!860814 (= lt!388054 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16865 0))(
  ( (Nil!16862) (Cons!16861 (h!17992 (_ BitVec 64)) (t!23630 List!16865)) )
))
(declare-fun arrayNoDuplicates!0 (array!49444 (_ BitVec 32) List!16865) Bool)

(assert (=> b!860814 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16862)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388057 () Unit!29347)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49444 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29347)

(assert (=> b!860814 (= lt!388057 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860814 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388055 () Unit!29347)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49444 (_ BitVec 64) (_ BitVec 32) List!16865) Unit!29347)

(assert (=> b!860814 (= lt!388055 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16862))))

(assert (=> b!860814 false))

(declare-fun b!860815 () Bool)

(declare-fun tp_is_empty!16635 () Bool)

(assert (=> b!860815 (= e!479652 tp_is_empty!16635)))

(declare-fun b!860816 () Bool)

(declare-fun e!479651 () Bool)

(assert (=> b!860816 (= e!479651 true)))

(assert (=> b!860816 (not (= (select (arr!23753 _keys!868) from!1053) k0!854))))

(declare-fun lt!388056 () Unit!29347)

(assert (=> b!860816 (= lt!388056 e!479653)))

(declare-fun c!91969 () Bool)

(assert (=> b!860816 (= c!91969 (= (select (arr!23753 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11056 0))(
  ( (tuple2!11057 (_1!5539 (_ BitVec 64)) (_2!5539 V!27227)) )
))
(declare-datatypes ((List!16866 0))(
  ( (Nil!16863) (Cons!16862 (h!17993 tuple2!11056) (t!23631 List!16866)) )
))
(declare-datatypes ((ListLongMap!9825 0))(
  ( (ListLongMap!9826 (toList!4928 List!16866)) )
))
(declare-fun lt!388059 () ListLongMap!9825)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388051 () ListLongMap!9825)

(declare-fun +!2280 (ListLongMap!9825 tuple2!11056) ListLongMap!9825)

(declare-fun get!12526 (ValueCell!7878 V!27227) V!27227)

(declare-fun dynLambda!1116 (Int (_ BitVec 64)) V!27227)

(assert (=> b!860816 (= lt!388059 (+!2280 lt!388051 (tuple2!11057 (select (arr!23753 _keys!868) from!1053) (get!12526 (select (arr!23754 _values!688) from!1053) (dynLambda!1116 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860817 () Bool)

(declare-fun res!585026 () Bool)

(assert (=> b!860817 (=> (not res!585026) (not e!479646))))

(assert (=> b!860817 (= res!585026 (and (= (select (arr!23753 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!585020 () Bool)

(assert (=> start!73584 (=> (not res!585020) (not e!479646))))

(assert (=> start!73584 (= res!585020 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24193 _keys!868))))))

(assert (=> start!73584 e!479646))

(assert (=> start!73584 tp_is_empty!16635))

(assert (=> start!73584 true))

(assert (=> start!73584 tp!51000))

(declare-fun array_inv!18804 (array!49444) Bool)

(assert (=> start!73584 (array_inv!18804 _keys!868)))

(declare-fun array_inv!18805 (array!49446) Bool)

(assert (=> start!73584 (and (array_inv!18805 _values!688) e!479648)))

(declare-fun b!860818 () Bool)

(assert (=> b!860818 (= e!479650 tp_is_empty!16635)))

(declare-fun mapIsEmpty!26552 () Bool)

(assert (=> mapIsEmpty!26552 mapRes!26552))

(declare-fun b!860819 () Bool)

(declare-fun Unit!29350 () Unit!29347)

(assert (=> b!860819 (= e!479653 Unit!29350)))

(declare-fun b!860820 () Bool)

(declare-fun res!585017 () Bool)

(assert (=> b!860820 (=> (not res!585017) (not e!479646))))

(assert (=> b!860820 (= res!585017 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16862))))

(declare-fun b!860821 () Bool)

(declare-fun res!585019 () Bool)

(assert (=> b!860821 (=> (not res!585019) (not e!479646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860821 (= res!585019 (validKeyInArray!0 k0!854))))

(declare-fun b!860822 () Bool)

(declare-fun res!585022 () Bool)

(assert (=> b!860822 (=> (not res!585022) (not e!479646))))

(assert (=> b!860822 (= res!585022 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24193 _keys!868))))))

(declare-fun b!860823 () Bool)

(declare-fun e!479647 () Bool)

(assert (=> b!860823 (= e!479647 (not e!479651))))

(declare-fun res!585018 () Bool)

(assert (=> b!860823 (=> res!585018 e!479651)))

(assert (=> b!860823 (= res!585018 (not (validKeyInArray!0 (select (arr!23753 _keys!868) from!1053))))))

(declare-fun lt!388052 () ListLongMap!9825)

(assert (=> b!860823 (= lt!388052 lt!388051)))

(declare-fun v!557 () V!27227)

(declare-fun lt!388058 () ListLongMap!9825)

(assert (=> b!860823 (= lt!388051 (+!2280 lt!388058 (tuple2!11057 k0!854 v!557)))))

(declare-fun lt!388053 () array!49446)

(declare-fun minValue!654 () V!27227)

(declare-fun zeroValue!654 () V!27227)

(declare-fun getCurrentListMapNoExtraKeys!2905 (array!49444 array!49446 (_ BitVec 32) (_ BitVec 32) V!27227 V!27227 (_ BitVec 32) Int) ListLongMap!9825)

(assert (=> b!860823 (= lt!388052 (getCurrentListMapNoExtraKeys!2905 _keys!868 lt!388053 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860823 (= lt!388058 (getCurrentListMapNoExtraKeys!2905 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388060 () Unit!29347)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!492 (array!49444 array!49446 (_ BitVec 32) (_ BitVec 32) V!27227 V!27227 (_ BitVec 32) (_ BitVec 64) V!27227 (_ BitVec 32) Int) Unit!29347)

(assert (=> b!860823 (= lt!388060 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!492 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860824 () Bool)

(assert (=> b!860824 (= e!479646 e!479647)))

(declare-fun res!585025 () Bool)

(assert (=> b!860824 (=> (not res!585025) (not e!479647))))

(assert (=> b!860824 (= res!585025 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860824 (= lt!388059 (getCurrentListMapNoExtraKeys!2905 _keys!868 lt!388053 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860824 (= lt!388053 (array!49447 (store (arr!23754 _values!688) i!612 (ValueCellFull!7878 v!557)) (size!24194 _values!688)))))

(declare-fun lt!388050 () ListLongMap!9825)

(assert (=> b!860824 (= lt!388050 (getCurrentListMapNoExtraKeys!2905 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73584 res!585020) b!860813))

(assert (= (and b!860813 res!585021) b!860811))

(assert (= (and b!860811 res!585024) b!860810))

(assert (= (and b!860810 res!585023) b!860820))

(assert (= (and b!860820 res!585017) b!860822))

(assert (= (and b!860822 res!585022) b!860821))

(assert (= (and b!860821 res!585019) b!860817))

(assert (= (and b!860817 res!585026) b!860824))

(assert (= (and b!860824 res!585025) b!860823))

(assert (= (and b!860823 (not res!585018)) b!860816))

(assert (= (and b!860816 c!91969) b!860814))

(assert (= (and b!860816 (not c!91969)) b!860819))

(assert (= (and b!860812 condMapEmpty!26552) mapIsEmpty!26552))

(assert (= (and b!860812 (not condMapEmpty!26552)) mapNonEmpty!26552))

(get-info :version)

(assert (= (and mapNonEmpty!26552 ((_ is ValueCellFull!7878) mapValue!26552)) b!860815))

(assert (= (and b!860812 ((_ is ValueCellFull!7878) mapDefault!26552)) b!860818))

(assert (= start!73584 b!860812))

(declare-fun b_lambda!11851 () Bool)

(assert (=> (not b_lambda!11851) (not b!860816)))

(declare-fun t!23629 () Bool)

(declare-fun tb!4621 () Bool)

(assert (=> (and start!73584 (= defaultEntry!696 defaultEntry!696) t!23629) tb!4621))

(declare-fun result!8853 () Bool)

(assert (=> tb!4621 (= result!8853 tp_is_empty!16635)))

(assert (=> b!860816 t!23629))

(declare-fun b_and!23979 () Bool)

(assert (= b_and!23977 (and (=> t!23629 result!8853) b_and!23979)))

(declare-fun m!801645 () Bool)

(assert (=> b!860817 m!801645))

(declare-fun m!801647 () Bool)

(assert (=> b!860813 m!801647))

(declare-fun m!801649 () Bool)

(assert (=> b!860821 m!801649))

(declare-fun m!801651 () Bool)

(assert (=> b!860810 m!801651))

(declare-fun m!801653 () Bool)

(assert (=> start!73584 m!801653))

(declare-fun m!801655 () Bool)

(assert (=> start!73584 m!801655))

(declare-fun m!801657 () Bool)

(assert (=> b!860814 m!801657))

(declare-fun m!801659 () Bool)

(assert (=> b!860814 m!801659))

(declare-fun m!801661 () Bool)

(assert (=> b!860814 m!801661))

(declare-fun m!801663 () Bool)

(assert (=> b!860814 m!801663))

(declare-fun m!801665 () Bool)

(assert (=> b!860814 m!801665))

(declare-fun m!801667 () Bool)

(assert (=> b!860816 m!801667))

(declare-fun m!801669 () Bool)

(assert (=> b!860816 m!801669))

(declare-fun m!801671 () Bool)

(assert (=> b!860816 m!801671))

(declare-fun m!801673 () Bool)

(assert (=> b!860816 m!801673))

(assert (=> b!860816 m!801669))

(declare-fun m!801675 () Bool)

(assert (=> b!860816 m!801675))

(assert (=> b!860816 m!801671))

(declare-fun m!801677 () Bool)

(assert (=> mapNonEmpty!26552 m!801677))

(declare-fun m!801679 () Bool)

(assert (=> b!860820 m!801679))

(declare-fun m!801681 () Bool)

(assert (=> b!860824 m!801681))

(declare-fun m!801683 () Bool)

(assert (=> b!860824 m!801683))

(declare-fun m!801685 () Bool)

(assert (=> b!860824 m!801685))

(declare-fun m!801687 () Bool)

(assert (=> b!860823 m!801687))

(declare-fun m!801689 () Bool)

(assert (=> b!860823 m!801689))

(declare-fun m!801691 () Bool)

(assert (=> b!860823 m!801691))

(assert (=> b!860823 m!801675))

(declare-fun m!801693 () Bool)

(assert (=> b!860823 m!801693))

(assert (=> b!860823 m!801675))

(declare-fun m!801695 () Bool)

(assert (=> b!860823 m!801695))

(check-sat (not b!860816) (not b!860820) (not b!860813) (not b!860821) (not start!73584) (not b!860823) tp_is_empty!16635 (not b_next!14499) (not b!860814) (not b!860810) (not mapNonEmpty!26552) (not b!860824) b_and!23979 (not b_lambda!11851))
(check-sat b_and!23979 (not b_next!14499))
