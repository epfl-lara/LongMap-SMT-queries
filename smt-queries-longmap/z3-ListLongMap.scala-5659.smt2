; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73740 () Bool)

(assert start!73740)

(declare-fun b_free!14655 () Bool)

(declare-fun b_next!14655 () Bool)

(assert (=> start!73740 (= b_free!14655 (not b_next!14655))))

(declare-fun tp!51468 () Bool)

(declare-fun b_and!24289 () Bool)

(assert (=> start!73740 (= tp!51468 b_and!24289)))

(declare-fun b!864625 () Bool)

(declare-fun res!587513 () Bool)

(declare-fun e!481667 () Bool)

(assert (=> b!864625 (=> (not res!587513) (not e!481667))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864625 (= res!587513 (validKeyInArray!0 k0!854))))

(declare-fun b!864626 () Bool)

(declare-fun e!481668 () Bool)

(declare-fun e!481671 () Bool)

(declare-fun mapRes!26786 () Bool)

(assert (=> b!864626 (= e!481668 (and e!481671 mapRes!26786))))

(declare-fun condMapEmpty!26786 () Bool)

(declare-datatypes ((V!27435 0))(
  ( (V!27436 (val!8443 Int)) )
))
(declare-datatypes ((ValueCell!7956 0))(
  ( (ValueCellFull!7956 (v!10868 V!27435)) (EmptyCell!7956) )
))
(declare-datatypes ((array!49742 0))(
  ( (array!49743 (arr!23902 (Array (_ BitVec 32) ValueCell!7956)) (size!24342 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49742)

(declare-fun mapDefault!26786 () ValueCell!7956)

(assert (=> b!864626 (= condMapEmpty!26786 (= (arr!23902 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7956)) mapDefault!26786)))))

(declare-fun b!864627 () Bool)

(declare-fun res!587510 () Bool)

(assert (=> b!864627 (=> (not res!587510) (not e!481667))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49744 0))(
  ( (array!49745 (arr!23903 (Array (_ BitVec 32) (_ BitVec 64))) (size!24343 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49744)

(assert (=> b!864627 (= res!587510 (and (= (size!24342 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24343 _keys!868) (size!24342 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864628 () Bool)

(declare-datatypes ((Unit!29586 0))(
  ( (Unit!29587) )
))
(declare-fun e!481672 () Unit!29586)

(declare-fun Unit!29588 () Unit!29586)

(assert (=> b!864628 (= e!481672 Unit!29588)))

(declare-fun b!864629 () Bool)

(declare-fun Unit!29589 () Unit!29586)

(assert (=> b!864629 (= e!481672 Unit!29589)))

(declare-fun lt!391372 () Unit!29586)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49744 (_ BitVec 32) (_ BitVec 32)) Unit!29586)

(assert (=> b!864629 (= lt!391372 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16986 0))(
  ( (Nil!16983) (Cons!16982 (h!18113 (_ BitVec 64)) (t!23907 List!16986)) )
))
(declare-fun arrayNoDuplicates!0 (array!49744 (_ BitVec 32) List!16986) Bool)

(assert (=> b!864629 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16983)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!391377 () Unit!29586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49744 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29586)

(assert (=> b!864629 (= lt!391377 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864629 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391374 () Unit!29586)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49744 (_ BitVec 64) (_ BitVec 32) List!16986) Unit!29586)

(assert (=> b!864629 (= lt!391374 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16983))))

(assert (=> b!864629 false))

(declare-fun b!864630 () Bool)

(declare-fun res!587511 () Bool)

(assert (=> b!864630 (=> (not res!587511) (not e!481667))))

(assert (=> b!864630 (= res!587511 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24343 _keys!868))))))

(declare-fun mapNonEmpty!26786 () Bool)

(declare-fun tp!51469 () Bool)

(declare-fun e!481675 () Bool)

(assert (=> mapNonEmpty!26786 (= mapRes!26786 (and tp!51469 e!481675))))

(declare-fun mapRest!26786 () (Array (_ BitVec 32) ValueCell!7956))

(declare-fun mapKey!26786 () (_ BitVec 32))

(declare-fun mapValue!26786 () ValueCell!7956)

(assert (=> mapNonEmpty!26786 (= (arr!23902 _values!688) (store mapRest!26786 mapKey!26786 mapValue!26786))))

(declare-fun b!864631 () Bool)

(declare-fun tp_is_empty!16791 () Bool)

(assert (=> b!864631 (= e!481675 tp_is_empty!16791)))

(declare-fun b!864632 () Bool)

(declare-fun res!587514 () Bool)

(assert (=> b!864632 (=> (not res!587514) (not e!481667))))

(assert (=> b!864632 (= res!587514 (and (= (select (arr!23903 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864633 () Bool)

(declare-fun e!481669 () Bool)

(declare-fun e!481670 () Bool)

(assert (=> b!864633 (= e!481669 (not e!481670))))

(declare-fun res!587516 () Bool)

(assert (=> b!864633 (=> res!587516 e!481670)))

(assert (=> b!864633 (= res!587516 (not (validKeyInArray!0 (select (arr!23903 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11182 0))(
  ( (tuple2!11183 (_1!5602 (_ BitVec 64)) (_2!5602 V!27435)) )
))
(declare-datatypes ((List!16987 0))(
  ( (Nil!16984) (Cons!16983 (h!18114 tuple2!11182) (t!23908 List!16987)) )
))
(declare-datatypes ((ListLongMap!9951 0))(
  ( (ListLongMap!9952 (toList!4991 List!16987)) )
))
(declare-fun lt!391375 () ListLongMap!9951)

(declare-fun lt!391379 () ListLongMap!9951)

(assert (=> b!864633 (= lt!391375 lt!391379)))

(declare-fun lt!391370 () ListLongMap!9951)

(declare-fun lt!391381 () tuple2!11182)

(declare-fun +!2340 (ListLongMap!9951 tuple2!11182) ListLongMap!9951)

(assert (=> b!864633 (= lt!391379 (+!2340 lt!391370 lt!391381))))

(declare-fun lt!391369 () array!49742)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27435)

(declare-fun zeroValue!654 () V!27435)

(declare-fun getCurrentListMapNoExtraKeys!2963 (array!49744 array!49742 (_ BitVec 32) (_ BitVec 32) V!27435 V!27435 (_ BitVec 32) Int) ListLongMap!9951)

(assert (=> b!864633 (= lt!391375 (getCurrentListMapNoExtraKeys!2963 _keys!868 lt!391369 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27435)

(assert (=> b!864633 (= lt!391381 (tuple2!11183 k0!854 v!557))))

(assert (=> b!864633 (= lt!391370 (getCurrentListMapNoExtraKeys!2963 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391373 () Unit!29586)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!543 (array!49744 array!49742 (_ BitVec 32) (_ BitVec 32) V!27435 V!27435 (_ BitVec 32) (_ BitVec 64) V!27435 (_ BitVec 32) Int) Unit!29586)

(assert (=> b!864633 (= lt!391373 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!543 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864634 () Bool)

(declare-fun e!481674 () Bool)

(assert (=> b!864634 (= e!481674 true)))

(declare-fun lt!391371 () ListLongMap!9951)

(declare-fun lt!391382 () tuple2!11182)

(assert (=> b!864634 (= lt!391371 (+!2340 (+!2340 lt!391370 lt!391382) lt!391381))))

(declare-fun lt!391384 () Unit!29586)

(declare-fun lt!391383 () V!27435)

(declare-fun addCommutativeForDiffKeys!511 (ListLongMap!9951 (_ BitVec 64) V!27435 (_ BitVec 64) V!27435) Unit!29586)

(assert (=> b!864634 (= lt!391384 (addCommutativeForDiffKeys!511 lt!391370 k0!854 v!557 (select (arr!23903 _keys!868) from!1053) lt!391383))))

(declare-fun b!864635 () Bool)

(declare-fun res!587515 () Bool)

(assert (=> b!864635 (=> (not res!587515) (not e!481667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49744 (_ BitVec 32)) Bool)

(assert (=> b!864635 (= res!587515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864636 () Bool)

(declare-fun res!587508 () Bool)

(assert (=> b!864636 (=> (not res!587508) (not e!481667))))

(assert (=> b!864636 (= res!587508 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16983))))

(declare-fun b!864637 () Bool)

(assert (=> b!864637 (= e!481671 tp_is_empty!16791)))

(declare-fun res!587509 () Bool)

(assert (=> start!73740 (=> (not res!587509) (not e!481667))))

(assert (=> start!73740 (= res!587509 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24343 _keys!868))))))

(assert (=> start!73740 e!481667))

(assert (=> start!73740 tp_is_empty!16791))

(assert (=> start!73740 true))

(assert (=> start!73740 tp!51468))

(declare-fun array_inv!18900 (array!49744) Bool)

(assert (=> start!73740 (array_inv!18900 _keys!868)))

(declare-fun array_inv!18901 (array!49742) Bool)

(assert (=> start!73740 (and (array_inv!18901 _values!688) e!481668)))

(declare-fun b!864638 () Bool)

(assert (=> b!864638 (= e!481667 e!481669)))

(declare-fun res!587512 () Bool)

(assert (=> b!864638 (=> (not res!587512) (not e!481669))))

(assert (=> b!864638 (= res!587512 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!391376 () ListLongMap!9951)

(assert (=> b!864638 (= lt!391376 (getCurrentListMapNoExtraKeys!2963 _keys!868 lt!391369 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864638 (= lt!391369 (array!49743 (store (arr!23902 _values!688) i!612 (ValueCellFull!7956 v!557)) (size!24342 _values!688)))))

(declare-fun lt!391380 () ListLongMap!9951)

(assert (=> b!864638 (= lt!391380 (getCurrentListMapNoExtraKeys!2963 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864639 () Bool)

(declare-fun res!587507 () Bool)

(assert (=> b!864639 (=> (not res!587507) (not e!481667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864639 (= res!587507 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26786 () Bool)

(assert (=> mapIsEmpty!26786 mapRes!26786))

(declare-fun b!864640 () Bool)

(assert (=> b!864640 (= e!481670 e!481674)))

(declare-fun res!587506 () Bool)

(assert (=> b!864640 (=> res!587506 e!481674)))

(assert (=> b!864640 (= res!587506 (= k0!854 (select (arr!23903 _keys!868) from!1053)))))

(assert (=> b!864640 (not (= (select (arr!23903 _keys!868) from!1053) k0!854))))

(declare-fun lt!391378 () Unit!29586)

(assert (=> b!864640 (= lt!391378 e!481672)))

(declare-fun c!92203 () Bool)

(assert (=> b!864640 (= c!92203 (= (select (arr!23903 _keys!868) from!1053) k0!854))))

(assert (=> b!864640 (= lt!391376 lt!391371)))

(assert (=> b!864640 (= lt!391371 (+!2340 lt!391379 lt!391382))))

(assert (=> b!864640 (= lt!391382 (tuple2!11183 (select (arr!23903 _keys!868) from!1053) lt!391383))))

(declare-fun get!12627 (ValueCell!7956 V!27435) V!27435)

(declare-fun dynLambda!1165 (Int (_ BitVec 64)) V!27435)

(assert (=> b!864640 (= lt!391383 (get!12627 (select (arr!23902 _values!688) from!1053) (dynLambda!1165 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!73740 res!587509) b!864639))

(assert (= (and b!864639 res!587507) b!864627))

(assert (= (and b!864627 res!587510) b!864635))

(assert (= (and b!864635 res!587515) b!864636))

(assert (= (and b!864636 res!587508) b!864630))

(assert (= (and b!864630 res!587511) b!864625))

(assert (= (and b!864625 res!587513) b!864632))

(assert (= (and b!864632 res!587514) b!864638))

(assert (= (and b!864638 res!587512) b!864633))

(assert (= (and b!864633 (not res!587516)) b!864640))

(assert (= (and b!864640 c!92203) b!864629))

(assert (= (and b!864640 (not c!92203)) b!864628))

(assert (= (and b!864640 (not res!587506)) b!864634))

(assert (= (and b!864626 condMapEmpty!26786) mapIsEmpty!26786))

(assert (= (and b!864626 (not condMapEmpty!26786)) mapNonEmpty!26786))

(get-info :version)

(assert (= (and mapNonEmpty!26786 ((_ is ValueCellFull!7956) mapValue!26786)) b!864631))

(assert (= (and b!864626 ((_ is ValueCellFull!7956) mapDefault!26786)) b!864637))

(assert (= start!73740 b!864626))

(declare-fun b_lambda!12007 () Bool)

(assert (=> (not b_lambda!12007) (not b!864640)))

(declare-fun t!23906 () Bool)

(declare-fun tb!4777 () Bool)

(assert (=> (and start!73740 (= defaultEntry!696 defaultEntry!696) t!23906) tb!4777))

(declare-fun result!9165 () Bool)

(assert (=> tb!4777 (= result!9165 tp_is_empty!16791)))

(assert (=> b!864640 t!23906))

(declare-fun b_and!24291 () Bool)

(assert (= b_and!24289 (and (=> t!23906 result!9165) b_and!24291)))

(declare-fun m!805995 () Bool)

(assert (=> mapNonEmpty!26786 m!805995))

(declare-fun m!805997 () Bool)

(assert (=> b!864634 m!805997))

(assert (=> b!864634 m!805997))

(declare-fun m!805999 () Bool)

(assert (=> b!864634 m!805999))

(declare-fun m!806001 () Bool)

(assert (=> b!864634 m!806001))

(assert (=> b!864634 m!806001))

(declare-fun m!806003 () Bool)

(assert (=> b!864634 m!806003))

(declare-fun m!806005 () Bool)

(assert (=> b!864638 m!806005))

(declare-fun m!806007 () Bool)

(assert (=> b!864638 m!806007))

(declare-fun m!806009 () Bool)

(assert (=> b!864638 m!806009))

(declare-fun m!806011 () Bool)

(assert (=> b!864636 m!806011))

(declare-fun m!806013 () Bool)

(assert (=> b!864625 m!806013))

(declare-fun m!806015 () Bool)

(assert (=> b!864632 m!806015))

(declare-fun m!806017 () Bool)

(assert (=> b!864640 m!806017))

(declare-fun m!806019 () Bool)

(assert (=> b!864640 m!806019))

(declare-fun m!806021 () Bool)

(assert (=> b!864640 m!806021))

(assert (=> b!864640 m!806001))

(assert (=> b!864640 m!806019))

(declare-fun m!806023 () Bool)

(assert (=> b!864640 m!806023))

(assert (=> b!864640 m!806017))

(declare-fun m!806025 () Bool)

(assert (=> b!864633 m!806025))

(assert (=> b!864633 m!806001))

(declare-fun m!806027 () Bool)

(assert (=> b!864633 m!806027))

(assert (=> b!864633 m!806001))

(declare-fun m!806029 () Bool)

(assert (=> b!864633 m!806029))

(declare-fun m!806031 () Bool)

(assert (=> b!864633 m!806031))

(declare-fun m!806033 () Bool)

(assert (=> b!864633 m!806033))

(declare-fun m!806035 () Bool)

(assert (=> start!73740 m!806035))

(declare-fun m!806037 () Bool)

(assert (=> start!73740 m!806037))

(declare-fun m!806039 () Bool)

(assert (=> b!864639 m!806039))

(declare-fun m!806041 () Bool)

(assert (=> b!864629 m!806041))

(declare-fun m!806043 () Bool)

(assert (=> b!864629 m!806043))

(declare-fun m!806045 () Bool)

(assert (=> b!864629 m!806045))

(declare-fun m!806047 () Bool)

(assert (=> b!864629 m!806047))

(declare-fun m!806049 () Bool)

(assert (=> b!864629 m!806049))

(declare-fun m!806051 () Bool)

(assert (=> b!864635 m!806051))

(check-sat (not b!864634) (not start!73740) (not b!864635) (not mapNonEmpty!26786) (not b!864625) (not b!864636) (not b!864629) (not b!864633) (not b_lambda!12007) tp_is_empty!16791 (not b!864640) b_and!24291 (not b!864638) (not b!864639) (not b_next!14655))
(check-sat b_and!24291 (not b_next!14655))
