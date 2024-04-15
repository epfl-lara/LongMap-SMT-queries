; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74224 () Bool)

(assert start!74224)

(declare-fun b_free!15019 () Bool)

(declare-fun b_next!15019 () Bool)

(assert (=> start!74224 (= b_free!15019 (not b_next!15019))))

(declare-fun tp!52730 () Bool)

(declare-fun b_and!24761 () Bool)

(assert (=> start!74224 (= tp!52730 b_and!24761)))

(declare-fun res!593415 () Bool)

(declare-fun e!486235 () Bool)

(assert (=> start!74224 (=> (not res!593415) (not e!486235))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50641 0))(
  ( (array!50642 (arr!24350 (Array (_ BitVec 32) (_ BitVec 64))) (size!24792 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50641)

(assert (=> start!74224 (= res!593415 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24792 _keys!868))))))

(assert (=> start!74224 e!486235))

(declare-fun tp_is_empty!17263 () Bool)

(assert (=> start!74224 tp_is_empty!17263))

(assert (=> start!74224 true))

(assert (=> start!74224 tp!52730))

(declare-fun array_inv!19270 (array!50641) Bool)

(assert (=> start!74224 (array_inv!19270 _keys!868)))

(declare-datatypes ((V!28065 0))(
  ( (V!28066 (val!8679 Int)) )
))
(declare-datatypes ((ValueCell!8192 0))(
  ( (ValueCellFull!8192 (v!11102 V!28065)) (EmptyCell!8192) )
))
(declare-datatypes ((array!50643 0))(
  ( (array!50644 (arr!24351 (Array (_ BitVec 32) ValueCell!8192)) (size!24793 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50643)

(declare-fun e!486234 () Bool)

(declare-fun array_inv!19271 (array!50643) Bool)

(assert (=> start!74224 (and (array_inv!19271 _values!688) e!486234)))

(declare-fun b!873164 () Bool)

(declare-fun e!486233 () Bool)

(assert (=> b!873164 (= e!486233 tp_is_empty!17263)))

(declare-fun mapNonEmpty!27500 () Bool)

(declare-fun mapRes!27500 () Bool)

(declare-fun tp!52729 () Bool)

(declare-fun e!486237 () Bool)

(assert (=> mapNonEmpty!27500 (= mapRes!27500 (and tp!52729 e!486237))))

(declare-fun mapKey!27500 () (_ BitVec 32))

(declare-fun mapValue!27500 () ValueCell!8192)

(declare-fun mapRest!27500 () (Array (_ BitVec 32) ValueCell!8192))

(assert (=> mapNonEmpty!27500 (= (arr!24351 _values!688) (store mapRest!27500 mapKey!27500 mapValue!27500))))

(declare-fun b!873165 () Bool)

(assert (=> b!873165 (= e!486234 (and e!486233 mapRes!27500))))

(declare-fun condMapEmpty!27500 () Bool)

(declare-fun mapDefault!27500 () ValueCell!8192)

(assert (=> b!873165 (= condMapEmpty!27500 (= (arr!24351 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8192)) mapDefault!27500)))))

(declare-fun b!873166 () Bool)

(declare-fun res!593414 () Bool)

(assert (=> b!873166 (=> (not res!593414) (not e!486235))))

(declare-datatypes ((List!17297 0))(
  ( (Nil!17294) (Cons!17293 (h!18424 (_ BitVec 64)) (t!24327 List!17297)) )
))
(declare-fun arrayNoDuplicates!0 (array!50641 (_ BitVec 32) List!17297) Bool)

(assert (=> b!873166 (= res!593414 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17294))))

(declare-fun v!557 () V!28065)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun b!873167 () Bool)

(declare-fun minValue!654 () V!28065)

(declare-fun zeroValue!654 () V!28065)

(declare-datatypes ((tuple2!11486 0))(
  ( (tuple2!11487 (_1!5754 (_ BitVec 64)) (_2!5754 V!28065)) )
))
(declare-datatypes ((List!17298 0))(
  ( (Nil!17295) (Cons!17294 (h!18425 tuple2!11486) (t!24328 List!17298)) )
))
(declare-datatypes ((ListLongMap!10245 0))(
  ( (ListLongMap!10246 (toList!5138 List!17298)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3131 (array!50641 array!50643 (_ BitVec 32) (_ BitVec 32) V!28065 V!28065 (_ BitVec 32) Int) ListLongMap!10245)

(assert (=> b!873167 (= e!486235 (not (= (getCurrentListMapNoExtraKeys!3131 _keys!868 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun b!873168 () Bool)

(declare-fun res!593417 () Bool)

(assert (=> b!873168 (=> (not res!593417) (not e!486235))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873168 (= res!593417 (validKeyInArray!0 k0!854))))

(declare-fun b!873169 () Bool)

(declare-fun res!593421 () Bool)

(assert (=> b!873169 (=> (not res!593421) (not e!486235))))

(assert (=> b!873169 (= res!593421 (and (= (size!24793 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24792 _keys!868) (size!24793 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27500 () Bool)

(assert (=> mapIsEmpty!27500 mapRes!27500))

(declare-fun b!873170 () Bool)

(declare-fun res!593418 () Bool)

(assert (=> b!873170 (=> (not res!593418) (not e!486235))))

(assert (=> b!873170 (= res!593418 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24792 _keys!868))))))

(declare-fun b!873171 () Bool)

(declare-fun res!593419 () Bool)

(assert (=> b!873171 (=> (not res!593419) (not e!486235))))

(assert (=> b!873171 (= res!593419 (and (= (select (arr!24350 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24792 _keys!868))))))

(declare-fun b!873172 () Bool)

(declare-fun res!593416 () Bool)

(assert (=> b!873172 (=> (not res!593416) (not e!486235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873172 (= res!593416 (validMask!0 mask!1196))))

(declare-fun b!873173 () Bool)

(declare-fun res!593420 () Bool)

(assert (=> b!873173 (=> (not res!593420) (not e!486235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50641 (_ BitVec 32)) Bool)

(assert (=> b!873173 (= res!593420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873174 () Bool)

(assert (=> b!873174 (= e!486237 tp_is_empty!17263)))

(assert (= (and start!74224 res!593415) b!873172))

(assert (= (and b!873172 res!593416) b!873169))

(assert (= (and b!873169 res!593421) b!873173))

(assert (= (and b!873173 res!593420) b!873166))

(assert (= (and b!873166 res!593414) b!873170))

(assert (= (and b!873170 res!593418) b!873168))

(assert (= (and b!873168 res!593417) b!873171))

(assert (= (and b!873171 res!593419) b!873167))

(assert (= (and b!873165 condMapEmpty!27500) mapIsEmpty!27500))

(assert (= (and b!873165 (not condMapEmpty!27500)) mapNonEmpty!27500))

(get-info :version)

(assert (= (and mapNonEmpty!27500 ((_ is ValueCellFull!8192) mapValue!27500)) b!873174))

(assert (= (and b!873165 ((_ is ValueCellFull!8192) mapDefault!27500)) b!873164))

(assert (= start!74224 b!873165))

(declare-fun m!813155 () Bool)

(assert (=> start!74224 m!813155))

(declare-fun m!813157 () Bool)

(assert (=> start!74224 m!813157))

(declare-fun m!813159 () Bool)

(assert (=> b!873167 m!813159))

(declare-fun m!813161 () Bool)

(assert (=> b!873167 m!813161))

(declare-fun m!813163 () Bool)

(assert (=> b!873167 m!813163))

(declare-fun m!813165 () Bool)

(assert (=> b!873171 m!813165))

(declare-fun m!813167 () Bool)

(assert (=> b!873173 m!813167))

(declare-fun m!813169 () Bool)

(assert (=> b!873172 m!813169))

(declare-fun m!813171 () Bool)

(assert (=> b!873166 m!813171))

(declare-fun m!813173 () Bool)

(assert (=> b!873168 m!813173))

(declare-fun m!813175 () Bool)

(assert (=> mapNonEmpty!27500 m!813175))

(check-sat (not b_next!15019) (not b!873168) (not b!873167) b_and!24761 (not b!873166) (not b!873173) (not b!873172) (not mapNonEmpty!27500) (not start!74224) tp_is_empty!17263)
(check-sat b_and!24761 (not b_next!15019))
(get-model)

(declare-fun b!873251 () Bool)

(declare-fun e!486279 () Bool)

(declare-fun e!486276 () Bool)

(assert (=> b!873251 (= e!486279 e!486276)))

(declare-fun c!92390 () Bool)

(assert (=> b!873251 (= c!92390 (validKeyInArray!0 (select (arr!24350 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108323 () Bool)

(declare-fun res!593477 () Bool)

(declare-fun e!486278 () Bool)

(assert (=> d!108323 (=> res!593477 e!486278)))

(assert (=> d!108323 (= res!593477 (bvsge #b00000000000000000000000000000000 (size!24792 _keys!868)))))

(assert (=> d!108323 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17294) e!486278)))

(declare-fun bm!38511 () Bool)

(declare-fun call!38514 () Bool)

(assert (=> bm!38511 (= call!38514 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92390 (Cons!17293 (select (arr!24350 _keys!868) #b00000000000000000000000000000000) Nil!17294) Nil!17294)))))

(declare-fun b!873252 () Bool)

(assert (=> b!873252 (= e!486276 call!38514)))

(declare-fun b!873253 () Bool)

(assert (=> b!873253 (= e!486276 call!38514)))

(declare-fun b!873254 () Bool)

(assert (=> b!873254 (= e!486278 e!486279)))

(declare-fun res!593476 () Bool)

(assert (=> b!873254 (=> (not res!593476) (not e!486279))))

(declare-fun e!486277 () Bool)

(assert (=> b!873254 (= res!593476 (not e!486277))))

(declare-fun res!593478 () Bool)

(assert (=> b!873254 (=> (not res!593478) (not e!486277))))

(assert (=> b!873254 (= res!593478 (validKeyInArray!0 (select (arr!24350 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!873255 () Bool)

(declare-fun contains!4217 (List!17297 (_ BitVec 64)) Bool)

(assert (=> b!873255 (= e!486277 (contains!4217 Nil!17294 (select (arr!24350 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108323 (not res!593477)) b!873254))

(assert (= (and b!873254 res!593478) b!873255))

(assert (= (and b!873254 res!593476) b!873251))

(assert (= (and b!873251 c!92390) b!873252))

(assert (= (and b!873251 (not c!92390)) b!873253))

(assert (= (or b!873252 b!873253) bm!38511))

(declare-fun m!813221 () Bool)

(assert (=> b!873251 m!813221))

(assert (=> b!873251 m!813221))

(declare-fun m!813223 () Bool)

(assert (=> b!873251 m!813223))

(assert (=> bm!38511 m!813221))

(declare-fun m!813225 () Bool)

(assert (=> bm!38511 m!813225))

(assert (=> b!873254 m!813221))

(assert (=> b!873254 m!813221))

(assert (=> b!873254 m!813223))

(assert (=> b!873255 m!813221))

(assert (=> b!873255 m!813221))

(declare-fun m!813227 () Bool)

(assert (=> b!873255 m!813227))

(assert (=> b!873166 d!108323))

(declare-fun b!873280 () Bool)

(declare-fun e!486299 () ListLongMap!10245)

(assert (=> b!873280 (= e!486299 (ListLongMap!10246 Nil!17295))))

(declare-fun b!873281 () Bool)

(assert (=> b!873281 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24792 _keys!868)))))

(assert (=> b!873281 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24793 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688)))))))

(declare-fun lt!395534 () ListLongMap!10245)

(declare-fun e!486296 () Bool)

(declare-fun apply!375 (ListLongMap!10245 (_ BitVec 64)) V!28065)

(declare-fun get!12825 (ValueCell!8192 V!28065) V!28065)

(declare-fun dynLambda!1202 (Int (_ BitVec 64)) V!28065)

(assert (=> b!873281 (= e!486296 (= (apply!375 lt!395534 (select (arr!24350 _keys!868) from!1053)) (get!12825 (select (arr!24351 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688))) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!873282 () Bool)

(declare-fun e!486298 () Bool)

(declare-fun isEmpty!666 (ListLongMap!10245) Bool)

(assert (=> b!873282 (= e!486298 (isEmpty!666 lt!395534))))

(declare-fun b!873283 () Bool)

(declare-fun res!593489 () Bool)

(declare-fun e!486300 () Bool)

(assert (=> b!873283 (=> (not res!593489) (not e!486300))))

(declare-fun contains!4218 (ListLongMap!10245 (_ BitVec 64)) Bool)

(assert (=> b!873283 (= res!593489 (not (contains!4218 lt!395534 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873284 () Bool)

(declare-fun e!486295 () Bool)

(assert (=> b!873284 (= e!486300 e!486295)))

(declare-fun c!92400 () Bool)

(declare-fun e!486297 () Bool)

(assert (=> b!873284 (= c!92400 e!486297)))

(declare-fun res!593490 () Bool)

(assert (=> b!873284 (=> (not res!593490) (not e!486297))))

(assert (=> b!873284 (= res!593490 (bvslt from!1053 (size!24792 _keys!868)))))

(declare-fun b!873285 () Bool)

(declare-fun e!486294 () ListLongMap!10245)

(declare-fun call!38517 () ListLongMap!10245)

(assert (=> b!873285 (= e!486294 call!38517)))

(declare-fun d!108325 () Bool)

(assert (=> d!108325 e!486300))

(declare-fun res!593487 () Bool)

(assert (=> d!108325 (=> (not res!593487) (not e!486300))))

(assert (=> d!108325 (= res!593487 (not (contains!4218 lt!395534 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108325 (= lt!395534 e!486299)))

(declare-fun c!92402 () Bool)

(assert (=> d!108325 (= c!92402 (bvsge from!1053 (size!24792 _keys!868)))))

(assert (=> d!108325 (validMask!0 mask!1196)))

(assert (=> d!108325 (= (getCurrentListMapNoExtraKeys!3131 _keys!868 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395534)))

(declare-fun bm!38514 () Bool)

(assert (=> bm!38514 (= call!38517 (getCurrentListMapNoExtraKeys!3131 _keys!868 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873286 () Bool)

(assert (=> b!873286 (= e!486295 e!486296)))

(assert (=> b!873286 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24792 _keys!868)))))

(declare-fun res!593488 () Bool)

(assert (=> b!873286 (= res!593488 (contains!4218 lt!395534 (select (arr!24350 _keys!868) from!1053)))))

(assert (=> b!873286 (=> (not res!593488) (not e!486296))))

(declare-fun b!873287 () Bool)

(assert (=> b!873287 (= e!486299 e!486294)))

(declare-fun c!92401 () Bool)

(assert (=> b!873287 (= c!92401 (validKeyInArray!0 (select (arr!24350 _keys!868) from!1053)))))

(declare-fun b!873288 () Bool)

(declare-datatypes ((Unit!29877 0))(
  ( (Unit!29878) )
))
(declare-fun lt!395538 () Unit!29877)

(declare-fun lt!395536 () Unit!29877)

(assert (=> b!873288 (= lt!395538 lt!395536)))

(declare-fun lt!395540 () (_ BitVec 64))

(declare-fun lt!395537 () V!28065)

(declare-fun lt!395535 () ListLongMap!10245)

(declare-fun lt!395539 () (_ BitVec 64))

(declare-fun +!2492 (ListLongMap!10245 tuple2!11486) ListLongMap!10245)

(assert (=> b!873288 (not (contains!4218 (+!2492 lt!395535 (tuple2!11487 lt!395540 lt!395537)) lt!395539))))

(declare-fun addStillNotContains!201 (ListLongMap!10245 (_ BitVec 64) V!28065 (_ BitVec 64)) Unit!29877)

(assert (=> b!873288 (= lt!395536 (addStillNotContains!201 lt!395535 lt!395540 lt!395537 lt!395539))))

(assert (=> b!873288 (= lt!395539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873288 (= lt!395537 (get!12825 (select (arr!24351 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688))) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873288 (= lt!395540 (select (arr!24350 _keys!868) from!1053))))

(assert (=> b!873288 (= lt!395535 call!38517)))

(assert (=> b!873288 (= e!486294 (+!2492 call!38517 (tuple2!11487 (select (arr!24350 _keys!868) from!1053) (get!12825 (select (arr!24351 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688))) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873289 () Bool)

(assert (=> b!873289 (= e!486295 e!486298)))

(declare-fun c!92399 () Bool)

(assert (=> b!873289 (= c!92399 (bvslt from!1053 (size!24792 _keys!868)))))

(declare-fun b!873290 () Bool)

(assert (=> b!873290 (= e!486297 (validKeyInArray!0 (select (arr!24350 _keys!868) from!1053)))))

(assert (=> b!873290 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!873291 () Bool)

(assert (=> b!873291 (= e!486298 (= lt!395534 (getCurrentListMapNoExtraKeys!3131 _keys!868 (array!50644 (store (arr!24351 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24793 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(assert (= (and d!108325 c!92402) b!873280))

(assert (= (and d!108325 (not c!92402)) b!873287))

(assert (= (and b!873287 c!92401) b!873288))

(assert (= (and b!873287 (not c!92401)) b!873285))

(assert (= (or b!873288 b!873285) bm!38514))

(assert (= (and d!108325 res!593487) b!873283))

(assert (= (and b!873283 res!593489) b!873284))

(assert (= (and b!873284 res!593490) b!873290))

(assert (= (and b!873284 c!92400) b!873286))

(assert (= (and b!873284 (not c!92400)) b!873289))

(assert (= (and b!873286 res!593488) b!873281))

(assert (= (and b!873289 c!92399) b!873291))

(assert (= (and b!873289 (not c!92399)) b!873282))

(declare-fun b_lambda!12139 () Bool)

(assert (=> (not b_lambda!12139) (not b!873281)))

(declare-fun t!24330 () Bool)

(declare-fun tb!4889 () Bool)

(assert (=> (and start!74224 (= defaultEntry!696 defaultEntry!696) t!24330) tb!4889))

(declare-fun result!9401 () Bool)

(assert (=> tb!4889 (= result!9401 tp_is_empty!17263)))

(assert (=> b!873281 t!24330))

(declare-fun b_and!24767 () Bool)

(assert (= b_and!24761 (and (=> t!24330 result!9401) b_and!24767)))

(declare-fun b_lambda!12141 () Bool)

(assert (=> (not b_lambda!12141) (not b!873288)))

(assert (=> b!873288 t!24330))

(declare-fun b_and!24769 () Bool)

(assert (= b_and!24767 (and (=> t!24330 result!9401) b_and!24769)))

(declare-fun m!813229 () Bool)

(assert (=> b!873281 m!813229))

(declare-fun m!813231 () Bool)

(assert (=> b!873281 m!813231))

(declare-fun m!813233 () Bool)

(assert (=> b!873281 m!813233))

(declare-fun m!813235 () Bool)

(assert (=> b!873281 m!813235))

(assert (=> b!873281 m!813233))

(assert (=> b!873281 m!813231))

(assert (=> b!873281 m!813229))

(declare-fun m!813237 () Bool)

(assert (=> b!873281 m!813237))

(assert (=> b!873287 m!813233))

(assert (=> b!873287 m!813233))

(declare-fun m!813239 () Bool)

(assert (=> b!873287 m!813239))

(declare-fun m!813241 () Bool)

(assert (=> d!108325 m!813241))

(assert (=> d!108325 m!813169))

(assert (=> b!873286 m!813233))

(assert (=> b!873286 m!813233))

(declare-fun m!813243 () Bool)

(assert (=> b!873286 m!813243))

(declare-fun m!813245 () Bool)

(assert (=> bm!38514 m!813245))

(declare-fun m!813247 () Bool)

(assert (=> b!873288 m!813247))

(assert (=> b!873288 m!813229))

(assert (=> b!873288 m!813231))

(assert (=> b!873288 m!813233))

(declare-fun m!813249 () Bool)

(assert (=> b!873288 m!813249))

(assert (=> b!873288 m!813231))

(assert (=> b!873288 m!813229))

(assert (=> b!873288 m!813237))

(declare-fun m!813251 () Bool)

(assert (=> b!873288 m!813251))

(declare-fun m!813253 () Bool)

(assert (=> b!873288 m!813253))

(assert (=> b!873288 m!813251))

(assert (=> b!873291 m!813245))

(declare-fun m!813255 () Bool)

(assert (=> b!873282 m!813255))

(assert (=> b!873290 m!813233))

(assert (=> b!873290 m!813233))

(assert (=> b!873290 m!813239))

(declare-fun m!813257 () Bool)

(assert (=> b!873283 m!813257))

(assert (=> b!873167 d!108325))

(declare-fun b!873294 () Bool)

(declare-fun e!486306 () ListLongMap!10245)

(assert (=> b!873294 (= e!486306 (ListLongMap!10246 Nil!17295))))

(declare-fun b!873295 () Bool)

(assert (=> b!873295 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24792 _keys!868)))))

(assert (=> b!873295 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24793 _values!688)))))

(declare-fun lt!395541 () ListLongMap!10245)

(declare-fun e!486303 () Bool)

(assert (=> b!873295 (= e!486303 (= (apply!375 lt!395541 (select (arr!24350 _keys!868) from!1053)) (get!12825 (select (arr!24351 _values!688) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!873296 () Bool)

(declare-fun e!486305 () Bool)

(assert (=> b!873296 (= e!486305 (isEmpty!666 lt!395541))))

(declare-fun b!873297 () Bool)

(declare-fun res!593493 () Bool)

(declare-fun e!486307 () Bool)

(assert (=> b!873297 (=> (not res!593493) (not e!486307))))

(assert (=> b!873297 (= res!593493 (not (contains!4218 lt!395541 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873298 () Bool)

(declare-fun e!486302 () Bool)

(assert (=> b!873298 (= e!486307 e!486302)))

(declare-fun c!92404 () Bool)

(declare-fun e!486304 () Bool)

(assert (=> b!873298 (= c!92404 e!486304)))

(declare-fun res!593494 () Bool)

(assert (=> b!873298 (=> (not res!593494) (not e!486304))))

(assert (=> b!873298 (= res!593494 (bvslt from!1053 (size!24792 _keys!868)))))

(declare-fun b!873299 () Bool)

(declare-fun e!486301 () ListLongMap!10245)

(declare-fun call!38518 () ListLongMap!10245)

(assert (=> b!873299 (= e!486301 call!38518)))

(declare-fun d!108327 () Bool)

(assert (=> d!108327 e!486307))

(declare-fun res!593491 () Bool)

(assert (=> d!108327 (=> (not res!593491) (not e!486307))))

(assert (=> d!108327 (= res!593491 (not (contains!4218 lt!395541 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108327 (= lt!395541 e!486306)))

(declare-fun c!92406 () Bool)

(assert (=> d!108327 (= c!92406 (bvsge from!1053 (size!24792 _keys!868)))))

(assert (=> d!108327 (validMask!0 mask!1196)))

(assert (=> d!108327 (= (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395541)))

(declare-fun bm!38515 () Bool)

(assert (=> bm!38515 (= call!38518 (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873300 () Bool)

(assert (=> b!873300 (= e!486302 e!486303)))

(assert (=> b!873300 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24792 _keys!868)))))

(declare-fun res!593492 () Bool)

(assert (=> b!873300 (= res!593492 (contains!4218 lt!395541 (select (arr!24350 _keys!868) from!1053)))))

(assert (=> b!873300 (=> (not res!593492) (not e!486303))))

(declare-fun b!873301 () Bool)

(assert (=> b!873301 (= e!486306 e!486301)))

(declare-fun c!92405 () Bool)

(assert (=> b!873301 (= c!92405 (validKeyInArray!0 (select (arr!24350 _keys!868) from!1053)))))

(declare-fun b!873302 () Bool)

(declare-fun lt!395545 () Unit!29877)

(declare-fun lt!395543 () Unit!29877)

(assert (=> b!873302 (= lt!395545 lt!395543)))

(declare-fun lt!395544 () V!28065)

(declare-fun lt!395546 () (_ BitVec 64))

(declare-fun lt!395542 () ListLongMap!10245)

(declare-fun lt!395547 () (_ BitVec 64))

(assert (=> b!873302 (not (contains!4218 (+!2492 lt!395542 (tuple2!11487 lt!395547 lt!395544)) lt!395546))))

(assert (=> b!873302 (= lt!395543 (addStillNotContains!201 lt!395542 lt!395547 lt!395544 lt!395546))))

(assert (=> b!873302 (= lt!395546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873302 (= lt!395544 (get!12825 (select (arr!24351 _values!688) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873302 (= lt!395547 (select (arr!24350 _keys!868) from!1053))))

(assert (=> b!873302 (= lt!395542 call!38518)))

(assert (=> b!873302 (= e!486301 (+!2492 call!38518 (tuple2!11487 (select (arr!24350 _keys!868) from!1053) (get!12825 (select (arr!24351 _values!688) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873303 () Bool)

(assert (=> b!873303 (= e!486302 e!486305)))

(declare-fun c!92403 () Bool)

(assert (=> b!873303 (= c!92403 (bvslt from!1053 (size!24792 _keys!868)))))

(declare-fun b!873304 () Bool)

(assert (=> b!873304 (= e!486304 (validKeyInArray!0 (select (arr!24350 _keys!868) from!1053)))))

(assert (=> b!873304 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!873305 () Bool)

(assert (=> b!873305 (= e!486305 (= lt!395541 (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(assert (= (and d!108327 c!92406) b!873294))

(assert (= (and d!108327 (not c!92406)) b!873301))

(assert (= (and b!873301 c!92405) b!873302))

(assert (= (and b!873301 (not c!92405)) b!873299))

(assert (= (or b!873302 b!873299) bm!38515))

(assert (= (and d!108327 res!593491) b!873297))

(assert (= (and b!873297 res!593493) b!873298))

(assert (= (and b!873298 res!593494) b!873304))

(assert (= (and b!873298 c!92404) b!873300))

(assert (= (and b!873298 (not c!92404)) b!873303))

(assert (= (and b!873300 res!593492) b!873295))

(assert (= (and b!873303 c!92403) b!873305))

(assert (= (and b!873303 (not c!92403)) b!873296))

(declare-fun b_lambda!12143 () Bool)

(assert (=> (not b_lambda!12143) (not b!873295)))

(assert (=> b!873295 t!24330))

(declare-fun b_and!24771 () Bool)

(assert (= b_and!24769 (and (=> t!24330 result!9401) b_and!24771)))

(declare-fun b_lambda!12145 () Bool)

(assert (=> (not b_lambda!12145) (not b!873302)))

(assert (=> b!873302 t!24330))

(declare-fun b_and!24773 () Bool)

(assert (= b_and!24771 (and (=> t!24330 result!9401) b_and!24773)))

(assert (=> b!873295 m!813229))

(declare-fun m!813259 () Bool)

(assert (=> b!873295 m!813259))

(assert (=> b!873295 m!813233))

(declare-fun m!813261 () Bool)

(assert (=> b!873295 m!813261))

(assert (=> b!873295 m!813233))

(assert (=> b!873295 m!813259))

(assert (=> b!873295 m!813229))

(declare-fun m!813263 () Bool)

(assert (=> b!873295 m!813263))

(assert (=> b!873301 m!813233))

(assert (=> b!873301 m!813233))

(assert (=> b!873301 m!813239))

(declare-fun m!813265 () Bool)

(assert (=> d!108327 m!813265))

(assert (=> d!108327 m!813169))

(assert (=> b!873300 m!813233))

(assert (=> b!873300 m!813233))

(declare-fun m!813267 () Bool)

(assert (=> b!873300 m!813267))

(declare-fun m!813269 () Bool)

(assert (=> bm!38515 m!813269))

(declare-fun m!813271 () Bool)

(assert (=> b!873302 m!813271))

(assert (=> b!873302 m!813229))

(assert (=> b!873302 m!813259))

(assert (=> b!873302 m!813233))

(declare-fun m!813273 () Bool)

(assert (=> b!873302 m!813273))

(assert (=> b!873302 m!813259))

(assert (=> b!873302 m!813229))

(assert (=> b!873302 m!813263))

(declare-fun m!813275 () Bool)

(assert (=> b!873302 m!813275))

(declare-fun m!813277 () Bool)

(assert (=> b!873302 m!813277))

(assert (=> b!873302 m!813275))

(assert (=> b!873305 m!813269))

(declare-fun m!813279 () Bool)

(assert (=> b!873296 m!813279))

(assert (=> b!873304 m!813233))

(assert (=> b!873304 m!813233))

(assert (=> b!873304 m!813239))

(declare-fun m!813281 () Bool)

(assert (=> b!873297 m!813281))

(assert (=> b!873167 d!108327))

(declare-fun d!108329 () Bool)

(assert (=> d!108329 (= (array_inv!19270 _keys!868) (bvsge (size!24792 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74224 d!108329))

(declare-fun d!108331 () Bool)

(assert (=> d!108331 (= (array_inv!19271 _values!688) (bvsge (size!24793 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74224 d!108331))

(declare-fun d!108333 () Bool)

(assert (=> d!108333 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!873168 d!108333))

(declare-fun d!108335 () Bool)

(assert (=> d!108335 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!873172 d!108335))

(declare-fun d!108337 () Bool)

(declare-fun res!593499 () Bool)

(declare-fun e!486315 () Bool)

(assert (=> d!108337 (=> res!593499 e!486315)))

(assert (=> d!108337 (= res!593499 (bvsge #b00000000000000000000000000000000 (size!24792 _keys!868)))))

(assert (=> d!108337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!486315)))

(declare-fun b!873314 () Bool)

(declare-fun e!486314 () Bool)

(declare-fun call!38521 () Bool)

(assert (=> b!873314 (= e!486314 call!38521)))

(declare-fun b!873315 () Bool)

(declare-fun e!486316 () Bool)

(assert (=> b!873315 (= e!486314 e!486316)))

(declare-fun lt!395556 () (_ BitVec 64))

(assert (=> b!873315 (= lt!395556 (select (arr!24350 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!395554 () Unit!29877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50641 (_ BitVec 64) (_ BitVec 32)) Unit!29877)

(assert (=> b!873315 (= lt!395554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!395556 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!873315 (arrayContainsKey!0 _keys!868 lt!395556 #b00000000000000000000000000000000)))

(declare-fun lt!395555 () Unit!29877)

(assert (=> b!873315 (= lt!395555 lt!395554)))

(declare-fun res!593500 () Bool)

(declare-datatypes ((SeekEntryResult!8747 0))(
  ( (MissingZero!8747 (index!37359 (_ BitVec 32))) (Found!8747 (index!37360 (_ BitVec 32))) (Intermediate!8747 (undefined!9559 Bool) (index!37361 (_ BitVec 32)) (x!74009 (_ BitVec 32))) (Undefined!8747) (MissingVacant!8747 (index!37362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50641 (_ BitVec 32)) SeekEntryResult!8747)

(assert (=> b!873315 (= res!593500 (= (seekEntryOrOpen!0 (select (arr!24350 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8747 #b00000000000000000000000000000000)))))

(assert (=> b!873315 (=> (not res!593500) (not e!486316))))

(declare-fun b!873316 () Bool)

(assert (=> b!873316 (= e!486316 call!38521)))

(declare-fun bm!38518 () Bool)

(assert (=> bm!38518 (= call!38521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!873317 () Bool)

(assert (=> b!873317 (= e!486315 e!486314)))

(declare-fun c!92409 () Bool)

(assert (=> b!873317 (= c!92409 (validKeyInArray!0 (select (arr!24350 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108337 (not res!593499)) b!873317))

(assert (= (and b!873317 c!92409) b!873315))

(assert (= (and b!873317 (not c!92409)) b!873314))

(assert (= (and b!873315 res!593500) b!873316))

(assert (= (or b!873316 b!873314) bm!38518))

(assert (=> b!873315 m!813221))

(declare-fun m!813283 () Bool)

(assert (=> b!873315 m!813283))

(declare-fun m!813285 () Bool)

(assert (=> b!873315 m!813285))

(assert (=> b!873315 m!813221))

(declare-fun m!813287 () Bool)

(assert (=> b!873315 m!813287))

(declare-fun m!813289 () Bool)

(assert (=> bm!38518 m!813289))

(assert (=> b!873317 m!813221))

(assert (=> b!873317 m!813221))

(assert (=> b!873317 m!813223))

(assert (=> b!873173 d!108337))

(declare-fun b!873325 () Bool)

(declare-fun e!486322 () Bool)

(assert (=> b!873325 (= e!486322 tp_is_empty!17263)))

(declare-fun mapNonEmpty!27509 () Bool)

(declare-fun mapRes!27509 () Bool)

(declare-fun tp!52745 () Bool)

(declare-fun e!486321 () Bool)

(assert (=> mapNonEmpty!27509 (= mapRes!27509 (and tp!52745 e!486321))))

(declare-fun mapValue!27509 () ValueCell!8192)

(declare-fun mapRest!27509 () (Array (_ BitVec 32) ValueCell!8192))

(declare-fun mapKey!27509 () (_ BitVec 32))

(assert (=> mapNonEmpty!27509 (= mapRest!27500 (store mapRest!27509 mapKey!27509 mapValue!27509))))

(declare-fun b!873324 () Bool)

(assert (=> b!873324 (= e!486321 tp_is_empty!17263)))

(declare-fun condMapEmpty!27509 () Bool)

(declare-fun mapDefault!27509 () ValueCell!8192)

(assert (=> mapNonEmpty!27500 (= condMapEmpty!27509 (= mapRest!27500 ((as const (Array (_ BitVec 32) ValueCell!8192)) mapDefault!27509)))))

(assert (=> mapNonEmpty!27500 (= tp!52729 (and e!486322 mapRes!27509))))

(declare-fun mapIsEmpty!27509 () Bool)

(assert (=> mapIsEmpty!27509 mapRes!27509))

(assert (= (and mapNonEmpty!27500 condMapEmpty!27509) mapIsEmpty!27509))

(assert (= (and mapNonEmpty!27500 (not condMapEmpty!27509)) mapNonEmpty!27509))

(assert (= (and mapNonEmpty!27509 ((_ is ValueCellFull!8192) mapValue!27509)) b!873324))

(assert (= (and mapNonEmpty!27500 ((_ is ValueCellFull!8192) mapDefault!27509)) b!873325))

(declare-fun m!813291 () Bool)

(assert (=> mapNonEmpty!27509 m!813291))

(declare-fun b_lambda!12147 () Bool)

(assert (= b_lambda!12139 (or (and start!74224 b_free!15019) b_lambda!12147)))

(declare-fun b_lambda!12149 () Bool)

(assert (= b_lambda!12145 (or (and start!74224 b_free!15019) b_lambda!12149)))

(declare-fun b_lambda!12151 () Bool)

(assert (= b_lambda!12143 (or (and start!74224 b_free!15019) b_lambda!12151)))

(declare-fun b_lambda!12153 () Bool)

(assert (= b_lambda!12141 (or (and start!74224 b_free!15019) b_lambda!12153)))

(check-sat (not b_lambda!12153) (not b!873290) (not b_lambda!12147) (not b!873297) (not bm!38515) (not d!108327) (not b!873317) (not b!873305) (not b!873295) (not b!873296) (not d!108325) (not b!873302) (not b_next!15019) (not b!873255) (not b!873315) (not b!873300) (not b!873304) (not b!873301) (not b!873286) (not bm!38514) (not b!873283) (not mapNonEmpty!27509) (not b!873251) (not b_lambda!12149) (not b!873291) (not b!873282) (not b_lambda!12151) (not b!873287) (not b!873281) (not b!873288) tp_is_empty!17263 b_and!24773 (not bm!38511) (not b!873254) (not bm!38518))
(check-sat b_and!24773 (not b_next!15019))
