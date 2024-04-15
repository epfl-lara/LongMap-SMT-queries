; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73702 () Bool)

(assert start!73702)

(declare-fun b_free!14635 () Bool)

(declare-fun b_next!14635 () Bool)

(assert (=> start!73702 (= b_free!14635 (not b_next!14635))))

(declare-fun tp!51409 () Bool)

(declare-fun b_and!24223 () Bool)

(assert (=> start!73702 (= tp!51409 b_and!24223)))

(declare-fun b!863886 () Bool)

(declare-fun res!587075 () Bool)

(declare-fun e!481257 () Bool)

(assert (=> b!863886 (=> (not res!587075) (not e!481257))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863886 (= res!587075 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26756 () Bool)

(declare-fun mapRes!26756 () Bool)

(assert (=> mapIsEmpty!26756 mapRes!26756))

(declare-fun mapNonEmpty!26756 () Bool)

(declare-fun tp!51410 () Bool)

(declare-fun e!481255 () Bool)

(assert (=> mapNonEmpty!26756 (= mapRes!26756 (and tp!51410 e!481255))))

(declare-datatypes ((V!27409 0))(
  ( (V!27410 (val!8433 Int)) )
))
(declare-datatypes ((ValueCell!7946 0))(
  ( (ValueCellFull!7946 (v!10852 V!27409)) (EmptyCell!7946) )
))
(declare-fun mapRest!26756 () (Array (_ BitVec 32) ValueCell!7946))

(declare-fun mapKey!26756 () (_ BitVec 32))

(declare-fun mapValue!26756 () ValueCell!7946)

(declare-datatypes ((array!49695 0))(
  ( (array!49696 (arr!23879 (Array (_ BitVec 32) ValueCell!7946)) (size!24321 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49695)

(assert (=> mapNonEmpty!26756 (= (arr!23879 _values!688) (store mapRest!26756 mapKey!26756 mapValue!26756))))

(declare-fun b!863887 () Bool)

(declare-fun res!587072 () Bool)

(assert (=> b!863887 (=> (not res!587072) (not e!481257))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49697 0))(
  ( (array!49698 (arr!23880 (Array (_ BitVec 32) (_ BitVec 64))) (size!24322 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49697)

(assert (=> b!863887 (= res!587072 (and (= (size!24321 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24322 _keys!868) (size!24321 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863888 () Bool)

(declare-fun e!481251 () Bool)

(declare-fun e!481249 () Bool)

(assert (=> b!863888 (= e!481251 (and e!481249 mapRes!26756))))

(declare-fun condMapEmpty!26756 () Bool)

(declare-fun mapDefault!26756 () ValueCell!7946)

(assert (=> b!863888 (= condMapEmpty!26756 (= (arr!23879 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7946)) mapDefault!26756)))))

(declare-fun b!863889 () Bool)

(declare-datatypes ((Unit!29478 0))(
  ( (Unit!29479) )
))
(declare-fun e!481254 () Unit!29478)

(declare-fun Unit!29480 () Unit!29478)

(assert (=> b!863889 (= e!481254 Unit!29480)))

(declare-fun res!587068 () Bool)

(assert (=> start!73702 (=> (not res!587068) (not e!481257))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73702 (= res!587068 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24322 _keys!868))))))

(assert (=> start!73702 e!481257))

(declare-fun tp_is_empty!16771 () Bool)

(assert (=> start!73702 tp_is_empty!16771))

(assert (=> start!73702 true))

(assert (=> start!73702 tp!51409))

(declare-fun array_inv!18956 (array!49697) Bool)

(assert (=> start!73702 (array_inv!18956 _keys!868)))

(declare-fun array_inv!18957 (array!49695) Bool)

(assert (=> start!73702 (and (array_inv!18957 _values!688) e!481251)))

(declare-fun b!863890 () Bool)

(assert (=> b!863890 (= e!481255 tp_is_empty!16771)))

(declare-fun b!863891 () Bool)

(declare-fun Unit!29481 () Unit!29478)

(assert (=> b!863891 (= e!481254 Unit!29481)))

(declare-fun lt!390663 () Unit!29478)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49697 (_ BitVec 32) (_ BitVec 32)) Unit!29478)

(assert (=> b!863891 (= lt!390663 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16972 0))(
  ( (Nil!16969) (Cons!16968 (h!18099 (_ BitVec 64)) (t!23864 List!16972)) )
))
(declare-fun arrayNoDuplicates!0 (array!49697 (_ BitVec 32) List!16972) Bool)

(assert (=> b!863891 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16969)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!390656 () Unit!29478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29478)

(assert (=> b!863891 (= lt!390656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863891 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390655 () Unit!29478)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49697 (_ BitVec 64) (_ BitVec 32) List!16972) Unit!29478)

(assert (=> b!863891 (= lt!390655 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16969))))

(assert (=> b!863891 false))

(declare-fun b!863892 () Bool)

(declare-fun res!587076 () Bool)

(assert (=> b!863892 (=> (not res!587076) (not e!481257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49697 (_ BitVec 32)) Bool)

(assert (=> b!863892 (= res!587076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863893 () Bool)

(assert (=> b!863893 (= e!481249 tp_is_empty!16771)))

(declare-fun b!863894 () Bool)

(declare-fun res!587074 () Bool)

(assert (=> b!863894 (=> (not res!587074) (not e!481257))))

(assert (=> b!863894 (= res!587074 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16969))))

(declare-fun b!863895 () Bool)

(declare-fun e!481256 () Bool)

(declare-fun e!481252 () Bool)

(assert (=> b!863895 (= e!481256 e!481252)))

(declare-fun res!587069 () Bool)

(assert (=> b!863895 (=> res!587069 e!481252)))

(assert (=> b!863895 (= res!587069 (= k0!854 (select (arr!23880 _keys!868) from!1053)))))

(assert (=> b!863895 (not (= (select (arr!23880 _keys!868) from!1053) k0!854))))

(declare-fun lt!390667 () Unit!29478)

(assert (=> b!863895 (= lt!390667 e!481254)))

(declare-fun c!92108 () Bool)

(assert (=> b!863895 (= c!92108 (= (select (arr!23880 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11178 0))(
  ( (tuple2!11179 (_1!5600 (_ BitVec 64)) (_2!5600 V!27409)) )
))
(declare-datatypes ((List!16973 0))(
  ( (Nil!16970) (Cons!16969 (h!18100 tuple2!11178) (t!23865 List!16973)) )
))
(declare-datatypes ((ListLongMap!9937 0))(
  ( (ListLongMap!9938 (toList!4984 List!16973)) )
))
(declare-fun lt!390659 () ListLongMap!9937)

(declare-fun lt!390661 () ListLongMap!9937)

(assert (=> b!863895 (= lt!390659 lt!390661)))

(declare-fun lt!390657 () ListLongMap!9937)

(declare-fun lt!390668 () tuple2!11178)

(declare-fun +!2353 (ListLongMap!9937 tuple2!11178) ListLongMap!9937)

(assert (=> b!863895 (= lt!390661 (+!2353 lt!390657 lt!390668))))

(declare-fun lt!390653 () V!27409)

(assert (=> b!863895 (= lt!390668 (tuple2!11179 (select (arr!23880 _keys!868) from!1053) lt!390653))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12614 (ValueCell!7946 V!27409) V!27409)

(declare-fun dynLambda!1155 (Int (_ BitVec 64)) V!27409)

(assert (=> b!863895 (= lt!390653 (get!12614 (select (arr!23879 _values!688) from!1053) (dynLambda!1155 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863896 () Bool)

(declare-fun e!481250 () Bool)

(assert (=> b!863896 (= e!481250 (not e!481256))))

(declare-fun res!587073 () Bool)

(assert (=> b!863896 (=> res!587073 e!481256)))

(assert (=> b!863896 (= res!587073 (not (validKeyInArray!0 (select (arr!23880 _keys!868) from!1053))))))

(declare-fun lt!390664 () ListLongMap!9937)

(assert (=> b!863896 (= lt!390664 lt!390657)))

(declare-fun lt!390658 () ListLongMap!9937)

(declare-fun lt!390666 () tuple2!11178)

(assert (=> b!863896 (= lt!390657 (+!2353 lt!390658 lt!390666))))

(declare-fun lt!390662 () array!49695)

(declare-fun minValue!654 () V!27409)

(declare-fun zeroValue!654 () V!27409)

(declare-fun getCurrentListMapNoExtraKeys!2983 (array!49697 array!49695 (_ BitVec 32) (_ BitVec 32) V!27409 V!27409 (_ BitVec 32) Int) ListLongMap!9937)

(assert (=> b!863896 (= lt!390664 (getCurrentListMapNoExtraKeys!2983 _keys!868 lt!390662 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27409)

(assert (=> b!863896 (= lt!390666 (tuple2!11179 k0!854 v!557))))

(assert (=> b!863896 (= lt!390658 (getCurrentListMapNoExtraKeys!2983 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390654 () Unit!29478)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!533 (array!49697 array!49695 (_ BitVec 32) (_ BitVec 32) V!27409 V!27409 (_ BitVec 32) (_ BitVec 64) V!27409 (_ BitVec 32) Int) Unit!29478)

(assert (=> b!863896 (= lt!390654 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!533 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863897 () Bool)

(declare-fun res!587066 () Bool)

(assert (=> b!863897 (=> (not res!587066) (not e!481257))))

(assert (=> b!863897 (= res!587066 (and (= (select (arr!23880 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863898 () Bool)

(assert (=> b!863898 (= e!481257 e!481250)))

(declare-fun res!587067 () Bool)

(assert (=> b!863898 (=> (not res!587067) (not e!481250))))

(assert (=> b!863898 (= res!587067 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!863898 (= lt!390659 (getCurrentListMapNoExtraKeys!2983 _keys!868 lt!390662 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863898 (= lt!390662 (array!49696 (store (arr!23879 _values!688) i!612 (ValueCellFull!7946 v!557)) (size!24321 _values!688)))))

(declare-fun lt!390665 () ListLongMap!9937)

(assert (=> b!863898 (= lt!390665 (getCurrentListMapNoExtraKeys!2983 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863899 () Bool)

(declare-fun res!587071 () Bool)

(assert (=> b!863899 (=> (not res!587071) (not e!481257))))

(assert (=> b!863899 (= res!587071 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24322 _keys!868))))))

(declare-fun b!863900 () Bool)

(declare-fun res!587070 () Bool)

(assert (=> b!863900 (=> (not res!587070) (not e!481257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863900 (= res!587070 (validMask!0 mask!1196))))

(declare-fun b!863901 () Bool)

(assert (=> b!863901 (= e!481252 true)))

(assert (=> b!863901 (= lt!390661 (+!2353 (+!2353 lt!390658 lt!390668) lt!390666))))

(declare-fun lt!390660 () Unit!29478)

(declare-fun addCommutativeForDiffKeys!497 (ListLongMap!9937 (_ BitVec 64) V!27409 (_ BitVec 64) V!27409) Unit!29478)

(assert (=> b!863901 (= lt!390660 (addCommutativeForDiffKeys!497 lt!390658 k0!854 v!557 (select (arr!23880 _keys!868) from!1053) lt!390653))))

(assert (= (and start!73702 res!587068) b!863900))

(assert (= (and b!863900 res!587070) b!863887))

(assert (= (and b!863887 res!587072) b!863892))

(assert (= (and b!863892 res!587076) b!863894))

(assert (= (and b!863894 res!587074) b!863899))

(assert (= (and b!863899 res!587071) b!863886))

(assert (= (and b!863886 res!587075) b!863897))

(assert (= (and b!863897 res!587066) b!863898))

(assert (= (and b!863898 res!587067) b!863896))

(assert (= (and b!863896 (not res!587073)) b!863895))

(assert (= (and b!863895 c!92108) b!863891))

(assert (= (and b!863895 (not c!92108)) b!863889))

(assert (= (and b!863895 (not res!587069)) b!863901))

(assert (= (and b!863888 condMapEmpty!26756) mapIsEmpty!26756))

(assert (= (and b!863888 (not condMapEmpty!26756)) mapNonEmpty!26756))

(get-info :version)

(assert (= (and mapNonEmpty!26756 ((_ is ValueCellFull!7946) mapValue!26756)) b!863890))

(assert (= (and b!863888 ((_ is ValueCellFull!7946) mapDefault!26756)) b!863893))

(assert (= start!73702 b!863888))

(declare-fun b_lambda!11969 () Bool)

(assert (=> (not b_lambda!11969) (not b!863895)))

(declare-fun t!23863 () Bool)

(declare-fun tb!4749 () Bool)

(assert (=> (and start!73702 (= defaultEntry!696 defaultEntry!696) t!23863) tb!4749))

(declare-fun result!9117 () Bool)

(assert (=> tb!4749 (= result!9117 tp_is_empty!16771)))

(assert (=> b!863895 t!23863))

(declare-fun b_and!24225 () Bool)

(assert (= b_and!24223 (and (=> t!23863 result!9117) b_and!24225)))

(declare-fun m!804657 () Bool)

(assert (=> start!73702 m!804657))

(declare-fun m!804659 () Bool)

(assert (=> start!73702 m!804659))

(declare-fun m!804661 () Bool)

(assert (=> b!863891 m!804661))

(declare-fun m!804663 () Bool)

(assert (=> b!863891 m!804663))

(declare-fun m!804665 () Bool)

(assert (=> b!863891 m!804665))

(declare-fun m!804667 () Bool)

(assert (=> b!863891 m!804667))

(declare-fun m!804669 () Bool)

(assert (=> b!863891 m!804669))

(declare-fun m!804671 () Bool)

(assert (=> b!863901 m!804671))

(assert (=> b!863901 m!804671))

(declare-fun m!804673 () Bool)

(assert (=> b!863901 m!804673))

(declare-fun m!804675 () Bool)

(assert (=> b!863901 m!804675))

(assert (=> b!863901 m!804675))

(declare-fun m!804677 () Bool)

(assert (=> b!863901 m!804677))

(declare-fun m!804679 () Bool)

(assert (=> b!863897 m!804679))

(declare-fun m!804681 () Bool)

(assert (=> b!863895 m!804681))

(declare-fun m!804683 () Bool)

(assert (=> b!863895 m!804683))

(declare-fun m!804685 () Bool)

(assert (=> b!863895 m!804685))

(declare-fun m!804687 () Bool)

(assert (=> b!863895 m!804687))

(assert (=> b!863895 m!804683))

(assert (=> b!863895 m!804675))

(assert (=> b!863895 m!804685))

(declare-fun m!804689 () Bool)

(assert (=> b!863892 m!804689))

(declare-fun m!804691 () Bool)

(assert (=> mapNonEmpty!26756 m!804691))

(declare-fun m!804693 () Bool)

(assert (=> b!863894 m!804693))

(declare-fun m!804695 () Bool)

(assert (=> b!863898 m!804695))

(declare-fun m!804697 () Bool)

(assert (=> b!863898 m!804697))

(declare-fun m!804699 () Bool)

(assert (=> b!863898 m!804699))

(declare-fun m!804701 () Bool)

(assert (=> b!863896 m!804701))

(assert (=> b!863896 m!804675))

(declare-fun m!804703 () Bool)

(assert (=> b!863896 m!804703))

(assert (=> b!863896 m!804675))

(declare-fun m!804705 () Bool)

(assert (=> b!863896 m!804705))

(declare-fun m!804707 () Bool)

(assert (=> b!863896 m!804707))

(declare-fun m!804709 () Bool)

(assert (=> b!863896 m!804709))

(declare-fun m!804711 () Bool)

(assert (=> b!863900 m!804711))

(declare-fun m!804713 () Bool)

(assert (=> b!863886 m!804713))

(check-sat b_and!24225 tp_is_empty!16771 (not b!863898) (not b!863900) (not b!863896) (not start!73702) (not b!863892) (not b!863891) (not b_next!14635) (not b!863894) (not b!863901) (not b!863886) (not mapNonEmpty!26756) (not b_lambda!11969) (not b!863895))
(check-sat b_and!24225 (not b_next!14635))
