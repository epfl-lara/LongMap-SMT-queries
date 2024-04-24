; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74902 () Bool)

(assert start!74902)

(declare-fun b_free!15361 () Bool)

(declare-fun b_next!15361 () Bool)

(assert (=> start!74902 (= b_free!15361 (not b_next!15361))))

(declare-fun tp!53775 () Bool)

(declare-fun b_and!25367 () Bool)

(assert (=> start!74902 (= tp!53775 b_and!25367)))

(declare-fun b!881994 () Bool)

(declare-fun res!598965 () Bool)

(declare-fun e!490911 () Bool)

(assert (=> b!881994 (=> (not res!598965) (not e!490911))))

(declare-datatypes ((array!51373 0))(
  ( (array!51374 (arr!24705 (Array (_ BitVec 32) (_ BitVec 64))) (size!25146 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51373)

(declare-datatypes ((List!17483 0))(
  ( (Nil!17480) (Cons!17479 (h!18616 (_ BitVec 64)) (t!24638 List!17483)) )
))
(declare-fun arrayNoDuplicates!0 (array!51373 (_ BitVec 32) List!17483) Bool)

(assert (=> b!881994 (= res!598965 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17480))))

(declare-fun mapIsEmpty!28032 () Bool)

(declare-fun mapRes!28032 () Bool)

(assert (=> mapIsEmpty!28032 mapRes!28032))

(declare-fun b!881995 () Bool)

(declare-fun e!490907 () Bool)

(declare-fun tp_is_empty!17605 () Bool)

(assert (=> b!881995 (= e!490907 tp_is_empty!17605)))

(declare-fun b!881996 () Bool)

(declare-fun res!598963 () Bool)

(assert (=> b!881996 (=> (not res!598963) (not e!490911))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881996 (= res!598963 (and (= (select (arr!24705 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!28032 () Bool)

(declare-fun tp!53774 () Bool)

(declare-fun e!490909 () Bool)

(assert (=> mapNonEmpty!28032 (= mapRes!28032 (and tp!53774 e!490909))))

(declare-datatypes ((V!28521 0))(
  ( (V!28522 (val!8850 Int)) )
))
(declare-datatypes ((ValueCell!8363 0))(
  ( (ValueCellFull!8363 (v!11302 V!28521)) (EmptyCell!8363) )
))
(declare-fun mapRest!28032 () (Array (_ BitVec 32) ValueCell!8363))

(declare-fun mapKey!28032 () (_ BitVec 32))

(declare-fun mapValue!28032 () ValueCell!8363)

(declare-datatypes ((array!51375 0))(
  ( (array!51376 (arr!24706 (Array (_ BitVec 32) ValueCell!8363)) (size!25147 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51375)

(assert (=> mapNonEmpty!28032 (= (arr!24706 _values!688) (store mapRest!28032 mapKey!28032 mapValue!28032))))

(declare-fun b!881997 () Bool)

(declare-fun res!598969 () Bool)

(assert (=> b!881997 (=> (not res!598969) (not e!490911))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51373 (_ BitVec 32)) Bool)

(assert (=> b!881997 (= res!598969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!598968 () Bool)

(assert (=> start!74902 (=> (not res!598968) (not e!490911))))

(assert (=> start!74902 (= res!598968 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25146 _keys!868))))))

(assert (=> start!74902 e!490911))

(assert (=> start!74902 tp_is_empty!17605))

(assert (=> start!74902 true))

(assert (=> start!74902 tp!53775))

(declare-fun array_inv!19500 (array!51373) Bool)

(assert (=> start!74902 (array_inv!19500 _keys!868)))

(declare-fun e!490913 () Bool)

(declare-fun array_inv!19501 (array!51375) Bool)

(assert (=> start!74902 (and (array_inv!19501 _values!688) e!490913)))

(declare-fun b!881998 () Bool)

(declare-fun res!598959 () Bool)

(assert (=> b!881998 (=> (not res!598959) (not e!490911))))

(assert (=> b!881998 (= res!598959 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25146 _keys!868))))))

(declare-fun b!881999 () Bool)

(declare-fun e!490908 () Bool)

(declare-fun e!490906 () Bool)

(assert (=> b!881999 (= e!490908 e!490906)))

(declare-fun res!598961 () Bool)

(assert (=> b!881999 (=> res!598961 e!490906)))

(assert (=> b!881999 (= res!598961 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsge (size!25146 _keys!868) #b01111111111111111111111111111111)))))

(assert (=> b!881999 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17480)))

(declare-datatypes ((Unit!30052 0))(
  ( (Unit!30053) )
))
(declare-fun lt!398835 () Unit!30052)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51373 (_ BitVec 32) (_ BitVec 32)) Unit!30052)

(assert (=> b!881999 (= lt!398835 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882000 () Bool)

(declare-fun res!598958 () Bool)

(assert (=> b!882000 (=> (not res!598958) (not e!490911))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!882000 (= res!598958 (and (= (size!25147 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25146 _keys!868) (size!25147 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882001 () Bool)

(assert (=> b!882001 (= e!490909 tp_is_empty!17605)))

(declare-fun b!882002 () Bool)

(declare-fun e!490905 () Bool)

(declare-fun e!490910 () Bool)

(assert (=> b!882002 (= e!490905 (not e!490910))))

(declare-fun res!598962 () Bool)

(assert (=> b!882002 (=> res!598962 e!490910)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882002 (= res!598962 (not (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11654 0))(
  ( (tuple2!11655 (_1!5838 (_ BitVec 64)) (_2!5838 V!28521)) )
))
(declare-datatypes ((List!17484 0))(
  ( (Nil!17481) (Cons!17480 (h!18617 tuple2!11654) (t!24639 List!17484)) )
))
(declare-datatypes ((ListLongMap!10425 0))(
  ( (ListLongMap!10426 (toList!5228 List!17484)) )
))
(declare-fun lt!398836 () ListLongMap!10425)

(declare-fun lt!398841 () ListLongMap!10425)

(assert (=> b!882002 (= lt!398836 lt!398841)))

(declare-fun lt!398839 () ListLongMap!10425)

(declare-fun v!557 () V!28521)

(declare-fun +!2543 (ListLongMap!10425 tuple2!11654) ListLongMap!10425)

(assert (=> b!882002 (= lt!398841 (+!2543 lt!398839 (tuple2!11655 k0!854 v!557)))))

(declare-fun lt!398838 () array!51375)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28521)

(declare-fun zeroValue!654 () V!28521)

(declare-fun getCurrentListMapNoExtraKeys!3268 (array!51373 array!51375 (_ BitVec 32) (_ BitVec 32) V!28521 V!28521 (_ BitVec 32) Int) ListLongMap!10425)

(assert (=> b!882002 (= lt!398836 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882002 (= lt!398839 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398837 () Unit!30052)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!708 (array!51373 array!51375 (_ BitVec 32) (_ BitVec 32) V!28521 V!28521 (_ BitVec 32) (_ BitVec 64) V!28521 (_ BitVec 32) Int) Unit!30052)

(assert (=> b!882002 (= lt!398837 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882003 () Bool)

(declare-fun res!598964 () Bool)

(assert (=> b!882003 (=> (not res!598964) (not e!490911))))

(assert (=> b!882003 (= res!598964 (validKeyInArray!0 k0!854))))

(declare-fun b!882004 () Bool)

(assert (=> b!882004 (= e!490913 (and e!490907 mapRes!28032))))

(declare-fun condMapEmpty!28032 () Bool)

(declare-fun mapDefault!28032 () ValueCell!8363)

(assert (=> b!882004 (= condMapEmpty!28032 (= (arr!24706 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8363)) mapDefault!28032)))))

(declare-fun b!882005 () Bool)

(assert (=> b!882005 (= e!490911 e!490905)))

(declare-fun res!598960 () Bool)

(assert (=> b!882005 (=> (not res!598960) (not e!490905))))

(assert (=> b!882005 (= res!598960 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398842 () ListLongMap!10425)

(assert (=> b!882005 (= lt!398842 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!882005 (= lt!398838 (array!51376 (store (arr!24706 _values!688) i!612 (ValueCellFull!8363 v!557)) (size!25147 _values!688)))))

(declare-fun lt!398840 () ListLongMap!10425)

(assert (=> b!882005 (= lt!398840 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882006 () Bool)

(declare-fun arrayContainsKey!0 (array!51373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882006 (= e!490906 (arrayContainsKey!0 _keys!868 k0!854 i!612))))

(declare-fun b!882007 () Bool)

(declare-fun res!598967 () Bool)

(assert (=> b!882007 (=> (not res!598967) (not e!490911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882007 (= res!598967 (validMask!0 mask!1196))))

(declare-fun b!882008 () Bool)

(assert (=> b!882008 (= e!490910 e!490908)))

(declare-fun res!598966 () Bool)

(assert (=> b!882008 (=> res!598966 e!490908)))

(assert (=> b!882008 (= res!598966 (not (= (select (arr!24705 _keys!868) from!1053) k0!854)))))

(declare-fun get!13017 (ValueCell!8363 V!28521) V!28521)

(declare-fun dynLambda!1266 (Int (_ BitVec 64)) V!28521)

(assert (=> b!882008 (= lt!398842 (+!2543 lt!398841 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74902 res!598968) b!882007))

(assert (= (and b!882007 res!598967) b!882000))

(assert (= (and b!882000 res!598958) b!881997))

(assert (= (and b!881997 res!598969) b!881994))

(assert (= (and b!881994 res!598965) b!881998))

(assert (= (and b!881998 res!598959) b!882003))

(assert (= (and b!882003 res!598964) b!881996))

(assert (= (and b!881996 res!598963) b!882005))

(assert (= (and b!882005 res!598960) b!882002))

(assert (= (and b!882002 (not res!598962)) b!882008))

(assert (= (and b!882008 (not res!598966)) b!881999))

(assert (= (and b!881999 (not res!598961)) b!882006))

(assert (= (and b!882004 condMapEmpty!28032) mapIsEmpty!28032))

(assert (= (and b!882004 (not condMapEmpty!28032)) mapNonEmpty!28032))

(get-info :version)

(assert (= (and mapNonEmpty!28032 ((_ is ValueCellFull!8363) mapValue!28032)) b!882001))

(assert (= (and b!882004 ((_ is ValueCellFull!8363) mapDefault!28032)) b!881995))

(assert (= start!74902 b!882004))

(declare-fun b_lambda!12517 () Bool)

(assert (=> (not b_lambda!12517) (not b!882008)))

(declare-fun t!24637 () Bool)

(declare-fun tb!5011 () Bool)

(assert (=> (and start!74902 (= defaultEntry!696 defaultEntry!696) t!24637) tb!5011))

(declare-fun result!9657 () Bool)

(assert (=> tb!5011 (= result!9657 tp_is_empty!17605)))

(assert (=> b!882008 t!24637))

(declare-fun b_and!25369 () Bool)

(assert (= b_and!25367 (and (=> t!24637 result!9657) b_and!25369)))

(declare-fun m!822201 () Bool)

(assert (=> mapNonEmpty!28032 m!822201))

(declare-fun m!822203 () Bool)

(assert (=> b!881994 m!822203))

(declare-fun m!822205 () Bool)

(assert (=> b!881996 m!822205))

(declare-fun m!822207 () Bool)

(assert (=> start!74902 m!822207))

(declare-fun m!822209 () Bool)

(assert (=> start!74902 m!822209))

(declare-fun m!822211 () Bool)

(assert (=> b!882008 m!822211))

(declare-fun m!822213 () Bool)

(assert (=> b!882008 m!822213))

(declare-fun m!822215 () Bool)

(assert (=> b!882008 m!822215))

(declare-fun m!822217 () Bool)

(assert (=> b!882008 m!822217))

(assert (=> b!882008 m!822213))

(declare-fun m!822219 () Bool)

(assert (=> b!882008 m!822219))

(assert (=> b!882008 m!822215))

(declare-fun m!822221 () Bool)

(assert (=> b!882007 m!822221))

(declare-fun m!822223 () Bool)

(assert (=> b!882002 m!822223))

(declare-fun m!822225 () Bool)

(assert (=> b!882002 m!822225))

(declare-fun m!822227 () Bool)

(assert (=> b!882002 m!822227))

(assert (=> b!882002 m!822219))

(declare-fun m!822229 () Bool)

(assert (=> b!882002 m!822229))

(assert (=> b!882002 m!822219))

(declare-fun m!822231 () Bool)

(assert (=> b!882002 m!822231))

(declare-fun m!822233 () Bool)

(assert (=> b!882005 m!822233))

(declare-fun m!822235 () Bool)

(assert (=> b!882005 m!822235))

(declare-fun m!822237 () Bool)

(assert (=> b!882005 m!822237))

(declare-fun m!822239 () Bool)

(assert (=> b!882003 m!822239))

(declare-fun m!822241 () Bool)

(assert (=> b!881997 m!822241))

(declare-fun m!822243 () Bool)

(assert (=> b!881999 m!822243))

(declare-fun m!822245 () Bool)

(assert (=> b!881999 m!822245))

(declare-fun m!822247 () Bool)

(assert (=> b!882006 m!822247))

(check-sat (not mapNonEmpty!28032) (not b!882007) (not b!882006) (not b!882003) (not start!74902) (not b!882008) (not b!882002) tp_is_empty!17605 (not b_lambda!12517) (not b!881994) b_and!25369 (not b_next!15361) (not b!881999) (not b!881997) (not b!882005))
(check-sat b_and!25369 (not b_next!15361))
(get-model)

(declare-fun b_lambda!12523 () Bool)

(assert (= b_lambda!12517 (or (and start!74902 b_free!15361) b_lambda!12523)))

(check-sat (not mapNonEmpty!28032) (not b!882007) (not b!882006) (not b!882003) (not b_lambda!12523) (not start!74902) (not b!882008) (not b!882002) tp_is_empty!17605 (not b!881994) b_and!25369 (not b_next!15361) (not b!881999) (not b!881997) (not b!882005))
(check-sat b_and!25369 (not b_next!15361))
(get-model)

(declare-fun b!882115 () Bool)

(declare-fun e!490976 () Bool)

(declare-fun contains!4238 (List!17483 (_ BitVec 64)) Bool)

(assert (=> b!882115 (= e!490976 (contains!4238 Nil!17480 (select (arr!24705 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882116 () Bool)

(declare-fun e!490979 () Bool)

(declare-fun call!38957 () Bool)

(assert (=> b!882116 (= e!490979 call!38957)))

(declare-fun bm!38954 () Bool)

(declare-fun c!93180 () Bool)

(assert (=> bm!38954 (= call!38957 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93180 (Cons!17479 (select (arr!24705 _keys!868) #b00000000000000000000000000000000) Nil!17480) Nil!17480)))))

(declare-fun b!882118 () Bool)

(assert (=> b!882118 (= e!490979 call!38957)))

(declare-fun b!882119 () Bool)

(declare-fun e!490978 () Bool)

(assert (=> b!882119 (= e!490978 e!490979)))

(assert (=> b!882119 (= c!93180 (validKeyInArray!0 (select (arr!24705 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109335 () Bool)

(declare-fun res!599048 () Bool)

(declare-fun e!490977 () Bool)

(assert (=> d!109335 (=> res!599048 e!490977)))

(assert (=> d!109335 (= res!599048 (bvsge #b00000000000000000000000000000000 (size!25146 _keys!868)))))

(assert (=> d!109335 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17480) e!490977)))

(declare-fun b!882117 () Bool)

(assert (=> b!882117 (= e!490977 e!490978)))

(declare-fun res!599050 () Bool)

(assert (=> b!882117 (=> (not res!599050) (not e!490978))))

(assert (=> b!882117 (= res!599050 (not e!490976))))

(declare-fun res!599049 () Bool)

(assert (=> b!882117 (=> (not res!599049) (not e!490976))))

(assert (=> b!882117 (= res!599049 (validKeyInArray!0 (select (arr!24705 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109335 (not res!599048)) b!882117))

(assert (= (and b!882117 res!599049) b!882115))

(assert (= (and b!882117 res!599050) b!882119))

(assert (= (and b!882119 c!93180) b!882118))

(assert (= (and b!882119 (not c!93180)) b!882116))

(assert (= (or b!882118 b!882116) bm!38954))

(declare-fun m!822345 () Bool)

(assert (=> b!882115 m!822345))

(assert (=> b!882115 m!822345))

(declare-fun m!822347 () Bool)

(assert (=> b!882115 m!822347))

(assert (=> bm!38954 m!822345))

(declare-fun m!822349 () Bool)

(assert (=> bm!38954 m!822349))

(assert (=> b!882119 m!822345))

(assert (=> b!882119 m!822345))

(declare-fun m!822351 () Bool)

(assert (=> b!882119 m!822351))

(assert (=> b!882117 m!822345))

(assert (=> b!882117 m!822345))

(assert (=> b!882117 m!822351))

(assert (=> b!881994 d!109335))

(declare-fun b!882128 () Bool)

(declare-fun e!490988 () Bool)

(declare-fun e!490987 () Bool)

(assert (=> b!882128 (= e!490988 e!490987)))

(declare-fun c!93183 () Bool)

(assert (=> b!882128 (= c!93183 (validKeyInArray!0 (select (arr!24705 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882129 () Bool)

(declare-fun e!490986 () Bool)

(assert (=> b!882129 (= e!490987 e!490986)))

(declare-fun lt!398898 () (_ BitVec 64))

(assert (=> b!882129 (= lt!398898 (select (arr!24705 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398897 () Unit!30052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51373 (_ BitVec 64) (_ BitVec 32)) Unit!30052)

(assert (=> b!882129 (= lt!398897 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398898 #b00000000000000000000000000000000))))

(assert (=> b!882129 (arrayContainsKey!0 _keys!868 lt!398898 #b00000000000000000000000000000000)))

(declare-fun lt!398899 () Unit!30052)

(assert (=> b!882129 (= lt!398899 lt!398897)))

(declare-fun res!599055 () Bool)

(declare-datatypes ((SeekEntryResult!8708 0))(
  ( (MissingZero!8708 (index!37203 (_ BitVec 32))) (Found!8708 (index!37204 (_ BitVec 32))) (Intermediate!8708 (undefined!9520 Bool) (index!37205 (_ BitVec 32)) (x!74641 (_ BitVec 32))) (Undefined!8708) (MissingVacant!8708 (index!37206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51373 (_ BitVec 32)) SeekEntryResult!8708)

(assert (=> b!882129 (= res!599055 (= (seekEntryOrOpen!0 (select (arr!24705 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8708 #b00000000000000000000000000000000)))))

(assert (=> b!882129 (=> (not res!599055) (not e!490986))))

(declare-fun b!882130 () Bool)

(declare-fun call!38960 () Bool)

(assert (=> b!882130 (= e!490986 call!38960)))

(declare-fun bm!38957 () Bool)

(assert (=> bm!38957 (= call!38960 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!109337 () Bool)

(declare-fun res!599056 () Bool)

(assert (=> d!109337 (=> res!599056 e!490988)))

(assert (=> d!109337 (= res!599056 (bvsge #b00000000000000000000000000000000 (size!25146 _keys!868)))))

(assert (=> d!109337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490988)))

(declare-fun b!882131 () Bool)

(assert (=> b!882131 (= e!490987 call!38960)))

(assert (= (and d!109337 (not res!599056)) b!882128))

(assert (= (and b!882128 c!93183) b!882129))

(assert (= (and b!882128 (not c!93183)) b!882131))

(assert (= (and b!882129 res!599055) b!882130))

(assert (= (or b!882130 b!882131) bm!38957))

(assert (=> b!882128 m!822345))

(assert (=> b!882128 m!822345))

(assert (=> b!882128 m!822351))

(assert (=> b!882129 m!822345))

(declare-fun m!822353 () Bool)

(assert (=> b!882129 m!822353))

(declare-fun m!822355 () Bool)

(assert (=> b!882129 m!822355))

(assert (=> b!882129 m!822345))

(declare-fun m!822357 () Bool)

(assert (=> b!882129 m!822357))

(declare-fun m!822359 () Bool)

(assert (=> bm!38957 m!822359))

(assert (=> b!881997 d!109337))

(declare-fun d!109339 () Bool)

(declare-fun e!490991 () Bool)

(assert (=> d!109339 e!490991))

(declare-fun res!599062 () Bool)

(assert (=> d!109339 (=> (not res!599062) (not e!490991))))

(declare-fun lt!398909 () ListLongMap!10425)

(declare-fun contains!4239 (ListLongMap!10425 (_ BitVec 64)) Bool)

(assert (=> d!109339 (= res!599062 (contains!4239 lt!398909 (_1!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398910 () List!17484)

(assert (=> d!109339 (= lt!398909 (ListLongMap!10426 lt!398910))))

(declare-fun lt!398908 () Unit!30052)

(declare-fun lt!398911 () Unit!30052)

(assert (=> d!109339 (= lt!398908 lt!398911)))

(declare-datatypes ((Option!430 0))(
  ( (Some!429 (v!11308 V!28521)) (None!428) )
))
(declare-fun getValueByKey!424 (List!17484 (_ BitVec 64)) Option!430)

(assert (=> d!109339 (= (getValueByKey!424 lt!398910 (_1!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!429 (_2!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!238 (List!17484 (_ BitVec 64) V!28521) Unit!30052)

(assert (=> d!109339 (= lt!398911 (lemmaContainsTupThenGetReturnValue!238 lt!398910 (_1!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!277 (List!17484 (_ BitVec 64) V!28521) List!17484)

(assert (=> d!109339 (= lt!398910 (insertStrictlySorted!277 (toList!5228 lt!398841) (_1!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109339 (= (+!2543 lt!398841 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398909)))

(declare-fun b!882136 () Bool)

(declare-fun res!599061 () Bool)

(assert (=> b!882136 (=> (not res!599061) (not e!490991))))

(assert (=> b!882136 (= res!599061 (= (getValueByKey!424 (toList!5228 lt!398909) (_1!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!429 (_2!5838 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!882137 () Bool)

(declare-fun contains!4240 (List!17484 tuple2!11654) Bool)

(assert (=> b!882137 (= e!490991 (contains!4240 (toList!5228 lt!398909) (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109339 res!599062) b!882136))

(assert (= (and b!882136 res!599061) b!882137))

(declare-fun m!822361 () Bool)

(assert (=> d!109339 m!822361))

(declare-fun m!822363 () Bool)

(assert (=> d!109339 m!822363))

(declare-fun m!822365 () Bool)

(assert (=> d!109339 m!822365))

(declare-fun m!822367 () Bool)

(assert (=> d!109339 m!822367))

(declare-fun m!822369 () Bool)

(assert (=> b!882136 m!822369))

(declare-fun m!822371 () Bool)

(assert (=> b!882137 m!822371))

(assert (=> b!882008 d!109339))

(declare-fun d!109341 () Bool)

(declare-fun c!93186 () Bool)

(assert (=> d!109341 (= c!93186 ((_ is ValueCellFull!8363) (select (arr!24706 _values!688) from!1053)))))

(declare-fun e!490994 () V!28521)

(assert (=> d!109341 (= (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490994)))

(declare-fun b!882142 () Bool)

(declare-fun get!13018 (ValueCell!8363 V!28521) V!28521)

(assert (=> b!882142 (= e!490994 (get!13018 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882143 () Bool)

(declare-fun get!13019 (ValueCell!8363 V!28521) V!28521)

(assert (=> b!882143 (= e!490994 (get!13019 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109341 c!93186) b!882142))

(assert (= (and d!109341 (not c!93186)) b!882143))

(assert (=> b!882142 m!822213))

(assert (=> b!882142 m!822215))

(declare-fun m!822373 () Bool)

(assert (=> b!882142 m!822373))

(assert (=> b!882143 m!822213))

(assert (=> b!882143 m!822215))

(declare-fun m!822375 () Bool)

(assert (=> b!882143 m!822375))

(assert (=> b!882008 d!109341))

(declare-fun d!109343 () Bool)

(assert (=> d!109343 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882003 d!109343))

(declare-fun b!882168 () Bool)

(declare-fun e!491015 () Bool)

(declare-fun lt!398926 () ListLongMap!10425)

(declare-fun isEmpty!674 (ListLongMap!10425) Bool)

(assert (=> b!882168 (= e!491015 (isEmpty!674 lt!398926))))

(declare-fun b!882169 () Bool)

(assert (=> b!882169 (= e!491015 (= lt!398926 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882170 () Bool)

(declare-fun e!491014 () Bool)

(declare-fun e!491010 () Bool)

(assert (=> b!882170 (= e!491014 e!491010)))

(declare-fun c!93197 () Bool)

(declare-fun e!491011 () Bool)

(assert (=> b!882170 (= c!93197 e!491011)))

(declare-fun res!599072 () Bool)

(assert (=> b!882170 (=> (not res!599072) (not e!491011))))

(assert (=> b!882170 (= res!599072 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(declare-fun b!882171 () Bool)

(declare-fun e!491009 () Bool)

(assert (=> b!882171 (= e!491010 e!491009)))

(assert (=> b!882171 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(declare-fun res!599074 () Bool)

(assert (=> b!882171 (= res!599074 (contains!4239 lt!398926 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882171 (=> (not res!599074) (not e!491009))))

(declare-fun b!882172 () Bool)

(declare-fun res!599071 () Bool)

(assert (=> b!882172 (=> (not res!599071) (not e!491014))))

(assert (=> b!882172 (= res!599071 (not (contains!4239 lt!398926 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882173 () Bool)

(declare-fun e!491013 () ListLongMap!10425)

(assert (=> b!882173 (= e!491013 (ListLongMap!10426 Nil!17481))))

(declare-fun b!882174 () Bool)

(declare-fun e!491012 () ListLongMap!10425)

(assert (=> b!882174 (= e!491013 e!491012)))

(declare-fun c!93195 () Bool)

(assert (=> b!882174 (= c!93195 (validKeyInArray!0 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882175 () Bool)

(assert (=> b!882175 (= e!491011 (validKeyInArray!0 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882175 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882176 () Bool)

(assert (=> b!882176 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(assert (=> b!882176 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25147 _values!688)))))

(declare-fun apply!381 (ListLongMap!10425 (_ BitVec 64)) V!28521)

(assert (=> b!882176 (= e!491009 (= (apply!381 lt!398926 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13017 (select (arr!24706 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!109345 () Bool)

(assert (=> d!109345 e!491014))

(declare-fun res!599073 () Bool)

(assert (=> d!109345 (=> (not res!599073) (not e!491014))))

(assert (=> d!109345 (= res!599073 (not (contains!4239 lt!398926 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109345 (= lt!398926 e!491013)))

(declare-fun c!93198 () Bool)

(assert (=> d!109345 (= c!93198 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(assert (=> d!109345 (validMask!0 mask!1196)))

(assert (=> d!109345 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398926)))

(declare-fun b!882177 () Bool)

(assert (=> b!882177 (= e!491010 e!491015)))

(declare-fun c!93196 () Bool)

(assert (=> b!882177 (= c!93196 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(declare-fun call!38963 () ListLongMap!10425)

(declare-fun bm!38960 () Bool)

(assert (=> bm!38960 (= call!38963 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882178 () Bool)

(declare-fun lt!398930 () Unit!30052)

(declare-fun lt!398932 () Unit!30052)

(assert (=> b!882178 (= lt!398930 lt!398932)))

(declare-fun lt!398928 () (_ BitVec 64))

(declare-fun lt!398931 () (_ BitVec 64))

(declare-fun lt!398929 () ListLongMap!10425)

(declare-fun lt!398927 () V!28521)

(assert (=> b!882178 (not (contains!4239 (+!2543 lt!398929 (tuple2!11655 lt!398928 lt!398927)) lt!398931))))

(declare-fun addStillNotContains!208 (ListLongMap!10425 (_ BitVec 64) V!28521 (_ BitVec 64)) Unit!30052)

(assert (=> b!882178 (= lt!398932 (addStillNotContains!208 lt!398929 lt!398928 lt!398927 lt!398931))))

(assert (=> b!882178 (= lt!398931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882178 (= lt!398927 (get!13017 (select (arr!24706 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882178 (= lt!398928 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882178 (= lt!398929 call!38963)))

(assert (=> b!882178 (= e!491012 (+!2543 call!38963 (tuple2!11655 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13017 (select (arr!24706 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882179 () Bool)

(assert (=> b!882179 (= e!491012 call!38963)))

(assert (= (and d!109345 c!93198) b!882173))

(assert (= (and d!109345 (not c!93198)) b!882174))

(assert (= (and b!882174 c!93195) b!882178))

(assert (= (and b!882174 (not c!93195)) b!882179))

(assert (= (or b!882178 b!882179) bm!38960))

(assert (= (and d!109345 res!599073) b!882172))

(assert (= (and b!882172 res!599071) b!882170))

(assert (= (and b!882170 res!599072) b!882175))

(assert (= (and b!882170 c!93197) b!882171))

(assert (= (and b!882170 (not c!93197)) b!882177))

(assert (= (and b!882171 res!599074) b!882176))

(assert (= (and b!882177 c!93196) b!882169))

(assert (= (and b!882177 (not c!93196)) b!882168))

(declare-fun b_lambda!12525 () Bool)

(assert (=> (not b_lambda!12525) (not b!882176)))

(assert (=> b!882176 t!24637))

(declare-fun b_and!25379 () Bool)

(assert (= b_and!25369 (and (=> t!24637 result!9657) b_and!25379)))

(declare-fun b_lambda!12527 () Bool)

(assert (=> (not b_lambda!12527) (not b!882178)))

(assert (=> b!882178 t!24637))

(declare-fun b_and!25381 () Bool)

(assert (= b_and!25379 (and (=> t!24637 result!9657) b_and!25381)))

(declare-fun m!822377 () Bool)

(assert (=> b!882175 m!822377))

(assert (=> b!882175 m!822377))

(declare-fun m!822379 () Bool)

(assert (=> b!882175 m!822379))

(assert (=> b!882176 m!822377))

(declare-fun m!822381 () Bool)

(assert (=> b!882176 m!822381))

(declare-fun m!822383 () Bool)

(assert (=> b!882176 m!822383))

(assert (=> b!882176 m!822215))

(declare-fun m!822385 () Bool)

(assert (=> b!882176 m!822385))

(assert (=> b!882176 m!822383))

(assert (=> b!882176 m!822377))

(assert (=> b!882176 m!822215))

(declare-fun m!822387 () Bool)

(assert (=> b!882169 m!822387))

(declare-fun m!822389 () Bool)

(assert (=> b!882178 m!822389))

(declare-fun m!822391 () Bool)

(assert (=> b!882178 m!822391))

(assert (=> b!882178 m!822383))

(assert (=> b!882178 m!822215))

(assert (=> b!882178 m!822385))

(declare-fun m!822393 () Bool)

(assert (=> b!882178 m!822393))

(assert (=> b!882178 m!822391))

(declare-fun m!822395 () Bool)

(assert (=> b!882178 m!822395))

(assert (=> b!882178 m!822383))

(assert (=> b!882178 m!822377))

(assert (=> b!882178 m!822215))

(assert (=> b!882171 m!822377))

(assert (=> b!882171 m!822377))

(declare-fun m!822397 () Bool)

(assert (=> b!882171 m!822397))

(assert (=> bm!38960 m!822387))

(assert (=> b!882174 m!822377))

(assert (=> b!882174 m!822377))

(assert (=> b!882174 m!822379))

(declare-fun m!822399 () Bool)

(assert (=> b!882172 m!822399))

(declare-fun m!822401 () Bool)

(assert (=> b!882168 m!822401))

(declare-fun m!822403 () Bool)

(assert (=> d!109345 m!822403))

(assert (=> d!109345 m!822221))

(assert (=> b!882002 d!109345))

(declare-fun d!109347 () Bool)

(assert (=> d!109347 (= (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053)) (and (not (= (select (arr!24705 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24705 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882002 d!109347))

(declare-fun call!38968 () ListLongMap!10425)

(declare-fun call!38969 () ListLongMap!10425)

(declare-fun b!882186 () Bool)

(declare-fun e!491020 () Bool)

(assert (=> b!882186 (= e!491020 (= call!38969 (+!2543 call!38968 (tuple2!11655 k0!854 v!557))))))

(declare-fun bm!38965 () Bool)

(assert (=> bm!38965 (= call!38968 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882187 () Bool)

(declare-fun e!491021 () Bool)

(assert (=> b!882187 (= e!491021 e!491020)))

(declare-fun c!93201 () Bool)

(assert (=> b!882187 (= c!93201 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun d!109349 () Bool)

(assert (=> d!109349 e!491021))

(declare-fun res!599077 () Bool)

(assert (=> d!109349 (=> (not res!599077) (not e!491021))))

(assert (=> d!109349 (= res!599077 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25147 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25147 _values!688))))))))

(declare-fun lt!398935 () Unit!30052)

(declare-fun choose!1443 (array!51373 array!51375 (_ BitVec 32) (_ BitVec 32) V!28521 V!28521 (_ BitVec 32) (_ BitVec 64) V!28521 (_ BitVec 32) Int) Unit!30052)

(assert (=> d!109349 (= lt!398935 (choose!1443 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109349 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(assert (=> d!109349 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398935)))

(declare-fun bm!38966 () Bool)

(assert (=> bm!38966 (= call!38969 (getCurrentListMapNoExtraKeys!3268 _keys!868 (array!51376 (store (arr!24706 _values!688) i!612 (ValueCellFull!8363 v!557)) (size!25147 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882188 () Bool)

(assert (=> b!882188 (= e!491020 (= call!38969 call!38968))))

(assert (= (and d!109349 res!599077) b!882187))

(assert (= (and b!882187 c!93201) b!882186))

(assert (= (and b!882187 (not c!93201)) b!882188))

(assert (= (or b!882186 b!882188) bm!38965))

(assert (= (or b!882186 b!882188) bm!38966))

(declare-fun m!822405 () Bool)

(assert (=> b!882186 m!822405))

(assert (=> bm!38965 m!822225))

(declare-fun m!822407 () Bool)

(assert (=> d!109349 m!822407))

(assert (=> bm!38966 m!822235))

(declare-fun m!822409 () Bool)

(assert (=> bm!38966 m!822409))

(assert (=> b!882002 d!109349))

(declare-fun d!109351 () Bool)

(declare-fun e!491022 () Bool)

(assert (=> d!109351 e!491022))

(declare-fun res!599079 () Bool)

(assert (=> d!109351 (=> (not res!599079) (not e!491022))))

(declare-fun lt!398937 () ListLongMap!10425)

(assert (=> d!109351 (= res!599079 (contains!4239 lt!398937 (_1!5838 (tuple2!11655 k0!854 v!557))))))

(declare-fun lt!398938 () List!17484)

(assert (=> d!109351 (= lt!398937 (ListLongMap!10426 lt!398938))))

(declare-fun lt!398936 () Unit!30052)

(declare-fun lt!398939 () Unit!30052)

(assert (=> d!109351 (= lt!398936 lt!398939)))

(assert (=> d!109351 (= (getValueByKey!424 lt!398938 (_1!5838 (tuple2!11655 k0!854 v!557))) (Some!429 (_2!5838 (tuple2!11655 k0!854 v!557))))))

(assert (=> d!109351 (= lt!398939 (lemmaContainsTupThenGetReturnValue!238 lt!398938 (_1!5838 (tuple2!11655 k0!854 v!557)) (_2!5838 (tuple2!11655 k0!854 v!557))))))

(assert (=> d!109351 (= lt!398938 (insertStrictlySorted!277 (toList!5228 lt!398839) (_1!5838 (tuple2!11655 k0!854 v!557)) (_2!5838 (tuple2!11655 k0!854 v!557))))))

(assert (=> d!109351 (= (+!2543 lt!398839 (tuple2!11655 k0!854 v!557)) lt!398937)))

(declare-fun b!882189 () Bool)

(declare-fun res!599078 () Bool)

(assert (=> b!882189 (=> (not res!599078) (not e!491022))))

(assert (=> b!882189 (= res!599078 (= (getValueByKey!424 (toList!5228 lt!398937) (_1!5838 (tuple2!11655 k0!854 v!557))) (Some!429 (_2!5838 (tuple2!11655 k0!854 v!557)))))))

(declare-fun b!882190 () Bool)

(assert (=> b!882190 (= e!491022 (contains!4240 (toList!5228 lt!398937) (tuple2!11655 k0!854 v!557)))))

(assert (= (and d!109351 res!599079) b!882189))

(assert (= (and b!882189 res!599078) b!882190))

(declare-fun m!822411 () Bool)

(assert (=> d!109351 m!822411))

(declare-fun m!822413 () Bool)

(assert (=> d!109351 m!822413))

(declare-fun m!822415 () Bool)

(assert (=> d!109351 m!822415))

(declare-fun m!822417 () Bool)

(assert (=> d!109351 m!822417))

(declare-fun m!822419 () Bool)

(assert (=> b!882189 m!822419))

(declare-fun m!822421 () Bool)

(assert (=> b!882190 m!822421))

(assert (=> b!882002 d!109351))

(declare-fun b!882191 () Bool)

(declare-fun e!491029 () Bool)

(declare-fun lt!398940 () ListLongMap!10425)

(assert (=> b!882191 (= e!491029 (isEmpty!674 lt!398940))))

(declare-fun b!882192 () Bool)

(assert (=> b!882192 (= e!491029 (= lt!398940 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882193 () Bool)

(declare-fun e!491028 () Bool)

(declare-fun e!491024 () Bool)

(assert (=> b!882193 (= e!491028 e!491024)))

(declare-fun c!93204 () Bool)

(declare-fun e!491025 () Bool)

(assert (=> b!882193 (= c!93204 e!491025)))

(declare-fun res!599081 () Bool)

(assert (=> b!882193 (=> (not res!599081) (not e!491025))))

(assert (=> b!882193 (= res!599081 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(declare-fun b!882194 () Bool)

(declare-fun e!491023 () Bool)

(assert (=> b!882194 (= e!491024 e!491023)))

(assert (=> b!882194 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(declare-fun res!599083 () Bool)

(assert (=> b!882194 (= res!599083 (contains!4239 lt!398940 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882194 (=> (not res!599083) (not e!491023))))

(declare-fun b!882195 () Bool)

(declare-fun res!599080 () Bool)

(assert (=> b!882195 (=> (not res!599080) (not e!491028))))

(assert (=> b!882195 (= res!599080 (not (contains!4239 lt!398940 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882196 () Bool)

(declare-fun e!491027 () ListLongMap!10425)

(assert (=> b!882196 (= e!491027 (ListLongMap!10426 Nil!17481))))

(declare-fun b!882197 () Bool)

(declare-fun e!491026 () ListLongMap!10425)

(assert (=> b!882197 (= e!491027 e!491026)))

(declare-fun c!93202 () Bool)

(assert (=> b!882197 (= c!93202 (validKeyInArray!0 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882198 () Bool)

(assert (=> b!882198 (= e!491025 (validKeyInArray!0 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882198 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882199 () Bool)

(assert (=> b!882199 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(assert (=> b!882199 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25147 lt!398838)))))

(assert (=> b!882199 (= e!491023 (= (apply!381 lt!398940 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13017 (select (arr!24706 lt!398838) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!109353 () Bool)

(assert (=> d!109353 e!491028))

(declare-fun res!599082 () Bool)

(assert (=> d!109353 (=> (not res!599082) (not e!491028))))

(assert (=> d!109353 (= res!599082 (not (contains!4239 lt!398940 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109353 (= lt!398940 e!491027)))

(declare-fun c!93205 () Bool)

(assert (=> d!109353 (= c!93205 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(assert (=> d!109353 (validMask!0 mask!1196)))

(assert (=> d!109353 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398940)))

(declare-fun b!882200 () Bool)

(assert (=> b!882200 (= e!491024 e!491029)))

(declare-fun c!93203 () Bool)

(assert (=> b!882200 (= c!93203 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25146 _keys!868)))))

(declare-fun bm!38967 () Bool)

(declare-fun call!38970 () ListLongMap!10425)

(assert (=> bm!38967 (= call!38970 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882201 () Bool)

(declare-fun lt!398944 () Unit!30052)

(declare-fun lt!398946 () Unit!30052)

(assert (=> b!882201 (= lt!398944 lt!398946)))

(declare-fun lt!398942 () (_ BitVec 64))

(declare-fun lt!398945 () (_ BitVec 64))

(declare-fun lt!398943 () ListLongMap!10425)

(declare-fun lt!398941 () V!28521)

(assert (=> b!882201 (not (contains!4239 (+!2543 lt!398943 (tuple2!11655 lt!398942 lt!398941)) lt!398945))))

(assert (=> b!882201 (= lt!398946 (addStillNotContains!208 lt!398943 lt!398942 lt!398941 lt!398945))))

(assert (=> b!882201 (= lt!398945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882201 (= lt!398941 (get!13017 (select (arr!24706 lt!398838) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882201 (= lt!398942 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882201 (= lt!398943 call!38970)))

(assert (=> b!882201 (= e!491026 (+!2543 call!38970 (tuple2!11655 (select (arr!24705 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13017 (select (arr!24706 lt!398838) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882202 () Bool)

(assert (=> b!882202 (= e!491026 call!38970)))

(assert (= (and d!109353 c!93205) b!882196))

(assert (= (and d!109353 (not c!93205)) b!882197))

(assert (= (and b!882197 c!93202) b!882201))

(assert (= (and b!882197 (not c!93202)) b!882202))

(assert (= (or b!882201 b!882202) bm!38967))

(assert (= (and d!109353 res!599082) b!882195))

(assert (= (and b!882195 res!599080) b!882193))

(assert (= (and b!882193 res!599081) b!882198))

(assert (= (and b!882193 c!93204) b!882194))

(assert (= (and b!882193 (not c!93204)) b!882200))

(assert (= (and b!882194 res!599083) b!882199))

(assert (= (and b!882200 c!93203) b!882192))

(assert (= (and b!882200 (not c!93203)) b!882191))

(declare-fun b_lambda!12529 () Bool)

(assert (=> (not b_lambda!12529) (not b!882199)))

(assert (=> b!882199 t!24637))

(declare-fun b_and!25383 () Bool)

(assert (= b_and!25381 (and (=> t!24637 result!9657) b_and!25383)))

(declare-fun b_lambda!12531 () Bool)

(assert (=> (not b_lambda!12531) (not b!882201)))

(assert (=> b!882201 t!24637))

(declare-fun b_and!25385 () Bool)

(assert (= b_and!25383 (and (=> t!24637 result!9657) b_and!25385)))

(assert (=> b!882198 m!822377))

(assert (=> b!882198 m!822377))

(assert (=> b!882198 m!822379))

(assert (=> b!882199 m!822377))

(declare-fun m!822423 () Bool)

(assert (=> b!882199 m!822423))

(declare-fun m!822425 () Bool)

(assert (=> b!882199 m!822425))

(assert (=> b!882199 m!822215))

(declare-fun m!822427 () Bool)

(assert (=> b!882199 m!822427))

(assert (=> b!882199 m!822425))

(assert (=> b!882199 m!822377))

(assert (=> b!882199 m!822215))

(declare-fun m!822429 () Bool)

(assert (=> b!882192 m!822429))

(declare-fun m!822431 () Bool)

(assert (=> b!882201 m!822431))

(declare-fun m!822433 () Bool)

(assert (=> b!882201 m!822433))

(assert (=> b!882201 m!822425))

(assert (=> b!882201 m!822215))

(assert (=> b!882201 m!822427))

(declare-fun m!822435 () Bool)

(assert (=> b!882201 m!822435))

(assert (=> b!882201 m!822433))

(declare-fun m!822437 () Bool)

(assert (=> b!882201 m!822437))

(assert (=> b!882201 m!822425))

(assert (=> b!882201 m!822377))

(assert (=> b!882201 m!822215))

(assert (=> b!882194 m!822377))

(assert (=> b!882194 m!822377))

(declare-fun m!822439 () Bool)

(assert (=> b!882194 m!822439))

(assert (=> bm!38967 m!822429))

(assert (=> b!882197 m!822377))

(assert (=> b!882197 m!822377))

(assert (=> b!882197 m!822379))

(declare-fun m!822441 () Bool)

(assert (=> b!882195 m!822441))

(declare-fun m!822443 () Bool)

(assert (=> b!882191 m!822443))

(declare-fun m!822445 () Bool)

(assert (=> d!109353 m!822445))

(assert (=> d!109353 m!822221))

(assert (=> b!882002 d!109353))

(declare-fun d!109355 () Bool)

(assert (=> d!109355 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!882007 d!109355))

(declare-fun b!882203 () Bool)

(declare-fun e!491036 () Bool)

(declare-fun lt!398947 () ListLongMap!10425)

(assert (=> b!882203 (= e!491036 (isEmpty!674 lt!398947))))

(declare-fun b!882204 () Bool)

(assert (=> b!882204 (= e!491036 (= lt!398947 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882205 () Bool)

(declare-fun e!491035 () Bool)

(declare-fun e!491031 () Bool)

(assert (=> b!882205 (= e!491035 e!491031)))

(declare-fun c!93208 () Bool)

(declare-fun e!491032 () Bool)

(assert (=> b!882205 (= c!93208 e!491032)))

(declare-fun res!599085 () Bool)

(assert (=> b!882205 (=> (not res!599085) (not e!491032))))

(assert (=> b!882205 (= res!599085 (bvslt from!1053 (size!25146 _keys!868)))))

(declare-fun b!882206 () Bool)

(declare-fun e!491030 () Bool)

(assert (=> b!882206 (= e!491031 e!491030)))

(assert (=> b!882206 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25146 _keys!868)))))

(declare-fun res!599087 () Bool)

(assert (=> b!882206 (= res!599087 (contains!4239 lt!398947 (select (arr!24705 _keys!868) from!1053)))))

(assert (=> b!882206 (=> (not res!599087) (not e!491030))))

(declare-fun b!882207 () Bool)

(declare-fun res!599084 () Bool)

(assert (=> b!882207 (=> (not res!599084) (not e!491035))))

(assert (=> b!882207 (= res!599084 (not (contains!4239 lt!398947 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882208 () Bool)

(declare-fun e!491034 () ListLongMap!10425)

(assert (=> b!882208 (= e!491034 (ListLongMap!10426 Nil!17481))))

(declare-fun b!882209 () Bool)

(declare-fun e!491033 () ListLongMap!10425)

(assert (=> b!882209 (= e!491034 e!491033)))

(declare-fun c!93206 () Bool)

(assert (=> b!882209 (= c!93206 (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053)))))

(declare-fun b!882210 () Bool)

(assert (=> b!882210 (= e!491032 (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053)))))

(assert (=> b!882210 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882211 () Bool)

(assert (=> b!882211 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25146 _keys!868)))))

(assert (=> b!882211 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25147 lt!398838)))))

(assert (=> b!882211 (= e!491030 (= (apply!381 lt!398947 (select (arr!24705 _keys!868) from!1053)) (get!13017 (select (arr!24706 lt!398838) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!109357 () Bool)

(assert (=> d!109357 e!491035))

(declare-fun res!599086 () Bool)

(assert (=> d!109357 (=> (not res!599086) (not e!491035))))

(assert (=> d!109357 (= res!599086 (not (contains!4239 lt!398947 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109357 (= lt!398947 e!491034)))

(declare-fun c!93209 () Bool)

(assert (=> d!109357 (= c!93209 (bvsge from!1053 (size!25146 _keys!868)))))

(assert (=> d!109357 (validMask!0 mask!1196)))

(assert (=> d!109357 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398947)))

(declare-fun b!882212 () Bool)

(assert (=> b!882212 (= e!491031 e!491036)))

(declare-fun c!93207 () Bool)

(assert (=> b!882212 (= c!93207 (bvslt from!1053 (size!25146 _keys!868)))))

(declare-fun bm!38968 () Bool)

(declare-fun call!38971 () ListLongMap!10425)

(assert (=> bm!38968 (= call!38971 (getCurrentListMapNoExtraKeys!3268 _keys!868 lt!398838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882213 () Bool)

(declare-fun lt!398951 () Unit!30052)

(declare-fun lt!398953 () Unit!30052)

(assert (=> b!882213 (= lt!398951 lt!398953)))

(declare-fun lt!398952 () (_ BitVec 64))

(declare-fun lt!398949 () (_ BitVec 64))

(declare-fun lt!398950 () ListLongMap!10425)

(declare-fun lt!398948 () V!28521)

(assert (=> b!882213 (not (contains!4239 (+!2543 lt!398950 (tuple2!11655 lt!398949 lt!398948)) lt!398952))))

(assert (=> b!882213 (= lt!398953 (addStillNotContains!208 lt!398950 lt!398949 lt!398948 lt!398952))))

(assert (=> b!882213 (= lt!398952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882213 (= lt!398948 (get!13017 (select (arr!24706 lt!398838) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882213 (= lt!398949 (select (arr!24705 _keys!868) from!1053))))

(assert (=> b!882213 (= lt!398950 call!38971)))

(assert (=> b!882213 (= e!491033 (+!2543 call!38971 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 lt!398838) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882214 () Bool)

(assert (=> b!882214 (= e!491033 call!38971)))

(assert (= (and d!109357 c!93209) b!882208))

(assert (= (and d!109357 (not c!93209)) b!882209))

(assert (= (and b!882209 c!93206) b!882213))

(assert (= (and b!882209 (not c!93206)) b!882214))

(assert (= (or b!882213 b!882214) bm!38968))

(assert (= (and d!109357 res!599086) b!882207))

(assert (= (and b!882207 res!599084) b!882205))

(assert (= (and b!882205 res!599085) b!882210))

(assert (= (and b!882205 c!93208) b!882206))

(assert (= (and b!882205 (not c!93208)) b!882212))

(assert (= (and b!882206 res!599087) b!882211))

(assert (= (and b!882212 c!93207) b!882204))

(assert (= (and b!882212 (not c!93207)) b!882203))

(declare-fun b_lambda!12533 () Bool)

(assert (=> (not b_lambda!12533) (not b!882211)))

(assert (=> b!882211 t!24637))

(declare-fun b_and!25387 () Bool)

(assert (= b_and!25385 (and (=> t!24637 result!9657) b_and!25387)))

(declare-fun b_lambda!12535 () Bool)

(assert (=> (not b_lambda!12535) (not b!882213)))

(assert (=> b!882213 t!24637))

(declare-fun b_and!25389 () Bool)

(assert (= b_and!25387 (and (=> t!24637 result!9657) b_and!25389)))

(assert (=> b!882210 m!822219))

(assert (=> b!882210 m!822219))

(assert (=> b!882210 m!822229))

(assert (=> b!882211 m!822219))

(declare-fun m!822447 () Bool)

(assert (=> b!882211 m!822447))

(declare-fun m!822449 () Bool)

(assert (=> b!882211 m!822449))

(assert (=> b!882211 m!822215))

(declare-fun m!822451 () Bool)

(assert (=> b!882211 m!822451))

(assert (=> b!882211 m!822449))

(assert (=> b!882211 m!822219))

(assert (=> b!882211 m!822215))

(declare-fun m!822453 () Bool)

(assert (=> b!882204 m!822453))

(declare-fun m!822455 () Bool)

(assert (=> b!882213 m!822455))

(declare-fun m!822457 () Bool)

(assert (=> b!882213 m!822457))

(assert (=> b!882213 m!822449))

(assert (=> b!882213 m!822215))

(assert (=> b!882213 m!822451))

(declare-fun m!822459 () Bool)

(assert (=> b!882213 m!822459))

(assert (=> b!882213 m!822457))

(declare-fun m!822461 () Bool)

(assert (=> b!882213 m!822461))

(assert (=> b!882213 m!822449))

(assert (=> b!882213 m!822219))

(assert (=> b!882213 m!822215))

(assert (=> b!882206 m!822219))

(assert (=> b!882206 m!822219))

(declare-fun m!822463 () Bool)

(assert (=> b!882206 m!822463))

(assert (=> bm!38968 m!822453))

(assert (=> b!882209 m!822219))

(assert (=> b!882209 m!822219))

(assert (=> b!882209 m!822229))

(declare-fun m!822465 () Bool)

(assert (=> b!882207 m!822465))

(declare-fun m!822467 () Bool)

(assert (=> b!882203 m!822467))

(declare-fun m!822469 () Bool)

(assert (=> d!109357 m!822469))

(assert (=> d!109357 m!822221))

(assert (=> b!882005 d!109357))

(declare-fun b!882215 () Bool)

(declare-fun e!491043 () Bool)

(declare-fun lt!398954 () ListLongMap!10425)

(assert (=> b!882215 (= e!491043 (isEmpty!674 lt!398954))))

(declare-fun b!882216 () Bool)

(assert (=> b!882216 (= e!491043 (= lt!398954 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882217 () Bool)

(declare-fun e!491042 () Bool)

(declare-fun e!491038 () Bool)

(assert (=> b!882217 (= e!491042 e!491038)))

(declare-fun c!93212 () Bool)

(declare-fun e!491039 () Bool)

(assert (=> b!882217 (= c!93212 e!491039)))

(declare-fun res!599089 () Bool)

(assert (=> b!882217 (=> (not res!599089) (not e!491039))))

(assert (=> b!882217 (= res!599089 (bvslt from!1053 (size!25146 _keys!868)))))

(declare-fun b!882218 () Bool)

(declare-fun e!491037 () Bool)

(assert (=> b!882218 (= e!491038 e!491037)))

(assert (=> b!882218 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25146 _keys!868)))))

(declare-fun res!599091 () Bool)

(assert (=> b!882218 (= res!599091 (contains!4239 lt!398954 (select (arr!24705 _keys!868) from!1053)))))

(assert (=> b!882218 (=> (not res!599091) (not e!491037))))

(declare-fun b!882219 () Bool)

(declare-fun res!599088 () Bool)

(assert (=> b!882219 (=> (not res!599088) (not e!491042))))

(assert (=> b!882219 (= res!599088 (not (contains!4239 lt!398954 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882220 () Bool)

(declare-fun e!491041 () ListLongMap!10425)

(assert (=> b!882220 (= e!491041 (ListLongMap!10426 Nil!17481))))

(declare-fun b!882221 () Bool)

(declare-fun e!491040 () ListLongMap!10425)

(assert (=> b!882221 (= e!491041 e!491040)))

(declare-fun c!93210 () Bool)

(assert (=> b!882221 (= c!93210 (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053)))))

(declare-fun b!882222 () Bool)

(assert (=> b!882222 (= e!491039 (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053)))))

(assert (=> b!882222 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882223 () Bool)

(assert (=> b!882223 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25146 _keys!868)))))

(assert (=> b!882223 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25147 _values!688)))))

(assert (=> b!882223 (= e!491037 (= (apply!381 lt!398954 (select (arr!24705 _keys!868) from!1053)) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!109359 () Bool)

(assert (=> d!109359 e!491042))

(declare-fun res!599090 () Bool)

(assert (=> d!109359 (=> (not res!599090) (not e!491042))))

(assert (=> d!109359 (= res!599090 (not (contains!4239 lt!398954 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109359 (= lt!398954 e!491041)))

(declare-fun c!93213 () Bool)

(assert (=> d!109359 (= c!93213 (bvsge from!1053 (size!25146 _keys!868)))))

(assert (=> d!109359 (validMask!0 mask!1196)))

(assert (=> d!109359 (= (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398954)))

(declare-fun b!882224 () Bool)

(assert (=> b!882224 (= e!491038 e!491043)))

(declare-fun c!93211 () Bool)

(assert (=> b!882224 (= c!93211 (bvslt from!1053 (size!25146 _keys!868)))))

(declare-fun bm!38969 () Bool)

(declare-fun call!38972 () ListLongMap!10425)

(assert (=> bm!38969 (= call!38972 (getCurrentListMapNoExtraKeys!3268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882225 () Bool)

(declare-fun lt!398958 () Unit!30052)

(declare-fun lt!398960 () Unit!30052)

(assert (=> b!882225 (= lt!398958 lt!398960)))

(declare-fun lt!398957 () ListLongMap!10425)

(declare-fun lt!398959 () (_ BitVec 64))

(declare-fun lt!398955 () V!28521)

(declare-fun lt!398956 () (_ BitVec 64))

(assert (=> b!882225 (not (contains!4239 (+!2543 lt!398957 (tuple2!11655 lt!398956 lt!398955)) lt!398959))))

(assert (=> b!882225 (= lt!398960 (addStillNotContains!208 lt!398957 lt!398956 lt!398955 lt!398959))))

(assert (=> b!882225 (= lt!398959 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882225 (= lt!398955 (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882225 (= lt!398956 (select (arr!24705 _keys!868) from!1053))))

(assert (=> b!882225 (= lt!398957 call!38972)))

(assert (=> b!882225 (= e!491040 (+!2543 call!38972 (tuple2!11655 (select (arr!24705 _keys!868) from!1053) (get!13017 (select (arr!24706 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882226 () Bool)

(assert (=> b!882226 (= e!491040 call!38972)))

(assert (= (and d!109359 c!93213) b!882220))

(assert (= (and d!109359 (not c!93213)) b!882221))

(assert (= (and b!882221 c!93210) b!882225))

(assert (= (and b!882221 (not c!93210)) b!882226))

(assert (= (or b!882225 b!882226) bm!38969))

(assert (= (and d!109359 res!599090) b!882219))

(assert (= (and b!882219 res!599088) b!882217))

(assert (= (and b!882217 res!599089) b!882222))

(assert (= (and b!882217 c!93212) b!882218))

(assert (= (and b!882217 (not c!93212)) b!882224))

(assert (= (and b!882218 res!599091) b!882223))

(assert (= (and b!882224 c!93211) b!882216))

(assert (= (and b!882224 (not c!93211)) b!882215))

(declare-fun b_lambda!12537 () Bool)

(assert (=> (not b_lambda!12537) (not b!882223)))

(assert (=> b!882223 t!24637))

(declare-fun b_and!25391 () Bool)

(assert (= b_and!25389 (and (=> t!24637 result!9657) b_and!25391)))

(declare-fun b_lambda!12539 () Bool)

(assert (=> (not b_lambda!12539) (not b!882225)))

(assert (=> b!882225 t!24637))

(declare-fun b_and!25393 () Bool)

(assert (= b_and!25391 (and (=> t!24637 result!9657) b_and!25393)))

(assert (=> b!882222 m!822219))

(assert (=> b!882222 m!822219))

(assert (=> b!882222 m!822229))

(assert (=> b!882223 m!822219))

(declare-fun m!822471 () Bool)

(assert (=> b!882223 m!822471))

(assert (=> b!882223 m!822213))

(assert (=> b!882223 m!822215))

(assert (=> b!882223 m!822217))

(assert (=> b!882223 m!822213))

(assert (=> b!882223 m!822219))

(assert (=> b!882223 m!822215))

(declare-fun m!822473 () Bool)

(assert (=> b!882216 m!822473))

(declare-fun m!822475 () Bool)

(assert (=> b!882225 m!822475))

(declare-fun m!822477 () Bool)

(assert (=> b!882225 m!822477))

(assert (=> b!882225 m!822213))

(assert (=> b!882225 m!822215))

(assert (=> b!882225 m!822217))

(declare-fun m!822479 () Bool)

(assert (=> b!882225 m!822479))

(assert (=> b!882225 m!822477))

(declare-fun m!822481 () Bool)

(assert (=> b!882225 m!822481))

(assert (=> b!882225 m!822213))

(assert (=> b!882225 m!822219))

(assert (=> b!882225 m!822215))

(assert (=> b!882218 m!822219))

(assert (=> b!882218 m!822219))

(declare-fun m!822483 () Bool)

(assert (=> b!882218 m!822483))

(assert (=> bm!38969 m!822473))

(assert (=> b!882221 m!822219))

(assert (=> b!882221 m!822219))

(assert (=> b!882221 m!822229))

(declare-fun m!822485 () Bool)

(assert (=> b!882219 m!822485))

(declare-fun m!822487 () Bool)

(assert (=> b!882215 m!822487))

(declare-fun m!822489 () Bool)

(assert (=> d!109359 m!822489))

(assert (=> d!109359 m!822221))

(assert (=> b!882005 d!109359))

(declare-fun d!109361 () Bool)

(declare-fun res!599096 () Bool)

(declare-fun e!491048 () Bool)

(assert (=> d!109361 (=> res!599096 e!491048)))

(assert (=> d!109361 (= res!599096 (= (select (arr!24705 _keys!868) i!612) k0!854))))

(assert (=> d!109361 (= (arrayContainsKey!0 _keys!868 k0!854 i!612) e!491048)))

(declare-fun b!882231 () Bool)

(declare-fun e!491049 () Bool)

(assert (=> b!882231 (= e!491048 e!491049)))

(declare-fun res!599097 () Bool)

(assert (=> b!882231 (=> (not res!599097) (not e!491049))))

(assert (=> b!882231 (= res!599097 (bvslt (bvadd i!612 #b00000000000000000000000000000001) (size!25146 _keys!868)))))

(declare-fun b!882232 () Bool)

(assert (=> b!882232 (= e!491049 (arrayContainsKey!0 _keys!868 k0!854 (bvadd i!612 #b00000000000000000000000000000001)))))

(assert (= (and d!109361 (not res!599096)) b!882231))

(assert (= (and b!882231 res!599097) b!882232))

(assert (=> d!109361 m!822205))

(declare-fun m!822491 () Bool)

(assert (=> b!882232 m!822491))

(assert (=> b!882006 d!109361))

(declare-fun d!109363 () Bool)

(assert (=> d!109363 (= (array_inv!19500 _keys!868) (bvsge (size!25146 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74902 d!109363))

(declare-fun d!109365 () Bool)

(assert (=> d!109365 (= (array_inv!19501 _values!688) (bvsge (size!25147 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74902 d!109365))

(declare-fun b!882233 () Bool)

(declare-fun e!491050 () Bool)

(assert (=> b!882233 (= e!491050 (contains!4238 Nil!17480 (select (arr!24705 _keys!868) from!1053)))))

(declare-fun b!882234 () Bool)

(declare-fun e!491053 () Bool)

(declare-fun call!38973 () Bool)

(assert (=> b!882234 (= e!491053 call!38973)))

(declare-fun c!93214 () Bool)

(declare-fun bm!38970 () Bool)

(assert (=> bm!38970 (= call!38973 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93214 (Cons!17479 (select (arr!24705 _keys!868) from!1053) Nil!17480) Nil!17480)))))

(declare-fun b!882236 () Bool)

(assert (=> b!882236 (= e!491053 call!38973)))

(declare-fun b!882237 () Bool)

(declare-fun e!491052 () Bool)

(assert (=> b!882237 (= e!491052 e!491053)))

(assert (=> b!882237 (= c!93214 (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053)))))

(declare-fun d!109367 () Bool)

(declare-fun res!599098 () Bool)

(declare-fun e!491051 () Bool)

(assert (=> d!109367 (=> res!599098 e!491051)))

(assert (=> d!109367 (= res!599098 (bvsge from!1053 (size!25146 _keys!868)))))

(assert (=> d!109367 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17480) e!491051)))

(declare-fun b!882235 () Bool)

(assert (=> b!882235 (= e!491051 e!491052)))

(declare-fun res!599100 () Bool)

(assert (=> b!882235 (=> (not res!599100) (not e!491052))))

(assert (=> b!882235 (= res!599100 (not e!491050))))

(declare-fun res!599099 () Bool)

(assert (=> b!882235 (=> (not res!599099) (not e!491050))))

(assert (=> b!882235 (= res!599099 (validKeyInArray!0 (select (arr!24705 _keys!868) from!1053)))))

(assert (= (and d!109367 (not res!599098)) b!882235))

(assert (= (and b!882235 res!599099) b!882233))

(assert (= (and b!882235 res!599100) b!882237))

(assert (= (and b!882237 c!93214) b!882236))

(assert (= (and b!882237 (not c!93214)) b!882234))

(assert (= (or b!882236 b!882234) bm!38970))

(assert (=> b!882233 m!822219))

(assert (=> b!882233 m!822219))

(declare-fun m!822493 () Bool)

(assert (=> b!882233 m!822493))

(assert (=> bm!38970 m!822219))

(declare-fun m!822495 () Bool)

(assert (=> bm!38970 m!822495))

(assert (=> b!882237 m!822219))

(assert (=> b!882237 m!822219))

(assert (=> b!882237 m!822229))

(assert (=> b!882235 m!822219))

(assert (=> b!882235 m!822219))

(assert (=> b!882235 m!822229))

(assert (=> b!881999 d!109367))

(declare-fun d!109369 () Bool)

(assert (=> d!109369 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17480)))

(declare-fun lt!398963 () Unit!30052)

(declare-fun choose!39 (array!51373 (_ BitVec 32) (_ BitVec 32)) Unit!30052)

(assert (=> d!109369 (= lt!398963 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109369 (bvslt (size!25146 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109369 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398963)))

(declare-fun bs!24734 () Bool)

(assert (= bs!24734 d!109369))

(assert (=> bs!24734 m!822243))

(declare-fun m!822497 () Bool)

(assert (=> bs!24734 m!822497))

(assert (=> b!881999 d!109369))

(declare-fun b!882245 () Bool)

(declare-fun e!491058 () Bool)

(assert (=> b!882245 (= e!491058 tp_is_empty!17605)))

(declare-fun mapNonEmpty!28041 () Bool)

(declare-fun mapRes!28041 () Bool)

(declare-fun tp!53790 () Bool)

(declare-fun e!491059 () Bool)

(assert (=> mapNonEmpty!28041 (= mapRes!28041 (and tp!53790 e!491059))))

(declare-fun mapKey!28041 () (_ BitVec 32))

(declare-fun mapRest!28041 () (Array (_ BitVec 32) ValueCell!8363))

(declare-fun mapValue!28041 () ValueCell!8363)

(assert (=> mapNonEmpty!28041 (= mapRest!28032 (store mapRest!28041 mapKey!28041 mapValue!28041))))

(declare-fun mapIsEmpty!28041 () Bool)

(assert (=> mapIsEmpty!28041 mapRes!28041))

(declare-fun b!882244 () Bool)

(assert (=> b!882244 (= e!491059 tp_is_empty!17605)))

(declare-fun condMapEmpty!28041 () Bool)

(declare-fun mapDefault!28041 () ValueCell!8363)

(assert (=> mapNonEmpty!28032 (= condMapEmpty!28041 (= mapRest!28032 ((as const (Array (_ BitVec 32) ValueCell!8363)) mapDefault!28041)))))

(assert (=> mapNonEmpty!28032 (= tp!53774 (and e!491058 mapRes!28041))))

(assert (= (and mapNonEmpty!28032 condMapEmpty!28041) mapIsEmpty!28041))

(assert (= (and mapNonEmpty!28032 (not condMapEmpty!28041)) mapNonEmpty!28041))

(assert (= (and mapNonEmpty!28041 ((_ is ValueCellFull!8363) mapValue!28041)) b!882244))

(assert (= (and mapNonEmpty!28032 ((_ is ValueCellFull!8363) mapDefault!28041)) b!882245))

(declare-fun m!822499 () Bool)

(assert (=> mapNonEmpty!28041 m!822499))

(declare-fun b_lambda!12541 () Bool)

(assert (= b_lambda!12527 (or (and start!74902 b_free!15361) b_lambda!12541)))

(declare-fun b_lambda!12543 () Bool)

(assert (= b_lambda!12531 (or (and start!74902 b_free!15361) b_lambda!12543)))

(declare-fun b_lambda!12545 () Bool)

(assert (= b_lambda!12535 (or (and start!74902 b_free!15361) b_lambda!12545)))

(declare-fun b_lambda!12547 () Bool)

(assert (= b_lambda!12537 (or (and start!74902 b_free!15361) b_lambda!12547)))

(declare-fun b_lambda!12549 () Bool)

(assert (= b_lambda!12539 (or (and start!74902 b_free!15361) b_lambda!12549)))

(declare-fun b_lambda!12551 () Bool)

(assert (= b_lambda!12533 (or (and start!74902 b_free!15361) b_lambda!12551)))

(declare-fun b_lambda!12553 () Bool)

(assert (= b_lambda!12529 (or (and start!74902 b_free!15361) b_lambda!12553)))

(declare-fun b_lambda!12555 () Bool)

(assert (= b_lambda!12525 (or (and start!74902 b_free!15361) b_lambda!12555)))

(check-sat (not b!882211) (not d!109339) (not b!882210) (not d!109351) (not b_lambda!12549) (not d!109353) (not b!882237) (not b!882201) (not b!882189) (not b!882186) (not b!882171) (not bm!38970) (not bm!38960) (not b!882215) (not b!882191) (not bm!38968) (not d!109357) (not b!882209) (not b!882223) (not b!882129) (not d!109369) (not b!882203) (not b!882216) (not b!882143) (not bm!38966) (not b!882195) (not b!882206) (not b!882221) (not b_lambda!12553) (not d!109359) (not b!882136) (not b!882168) (not b!882232) (not d!109345) (not b!882176) (not b!882119) (not b!882235) (not mapNonEmpty!28041) (not b_lambda!12555) (not b!882213) (not b!882190) (not b!882115) (not b_lambda!12551) (not b!882197) (not b!882225) (not b_lambda!12543) (not bm!38967) (not bm!38969) (not bm!38957) (not b!882137) (not b!882222) (not b!882207) (not b!882142) (not b_next!15361) (not b_lambda!12523) (not bm!38965) (not b!882198) (not b_lambda!12547) (not b!882172) (not b!882199) (not b!882233) (not b_lambda!12545) (not bm!38954) (not b!882128) (not d!109349) (not b!882204) (not b!882117) (not b_lambda!12541) (not b!882178) (not b!882192) (not b!882169) b_and!25393 (not b!882194) (not b!882219) (not b!882218) (not b!882174) tp_is_empty!17605 (not b!882175))
(check-sat b_and!25393 (not b_next!15361))
