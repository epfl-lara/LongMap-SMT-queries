; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74766 () Bool)

(assert start!74766)

(declare-fun b_free!15369 () Bool)

(declare-fun b_next!15369 () Bool)

(assert (=> start!74766 (= b_free!15369 (not b_next!15369))))

(declare-fun tp!53801 () Bool)

(declare-fun b_and!25389 () Bool)

(assert (=> start!74766 (= tp!53801 b_and!25389)))

(declare-fun b!881415 () Bool)

(declare-fun res!598816 () Bool)

(declare-fun e!490522 () Bool)

(assert (=> b!881415 (=> (not res!598816) (not e!490522))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51354 0))(
  ( (array!51355 (arr!24699 (Array (_ BitVec 32) (_ BitVec 64))) (size!25139 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51354)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881415 (= res!598816 (and (= (select (arr!24699 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881416 () Bool)

(declare-fun e!490523 () Bool)

(declare-fun e!490519 () Bool)

(assert (=> b!881416 (= e!490523 e!490519)))

(declare-fun res!598812 () Bool)

(assert (=> b!881416 (=> res!598812 e!490519)))

(assert (=> b!881416 (= res!598812 (not (= (select (arr!24699 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!28531 0))(
  ( (V!28532 (val!8854 Int)) )
))
(declare-datatypes ((ValueCell!8367 0))(
  ( (ValueCellFull!8367 (v!11310 V!28531)) (EmptyCell!8367) )
))
(declare-datatypes ((array!51356 0))(
  ( (array!51357 (arr!24700 (Array (_ BitVec 32) ValueCell!8367)) (size!25140 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51356)

(declare-datatypes ((tuple2!11720 0))(
  ( (tuple2!11721 (_1!5871 (_ BitVec 64)) (_2!5871 V!28531)) )
))
(declare-datatypes ((List!17534 0))(
  ( (Nil!17531) (Cons!17530 (h!18661 tuple2!11720) (t!24705 List!17534)) )
))
(declare-datatypes ((ListLongMap!10489 0))(
  ( (ListLongMap!10490 (toList!5260 List!17534)) )
))
(declare-fun lt!398648 () ListLongMap!10489)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398653 () ListLongMap!10489)

(declare-fun +!2532 (ListLongMap!10489 tuple2!11720) ListLongMap!10489)

(declare-fun get!12996 (ValueCell!8367 V!28531) V!28531)

(declare-fun dynLambda!1247 (Int (_ BitVec 64)) V!28531)

(assert (=> b!881416 (= lt!398653 (+!2532 lt!398648 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881417 () Bool)

(declare-fun res!598822 () Bool)

(assert (=> b!881417 (=> (not res!598822) (not e!490522))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!881417 (= res!598822 (and (= (size!25140 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25139 _keys!868) (size!25140 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!598813 () Bool)

(assert (=> start!74766 (=> (not res!598813) (not e!490522))))

(assert (=> start!74766 (= res!598813 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25139 _keys!868))))))

(assert (=> start!74766 e!490522))

(declare-fun tp_is_empty!17613 () Bool)

(assert (=> start!74766 tp_is_empty!17613))

(assert (=> start!74766 true))

(assert (=> start!74766 tp!53801))

(declare-fun array_inv!19452 (array!51354) Bool)

(assert (=> start!74766 (array_inv!19452 _keys!868)))

(declare-fun e!490521 () Bool)

(declare-fun array_inv!19453 (array!51356) Bool)

(assert (=> start!74766 (and (array_inv!19453 _values!688) e!490521)))

(declare-fun b!881418 () Bool)

(declare-fun e!490520 () Bool)

(assert (=> b!881418 (= e!490522 e!490520)))

(declare-fun res!598815 () Bool)

(assert (=> b!881418 (=> (not res!598815) (not e!490520))))

(assert (=> b!881418 (= res!598815 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398655 () array!51356)

(declare-fun minValue!654 () V!28531)

(declare-fun zeroValue!654 () V!28531)

(declare-fun getCurrentListMapNoExtraKeys!3223 (array!51354 array!51356 (_ BitVec 32) (_ BitVec 32) V!28531 V!28531 (_ BitVec 32) Int) ListLongMap!10489)

(assert (=> b!881418 (= lt!398653 (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28531)

(assert (=> b!881418 (= lt!398655 (array!51357 (store (arr!24700 _values!688) i!612 (ValueCellFull!8367 v!557)) (size!25140 _values!688)))))

(declare-fun lt!398651 () ListLongMap!10489)

(assert (=> b!881418 (= lt!398651 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881419 () Bool)

(declare-fun res!598819 () Bool)

(assert (=> b!881419 (=> (not res!598819) (not e!490522))))

(assert (=> b!881419 (= res!598819 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25139 _keys!868))))))

(declare-fun b!881420 () Bool)

(assert (=> b!881420 (= e!490520 (not e!490523))))

(declare-fun res!598820 () Bool)

(assert (=> b!881420 (=> res!598820 e!490523)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881420 (= res!598820 (not (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053))))))

(declare-fun lt!398652 () ListLongMap!10489)

(assert (=> b!881420 (= lt!398652 lt!398648)))

(declare-fun lt!398654 () ListLongMap!10489)

(assert (=> b!881420 (= lt!398648 (+!2532 lt!398654 (tuple2!11721 k0!854 v!557)))))

(assert (=> b!881420 (= lt!398652 (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881420 (= lt!398654 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30082 0))(
  ( (Unit!30083) )
))
(declare-fun lt!398650 () Unit!30082)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!721 (array!51354 array!51356 (_ BitVec 32) (_ BitVec 32) V!28531 V!28531 (_ BitVec 32) (_ BitVec 64) V!28531 (_ BitVec 32) Int) Unit!30082)

(assert (=> b!881420 (= lt!398650 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!721 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881421 () Bool)

(declare-fun res!598814 () Bool)

(assert (=> b!881421 (=> (not res!598814) (not e!490522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51354 (_ BitVec 32)) Bool)

(assert (=> b!881421 (= res!598814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881422 () Bool)

(declare-fun e!490518 () Bool)

(declare-fun mapRes!28047 () Bool)

(assert (=> b!881422 (= e!490521 (and e!490518 mapRes!28047))))

(declare-fun condMapEmpty!28047 () Bool)

(declare-fun mapDefault!28047 () ValueCell!8367)

(assert (=> b!881422 (= condMapEmpty!28047 (= (arr!24700 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8367)) mapDefault!28047)))))

(declare-fun b!881423 () Bool)

(declare-fun res!598817 () Bool)

(assert (=> b!881423 (=> (not res!598817) (not e!490522))))

(declare-datatypes ((List!17535 0))(
  ( (Nil!17532) (Cons!17531 (h!18662 (_ BitVec 64)) (t!24706 List!17535)) )
))
(declare-fun arrayNoDuplicates!0 (array!51354 (_ BitVec 32) List!17535) Bool)

(assert (=> b!881423 (= res!598817 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17532))))

(declare-fun mapIsEmpty!28047 () Bool)

(assert (=> mapIsEmpty!28047 mapRes!28047))

(declare-fun b!881424 () Bool)

(assert (=> b!881424 (= e!490518 tp_is_empty!17613)))

(declare-fun b!881425 () Bool)

(declare-fun res!598818 () Bool)

(assert (=> b!881425 (=> (not res!598818) (not e!490522))))

(assert (=> b!881425 (= res!598818 (validKeyInArray!0 k0!854))))

(declare-fun b!881426 () Bool)

(declare-fun res!598821 () Bool)

(assert (=> b!881426 (=> (not res!598821) (not e!490522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881426 (= res!598821 (validMask!0 mask!1196))))

(declare-fun b!881427 () Bool)

(declare-fun e!490524 () Bool)

(assert (=> b!881427 (= e!490524 tp_is_empty!17613)))

(declare-fun b!881428 () Bool)

(assert (=> b!881428 (= e!490519 (bvslt (size!25139 _keys!868) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!51354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881428 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398656 () Unit!30082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> b!881428 (= lt!398656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881428 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17532)))

(declare-fun lt!398649 () Unit!30082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51354 (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> b!881428 (= lt!398649 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!28047 () Bool)

(declare-fun tp!53800 () Bool)

(assert (=> mapNonEmpty!28047 (= mapRes!28047 (and tp!53800 e!490524))))

(declare-fun mapValue!28047 () ValueCell!8367)

(declare-fun mapRest!28047 () (Array (_ BitVec 32) ValueCell!8367))

(declare-fun mapKey!28047 () (_ BitVec 32))

(assert (=> mapNonEmpty!28047 (= (arr!24700 _values!688) (store mapRest!28047 mapKey!28047 mapValue!28047))))

(assert (= (and start!74766 res!598813) b!881426))

(assert (= (and b!881426 res!598821) b!881417))

(assert (= (and b!881417 res!598822) b!881421))

(assert (= (and b!881421 res!598814) b!881423))

(assert (= (and b!881423 res!598817) b!881419))

(assert (= (and b!881419 res!598819) b!881425))

(assert (= (and b!881425 res!598818) b!881415))

(assert (= (and b!881415 res!598816) b!881418))

(assert (= (and b!881418 res!598815) b!881420))

(assert (= (and b!881420 (not res!598820)) b!881416))

(assert (= (and b!881416 (not res!598812)) b!881428))

(assert (= (and b!881422 condMapEmpty!28047) mapIsEmpty!28047))

(assert (= (and b!881422 (not condMapEmpty!28047)) mapNonEmpty!28047))

(get-info :version)

(assert (= (and mapNonEmpty!28047 ((_ is ValueCellFull!8367) mapValue!28047)) b!881427))

(assert (= (and b!881422 ((_ is ValueCellFull!8367) mapDefault!28047)) b!881424))

(assert (= start!74766 b!881422))

(declare-fun b_lambda!12545 () Bool)

(assert (=> (not b_lambda!12545) (not b!881416)))

(declare-fun t!24704 () Bool)

(declare-fun tb!5027 () Bool)

(assert (=> (and start!74766 (= defaultEntry!696 defaultEntry!696) t!24704) tb!5027))

(declare-fun result!9683 () Bool)

(assert (=> tb!5027 (= result!9683 tp_is_empty!17613)))

(assert (=> b!881416 t!24704))

(declare-fun b_and!25391 () Bool)

(assert (= b_and!25389 (and (=> t!24704 result!9683) b_and!25391)))

(declare-fun m!821257 () Bool)

(assert (=> b!881418 m!821257))

(declare-fun m!821259 () Bool)

(assert (=> b!881418 m!821259))

(declare-fun m!821261 () Bool)

(assert (=> b!881418 m!821261))

(declare-fun m!821263 () Bool)

(assert (=> b!881423 m!821263))

(declare-fun m!821265 () Bool)

(assert (=> b!881416 m!821265))

(declare-fun m!821267 () Bool)

(assert (=> b!881416 m!821267))

(declare-fun m!821269 () Bool)

(assert (=> b!881416 m!821269))

(declare-fun m!821271 () Bool)

(assert (=> b!881416 m!821271))

(assert (=> b!881416 m!821267))

(declare-fun m!821273 () Bool)

(assert (=> b!881416 m!821273))

(assert (=> b!881416 m!821269))

(declare-fun m!821275 () Bool)

(assert (=> b!881421 m!821275))

(declare-fun m!821277 () Bool)

(assert (=> b!881426 m!821277))

(declare-fun m!821279 () Bool)

(assert (=> b!881420 m!821279))

(declare-fun m!821281 () Bool)

(assert (=> b!881420 m!821281))

(assert (=> b!881420 m!821273))

(declare-fun m!821283 () Bool)

(assert (=> b!881420 m!821283))

(assert (=> b!881420 m!821273))

(declare-fun m!821285 () Bool)

(assert (=> b!881420 m!821285))

(declare-fun m!821287 () Bool)

(assert (=> b!881420 m!821287))

(declare-fun m!821289 () Bool)

(assert (=> b!881415 m!821289))

(declare-fun m!821291 () Bool)

(assert (=> start!74766 m!821291))

(declare-fun m!821293 () Bool)

(assert (=> start!74766 m!821293))

(declare-fun m!821295 () Bool)

(assert (=> b!881425 m!821295))

(declare-fun m!821297 () Bool)

(assert (=> b!881428 m!821297))

(declare-fun m!821299 () Bool)

(assert (=> b!881428 m!821299))

(declare-fun m!821301 () Bool)

(assert (=> b!881428 m!821301))

(declare-fun m!821303 () Bool)

(assert (=> b!881428 m!821303))

(declare-fun m!821305 () Bool)

(assert (=> mapNonEmpty!28047 m!821305))

(check-sat (not start!74766) (not b!881421) (not b!881426) tp_is_empty!17613 b_and!25391 (not mapNonEmpty!28047) (not b!881416) (not b!881418) (not b!881428) (not b_lambda!12545) (not b!881420) (not b_next!15369) (not b!881423) (not b!881425))
(check-sat b_and!25391 (not b_next!15369))
(get-model)

(declare-fun b_lambda!12549 () Bool)

(assert (= b_lambda!12545 (or (and start!74766 b_free!15369) b_lambda!12549)))

(check-sat (not start!74766) (not b!881421) (not b!881426) tp_is_empty!17613 b_and!25391 (not mapNonEmpty!28047) (not b!881416) (not b!881418) (not b!881428) (not b!881420) (not b_next!15369) (not b_lambda!12549) (not b!881423) (not b!881425))
(check-sat b_and!25391 (not b_next!15369))
(get-model)

(declare-fun d!109051 () Bool)

(assert (=> d!109051 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881425 d!109051))

(declare-fun b!881499 () Bool)

(declare-fun e!490564 () Bool)

(declare-fun e!490566 () Bool)

(assert (=> b!881499 (= e!490564 e!490566)))

(assert (=> b!881499 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(declare-fun lt!398698 () ListLongMap!10489)

(declare-fun res!598865 () Bool)

(declare-fun contains!4263 (ListLongMap!10489 (_ BitVec 64)) Bool)

(assert (=> b!881499 (= res!598865 (contains!4263 lt!398698 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881499 (=> (not res!598865) (not e!490566))))

(declare-fun b!881500 () Bool)

(declare-fun e!490565 () Bool)

(assert (=> b!881500 (= e!490564 e!490565)))

(declare-fun c!92943 () Bool)

(assert (=> b!881500 (= c!92943 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(declare-fun b!881501 () Bool)

(declare-fun e!490569 () Bool)

(assert (=> b!881501 (= e!490569 e!490564)))

(declare-fun c!92941 () Bool)

(declare-fun e!490570 () Bool)

(assert (=> b!881501 (= c!92941 e!490570)))

(declare-fun res!598864 () Bool)

(assert (=> b!881501 (=> (not res!598864) (not e!490570))))

(assert (=> b!881501 (= res!598864 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(declare-fun b!881502 () Bool)

(declare-fun e!490568 () ListLongMap!10489)

(declare-fun call!38931 () ListLongMap!10489)

(assert (=> b!881502 (= e!490568 call!38931)))

(declare-fun b!881503 () Bool)

(declare-fun e!490567 () ListLongMap!10489)

(assert (=> b!881503 (= e!490567 (ListLongMap!10490 Nil!17531))))

(declare-fun b!881504 () Bool)

(assert (=> b!881504 (= e!490567 e!490568)))

(declare-fun c!92942 () Bool)

(assert (=> b!881504 (= c!92942 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881505 () Bool)

(declare-fun isEmpty!669 (ListLongMap!10489) Bool)

(assert (=> b!881505 (= e!490565 (isEmpty!669 lt!398698))))

(declare-fun bm!38928 () Bool)

(assert (=> bm!38928 (= call!38931 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109053 () Bool)

(assert (=> d!109053 e!490569))

(declare-fun res!598867 () Bool)

(assert (=> d!109053 (=> (not res!598867) (not e!490569))))

(assert (=> d!109053 (= res!598867 (not (contains!4263 lt!398698 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109053 (= lt!398698 e!490567)))

(declare-fun c!92944 () Bool)

(assert (=> d!109053 (= c!92944 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(assert (=> d!109053 (validMask!0 mask!1196)))

(assert (=> d!109053 (= (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398698)))

(declare-fun b!881506 () Bool)

(assert (=> b!881506 (= e!490565 (= lt!398698 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881507 () Bool)

(declare-fun lt!398699 () Unit!30082)

(declare-fun lt!398700 () Unit!30082)

(assert (=> b!881507 (= lt!398699 lt!398700)))

(declare-fun lt!398701 () (_ BitVec 64))

(declare-fun lt!398702 () V!28531)

(declare-fun lt!398703 () (_ BitVec 64))

(declare-fun lt!398704 () ListLongMap!10489)

(assert (=> b!881507 (not (contains!4263 (+!2532 lt!398704 (tuple2!11721 lt!398703 lt!398702)) lt!398701))))

(declare-fun addStillNotContains!207 (ListLongMap!10489 (_ BitVec 64) V!28531 (_ BitVec 64)) Unit!30082)

(assert (=> b!881507 (= lt!398700 (addStillNotContains!207 lt!398704 lt!398703 lt!398702 lt!398701))))

(assert (=> b!881507 (= lt!398701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881507 (= lt!398702 (get!12996 (select (arr!24700 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881507 (= lt!398703 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881507 (= lt!398704 call!38931)))

(assert (=> b!881507 (= e!490568 (+!2532 call!38931 (tuple2!11721 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12996 (select (arr!24700 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881508 () Bool)

(declare-fun res!598866 () Bool)

(assert (=> b!881508 (=> (not res!598866) (not e!490569))))

(assert (=> b!881508 (= res!598866 (not (contains!4263 lt!398698 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881509 () Bool)

(assert (=> b!881509 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(assert (=> b!881509 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _values!688)))))

(declare-fun apply!382 (ListLongMap!10489 (_ BitVec 64)) V!28531)

(assert (=> b!881509 (= e!490566 (= (apply!382 lt!398698 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12996 (select (arr!24700 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881510 () Bool)

(assert (=> b!881510 (= e!490570 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881510 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(assert (= (and d!109053 c!92944) b!881503))

(assert (= (and d!109053 (not c!92944)) b!881504))

(assert (= (and b!881504 c!92942) b!881507))

(assert (= (and b!881504 (not c!92942)) b!881502))

(assert (= (or b!881507 b!881502) bm!38928))

(assert (= (and d!109053 res!598867) b!881508))

(assert (= (and b!881508 res!598866) b!881501))

(assert (= (and b!881501 res!598864) b!881510))

(assert (= (and b!881501 c!92941) b!881499))

(assert (= (and b!881501 (not c!92941)) b!881500))

(assert (= (and b!881499 res!598865) b!881509))

(assert (= (and b!881500 c!92943) b!881506))

(assert (= (and b!881500 (not c!92943)) b!881505))

(declare-fun b_lambda!12551 () Bool)

(assert (=> (not b_lambda!12551) (not b!881507)))

(assert (=> b!881507 t!24704))

(declare-fun b_and!25397 () Bool)

(assert (= b_and!25391 (and (=> t!24704 result!9683) b_and!25397)))

(declare-fun b_lambda!12553 () Bool)

(assert (=> (not b_lambda!12553) (not b!881509)))

(assert (=> b!881509 t!24704))

(declare-fun b_and!25399 () Bool)

(assert (= b_and!25397 (and (=> t!24704 result!9683) b_and!25399)))

(declare-fun m!821357 () Bool)

(assert (=> b!881504 m!821357))

(assert (=> b!881504 m!821357))

(declare-fun m!821359 () Bool)

(assert (=> b!881504 m!821359))

(declare-fun m!821361 () Bool)

(assert (=> b!881505 m!821361))

(declare-fun m!821363 () Bool)

(assert (=> b!881506 m!821363))

(declare-fun m!821365 () Bool)

(assert (=> b!881507 m!821365))

(assert (=> b!881507 m!821357))

(declare-fun m!821367 () Bool)

(assert (=> b!881507 m!821367))

(assert (=> b!881507 m!821365))

(declare-fun m!821369 () Bool)

(assert (=> b!881507 m!821369))

(assert (=> b!881507 m!821269))

(declare-fun m!821371 () Bool)

(assert (=> b!881507 m!821371))

(assert (=> b!881507 m!821269))

(declare-fun m!821373 () Bool)

(assert (=> b!881507 m!821373))

(declare-fun m!821375 () Bool)

(assert (=> b!881507 m!821375))

(assert (=> b!881507 m!821371))

(declare-fun m!821377 () Bool)

(assert (=> b!881508 m!821377))

(assert (=> b!881499 m!821357))

(assert (=> b!881499 m!821357))

(declare-fun m!821379 () Bool)

(assert (=> b!881499 m!821379))

(assert (=> bm!38928 m!821363))

(assert (=> b!881510 m!821357))

(assert (=> b!881510 m!821357))

(assert (=> b!881510 m!821359))

(assert (=> b!881509 m!821357))

(assert (=> b!881509 m!821357))

(declare-fun m!821381 () Bool)

(assert (=> b!881509 m!821381))

(assert (=> b!881509 m!821371))

(assert (=> b!881509 m!821269))

(assert (=> b!881509 m!821371))

(assert (=> b!881509 m!821269))

(assert (=> b!881509 m!821373))

(declare-fun m!821383 () Bool)

(assert (=> d!109053 m!821383))

(assert (=> d!109053 m!821277))

(assert (=> b!881420 d!109053))

(declare-fun d!109055 () Bool)

(assert (=> d!109055 (= (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)) (and (not (= (select (arr!24699 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24699 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881420 d!109055))

(declare-fun d!109057 () Bool)

(declare-fun e!490576 () Bool)

(assert (=> d!109057 e!490576))

(declare-fun res!598870 () Bool)

(assert (=> d!109057 (=> (not res!598870) (not e!490576))))

(assert (=> d!109057 (= res!598870 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25140 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25140 _values!688))))))))

(declare-fun lt!398707 () Unit!30082)

(declare-fun choose!1438 (array!51354 array!51356 (_ BitVec 32) (_ BitVec 32) V!28531 V!28531 (_ BitVec 32) (_ BitVec 64) V!28531 (_ BitVec 32) Int) Unit!30082)

(assert (=> d!109057 (= lt!398707 (choose!1438 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109057 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(assert (=> d!109057 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!721 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398707)))

(declare-fun bm!38933 () Bool)

(declare-fun call!38936 () ListLongMap!10489)

(assert (=> bm!38933 (= call!38936 (getCurrentListMapNoExtraKeys!3223 _keys!868 (array!51357 (store (arr!24700 _values!688) i!612 (ValueCellFull!8367 v!557)) (size!25140 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881517 () Bool)

(declare-fun e!490575 () Bool)

(declare-fun call!38937 () ListLongMap!10489)

(assert (=> b!881517 (= e!490575 (= call!38936 (+!2532 call!38937 (tuple2!11721 k0!854 v!557))))))

(declare-fun b!881518 () Bool)

(assert (=> b!881518 (= e!490576 e!490575)))

(declare-fun c!92947 () Bool)

(assert (=> b!881518 (= c!92947 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!38934 () Bool)

(assert (=> bm!38934 (= call!38937 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881519 () Bool)

(assert (=> b!881519 (= e!490575 (= call!38936 call!38937))))

(assert (= (and d!109057 res!598870) b!881518))

(assert (= (and b!881518 c!92947) b!881517))

(assert (= (and b!881518 (not c!92947)) b!881519))

(assert (= (or b!881517 b!881519) bm!38934))

(assert (= (or b!881517 b!881519) bm!38933))

(declare-fun m!821385 () Bool)

(assert (=> d!109057 m!821385))

(assert (=> bm!38933 m!821259))

(declare-fun m!821387 () Bool)

(assert (=> bm!38933 m!821387))

(declare-fun m!821389 () Bool)

(assert (=> b!881517 m!821389))

(assert (=> bm!38934 m!821281))

(assert (=> b!881420 d!109057))

(declare-fun d!109059 () Bool)

(declare-fun e!490579 () Bool)

(assert (=> d!109059 e!490579))

(declare-fun res!598875 () Bool)

(assert (=> d!109059 (=> (not res!598875) (not e!490579))))

(declare-fun lt!398718 () ListLongMap!10489)

(assert (=> d!109059 (= res!598875 (contains!4263 lt!398718 (_1!5871 (tuple2!11721 k0!854 v!557))))))

(declare-fun lt!398716 () List!17534)

(assert (=> d!109059 (= lt!398718 (ListLongMap!10490 lt!398716))))

(declare-fun lt!398719 () Unit!30082)

(declare-fun lt!398717 () Unit!30082)

(assert (=> d!109059 (= lt!398719 lt!398717)))

(declare-datatypes ((Option!430 0))(
  ( (Some!429 (v!11315 V!28531)) (None!428) )
))
(declare-fun getValueByKey!424 (List!17534 (_ BitVec 64)) Option!430)

(assert (=> d!109059 (= (getValueByKey!424 lt!398716 (_1!5871 (tuple2!11721 k0!854 v!557))) (Some!429 (_2!5871 (tuple2!11721 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!238 (List!17534 (_ BitVec 64) V!28531) Unit!30082)

(assert (=> d!109059 (= lt!398717 (lemmaContainsTupThenGetReturnValue!238 lt!398716 (_1!5871 (tuple2!11721 k0!854 v!557)) (_2!5871 (tuple2!11721 k0!854 v!557))))))

(declare-fun insertStrictlySorted!277 (List!17534 (_ BitVec 64) V!28531) List!17534)

(assert (=> d!109059 (= lt!398716 (insertStrictlySorted!277 (toList!5260 lt!398654) (_1!5871 (tuple2!11721 k0!854 v!557)) (_2!5871 (tuple2!11721 k0!854 v!557))))))

(assert (=> d!109059 (= (+!2532 lt!398654 (tuple2!11721 k0!854 v!557)) lt!398718)))

(declare-fun b!881524 () Bool)

(declare-fun res!598876 () Bool)

(assert (=> b!881524 (=> (not res!598876) (not e!490579))))

(assert (=> b!881524 (= res!598876 (= (getValueByKey!424 (toList!5260 lt!398718) (_1!5871 (tuple2!11721 k0!854 v!557))) (Some!429 (_2!5871 (tuple2!11721 k0!854 v!557)))))))

(declare-fun b!881525 () Bool)

(declare-fun contains!4264 (List!17534 tuple2!11720) Bool)

(assert (=> b!881525 (= e!490579 (contains!4264 (toList!5260 lt!398718) (tuple2!11721 k0!854 v!557)))))

(assert (= (and d!109059 res!598875) b!881524))

(assert (= (and b!881524 res!598876) b!881525))

(declare-fun m!821391 () Bool)

(assert (=> d!109059 m!821391))

(declare-fun m!821393 () Bool)

(assert (=> d!109059 m!821393))

(declare-fun m!821395 () Bool)

(assert (=> d!109059 m!821395))

(declare-fun m!821397 () Bool)

(assert (=> d!109059 m!821397))

(declare-fun m!821399 () Bool)

(assert (=> b!881524 m!821399))

(declare-fun m!821401 () Bool)

(assert (=> b!881525 m!821401))

(assert (=> b!881420 d!109059))

(declare-fun b!881526 () Bool)

(declare-fun e!490580 () Bool)

(declare-fun e!490582 () Bool)

(assert (=> b!881526 (= e!490580 e!490582)))

(assert (=> b!881526 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(declare-fun lt!398720 () ListLongMap!10489)

(declare-fun res!598878 () Bool)

(assert (=> b!881526 (= res!598878 (contains!4263 lt!398720 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881526 (=> (not res!598878) (not e!490582))))

(declare-fun b!881527 () Bool)

(declare-fun e!490581 () Bool)

(assert (=> b!881527 (= e!490580 e!490581)))

(declare-fun c!92950 () Bool)

(assert (=> b!881527 (= c!92950 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(declare-fun b!881528 () Bool)

(declare-fun e!490585 () Bool)

(assert (=> b!881528 (= e!490585 e!490580)))

(declare-fun c!92948 () Bool)

(declare-fun e!490586 () Bool)

(assert (=> b!881528 (= c!92948 e!490586)))

(declare-fun res!598877 () Bool)

(assert (=> b!881528 (=> (not res!598877) (not e!490586))))

(assert (=> b!881528 (= res!598877 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(declare-fun b!881529 () Bool)

(declare-fun e!490584 () ListLongMap!10489)

(declare-fun call!38938 () ListLongMap!10489)

(assert (=> b!881529 (= e!490584 call!38938)))

(declare-fun b!881530 () Bool)

(declare-fun e!490583 () ListLongMap!10489)

(assert (=> b!881530 (= e!490583 (ListLongMap!10490 Nil!17531))))

(declare-fun b!881531 () Bool)

(assert (=> b!881531 (= e!490583 e!490584)))

(declare-fun c!92949 () Bool)

(assert (=> b!881531 (= c!92949 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881532 () Bool)

(assert (=> b!881532 (= e!490581 (isEmpty!669 lt!398720))))

(declare-fun bm!38935 () Bool)

(assert (=> bm!38935 (= call!38938 (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109061 () Bool)

(assert (=> d!109061 e!490585))

(declare-fun res!598880 () Bool)

(assert (=> d!109061 (=> (not res!598880) (not e!490585))))

(assert (=> d!109061 (= res!598880 (not (contains!4263 lt!398720 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109061 (= lt!398720 e!490583)))

(declare-fun c!92951 () Bool)

(assert (=> d!109061 (= c!92951 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(assert (=> d!109061 (validMask!0 mask!1196)))

(assert (=> d!109061 (= (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398720)))

(declare-fun b!881533 () Bool)

(assert (=> b!881533 (= e!490581 (= lt!398720 (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881534 () Bool)

(declare-fun lt!398721 () Unit!30082)

(declare-fun lt!398722 () Unit!30082)

(assert (=> b!881534 (= lt!398721 lt!398722)))

(declare-fun lt!398726 () ListLongMap!10489)

(declare-fun lt!398724 () V!28531)

(declare-fun lt!398723 () (_ BitVec 64))

(declare-fun lt!398725 () (_ BitVec 64))

(assert (=> b!881534 (not (contains!4263 (+!2532 lt!398726 (tuple2!11721 lt!398725 lt!398724)) lt!398723))))

(assert (=> b!881534 (= lt!398722 (addStillNotContains!207 lt!398726 lt!398725 lt!398724 lt!398723))))

(assert (=> b!881534 (= lt!398723 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881534 (= lt!398724 (get!12996 (select (arr!24700 lt!398655) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881534 (= lt!398725 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881534 (= lt!398726 call!38938)))

(assert (=> b!881534 (= e!490584 (+!2532 call!38938 (tuple2!11721 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12996 (select (arr!24700 lt!398655) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881535 () Bool)

(declare-fun res!598879 () Bool)

(assert (=> b!881535 (=> (not res!598879) (not e!490585))))

(assert (=> b!881535 (= res!598879 (not (contains!4263 lt!398720 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881536 () Bool)

(assert (=> b!881536 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25139 _keys!868)))))

(assert (=> b!881536 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 lt!398655)))))

(assert (=> b!881536 (= e!490582 (= (apply!382 lt!398720 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12996 (select (arr!24700 lt!398655) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881537 () Bool)

(assert (=> b!881537 (= e!490586 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881537 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(assert (= (and d!109061 c!92951) b!881530))

(assert (= (and d!109061 (not c!92951)) b!881531))

(assert (= (and b!881531 c!92949) b!881534))

(assert (= (and b!881531 (not c!92949)) b!881529))

(assert (= (or b!881534 b!881529) bm!38935))

(assert (= (and d!109061 res!598880) b!881535))

(assert (= (and b!881535 res!598879) b!881528))

(assert (= (and b!881528 res!598877) b!881537))

(assert (= (and b!881528 c!92948) b!881526))

(assert (= (and b!881528 (not c!92948)) b!881527))

(assert (= (and b!881526 res!598878) b!881536))

(assert (= (and b!881527 c!92950) b!881533))

(assert (= (and b!881527 (not c!92950)) b!881532))

(declare-fun b_lambda!12555 () Bool)

(assert (=> (not b_lambda!12555) (not b!881534)))

(assert (=> b!881534 t!24704))

(declare-fun b_and!25401 () Bool)

(assert (= b_and!25399 (and (=> t!24704 result!9683) b_and!25401)))

(declare-fun b_lambda!12557 () Bool)

(assert (=> (not b_lambda!12557) (not b!881536)))

(assert (=> b!881536 t!24704))

(declare-fun b_and!25403 () Bool)

(assert (= b_and!25401 (and (=> t!24704 result!9683) b_and!25403)))

(assert (=> b!881531 m!821357))

(assert (=> b!881531 m!821357))

(assert (=> b!881531 m!821359))

(declare-fun m!821403 () Bool)

(assert (=> b!881532 m!821403))

(declare-fun m!821405 () Bool)

(assert (=> b!881533 m!821405))

(declare-fun m!821407 () Bool)

(assert (=> b!881534 m!821407))

(assert (=> b!881534 m!821357))

(declare-fun m!821409 () Bool)

(assert (=> b!881534 m!821409))

(assert (=> b!881534 m!821407))

(declare-fun m!821411 () Bool)

(assert (=> b!881534 m!821411))

(assert (=> b!881534 m!821269))

(declare-fun m!821413 () Bool)

(assert (=> b!881534 m!821413))

(assert (=> b!881534 m!821269))

(declare-fun m!821415 () Bool)

(assert (=> b!881534 m!821415))

(declare-fun m!821417 () Bool)

(assert (=> b!881534 m!821417))

(assert (=> b!881534 m!821413))

(declare-fun m!821419 () Bool)

(assert (=> b!881535 m!821419))

(assert (=> b!881526 m!821357))

(assert (=> b!881526 m!821357))

(declare-fun m!821421 () Bool)

(assert (=> b!881526 m!821421))

(assert (=> bm!38935 m!821405))

(assert (=> b!881537 m!821357))

(assert (=> b!881537 m!821357))

(assert (=> b!881537 m!821359))

(assert (=> b!881536 m!821357))

(assert (=> b!881536 m!821357))

(declare-fun m!821423 () Bool)

(assert (=> b!881536 m!821423))

(assert (=> b!881536 m!821413))

(assert (=> b!881536 m!821269))

(assert (=> b!881536 m!821413))

(assert (=> b!881536 m!821269))

(assert (=> b!881536 m!821415))

(declare-fun m!821425 () Bool)

(assert (=> d!109061 m!821425))

(assert (=> d!109061 m!821277))

(assert (=> b!881420 d!109061))

(declare-fun d!109063 () Bool)

(declare-fun res!598885 () Bool)

(declare-fun e!490591 () Bool)

(assert (=> d!109063 (=> res!598885 e!490591)))

(assert (=> d!109063 (= res!598885 (= (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109063 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!490591)))

(declare-fun b!881542 () Bool)

(declare-fun e!490592 () Bool)

(assert (=> b!881542 (= e!490591 e!490592)))

(declare-fun res!598886 () Bool)

(assert (=> b!881542 (=> (not res!598886) (not e!490592))))

(assert (=> b!881542 (= res!598886 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25139 _keys!868)))))

(declare-fun b!881543 () Bool)

(assert (=> b!881543 (= e!490592 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109063 (not res!598885)) b!881542))

(assert (= (and b!881542 res!598886) b!881543))

(assert (=> d!109063 m!821357))

(declare-fun m!821427 () Bool)

(assert (=> b!881543 m!821427))

(assert (=> b!881428 d!109063))

(declare-fun d!109065 () Bool)

(assert (=> d!109065 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398729 () Unit!30082)

(declare-fun choose!114 (array!51354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> d!109065 (= lt!398729 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109065 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109065 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!398729)))

(declare-fun bs!24725 () Bool)

(assert (= bs!24725 d!109065))

(assert (=> bs!24725 m!821297))

(declare-fun m!821429 () Bool)

(assert (=> bs!24725 m!821429))

(assert (=> b!881428 d!109065))

(declare-fun call!38941 () Bool)

(declare-fun c!92954 () Bool)

(declare-fun bm!38938 () Bool)

(assert (=> bm!38938 (= call!38941 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92954 (Cons!17531 (select (arr!24699 _keys!868) from!1053) Nil!17532) Nil!17532)))))

(declare-fun b!881554 () Bool)

(declare-fun e!490602 () Bool)

(declare-fun contains!4265 (List!17535 (_ BitVec 64)) Bool)

(assert (=> b!881554 (= e!490602 (contains!4265 Nil!17532 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun d!109067 () Bool)

(declare-fun res!598894 () Bool)

(declare-fun e!490601 () Bool)

(assert (=> d!109067 (=> res!598894 e!490601)))

(assert (=> d!109067 (= res!598894 (bvsge from!1053 (size!25139 _keys!868)))))

(assert (=> d!109067 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17532) e!490601)))

(declare-fun b!881555 () Bool)

(declare-fun e!490603 () Bool)

(assert (=> b!881555 (= e!490603 call!38941)))

(declare-fun b!881556 () Bool)

(assert (=> b!881556 (= e!490603 call!38941)))

(declare-fun b!881557 () Bool)

(declare-fun e!490604 () Bool)

(assert (=> b!881557 (= e!490604 e!490603)))

(assert (=> b!881557 (= c!92954 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun b!881558 () Bool)

(assert (=> b!881558 (= e!490601 e!490604)))

(declare-fun res!598895 () Bool)

(assert (=> b!881558 (=> (not res!598895) (not e!490604))))

(assert (=> b!881558 (= res!598895 (not e!490602))))

(declare-fun res!598893 () Bool)

(assert (=> b!881558 (=> (not res!598893) (not e!490602))))

(assert (=> b!881558 (= res!598893 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(assert (= (and d!109067 (not res!598894)) b!881558))

(assert (= (and b!881558 res!598893) b!881554))

(assert (= (and b!881558 res!598895) b!881557))

(assert (= (and b!881557 c!92954) b!881556))

(assert (= (and b!881557 (not c!92954)) b!881555))

(assert (= (or b!881556 b!881555) bm!38938))

(assert (=> bm!38938 m!821273))

(declare-fun m!821431 () Bool)

(assert (=> bm!38938 m!821431))

(assert (=> b!881554 m!821273))

(assert (=> b!881554 m!821273))

(declare-fun m!821433 () Bool)

(assert (=> b!881554 m!821433))

(assert (=> b!881557 m!821273))

(assert (=> b!881557 m!821273))

(assert (=> b!881557 m!821283))

(assert (=> b!881558 m!821273))

(assert (=> b!881558 m!821273))

(assert (=> b!881558 m!821283))

(assert (=> b!881428 d!109067))

(declare-fun d!109069 () Bool)

(assert (=> d!109069 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17532)))

(declare-fun lt!398732 () Unit!30082)

(declare-fun choose!39 (array!51354 (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> d!109069 (= lt!398732 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109069 (bvslt (size!25139 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109069 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398732)))

(declare-fun bs!24726 () Bool)

(assert (= bs!24726 d!109069))

(assert (=> bs!24726 m!821301))

(declare-fun m!821435 () Bool)

(assert (=> bs!24726 m!821435))

(assert (=> b!881428 d!109069))

(declare-fun bm!38939 () Bool)

(declare-fun call!38942 () Bool)

(declare-fun c!92955 () Bool)

(assert (=> bm!38939 (= call!38942 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92955 (Cons!17531 (select (arr!24699 _keys!868) #b00000000000000000000000000000000) Nil!17532) Nil!17532)))))

(declare-fun b!881559 () Bool)

(declare-fun e!490606 () Bool)

(assert (=> b!881559 (= e!490606 (contains!4265 Nil!17532 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109071 () Bool)

(declare-fun res!598897 () Bool)

(declare-fun e!490605 () Bool)

(assert (=> d!109071 (=> res!598897 e!490605)))

(assert (=> d!109071 (= res!598897 (bvsge #b00000000000000000000000000000000 (size!25139 _keys!868)))))

(assert (=> d!109071 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17532) e!490605)))

(declare-fun b!881560 () Bool)

(declare-fun e!490607 () Bool)

(assert (=> b!881560 (= e!490607 call!38942)))

(declare-fun b!881561 () Bool)

(assert (=> b!881561 (= e!490607 call!38942)))

(declare-fun b!881562 () Bool)

(declare-fun e!490608 () Bool)

(assert (=> b!881562 (= e!490608 e!490607)))

(assert (=> b!881562 (= c!92955 (validKeyInArray!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881563 () Bool)

(assert (=> b!881563 (= e!490605 e!490608)))

(declare-fun res!598898 () Bool)

(assert (=> b!881563 (=> (not res!598898) (not e!490608))))

(assert (=> b!881563 (= res!598898 (not e!490606))))

(declare-fun res!598896 () Bool)

(assert (=> b!881563 (=> (not res!598896) (not e!490606))))

(assert (=> b!881563 (= res!598896 (validKeyInArray!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109071 (not res!598897)) b!881563))

(assert (= (and b!881563 res!598896) b!881559))

(assert (= (and b!881563 res!598898) b!881562))

(assert (= (and b!881562 c!92955) b!881561))

(assert (= (and b!881562 (not c!92955)) b!881560))

(assert (= (or b!881561 b!881560) bm!38939))

(declare-fun m!821437 () Bool)

(assert (=> bm!38939 m!821437))

(declare-fun m!821439 () Bool)

(assert (=> bm!38939 m!821439))

(assert (=> b!881559 m!821437))

(assert (=> b!881559 m!821437))

(declare-fun m!821441 () Bool)

(assert (=> b!881559 m!821441))

(assert (=> b!881562 m!821437))

(assert (=> b!881562 m!821437))

(declare-fun m!821443 () Bool)

(assert (=> b!881562 m!821443))

(assert (=> b!881563 m!821437))

(assert (=> b!881563 m!821437))

(assert (=> b!881563 m!821443))

(assert (=> b!881423 d!109071))

(declare-fun b!881564 () Bool)

(declare-fun e!490609 () Bool)

(declare-fun e!490611 () Bool)

(assert (=> b!881564 (= e!490609 e!490611)))

(assert (=> b!881564 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25139 _keys!868)))))

(declare-fun res!598900 () Bool)

(declare-fun lt!398733 () ListLongMap!10489)

(assert (=> b!881564 (= res!598900 (contains!4263 lt!398733 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881564 (=> (not res!598900) (not e!490611))))

(declare-fun b!881565 () Bool)

(declare-fun e!490610 () Bool)

(assert (=> b!881565 (= e!490609 e!490610)))

(declare-fun c!92958 () Bool)

(assert (=> b!881565 (= c!92958 (bvslt from!1053 (size!25139 _keys!868)))))

(declare-fun b!881566 () Bool)

(declare-fun e!490614 () Bool)

(assert (=> b!881566 (= e!490614 e!490609)))

(declare-fun c!92956 () Bool)

(declare-fun e!490615 () Bool)

(assert (=> b!881566 (= c!92956 e!490615)))

(declare-fun res!598899 () Bool)

(assert (=> b!881566 (=> (not res!598899) (not e!490615))))

(assert (=> b!881566 (= res!598899 (bvslt from!1053 (size!25139 _keys!868)))))

(declare-fun b!881567 () Bool)

(declare-fun e!490613 () ListLongMap!10489)

(declare-fun call!38943 () ListLongMap!10489)

(assert (=> b!881567 (= e!490613 call!38943)))

(declare-fun b!881568 () Bool)

(declare-fun e!490612 () ListLongMap!10489)

(assert (=> b!881568 (= e!490612 (ListLongMap!10490 Nil!17531))))

(declare-fun b!881569 () Bool)

(assert (=> b!881569 (= e!490612 e!490613)))

(declare-fun c!92957 () Bool)

(assert (=> b!881569 (= c!92957 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun b!881570 () Bool)

(assert (=> b!881570 (= e!490610 (isEmpty!669 lt!398733))))

(declare-fun bm!38940 () Bool)

(assert (=> bm!38940 (= call!38943 (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109073 () Bool)

(assert (=> d!109073 e!490614))

(declare-fun res!598902 () Bool)

(assert (=> d!109073 (=> (not res!598902) (not e!490614))))

(assert (=> d!109073 (= res!598902 (not (contains!4263 lt!398733 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109073 (= lt!398733 e!490612)))

(declare-fun c!92959 () Bool)

(assert (=> d!109073 (= c!92959 (bvsge from!1053 (size!25139 _keys!868)))))

(assert (=> d!109073 (validMask!0 mask!1196)))

(assert (=> d!109073 (= (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398733)))

(declare-fun b!881571 () Bool)

(assert (=> b!881571 (= e!490610 (= lt!398733 (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!398655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881572 () Bool)

(declare-fun lt!398734 () Unit!30082)

(declare-fun lt!398735 () Unit!30082)

(assert (=> b!881572 (= lt!398734 lt!398735)))

(declare-fun lt!398738 () (_ BitVec 64))

(declare-fun lt!398737 () V!28531)

(declare-fun lt!398739 () ListLongMap!10489)

(declare-fun lt!398736 () (_ BitVec 64))

(assert (=> b!881572 (not (contains!4263 (+!2532 lt!398739 (tuple2!11721 lt!398738 lt!398737)) lt!398736))))

(assert (=> b!881572 (= lt!398735 (addStillNotContains!207 lt!398739 lt!398738 lt!398737 lt!398736))))

(assert (=> b!881572 (= lt!398736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881572 (= lt!398737 (get!12996 (select (arr!24700 lt!398655) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881572 (= lt!398738 (select (arr!24699 _keys!868) from!1053))))

(assert (=> b!881572 (= lt!398739 call!38943)))

(assert (=> b!881572 (= e!490613 (+!2532 call!38943 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 lt!398655) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881573 () Bool)

(declare-fun res!598901 () Bool)

(assert (=> b!881573 (=> (not res!598901) (not e!490614))))

(assert (=> b!881573 (= res!598901 (not (contains!4263 lt!398733 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881574 () Bool)

(assert (=> b!881574 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25139 _keys!868)))))

(assert (=> b!881574 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25140 lt!398655)))))

(assert (=> b!881574 (= e!490611 (= (apply!382 lt!398733 (select (arr!24699 _keys!868) from!1053)) (get!12996 (select (arr!24700 lt!398655) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881575 () Bool)

(assert (=> b!881575 (= e!490615 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881575 (bvsge from!1053 #b00000000000000000000000000000000)))

(assert (= (and d!109073 c!92959) b!881568))

(assert (= (and d!109073 (not c!92959)) b!881569))

(assert (= (and b!881569 c!92957) b!881572))

(assert (= (and b!881569 (not c!92957)) b!881567))

(assert (= (or b!881572 b!881567) bm!38940))

(assert (= (and d!109073 res!598902) b!881573))

(assert (= (and b!881573 res!598901) b!881566))

(assert (= (and b!881566 res!598899) b!881575))

(assert (= (and b!881566 c!92956) b!881564))

(assert (= (and b!881566 (not c!92956)) b!881565))

(assert (= (and b!881564 res!598900) b!881574))

(assert (= (and b!881565 c!92958) b!881571))

(assert (= (and b!881565 (not c!92958)) b!881570))

(declare-fun b_lambda!12559 () Bool)

(assert (=> (not b_lambda!12559) (not b!881572)))

(assert (=> b!881572 t!24704))

(declare-fun b_and!25405 () Bool)

(assert (= b_and!25403 (and (=> t!24704 result!9683) b_and!25405)))

(declare-fun b_lambda!12561 () Bool)

(assert (=> (not b_lambda!12561) (not b!881574)))

(assert (=> b!881574 t!24704))

(declare-fun b_and!25407 () Bool)

(assert (= b_and!25405 (and (=> t!24704 result!9683) b_and!25407)))

(assert (=> b!881569 m!821273))

(assert (=> b!881569 m!821273))

(assert (=> b!881569 m!821283))

(declare-fun m!821445 () Bool)

(assert (=> b!881570 m!821445))

(declare-fun m!821447 () Bool)

(assert (=> b!881571 m!821447))

(declare-fun m!821449 () Bool)

(assert (=> b!881572 m!821449))

(assert (=> b!881572 m!821273))

(declare-fun m!821451 () Bool)

(assert (=> b!881572 m!821451))

(assert (=> b!881572 m!821449))

(declare-fun m!821453 () Bool)

(assert (=> b!881572 m!821453))

(assert (=> b!881572 m!821269))

(declare-fun m!821455 () Bool)

(assert (=> b!881572 m!821455))

(assert (=> b!881572 m!821269))

(declare-fun m!821457 () Bool)

(assert (=> b!881572 m!821457))

(declare-fun m!821459 () Bool)

(assert (=> b!881572 m!821459))

(assert (=> b!881572 m!821455))

(declare-fun m!821461 () Bool)

(assert (=> b!881573 m!821461))

(assert (=> b!881564 m!821273))

(assert (=> b!881564 m!821273))

(declare-fun m!821463 () Bool)

(assert (=> b!881564 m!821463))

(assert (=> bm!38940 m!821447))

(assert (=> b!881575 m!821273))

(assert (=> b!881575 m!821273))

(assert (=> b!881575 m!821283))

(assert (=> b!881574 m!821273))

(assert (=> b!881574 m!821273))

(declare-fun m!821465 () Bool)

(assert (=> b!881574 m!821465))

(assert (=> b!881574 m!821455))

(assert (=> b!881574 m!821269))

(assert (=> b!881574 m!821455))

(assert (=> b!881574 m!821269))

(assert (=> b!881574 m!821457))

(declare-fun m!821467 () Bool)

(assert (=> d!109073 m!821467))

(assert (=> d!109073 m!821277))

(assert (=> b!881418 d!109073))

(declare-fun b!881576 () Bool)

(declare-fun e!490616 () Bool)

(declare-fun e!490618 () Bool)

(assert (=> b!881576 (= e!490616 e!490618)))

(assert (=> b!881576 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25139 _keys!868)))))

(declare-fun res!598904 () Bool)

(declare-fun lt!398740 () ListLongMap!10489)

(assert (=> b!881576 (= res!598904 (contains!4263 lt!398740 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881576 (=> (not res!598904) (not e!490618))))

(declare-fun b!881577 () Bool)

(declare-fun e!490617 () Bool)

(assert (=> b!881577 (= e!490616 e!490617)))

(declare-fun c!92962 () Bool)

(assert (=> b!881577 (= c!92962 (bvslt from!1053 (size!25139 _keys!868)))))

(declare-fun b!881578 () Bool)

(declare-fun e!490621 () Bool)

(assert (=> b!881578 (= e!490621 e!490616)))

(declare-fun c!92960 () Bool)

(declare-fun e!490622 () Bool)

(assert (=> b!881578 (= c!92960 e!490622)))

(declare-fun res!598903 () Bool)

(assert (=> b!881578 (=> (not res!598903) (not e!490622))))

(assert (=> b!881578 (= res!598903 (bvslt from!1053 (size!25139 _keys!868)))))

(declare-fun b!881579 () Bool)

(declare-fun e!490620 () ListLongMap!10489)

(declare-fun call!38944 () ListLongMap!10489)

(assert (=> b!881579 (= e!490620 call!38944)))

(declare-fun b!881580 () Bool)

(declare-fun e!490619 () ListLongMap!10489)

(assert (=> b!881580 (= e!490619 (ListLongMap!10490 Nil!17531))))

(declare-fun b!881581 () Bool)

(assert (=> b!881581 (= e!490619 e!490620)))

(declare-fun c!92961 () Bool)

(assert (=> b!881581 (= c!92961 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun b!881582 () Bool)

(assert (=> b!881582 (= e!490617 (isEmpty!669 lt!398740))))

(declare-fun bm!38941 () Bool)

(assert (=> bm!38941 (= call!38944 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109075 () Bool)

(assert (=> d!109075 e!490621))

(declare-fun res!598906 () Bool)

(assert (=> d!109075 (=> (not res!598906) (not e!490621))))

(assert (=> d!109075 (= res!598906 (not (contains!4263 lt!398740 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109075 (= lt!398740 e!490619)))

(declare-fun c!92963 () Bool)

(assert (=> d!109075 (= c!92963 (bvsge from!1053 (size!25139 _keys!868)))))

(assert (=> d!109075 (validMask!0 mask!1196)))

(assert (=> d!109075 (= (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398740)))

(declare-fun b!881583 () Bool)

(assert (=> b!881583 (= e!490617 (= lt!398740 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881584 () Bool)

(declare-fun lt!398741 () Unit!30082)

(declare-fun lt!398742 () Unit!30082)

(assert (=> b!881584 (= lt!398741 lt!398742)))

(declare-fun lt!398743 () (_ BitVec 64))

(declare-fun lt!398744 () V!28531)

(declare-fun lt!398745 () (_ BitVec 64))

(declare-fun lt!398746 () ListLongMap!10489)

(assert (=> b!881584 (not (contains!4263 (+!2532 lt!398746 (tuple2!11721 lt!398745 lt!398744)) lt!398743))))

(assert (=> b!881584 (= lt!398742 (addStillNotContains!207 lt!398746 lt!398745 lt!398744 lt!398743))))

(assert (=> b!881584 (= lt!398743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881584 (= lt!398744 (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881584 (= lt!398745 (select (arr!24699 _keys!868) from!1053))))

(assert (=> b!881584 (= lt!398746 call!38944)))

(assert (=> b!881584 (= e!490620 (+!2532 call!38944 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881585 () Bool)

(declare-fun res!598905 () Bool)

(assert (=> b!881585 (=> (not res!598905) (not e!490621))))

(assert (=> b!881585 (= res!598905 (not (contains!4263 lt!398740 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881586 () Bool)

(assert (=> b!881586 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25139 _keys!868)))))

(assert (=> b!881586 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25140 _values!688)))))

(assert (=> b!881586 (= e!490618 (= (apply!382 lt!398740 (select (arr!24699 _keys!868) from!1053)) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881587 () Bool)

(assert (=> b!881587 (= e!490622 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881587 (bvsge from!1053 #b00000000000000000000000000000000)))

(assert (= (and d!109075 c!92963) b!881580))

(assert (= (and d!109075 (not c!92963)) b!881581))

(assert (= (and b!881581 c!92961) b!881584))

(assert (= (and b!881581 (not c!92961)) b!881579))

(assert (= (or b!881584 b!881579) bm!38941))

(assert (= (and d!109075 res!598906) b!881585))

(assert (= (and b!881585 res!598905) b!881578))

(assert (= (and b!881578 res!598903) b!881587))

(assert (= (and b!881578 c!92960) b!881576))

(assert (= (and b!881578 (not c!92960)) b!881577))

(assert (= (and b!881576 res!598904) b!881586))

(assert (= (and b!881577 c!92962) b!881583))

(assert (= (and b!881577 (not c!92962)) b!881582))

(declare-fun b_lambda!12563 () Bool)

(assert (=> (not b_lambda!12563) (not b!881584)))

(assert (=> b!881584 t!24704))

(declare-fun b_and!25409 () Bool)

(assert (= b_and!25407 (and (=> t!24704 result!9683) b_and!25409)))

(declare-fun b_lambda!12565 () Bool)

(assert (=> (not b_lambda!12565) (not b!881586)))

(assert (=> b!881586 t!24704))

(declare-fun b_and!25411 () Bool)

(assert (= b_and!25409 (and (=> t!24704 result!9683) b_and!25411)))

(assert (=> b!881581 m!821273))

(assert (=> b!881581 m!821273))

(assert (=> b!881581 m!821283))

(declare-fun m!821469 () Bool)

(assert (=> b!881582 m!821469))

(declare-fun m!821471 () Bool)

(assert (=> b!881583 m!821471))

(declare-fun m!821473 () Bool)

(assert (=> b!881584 m!821473))

(assert (=> b!881584 m!821273))

(declare-fun m!821475 () Bool)

(assert (=> b!881584 m!821475))

(assert (=> b!881584 m!821473))

(declare-fun m!821477 () Bool)

(assert (=> b!881584 m!821477))

(assert (=> b!881584 m!821269))

(assert (=> b!881584 m!821267))

(assert (=> b!881584 m!821269))

(assert (=> b!881584 m!821271))

(declare-fun m!821479 () Bool)

(assert (=> b!881584 m!821479))

(assert (=> b!881584 m!821267))

(declare-fun m!821481 () Bool)

(assert (=> b!881585 m!821481))

(assert (=> b!881576 m!821273))

(assert (=> b!881576 m!821273))

(declare-fun m!821483 () Bool)

(assert (=> b!881576 m!821483))

(assert (=> bm!38941 m!821471))

(assert (=> b!881587 m!821273))

(assert (=> b!881587 m!821273))

(assert (=> b!881587 m!821283))

(assert (=> b!881586 m!821273))

(assert (=> b!881586 m!821273))

(declare-fun m!821485 () Bool)

(assert (=> b!881586 m!821485))

(assert (=> b!881586 m!821267))

(assert (=> b!881586 m!821269))

(assert (=> b!881586 m!821267))

(assert (=> b!881586 m!821269))

(assert (=> b!881586 m!821271))

(declare-fun m!821487 () Bool)

(assert (=> d!109075 m!821487))

(assert (=> d!109075 m!821277))

(assert (=> b!881418 d!109075))

(declare-fun d!109077 () Bool)

(assert (=> d!109077 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!881426 d!109077))

(declare-fun b!881596 () Bool)

(declare-fun e!490629 () Bool)

(declare-fun call!38947 () Bool)

(assert (=> b!881596 (= e!490629 call!38947)))

(declare-fun b!881597 () Bool)

(declare-fun e!490631 () Bool)

(assert (=> b!881597 (= e!490631 e!490629)))

(declare-fun lt!398754 () (_ BitVec 64))

(assert (=> b!881597 (= lt!398754 (select (arr!24699 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398755 () Unit!30082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51354 (_ BitVec 64) (_ BitVec 32)) Unit!30082)

(assert (=> b!881597 (= lt!398755 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398754 #b00000000000000000000000000000000))))

(assert (=> b!881597 (arrayContainsKey!0 _keys!868 lt!398754 #b00000000000000000000000000000000)))

(declare-fun lt!398753 () Unit!30082)

(assert (=> b!881597 (= lt!398753 lt!398755)))

(declare-fun res!598911 () Bool)

(declare-datatypes ((SeekEntryResult!8758 0))(
  ( (MissingZero!8758 (index!37403 (_ BitVec 32))) (Found!8758 (index!37404 (_ BitVec 32))) (Intermediate!8758 (undefined!9570 Bool) (index!37405 (_ BitVec 32)) (x!74702 (_ BitVec 32))) (Undefined!8758) (MissingVacant!8758 (index!37406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51354 (_ BitVec 32)) SeekEntryResult!8758)

(assert (=> b!881597 (= res!598911 (= (seekEntryOrOpen!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8758 #b00000000000000000000000000000000)))))

(assert (=> b!881597 (=> (not res!598911) (not e!490629))))

(declare-fun b!881598 () Bool)

(declare-fun e!490630 () Bool)

(assert (=> b!881598 (= e!490630 e!490631)))

(declare-fun c!92966 () Bool)

(assert (=> b!881598 (= c!92966 (validKeyInArray!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109079 () Bool)

(declare-fun res!598912 () Bool)

(assert (=> d!109079 (=> res!598912 e!490630)))

(assert (=> d!109079 (= res!598912 (bvsge #b00000000000000000000000000000000 (size!25139 _keys!868)))))

(assert (=> d!109079 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490630)))

(declare-fun bm!38944 () Bool)

(assert (=> bm!38944 (= call!38947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!881599 () Bool)

(assert (=> b!881599 (= e!490631 call!38947)))

(assert (= (and d!109079 (not res!598912)) b!881598))

(assert (= (and b!881598 c!92966) b!881597))

(assert (= (and b!881598 (not c!92966)) b!881599))

(assert (= (and b!881597 res!598911) b!881596))

(assert (= (or b!881596 b!881599) bm!38944))

(assert (=> b!881597 m!821437))

(declare-fun m!821489 () Bool)

(assert (=> b!881597 m!821489))

(declare-fun m!821491 () Bool)

(assert (=> b!881597 m!821491))

(assert (=> b!881597 m!821437))

(declare-fun m!821493 () Bool)

(assert (=> b!881597 m!821493))

(assert (=> b!881598 m!821437))

(assert (=> b!881598 m!821437))

(assert (=> b!881598 m!821443))

(declare-fun m!821495 () Bool)

(assert (=> bm!38944 m!821495))

(assert (=> b!881421 d!109079))

(declare-fun d!109081 () Bool)

(declare-fun e!490632 () Bool)

(assert (=> d!109081 e!490632))

(declare-fun res!598913 () Bool)

(assert (=> d!109081 (=> (not res!598913) (not e!490632))))

(declare-fun lt!398758 () ListLongMap!10489)

(assert (=> d!109081 (= res!598913 (contains!4263 lt!398758 (_1!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398756 () List!17534)

(assert (=> d!109081 (= lt!398758 (ListLongMap!10490 lt!398756))))

(declare-fun lt!398759 () Unit!30082)

(declare-fun lt!398757 () Unit!30082)

(assert (=> d!109081 (= lt!398759 lt!398757)))

(assert (=> d!109081 (= (getValueByKey!424 lt!398756 (_1!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!429 (_2!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109081 (= lt!398757 (lemmaContainsTupThenGetReturnValue!238 lt!398756 (_1!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109081 (= lt!398756 (insertStrictlySorted!277 (toList!5260 lt!398648) (_1!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109081 (= (+!2532 lt!398648 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398758)))

(declare-fun b!881600 () Bool)

(declare-fun res!598914 () Bool)

(assert (=> b!881600 (=> (not res!598914) (not e!490632))))

(assert (=> b!881600 (= res!598914 (= (getValueByKey!424 (toList!5260 lt!398758) (_1!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!429 (_2!5871 (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!881601 () Bool)

(assert (=> b!881601 (= e!490632 (contains!4264 (toList!5260 lt!398758) (tuple2!11721 (select (arr!24699 _keys!868) from!1053) (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109081 res!598913) b!881600))

(assert (= (and b!881600 res!598914) b!881601))

(declare-fun m!821497 () Bool)

(assert (=> d!109081 m!821497))

(declare-fun m!821499 () Bool)

(assert (=> d!109081 m!821499))

(declare-fun m!821501 () Bool)

(assert (=> d!109081 m!821501))

(declare-fun m!821503 () Bool)

(assert (=> d!109081 m!821503))

(declare-fun m!821505 () Bool)

(assert (=> b!881600 m!821505))

(declare-fun m!821507 () Bool)

(assert (=> b!881601 m!821507))

(assert (=> b!881416 d!109081))

(declare-fun d!109083 () Bool)

(declare-fun c!92969 () Bool)

(assert (=> d!109083 (= c!92969 ((_ is ValueCellFull!8367) (select (arr!24700 _values!688) from!1053)))))

(declare-fun e!490635 () V!28531)

(assert (=> d!109083 (= (get!12996 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490635)))

(declare-fun b!881606 () Bool)

(declare-fun get!12998 (ValueCell!8367 V!28531) V!28531)

(assert (=> b!881606 (= e!490635 (get!12998 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881607 () Bool)

(declare-fun get!12999 (ValueCell!8367 V!28531) V!28531)

(assert (=> b!881607 (= e!490635 (get!12999 (select (arr!24700 _values!688) from!1053) (dynLambda!1247 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109083 c!92969) b!881606))

(assert (= (and d!109083 (not c!92969)) b!881607))

(assert (=> b!881606 m!821267))

(assert (=> b!881606 m!821269))

(declare-fun m!821509 () Bool)

(assert (=> b!881606 m!821509))

(assert (=> b!881607 m!821267))

(assert (=> b!881607 m!821269))

(declare-fun m!821511 () Bool)

(assert (=> b!881607 m!821511))

(assert (=> b!881416 d!109083))

(declare-fun d!109085 () Bool)

(assert (=> d!109085 (= (array_inv!19452 _keys!868) (bvsge (size!25139 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74766 d!109085))

(declare-fun d!109087 () Bool)

(assert (=> d!109087 (= (array_inv!19453 _values!688) (bvsge (size!25140 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74766 d!109087))

(declare-fun condMapEmpty!28053 () Bool)

(declare-fun mapDefault!28053 () ValueCell!8367)

(assert (=> mapNonEmpty!28047 (= condMapEmpty!28053 (= mapRest!28047 ((as const (Array (_ BitVec 32) ValueCell!8367)) mapDefault!28053)))))

(declare-fun e!490641 () Bool)

(declare-fun mapRes!28053 () Bool)

(assert (=> mapNonEmpty!28047 (= tp!53800 (and e!490641 mapRes!28053))))

(declare-fun mapIsEmpty!28053 () Bool)

(assert (=> mapIsEmpty!28053 mapRes!28053))

(declare-fun b!881614 () Bool)

(declare-fun e!490640 () Bool)

(assert (=> b!881614 (= e!490640 tp_is_empty!17613)))

(declare-fun mapNonEmpty!28053 () Bool)

(declare-fun tp!53810 () Bool)

(assert (=> mapNonEmpty!28053 (= mapRes!28053 (and tp!53810 e!490640))))

(declare-fun mapKey!28053 () (_ BitVec 32))

(declare-fun mapValue!28053 () ValueCell!8367)

(declare-fun mapRest!28053 () (Array (_ BitVec 32) ValueCell!8367))

(assert (=> mapNonEmpty!28053 (= mapRest!28047 (store mapRest!28053 mapKey!28053 mapValue!28053))))

(declare-fun b!881615 () Bool)

(assert (=> b!881615 (= e!490641 tp_is_empty!17613)))

(assert (= (and mapNonEmpty!28047 condMapEmpty!28053) mapIsEmpty!28053))

(assert (= (and mapNonEmpty!28047 (not condMapEmpty!28053)) mapNonEmpty!28053))

(assert (= (and mapNonEmpty!28053 ((_ is ValueCellFull!8367) mapValue!28053)) b!881614))

(assert (= (and mapNonEmpty!28047 ((_ is ValueCellFull!8367) mapDefault!28053)) b!881615))

(declare-fun m!821513 () Bool)

(assert (=> mapNonEmpty!28053 m!821513))

(declare-fun b_lambda!12567 () Bool)

(assert (= b_lambda!12551 (or (and start!74766 b_free!15369) b_lambda!12567)))

(declare-fun b_lambda!12569 () Bool)

(assert (= b_lambda!12563 (or (and start!74766 b_free!15369) b_lambda!12569)))

(declare-fun b_lambda!12571 () Bool)

(assert (= b_lambda!12555 (or (and start!74766 b_free!15369) b_lambda!12571)))

(declare-fun b_lambda!12573 () Bool)

(assert (= b_lambda!12557 (or (and start!74766 b_free!15369) b_lambda!12573)))

(declare-fun b_lambda!12575 () Bool)

(assert (= b_lambda!12565 (or (and start!74766 b_free!15369) b_lambda!12575)))

(declare-fun b_lambda!12577 () Bool)

(assert (= b_lambda!12553 (or (and start!74766 b_free!15369) b_lambda!12577)))

(declare-fun b_lambda!12579 () Bool)

(assert (= b_lambda!12561 (or (and start!74766 b_free!15369) b_lambda!12579)))

(declare-fun b_lambda!12581 () Bool)

(assert (= b_lambda!12559 (or (and start!74766 b_free!15369) b_lambda!12581)))

(check-sat (not b!881587) (not b!881510) (not b!881571) (not b!881543) (not b!881506) (not b!881562) (not b_lambda!12573) (not b!881597) (not b!881557) (not bm!38944) (not b!881554) (not b!881583) (not b!881537) (not b_lambda!12579) (not b!881507) (not b!881576) (not d!109075) (not d!109073) (not d!109059) (not b!881526) (not b!881504) tp_is_empty!17613 (not d!109053) (not bm!38928) (not b!881572) (not b!881524) (not b!881607) (not d!109069) (not b!881534) (not b!881573) (not b!881581) (not bm!38938) (not b!881584) (not b_lambda!12567) (not b!881585) (not b!881569) (not b!881532) (not b!881525) (not b!881582) (not b!881598) (not b!881517) (not b!881586) (not b!881559) (not mapNonEmpty!28053) (not b!881564) (not b_lambda!12575) (not b_lambda!12571) (not b!881575) (not b!881558) (not b!881509) (not d!109061) (not b_lambda!12569) (not b_lambda!12581) (not d!109065) (not b_lambda!12577) (not b!881563) (not bm!38940) (not d!109057) (not b_next!15369) (not b!881499) (not b!881505) (not bm!38941) b_and!25411 (not b!881508) (not b!881574) (not b!881601) (not bm!38935) (not b!881606) (not bm!38939) (not bm!38934) (not bm!38933) (not d!109081) (not b!881536) (not b!881600) (not b!881533) (not b!881570) (not b_lambda!12549) (not b!881535) (not b!881531))
(check-sat b_and!25411 (not b_next!15369))
