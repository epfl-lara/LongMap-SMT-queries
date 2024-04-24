; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74374 () Bool)

(assert start!74374)

(declare-fun b_free!15013 () Bool)

(declare-fun b_next!15013 () Bool)

(assert (=> start!74374 (= b_free!15013 (not b_next!15013))))

(declare-fun tp!52690 () Bool)

(declare-fun b_and!24775 () Bool)

(assert (=> start!74374 (= tp!52690 b_and!24775)))

(declare-fun res!593655 () Bool)

(declare-fun e!486743 () Bool)

(assert (=> start!74374 (=> (not res!593655) (not e!486743))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50669 0))(
  ( (array!50670 (arr!24360 (Array (_ BitVec 32) (_ BitVec 64))) (size!24801 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50669)

(assert (=> start!74374 (= res!593655 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24801 _keys!868))))))

(assert (=> start!74374 e!486743))

(declare-fun tp_is_empty!17245 () Bool)

(assert (=> start!74374 tp_is_empty!17245))

(assert (=> start!74374 true))

(assert (=> start!74374 tp!52690))

(declare-fun array_inv!19272 (array!50669) Bool)

(assert (=> start!74374 (array_inv!19272 _keys!868)))

(declare-datatypes ((V!28041 0))(
  ( (V!28042 (val!8670 Int)) )
))
(declare-datatypes ((ValueCell!8183 0))(
  ( (ValueCellFull!8183 (v!11095 V!28041)) (EmptyCell!8183) )
))
(declare-datatypes ((array!50671 0))(
  ( (array!50672 (arr!24361 (Array (_ BitVec 32) ValueCell!8183)) (size!24802 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50671)

(declare-fun e!486745 () Bool)

(declare-fun array_inv!19273 (array!50671) Bool)

(assert (=> start!74374 (and (array_inv!19273 _values!688) e!486745)))

(declare-fun b!873916 () Bool)

(declare-fun res!593650 () Bool)

(assert (=> b!873916 (=> (not res!593650) (not e!486743))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!873916 (= res!593650 (and (= (select (arr!24360 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!873917 () Bool)

(declare-fun v!557 () V!28041)

(declare-datatypes ((tuple2!11388 0))(
  ( (tuple2!11389 (_1!5705 (_ BitVec 64)) (_2!5705 V!28041)) )
))
(declare-datatypes ((List!17231 0))(
  ( (Nil!17228) (Cons!17227 (h!18364 tuple2!11388) (t!24260 List!17231)) )
))
(declare-datatypes ((ListLongMap!10159 0))(
  ( (ListLongMap!10160 (toList!5095 List!17231)) )
))
(declare-fun call!38552 () ListLongMap!10159)

(declare-fun call!38551 () ListLongMap!10159)

(declare-fun e!486748 () Bool)

(declare-fun +!2479 (ListLongMap!10159 tuple2!11388) ListLongMap!10159)

(assert (=> b!873917 (= e!486748 (= call!38552 (+!2479 call!38551 (tuple2!11389 k0!854 v!557))))))

(declare-fun b!873918 () Bool)

(declare-fun e!486746 () Bool)

(declare-fun mapRes!27470 () Bool)

(assert (=> b!873918 (= e!486745 (and e!486746 mapRes!27470))))

(declare-fun condMapEmpty!27470 () Bool)

(declare-fun mapDefault!27470 () ValueCell!8183)

(assert (=> b!873918 (= condMapEmpty!27470 (= (arr!24361 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8183)) mapDefault!27470)))))

(declare-fun b!873919 () Bool)

(assert (=> b!873919 (= e!486748 (= call!38552 call!38551))))

(declare-fun mapNonEmpty!27470 () Bool)

(declare-fun tp!52691 () Bool)

(declare-fun e!486744 () Bool)

(assert (=> mapNonEmpty!27470 (= mapRes!27470 (and tp!52691 e!486744))))

(declare-fun mapKey!27470 () (_ BitVec 32))

(declare-fun mapValue!27470 () ValueCell!8183)

(declare-fun mapRest!27470 () (Array (_ BitVec 32) ValueCell!8183))

(assert (=> mapNonEmpty!27470 (= (arr!24361 _values!688) (store mapRest!27470 mapKey!27470 mapValue!27470))))

(declare-fun b!873920 () Bool)

(declare-fun res!593654 () Bool)

(assert (=> b!873920 (=> (not res!593654) (not e!486743))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50669 (_ BitVec 32)) Bool)

(assert (=> b!873920 (= res!593654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873921 () Bool)

(declare-fun res!593649 () Bool)

(assert (=> b!873921 (=> (not res!593649) (not e!486743))))

(assert (=> b!873921 (= res!593649 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24801 _keys!868))))))

(declare-fun b!873922 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28041)

(declare-fun zeroValue!654 () V!28041)

(declare-fun getCurrentListMapNoExtraKeys!3138 (array!50669 array!50671 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) Int) ListLongMap!10159)

(assert (=> b!873922 (= e!486743 (not (= (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(assert (=> b!873922 e!486748))

(declare-fun c!92695 () Bool)

(assert (=> b!873922 (= c!92695 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29906 0))(
  ( (Unit!29907) )
))
(declare-fun lt!396035 () Unit!29906)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!648 (array!50669 array!50671 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) (_ BitVec 64) V!28041 (_ BitVec 32) Int) Unit!29906)

(assert (=> b!873922 (= lt!396035 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!648 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873923 () Bool)

(assert (=> b!873923 (= e!486746 tp_is_empty!17245)))

(declare-fun b!873924 () Bool)

(declare-fun res!593651 () Bool)

(assert (=> b!873924 (=> (not res!593651) (not e!486743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873924 (= res!593651 (validKeyInArray!0 k0!854))))

(declare-fun b!873925 () Bool)

(declare-fun res!593656 () Bool)

(assert (=> b!873925 (=> (not res!593656) (not e!486743))))

(assert (=> b!873925 (= res!593656 (and (= (size!24802 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24801 _keys!868) (size!24802 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27470 () Bool)

(assert (=> mapIsEmpty!27470 mapRes!27470))

(declare-fun b!873926 () Bool)

(assert (=> b!873926 (= e!486744 tp_is_empty!17245)))

(declare-fun bm!38548 () Bool)

(assert (=> bm!38548 (= call!38551 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38549 () Bool)

(assert (=> bm!38549 (= call!38552 (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873927 () Bool)

(declare-fun res!593652 () Bool)

(assert (=> b!873927 (=> (not res!593652) (not e!486743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873927 (= res!593652 (validMask!0 mask!1196))))

(declare-fun b!873928 () Bool)

(declare-fun res!593653 () Bool)

(assert (=> b!873928 (=> (not res!593653) (not e!486743))))

(declare-datatypes ((List!17232 0))(
  ( (Nil!17229) (Cons!17228 (h!18365 (_ BitVec 64)) (t!24261 List!17232)) )
))
(declare-fun arrayNoDuplicates!0 (array!50669 (_ BitVec 32) List!17232) Bool)

(assert (=> b!873928 (= res!593653 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17229))))

(assert (= (and start!74374 res!593655) b!873927))

(assert (= (and b!873927 res!593652) b!873925))

(assert (= (and b!873925 res!593656) b!873920))

(assert (= (and b!873920 res!593654) b!873928))

(assert (= (and b!873928 res!593653) b!873921))

(assert (= (and b!873921 res!593649) b!873924))

(assert (= (and b!873924 res!593651) b!873916))

(assert (= (and b!873916 res!593650) b!873922))

(assert (= (and b!873922 c!92695) b!873917))

(assert (= (and b!873922 (not c!92695)) b!873919))

(assert (= (or b!873917 b!873919) bm!38549))

(assert (= (or b!873917 b!873919) bm!38548))

(assert (= (and b!873918 condMapEmpty!27470) mapIsEmpty!27470))

(assert (= (and b!873918 (not condMapEmpty!27470)) mapNonEmpty!27470))

(get-info :version)

(assert (= (and mapNonEmpty!27470 ((_ is ValueCellFull!8183) mapValue!27470)) b!873926))

(assert (= (and b!873918 ((_ is ValueCellFull!8183) mapDefault!27470)) b!873923))

(assert (= start!74374 b!873918))

(declare-fun m!814889 () Bool)

(assert (=> b!873928 m!814889))

(declare-fun m!814891 () Bool)

(assert (=> b!873927 m!814891))

(declare-fun m!814893 () Bool)

(assert (=> b!873917 m!814893))

(declare-fun m!814895 () Bool)

(assert (=> mapNonEmpty!27470 m!814895))

(declare-fun m!814897 () Bool)

(assert (=> bm!38548 m!814897))

(declare-fun m!814899 () Bool)

(assert (=> start!74374 m!814899))

(declare-fun m!814901 () Bool)

(assert (=> start!74374 m!814901))

(declare-fun m!814903 () Bool)

(assert (=> b!873916 m!814903))

(declare-fun m!814905 () Bool)

(assert (=> b!873922 m!814905))

(declare-fun m!814907 () Bool)

(assert (=> b!873922 m!814907))

(declare-fun m!814909 () Bool)

(assert (=> b!873922 m!814909))

(declare-fun m!814911 () Bool)

(assert (=> b!873922 m!814911))

(declare-fun m!814913 () Bool)

(assert (=> b!873920 m!814913))

(declare-fun m!814915 () Bool)

(assert (=> b!873924 m!814915))

(assert (=> bm!38549 m!814905))

(declare-fun m!814917 () Bool)

(assert (=> bm!38549 m!814917))

(check-sat (not b!873924) tp_is_empty!17245 (not mapNonEmpty!27470) (not b_next!15013) (not b!873922) b_and!24775 (not b!873917) (not b!873920) (not b!873928) (not start!74374) (not bm!38548) (not b!873927) (not bm!38549))
(check-sat b_and!24775 (not b_next!15013))
(get-model)

(declare-fun b!874031 () Bool)

(declare-fun e!486799 () Bool)

(declare-fun e!486801 () Bool)

(assert (=> b!874031 (= e!486799 e!486801)))

(declare-fun c!92711 () Bool)

(assert (=> b!874031 (= c!92711 (bvslt from!1053 (size!24801 _keys!868)))))

(declare-fun call!38567 () ListLongMap!10159)

(declare-fun bm!38564 () Bool)

(assert (=> bm!38564 (= call!38567 (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!874033 () Bool)

(declare-fun lt!396061 () ListLongMap!10159)

(assert (=> b!874033 (= e!486801 (= lt!396061 (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!874034 () Bool)

(declare-fun e!486803 () Bool)

(assert (=> b!874034 (= e!486803 (validKeyInArray!0 (select (arr!24360 _keys!868) from!1053)))))

(assert (=> b!874034 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!874035 () Bool)

(assert (=> b!874035 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24801 _keys!868)))))

(assert (=> b!874035 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24802 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)))))))

(declare-fun e!486802 () Bool)

(declare-fun apply!374 (ListLongMap!10159 (_ BitVec 64)) V!28041)

(declare-fun get!12845 (ValueCell!8183 V!28041) V!28041)

(declare-fun dynLambda!1225 (Int (_ BitVec 64)) V!28041)

(assert (=> b!874035 (= e!486802 (= (apply!374 lt!396061 (select (arr!24360 _keys!868) from!1053)) (get!12845 (select (arr!24361 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688))) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!874036 () Bool)

(declare-fun e!486804 () Bool)

(assert (=> b!874036 (= e!486804 e!486799)))

(declare-fun c!92713 () Bool)

(assert (=> b!874036 (= c!92713 e!486803)))

(declare-fun res!593714 () Bool)

(assert (=> b!874036 (=> (not res!593714) (not e!486803))))

(assert (=> b!874036 (= res!593714 (bvslt from!1053 (size!24801 _keys!868)))))

(declare-fun b!874037 () Bool)

(declare-fun e!486800 () ListLongMap!10159)

(assert (=> b!874037 (= e!486800 call!38567)))

(declare-fun b!874038 () Bool)

(declare-fun lt!396058 () Unit!29906)

(declare-fun lt!396059 () Unit!29906)

(assert (=> b!874038 (= lt!396058 lt!396059)))

(declare-fun lt!396062 () (_ BitVec 64))

(declare-fun lt!396060 () ListLongMap!10159)

(declare-fun lt!396056 () V!28041)

(declare-fun lt!396057 () (_ BitVec 64))

(declare-fun contains!4218 (ListLongMap!10159 (_ BitVec 64)) Bool)

(assert (=> b!874038 (not (contains!4218 (+!2479 lt!396060 (tuple2!11389 lt!396057 lt!396056)) lt!396062))))

(declare-fun addStillNotContains!201 (ListLongMap!10159 (_ BitVec 64) V!28041 (_ BitVec 64)) Unit!29906)

(assert (=> b!874038 (= lt!396059 (addStillNotContains!201 lt!396060 lt!396057 lt!396056 lt!396062))))

(assert (=> b!874038 (= lt!396062 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!874038 (= lt!396056 (get!12845 (select (arr!24361 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688))) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!874038 (= lt!396057 (select (arr!24360 _keys!868) from!1053))))

(assert (=> b!874038 (= lt!396060 call!38567)))

(assert (=> b!874038 (= e!486800 (+!2479 call!38567 (tuple2!11389 (select (arr!24360 _keys!868) from!1053) (get!12845 (select (arr!24361 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688))) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!874039 () Bool)

(assert (=> b!874039 (= e!486799 e!486802)))

(assert (=> b!874039 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24801 _keys!868)))))

(declare-fun res!593716 () Bool)

(assert (=> b!874039 (= res!593716 (contains!4218 lt!396061 (select (arr!24360 _keys!868) from!1053)))))

(assert (=> b!874039 (=> (not res!593716) (not e!486802))))

(declare-fun b!874040 () Bool)

(declare-fun isEmpty!666 (ListLongMap!10159) Bool)

(assert (=> b!874040 (= e!486801 (isEmpty!666 lt!396061))))

(declare-fun b!874041 () Bool)

(declare-fun e!486805 () ListLongMap!10159)

(assert (=> b!874041 (= e!486805 e!486800)))

(declare-fun c!92712 () Bool)

(assert (=> b!874041 (= c!92712 (validKeyInArray!0 (select (arr!24360 _keys!868) from!1053)))))

(declare-fun b!874042 () Bool)

(declare-fun res!593715 () Bool)

(assert (=> b!874042 (=> (not res!593715) (not e!486804))))

(assert (=> b!874042 (= res!593715 (not (contains!4218 lt!396061 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!108813 () Bool)

(assert (=> d!108813 e!486804))

(declare-fun res!593713 () Bool)

(assert (=> d!108813 (=> (not res!593713) (not e!486804))))

(assert (=> d!108813 (= res!593713 (not (contains!4218 lt!396061 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108813 (= lt!396061 e!486805)))

(declare-fun c!92710 () Bool)

(assert (=> d!108813 (= c!92710 (bvsge from!1053 (size!24801 _keys!868)))))

(assert (=> d!108813 (validMask!0 mask!1196)))

(assert (=> d!108813 (= (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396061)))

(declare-fun b!874032 () Bool)

(assert (=> b!874032 (= e!486805 (ListLongMap!10160 Nil!17228))))

(assert (= (and d!108813 c!92710) b!874032))

(assert (= (and d!108813 (not c!92710)) b!874041))

(assert (= (and b!874041 c!92712) b!874038))

(assert (= (and b!874041 (not c!92712)) b!874037))

(assert (= (or b!874038 b!874037) bm!38564))

(assert (= (and d!108813 res!593713) b!874042))

(assert (= (and b!874042 res!593715) b!874036))

(assert (= (and b!874036 res!593714) b!874034))

(assert (= (and b!874036 c!92713) b!874039))

(assert (= (and b!874036 (not c!92713)) b!874031))

(assert (= (and b!874039 res!593716) b!874035))

(assert (= (and b!874031 c!92711) b!874033))

(assert (= (and b!874031 (not c!92711)) b!874040))

(declare-fun b_lambda!12139 () Bool)

(assert (=> (not b_lambda!12139) (not b!874035)))

(declare-fun t!24266 () Bool)

(declare-fun tb!4887 () Bool)

(assert (=> (and start!74374 (= defaultEntry!696 defaultEntry!696) t!24266) tb!4887))

(declare-fun result!9395 () Bool)

(assert (=> tb!4887 (= result!9395 tp_is_empty!17245)))

(assert (=> b!874035 t!24266))

(declare-fun b_and!24781 () Bool)

(assert (= b_and!24775 (and (=> t!24266 result!9395) b_and!24781)))

(declare-fun b_lambda!12141 () Bool)

(assert (=> (not b_lambda!12141) (not b!874038)))

(assert (=> b!874038 t!24266))

(declare-fun b_and!24783 () Bool)

(assert (= b_and!24781 (and (=> t!24266 result!9395) b_and!24783)))

(declare-fun m!814979 () Bool)

(assert (=> b!874041 m!814979))

(assert (=> b!874041 m!814979))

(declare-fun m!814981 () Bool)

(assert (=> b!874041 m!814981))

(declare-fun m!814983 () Bool)

(assert (=> b!874038 m!814983))

(assert (=> b!874038 m!814983))

(declare-fun m!814985 () Bool)

(assert (=> b!874038 m!814985))

(declare-fun m!814987 () Bool)

(assert (=> b!874038 m!814987))

(assert (=> b!874038 m!814985))

(declare-fun m!814989 () Bool)

(assert (=> b!874038 m!814989))

(declare-fun m!814991 () Bool)

(assert (=> b!874038 m!814991))

(assert (=> b!874038 m!814989))

(declare-fun m!814993 () Bool)

(assert (=> b!874038 m!814993))

(declare-fun m!814995 () Bool)

(assert (=> b!874038 m!814995))

(assert (=> b!874038 m!814979))

(declare-fun m!814997 () Bool)

(assert (=> b!874040 m!814997))

(declare-fun m!814999 () Bool)

(assert (=> bm!38564 m!814999))

(declare-fun m!815001 () Bool)

(assert (=> b!874042 m!815001))

(assert (=> b!874033 m!814999))

(assert (=> b!874035 m!814983))

(assert (=> b!874035 m!814979))

(declare-fun m!815003 () Bool)

(assert (=> b!874035 m!815003))

(assert (=> b!874035 m!814983))

(assert (=> b!874035 m!814985))

(assert (=> b!874035 m!814987))

(assert (=> b!874035 m!814985))

(assert (=> b!874035 m!814979))

(declare-fun m!815005 () Bool)

(assert (=> d!108813 m!815005))

(assert (=> d!108813 m!814891))

(assert (=> b!874039 m!814979))

(assert (=> b!874039 m!814979))

(declare-fun m!815007 () Bool)

(assert (=> b!874039 m!815007))

(assert (=> b!874034 m!814979))

(assert (=> b!874034 m!814979))

(assert (=> b!874034 m!814981))

(assert (=> b!873922 d!108813))

(declare-fun b!874045 () Bool)

(declare-fun e!486806 () Bool)

(declare-fun e!486808 () Bool)

(assert (=> b!874045 (= e!486806 e!486808)))

(declare-fun c!92715 () Bool)

(assert (=> b!874045 (= c!92715 (bvslt from!1053 (size!24801 _keys!868)))))

(declare-fun call!38568 () ListLongMap!10159)

(declare-fun bm!38565 () Bool)

(assert (=> bm!38565 (= call!38568 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!874047 () Bool)

(declare-fun lt!396068 () ListLongMap!10159)

(assert (=> b!874047 (= e!486808 (= lt!396068 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!874048 () Bool)

(declare-fun e!486810 () Bool)

(assert (=> b!874048 (= e!486810 (validKeyInArray!0 (select (arr!24360 _keys!868) from!1053)))))

(assert (=> b!874048 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!874049 () Bool)

(assert (=> b!874049 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24801 _keys!868)))))

(assert (=> b!874049 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24802 _values!688)))))

(declare-fun e!486809 () Bool)

(assert (=> b!874049 (= e!486809 (= (apply!374 lt!396068 (select (arr!24360 _keys!868) from!1053)) (get!12845 (select (arr!24361 _values!688) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!874050 () Bool)

(declare-fun e!486811 () Bool)

(assert (=> b!874050 (= e!486811 e!486806)))

(declare-fun c!92717 () Bool)

(assert (=> b!874050 (= c!92717 e!486810)))

(declare-fun res!593718 () Bool)

(assert (=> b!874050 (=> (not res!593718) (not e!486810))))

(assert (=> b!874050 (= res!593718 (bvslt from!1053 (size!24801 _keys!868)))))

(declare-fun b!874051 () Bool)

(declare-fun e!486807 () ListLongMap!10159)

(assert (=> b!874051 (= e!486807 call!38568)))

(declare-fun b!874052 () Bool)

(declare-fun lt!396065 () Unit!29906)

(declare-fun lt!396066 () Unit!29906)

(assert (=> b!874052 (= lt!396065 lt!396066)))

(declare-fun lt!396067 () ListLongMap!10159)

(declare-fun lt!396069 () (_ BitVec 64))

(declare-fun lt!396063 () V!28041)

(declare-fun lt!396064 () (_ BitVec 64))

(assert (=> b!874052 (not (contains!4218 (+!2479 lt!396067 (tuple2!11389 lt!396064 lt!396063)) lt!396069))))

(assert (=> b!874052 (= lt!396066 (addStillNotContains!201 lt!396067 lt!396064 lt!396063 lt!396069))))

(assert (=> b!874052 (= lt!396069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!874052 (= lt!396063 (get!12845 (select (arr!24361 _values!688) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!874052 (= lt!396064 (select (arr!24360 _keys!868) from!1053))))

(assert (=> b!874052 (= lt!396067 call!38568)))

(assert (=> b!874052 (= e!486807 (+!2479 call!38568 (tuple2!11389 (select (arr!24360 _keys!868) from!1053) (get!12845 (select (arr!24361 _values!688) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!874053 () Bool)

(assert (=> b!874053 (= e!486806 e!486809)))

(assert (=> b!874053 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24801 _keys!868)))))

(declare-fun res!593720 () Bool)

(assert (=> b!874053 (= res!593720 (contains!4218 lt!396068 (select (arr!24360 _keys!868) from!1053)))))

(assert (=> b!874053 (=> (not res!593720) (not e!486809))))

(declare-fun b!874054 () Bool)

(assert (=> b!874054 (= e!486808 (isEmpty!666 lt!396068))))

(declare-fun b!874055 () Bool)

(declare-fun e!486812 () ListLongMap!10159)

(assert (=> b!874055 (= e!486812 e!486807)))

(declare-fun c!92716 () Bool)

(assert (=> b!874055 (= c!92716 (validKeyInArray!0 (select (arr!24360 _keys!868) from!1053)))))

(declare-fun b!874056 () Bool)

(declare-fun res!593719 () Bool)

(assert (=> b!874056 (=> (not res!593719) (not e!486811))))

(assert (=> b!874056 (= res!593719 (not (contains!4218 lt!396068 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!108815 () Bool)

(assert (=> d!108815 e!486811))

(declare-fun res!593717 () Bool)

(assert (=> d!108815 (=> (not res!593717) (not e!486811))))

(assert (=> d!108815 (= res!593717 (not (contains!4218 lt!396068 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108815 (= lt!396068 e!486812)))

(declare-fun c!92714 () Bool)

(assert (=> d!108815 (= c!92714 (bvsge from!1053 (size!24801 _keys!868)))))

(assert (=> d!108815 (validMask!0 mask!1196)))

(assert (=> d!108815 (= (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396068)))

(declare-fun b!874046 () Bool)

(assert (=> b!874046 (= e!486812 (ListLongMap!10160 Nil!17228))))

(assert (= (and d!108815 c!92714) b!874046))

(assert (= (and d!108815 (not c!92714)) b!874055))

(assert (= (and b!874055 c!92716) b!874052))

(assert (= (and b!874055 (not c!92716)) b!874051))

(assert (= (or b!874052 b!874051) bm!38565))

(assert (= (and d!108815 res!593717) b!874056))

(assert (= (and b!874056 res!593719) b!874050))

(assert (= (and b!874050 res!593718) b!874048))

(assert (= (and b!874050 c!92717) b!874053))

(assert (= (and b!874050 (not c!92717)) b!874045))

(assert (= (and b!874053 res!593720) b!874049))

(assert (= (and b!874045 c!92715) b!874047))

(assert (= (and b!874045 (not c!92715)) b!874054))

(declare-fun b_lambda!12143 () Bool)

(assert (=> (not b_lambda!12143) (not b!874049)))

(assert (=> b!874049 t!24266))

(declare-fun b_and!24785 () Bool)

(assert (= b_and!24783 (and (=> t!24266 result!9395) b_and!24785)))

(declare-fun b_lambda!12145 () Bool)

(assert (=> (not b_lambda!12145) (not b!874052)))

(assert (=> b!874052 t!24266))

(declare-fun b_and!24787 () Bool)

(assert (= b_and!24785 (and (=> t!24266 result!9395) b_and!24787)))

(assert (=> b!874055 m!814979))

(assert (=> b!874055 m!814979))

(assert (=> b!874055 m!814981))

(declare-fun m!815009 () Bool)

(assert (=> b!874052 m!815009))

(assert (=> b!874052 m!815009))

(assert (=> b!874052 m!814985))

(declare-fun m!815011 () Bool)

(assert (=> b!874052 m!815011))

(assert (=> b!874052 m!814985))

(declare-fun m!815013 () Bool)

(assert (=> b!874052 m!815013))

(declare-fun m!815015 () Bool)

(assert (=> b!874052 m!815015))

(assert (=> b!874052 m!815013))

(declare-fun m!815017 () Bool)

(assert (=> b!874052 m!815017))

(declare-fun m!815019 () Bool)

(assert (=> b!874052 m!815019))

(assert (=> b!874052 m!814979))

(declare-fun m!815021 () Bool)

(assert (=> b!874054 m!815021))

(declare-fun m!815023 () Bool)

(assert (=> bm!38565 m!815023))

(declare-fun m!815025 () Bool)

(assert (=> b!874056 m!815025))

(assert (=> b!874047 m!815023))

(assert (=> b!874049 m!815009))

(assert (=> b!874049 m!814979))

(declare-fun m!815027 () Bool)

(assert (=> b!874049 m!815027))

(assert (=> b!874049 m!815009))

(assert (=> b!874049 m!814985))

(assert (=> b!874049 m!815011))

(assert (=> b!874049 m!814985))

(assert (=> b!874049 m!814979))

(declare-fun m!815029 () Bool)

(assert (=> d!108815 m!815029))

(assert (=> d!108815 m!814891))

(assert (=> b!874053 m!814979))

(assert (=> b!874053 m!814979))

(declare-fun m!815031 () Bool)

(assert (=> b!874053 m!815031))

(assert (=> b!874048 m!814979))

(assert (=> b!874048 m!814979))

(assert (=> b!874048 m!814981))

(assert (=> b!873922 d!108815))

(declare-fun d!108817 () Bool)

(declare-fun e!486817 () Bool)

(assert (=> d!108817 e!486817))

(declare-fun res!593723 () Bool)

(assert (=> d!108817 (=> (not res!593723) (not e!486817))))

(assert (=> d!108817 (= res!593723 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24802 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24802 _values!688))))))))

(declare-fun lt!396072 () Unit!29906)

(declare-fun choose!1434 (array!50669 array!50671 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) (_ BitVec 64) V!28041 (_ BitVec 32) Int) Unit!29906)

(assert (=> d!108817 (= lt!396072 (choose!1434 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108817 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(assert (=> d!108817 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!648 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396072)))

(declare-fun b!874063 () Bool)

(declare-fun e!486818 () Bool)

(declare-fun call!38574 () ListLongMap!10159)

(declare-fun call!38573 () ListLongMap!10159)

(assert (=> b!874063 (= e!486818 (= call!38574 call!38573))))

(declare-fun bm!38570 () Bool)

(assert (=> bm!38570 (= call!38574 (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!874064 () Bool)

(assert (=> b!874064 (= e!486818 (= call!38574 (+!2479 call!38573 (tuple2!11389 k0!854 v!557))))))

(declare-fun b!874065 () Bool)

(assert (=> b!874065 (= e!486817 e!486818)))

(declare-fun c!92720 () Bool)

(assert (=> b!874065 (= c!92720 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!38571 () Bool)

(assert (=> bm!38571 (= call!38573 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108817 res!593723) b!874065))

(assert (= (and b!874065 c!92720) b!874064))

(assert (= (and b!874065 (not c!92720)) b!874063))

(assert (= (or b!874064 b!874063) bm!38571))

(assert (= (or b!874064 b!874063) bm!38570))

(declare-fun m!815033 () Bool)

(assert (=> d!108817 m!815033))

(assert (=> bm!38570 m!814905))

(assert (=> bm!38570 m!814917))

(declare-fun m!815035 () Bool)

(assert (=> b!874064 m!815035))

(assert (=> bm!38571 m!814897))

(assert (=> b!873922 d!108817))

(declare-fun d!108819 () Bool)

(declare-fun e!486821 () Bool)

(assert (=> d!108819 e!486821))

(declare-fun res!593729 () Bool)

(assert (=> d!108819 (=> (not res!593729) (not e!486821))))

(declare-fun lt!396084 () ListLongMap!10159)

(assert (=> d!108819 (= res!593729 (contains!4218 lt!396084 (_1!5705 (tuple2!11389 k0!854 v!557))))))

(declare-fun lt!396082 () List!17231)

(assert (=> d!108819 (= lt!396084 (ListLongMap!10160 lt!396082))))

(declare-fun lt!396083 () Unit!29906)

(declare-fun lt!396081 () Unit!29906)

(assert (=> d!108819 (= lt!396083 lt!396081)))

(declare-datatypes ((Option!424 0))(
  ( (Some!423 (v!11101 V!28041)) (None!422) )
))
(declare-fun getValueByKey!418 (List!17231 (_ BitVec 64)) Option!424)

(assert (=> d!108819 (= (getValueByKey!418 lt!396082 (_1!5705 (tuple2!11389 k0!854 v!557))) (Some!423 (_2!5705 (tuple2!11389 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!232 (List!17231 (_ BitVec 64) V!28041) Unit!29906)

(assert (=> d!108819 (= lt!396081 (lemmaContainsTupThenGetReturnValue!232 lt!396082 (_1!5705 (tuple2!11389 k0!854 v!557)) (_2!5705 (tuple2!11389 k0!854 v!557))))))

(declare-fun insertStrictlySorted!271 (List!17231 (_ BitVec 64) V!28041) List!17231)

(assert (=> d!108819 (= lt!396082 (insertStrictlySorted!271 (toList!5095 call!38551) (_1!5705 (tuple2!11389 k0!854 v!557)) (_2!5705 (tuple2!11389 k0!854 v!557))))))

(assert (=> d!108819 (= (+!2479 call!38551 (tuple2!11389 k0!854 v!557)) lt!396084)))

(declare-fun b!874070 () Bool)

(declare-fun res!593728 () Bool)

(assert (=> b!874070 (=> (not res!593728) (not e!486821))))

(assert (=> b!874070 (= res!593728 (= (getValueByKey!418 (toList!5095 lt!396084) (_1!5705 (tuple2!11389 k0!854 v!557))) (Some!423 (_2!5705 (tuple2!11389 k0!854 v!557)))))))

(declare-fun b!874071 () Bool)

(declare-fun contains!4219 (List!17231 tuple2!11388) Bool)

(assert (=> b!874071 (= e!486821 (contains!4219 (toList!5095 lt!396084) (tuple2!11389 k0!854 v!557)))))

(assert (= (and d!108819 res!593729) b!874070))

(assert (= (and b!874070 res!593728) b!874071))

(declare-fun m!815037 () Bool)

(assert (=> d!108819 m!815037))

(declare-fun m!815039 () Bool)

(assert (=> d!108819 m!815039))

(declare-fun m!815041 () Bool)

(assert (=> d!108819 m!815041))

(declare-fun m!815043 () Bool)

(assert (=> d!108819 m!815043))

(declare-fun m!815045 () Bool)

(assert (=> b!874070 m!815045))

(declare-fun m!815047 () Bool)

(assert (=> b!874071 m!815047))

(assert (=> b!873917 d!108819))

(declare-fun b!874080 () Bool)

(declare-fun e!486829 () Bool)

(declare-fun call!38577 () Bool)

(assert (=> b!874080 (= e!486829 call!38577)))

(declare-fun b!874081 () Bool)

(declare-fun e!486830 () Bool)

(assert (=> b!874081 (= e!486830 call!38577)))

(declare-fun b!874082 () Bool)

(declare-fun e!486828 () Bool)

(assert (=> b!874082 (= e!486828 e!486829)))

(declare-fun c!92723 () Bool)

(assert (=> b!874082 (= c!92723 (validKeyInArray!0 (select (arr!24360 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108821 () Bool)

(declare-fun res!593735 () Bool)

(assert (=> d!108821 (=> res!593735 e!486828)))

(assert (=> d!108821 (= res!593735 (bvsge #b00000000000000000000000000000000 (size!24801 _keys!868)))))

(assert (=> d!108821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!486828)))

(declare-fun b!874083 () Bool)

(assert (=> b!874083 (= e!486829 e!486830)))

(declare-fun lt!396092 () (_ BitVec 64))

(assert (=> b!874083 (= lt!396092 (select (arr!24360 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!396093 () Unit!29906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50669 (_ BitVec 64) (_ BitVec 32)) Unit!29906)

(assert (=> b!874083 (= lt!396093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396092 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!874083 (arrayContainsKey!0 _keys!868 lt!396092 #b00000000000000000000000000000000)))

(declare-fun lt!396091 () Unit!29906)

(assert (=> b!874083 (= lt!396091 lt!396093)))

(declare-fun res!593734 () Bool)

(declare-datatypes ((SeekEntryResult!8701 0))(
  ( (MissingZero!8701 (index!37175 (_ BitVec 32))) (Found!8701 (index!37176 (_ BitVec 32))) (Intermediate!8701 (undefined!9513 Bool) (index!37177 (_ BitVec 32)) (x!73947 (_ BitVec 32))) (Undefined!8701) (MissingVacant!8701 (index!37178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50669 (_ BitVec 32)) SeekEntryResult!8701)

(assert (=> b!874083 (= res!593734 (= (seekEntryOrOpen!0 (select (arr!24360 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8701 #b00000000000000000000000000000000)))))

(assert (=> b!874083 (=> (not res!593734) (not e!486830))))

(declare-fun bm!38574 () Bool)

(assert (=> bm!38574 (= call!38577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!108821 (not res!593735)) b!874082))

(assert (= (and b!874082 c!92723) b!874083))

(assert (= (and b!874082 (not c!92723)) b!874080))

(assert (= (and b!874083 res!593734) b!874081))

(assert (= (or b!874081 b!874080) bm!38574))

(declare-fun m!815049 () Bool)

(assert (=> b!874082 m!815049))

(assert (=> b!874082 m!815049))

(declare-fun m!815051 () Bool)

(assert (=> b!874082 m!815051))

(assert (=> b!874083 m!815049))

(declare-fun m!815053 () Bool)

(assert (=> b!874083 m!815053))

(declare-fun m!815055 () Bool)

(assert (=> b!874083 m!815055))

(assert (=> b!874083 m!815049))

(declare-fun m!815057 () Bool)

(assert (=> b!874083 m!815057))

(declare-fun m!815059 () Bool)

(assert (=> bm!38574 m!815059))

(assert (=> b!873920 d!108821))

(declare-fun b!874094 () Bool)

(declare-fun e!486840 () Bool)

(declare-fun call!38580 () Bool)

(assert (=> b!874094 (= e!486840 call!38580)))

(declare-fun b!874095 () Bool)

(assert (=> b!874095 (= e!486840 call!38580)))

(declare-fun b!874096 () Bool)

(declare-fun e!486841 () Bool)

(assert (=> b!874096 (= e!486841 e!486840)))

(declare-fun c!92726 () Bool)

(assert (=> b!874096 (= c!92726 (validKeyInArray!0 (select (arr!24360 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108823 () Bool)

(declare-fun res!593743 () Bool)

(declare-fun e!486842 () Bool)

(assert (=> d!108823 (=> res!593743 e!486842)))

(assert (=> d!108823 (= res!593743 (bvsge #b00000000000000000000000000000000 (size!24801 _keys!868)))))

(assert (=> d!108823 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17229) e!486842)))

(declare-fun b!874097 () Bool)

(declare-fun e!486839 () Bool)

(declare-fun contains!4220 (List!17232 (_ BitVec 64)) Bool)

(assert (=> b!874097 (= e!486839 (contains!4220 Nil!17229 (select (arr!24360 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!874098 () Bool)

(assert (=> b!874098 (= e!486842 e!486841)))

(declare-fun res!593742 () Bool)

(assert (=> b!874098 (=> (not res!593742) (not e!486841))))

(assert (=> b!874098 (= res!593742 (not e!486839))))

(declare-fun res!593744 () Bool)

(assert (=> b!874098 (=> (not res!593744) (not e!486839))))

(assert (=> b!874098 (= res!593744 (validKeyInArray!0 (select (arr!24360 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38577 () Bool)

(assert (=> bm!38577 (= call!38580 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92726 (Cons!17228 (select (arr!24360 _keys!868) #b00000000000000000000000000000000) Nil!17229) Nil!17229)))))

(assert (= (and d!108823 (not res!593743)) b!874098))

(assert (= (and b!874098 res!593744) b!874097))

(assert (= (and b!874098 res!593742) b!874096))

(assert (= (and b!874096 c!92726) b!874095))

(assert (= (and b!874096 (not c!92726)) b!874094))

(assert (= (or b!874095 b!874094) bm!38577))

(assert (=> b!874096 m!815049))

(assert (=> b!874096 m!815049))

(assert (=> b!874096 m!815051))

(assert (=> b!874097 m!815049))

(assert (=> b!874097 m!815049))

(declare-fun m!815061 () Bool)

(assert (=> b!874097 m!815061))

(assert (=> b!874098 m!815049))

(assert (=> b!874098 m!815049))

(assert (=> b!874098 m!815051))

(assert (=> bm!38577 m!815049))

(declare-fun m!815063 () Bool)

(assert (=> bm!38577 m!815063))

(assert (=> b!873928 d!108823))

(declare-fun d!108825 () Bool)

(assert (=> d!108825 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!873927 d!108825))

(declare-fun d!108827 () Bool)

(assert (=> d!108827 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!873924 d!108827))

(declare-fun b!874099 () Bool)

(declare-fun e!486843 () Bool)

(declare-fun e!486845 () Bool)

(assert (=> b!874099 (= e!486843 e!486845)))

(declare-fun c!92728 () Bool)

(assert (=> b!874099 (= c!92728 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(declare-fun bm!38578 () Bool)

(declare-fun call!38581 () ListLongMap!10159)

(assert (=> bm!38578 (= call!38581 (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!874101 () Bool)

(declare-fun lt!396099 () ListLongMap!10159)

(assert (=> b!874101 (= e!486845 (= lt!396099 (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!874102 () Bool)

(declare-fun e!486847 () Bool)

(assert (=> b!874102 (= e!486847 (validKeyInArray!0 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!874102 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!874103 () Bool)

(assert (=> b!874103 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(assert (=> b!874103 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24802 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)))))))

(declare-fun e!486846 () Bool)

(assert (=> b!874103 (= e!486846 (= (apply!374 lt!396099 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12845 (select (arr!24361 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!874104 () Bool)

(declare-fun e!486848 () Bool)

(assert (=> b!874104 (= e!486848 e!486843)))

(declare-fun c!92730 () Bool)

(assert (=> b!874104 (= c!92730 e!486847)))

(declare-fun res!593746 () Bool)

(assert (=> b!874104 (=> (not res!593746) (not e!486847))))

(assert (=> b!874104 (= res!593746 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(declare-fun b!874105 () Bool)

(declare-fun e!486844 () ListLongMap!10159)

(assert (=> b!874105 (= e!486844 call!38581)))

(declare-fun b!874106 () Bool)

(declare-fun lt!396096 () Unit!29906)

(declare-fun lt!396097 () Unit!29906)

(assert (=> b!874106 (= lt!396096 lt!396097)))

(declare-fun lt!396094 () V!28041)

(declare-fun lt!396100 () (_ BitVec 64))

(declare-fun lt!396098 () ListLongMap!10159)

(declare-fun lt!396095 () (_ BitVec 64))

(assert (=> b!874106 (not (contains!4218 (+!2479 lt!396098 (tuple2!11389 lt!396095 lt!396094)) lt!396100))))

(assert (=> b!874106 (= lt!396097 (addStillNotContains!201 lt!396098 lt!396095 lt!396094 lt!396100))))

(assert (=> b!874106 (= lt!396100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!874106 (= lt!396094 (get!12845 (select (arr!24361 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!874106 (= lt!396095 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!874106 (= lt!396098 call!38581)))

(assert (=> b!874106 (= e!486844 (+!2479 call!38581 (tuple2!11389 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12845 (select (arr!24361 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!874107 () Bool)

(assert (=> b!874107 (= e!486843 e!486846)))

(assert (=> b!874107 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(declare-fun res!593748 () Bool)

(assert (=> b!874107 (= res!593748 (contains!4218 lt!396099 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!874107 (=> (not res!593748) (not e!486846))))

(declare-fun b!874108 () Bool)

(assert (=> b!874108 (= e!486845 (isEmpty!666 lt!396099))))

(declare-fun b!874109 () Bool)

(declare-fun e!486849 () ListLongMap!10159)

(assert (=> b!874109 (= e!486849 e!486844)))

(declare-fun c!92729 () Bool)

(assert (=> b!874109 (= c!92729 (validKeyInArray!0 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!874110 () Bool)

(declare-fun res!593747 () Bool)

(assert (=> b!874110 (=> (not res!593747) (not e!486848))))

(assert (=> b!874110 (= res!593747 (not (contains!4218 lt!396099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!108829 () Bool)

(assert (=> d!108829 e!486848))

(declare-fun res!593745 () Bool)

(assert (=> d!108829 (=> (not res!593745) (not e!486848))))

(assert (=> d!108829 (= res!593745 (not (contains!4218 lt!396099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108829 (= lt!396099 e!486849)))

(declare-fun c!92727 () Bool)

(assert (=> d!108829 (= c!92727 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(assert (=> d!108829 (validMask!0 mask!1196)))

(assert (=> d!108829 (= (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50672 (store (arr!24361 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24802 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396099)))

(declare-fun b!874100 () Bool)

(assert (=> b!874100 (= e!486849 (ListLongMap!10160 Nil!17228))))

(assert (= (and d!108829 c!92727) b!874100))

(assert (= (and d!108829 (not c!92727)) b!874109))

(assert (= (and b!874109 c!92729) b!874106))

(assert (= (and b!874109 (not c!92729)) b!874105))

(assert (= (or b!874106 b!874105) bm!38578))

(assert (= (and d!108829 res!593745) b!874110))

(assert (= (and b!874110 res!593747) b!874104))

(assert (= (and b!874104 res!593746) b!874102))

(assert (= (and b!874104 c!92730) b!874107))

(assert (= (and b!874104 (not c!92730)) b!874099))

(assert (= (and b!874107 res!593748) b!874103))

(assert (= (and b!874099 c!92728) b!874101))

(assert (= (and b!874099 (not c!92728)) b!874108))

(declare-fun b_lambda!12147 () Bool)

(assert (=> (not b_lambda!12147) (not b!874103)))

(assert (=> b!874103 t!24266))

(declare-fun b_and!24789 () Bool)

(assert (= b_and!24787 (and (=> t!24266 result!9395) b_and!24789)))

(declare-fun b_lambda!12149 () Bool)

(assert (=> (not b_lambda!12149) (not b!874106)))

(assert (=> b!874106 t!24266))

(declare-fun b_and!24791 () Bool)

(assert (= b_and!24789 (and (=> t!24266 result!9395) b_and!24791)))

(declare-fun m!815065 () Bool)

(assert (=> b!874109 m!815065))

(assert (=> b!874109 m!815065))

(declare-fun m!815067 () Bool)

(assert (=> b!874109 m!815067))

(declare-fun m!815069 () Bool)

(assert (=> b!874106 m!815069))

(assert (=> b!874106 m!815069))

(assert (=> b!874106 m!814985))

(declare-fun m!815071 () Bool)

(assert (=> b!874106 m!815071))

(assert (=> b!874106 m!814985))

(declare-fun m!815073 () Bool)

(assert (=> b!874106 m!815073))

(declare-fun m!815075 () Bool)

(assert (=> b!874106 m!815075))

(assert (=> b!874106 m!815073))

(declare-fun m!815077 () Bool)

(assert (=> b!874106 m!815077))

(declare-fun m!815079 () Bool)

(assert (=> b!874106 m!815079))

(assert (=> b!874106 m!815065))

(declare-fun m!815081 () Bool)

(assert (=> b!874108 m!815081))

(declare-fun m!815083 () Bool)

(assert (=> bm!38578 m!815083))

(declare-fun m!815085 () Bool)

(assert (=> b!874110 m!815085))

(assert (=> b!874101 m!815083))

(assert (=> b!874103 m!815069))

(assert (=> b!874103 m!815065))

(declare-fun m!815087 () Bool)

(assert (=> b!874103 m!815087))

(assert (=> b!874103 m!815069))

(assert (=> b!874103 m!814985))

(assert (=> b!874103 m!815071))

(assert (=> b!874103 m!814985))

(assert (=> b!874103 m!815065))

(declare-fun m!815089 () Bool)

(assert (=> d!108829 m!815089))

(assert (=> d!108829 m!814891))

(assert (=> b!874107 m!815065))

(assert (=> b!874107 m!815065))

(declare-fun m!815091 () Bool)

(assert (=> b!874107 m!815091))

(assert (=> b!874102 m!815065))

(assert (=> b!874102 m!815065))

(assert (=> b!874102 m!815067))

(assert (=> bm!38549 d!108829))

(declare-fun b!874111 () Bool)

(declare-fun e!486850 () Bool)

(declare-fun e!486852 () Bool)

(assert (=> b!874111 (= e!486850 e!486852)))

(declare-fun c!92732 () Bool)

(assert (=> b!874111 (= c!92732 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(declare-fun call!38582 () ListLongMap!10159)

(declare-fun bm!38579 () Bool)

(assert (=> bm!38579 (= call!38582 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun lt!396106 () ListLongMap!10159)

(declare-fun b!874113 () Bool)

(assert (=> b!874113 (= e!486852 (= lt!396106 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!874114 () Bool)

(declare-fun e!486854 () Bool)

(assert (=> b!874114 (= e!486854 (validKeyInArray!0 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!874114 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!874115 () Bool)

(assert (=> b!874115 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(assert (=> b!874115 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24802 _values!688)))))

(declare-fun e!486853 () Bool)

(assert (=> b!874115 (= e!486853 (= (apply!374 lt!396106 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12845 (select (arr!24361 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!874116 () Bool)

(declare-fun e!486855 () Bool)

(assert (=> b!874116 (= e!486855 e!486850)))

(declare-fun c!92734 () Bool)

(assert (=> b!874116 (= c!92734 e!486854)))

(declare-fun res!593750 () Bool)

(assert (=> b!874116 (=> (not res!593750) (not e!486854))))

(assert (=> b!874116 (= res!593750 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(declare-fun b!874117 () Bool)

(declare-fun e!486851 () ListLongMap!10159)

(assert (=> b!874117 (= e!486851 call!38582)))

(declare-fun b!874118 () Bool)

(declare-fun lt!396103 () Unit!29906)

(declare-fun lt!396104 () Unit!29906)

(assert (=> b!874118 (= lt!396103 lt!396104)))

(declare-fun lt!396101 () V!28041)

(declare-fun lt!396107 () (_ BitVec 64))

(declare-fun lt!396102 () (_ BitVec 64))

(declare-fun lt!396105 () ListLongMap!10159)

(assert (=> b!874118 (not (contains!4218 (+!2479 lt!396105 (tuple2!11389 lt!396102 lt!396101)) lt!396107))))

(assert (=> b!874118 (= lt!396104 (addStillNotContains!201 lt!396105 lt!396102 lt!396101 lt!396107))))

(assert (=> b!874118 (= lt!396107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!874118 (= lt!396101 (get!12845 (select (arr!24361 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!874118 (= lt!396102 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!874118 (= lt!396105 call!38582)))

(assert (=> b!874118 (= e!486851 (+!2479 call!38582 (tuple2!11389 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12845 (select (arr!24361 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!874119 () Bool)

(assert (=> b!874119 (= e!486850 e!486853)))

(assert (=> b!874119 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(declare-fun res!593752 () Bool)

(assert (=> b!874119 (= res!593752 (contains!4218 lt!396106 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!874119 (=> (not res!593752) (not e!486853))))

(declare-fun b!874120 () Bool)

(assert (=> b!874120 (= e!486852 (isEmpty!666 lt!396106))))

(declare-fun b!874121 () Bool)

(declare-fun e!486856 () ListLongMap!10159)

(assert (=> b!874121 (= e!486856 e!486851)))

(declare-fun c!92733 () Bool)

(assert (=> b!874121 (= c!92733 (validKeyInArray!0 (select (arr!24360 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!874122 () Bool)

(declare-fun res!593751 () Bool)

(assert (=> b!874122 (=> (not res!593751) (not e!486855))))

(assert (=> b!874122 (= res!593751 (not (contains!4218 lt!396106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!108831 () Bool)

(assert (=> d!108831 e!486855))

(declare-fun res!593749 () Bool)

(assert (=> d!108831 (=> (not res!593749) (not e!486855))))

(assert (=> d!108831 (= res!593749 (not (contains!4218 lt!396106 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108831 (= lt!396106 e!486856)))

(declare-fun c!92731 () Bool)

(assert (=> d!108831 (= c!92731 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24801 _keys!868)))))

(assert (=> d!108831 (validMask!0 mask!1196)))

(assert (=> d!108831 (= (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396106)))

(declare-fun b!874112 () Bool)

(assert (=> b!874112 (= e!486856 (ListLongMap!10160 Nil!17228))))

(assert (= (and d!108831 c!92731) b!874112))

(assert (= (and d!108831 (not c!92731)) b!874121))

(assert (= (and b!874121 c!92733) b!874118))

(assert (= (and b!874121 (not c!92733)) b!874117))

(assert (= (or b!874118 b!874117) bm!38579))

(assert (= (and d!108831 res!593749) b!874122))

(assert (= (and b!874122 res!593751) b!874116))

(assert (= (and b!874116 res!593750) b!874114))

(assert (= (and b!874116 c!92734) b!874119))

(assert (= (and b!874116 (not c!92734)) b!874111))

(assert (= (and b!874119 res!593752) b!874115))

(assert (= (and b!874111 c!92732) b!874113))

(assert (= (and b!874111 (not c!92732)) b!874120))

(declare-fun b_lambda!12151 () Bool)

(assert (=> (not b_lambda!12151) (not b!874115)))

(assert (=> b!874115 t!24266))

(declare-fun b_and!24793 () Bool)

(assert (= b_and!24791 (and (=> t!24266 result!9395) b_and!24793)))

(declare-fun b_lambda!12153 () Bool)

(assert (=> (not b_lambda!12153) (not b!874118)))

(assert (=> b!874118 t!24266))

(declare-fun b_and!24795 () Bool)

(assert (= b_and!24793 (and (=> t!24266 result!9395) b_and!24795)))

(assert (=> b!874121 m!815065))

(assert (=> b!874121 m!815065))

(assert (=> b!874121 m!815067))

(declare-fun m!815093 () Bool)

(assert (=> b!874118 m!815093))

(assert (=> b!874118 m!815093))

(assert (=> b!874118 m!814985))

(declare-fun m!815095 () Bool)

(assert (=> b!874118 m!815095))

(assert (=> b!874118 m!814985))

(declare-fun m!815097 () Bool)

(assert (=> b!874118 m!815097))

(declare-fun m!815099 () Bool)

(assert (=> b!874118 m!815099))

(assert (=> b!874118 m!815097))

(declare-fun m!815101 () Bool)

(assert (=> b!874118 m!815101))

(declare-fun m!815103 () Bool)

(assert (=> b!874118 m!815103))

(assert (=> b!874118 m!815065))

(declare-fun m!815105 () Bool)

(assert (=> b!874120 m!815105))

(declare-fun m!815107 () Bool)

(assert (=> bm!38579 m!815107))

(declare-fun m!815109 () Bool)

(assert (=> b!874122 m!815109))

(assert (=> b!874113 m!815107))

(assert (=> b!874115 m!815093))

(assert (=> b!874115 m!815065))

(declare-fun m!815111 () Bool)

(assert (=> b!874115 m!815111))

(assert (=> b!874115 m!815093))

(assert (=> b!874115 m!814985))

(assert (=> b!874115 m!815095))

(assert (=> b!874115 m!814985))

(assert (=> b!874115 m!815065))

(declare-fun m!815113 () Bool)

(assert (=> d!108831 m!815113))

(assert (=> d!108831 m!814891))

(assert (=> b!874119 m!815065))

(assert (=> b!874119 m!815065))

(declare-fun m!815115 () Bool)

(assert (=> b!874119 m!815115))

(assert (=> b!874114 m!815065))

(assert (=> b!874114 m!815065))

(assert (=> b!874114 m!815067))

(assert (=> bm!38548 d!108831))

(declare-fun d!108833 () Bool)

(assert (=> d!108833 (= (array_inv!19272 _keys!868) (bvsge (size!24801 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74374 d!108833))

(declare-fun d!108835 () Bool)

(assert (=> d!108835 (= (array_inv!19273 _values!688) (bvsge (size!24802 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74374 d!108835))

(declare-fun b!874130 () Bool)

(declare-fun e!486861 () Bool)

(assert (=> b!874130 (= e!486861 tp_is_empty!17245)))

(declare-fun mapNonEmpty!27479 () Bool)

(declare-fun mapRes!27479 () Bool)

(declare-fun tp!52706 () Bool)

(declare-fun e!486862 () Bool)

(assert (=> mapNonEmpty!27479 (= mapRes!27479 (and tp!52706 e!486862))))

(declare-fun mapRest!27479 () (Array (_ BitVec 32) ValueCell!8183))

(declare-fun mapValue!27479 () ValueCell!8183)

(declare-fun mapKey!27479 () (_ BitVec 32))

(assert (=> mapNonEmpty!27479 (= mapRest!27470 (store mapRest!27479 mapKey!27479 mapValue!27479))))

(declare-fun mapIsEmpty!27479 () Bool)

(assert (=> mapIsEmpty!27479 mapRes!27479))

(declare-fun condMapEmpty!27479 () Bool)

(declare-fun mapDefault!27479 () ValueCell!8183)

(assert (=> mapNonEmpty!27470 (= condMapEmpty!27479 (= mapRest!27470 ((as const (Array (_ BitVec 32) ValueCell!8183)) mapDefault!27479)))))

(assert (=> mapNonEmpty!27470 (= tp!52691 (and e!486861 mapRes!27479))))

(declare-fun b!874129 () Bool)

(assert (=> b!874129 (= e!486862 tp_is_empty!17245)))

(assert (= (and mapNonEmpty!27470 condMapEmpty!27479) mapIsEmpty!27479))

(assert (= (and mapNonEmpty!27470 (not condMapEmpty!27479)) mapNonEmpty!27479))

(assert (= (and mapNonEmpty!27479 ((_ is ValueCellFull!8183) mapValue!27479)) b!874129))

(assert (= (and mapNonEmpty!27470 ((_ is ValueCellFull!8183) mapDefault!27479)) b!874130))

(declare-fun m!815117 () Bool)

(assert (=> mapNonEmpty!27479 m!815117))

(declare-fun b_lambda!12155 () Bool)

(assert (= b_lambda!12153 (or (and start!74374 b_free!15013) b_lambda!12155)))

(declare-fun b_lambda!12157 () Bool)

(assert (= b_lambda!12141 (or (and start!74374 b_free!15013) b_lambda!12157)))

(declare-fun b_lambda!12159 () Bool)

(assert (= b_lambda!12149 (or (and start!74374 b_free!15013) b_lambda!12159)))

(declare-fun b_lambda!12161 () Bool)

(assert (= b_lambda!12147 (or (and start!74374 b_free!15013) b_lambda!12161)))

(declare-fun b_lambda!12163 () Bool)

(assert (= b_lambda!12145 (or (and start!74374 b_free!15013) b_lambda!12163)))

(declare-fun b_lambda!12165 () Bool)

(assert (= b_lambda!12143 (or (and start!74374 b_free!15013) b_lambda!12165)))

(declare-fun b_lambda!12167 () Bool)

(assert (= b_lambda!12139 (or (and start!74374 b_free!15013) b_lambda!12167)))

(declare-fun b_lambda!12169 () Bool)

(assert (= b_lambda!12151 (or (and start!74374 b_free!15013) b_lambda!12169)))

(check-sat (not b!874039) (not b!874048) (not b_next!15013) (not b!874108) (not b!874096) (not bm!38565) (not b!874097) (not b!874107) (not b!874103) (not bm!38570) (not b!874070) (not b!874118) (not d!108817) (not b_lambda!12165) (not bm!38578) (not bm!38574) (not b!874071) (not b!874110) tp_is_empty!17245 (not b!874040) (not bm!38571) (not b!874053) (not b!874121) (not b!874034) (not b!874056) (not b!874109) (not b!874041) (not b!874082) (not b!874052) (not b!874049) (not b!874102) (not b_lambda!12159) (not b!874114) (not d!108815) (not b_lambda!12167) (not d!108831) (not bm!38577) (not b!874038) (not b!874115) (not b!874047) (not bm!38564) (not b!874113) (not b!874120) (not b!874101) (not mapNonEmpty!27479) (not b!874055) (not b_lambda!12155) (not b!874033) (not b!874054) (not b_lambda!12163) (not b!874035) (not bm!38579) (not b!874042) (not b_lambda!12161) (not d!108829) (not b_lambda!12157) (not b!874083) (not b!874106) (not d!108819) (not b_lambda!12169) (not b!874064) (not b!874098) (not b!874119) b_and!24795 (not d!108813) (not b!874122))
(check-sat b_and!24795 (not b_next!15013))
