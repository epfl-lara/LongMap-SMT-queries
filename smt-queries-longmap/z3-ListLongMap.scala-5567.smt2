; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73168 () Bool)

(assert start!73168)

(declare-fun b_free!14101 () Bool)

(declare-fun b_next!14101 () Bool)

(assert (=> start!73168 (= b_free!14101 (not b_next!14101))))

(declare-fun tp!49807 () Bool)

(declare-fun b_and!23335 () Bool)

(assert (=> start!73168 (= tp!49807 b_and!23335)))

(declare-fun b!852289 () Bool)

(declare-fun res!578930 () Bool)

(declare-fun e!475326 () Bool)

(assert (=> b!852289 (=> (not res!578930) (not e!475326))))

(declare-datatypes ((array!48659 0))(
  ( (array!48660 (arr!23361 (Array (_ BitVec 32) (_ BitVec 64))) (size!23803 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48659)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48659 (_ BitVec 32)) Bool)

(assert (=> b!852289 (= res!578930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!26697 0))(
  ( (V!26698 (val!8166 Int)) )
))
(declare-datatypes ((tuple2!10742 0))(
  ( (tuple2!10743 (_1!5382 (_ BitVec 64)) (_2!5382 V!26697)) )
))
(declare-datatypes ((List!16569 0))(
  ( (Nil!16566) (Cons!16565 (h!17696 tuple2!10742) (t!23107 List!16569)) )
))
(declare-datatypes ((ListLongMap!9501 0))(
  ( (ListLongMap!9502 (toList!4766 List!16569)) )
))
(declare-fun call!38133 () ListLongMap!9501)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!38129 () Bool)

(declare-datatypes ((ValueCell!7679 0))(
  ( (ValueCellFull!7679 (v!10585 V!26697)) (EmptyCell!7679) )
))
(declare-datatypes ((array!48661 0))(
  ( (array!48662 (arr!23362 (Array (_ BitVec 32) ValueCell!7679)) (size!23804 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48661)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26697)

(declare-fun zeroValue!654 () V!26697)

(declare-fun getCurrentListMapNoExtraKeys!2774 (array!48659 array!48661 (_ BitVec 32) (_ BitVec 32) V!26697 V!26697 (_ BitVec 32) Int) ListLongMap!9501)

(assert (=> bm!38129 (= call!38133 (getCurrentListMapNoExtraKeys!2774 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852290 () Bool)

(declare-fun res!578935 () Bool)

(assert (=> b!852290 (=> (not res!578935) (not e!475326))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852290 (= res!578935 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23803 _keys!868))))))

(declare-fun res!578937 () Bool)

(assert (=> start!73168 (=> (not res!578937) (not e!475326))))

(assert (=> start!73168 (= res!578937 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23803 _keys!868))))))

(assert (=> start!73168 e!475326))

(declare-fun tp_is_empty!16237 () Bool)

(assert (=> start!73168 tp_is_empty!16237))

(assert (=> start!73168 true))

(assert (=> start!73168 tp!49807))

(declare-fun array_inv!18608 (array!48659) Bool)

(assert (=> start!73168 (array_inv!18608 _keys!868)))

(declare-fun e!475332 () Bool)

(declare-fun array_inv!18609 (array!48661) Bool)

(assert (=> start!73168 (and (array_inv!18609 _values!688) e!475332)))

(declare-fun mapIsEmpty!25955 () Bool)

(declare-fun mapRes!25955 () Bool)

(assert (=> mapIsEmpty!25955 mapRes!25955))

(declare-fun b!852291 () Bool)

(declare-fun e!475325 () Bool)

(assert (=> b!852291 (= e!475332 (and e!475325 mapRes!25955))))

(declare-fun condMapEmpty!25955 () Bool)

(declare-fun mapDefault!25955 () ValueCell!7679)

(assert (=> b!852291 (= condMapEmpty!25955 (= (arr!23362 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7679)) mapDefault!25955)))))

(declare-fun mapNonEmpty!25955 () Bool)

(declare-fun tp!49808 () Bool)

(declare-fun e!475328 () Bool)

(assert (=> mapNonEmpty!25955 (= mapRes!25955 (and tp!49808 e!475328))))

(declare-fun mapKey!25955 () (_ BitVec 32))

(declare-fun mapValue!25955 () ValueCell!7679)

(declare-fun mapRest!25955 () (Array (_ BitVec 32) ValueCell!7679))

(assert (=> mapNonEmpty!25955 (= (arr!23362 _values!688) (store mapRest!25955 mapKey!25955 mapValue!25955))))

(declare-fun b!852292 () Bool)

(assert (=> b!852292 (= e!475325 tp_is_empty!16237)))

(declare-fun b!852293 () Bool)

(assert (=> b!852293 (= e!475328 tp_is_empty!16237)))

(declare-fun b!852294 () Bool)

(declare-fun e!475331 () Bool)

(declare-fun e!475330 () Bool)

(assert (=> b!852294 (= e!475331 (not e!475330))))

(declare-fun res!578928 () Bool)

(assert (=> b!852294 (=> res!578928 e!475330)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852294 (= res!578928 (not (validKeyInArray!0 (select (arr!23361 _keys!868) from!1053))))))

(declare-fun e!475327 () Bool)

(assert (=> b!852294 e!475327))

(declare-fun c!91757 () Bool)

(assert (=> b!852294 (= c!91757 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26697)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29035 0))(
  ( (Unit!29036) )
))
(declare-fun lt!383919 () Unit!29035)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!385 (array!48659 array!48661 (_ BitVec 32) (_ BitVec 32) V!26697 V!26697 (_ BitVec 32) (_ BitVec 64) V!26697 (_ BitVec 32) Int) Unit!29035)

(assert (=> b!852294 (= lt!383919 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!385 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852295 () Bool)

(assert (=> b!852295 (= e!475326 e!475331)))

(declare-fun res!578933 () Bool)

(assert (=> b!852295 (=> (not res!578933) (not e!475331))))

(assert (=> b!852295 (= res!578933 (= from!1053 i!612))))

(declare-fun lt!383921 () array!48661)

(declare-fun lt!383927 () ListLongMap!9501)

(assert (=> b!852295 (= lt!383927 (getCurrentListMapNoExtraKeys!2774 _keys!868 lt!383921 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852295 (= lt!383921 (array!48662 (store (arr!23362 _values!688) i!612 (ValueCellFull!7679 v!557)) (size!23804 _values!688)))))

(declare-fun lt!383925 () ListLongMap!9501)

(assert (=> b!852295 (= lt!383925 (getCurrentListMapNoExtraKeys!2774 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852296 () Bool)

(declare-fun res!578932 () Bool)

(assert (=> b!852296 (=> (not res!578932) (not e!475326))))

(assert (=> b!852296 (= res!578932 (and (= (size!23804 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23803 _keys!868) (size!23804 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852297 () Bool)

(declare-fun res!578934 () Bool)

(assert (=> b!852297 (=> (not res!578934) (not e!475326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852297 (= res!578934 (validMask!0 mask!1196))))

(declare-fun bm!38130 () Bool)

(declare-fun call!38132 () ListLongMap!9501)

(assert (=> bm!38130 (= call!38132 (getCurrentListMapNoExtraKeys!2774 _keys!868 lt!383921 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852298 () Bool)

(declare-fun res!578936 () Bool)

(assert (=> b!852298 (=> (not res!578936) (not e!475326))))

(assert (=> b!852298 (= res!578936 (validKeyInArray!0 k0!854))))

(declare-fun b!852299 () Bool)

(declare-fun res!578931 () Bool)

(assert (=> b!852299 (=> (not res!578931) (not e!475326))))

(assert (=> b!852299 (= res!578931 (and (= (select (arr!23361 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852300 () Bool)

(assert (=> b!852300 (= e!475327 (= call!38132 call!38133))))

(declare-fun b!852301 () Bool)

(assert (=> b!852301 (= e!475330 true)))

(declare-fun lt!383923 () V!26697)

(declare-fun lt!383920 () ListLongMap!9501)

(declare-fun lt!383924 () tuple2!10742)

(declare-fun +!2182 (ListLongMap!9501 tuple2!10742) ListLongMap!9501)

(assert (=> b!852301 (= (+!2182 lt!383920 lt!383924) (+!2182 (+!2182 lt!383920 (tuple2!10743 k0!854 lt!383923)) lt!383924))))

(declare-fun lt!383926 () V!26697)

(assert (=> b!852301 (= lt!383924 (tuple2!10743 k0!854 lt!383926))))

(declare-fun lt!383922 () Unit!29035)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!293 (ListLongMap!9501 (_ BitVec 64) V!26697 V!26697) Unit!29035)

(assert (=> b!852301 (= lt!383922 (addSameAsAddTwiceSameKeyDiffValues!293 lt!383920 k0!854 lt!383923 lt!383926))))

(declare-fun lt!383918 () V!26697)

(declare-fun get!12324 (ValueCell!7679 V!26697) V!26697)

(assert (=> b!852301 (= lt!383923 (get!12324 (select (arr!23362 _values!688) from!1053) lt!383918))))

(assert (=> b!852301 (= lt!383927 (+!2182 lt!383920 (tuple2!10743 (select (arr!23361 _keys!868) from!1053) lt!383926)))))

(assert (=> b!852301 (= lt!383926 (get!12324 (select (store (arr!23362 _values!688) i!612 (ValueCellFull!7679 v!557)) from!1053) lt!383918))))

(declare-fun dynLambda!1043 (Int (_ BitVec 64)) V!26697)

(assert (=> b!852301 (= lt!383918 (dynLambda!1043 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852301 (= lt!383920 (getCurrentListMapNoExtraKeys!2774 _keys!868 lt!383921 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852302 () Bool)

(declare-fun res!578929 () Bool)

(assert (=> b!852302 (=> (not res!578929) (not e!475326))))

(declare-datatypes ((List!16570 0))(
  ( (Nil!16567) (Cons!16566 (h!17697 (_ BitVec 64)) (t!23108 List!16570)) )
))
(declare-fun arrayNoDuplicates!0 (array!48659 (_ BitVec 32) List!16570) Bool)

(assert (=> b!852302 (= res!578929 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16567))))

(declare-fun b!852303 () Bool)

(assert (=> b!852303 (= e!475327 (= call!38132 (+!2182 call!38133 (tuple2!10743 k0!854 v!557))))))

(assert (= (and start!73168 res!578937) b!852297))

(assert (= (and b!852297 res!578934) b!852296))

(assert (= (and b!852296 res!578932) b!852289))

(assert (= (and b!852289 res!578930) b!852302))

(assert (= (and b!852302 res!578929) b!852290))

(assert (= (and b!852290 res!578935) b!852298))

(assert (= (and b!852298 res!578936) b!852299))

(assert (= (and b!852299 res!578931) b!852295))

(assert (= (and b!852295 res!578933) b!852294))

(assert (= (and b!852294 c!91757) b!852303))

(assert (= (and b!852294 (not c!91757)) b!852300))

(assert (= (or b!852303 b!852300) bm!38130))

(assert (= (or b!852303 b!852300) bm!38129))

(assert (= (and b!852294 (not res!578928)) b!852301))

(assert (= (and b!852291 condMapEmpty!25955) mapIsEmpty!25955))

(assert (= (and b!852291 (not condMapEmpty!25955)) mapNonEmpty!25955))

(get-info :version)

(assert (= (and mapNonEmpty!25955 ((_ is ValueCellFull!7679) mapValue!25955)) b!852293))

(assert (= (and b!852291 ((_ is ValueCellFull!7679) mapDefault!25955)) b!852292))

(assert (= start!73168 b!852291))

(declare-fun b_lambda!11615 () Bool)

(assert (=> (not b_lambda!11615) (not b!852301)))

(declare-fun t!23106 () Bool)

(declare-fun tb!4395 () Bool)

(assert (=> (and start!73168 (= defaultEntry!696 defaultEntry!696) t!23106) tb!4395))

(declare-fun result!8409 () Bool)

(assert (=> tb!4395 (= result!8409 tp_is_empty!16237)))

(assert (=> b!852301 t!23106))

(declare-fun b_and!23337 () Bool)

(assert (= b_and!23335 (and (=> t!23106 result!8409) b_and!23337)))

(declare-fun m!792847 () Bool)

(assert (=> b!852289 m!792847))

(declare-fun m!792849 () Bool)

(assert (=> b!852299 m!792849))

(declare-fun m!792851 () Bool)

(assert (=> b!852303 m!792851))

(declare-fun m!792853 () Bool)

(assert (=> b!852302 m!792853))

(declare-fun m!792855 () Bool)

(assert (=> mapNonEmpty!25955 m!792855))

(declare-fun m!792857 () Bool)

(assert (=> b!852295 m!792857))

(declare-fun m!792859 () Bool)

(assert (=> b!852295 m!792859))

(declare-fun m!792861 () Bool)

(assert (=> b!852295 m!792861))

(declare-fun m!792863 () Bool)

(assert (=> b!852297 m!792863))

(declare-fun m!792865 () Bool)

(assert (=> b!852298 m!792865))

(declare-fun m!792867 () Bool)

(assert (=> bm!38130 m!792867))

(declare-fun m!792869 () Bool)

(assert (=> start!73168 m!792869))

(declare-fun m!792871 () Bool)

(assert (=> start!73168 m!792871))

(declare-fun m!792873 () Bool)

(assert (=> b!852301 m!792873))

(declare-fun m!792875 () Bool)

(assert (=> b!852301 m!792875))

(assert (=> b!852301 m!792867))

(declare-fun m!792877 () Bool)

(assert (=> b!852301 m!792877))

(declare-fun m!792879 () Bool)

(assert (=> b!852301 m!792879))

(assert (=> b!852301 m!792859))

(declare-fun m!792881 () Bool)

(assert (=> b!852301 m!792881))

(declare-fun m!792883 () Bool)

(assert (=> b!852301 m!792883))

(declare-fun m!792885 () Bool)

(assert (=> b!852301 m!792885))

(declare-fun m!792887 () Bool)

(assert (=> b!852301 m!792887))

(declare-fun m!792889 () Bool)

(assert (=> b!852301 m!792889))

(declare-fun m!792891 () Bool)

(assert (=> b!852301 m!792891))

(assert (=> b!852301 m!792875))

(declare-fun m!792893 () Bool)

(assert (=> b!852301 m!792893))

(assert (=> b!852301 m!792877))

(assert (=> b!852301 m!792889))

(assert (=> b!852294 m!792885))

(assert (=> b!852294 m!792885))

(declare-fun m!792895 () Bool)

(assert (=> b!852294 m!792895))

(declare-fun m!792897 () Bool)

(assert (=> b!852294 m!792897))

(declare-fun m!792899 () Bool)

(assert (=> bm!38129 m!792899))

(check-sat (not b!852298) (not b_next!14101) (not bm!38129) (not b!852297) b_and!23337 (not start!73168) (not b!852302) (not bm!38130) (not mapNonEmpty!25955) (not b!852294) (not b!852289) (not b!852303) tp_is_empty!16237 (not b!852301) (not b_lambda!11615) (not b!852295))
(check-sat b_and!23337 (not b_next!14101))
