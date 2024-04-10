; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73704 () Bool)

(assert start!73704)

(declare-fun b_free!14619 () Bool)

(declare-fun b_next!14619 () Bool)

(assert (=> start!73704 (= b_free!14619 (not b_next!14619))))

(declare-fun tp!51361 () Bool)

(declare-fun b_and!24217 () Bool)

(assert (=> start!73704 (= tp!51361 b_and!24217)))

(declare-fun b!863725 () Bool)

(declare-datatypes ((Unit!29530 0))(
  ( (Unit!29531) )
))
(declare-fun e!481184 () Unit!29530)

(declare-fun Unit!29532 () Unit!29530)

(assert (=> b!863725 (= e!481184 Unit!29532)))

(declare-fun lt!390512 () Unit!29530)

(declare-datatypes ((array!49672 0))(
  ( (array!49673 (arr!23867 (Array (_ BitVec 32) (_ BitVec 64))) (size!24307 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49672)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49672 (_ BitVec 32) (_ BitVec 32)) Unit!29530)

(assert (=> b!863725 (= lt!390512 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16958 0))(
  ( (Nil!16955) (Cons!16954 (h!18085 (_ BitVec 64)) (t!23843 List!16958)) )
))
(declare-fun arrayNoDuplicates!0 (array!49672 (_ BitVec 32) List!16958) Bool)

(assert (=> b!863725 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16955)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!390518 () Unit!29530)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49672 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29530)

(assert (=> b!863725 (= lt!390518 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863725 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390519 () Unit!29530)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49672 (_ BitVec 64) (_ BitVec 32) List!16958) Unit!29530)

(assert (=> b!863725 (= lt!390519 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16955))))

(assert (=> b!863725 false))

(declare-fun b!863726 () Bool)

(declare-fun res!586915 () Bool)

(declare-fun e!481189 () Bool)

(assert (=> b!863726 (=> (not res!586915) (not e!481189))))

(assert (=> b!863726 (= res!586915 (and (= (select (arr!23867 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863727 () Bool)

(declare-fun e!481186 () Bool)

(declare-fun e!481188 () Bool)

(declare-fun mapRes!26732 () Bool)

(assert (=> b!863727 (= e!481186 (and e!481188 mapRes!26732))))

(declare-fun condMapEmpty!26732 () Bool)

(declare-datatypes ((V!27387 0))(
  ( (V!27388 (val!8425 Int)) )
))
(declare-datatypes ((ValueCell!7938 0))(
  ( (ValueCellFull!7938 (v!10850 V!27387)) (EmptyCell!7938) )
))
(declare-datatypes ((array!49674 0))(
  ( (array!49675 (arr!23868 (Array (_ BitVec 32) ValueCell!7938)) (size!24308 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49674)

(declare-fun mapDefault!26732 () ValueCell!7938)

(assert (=> b!863727 (= condMapEmpty!26732 (= (arr!23868 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7938)) mapDefault!26732)))))

(declare-fun b!863728 () Bool)

(declare-fun e!481185 () Bool)

(declare-fun e!481183 () Bool)

(assert (=> b!863728 (= e!481185 (not e!481183))))

(declare-fun res!586922 () Bool)

(assert (=> b!863728 (=> res!586922 e!481183)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863728 (= res!586922 (not (validKeyInArray!0 (select (arr!23867 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11152 0))(
  ( (tuple2!11153 (_1!5587 (_ BitVec 64)) (_2!5587 V!27387)) )
))
(declare-datatypes ((List!16959 0))(
  ( (Nil!16956) (Cons!16955 (h!18086 tuple2!11152) (t!23844 List!16959)) )
))
(declare-datatypes ((ListLongMap!9921 0))(
  ( (ListLongMap!9922 (toList!4976 List!16959)) )
))
(declare-fun lt!390515 () ListLongMap!9921)

(declare-fun lt!390520 () ListLongMap!9921)

(assert (=> b!863728 (= lt!390515 lt!390520)))

(declare-fun lt!390509 () ListLongMap!9921)

(declare-fun lt!390506 () tuple2!11152)

(declare-fun +!2325 (ListLongMap!9921 tuple2!11152) ListLongMap!9921)

(assert (=> b!863728 (= lt!390520 (+!2325 lt!390509 lt!390506))))

(declare-fun lt!390508 () array!49674)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27387)

(declare-fun zeroValue!654 () V!27387)

(declare-fun getCurrentListMapNoExtraKeys!2951 (array!49672 array!49674 (_ BitVec 32) (_ BitVec 32) V!27387 V!27387 (_ BitVec 32) Int) ListLongMap!9921)

(assert (=> b!863728 (= lt!390515 (getCurrentListMapNoExtraKeys!2951 _keys!868 lt!390508 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27387)

(assert (=> b!863728 (= lt!390506 (tuple2!11153 k0!854 v!557))))

(assert (=> b!863728 (= lt!390509 (getCurrentListMapNoExtraKeys!2951 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390510 () Unit!29530)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!532 (array!49672 array!49674 (_ BitVec 32) (_ BitVec 32) V!27387 V!27387 (_ BitVec 32) (_ BitVec 64) V!27387 (_ BitVec 32) Int) Unit!29530)

(assert (=> b!863728 (= lt!390510 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!532 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863729 () Bool)

(declare-fun res!586912 () Bool)

(assert (=> b!863729 (=> (not res!586912) (not e!481189))))

(assert (=> b!863729 (= res!586912 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24307 _keys!868))))))

(declare-fun mapNonEmpty!26732 () Bool)

(declare-fun tp!51360 () Bool)

(declare-fun e!481182 () Bool)

(assert (=> mapNonEmpty!26732 (= mapRes!26732 (and tp!51360 e!481182))))

(declare-fun mapValue!26732 () ValueCell!7938)

(declare-fun mapKey!26732 () (_ BitVec 32))

(declare-fun mapRest!26732 () (Array (_ BitVec 32) ValueCell!7938))

(assert (=> mapNonEmpty!26732 (= (arr!23868 _values!688) (store mapRest!26732 mapKey!26732 mapValue!26732))))

(declare-fun b!863730 () Bool)

(declare-fun Unit!29533 () Unit!29530)

(assert (=> b!863730 (= e!481184 Unit!29533)))

(declare-fun b!863731 () Bool)

(declare-fun res!586920 () Bool)

(assert (=> b!863731 (=> (not res!586920) (not e!481189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49672 (_ BitVec 32)) Bool)

(assert (=> b!863731 (= res!586920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863732 () Bool)

(assert (=> b!863732 (= e!481189 e!481185)))

(declare-fun res!586917 () Bool)

(assert (=> b!863732 (=> (not res!586917) (not e!481185))))

(assert (=> b!863732 (= res!586917 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390513 () ListLongMap!9921)

(assert (=> b!863732 (= lt!390513 (getCurrentListMapNoExtraKeys!2951 _keys!868 lt!390508 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863732 (= lt!390508 (array!49675 (store (arr!23868 _values!688) i!612 (ValueCellFull!7938 v!557)) (size!24308 _values!688)))))

(declare-fun lt!390514 () ListLongMap!9921)

(assert (=> b!863732 (= lt!390514 (getCurrentListMapNoExtraKeys!2951 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863733 () Bool)

(declare-fun e!481187 () Bool)

(assert (=> b!863733 (= e!481187 true)))

(declare-fun lt!390516 () tuple2!11152)

(declare-fun lt!390511 () ListLongMap!9921)

(assert (=> b!863733 (= lt!390511 (+!2325 (+!2325 lt!390509 lt!390516) lt!390506))))

(declare-fun lt!390517 () V!27387)

(declare-fun lt!390507 () Unit!29530)

(declare-fun addCommutativeForDiffKeys!498 (ListLongMap!9921 (_ BitVec 64) V!27387 (_ BitVec 64) V!27387) Unit!29530)

(assert (=> b!863733 (= lt!390507 (addCommutativeForDiffKeys!498 lt!390509 k0!854 v!557 (select (arr!23867 _keys!868) from!1053) lt!390517))))

(declare-fun b!863734 () Bool)

(declare-fun res!586913 () Bool)

(assert (=> b!863734 (=> (not res!586913) (not e!481189))))

(assert (=> b!863734 (= res!586913 (and (= (size!24308 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24307 _keys!868) (size!24308 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863735 () Bool)

(declare-fun res!586921 () Bool)

(assert (=> b!863735 (=> (not res!586921) (not e!481189))))

(assert (=> b!863735 (= res!586921 (validKeyInArray!0 k0!854))))

(declare-fun b!863736 () Bool)

(declare-fun res!586919 () Bool)

(assert (=> b!863736 (=> (not res!586919) (not e!481189))))

(assert (=> b!863736 (= res!586919 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16955))))

(declare-fun mapIsEmpty!26732 () Bool)

(assert (=> mapIsEmpty!26732 mapRes!26732))

(declare-fun res!586916 () Bool)

(assert (=> start!73704 (=> (not res!586916) (not e!481189))))

(assert (=> start!73704 (= res!586916 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24307 _keys!868))))))

(assert (=> start!73704 e!481189))

(declare-fun tp_is_empty!16755 () Bool)

(assert (=> start!73704 tp_is_empty!16755))

(assert (=> start!73704 true))

(assert (=> start!73704 tp!51361))

(declare-fun array_inv!18878 (array!49672) Bool)

(assert (=> start!73704 (array_inv!18878 _keys!868)))

(declare-fun array_inv!18879 (array!49674) Bool)

(assert (=> start!73704 (and (array_inv!18879 _values!688) e!481186)))

(declare-fun b!863737 () Bool)

(declare-fun res!586914 () Bool)

(assert (=> b!863737 (=> (not res!586914) (not e!481189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863737 (= res!586914 (validMask!0 mask!1196))))

(declare-fun b!863738 () Bool)

(assert (=> b!863738 (= e!481188 tp_is_empty!16755)))

(declare-fun b!863739 () Bool)

(assert (=> b!863739 (= e!481182 tp_is_empty!16755)))

(declare-fun b!863740 () Bool)

(assert (=> b!863740 (= e!481183 e!481187)))

(declare-fun res!586918 () Bool)

(assert (=> b!863740 (=> res!586918 e!481187)))

(assert (=> b!863740 (= res!586918 (= k0!854 (select (arr!23867 _keys!868) from!1053)))))

(assert (=> b!863740 (not (= (select (arr!23867 _keys!868) from!1053) k0!854))))

(declare-fun lt!390505 () Unit!29530)

(assert (=> b!863740 (= lt!390505 e!481184)))

(declare-fun c!92149 () Bool)

(assert (=> b!863740 (= c!92149 (= (select (arr!23867 _keys!868) from!1053) k0!854))))

(assert (=> b!863740 (= lt!390513 lt!390511)))

(assert (=> b!863740 (= lt!390511 (+!2325 lt!390520 lt!390516))))

(assert (=> b!863740 (= lt!390516 (tuple2!11153 (select (arr!23867 _keys!868) from!1053) lt!390517))))

(declare-fun get!12603 (ValueCell!7938 V!27387) V!27387)

(declare-fun dynLambda!1153 (Int (_ BitVec 64)) V!27387)

(assert (=> b!863740 (= lt!390517 (get!12603 (select (arr!23868 _values!688) from!1053) (dynLambda!1153 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!73704 res!586916) b!863737))

(assert (= (and b!863737 res!586914) b!863734))

(assert (= (and b!863734 res!586913) b!863731))

(assert (= (and b!863731 res!586920) b!863736))

(assert (= (and b!863736 res!586919) b!863729))

(assert (= (and b!863729 res!586912) b!863735))

(assert (= (and b!863735 res!586921) b!863726))

(assert (= (and b!863726 res!586915) b!863732))

(assert (= (and b!863732 res!586917) b!863728))

(assert (= (and b!863728 (not res!586922)) b!863740))

(assert (= (and b!863740 c!92149) b!863725))

(assert (= (and b!863740 (not c!92149)) b!863730))

(assert (= (and b!863740 (not res!586918)) b!863733))

(assert (= (and b!863727 condMapEmpty!26732) mapIsEmpty!26732))

(assert (= (and b!863727 (not condMapEmpty!26732)) mapNonEmpty!26732))

(get-info :version)

(assert (= (and mapNonEmpty!26732 ((_ is ValueCellFull!7938) mapValue!26732)) b!863739))

(assert (= (and b!863727 ((_ is ValueCellFull!7938) mapDefault!26732)) b!863738))

(assert (= start!73704 b!863727))

(declare-fun b_lambda!11971 () Bool)

(assert (=> (not b_lambda!11971) (not b!863740)))

(declare-fun t!23842 () Bool)

(declare-fun tb!4741 () Bool)

(assert (=> (and start!73704 (= defaultEntry!696 defaultEntry!696) t!23842) tb!4741))

(declare-fun result!9093 () Bool)

(assert (=> tb!4741 (= result!9093 tp_is_empty!16755)))

(assert (=> b!863740 t!23842))

(declare-fun b_and!24219 () Bool)

(assert (= b_and!24217 (and (=> t!23842 result!9093) b_and!24219)))

(declare-fun m!804951 () Bool)

(assert (=> b!863732 m!804951))

(declare-fun m!804953 () Bool)

(assert (=> b!863732 m!804953))

(declare-fun m!804955 () Bool)

(assert (=> b!863732 m!804955))

(declare-fun m!804957 () Bool)

(assert (=> mapNonEmpty!26732 m!804957))

(declare-fun m!804959 () Bool)

(assert (=> b!863731 m!804959))

(declare-fun m!804961 () Bool)

(assert (=> b!863725 m!804961))

(declare-fun m!804963 () Bool)

(assert (=> b!863725 m!804963))

(declare-fun m!804965 () Bool)

(assert (=> b!863725 m!804965))

(declare-fun m!804967 () Bool)

(assert (=> b!863725 m!804967))

(declare-fun m!804969 () Bool)

(assert (=> b!863725 m!804969))

(declare-fun m!804971 () Bool)

(assert (=> b!863735 m!804971))

(declare-fun m!804973 () Bool)

(assert (=> start!73704 m!804973))

(declare-fun m!804975 () Bool)

(assert (=> start!73704 m!804975))

(declare-fun m!804977 () Bool)

(assert (=> b!863726 m!804977))

(declare-fun m!804979 () Bool)

(assert (=> b!863733 m!804979))

(assert (=> b!863733 m!804979))

(declare-fun m!804981 () Bool)

(assert (=> b!863733 m!804981))

(declare-fun m!804983 () Bool)

(assert (=> b!863733 m!804983))

(assert (=> b!863733 m!804983))

(declare-fun m!804985 () Bool)

(assert (=> b!863733 m!804985))

(declare-fun m!804987 () Bool)

(assert (=> b!863740 m!804987))

(declare-fun m!804989 () Bool)

(assert (=> b!863740 m!804989))

(declare-fun m!804991 () Bool)

(assert (=> b!863740 m!804991))

(declare-fun m!804993 () Bool)

(assert (=> b!863740 m!804993))

(assert (=> b!863740 m!804989))

(assert (=> b!863740 m!804983))

(assert (=> b!863740 m!804991))

(declare-fun m!804995 () Bool)

(assert (=> b!863736 m!804995))

(declare-fun m!804997 () Bool)

(assert (=> b!863737 m!804997))

(declare-fun m!804999 () Bool)

(assert (=> b!863728 m!804999))

(declare-fun m!805001 () Bool)

(assert (=> b!863728 m!805001))

(assert (=> b!863728 m!804983))

(declare-fun m!805003 () Bool)

(assert (=> b!863728 m!805003))

(declare-fun m!805005 () Bool)

(assert (=> b!863728 m!805005))

(declare-fun m!805007 () Bool)

(assert (=> b!863728 m!805007))

(assert (=> b!863728 m!804983))

(check-sat (not b!863737) (not b!863736) (not b!863733) (not b!863732) (not b!863735) (not mapNonEmpty!26732) (not b_lambda!11971) (not b!863740) (not b!863725) tp_is_empty!16755 (not b!863728) (not start!73704) b_and!24219 (not b!863731) (not b_next!14619))
(check-sat b_and!24219 (not b_next!14619))
