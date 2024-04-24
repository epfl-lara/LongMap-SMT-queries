; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73786 () Bool)

(assert start!73786)

(declare-fun b_free!14533 () Bool)

(declare-fun b_next!14533 () Bool)

(assert (=> start!73786 (= b_free!14533 (not b_next!14533))))

(declare-fun tp!51104 () Bool)

(declare-fun b_and!24055 () Bool)

(assert (=> start!73786 (= tp!51104 b_and!24055)))

(declare-fun mapNonEmpty!26603 () Bool)

(declare-fun mapRes!26603 () Bool)

(declare-fun tp!51103 () Bool)

(declare-fun e!480637 () Bool)

(assert (=> mapNonEmpty!26603 (= mapRes!26603 (and tp!51103 e!480637))))

(declare-datatypes ((V!27273 0))(
  ( (V!27274 (val!8382 Int)) )
))
(declare-datatypes ((ValueCell!7895 0))(
  ( (ValueCellFull!7895 (v!10807 V!27273)) (EmptyCell!7895) )
))
(declare-fun mapRest!26603 () (Array (_ BitVec 32) ValueCell!7895))

(declare-fun mapKey!26603 () (_ BitVec 32))

(declare-datatypes ((array!49559 0))(
  ( (array!49560 (arr!23806 (Array (_ BitVec 32) ValueCell!7895)) (size!24247 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49559)

(declare-fun mapValue!26603 () ValueCell!7895)

(assert (=> mapNonEmpty!26603 (= (arr!23806 _values!688) (store mapRest!26603 mapKey!26603 mapValue!26603))))

(declare-fun b!862512 () Bool)

(declare-fun res!585875 () Bool)

(declare-fun e!480639 () Bool)

(assert (=> b!862512 (=> (not res!585875) (not e!480639))))

(declare-datatypes ((array!49561 0))(
  ( (array!49562 (arr!23807 (Array (_ BitVec 32) (_ BitVec 64))) (size!24248 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49561)

(declare-datatypes ((List!16845 0))(
  ( (Nil!16842) (Cons!16841 (h!17978 (_ BitVec 64)) (t!23636 List!16845)) )
))
(declare-fun arrayNoDuplicates!0 (array!49561 (_ BitVec 32) List!16845) Bool)

(assert (=> b!862512 (= res!585875 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16842))))

(declare-fun b!862513 () Bool)

(declare-fun res!585880 () Bool)

(assert (=> b!862513 (=> (not res!585880) (not e!480639))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49561 (_ BitVec 32)) Bool)

(assert (=> b!862513 (= res!585880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862514 () Bool)

(declare-fun res!585877 () Bool)

(assert (=> b!862514 (=> (not res!585877) (not e!480639))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862514 (= res!585877 (validKeyInArray!0 k0!854))))

(declare-fun b!862515 () Bool)

(declare-datatypes ((Unit!29394 0))(
  ( (Unit!29395) )
))
(declare-fun e!480641 () Unit!29394)

(declare-fun Unit!29396 () Unit!29394)

(assert (=> b!862515 (= e!480641 Unit!29396)))

(declare-fun lt!388980 () Unit!29394)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49561 (_ BitVec 32) (_ BitVec 32)) Unit!29394)

(assert (=> b!862515 (= lt!388980 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862515 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16842)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388982 () Unit!29394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49561 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29394)

(assert (=> b!862515 (= lt!388982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862515 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388972 () Unit!29394)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49561 (_ BitVec 64) (_ BitVec 32) List!16845) Unit!29394)

(assert (=> b!862515 (= lt!388972 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16842))))

(assert (=> b!862515 false))

(declare-fun b!862516 () Bool)

(declare-fun res!585873 () Bool)

(assert (=> b!862516 (=> (not res!585873) (not e!480639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862516 (= res!585873 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26603 () Bool)

(assert (=> mapIsEmpty!26603 mapRes!26603))

(declare-fun b!862517 () Bool)

(declare-fun e!480640 () Bool)

(assert (=> b!862517 (= e!480640 true)))

(assert (=> b!862517 (not (= (select (arr!23807 _keys!868) from!1053) k0!854))))

(declare-fun lt!388974 () Unit!29394)

(assert (=> b!862517 (= lt!388974 e!480641)))

(declare-fun c!92302 () Bool)

(assert (=> b!862517 (= c!92302 (= (select (arr!23807 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11008 0))(
  ( (tuple2!11009 (_1!5515 (_ BitVec 64)) (_2!5515 V!27273)) )
))
(declare-datatypes ((List!16846 0))(
  ( (Nil!16843) (Cons!16842 (h!17979 tuple2!11008) (t!23637 List!16846)) )
))
(declare-datatypes ((ListLongMap!9779 0))(
  ( (ListLongMap!9780 (toList!4905 List!16846)) )
))
(declare-fun lt!388975 () ListLongMap!9779)

(declare-fun lt!388973 () ListLongMap!9779)

(declare-fun +!2309 (ListLongMap!9779 tuple2!11008) ListLongMap!9779)

(declare-fun get!12565 (ValueCell!7895 V!27273) V!27273)

(declare-fun dynLambda!1137 (Int (_ BitVec 64)) V!27273)

(assert (=> b!862517 (= lt!388973 (+!2309 lt!388975 (tuple2!11009 (select (arr!23807 _keys!868) from!1053) (get!12565 (select (arr!23806 _values!688) from!1053) (dynLambda!1137 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862519 () Bool)

(declare-fun tp_is_empty!16669 () Bool)

(assert (=> b!862519 (= e!480637 tp_is_empty!16669)))

(declare-fun b!862520 () Bool)

(declare-fun res!585879 () Bool)

(assert (=> b!862520 (=> (not res!585879) (not e!480639))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!862520 (= res!585879 (and (= (size!24247 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24248 _keys!868) (size!24247 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862521 () Bool)

(declare-fun Unit!29397 () Unit!29394)

(assert (=> b!862521 (= e!480641 Unit!29397)))

(declare-fun b!862522 () Bool)

(declare-fun e!480643 () Bool)

(assert (=> b!862522 (= e!480639 e!480643)))

(declare-fun res!585876 () Bool)

(assert (=> b!862522 (=> (not res!585876) (not e!480643))))

(assert (=> b!862522 (= res!585876 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388978 () array!49559)

(declare-fun minValue!654 () V!27273)

(declare-fun zeroValue!654 () V!27273)

(declare-fun getCurrentListMapNoExtraKeys!2957 (array!49561 array!49559 (_ BitVec 32) (_ BitVec 32) V!27273 V!27273 (_ BitVec 32) Int) ListLongMap!9779)

(assert (=> b!862522 (= lt!388973 (getCurrentListMapNoExtraKeys!2957 _keys!868 lt!388978 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27273)

(assert (=> b!862522 (= lt!388978 (array!49560 (store (arr!23806 _values!688) i!612 (ValueCellFull!7895 v!557)) (size!24247 _values!688)))))

(declare-fun lt!388981 () ListLongMap!9779)

(assert (=> b!862522 (= lt!388981 (getCurrentListMapNoExtraKeys!2957 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862523 () Bool)

(declare-fun e!480638 () Bool)

(assert (=> b!862523 (= e!480638 tp_is_empty!16669)))

(declare-fun b!862524 () Bool)

(declare-fun e!480642 () Bool)

(assert (=> b!862524 (= e!480642 (and e!480638 mapRes!26603))))

(declare-fun condMapEmpty!26603 () Bool)

(declare-fun mapDefault!26603 () ValueCell!7895)

(assert (=> b!862524 (= condMapEmpty!26603 (= (arr!23806 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7895)) mapDefault!26603)))))

(declare-fun b!862525 () Bool)

(declare-fun res!585872 () Bool)

(assert (=> b!862525 (=> (not res!585872) (not e!480639))))

(assert (=> b!862525 (= res!585872 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24248 _keys!868))))))

(declare-fun b!862526 () Bool)

(assert (=> b!862526 (= e!480643 (not e!480640))))

(declare-fun res!585878 () Bool)

(assert (=> b!862526 (=> res!585878 e!480640)))

(assert (=> b!862526 (= res!585878 (not (validKeyInArray!0 (select (arr!23807 _keys!868) from!1053))))))

(declare-fun lt!388979 () ListLongMap!9779)

(assert (=> b!862526 (= lt!388979 lt!388975)))

(declare-fun lt!388977 () ListLongMap!9779)

(assert (=> b!862526 (= lt!388975 (+!2309 lt!388977 (tuple2!11009 k0!854 v!557)))))

(assert (=> b!862526 (= lt!388979 (getCurrentListMapNoExtraKeys!2957 _keys!868 lt!388978 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862526 (= lt!388977 (getCurrentListMapNoExtraKeys!2957 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388976 () Unit!29394)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!497 (array!49561 array!49559 (_ BitVec 32) (_ BitVec 32) V!27273 V!27273 (_ BitVec 32) (_ BitVec 64) V!27273 (_ BitVec 32) Int) Unit!29394)

(assert (=> b!862526 (= lt!388976 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!497 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!585874 () Bool)

(assert (=> start!73786 (=> (not res!585874) (not e!480639))))

(assert (=> start!73786 (= res!585874 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24248 _keys!868))))))

(assert (=> start!73786 e!480639))

(assert (=> start!73786 tp_is_empty!16669))

(assert (=> start!73786 true))

(assert (=> start!73786 tp!51104))

(declare-fun array_inv!18886 (array!49561) Bool)

(assert (=> start!73786 (array_inv!18886 _keys!868)))

(declare-fun array_inv!18887 (array!49559) Bool)

(assert (=> start!73786 (and (array_inv!18887 _values!688) e!480642)))

(declare-fun b!862518 () Bool)

(declare-fun res!585871 () Bool)

(assert (=> b!862518 (=> (not res!585871) (not e!480639))))

(assert (=> b!862518 (= res!585871 (and (= (select (arr!23807 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73786 res!585874) b!862516))

(assert (= (and b!862516 res!585873) b!862520))

(assert (= (and b!862520 res!585879) b!862513))

(assert (= (and b!862513 res!585880) b!862512))

(assert (= (and b!862512 res!585875) b!862525))

(assert (= (and b!862525 res!585872) b!862514))

(assert (= (and b!862514 res!585877) b!862518))

(assert (= (and b!862518 res!585871) b!862522))

(assert (= (and b!862522 res!585876) b!862526))

(assert (= (and b!862526 (not res!585878)) b!862517))

(assert (= (and b!862517 c!92302) b!862515))

(assert (= (and b!862517 (not c!92302)) b!862521))

(assert (= (and b!862524 condMapEmpty!26603) mapIsEmpty!26603))

(assert (= (and b!862524 (not condMapEmpty!26603)) mapNonEmpty!26603))

(get-info :version)

(assert (= (and mapNonEmpty!26603 ((_ is ValueCellFull!7895) mapValue!26603)) b!862519))

(assert (= (and b!862524 ((_ is ValueCellFull!7895) mapDefault!26603)) b!862523))

(assert (= start!73786 b!862524))

(declare-fun b_lambda!11899 () Bool)

(assert (=> (not b_lambda!11899) (not b!862517)))

(declare-fun t!23635 () Bool)

(declare-fun tb!4647 () Bool)

(assert (=> (and start!73786 (= defaultEntry!696 defaultEntry!696) t!23635) tb!4647))

(declare-fun result!8913 () Bool)

(assert (=> tb!4647 (= result!8913 tp_is_empty!16669)))

(assert (=> b!862517 t!23635))

(declare-fun b_and!24057 () Bool)

(assert (= b_and!24055 (and (=> t!23635 result!8913) b_and!24057)))

(declare-fun m!803819 () Bool)

(assert (=> b!862514 m!803819))

(declare-fun m!803821 () Bool)

(assert (=> b!862515 m!803821))

(declare-fun m!803823 () Bool)

(assert (=> b!862515 m!803823))

(declare-fun m!803825 () Bool)

(assert (=> b!862515 m!803825))

(declare-fun m!803827 () Bool)

(assert (=> b!862515 m!803827))

(declare-fun m!803829 () Bool)

(assert (=> b!862515 m!803829))

(declare-fun m!803831 () Bool)

(assert (=> b!862513 m!803831))

(declare-fun m!803833 () Bool)

(assert (=> b!862518 m!803833))

(declare-fun m!803835 () Bool)

(assert (=> start!73786 m!803835))

(declare-fun m!803837 () Bool)

(assert (=> start!73786 m!803837))

(declare-fun m!803839 () Bool)

(assert (=> b!862512 m!803839))

(declare-fun m!803841 () Bool)

(assert (=> mapNonEmpty!26603 m!803841))

(declare-fun m!803843 () Bool)

(assert (=> b!862516 m!803843))

(declare-fun m!803845 () Bool)

(assert (=> b!862517 m!803845))

(declare-fun m!803847 () Bool)

(assert (=> b!862517 m!803847))

(declare-fun m!803849 () Bool)

(assert (=> b!862517 m!803849))

(declare-fun m!803851 () Bool)

(assert (=> b!862517 m!803851))

(assert (=> b!862517 m!803847))

(declare-fun m!803853 () Bool)

(assert (=> b!862517 m!803853))

(assert (=> b!862517 m!803849))

(declare-fun m!803855 () Bool)

(assert (=> b!862526 m!803855))

(declare-fun m!803857 () Bool)

(assert (=> b!862526 m!803857))

(assert (=> b!862526 m!803853))

(declare-fun m!803859 () Bool)

(assert (=> b!862526 m!803859))

(assert (=> b!862526 m!803853))

(declare-fun m!803861 () Bool)

(assert (=> b!862526 m!803861))

(declare-fun m!803863 () Bool)

(assert (=> b!862526 m!803863))

(declare-fun m!803865 () Bool)

(assert (=> b!862522 m!803865))

(declare-fun m!803867 () Bool)

(assert (=> b!862522 m!803867))

(declare-fun m!803869 () Bool)

(assert (=> b!862522 m!803869))

(check-sat (not b!862516) (not b!862517) (not b!862522) (not mapNonEmpty!26603) b_and!24057 (not b!862512) (not b_lambda!11899) tp_is_empty!16669 (not b!862526) (not b!862514) (not b!862515) (not start!73786) (not b!862513) (not b_next!14533))
(check-sat b_and!24057 (not b_next!14533))
