; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73570 () Bool)

(assert start!73570)

(declare-fun b_free!14503 () Bool)

(declare-fun b_next!14503 () Bool)

(assert (=> start!73570 (= b_free!14503 (not b_next!14503))))

(declare-fun tp!51014 () Bool)

(declare-fun b_and!23959 () Bool)

(assert (=> start!73570 (= tp!51014 b_and!23959)))

(declare-fun mapIsEmpty!26558 () Bool)

(declare-fun mapRes!26558 () Bool)

(assert (=> mapIsEmpty!26558 mapRes!26558))

(declare-fun b!860665 () Bool)

(declare-fun e!479553 () Bool)

(declare-fun e!479550 () Bool)

(assert (=> b!860665 (= e!479553 (and e!479550 mapRes!26558))))

(declare-fun condMapEmpty!26558 () Bool)

(declare-datatypes ((V!27233 0))(
  ( (V!27234 (val!8367 Int)) )
))
(declare-datatypes ((ValueCell!7880 0))(
  ( (ValueCellFull!7880 (v!10786 V!27233)) (EmptyCell!7880) )
))
(declare-datatypes ((array!49437 0))(
  ( (array!49438 (arr!23750 (Array (_ BitVec 32) ValueCell!7880)) (size!24192 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49437)

(declare-fun mapDefault!26558 () ValueCell!7880)

(assert (=> b!860665 (= condMapEmpty!26558 (= (arr!23750 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7880)) mapDefault!26558)))))

(declare-fun b!860666 () Bool)

(declare-fun res!584975 () Bool)

(declare-fun e!479551 () Bool)

(assert (=> b!860666 (=> (not res!584975) (not e!479551))))

(declare-datatypes ((array!49439 0))(
  ( (array!49440 (arr!23751 (Array (_ BitVec 32) (_ BitVec 64))) (size!24193 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49439)

(declare-datatypes ((List!16865 0))(
  ( (Nil!16862) (Cons!16861 (h!17992 (_ BitVec 64)) (t!23625 List!16865)) )
))
(declare-fun arrayNoDuplicates!0 (array!49439 (_ BitVec 32) List!16865) Bool)

(assert (=> b!860666 (= res!584975 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16862))))

(declare-fun b!860667 () Bool)

(declare-fun e!479548 () Bool)

(assert (=> b!860667 (= e!479551 e!479548)))

(declare-fun res!584967 () Bool)

(assert (=> b!860667 (=> (not res!584967) (not e!479548))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860667 (= res!584967 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387880 () array!49437)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27233)

(declare-fun zeroValue!654 () V!27233)

(declare-datatypes ((tuple2!11066 0))(
  ( (tuple2!11067 (_1!5544 (_ BitVec 64)) (_2!5544 V!27233)) )
))
(declare-datatypes ((List!16866 0))(
  ( (Nil!16863) (Cons!16862 (h!17993 tuple2!11066) (t!23626 List!16866)) )
))
(declare-datatypes ((ListLongMap!9825 0))(
  ( (ListLongMap!9826 (toList!4928 List!16866)) )
))
(declare-fun lt!387888 () ListLongMap!9825)

(declare-fun getCurrentListMapNoExtraKeys!2931 (array!49439 array!49437 (_ BitVec 32) (_ BitVec 32) V!27233 V!27233 (_ BitVec 32) Int) ListLongMap!9825)

(assert (=> b!860667 (= lt!387888 (getCurrentListMapNoExtraKeys!2931 _keys!868 lt!387880 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27233)

(assert (=> b!860667 (= lt!387880 (array!49438 (store (arr!23750 _values!688) i!612 (ValueCellFull!7880 v!557)) (size!24192 _values!688)))))

(declare-fun lt!387885 () ListLongMap!9825)

(assert (=> b!860667 (= lt!387885 (getCurrentListMapNoExtraKeys!2931 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860668 () Bool)

(declare-fun res!584973 () Bool)

(assert (=> b!860668 (=> (not res!584973) (not e!479551))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860668 (= res!584973 (validKeyInArray!0 k0!854))))

(declare-fun b!860669 () Bool)

(declare-fun res!584974 () Bool)

(assert (=> b!860669 (=> (not res!584974) (not e!479551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49439 (_ BitVec 32)) Bool)

(assert (=> b!860669 (= res!584974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860670 () Bool)

(declare-datatypes ((Unit!29275 0))(
  ( (Unit!29276) )
))
(declare-fun e!479547 () Unit!29275)

(declare-fun Unit!29277 () Unit!29275)

(assert (=> b!860670 (= e!479547 Unit!29277)))

(declare-fun b!860671 () Bool)

(declare-fun e!479546 () Bool)

(assert (=> b!860671 (= e!479546 true)))

(assert (=> b!860671 (not (= (select (arr!23751 _keys!868) from!1053) k0!854))))

(declare-fun lt!387883 () Unit!29275)

(assert (=> b!860671 (= lt!387883 e!479547)))

(declare-fun c!91910 () Bool)

(assert (=> b!860671 (= c!91910 (= (select (arr!23751 _keys!868) from!1053) k0!854))))

(declare-fun lt!387890 () ListLongMap!9825)

(declare-fun +!2301 (ListLongMap!9825 tuple2!11066) ListLongMap!9825)

(declare-fun get!12527 (ValueCell!7880 V!27233) V!27233)

(declare-fun dynLambda!1112 (Int (_ BitVec 64)) V!27233)

(assert (=> b!860671 (= lt!387888 (+!2301 lt!387890 (tuple2!11067 (select (arr!23751 _keys!868) from!1053) (get!12527 (select (arr!23750 _values!688) from!1053) (dynLambda!1112 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860672 () Bool)

(declare-fun Unit!29278 () Unit!29275)

(assert (=> b!860672 (= e!479547 Unit!29278)))

(declare-fun lt!387889 () Unit!29275)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49439 (_ BitVec 32) (_ BitVec 32)) Unit!29275)

(assert (=> b!860672 (= lt!387889 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!860672 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16862)))

(declare-fun lt!387884 () Unit!29275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49439 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29275)

(assert (=> b!860672 (= lt!387884 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860672 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387881 () Unit!29275)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49439 (_ BitVec 64) (_ BitVec 32) List!16865) Unit!29275)

(assert (=> b!860672 (= lt!387881 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16862))))

(assert (=> b!860672 false))

(declare-fun b!860673 () Bool)

(declare-fun res!584971 () Bool)

(assert (=> b!860673 (=> (not res!584971) (not e!479551))))

(assert (=> b!860673 (= res!584971 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24193 _keys!868))))))

(declare-fun b!860674 () Bool)

(assert (=> b!860674 (= e!479548 (not e!479546))))

(declare-fun res!584968 () Bool)

(assert (=> b!860674 (=> res!584968 e!479546)))

(assert (=> b!860674 (= res!584968 (not (validKeyInArray!0 (select (arr!23751 _keys!868) from!1053))))))

(declare-fun lt!387887 () ListLongMap!9825)

(assert (=> b!860674 (= lt!387887 lt!387890)))

(declare-fun lt!387886 () ListLongMap!9825)

(assert (=> b!860674 (= lt!387890 (+!2301 lt!387886 (tuple2!11067 k0!854 v!557)))))

(assert (=> b!860674 (= lt!387887 (getCurrentListMapNoExtraKeys!2931 _keys!868 lt!387880 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860674 (= lt!387886 (getCurrentListMapNoExtraKeys!2931 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387882 () Unit!29275)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!492 (array!49439 array!49437 (_ BitVec 32) (_ BitVec 32) V!27233 V!27233 (_ BitVec 32) (_ BitVec 64) V!27233 (_ BitVec 32) Int) Unit!29275)

(assert (=> b!860674 (= lt!387882 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!492 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860675 () Bool)

(declare-fun tp_is_empty!16639 () Bool)

(assert (=> b!860675 (= e!479550 tp_is_empty!16639)))

(declare-fun res!584972 () Bool)

(assert (=> start!73570 (=> (not res!584972) (not e!479551))))

(assert (=> start!73570 (= res!584972 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24193 _keys!868))))))

(assert (=> start!73570 e!479551))

(assert (=> start!73570 tp_is_empty!16639))

(assert (=> start!73570 true))

(assert (=> start!73570 tp!51014))

(declare-fun array_inv!18866 (array!49439) Bool)

(assert (=> start!73570 (array_inv!18866 _keys!868)))

(declare-fun array_inv!18867 (array!49437) Bool)

(assert (=> start!73570 (and (array_inv!18867 _values!688) e!479553)))

(declare-fun b!860676 () Bool)

(declare-fun e!479549 () Bool)

(assert (=> b!860676 (= e!479549 tp_is_empty!16639)))

(declare-fun mapNonEmpty!26558 () Bool)

(declare-fun tp!51013 () Bool)

(assert (=> mapNonEmpty!26558 (= mapRes!26558 (and tp!51013 e!479549))))

(declare-fun mapRest!26558 () (Array (_ BitVec 32) ValueCell!7880))

(declare-fun mapValue!26558 () ValueCell!7880)

(declare-fun mapKey!26558 () (_ BitVec 32))

(assert (=> mapNonEmpty!26558 (= (arr!23750 _values!688) (store mapRest!26558 mapKey!26558 mapValue!26558))))

(declare-fun b!860677 () Bool)

(declare-fun res!584976 () Bool)

(assert (=> b!860677 (=> (not res!584976) (not e!479551))))

(assert (=> b!860677 (= res!584976 (and (= (size!24192 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24193 _keys!868) (size!24192 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860678 () Bool)

(declare-fun res!584969 () Bool)

(assert (=> b!860678 (=> (not res!584969) (not e!479551))))

(assert (=> b!860678 (= res!584969 (and (= (select (arr!23751 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860679 () Bool)

(declare-fun res!584970 () Bool)

(assert (=> b!860679 (=> (not res!584970) (not e!479551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860679 (= res!584970 (validMask!0 mask!1196))))

(assert (= (and start!73570 res!584972) b!860679))

(assert (= (and b!860679 res!584970) b!860677))

(assert (= (and b!860677 res!584976) b!860669))

(assert (= (and b!860669 res!584974) b!860666))

(assert (= (and b!860666 res!584975) b!860673))

(assert (= (and b!860673 res!584971) b!860668))

(assert (= (and b!860668 res!584973) b!860678))

(assert (= (and b!860678 res!584969) b!860667))

(assert (= (and b!860667 res!584967) b!860674))

(assert (= (and b!860674 (not res!584968)) b!860671))

(assert (= (and b!860671 c!91910) b!860672))

(assert (= (and b!860671 (not c!91910)) b!860670))

(assert (= (and b!860665 condMapEmpty!26558) mapIsEmpty!26558))

(assert (= (and b!860665 (not condMapEmpty!26558)) mapNonEmpty!26558))

(get-info :version)

(assert (= (and mapNonEmpty!26558 ((_ is ValueCellFull!7880) mapValue!26558)) b!860676))

(assert (= (and b!860665 ((_ is ValueCellFull!7880) mapDefault!26558)) b!860675))

(assert (= start!73570 b!860665))

(declare-fun b_lambda!11837 () Bool)

(assert (=> (not b_lambda!11837) (not b!860671)))

(declare-fun t!23624 () Bool)

(declare-fun tb!4617 () Bool)

(assert (=> (and start!73570 (= defaultEntry!696 defaultEntry!696) t!23624) tb!4617))

(declare-fun result!8853 () Bool)

(assert (=> tb!4617 (= result!8853 tp_is_empty!16639)))

(assert (=> b!860671 t!23624))

(declare-fun b_and!23961 () Bool)

(assert (= b_and!23959 (and (=> t!23624 result!8853) b_and!23961)))

(declare-fun m!800991 () Bool)

(assert (=> mapNonEmpty!26558 m!800991))

(declare-fun m!800993 () Bool)

(assert (=> b!860667 m!800993))

(declare-fun m!800995 () Bool)

(assert (=> b!860667 m!800995))

(declare-fun m!800997 () Bool)

(assert (=> b!860667 m!800997))

(declare-fun m!800999 () Bool)

(assert (=> b!860666 m!800999))

(declare-fun m!801001 () Bool)

(assert (=> b!860672 m!801001))

(declare-fun m!801003 () Bool)

(assert (=> b!860672 m!801003))

(declare-fun m!801005 () Bool)

(assert (=> b!860672 m!801005))

(declare-fun m!801007 () Bool)

(assert (=> b!860672 m!801007))

(declare-fun m!801009 () Bool)

(assert (=> b!860672 m!801009))

(declare-fun m!801011 () Bool)

(assert (=> b!860669 m!801011))

(declare-fun m!801013 () Bool)

(assert (=> b!860674 m!801013))

(declare-fun m!801015 () Bool)

(assert (=> b!860674 m!801015))

(declare-fun m!801017 () Bool)

(assert (=> b!860674 m!801017))

(assert (=> b!860674 m!801015))

(declare-fun m!801019 () Bool)

(assert (=> b!860674 m!801019))

(declare-fun m!801021 () Bool)

(assert (=> b!860674 m!801021))

(declare-fun m!801023 () Bool)

(assert (=> b!860674 m!801023))

(declare-fun m!801025 () Bool)

(assert (=> b!860671 m!801025))

(declare-fun m!801027 () Bool)

(assert (=> b!860671 m!801027))

(declare-fun m!801029 () Bool)

(assert (=> b!860671 m!801029))

(declare-fun m!801031 () Bool)

(assert (=> b!860671 m!801031))

(assert (=> b!860671 m!801027))

(assert (=> b!860671 m!801015))

(assert (=> b!860671 m!801029))

(declare-fun m!801033 () Bool)

(assert (=> b!860668 m!801033))

(declare-fun m!801035 () Bool)

(assert (=> start!73570 m!801035))

(declare-fun m!801037 () Bool)

(assert (=> start!73570 m!801037))

(declare-fun m!801039 () Bool)

(assert (=> b!860678 m!801039))

(declare-fun m!801041 () Bool)

(assert (=> b!860679 m!801041))

(check-sat (not start!73570) (not b!860668) (not b!860669) (not b_lambda!11837) (not b_next!14503) (not mapNonEmpty!26558) tp_is_empty!16639 (not b!860672) (not b!860666) b_and!23961 (not b!860667) (not b!860674) (not b!860671) (not b!860679))
(check-sat b_and!23961 (not b_next!14503))
