; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73792 () Bool)

(assert start!73792)

(declare-fun b_free!14539 () Bool)

(declare-fun b_next!14539 () Bool)

(assert (=> start!73792 (= b_free!14539 (not b_next!14539))))

(declare-fun tp!51122 () Bool)

(declare-fun b_and!24067 () Bool)

(assert (=> start!73792 (= tp!51122 b_and!24067)))

(declare-fun b!862653 () Bool)

(declare-datatypes ((Unit!29404 0))(
  ( (Unit!29405) )
))
(declare-fun e!480710 () Unit!29404)

(declare-fun Unit!29406 () Unit!29404)

(assert (=> b!862653 (= e!480710 Unit!29406)))

(declare-fun b!862654 () Bool)

(declare-fun Unit!29407 () Unit!29404)

(assert (=> b!862654 (= e!480710 Unit!29407)))

(declare-fun lt!389076 () Unit!29404)

(declare-datatypes ((array!49571 0))(
  ( (array!49572 (arr!23812 (Array (_ BitVec 32) (_ BitVec 64))) (size!24253 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49571)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49571 (_ BitVec 32) (_ BitVec 32)) Unit!29404)

(assert (=> b!862654 (= lt!389076 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16849 0))(
  ( (Nil!16846) (Cons!16845 (h!17982 (_ BitVec 64)) (t!23646 List!16849)) )
))
(declare-fun arrayNoDuplicates!0 (array!49571 (_ BitVec 32) List!16849) Bool)

(assert (=> b!862654 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16846)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!389073 () Unit!29404)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29404)

(assert (=> b!862654 (= lt!389073 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862654 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389079 () Unit!29404)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49571 (_ BitVec 64) (_ BitVec 32) List!16849) Unit!29404)

(assert (=> b!862654 (= lt!389079 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16846))))

(assert (=> b!862654 false))

(declare-fun mapNonEmpty!26612 () Bool)

(declare-fun mapRes!26612 () Bool)

(declare-fun tp!51121 () Bool)

(declare-fun e!480714 () Bool)

(assert (=> mapNonEmpty!26612 (= mapRes!26612 (and tp!51121 e!480714))))

(declare-fun mapKey!26612 () (_ BitVec 32))

(declare-datatypes ((V!27281 0))(
  ( (V!27282 (val!8385 Int)) )
))
(declare-datatypes ((ValueCell!7898 0))(
  ( (ValueCellFull!7898 (v!10810 V!27281)) (EmptyCell!7898) )
))
(declare-fun mapRest!26612 () (Array (_ BitVec 32) ValueCell!7898))

(declare-fun mapValue!26612 () ValueCell!7898)

(declare-datatypes ((array!49573 0))(
  ( (array!49574 (arr!23813 (Array (_ BitVec 32) ValueCell!7898)) (size!24254 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49573)

(assert (=> mapNonEmpty!26612 (= (arr!23813 _values!688) (store mapRest!26612 mapKey!26612 mapValue!26612))))

(declare-fun b!862655 () Bool)

(declare-fun e!480712 () Bool)

(declare-fun tp_is_empty!16675 () Bool)

(assert (=> b!862655 (= e!480712 tp_is_empty!16675)))

(declare-fun b!862656 () Bool)

(declare-fun res!585963 () Bool)

(declare-fun e!480708 () Bool)

(assert (=> b!862656 (=> (not res!585963) (not e!480708))))

(assert (=> b!862656 (= res!585963 (and (= (select (arr!23812 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862657 () Bool)

(declare-fun res!585969 () Bool)

(assert (=> b!862657 (=> (not res!585969) (not e!480708))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49571 (_ BitVec 32)) Bool)

(assert (=> b!862657 (= res!585969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26612 () Bool)

(assert (=> mapIsEmpty!26612 mapRes!26612))

(declare-fun b!862658 () Bool)

(declare-fun res!585964 () Bool)

(assert (=> b!862658 (=> (not res!585964) (not e!480708))))

(assert (=> b!862658 (= res!585964 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24253 _keys!868))))))

(declare-fun b!862659 () Bool)

(declare-fun res!585966 () Bool)

(assert (=> b!862659 (=> (not res!585966) (not e!480708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862659 (= res!585966 (validKeyInArray!0 k0!854))))

(declare-fun res!585967 () Bool)

(assert (=> start!73792 (=> (not res!585967) (not e!480708))))

(assert (=> start!73792 (= res!585967 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24253 _keys!868))))))

(assert (=> start!73792 e!480708))

(assert (=> start!73792 tp_is_empty!16675))

(assert (=> start!73792 true))

(assert (=> start!73792 tp!51122))

(declare-fun array_inv!18890 (array!49571) Bool)

(assert (=> start!73792 (array_inv!18890 _keys!868)))

(declare-fun e!480713 () Bool)

(declare-fun array_inv!18891 (array!49573) Bool)

(assert (=> start!73792 (and (array_inv!18891 _values!688) e!480713)))

(declare-fun b!862660 () Bool)

(assert (=> b!862660 (= e!480713 (and e!480712 mapRes!26612))))

(declare-fun condMapEmpty!26612 () Bool)

(declare-fun mapDefault!26612 () ValueCell!7898)

(assert (=> b!862660 (= condMapEmpty!26612 (= (arr!23813 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7898)) mapDefault!26612)))))

(declare-fun b!862661 () Bool)

(declare-fun res!585968 () Bool)

(assert (=> b!862661 (=> (not res!585968) (not e!480708))))

(assert (=> b!862661 (= res!585968 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16846))))

(declare-fun b!862662 () Bool)

(declare-fun e!480709 () Bool)

(assert (=> b!862662 (= e!480709 true)))

(assert (=> b!862662 (not (= (select (arr!23812 _keys!868) from!1053) k0!854))))

(declare-fun lt!389081 () Unit!29404)

(assert (=> b!862662 (= lt!389081 e!480710)))

(declare-fun c!92311 () Bool)

(assert (=> b!862662 (= c!92311 (= (select (arr!23812 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11012 0))(
  ( (tuple2!11013 (_1!5517 (_ BitVec 64)) (_2!5517 V!27281)) )
))
(declare-datatypes ((List!16850 0))(
  ( (Nil!16847) (Cons!16846 (h!17983 tuple2!11012) (t!23647 List!16850)) )
))
(declare-datatypes ((ListLongMap!9783 0))(
  ( (ListLongMap!9784 (toList!4907 List!16850)) )
))
(declare-fun lt!389080 () ListLongMap!9783)

(declare-fun lt!389072 () ListLongMap!9783)

(declare-fun +!2311 (ListLongMap!9783 tuple2!11012) ListLongMap!9783)

(declare-fun get!12569 (ValueCell!7898 V!27281) V!27281)

(declare-fun dynLambda!1139 (Int (_ BitVec 64)) V!27281)

(assert (=> b!862662 (= lt!389072 (+!2311 lt!389080 (tuple2!11013 (select (arr!23812 _keys!868) from!1053) (get!12569 (select (arr!23813 _values!688) from!1053) (dynLambda!1139 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862663 () Bool)

(declare-fun e!480711 () Bool)

(assert (=> b!862663 (= e!480708 e!480711)))

(declare-fun res!585965 () Bool)

(assert (=> b!862663 (=> (not res!585965) (not e!480711))))

(assert (=> b!862663 (= res!585965 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389074 () array!49573)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27281)

(declare-fun zeroValue!654 () V!27281)

(declare-fun getCurrentListMapNoExtraKeys!2959 (array!49571 array!49573 (_ BitVec 32) (_ BitVec 32) V!27281 V!27281 (_ BitVec 32) Int) ListLongMap!9783)

(assert (=> b!862663 (= lt!389072 (getCurrentListMapNoExtraKeys!2959 _keys!868 lt!389074 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27281)

(assert (=> b!862663 (= lt!389074 (array!49574 (store (arr!23813 _values!688) i!612 (ValueCellFull!7898 v!557)) (size!24254 _values!688)))))

(declare-fun lt!389077 () ListLongMap!9783)

(assert (=> b!862663 (= lt!389077 (getCurrentListMapNoExtraKeys!2959 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862664 () Bool)

(declare-fun res!585962 () Bool)

(assert (=> b!862664 (=> (not res!585962) (not e!480708))))

(assert (=> b!862664 (= res!585962 (and (= (size!24254 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24253 _keys!868) (size!24254 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862665 () Bool)

(assert (=> b!862665 (= e!480711 (not e!480709))))

(declare-fun res!585961 () Bool)

(assert (=> b!862665 (=> res!585961 e!480709)))

(assert (=> b!862665 (= res!585961 (not (validKeyInArray!0 (select (arr!23812 _keys!868) from!1053))))))

(declare-fun lt!389071 () ListLongMap!9783)

(assert (=> b!862665 (= lt!389071 lt!389080)))

(declare-fun lt!389075 () ListLongMap!9783)

(assert (=> b!862665 (= lt!389080 (+!2311 lt!389075 (tuple2!11013 k0!854 v!557)))))

(assert (=> b!862665 (= lt!389071 (getCurrentListMapNoExtraKeys!2959 _keys!868 lt!389074 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862665 (= lt!389075 (getCurrentListMapNoExtraKeys!2959 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389078 () Unit!29404)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!499 (array!49571 array!49573 (_ BitVec 32) (_ BitVec 32) V!27281 V!27281 (_ BitVec 32) (_ BitVec 64) V!27281 (_ BitVec 32) Int) Unit!29404)

(assert (=> b!862665 (= lt!389078 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!499 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862666 () Bool)

(declare-fun res!585970 () Bool)

(assert (=> b!862666 (=> (not res!585970) (not e!480708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862666 (= res!585970 (validMask!0 mask!1196))))

(declare-fun b!862667 () Bool)

(assert (=> b!862667 (= e!480714 tp_is_empty!16675)))

(assert (= (and start!73792 res!585967) b!862666))

(assert (= (and b!862666 res!585970) b!862664))

(assert (= (and b!862664 res!585962) b!862657))

(assert (= (and b!862657 res!585969) b!862661))

(assert (= (and b!862661 res!585968) b!862658))

(assert (= (and b!862658 res!585964) b!862659))

(assert (= (and b!862659 res!585966) b!862656))

(assert (= (and b!862656 res!585963) b!862663))

(assert (= (and b!862663 res!585965) b!862665))

(assert (= (and b!862665 (not res!585961)) b!862662))

(assert (= (and b!862662 c!92311) b!862654))

(assert (= (and b!862662 (not c!92311)) b!862653))

(assert (= (and b!862660 condMapEmpty!26612) mapIsEmpty!26612))

(assert (= (and b!862660 (not condMapEmpty!26612)) mapNonEmpty!26612))

(get-info :version)

(assert (= (and mapNonEmpty!26612 ((_ is ValueCellFull!7898) mapValue!26612)) b!862667))

(assert (= (and b!862660 ((_ is ValueCellFull!7898) mapDefault!26612)) b!862655))

(assert (= start!73792 b!862660))

(declare-fun b_lambda!11905 () Bool)

(assert (=> (not b_lambda!11905) (not b!862662)))

(declare-fun t!23645 () Bool)

(declare-fun tb!4653 () Bool)

(assert (=> (and start!73792 (= defaultEntry!696 defaultEntry!696) t!23645) tb!4653))

(declare-fun result!8925 () Bool)

(assert (=> tb!4653 (= result!8925 tp_is_empty!16675)))

(assert (=> b!862662 t!23645))

(declare-fun b_and!24069 () Bool)

(assert (= b_and!24067 (and (=> t!23645 result!8925) b_and!24069)))

(declare-fun m!803975 () Bool)

(assert (=> start!73792 m!803975))

(declare-fun m!803977 () Bool)

(assert (=> start!73792 m!803977))

(declare-fun m!803979 () Bool)

(assert (=> b!862656 m!803979))

(declare-fun m!803981 () Bool)

(assert (=> b!862665 m!803981))

(declare-fun m!803983 () Bool)

(assert (=> b!862665 m!803983))

(declare-fun m!803985 () Bool)

(assert (=> b!862665 m!803985))

(assert (=> b!862665 m!803983))

(declare-fun m!803987 () Bool)

(assert (=> b!862665 m!803987))

(declare-fun m!803989 () Bool)

(assert (=> b!862665 m!803989))

(declare-fun m!803991 () Bool)

(assert (=> b!862665 m!803991))

(declare-fun m!803993 () Bool)

(assert (=> b!862661 m!803993))

(declare-fun m!803995 () Bool)

(assert (=> b!862663 m!803995))

(declare-fun m!803997 () Bool)

(assert (=> b!862663 m!803997))

(declare-fun m!803999 () Bool)

(assert (=> b!862663 m!803999))

(declare-fun m!804001 () Bool)

(assert (=> mapNonEmpty!26612 m!804001))

(declare-fun m!804003 () Bool)

(assert (=> b!862657 m!804003))

(declare-fun m!804005 () Bool)

(assert (=> b!862662 m!804005))

(declare-fun m!804007 () Bool)

(assert (=> b!862662 m!804007))

(declare-fun m!804009 () Bool)

(assert (=> b!862662 m!804009))

(declare-fun m!804011 () Bool)

(assert (=> b!862662 m!804011))

(assert (=> b!862662 m!804007))

(assert (=> b!862662 m!803983))

(assert (=> b!862662 m!804009))

(declare-fun m!804013 () Bool)

(assert (=> b!862666 m!804013))

(declare-fun m!804015 () Bool)

(assert (=> b!862654 m!804015))

(declare-fun m!804017 () Bool)

(assert (=> b!862654 m!804017))

(declare-fun m!804019 () Bool)

(assert (=> b!862654 m!804019))

(declare-fun m!804021 () Bool)

(assert (=> b!862654 m!804021))

(declare-fun m!804023 () Bool)

(assert (=> b!862654 m!804023))

(declare-fun m!804025 () Bool)

(assert (=> b!862659 m!804025))

(check-sat (not b!862666) (not b!862654) (not b!862657) (not b!862662) (not b_lambda!11905) b_and!24069 (not b!862663) (not start!73792) (not b!862665) (not b_next!14539) (not b!862659) tp_is_empty!16675 (not mapNonEmpty!26612) (not b!862661))
(check-sat b_and!24069 (not b_next!14539))
