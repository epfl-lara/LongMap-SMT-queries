; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74410 () Bool)

(assert start!74410)

(declare-fun b_free!15019 () Bool)

(declare-fun b_next!15019 () Bool)

(assert (=> start!74410 (= b_free!15019 (not b_next!15019))))

(declare-fun tp!52730 () Bool)

(declare-fun b_and!24797 () Bool)

(assert (=> start!74410 (= tp!52730 b_and!24797)))

(declare-fun mapIsEmpty!27500 () Bool)

(declare-fun mapRes!27500 () Bool)

(assert (=> mapIsEmpty!27500 mapRes!27500))

(declare-fun b!874306 () Bool)

(declare-fun res!593870 () Bool)

(declare-fun e!486966 () Bool)

(assert (=> b!874306 (=> (not res!593870) (not e!486966))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874306 (= res!593870 (validKeyInArray!0 k0!854))))

(declare-fun b!874307 () Bool)

(declare-fun e!486964 () Bool)

(declare-fun tp_is_empty!17263 () Bool)

(assert (=> b!874307 (= e!486964 tp_is_empty!17263)))

(declare-fun b!874308 () Bool)

(declare-fun res!593875 () Bool)

(assert (=> b!874308 (=> (not res!593875) (not e!486966))))

(declare-datatypes ((array!50707 0))(
  ( (array!50708 (arr!24378 (Array (_ BitVec 32) (_ BitVec 64))) (size!24819 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50707)

(declare-datatypes ((List!17241 0))(
  ( (Nil!17238) (Cons!17237 (h!18374 (_ BitVec 64)) (t!24272 List!17241)) )
))
(declare-fun arrayNoDuplicates!0 (array!50707 (_ BitVec 32) List!17241) Bool)

(assert (=> b!874308 (= res!593875 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17238))))

(declare-fun b!874309 () Bool)

(declare-fun e!486965 () Bool)

(declare-fun e!486963 () Bool)

(assert (=> b!874309 (= e!486965 (and e!486963 mapRes!27500))))

(declare-fun condMapEmpty!27500 () Bool)

(declare-datatypes ((V!28065 0))(
  ( (V!28066 (val!8679 Int)) )
))
(declare-datatypes ((ValueCell!8192 0))(
  ( (ValueCellFull!8192 (v!11108 V!28065)) (EmptyCell!8192) )
))
(declare-datatypes ((array!50709 0))(
  ( (array!50710 (arr!24379 (Array (_ BitVec 32) ValueCell!8192)) (size!24820 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50709)

(declare-fun mapDefault!27500 () ValueCell!8192)

(assert (=> b!874309 (= condMapEmpty!27500 (= (arr!24379 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8192)) mapDefault!27500)))))

(declare-fun res!593868 () Bool)

(assert (=> start!74410 (=> (not res!593868) (not e!486966))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74410 (= res!593868 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24819 _keys!868))))))

(assert (=> start!74410 e!486966))

(assert (=> start!74410 tp_is_empty!17263))

(assert (=> start!74410 true))

(assert (=> start!74410 tp!52730))

(declare-fun array_inv!19286 (array!50707) Bool)

(assert (=> start!74410 (array_inv!19286 _keys!868)))

(declare-fun array_inv!19287 (array!50709) Bool)

(assert (=> start!74410 (and (array_inv!19287 _values!688) e!486965)))

(declare-fun b!874310 () Bool)

(declare-fun res!593874 () Bool)

(assert (=> b!874310 (=> (not res!593874) (not e!486966))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!874310 (= res!593874 (and (= (size!24820 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24819 _keys!868) (size!24820 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874311 () Bool)

(declare-fun res!593871 () Bool)

(assert (=> b!874311 (=> (not res!593871) (not e!486966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874311 (= res!593871 (validMask!0 mask!1196))))

(declare-fun b!874312 () Bool)

(declare-fun res!593869 () Bool)

(assert (=> b!874312 (=> (not res!593869) (not e!486966))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874312 (= res!593869 (and (= (select (arr!24378 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24819 _keys!868))))))

(declare-fun v!557 () V!28065)

(declare-fun defaultEntry!696 () Int)

(declare-fun b!874313 () Bool)

(declare-fun minValue!654 () V!28065)

(declare-fun zeroValue!654 () V!28065)

(declare-datatypes ((tuple2!11394 0))(
  ( (tuple2!11395 (_1!5708 (_ BitVec 64)) (_2!5708 V!28065)) )
))
(declare-datatypes ((List!17242 0))(
  ( (Nil!17239) (Cons!17238 (h!18375 tuple2!11394) (t!24273 List!17242)) )
))
(declare-datatypes ((ListLongMap!10165 0))(
  ( (ListLongMap!10166 (toList!5098 List!17242)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3141 (array!50707 array!50709 (_ BitVec 32) (_ BitVec 32) V!28065 V!28065 (_ BitVec 32) Int) ListLongMap!10165)

(assert (=> b!874313 (= e!486966 (not (= (getCurrentListMapNoExtraKeys!3141 _keys!868 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun mapNonEmpty!27500 () Bool)

(declare-fun tp!52729 () Bool)

(assert (=> mapNonEmpty!27500 (= mapRes!27500 (and tp!52729 e!486964))))

(declare-fun mapValue!27500 () ValueCell!8192)

(declare-fun mapKey!27500 () (_ BitVec 32))

(declare-fun mapRest!27500 () (Array (_ BitVec 32) ValueCell!8192))

(assert (=> mapNonEmpty!27500 (= (arr!24379 _values!688) (store mapRest!27500 mapKey!27500 mapValue!27500))))

(declare-fun b!874314 () Bool)

(declare-fun res!593872 () Bool)

(assert (=> b!874314 (=> (not res!593872) (not e!486966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50707 (_ BitVec 32)) Bool)

(assert (=> b!874314 (= res!593872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874315 () Bool)

(assert (=> b!874315 (= e!486963 tp_is_empty!17263)))

(declare-fun b!874316 () Bool)

(declare-fun res!593873 () Bool)

(assert (=> b!874316 (=> (not res!593873) (not e!486966))))

(assert (=> b!874316 (= res!593873 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24819 _keys!868))))))

(assert (= (and start!74410 res!593868) b!874311))

(assert (= (and b!874311 res!593871) b!874310))

(assert (= (and b!874310 res!593874) b!874314))

(assert (= (and b!874314 res!593872) b!874308))

(assert (= (and b!874308 res!593875) b!874316))

(assert (= (and b!874316 res!593873) b!874306))

(assert (= (and b!874306 res!593870) b!874312))

(assert (= (and b!874312 res!593869) b!874313))

(assert (= (and b!874309 condMapEmpty!27500) mapIsEmpty!27500))

(assert (= (and b!874309 (not condMapEmpty!27500)) mapNonEmpty!27500))

(get-info :version)

(assert (= (and mapNonEmpty!27500 ((_ is ValueCellFull!8192) mapValue!27500)) b!874307))

(assert (= (and b!874309 ((_ is ValueCellFull!8192) mapDefault!27500)) b!874315))

(assert (= start!74410 b!874309))

(declare-fun m!815203 () Bool)

(assert (=> b!874306 m!815203))

(declare-fun m!815205 () Bool)

(assert (=> b!874314 m!815205))

(declare-fun m!815207 () Bool)

(assert (=> b!874311 m!815207))

(declare-fun m!815209 () Bool)

(assert (=> start!74410 m!815209))

(declare-fun m!815211 () Bool)

(assert (=> start!74410 m!815211))

(declare-fun m!815213 () Bool)

(assert (=> b!874312 m!815213))

(declare-fun m!815215 () Bool)

(assert (=> b!874308 m!815215))

(declare-fun m!815217 () Bool)

(assert (=> b!874313 m!815217))

(declare-fun m!815219 () Bool)

(assert (=> b!874313 m!815219))

(declare-fun m!815221 () Bool)

(assert (=> b!874313 m!815221))

(declare-fun m!815223 () Bool)

(assert (=> mapNonEmpty!27500 m!815223))

(check-sat (not b!874311) (not mapNonEmpty!27500) (not start!74410) (not b!874314) (not b!874313) b_and!24797 (not b_next!15019) (not b!874306) tp_is_empty!17263 (not b!874308))
(check-sat b_and!24797 (not b_next!15019))
(get-model)

(declare-fun d!108843 () Bool)

(declare-fun res!593928 () Bool)

(declare-fun e!487004 () Bool)

(assert (=> d!108843 (=> res!593928 e!487004)))

(assert (=> d!108843 (= res!593928 (bvsge #b00000000000000000000000000000000 (size!24819 _keys!868)))))

(assert (=> d!108843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!487004)))

(declare-fun b!874391 () Bool)

(declare-fun e!487005 () Bool)

(declare-fun call!38585 () Bool)

(assert (=> b!874391 (= e!487005 call!38585)))

(declare-fun b!874392 () Bool)

(declare-fun e!487006 () Bool)

(assert (=> b!874392 (= e!487006 call!38585)))

(declare-fun b!874393 () Bool)

(assert (=> b!874393 (= e!487004 e!487005)))

(declare-fun c!92737 () Bool)

(assert (=> b!874393 (= c!92737 (validKeyInArray!0 (select (arr!24378 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!874394 () Bool)

(assert (=> b!874394 (= e!487005 e!487006)))

(declare-fun lt!396123 () (_ BitVec 64))

(assert (=> b!874394 (= lt!396123 (select (arr!24378 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!29908 0))(
  ( (Unit!29909) )
))
(declare-fun lt!396124 () Unit!29908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50707 (_ BitVec 64) (_ BitVec 32)) Unit!29908)

(assert (=> b!874394 (= lt!396124 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396123 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!874394 (arrayContainsKey!0 _keys!868 lt!396123 #b00000000000000000000000000000000)))

(declare-fun lt!396125 () Unit!29908)

(assert (=> b!874394 (= lt!396125 lt!396124)))

(declare-fun res!593929 () Bool)

(declare-datatypes ((SeekEntryResult!8702 0))(
  ( (MissingZero!8702 (index!37179 (_ BitVec 32))) (Found!8702 (index!37180 (_ BitVec 32))) (Intermediate!8702 (undefined!9514 Bool) (index!37181 (_ BitVec 32)) (x!73983 (_ BitVec 32))) (Undefined!8702) (MissingVacant!8702 (index!37182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50707 (_ BitVec 32)) SeekEntryResult!8702)

(assert (=> b!874394 (= res!593929 (= (seekEntryOrOpen!0 (select (arr!24378 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8702 #b00000000000000000000000000000000)))))

(assert (=> b!874394 (=> (not res!593929) (not e!487006))))

(declare-fun bm!38582 () Bool)

(assert (=> bm!38582 (= call!38585 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!108843 (not res!593928)) b!874393))

(assert (= (and b!874393 c!92737) b!874394))

(assert (= (and b!874393 (not c!92737)) b!874391))

(assert (= (and b!874394 res!593929) b!874392))

(assert (= (or b!874392 b!874391) bm!38582))

(declare-fun m!815269 () Bool)

(assert (=> b!874393 m!815269))

(assert (=> b!874393 m!815269))

(declare-fun m!815271 () Bool)

(assert (=> b!874393 m!815271))

(assert (=> b!874394 m!815269))

(declare-fun m!815273 () Bool)

(assert (=> b!874394 m!815273))

(declare-fun m!815275 () Bool)

(assert (=> b!874394 m!815275))

(assert (=> b!874394 m!815269))

(declare-fun m!815277 () Bool)

(assert (=> b!874394 m!815277))

(declare-fun m!815279 () Bool)

(assert (=> bm!38582 m!815279))

(assert (=> b!874314 d!108843))

(declare-fun d!108845 () Bool)

(assert (=> d!108845 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!874306 d!108845))

(declare-fun d!108847 () Bool)

(assert (=> d!108847 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!874311 d!108847))

(declare-fun b!874405 () Bool)

(declare-fun e!487017 () Bool)

(declare-fun call!38588 () Bool)

(assert (=> b!874405 (= e!487017 call!38588)))

(declare-fun b!874406 () Bool)

(declare-fun e!487018 () Bool)

(assert (=> b!874406 (= e!487018 e!487017)))

(declare-fun c!92740 () Bool)

(assert (=> b!874406 (= c!92740 (validKeyInArray!0 (select (arr!24378 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38585 () Bool)

(assert (=> bm!38585 (= call!38588 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92740 (Cons!17237 (select (arr!24378 _keys!868) #b00000000000000000000000000000000) Nil!17238) Nil!17238)))))

(declare-fun b!874407 () Bool)

(declare-fun e!487015 () Bool)

(declare-fun contains!4221 (List!17241 (_ BitVec 64)) Bool)

(assert (=> b!874407 (= e!487015 (contains!4221 Nil!17238 (select (arr!24378 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108849 () Bool)

(declare-fun res!593938 () Bool)

(declare-fun e!487016 () Bool)

(assert (=> d!108849 (=> res!593938 e!487016)))

(assert (=> d!108849 (= res!593938 (bvsge #b00000000000000000000000000000000 (size!24819 _keys!868)))))

(assert (=> d!108849 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17238) e!487016)))

(declare-fun b!874408 () Bool)

(assert (=> b!874408 (= e!487017 call!38588)))

(declare-fun b!874409 () Bool)

(assert (=> b!874409 (= e!487016 e!487018)))

(declare-fun res!593936 () Bool)

(assert (=> b!874409 (=> (not res!593936) (not e!487018))))

(assert (=> b!874409 (= res!593936 (not e!487015))))

(declare-fun res!593937 () Bool)

(assert (=> b!874409 (=> (not res!593937) (not e!487015))))

(assert (=> b!874409 (= res!593937 (validKeyInArray!0 (select (arr!24378 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108849 (not res!593938)) b!874409))

(assert (= (and b!874409 res!593937) b!874407))

(assert (= (and b!874409 res!593936) b!874406))

(assert (= (and b!874406 c!92740) b!874405))

(assert (= (and b!874406 (not c!92740)) b!874408))

(assert (= (or b!874405 b!874408) bm!38585))

(assert (=> b!874406 m!815269))

(assert (=> b!874406 m!815269))

(assert (=> b!874406 m!815271))

(assert (=> bm!38585 m!815269))

(declare-fun m!815281 () Bool)

(assert (=> bm!38585 m!815281))

(assert (=> b!874407 m!815269))

(assert (=> b!874407 m!815269))

(declare-fun m!815283 () Bool)

(assert (=> b!874407 m!815283))

(assert (=> b!874409 m!815269))

(assert (=> b!874409 m!815269))

(assert (=> b!874409 m!815271))

(assert (=> b!874308 d!108849))

(declare-fun b!874434 () Bool)

(declare-fun e!487039 () ListLongMap!10165)

(declare-fun e!487034 () ListLongMap!10165)

(assert (=> b!874434 (= e!487039 e!487034)))

(declare-fun c!92752 () Bool)

(assert (=> b!874434 (= c!92752 (validKeyInArray!0 (select (arr!24378 _keys!868) from!1053)))))

(declare-fun d!108851 () Bool)

(declare-fun e!487038 () Bool)

(assert (=> d!108851 e!487038))

(declare-fun res!593949 () Bool)

(assert (=> d!108851 (=> (not res!593949) (not e!487038))))

(declare-fun lt!396141 () ListLongMap!10165)

(declare-fun contains!4222 (ListLongMap!10165 (_ BitVec 64)) Bool)

(assert (=> d!108851 (= res!593949 (not (contains!4222 lt!396141 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108851 (= lt!396141 e!487039)))

(declare-fun c!92749 () Bool)

(assert (=> d!108851 (= c!92749 (bvsge from!1053 (size!24819 _keys!868)))))

(assert (=> d!108851 (validMask!0 mask!1196)))

(assert (=> d!108851 (= (getCurrentListMapNoExtraKeys!3141 _keys!868 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396141)))

(declare-fun b!874435 () Bool)

(declare-fun e!487036 () Bool)

(assert (=> b!874435 (= e!487038 e!487036)))

(declare-fun c!92750 () Bool)

(declare-fun e!487033 () Bool)

(assert (=> b!874435 (= c!92750 e!487033)))

(declare-fun res!593950 () Bool)

(assert (=> b!874435 (=> (not res!593950) (not e!487033))))

(assert (=> b!874435 (= res!593950 (bvslt from!1053 (size!24819 _keys!868)))))

(declare-fun b!874436 () Bool)

(declare-fun call!38591 () ListLongMap!10165)

(assert (=> b!874436 (= e!487034 call!38591)))

(declare-fun b!874437 () Bool)

(declare-fun lt!396146 () Unit!29908)

(declare-fun lt!396142 () Unit!29908)

(assert (=> b!874437 (= lt!396146 lt!396142)))

(declare-fun lt!396140 () (_ BitVec 64))

(declare-fun lt!396143 () V!28065)

(declare-fun lt!396145 () (_ BitVec 64))

(declare-fun lt!396144 () ListLongMap!10165)

(declare-fun +!2480 (ListLongMap!10165 tuple2!11394) ListLongMap!10165)

(assert (=> b!874437 (not (contains!4222 (+!2480 lt!396144 (tuple2!11395 lt!396140 lt!396143)) lt!396145))))

(declare-fun addStillNotContains!202 (ListLongMap!10165 (_ BitVec 64) V!28065 (_ BitVec 64)) Unit!29908)

(assert (=> b!874437 (= lt!396142 (addStillNotContains!202 lt!396144 lt!396140 lt!396143 lt!396145))))

(assert (=> b!874437 (= lt!396145 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!12852 (ValueCell!8192 V!28065) V!28065)

(declare-fun dynLambda!1226 (Int (_ BitVec 64)) V!28065)

(assert (=> b!874437 (= lt!396143 (get!12852 (select (arr!24379 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688))) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!874437 (= lt!396140 (select (arr!24378 _keys!868) from!1053))))

(assert (=> b!874437 (= lt!396144 call!38591)))

(assert (=> b!874437 (= e!487034 (+!2480 call!38591 (tuple2!11395 (select (arr!24378 _keys!868) from!1053) (get!12852 (select (arr!24379 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688))) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!487035 () Bool)

(declare-fun b!874438 () Bool)

(assert (=> b!874438 (= e!487035 (= lt!396141 (getCurrentListMapNoExtraKeys!3141 _keys!868 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!874439 () Bool)

(assert (=> b!874439 (= e!487036 e!487035)))

(declare-fun c!92751 () Bool)

(assert (=> b!874439 (= c!92751 (bvslt from!1053 (size!24819 _keys!868)))))

(declare-fun bm!38588 () Bool)

(assert (=> bm!38588 (= call!38591 (getCurrentListMapNoExtraKeys!3141 _keys!868 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!874440 () Bool)

(declare-fun isEmpty!667 (ListLongMap!10165) Bool)

(assert (=> b!874440 (= e!487035 (isEmpty!667 lt!396141))))

(declare-fun b!874441 () Bool)

(declare-fun res!593947 () Bool)

(assert (=> b!874441 (=> (not res!593947) (not e!487038))))

(assert (=> b!874441 (= res!593947 (not (contains!4222 lt!396141 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!874442 () Bool)

(assert (=> b!874442 (= e!487033 (validKeyInArray!0 (select (arr!24378 _keys!868) from!1053)))))

(assert (=> b!874442 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!874443 () Bool)

(declare-fun e!487037 () Bool)

(assert (=> b!874443 (= e!487036 e!487037)))

(assert (=> b!874443 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24819 _keys!868)))))

(declare-fun res!593948 () Bool)

(assert (=> b!874443 (= res!593948 (contains!4222 lt!396141 (select (arr!24378 _keys!868) from!1053)))))

(assert (=> b!874443 (=> (not res!593948) (not e!487037))))

(declare-fun b!874444 () Bool)

(assert (=> b!874444 (= e!487039 (ListLongMap!10166 Nil!17239))))

(declare-fun b!874445 () Bool)

(assert (=> b!874445 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24819 _keys!868)))))

(assert (=> b!874445 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24820 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688)))))))

(declare-fun apply!375 (ListLongMap!10165 (_ BitVec 64)) V!28065)

(assert (=> b!874445 (= e!487037 (= (apply!375 lt!396141 (select (arr!24378 _keys!868) from!1053)) (get!12852 (select (arr!24379 (array!50710 (store (arr!24379 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24820 _values!688))) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108851 c!92749) b!874444))

(assert (= (and d!108851 (not c!92749)) b!874434))

(assert (= (and b!874434 c!92752) b!874437))

(assert (= (and b!874434 (not c!92752)) b!874436))

(assert (= (or b!874437 b!874436) bm!38588))

(assert (= (and d!108851 res!593949) b!874441))

(assert (= (and b!874441 res!593947) b!874435))

(assert (= (and b!874435 res!593950) b!874442))

(assert (= (and b!874435 c!92750) b!874443))

(assert (= (and b!874435 (not c!92750)) b!874439))

(assert (= (and b!874443 res!593948) b!874445))

(assert (= (and b!874439 c!92751) b!874438))

(assert (= (and b!874439 (not c!92751)) b!874440))

(declare-fun b_lambda!12171 () Bool)

(assert (=> (not b_lambda!12171) (not b!874437)))

(declare-fun t!24275 () Bool)

(declare-fun tb!4889 () Bool)

(assert (=> (and start!74410 (= defaultEntry!696 defaultEntry!696) t!24275) tb!4889))

(declare-fun result!9401 () Bool)

(assert (=> tb!4889 (= result!9401 tp_is_empty!17263)))

(assert (=> b!874437 t!24275))

(declare-fun b_and!24803 () Bool)

(assert (= b_and!24797 (and (=> t!24275 result!9401) b_and!24803)))

(declare-fun b_lambda!12173 () Bool)

(assert (=> (not b_lambda!12173) (not b!874445)))

(assert (=> b!874445 t!24275))

(declare-fun b_and!24805 () Bool)

(assert (= b_and!24803 (and (=> t!24275 result!9401) b_and!24805)))

(declare-fun m!815285 () Bool)

(assert (=> b!874437 m!815285))

(declare-fun m!815287 () Bool)

(assert (=> b!874437 m!815287))

(declare-fun m!815289 () Bool)

(assert (=> b!874437 m!815289))

(declare-fun m!815291 () Bool)

(assert (=> b!874437 m!815291))

(declare-fun m!815293 () Bool)

(assert (=> b!874437 m!815293))

(declare-fun m!815295 () Bool)

(assert (=> b!874437 m!815295))

(assert (=> b!874437 m!815287))

(assert (=> b!874437 m!815293))

(declare-fun m!815297 () Bool)

(assert (=> b!874437 m!815297))

(assert (=> b!874437 m!815289))

(declare-fun m!815299 () Bool)

(assert (=> b!874437 m!815299))

(declare-fun m!815301 () Bool)

(assert (=> d!108851 m!815301))

(assert (=> d!108851 m!815207))

(declare-fun m!815303 () Bool)

(assert (=> b!874441 m!815303))

(assert (=> b!874442 m!815285))

(assert (=> b!874442 m!815285))

(declare-fun m!815305 () Bool)

(assert (=> b!874442 m!815305))

(assert (=> b!874434 m!815285))

(assert (=> b!874434 m!815285))

(assert (=> b!874434 m!815305))

(declare-fun m!815307 () Bool)

(assert (=> b!874438 m!815307))

(assert (=> b!874443 m!815285))

(assert (=> b!874443 m!815285))

(declare-fun m!815309 () Bool)

(assert (=> b!874443 m!815309))

(assert (=> b!874445 m!815285))

(declare-fun m!815311 () Bool)

(assert (=> b!874445 m!815311))

(assert (=> b!874445 m!815285))

(assert (=> b!874445 m!815287))

(assert (=> b!874445 m!815293))

(assert (=> b!874445 m!815287))

(assert (=> b!874445 m!815293))

(assert (=> b!874445 m!815297))

(declare-fun m!815313 () Bool)

(assert (=> b!874440 m!815313))

(assert (=> bm!38588 m!815307))

(assert (=> b!874313 d!108851))

(declare-fun b!874448 () Bool)

(declare-fun e!487046 () ListLongMap!10165)

(declare-fun e!487041 () ListLongMap!10165)

(assert (=> b!874448 (= e!487046 e!487041)))

(declare-fun c!92756 () Bool)

(assert (=> b!874448 (= c!92756 (validKeyInArray!0 (select (arr!24378 _keys!868) from!1053)))))

(declare-fun d!108853 () Bool)

(declare-fun e!487045 () Bool)

(assert (=> d!108853 e!487045))

(declare-fun res!593953 () Bool)

(assert (=> d!108853 (=> (not res!593953) (not e!487045))))

(declare-fun lt!396148 () ListLongMap!10165)

(assert (=> d!108853 (= res!593953 (not (contains!4222 lt!396148 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108853 (= lt!396148 e!487046)))

(declare-fun c!92753 () Bool)

(assert (=> d!108853 (= c!92753 (bvsge from!1053 (size!24819 _keys!868)))))

(assert (=> d!108853 (validMask!0 mask!1196)))

(assert (=> d!108853 (= (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396148)))

(declare-fun b!874449 () Bool)

(declare-fun e!487043 () Bool)

(assert (=> b!874449 (= e!487045 e!487043)))

(declare-fun c!92754 () Bool)

(declare-fun e!487040 () Bool)

(assert (=> b!874449 (= c!92754 e!487040)))

(declare-fun res!593954 () Bool)

(assert (=> b!874449 (=> (not res!593954) (not e!487040))))

(assert (=> b!874449 (= res!593954 (bvslt from!1053 (size!24819 _keys!868)))))

(declare-fun b!874450 () Bool)

(declare-fun call!38592 () ListLongMap!10165)

(assert (=> b!874450 (= e!487041 call!38592)))

(declare-fun b!874451 () Bool)

(declare-fun lt!396153 () Unit!29908)

(declare-fun lt!396149 () Unit!29908)

(assert (=> b!874451 (= lt!396153 lt!396149)))

(declare-fun lt!396150 () V!28065)

(declare-fun lt!396147 () (_ BitVec 64))

(declare-fun lt!396151 () ListLongMap!10165)

(declare-fun lt!396152 () (_ BitVec 64))

(assert (=> b!874451 (not (contains!4222 (+!2480 lt!396151 (tuple2!11395 lt!396147 lt!396150)) lt!396152))))

(assert (=> b!874451 (= lt!396149 (addStillNotContains!202 lt!396151 lt!396147 lt!396150 lt!396152))))

(assert (=> b!874451 (= lt!396152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!874451 (= lt!396150 (get!12852 (select (arr!24379 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!874451 (= lt!396147 (select (arr!24378 _keys!868) from!1053))))

(assert (=> b!874451 (= lt!396151 call!38592)))

(assert (=> b!874451 (= e!487041 (+!2480 call!38592 (tuple2!11395 (select (arr!24378 _keys!868) from!1053) (get!12852 (select (arr!24379 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!487042 () Bool)

(declare-fun b!874452 () Bool)

(assert (=> b!874452 (= e!487042 (= lt!396148 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!874453 () Bool)

(assert (=> b!874453 (= e!487043 e!487042)))

(declare-fun c!92755 () Bool)

(assert (=> b!874453 (= c!92755 (bvslt from!1053 (size!24819 _keys!868)))))

(declare-fun bm!38589 () Bool)

(assert (=> bm!38589 (= call!38592 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!874454 () Bool)

(assert (=> b!874454 (= e!487042 (isEmpty!667 lt!396148))))

(declare-fun b!874455 () Bool)

(declare-fun res!593951 () Bool)

(assert (=> b!874455 (=> (not res!593951) (not e!487045))))

(assert (=> b!874455 (= res!593951 (not (contains!4222 lt!396148 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!874456 () Bool)

(assert (=> b!874456 (= e!487040 (validKeyInArray!0 (select (arr!24378 _keys!868) from!1053)))))

(assert (=> b!874456 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!874457 () Bool)

(declare-fun e!487044 () Bool)

(assert (=> b!874457 (= e!487043 e!487044)))

(assert (=> b!874457 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24819 _keys!868)))))

(declare-fun res!593952 () Bool)

(assert (=> b!874457 (= res!593952 (contains!4222 lt!396148 (select (arr!24378 _keys!868) from!1053)))))

(assert (=> b!874457 (=> (not res!593952) (not e!487044))))

(declare-fun b!874458 () Bool)

(assert (=> b!874458 (= e!487046 (ListLongMap!10166 Nil!17239))))

(declare-fun b!874459 () Bool)

(assert (=> b!874459 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24819 _keys!868)))))

(assert (=> b!874459 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24820 _values!688)))))

(assert (=> b!874459 (= e!487044 (= (apply!375 lt!396148 (select (arr!24378 _keys!868) from!1053)) (get!12852 (select (arr!24379 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108853 c!92753) b!874458))

(assert (= (and d!108853 (not c!92753)) b!874448))

(assert (= (and b!874448 c!92756) b!874451))

(assert (= (and b!874448 (not c!92756)) b!874450))

(assert (= (or b!874451 b!874450) bm!38589))

(assert (= (and d!108853 res!593953) b!874455))

(assert (= (and b!874455 res!593951) b!874449))

(assert (= (and b!874449 res!593954) b!874456))

(assert (= (and b!874449 c!92754) b!874457))

(assert (= (and b!874449 (not c!92754)) b!874453))

(assert (= (and b!874457 res!593952) b!874459))

(assert (= (and b!874453 c!92755) b!874452))

(assert (= (and b!874453 (not c!92755)) b!874454))

(declare-fun b_lambda!12175 () Bool)

(assert (=> (not b_lambda!12175) (not b!874451)))

(assert (=> b!874451 t!24275))

(declare-fun b_and!24807 () Bool)

(assert (= b_and!24805 (and (=> t!24275 result!9401) b_and!24807)))

(declare-fun b_lambda!12177 () Bool)

(assert (=> (not b_lambda!12177) (not b!874459)))

(assert (=> b!874459 t!24275))

(declare-fun b_and!24809 () Bool)

(assert (= b_and!24807 (and (=> t!24275 result!9401) b_and!24809)))

(assert (=> b!874451 m!815285))

(declare-fun m!815315 () Bool)

(assert (=> b!874451 m!815315))

(declare-fun m!815317 () Bool)

(assert (=> b!874451 m!815317))

(declare-fun m!815319 () Bool)

(assert (=> b!874451 m!815319))

(assert (=> b!874451 m!815293))

(declare-fun m!815321 () Bool)

(assert (=> b!874451 m!815321))

(assert (=> b!874451 m!815315))

(assert (=> b!874451 m!815293))

(declare-fun m!815323 () Bool)

(assert (=> b!874451 m!815323))

(assert (=> b!874451 m!815317))

(declare-fun m!815325 () Bool)

(assert (=> b!874451 m!815325))

(declare-fun m!815327 () Bool)

(assert (=> d!108853 m!815327))

(assert (=> d!108853 m!815207))

(declare-fun m!815329 () Bool)

(assert (=> b!874455 m!815329))

(assert (=> b!874456 m!815285))

(assert (=> b!874456 m!815285))

(assert (=> b!874456 m!815305))

(assert (=> b!874448 m!815285))

(assert (=> b!874448 m!815285))

(assert (=> b!874448 m!815305))

(declare-fun m!815331 () Bool)

(assert (=> b!874452 m!815331))

(assert (=> b!874457 m!815285))

(assert (=> b!874457 m!815285))

(declare-fun m!815333 () Bool)

(assert (=> b!874457 m!815333))

(assert (=> b!874459 m!815285))

(declare-fun m!815335 () Bool)

(assert (=> b!874459 m!815335))

(assert (=> b!874459 m!815285))

(assert (=> b!874459 m!815315))

(assert (=> b!874459 m!815293))

(assert (=> b!874459 m!815315))

(assert (=> b!874459 m!815293))

(assert (=> b!874459 m!815323))

(declare-fun m!815337 () Bool)

(assert (=> b!874454 m!815337))

(assert (=> bm!38589 m!815331))

(assert (=> b!874313 d!108853))

(declare-fun d!108855 () Bool)

(assert (=> d!108855 (= (array_inv!19286 _keys!868) (bvsge (size!24819 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74410 d!108855))

(declare-fun d!108857 () Bool)

(assert (=> d!108857 (= (array_inv!19287 _values!688) (bvsge (size!24820 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74410 d!108857))

(declare-fun b!874466 () Bool)

(declare-fun e!487052 () Bool)

(assert (=> b!874466 (= e!487052 tp_is_empty!17263)))

(declare-fun b!874467 () Bool)

(declare-fun e!487051 () Bool)

(assert (=> b!874467 (= e!487051 tp_is_empty!17263)))

(declare-fun mapIsEmpty!27509 () Bool)

(declare-fun mapRes!27509 () Bool)

(assert (=> mapIsEmpty!27509 mapRes!27509))

(declare-fun mapNonEmpty!27509 () Bool)

(declare-fun tp!52745 () Bool)

(assert (=> mapNonEmpty!27509 (= mapRes!27509 (and tp!52745 e!487052))))

(declare-fun mapKey!27509 () (_ BitVec 32))

(declare-fun mapRest!27509 () (Array (_ BitVec 32) ValueCell!8192))

(declare-fun mapValue!27509 () ValueCell!8192)

(assert (=> mapNonEmpty!27509 (= mapRest!27500 (store mapRest!27509 mapKey!27509 mapValue!27509))))

(declare-fun condMapEmpty!27509 () Bool)

(declare-fun mapDefault!27509 () ValueCell!8192)

(assert (=> mapNonEmpty!27500 (= condMapEmpty!27509 (= mapRest!27500 ((as const (Array (_ BitVec 32) ValueCell!8192)) mapDefault!27509)))))

(assert (=> mapNonEmpty!27500 (= tp!52729 (and e!487051 mapRes!27509))))

(assert (= (and mapNonEmpty!27500 condMapEmpty!27509) mapIsEmpty!27509))

(assert (= (and mapNonEmpty!27500 (not condMapEmpty!27509)) mapNonEmpty!27509))

(assert (= (and mapNonEmpty!27509 ((_ is ValueCellFull!8192) mapValue!27509)) b!874466))

(assert (= (and mapNonEmpty!27500 ((_ is ValueCellFull!8192) mapDefault!27509)) b!874467))

(declare-fun m!815339 () Bool)

(assert (=> mapNonEmpty!27509 m!815339))

(declare-fun b_lambda!12179 () Bool)

(assert (= b_lambda!12177 (or (and start!74410 b_free!15019) b_lambda!12179)))

(declare-fun b_lambda!12181 () Bool)

(assert (= b_lambda!12173 (or (and start!74410 b_free!15019) b_lambda!12181)))

(declare-fun b_lambda!12183 () Bool)

(assert (= b_lambda!12175 (or (and start!74410 b_free!15019) b_lambda!12183)))

(declare-fun b_lambda!12185 () Bool)

(assert (= b_lambda!12171 (or (and start!74410 b_free!15019) b_lambda!12185)))

(check-sat (not b_lambda!12185) (not b!874451) (not d!108851) (not mapNonEmpty!27509) (not b_lambda!12181) b_and!24809 (not b!874409) (not b!874459) (not b!874448) (not bm!38588) tp_is_empty!17263 (not b!874457) (not d!108853) (not b!874443) (not b!874407) (not b_lambda!12183) (not b!874455) (not bm!38585) (not b!874440) (not bm!38582) (not b!874393) (not b!874434) (not b!874394) (not b!874441) (not b!874445) (not b!874456) (not b!874454) (not b!874442) (not b_next!15019) (not b!874452) (not bm!38589) (not b!874406) (not b!874437) (not b_lambda!12179) (not b!874438))
(check-sat b_and!24809 (not b_next!15019))
