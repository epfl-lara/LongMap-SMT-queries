; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73750 () Bool)

(assert start!73750)

(declare-fun b_free!14683 () Bool)

(declare-fun b_next!14683 () Bool)

(assert (=> start!73750 (= b_free!14683 (not b_next!14683))))

(declare-fun tp!51554 () Bool)

(declare-fun b_and!24319 () Bool)

(assert (=> start!73750 (= tp!51554 b_and!24319)))

(declare-fun b!865086 () Bool)

(declare-fun e!481905 () Bool)

(declare-fun tp_is_empty!16819 () Bool)

(assert (=> b!865086 (= e!481905 tp_is_empty!16819)))

(declare-fun b!865088 () Bool)

(declare-datatypes ((Unit!29558 0))(
  ( (Unit!29559) )
))
(declare-fun e!481899 () Unit!29558)

(declare-fun Unit!29560 () Unit!29558)

(assert (=> b!865088 (= e!481899 Unit!29560)))

(declare-fun lt!391807 () Unit!29558)

(declare-datatypes ((array!49791 0))(
  ( (array!49792 (arr!23927 (Array (_ BitVec 32) (_ BitVec 64))) (size!24369 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49791)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49791 (_ BitVec 32) (_ BitVec 32)) Unit!29558)

(assert (=> b!865088 (= lt!391807 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17015 0))(
  ( (Nil!17012) (Cons!17011 (h!18142 (_ BitVec 64)) (t!23955 List!17015)) )
))
(declare-fun arrayNoDuplicates!0 (array!49791 (_ BitVec 32) List!17015) Bool)

(assert (=> b!865088 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17012)))

(declare-fun lt!391806 () Unit!29558)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49791 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29558)

(assert (=> b!865088 (= lt!391806 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865088 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391816 () Unit!29558)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49791 (_ BitVec 64) (_ BitVec 32) List!17015) Unit!29558)

(assert (=> b!865088 (= lt!391816 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17012))))

(assert (=> b!865088 false))

(declare-fun b!865089 () Bool)

(declare-fun res!587859 () Bool)

(declare-fun e!481897 () Bool)

(assert (=> b!865089 (=> (not res!587859) (not e!481897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865089 (= res!587859 (validKeyInArray!0 k0!854))))

(declare-fun b!865090 () Bool)

(declare-fun res!587863 () Bool)

(assert (=> b!865090 (=> (not res!587863) (not e!481897))))

(assert (=> b!865090 (= res!587863 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24369 _keys!868))))))

(declare-fun b!865091 () Bool)

(declare-fun e!481900 () Bool)

(declare-fun e!481902 () Bool)

(declare-fun mapRes!26828 () Bool)

(assert (=> b!865091 (= e!481900 (and e!481902 mapRes!26828))))

(declare-fun condMapEmpty!26828 () Bool)

(declare-datatypes ((V!27473 0))(
  ( (V!27474 (val!8457 Int)) )
))
(declare-datatypes ((ValueCell!7970 0))(
  ( (ValueCellFull!7970 (v!10876 V!27473)) (EmptyCell!7970) )
))
(declare-datatypes ((array!49793 0))(
  ( (array!49794 (arr!23928 (Array (_ BitVec 32) ValueCell!7970)) (size!24370 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49793)

(declare-fun mapDefault!26828 () ValueCell!7970)

(assert (=> b!865091 (= condMapEmpty!26828 (= (arr!23928 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7970)) mapDefault!26828)))))

(declare-fun b!865092 () Bool)

(declare-fun e!481904 () Bool)

(assert (=> b!865092 (= e!481897 e!481904)))

(declare-fun res!587862 () Bool)

(assert (=> b!865092 (=> (not res!587862) (not e!481904))))

(assert (=> b!865092 (= res!587862 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!391815 () array!49793)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11224 0))(
  ( (tuple2!11225 (_1!5623 (_ BitVec 64)) (_2!5623 V!27473)) )
))
(declare-datatypes ((List!17016 0))(
  ( (Nil!17013) (Cons!17012 (h!18143 tuple2!11224) (t!23956 List!17016)) )
))
(declare-datatypes ((ListLongMap!9983 0))(
  ( (ListLongMap!9984 (toList!5007 List!17016)) )
))
(declare-fun lt!391805 () ListLongMap!9983)

(declare-fun minValue!654 () V!27473)

(declare-fun zeroValue!654 () V!27473)

(declare-fun getCurrentListMapNoExtraKeys!3004 (array!49791 array!49793 (_ BitVec 32) (_ BitVec 32) V!27473 V!27473 (_ BitVec 32) Int) ListLongMap!9983)

(assert (=> b!865092 (= lt!391805 (getCurrentListMapNoExtraKeys!3004 _keys!868 lt!391815 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27473)

(assert (=> b!865092 (= lt!391815 (array!49794 (store (arr!23928 _values!688) i!612 (ValueCellFull!7970 v!557)) (size!24370 _values!688)))))

(declare-fun lt!391808 () ListLongMap!9983)

(assert (=> b!865092 (= lt!391808 (getCurrentListMapNoExtraKeys!3004 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865093 () Bool)

(assert (=> b!865093 (= e!481902 tp_is_empty!16819)))

(declare-fun b!865094 () Bool)

(declare-fun res!587866 () Bool)

(assert (=> b!865094 (=> (not res!587866) (not e!481897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865094 (= res!587866 (validMask!0 mask!1196))))

(declare-fun b!865095 () Bool)

(declare-fun res!587868 () Bool)

(assert (=> b!865095 (=> (not res!587868) (not e!481897))))

(assert (=> b!865095 (= res!587868 (and (= (select (arr!23927 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865087 () Bool)

(declare-fun e!481901 () Bool)

(assert (=> b!865087 (= e!481904 (not e!481901))))

(declare-fun res!587865 () Bool)

(assert (=> b!865087 (=> res!587865 e!481901)))

(assert (=> b!865087 (= res!587865 (not (validKeyInArray!0 (select (arr!23927 _keys!868) from!1053))))))

(declare-fun lt!391819 () ListLongMap!9983)

(declare-fun lt!391813 () ListLongMap!9983)

(assert (=> b!865087 (= lt!391819 lt!391813)))

(declare-fun lt!391812 () ListLongMap!9983)

(declare-fun lt!391820 () tuple2!11224)

(declare-fun +!2375 (ListLongMap!9983 tuple2!11224) ListLongMap!9983)

(assert (=> b!865087 (= lt!391813 (+!2375 lt!391812 lt!391820))))

(assert (=> b!865087 (= lt!391819 (getCurrentListMapNoExtraKeys!3004 _keys!868 lt!391815 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865087 (= lt!391820 (tuple2!11225 k0!854 v!557))))

(assert (=> b!865087 (= lt!391812 (getCurrentListMapNoExtraKeys!3004 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391814 () Unit!29558)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!550 (array!49791 array!49793 (_ BitVec 32) (_ BitVec 32) V!27473 V!27473 (_ BitVec 32) (_ BitVec 64) V!27473 (_ BitVec 32) Int) Unit!29558)

(assert (=> b!865087 (= lt!391814 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!550 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!587864 () Bool)

(assert (=> start!73750 (=> (not res!587864) (not e!481897))))

(assert (=> start!73750 (= res!587864 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24369 _keys!868))))))

(assert (=> start!73750 e!481897))

(assert (=> start!73750 tp_is_empty!16819))

(assert (=> start!73750 true))

(assert (=> start!73750 tp!51554))

(declare-fun array_inv!18992 (array!49791) Bool)

(assert (=> start!73750 (array_inv!18992 _keys!868)))

(declare-fun array_inv!18993 (array!49793) Bool)

(assert (=> start!73750 (and (array_inv!18993 _values!688) e!481900)))

(declare-fun mapNonEmpty!26828 () Bool)

(declare-fun tp!51553 () Bool)

(assert (=> mapNonEmpty!26828 (= mapRes!26828 (and tp!51553 e!481905))))

(declare-fun mapValue!26828 () ValueCell!7970)

(declare-fun mapKey!26828 () (_ BitVec 32))

(declare-fun mapRest!26828 () (Array (_ BitVec 32) ValueCell!7970))

(assert (=> mapNonEmpty!26828 (= (arr!23928 _values!688) (store mapRest!26828 mapKey!26828 mapValue!26828))))

(declare-fun b!865096 () Bool)

(declare-fun e!481898 () Bool)

(assert (=> b!865096 (= e!481898 true)))

(declare-fun lt!391818 () tuple2!11224)

(declare-fun lt!391810 () ListLongMap!9983)

(assert (=> b!865096 (= lt!391810 (+!2375 (+!2375 lt!391812 lt!391818) lt!391820))))

(declare-fun lt!391817 () Unit!29558)

(declare-fun lt!391809 () V!27473)

(declare-fun addCommutativeForDiffKeys!517 (ListLongMap!9983 (_ BitVec 64) V!27473 (_ BitVec 64) V!27473) Unit!29558)

(assert (=> b!865096 (= lt!391817 (addCommutativeForDiffKeys!517 lt!391812 k0!854 v!557 (select (arr!23927 _keys!868) from!1053) lt!391809))))

(declare-fun mapIsEmpty!26828 () Bool)

(assert (=> mapIsEmpty!26828 mapRes!26828))

(declare-fun b!865097 () Bool)

(declare-fun res!587861 () Bool)

(assert (=> b!865097 (=> (not res!587861) (not e!481897))))

(assert (=> b!865097 (= res!587861 (and (= (size!24370 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24369 _keys!868) (size!24370 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865098 () Bool)

(assert (=> b!865098 (= e!481901 e!481898)))

(declare-fun res!587860 () Bool)

(assert (=> b!865098 (=> res!587860 e!481898)))

(assert (=> b!865098 (= res!587860 (= k0!854 (select (arr!23927 _keys!868) from!1053)))))

(assert (=> b!865098 (not (= (select (arr!23927 _keys!868) from!1053) k0!854))))

(declare-fun lt!391811 () Unit!29558)

(assert (=> b!865098 (= lt!391811 e!481899)))

(declare-fun c!92180 () Bool)

(assert (=> b!865098 (= c!92180 (= (select (arr!23927 _keys!868) from!1053) k0!854))))

(assert (=> b!865098 (= lt!391805 lt!391810)))

(assert (=> b!865098 (= lt!391810 (+!2375 lt!391813 lt!391818))))

(assert (=> b!865098 (= lt!391818 (tuple2!11225 (select (arr!23927 _keys!868) from!1053) lt!391809))))

(declare-fun get!12649 (ValueCell!7970 V!27473) V!27473)

(declare-fun dynLambda!1174 (Int (_ BitVec 64)) V!27473)

(assert (=> b!865098 (= lt!391809 (get!12649 (select (arr!23928 _values!688) from!1053) (dynLambda!1174 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865099 () Bool)

(declare-fun Unit!29561 () Unit!29558)

(assert (=> b!865099 (= e!481899 Unit!29561)))

(declare-fun b!865100 () Bool)

(declare-fun res!587858 () Bool)

(assert (=> b!865100 (=> (not res!587858) (not e!481897))))

(assert (=> b!865100 (= res!587858 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17012))))

(declare-fun b!865101 () Bool)

(declare-fun res!587867 () Bool)

(assert (=> b!865101 (=> (not res!587867) (not e!481897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49791 (_ BitVec 32)) Bool)

(assert (=> b!865101 (= res!587867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73750 res!587864) b!865094))

(assert (= (and b!865094 res!587866) b!865097))

(assert (= (and b!865097 res!587861) b!865101))

(assert (= (and b!865101 res!587867) b!865100))

(assert (= (and b!865100 res!587858) b!865090))

(assert (= (and b!865090 res!587863) b!865089))

(assert (= (and b!865089 res!587859) b!865095))

(assert (= (and b!865095 res!587868) b!865092))

(assert (= (and b!865092 res!587862) b!865087))

(assert (= (and b!865087 (not res!587865)) b!865098))

(assert (= (and b!865098 c!92180) b!865088))

(assert (= (and b!865098 (not c!92180)) b!865099))

(assert (= (and b!865098 (not res!587860)) b!865096))

(assert (= (and b!865091 condMapEmpty!26828) mapIsEmpty!26828))

(assert (= (and b!865091 (not condMapEmpty!26828)) mapNonEmpty!26828))

(get-info :version)

(assert (= (and mapNonEmpty!26828 ((_ is ValueCellFull!7970) mapValue!26828)) b!865086))

(assert (= (and b!865091 ((_ is ValueCellFull!7970) mapDefault!26828)) b!865093))

(assert (= start!73750 b!865091))

(declare-fun b_lambda!12017 () Bool)

(assert (=> (not b_lambda!12017) (not b!865098)))

(declare-fun t!23954 () Bool)

(declare-fun tb!4797 () Bool)

(assert (=> (and start!73750 (= defaultEntry!696 defaultEntry!696) t!23954) tb!4797))

(declare-fun result!9213 () Bool)

(assert (=> tb!4797 (= result!9213 tp_is_empty!16819)))

(assert (=> b!865098 t!23954))

(declare-fun b_and!24321 () Bool)

(assert (= b_and!24319 (and (=> t!23954 result!9213) b_and!24321)))

(declare-fun m!806049 () Bool)

(assert (=> b!865087 m!806049))

(declare-fun m!806051 () Bool)

(assert (=> b!865087 m!806051))

(declare-fun m!806053 () Bool)

(assert (=> b!865087 m!806053))

(declare-fun m!806055 () Bool)

(assert (=> b!865087 m!806055))

(assert (=> b!865087 m!806053))

(declare-fun m!806057 () Bool)

(assert (=> b!865087 m!806057))

(declare-fun m!806059 () Bool)

(assert (=> b!865087 m!806059))

(declare-fun m!806061 () Bool)

(assert (=> b!865094 m!806061))

(declare-fun m!806063 () Bool)

(assert (=> b!865098 m!806063))

(declare-fun m!806065 () Bool)

(assert (=> b!865098 m!806065))

(declare-fun m!806067 () Bool)

(assert (=> b!865098 m!806067))

(declare-fun m!806069 () Bool)

(assert (=> b!865098 m!806069))

(assert (=> b!865098 m!806065))

(assert (=> b!865098 m!806053))

(assert (=> b!865098 m!806067))

(declare-fun m!806071 () Bool)

(assert (=> b!865088 m!806071))

(declare-fun m!806073 () Bool)

(assert (=> b!865088 m!806073))

(declare-fun m!806075 () Bool)

(assert (=> b!865088 m!806075))

(declare-fun m!806077 () Bool)

(assert (=> b!865088 m!806077))

(declare-fun m!806079 () Bool)

(assert (=> b!865088 m!806079))

(declare-fun m!806081 () Bool)

(assert (=> start!73750 m!806081))

(declare-fun m!806083 () Bool)

(assert (=> start!73750 m!806083))

(declare-fun m!806085 () Bool)

(assert (=> b!865101 m!806085))

(declare-fun m!806087 () Bool)

(assert (=> mapNonEmpty!26828 m!806087))

(declare-fun m!806089 () Bool)

(assert (=> b!865096 m!806089))

(assert (=> b!865096 m!806089))

(declare-fun m!806091 () Bool)

(assert (=> b!865096 m!806091))

(assert (=> b!865096 m!806053))

(assert (=> b!865096 m!806053))

(declare-fun m!806093 () Bool)

(assert (=> b!865096 m!806093))

(declare-fun m!806095 () Bool)

(assert (=> b!865089 m!806095))

(declare-fun m!806097 () Bool)

(assert (=> b!865100 m!806097))

(declare-fun m!806099 () Bool)

(assert (=> b!865095 m!806099))

(declare-fun m!806101 () Bool)

(assert (=> b!865092 m!806101))

(declare-fun m!806103 () Bool)

(assert (=> b!865092 m!806103))

(declare-fun m!806105 () Bool)

(assert (=> b!865092 m!806105))

(check-sat (not b!865094) (not b_lambda!12017) (not start!73750) (not mapNonEmpty!26828) b_and!24321 (not b!865088) (not b!865089) (not b!865100) (not b!865087) (not b!865096) (not b!865098) (not b!865101) (not b!865092) tp_is_empty!16819 (not b_next!14683))
(check-sat b_and!24321 (not b_next!14683))
