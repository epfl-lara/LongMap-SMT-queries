; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73786 () Bool)

(assert start!73786)

(declare-fun b_free!14719 () Bool)

(declare-fun b_next!14719 () Bool)

(assert (=> start!73786 (= b_free!14719 (not b_next!14719))))

(declare-fun tp!51661 () Bool)

(declare-fun b_and!24391 () Bool)

(assert (=> start!73786 (= tp!51661 b_and!24391)))

(declare-fun mapIsEmpty!26882 () Bool)

(declare-fun mapRes!26882 () Bool)

(assert (=> mapIsEmpty!26882 mapRes!26882))

(declare-fun b!865986 () Bool)

(declare-fun e!482391 () Bool)

(declare-fun e!482387 () Bool)

(assert (=> b!865986 (= e!482391 (and e!482387 mapRes!26882))))

(declare-fun condMapEmpty!26882 () Bool)

(declare-datatypes ((V!27521 0))(
  ( (V!27522 (val!8475 Int)) )
))
(declare-datatypes ((ValueCell!7988 0))(
  ( (ValueCellFull!7988 (v!10894 V!27521)) (EmptyCell!7988) )
))
(declare-datatypes ((array!49861 0))(
  ( (array!49862 (arr!23962 (Array (_ BitVec 32) ValueCell!7988)) (size!24404 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49861)

(declare-fun mapDefault!26882 () ValueCell!7988)

(assert (=> b!865986 (= condMapEmpty!26882 (= (arr!23962 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7988)) mapDefault!26882)))))

(declare-fun b!865987 () Bool)

(declare-datatypes ((Unit!29619 0))(
  ( (Unit!29620) )
))
(declare-fun e!482388 () Unit!29619)

(declare-fun Unit!29621 () Unit!29619)

(assert (=> b!865987 (= e!482388 Unit!29621)))

(declare-fun lt!392677 () Unit!29619)

(declare-datatypes ((array!49863 0))(
  ( (array!49864 (arr!23963 (Array (_ BitVec 32) (_ BitVec 64))) (size!24405 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49863)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49863 (_ BitVec 32) (_ BitVec 32)) Unit!29619)

(assert (=> b!865987 (= lt!392677 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17046 0))(
  ( (Nil!17043) (Cons!17042 (h!18173 (_ BitVec 64)) (t!24022 List!17046)) )
))
(declare-fun arrayNoDuplicates!0 (array!49863 (_ BitVec 32) List!17046) Bool)

(assert (=> b!865987 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17043)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!392681 () Unit!29619)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49863 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29619)

(assert (=> b!865987 (= lt!392681 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865987 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392680 () Unit!29619)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49863 (_ BitVec 64) (_ BitVec 32) List!17046) Unit!29619)

(assert (=> b!865987 (= lt!392680 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17043))))

(assert (=> b!865987 false))

(declare-fun b!865988 () Bool)

(declare-fun res!588452 () Bool)

(declare-fun e!482384 () Bool)

(assert (=> b!865988 (=> (not res!588452) (not e!482384))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49863 (_ BitVec 32)) Bool)

(assert (=> b!865988 (= res!588452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865989 () Bool)

(declare-fun res!588458 () Bool)

(assert (=> b!865989 (=> (not res!588458) (not e!482384))))

(assert (=> b!865989 (= res!588458 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17043))))

(declare-fun b!865990 () Bool)

(declare-fun res!588453 () Bool)

(assert (=> b!865990 (=> (not res!588453) (not e!482384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865990 (= res!588453 (validKeyInArray!0 k0!854))))

(declare-fun b!865991 () Bool)

(declare-fun res!588461 () Bool)

(assert (=> b!865991 (=> (not res!588461) (not e!482384))))

(assert (=> b!865991 (= res!588461 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24405 _keys!868))))))

(declare-fun b!865992 () Bool)

(declare-fun tp_is_empty!16855 () Bool)

(assert (=> b!865992 (= e!482387 tp_is_empty!16855)))

(declare-fun b!865993 () Bool)

(declare-fun e!482385 () Bool)

(assert (=> b!865993 (= e!482385 true)))

(declare-datatypes ((tuple2!11258 0))(
  ( (tuple2!11259 (_1!5640 (_ BitVec 64)) (_2!5640 V!27521)) )
))
(declare-datatypes ((List!17047 0))(
  ( (Nil!17044) (Cons!17043 (h!18174 tuple2!11258) (t!24023 List!17047)) )
))
(declare-datatypes ((ListLongMap!10017 0))(
  ( (ListLongMap!10018 (toList!5024 List!17047)) )
))
(declare-fun lt!392679 () ListLongMap!10017)

(declare-fun lt!392674 () ListLongMap!10017)

(declare-fun lt!392676 () tuple2!11258)

(declare-fun lt!392672 () tuple2!11258)

(declare-fun +!2391 (ListLongMap!10017 tuple2!11258) ListLongMap!10017)

(assert (=> b!865993 (= lt!392674 (+!2391 (+!2391 lt!392679 lt!392672) lt!392676))))

(declare-fun v!557 () V!27521)

(declare-fun lt!392675 () Unit!29619)

(declare-fun lt!392673 () V!27521)

(declare-fun addCommutativeForDiffKeys!529 (ListLongMap!10017 (_ BitVec 64) V!27521 (_ BitVec 64) V!27521) Unit!29619)

(assert (=> b!865993 (= lt!392675 (addCommutativeForDiffKeys!529 lt!392679 k0!854 v!557 (select (arr!23963 _keys!868) from!1053) lt!392673))))

(declare-fun b!865994 () Bool)

(declare-fun e!482390 () Bool)

(assert (=> b!865994 (= e!482384 e!482390)))

(declare-fun res!588459 () Bool)

(assert (=> b!865994 (=> (not res!588459) (not e!482390))))

(assert (=> b!865994 (= res!588459 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!392682 () array!49861)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27521)

(declare-fun zeroValue!654 () V!27521)

(declare-fun lt!392683 () ListLongMap!10017)

(declare-fun getCurrentListMapNoExtraKeys!3019 (array!49863 array!49861 (_ BitVec 32) (_ BitVec 32) V!27521 V!27521 (_ BitVec 32) Int) ListLongMap!10017)

(assert (=> b!865994 (= lt!392683 (getCurrentListMapNoExtraKeys!3019 _keys!868 lt!392682 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865994 (= lt!392682 (array!49862 (store (arr!23962 _values!688) i!612 (ValueCellFull!7988 v!557)) (size!24404 _values!688)))))

(declare-fun lt!392670 () ListLongMap!10017)

(assert (=> b!865994 (= lt!392670 (getCurrentListMapNoExtraKeys!3019 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865995 () Bool)

(declare-fun res!588462 () Bool)

(assert (=> b!865995 (=> (not res!588462) (not e!482384))))

(assert (=> b!865995 (= res!588462 (and (= (select (arr!23963 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865996 () Bool)

(declare-fun res!588457 () Bool)

(assert (=> b!865996 (=> (not res!588457) (not e!482384))))

(assert (=> b!865996 (= res!588457 (and (= (size!24404 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24405 _keys!868) (size!24404 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865997 () Bool)

(declare-fun e!482386 () Bool)

(assert (=> b!865997 (= e!482386 tp_is_empty!16855)))

(declare-fun b!865998 () Bool)

(declare-fun Unit!29622 () Unit!29619)

(assert (=> b!865998 (= e!482388 Unit!29622)))

(declare-fun res!588454 () Bool)

(assert (=> start!73786 (=> (not res!588454) (not e!482384))))

(assert (=> start!73786 (= res!588454 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24405 _keys!868))))))

(assert (=> start!73786 e!482384))

(assert (=> start!73786 tp_is_empty!16855))

(assert (=> start!73786 true))

(assert (=> start!73786 tp!51661))

(declare-fun array_inv!19012 (array!49863) Bool)

(assert (=> start!73786 (array_inv!19012 _keys!868)))

(declare-fun array_inv!19013 (array!49861) Bool)

(assert (=> start!73786 (and (array_inv!19013 _values!688) e!482391)))

(declare-fun b!865999 () Bool)

(declare-fun e!482389 () Bool)

(assert (=> b!865999 (= e!482389 e!482385)))

(declare-fun res!588460 () Bool)

(assert (=> b!865999 (=> res!588460 e!482385)))

(assert (=> b!865999 (= res!588460 (= k0!854 (select (arr!23963 _keys!868) from!1053)))))

(assert (=> b!865999 (not (= (select (arr!23963 _keys!868) from!1053) k0!854))))

(declare-fun lt!392684 () Unit!29619)

(assert (=> b!865999 (= lt!392684 e!482388)))

(declare-fun c!92234 () Bool)

(assert (=> b!865999 (= c!92234 (= (select (arr!23963 _keys!868) from!1053) k0!854))))

(assert (=> b!865999 (= lt!392683 lt!392674)))

(declare-fun lt!392678 () ListLongMap!10017)

(assert (=> b!865999 (= lt!392674 (+!2391 lt!392678 lt!392672))))

(assert (=> b!865999 (= lt!392672 (tuple2!11259 (select (arr!23963 _keys!868) from!1053) lt!392673))))

(declare-fun get!12674 (ValueCell!7988 V!27521) V!27521)

(declare-fun dynLambda!1187 (Int (_ BitVec 64)) V!27521)

(assert (=> b!865999 (= lt!392673 (get!12674 (select (arr!23962 _values!688) from!1053) (dynLambda!1187 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866000 () Bool)

(assert (=> b!866000 (= e!482390 (not e!482389))))

(declare-fun res!588456 () Bool)

(assert (=> b!866000 (=> res!588456 e!482389)))

(assert (=> b!866000 (= res!588456 (not (validKeyInArray!0 (select (arr!23963 _keys!868) from!1053))))))

(declare-fun lt!392669 () ListLongMap!10017)

(assert (=> b!866000 (= lt!392669 lt!392678)))

(assert (=> b!866000 (= lt!392678 (+!2391 lt!392679 lt!392676))))

(assert (=> b!866000 (= lt!392669 (getCurrentListMapNoExtraKeys!3019 _keys!868 lt!392682 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866000 (= lt!392676 (tuple2!11259 k0!854 v!557))))

(assert (=> b!866000 (= lt!392679 (getCurrentListMapNoExtraKeys!3019 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392671 () Unit!29619)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!562 (array!49863 array!49861 (_ BitVec 32) (_ BitVec 32) V!27521 V!27521 (_ BitVec 32) (_ BitVec 64) V!27521 (_ BitVec 32) Int) Unit!29619)

(assert (=> b!866000 (= lt!392671 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!562 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866001 () Bool)

(declare-fun res!588455 () Bool)

(assert (=> b!866001 (=> (not res!588455) (not e!482384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866001 (= res!588455 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26882 () Bool)

(declare-fun tp!51662 () Bool)

(assert (=> mapNonEmpty!26882 (= mapRes!26882 (and tp!51662 e!482386))))

(declare-fun mapKey!26882 () (_ BitVec 32))

(declare-fun mapRest!26882 () (Array (_ BitVec 32) ValueCell!7988))

(declare-fun mapValue!26882 () ValueCell!7988)

(assert (=> mapNonEmpty!26882 (= (arr!23962 _values!688) (store mapRest!26882 mapKey!26882 mapValue!26882))))

(assert (= (and start!73786 res!588454) b!866001))

(assert (= (and b!866001 res!588455) b!865996))

(assert (= (and b!865996 res!588457) b!865988))

(assert (= (and b!865988 res!588452) b!865989))

(assert (= (and b!865989 res!588458) b!865991))

(assert (= (and b!865991 res!588461) b!865990))

(assert (= (and b!865990 res!588453) b!865995))

(assert (= (and b!865995 res!588462) b!865994))

(assert (= (and b!865994 res!588459) b!866000))

(assert (= (and b!866000 (not res!588456)) b!865999))

(assert (= (and b!865999 c!92234) b!865987))

(assert (= (and b!865999 (not c!92234)) b!865998))

(assert (= (and b!865999 (not res!588460)) b!865993))

(assert (= (and b!865986 condMapEmpty!26882) mapIsEmpty!26882))

(assert (= (and b!865986 (not condMapEmpty!26882)) mapNonEmpty!26882))

(get-info :version)

(assert (= (and mapNonEmpty!26882 ((_ is ValueCellFull!7988) mapValue!26882)) b!865997))

(assert (= (and b!865986 ((_ is ValueCellFull!7988) mapDefault!26882)) b!865992))

(assert (= start!73786 b!865986))

(declare-fun b_lambda!12053 () Bool)

(assert (=> (not b_lambda!12053) (not b!865999)))

(declare-fun t!24021 () Bool)

(declare-fun tb!4833 () Bool)

(assert (=> (and start!73786 (= defaultEntry!696 defaultEntry!696) t!24021) tb!4833))

(declare-fun result!9285 () Bool)

(assert (=> tb!4833 (= result!9285 tp_is_empty!16855)))

(assert (=> b!865999 t!24021))

(declare-fun b_and!24393 () Bool)

(assert (= b_and!24391 (and (=> t!24021 result!9285) b_and!24393)))

(declare-fun m!807093 () Bool)

(assert (=> b!866001 m!807093))

(declare-fun m!807095 () Bool)

(assert (=> mapNonEmpty!26882 m!807095))

(declare-fun m!807097 () Bool)

(assert (=> b!865987 m!807097))

(declare-fun m!807099 () Bool)

(assert (=> b!865987 m!807099))

(declare-fun m!807101 () Bool)

(assert (=> b!865987 m!807101))

(declare-fun m!807103 () Bool)

(assert (=> b!865987 m!807103))

(declare-fun m!807105 () Bool)

(assert (=> b!865987 m!807105))

(declare-fun m!807107 () Bool)

(assert (=> b!865989 m!807107))

(declare-fun m!807109 () Bool)

(assert (=> b!865993 m!807109))

(assert (=> b!865993 m!807109))

(declare-fun m!807111 () Bool)

(assert (=> b!865993 m!807111))

(declare-fun m!807113 () Bool)

(assert (=> b!865993 m!807113))

(assert (=> b!865993 m!807113))

(declare-fun m!807115 () Bool)

(assert (=> b!865993 m!807115))

(declare-fun m!807117 () Bool)

(assert (=> b!865995 m!807117))

(declare-fun m!807119 () Bool)

(assert (=> b!865990 m!807119))

(declare-fun m!807121 () Bool)

(assert (=> start!73786 m!807121))

(declare-fun m!807123 () Bool)

(assert (=> start!73786 m!807123))

(declare-fun m!807125 () Bool)

(assert (=> b!865988 m!807125))

(declare-fun m!807127 () Bool)

(assert (=> b!865999 m!807127))

(declare-fun m!807129 () Bool)

(assert (=> b!865999 m!807129))

(declare-fun m!807131 () Bool)

(assert (=> b!865999 m!807131))

(declare-fun m!807133 () Bool)

(assert (=> b!865999 m!807133))

(assert (=> b!865999 m!807129))

(assert (=> b!865999 m!807113))

(assert (=> b!865999 m!807131))

(declare-fun m!807135 () Bool)

(assert (=> b!866000 m!807135))

(declare-fun m!807137 () Bool)

(assert (=> b!866000 m!807137))

(declare-fun m!807139 () Bool)

(assert (=> b!866000 m!807139))

(assert (=> b!866000 m!807113))

(declare-fun m!807141 () Bool)

(assert (=> b!866000 m!807141))

(assert (=> b!866000 m!807113))

(declare-fun m!807143 () Bool)

(assert (=> b!866000 m!807143))

(declare-fun m!807145 () Bool)

(assert (=> b!865994 m!807145))

(declare-fun m!807147 () Bool)

(assert (=> b!865994 m!807147))

(declare-fun m!807149 () Bool)

(assert (=> b!865994 m!807149))

(check-sat (not b!865989) (not b!866000) b_and!24393 (not b!865988) (not b!865999) (not b_lambda!12053) (not b!865987) (not mapNonEmpty!26882) (not b!866001) (not b!865994) tp_is_empty!16855 (not b!865990) (not start!73786) (not b_next!14719) (not b!865993))
(check-sat b_and!24393 (not b_next!14719))
