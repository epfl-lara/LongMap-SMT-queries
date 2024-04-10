; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74410 () Bool)

(assert start!74410)

(declare-fun b_free!15153 () Bool)

(declare-fun b_next!15153 () Bool)

(assert (=> start!74410 (= b_free!15153 (not b_next!15153))))

(declare-fun tp!53136 () Bool)

(declare-fun b_and!24959 () Bool)

(assert (=> start!74410 (= tp!53136 b_and!24959)))

(declare-fun b!876106 () Bool)

(declare-fun e!487722 () Bool)

(declare-fun tp_is_empty!17397 () Bool)

(assert (=> b!876106 (= e!487722 tp_is_empty!17397)))

(declare-fun mapNonEmpty!27707 () Bool)

(declare-fun mapRes!27707 () Bool)

(declare-fun tp!53137 () Bool)

(declare-fun e!487724 () Bool)

(assert (=> mapNonEmpty!27707 (= mapRes!27707 (and tp!53137 e!487724))))

(declare-datatypes ((V!28243 0))(
  ( (V!28244 (val!8746 Int)) )
))
(declare-datatypes ((ValueCell!8259 0))(
  ( (ValueCellFull!8259 (v!11179 V!28243)) (EmptyCell!8259) )
))
(declare-fun mapRest!27707 () (Array (_ BitVec 32) ValueCell!8259))

(declare-fun mapKey!27707 () (_ BitVec 32))

(declare-datatypes ((array!50920 0))(
  ( (array!50921 (arr!24487 (Array (_ BitVec 32) ValueCell!8259)) (size!24927 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50920)

(declare-fun mapValue!27707 () ValueCell!8259)

(assert (=> mapNonEmpty!27707 (= (arr!24487 _values!688) (store mapRest!27707 mapKey!27707 mapValue!27707))))

(declare-fun b!876107 () Bool)

(declare-fun res!595349 () Bool)

(declare-fun e!487721 () Bool)

(assert (=> b!876107 (=> (not res!595349) (not e!487721))))

(declare-datatypes ((array!50922 0))(
  ( (array!50923 (arr!24488 (Array (_ BitVec 32) (_ BitVec 64))) (size!24928 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50922)

(declare-datatypes ((List!17379 0))(
  ( (Nil!17376) (Cons!17375 (h!18506 (_ BitVec 64)) (t!24436 List!17379)) )
))
(declare-fun arrayNoDuplicates!0 (array!50922 (_ BitVec 32) List!17379) Bool)

(assert (=> b!876107 (= res!595349 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17376))))

(declare-fun b!876108 () Bool)

(declare-fun res!595341 () Bool)

(assert (=> b!876108 (=> (not res!595341) (not e!487721))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876108 (= res!595341 (validMask!0 mask!1196))))

(declare-fun b!876109 () Bool)

(declare-fun e!487720 () Bool)

(assert (=> b!876109 (= e!487721 e!487720)))

(declare-fun res!595344 () Bool)

(assert (=> b!876109 (=> (not res!595344) (not e!487720))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876109 (= res!595344 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!396399 () array!50920)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11560 0))(
  ( (tuple2!11561 (_1!5791 (_ BitVec 64)) (_2!5791 V!28243)) )
))
(declare-datatypes ((List!17380 0))(
  ( (Nil!17377) (Cons!17376 (h!18507 tuple2!11560) (t!24437 List!17380)) )
))
(declare-datatypes ((ListLongMap!10329 0))(
  ( (ListLongMap!10330 (toList!5180 List!17380)) )
))
(declare-fun lt!396396 () ListLongMap!10329)

(declare-fun minValue!654 () V!28243)

(declare-fun zeroValue!654 () V!28243)

(declare-fun getCurrentListMapNoExtraKeys!3147 (array!50922 array!50920 (_ BitVec 32) (_ BitVec 32) V!28243 V!28243 (_ BitVec 32) Int) ListLongMap!10329)

(assert (=> b!876109 (= lt!396396 (getCurrentListMapNoExtraKeys!3147 _keys!868 lt!396399 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28243)

(assert (=> b!876109 (= lt!396399 (array!50921 (store (arr!24487 _values!688) i!612 (ValueCellFull!8259 v!557)) (size!24927 _values!688)))))

(declare-fun lt!396397 () ListLongMap!10329)

(assert (=> b!876109 (= lt!396397 (getCurrentListMapNoExtraKeys!3147 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876110 () Bool)

(declare-fun res!595343 () Bool)

(assert (=> b!876110 (=> (not res!595343) (not e!487721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50922 (_ BitVec 32)) Bool)

(assert (=> b!876110 (= res!595343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876111 () Bool)

(declare-fun e!487723 () Bool)

(assert (=> b!876111 (= e!487723 (and e!487722 mapRes!27707))))

(declare-fun condMapEmpty!27707 () Bool)

(declare-fun mapDefault!27707 () ValueCell!8259)

(assert (=> b!876111 (= condMapEmpty!27707 (= (arr!24487 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8259)) mapDefault!27707)))))

(declare-fun b!876112 () Bool)

(declare-fun e!487719 () Bool)

(assert (=> b!876112 (= e!487719 (bvslt i!612 (size!24927 _values!688)))))

(declare-fun +!2481 (ListLongMap!10329 tuple2!11560) ListLongMap!10329)

(declare-fun get!12875 (ValueCell!8259 V!28243) V!28243)

(declare-fun dynLambda!1209 (Int (_ BitVec 64)) V!28243)

(assert (=> b!876112 (= lt!396396 (+!2481 (getCurrentListMapNoExtraKeys!3147 _keys!868 lt!396399 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11561 (select (arr!24488 _keys!868) from!1053) (get!12875 (select (arr!24487 lt!396399) from!1053) (dynLambda!1209 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876113 () Bool)

(declare-fun e!487718 () Bool)

(declare-fun call!38703 () ListLongMap!10329)

(declare-fun call!38702 () ListLongMap!10329)

(assert (=> b!876113 (= e!487718 (= call!38703 call!38702))))

(declare-fun b!876114 () Bool)

(declare-fun res!595348 () Bool)

(assert (=> b!876114 (=> (not res!595348) (not e!487721))))

(assert (=> b!876114 (= res!595348 (and (= (size!24927 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24928 _keys!868) (size!24927 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38699 () Bool)

(assert (=> bm!38699 (= call!38703 (getCurrentListMapNoExtraKeys!3147 _keys!868 lt!396399 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!595346 () Bool)

(assert (=> start!74410 (=> (not res!595346) (not e!487721))))

(assert (=> start!74410 (= res!595346 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24928 _keys!868))))))

(assert (=> start!74410 e!487721))

(assert (=> start!74410 tp_is_empty!17397))

(assert (=> start!74410 true))

(assert (=> start!74410 tp!53136))

(declare-fun array_inv!19304 (array!50922) Bool)

(assert (=> start!74410 (array_inv!19304 _keys!868)))

(declare-fun array_inv!19305 (array!50920) Bool)

(assert (=> start!74410 (and (array_inv!19305 _values!688) e!487723)))

(declare-fun bm!38700 () Bool)

(assert (=> bm!38700 (= call!38702 (getCurrentListMapNoExtraKeys!3147 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876115 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!876115 (= e!487718 (= call!38703 (+!2481 call!38702 (tuple2!11561 k0!854 v!557))))))

(declare-fun b!876116 () Bool)

(declare-fun res!595345 () Bool)

(assert (=> b!876116 (=> (not res!595345) (not e!487721))))

(assert (=> b!876116 (= res!595345 (and (= (select (arr!24488 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27707 () Bool)

(assert (=> mapIsEmpty!27707 mapRes!27707))

(declare-fun b!876117 () Bool)

(assert (=> b!876117 (= e!487724 tp_is_empty!17397)))

(declare-fun b!876118 () Bool)

(declare-fun res!595347 () Bool)

(assert (=> b!876118 (=> (not res!595347) (not e!487721))))

(assert (=> b!876118 (= res!595347 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24928 _keys!868))))))

(declare-fun b!876119 () Bool)

(declare-fun res!595340 () Bool)

(assert (=> b!876119 (=> (not res!595340) (not e!487721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876119 (= res!595340 (validKeyInArray!0 k0!854))))

(declare-fun b!876120 () Bool)

(assert (=> b!876120 (= e!487720 (not e!487719))))

(declare-fun res!595342 () Bool)

(assert (=> b!876120 (=> res!595342 e!487719)))

(assert (=> b!876120 (= res!595342 (not (validKeyInArray!0 (select (arr!24488 _keys!868) from!1053))))))

(assert (=> b!876120 e!487718))

(declare-fun c!92579 () Bool)

(assert (=> b!876120 (= c!92579 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29960 0))(
  ( (Unit!29961) )
))
(declare-fun lt!396398 () Unit!29960)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!673 (array!50922 array!50920 (_ BitVec 32) (_ BitVec 32) V!28243 V!28243 (_ BitVec 32) (_ BitVec 64) V!28243 (_ BitVec 32) Int) Unit!29960)

(assert (=> b!876120 (= lt!396398 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!673 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74410 res!595346) b!876108))

(assert (= (and b!876108 res!595341) b!876114))

(assert (= (and b!876114 res!595348) b!876110))

(assert (= (and b!876110 res!595343) b!876107))

(assert (= (and b!876107 res!595349) b!876118))

(assert (= (and b!876118 res!595347) b!876119))

(assert (= (and b!876119 res!595340) b!876116))

(assert (= (and b!876116 res!595345) b!876109))

(assert (= (and b!876109 res!595344) b!876120))

(assert (= (and b!876120 c!92579) b!876115))

(assert (= (and b!876120 (not c!92579)) b!876113))

(assert (= (or b!876115 b!876113) bm!38699))

(assert (= (or b!876115 b!876113) bm!38700))

(assert (= (and b!876120 (not res!595342)) b!876112))

(assert (= (and b!876111 condMapEmpty!27707) mapIsEmpty!27707))

(assert (= (and b!876111 (not condMapEmpty!27707)) mapNonEmpty!27707))

(get-info :version)

(assert (= (and mapNonEmpty!27707 ((_ is ValueCellFull!8259) mapValue!27707)) b!876117))

(assert (= (and b!876111 ((_ is ValueCellFull!8259) mapDefault!27707)) b!876106))

(assert (= start!74410 b!876111))

(declare-fun b_lambda!12221 () Bool)

(assert (=> (not b_lambda!12221) (not b!876112)))

(declare-fun t!24435 () Bool)

(declare-fun tb!4913 () Bool)

(assert (=> (and start!74410 (= defaultEntry!696 defaultEntry!696) t!24435) tb!4913))

(declare-fun result!9445 () Bool)

(assert (=> tb!4913 (= result!9445 tp_is_empty!17397)))

(assert (=> b!876112 t!24435))

(declare-fun b_and!24961 () Bool)

(assert (= b_and!24959 (and (=> t!24435 result!9445) b_and!24961)))

(declare-fun m!815903 () Bool)

(assert (=> bm!38699 m!815903))

(declare-fun m!815905 () Bool)

(assert (=> b!876110 m!815905))

(declare-fun m!815907 () Bool)

(assert (=> b!876107 m!815907))

(declare-fun m!815909 () Bool)

(assert (=> start!74410 m!815909))

(declare-fun m!815911 () Bool)

(assert (=> start!74410 m!815911))

(declare-fun m!815913 () Bool)

(assert (=> b!876108 m!815913))

(declare-fun m!815915 () Bool)

(assert (=> b!876119 m!815915))

(declare-fun m!815917 () Bool)

(assert (=> b!876120 m!815917))

(assert (=> b!876120 m!815917))

(declare-fun m!815919 () Bool)

(assert (=> b!876120 m!815919))

(declare-fun m!815921 () Bool)

(assert (=> b!876120 m!815921))

(declare-fun m!815923 () Bool)

(assert (=> b!876115 m!815923))

(declare-fun m!815925 () Bool)

(assert (=> mapNonEmpty!27707 m!815925))

(declare-fun m!815927 () Bool)

(assert (=> b!876116 m!815927))

(declare-fun m!815929 () Bool)

(assert (=> b!876109 m!815929))

(declare-fun m!815931 () Bool)

(assert (=> b!876109 m!815931))

(declare-fun m!815933 () Bool)

(assert (=> b!876109 m!815933))

(declare-fun m!815935 () Bool)

(assert (=> b!876112 m!815935))

(declare-fun m!815937 () Bool)

(assert (=> b!876112 m!815937))

(declare-fun m!815939 () Bool)

(assert (=> b!876112 m!815939))

(assert (=> b!876112 m!815903))

(declare-fun m!815941 () Bool)

(assert (=> b!876112 m!815941))

(assert (=> b!876112 m!815935))

(assert (=> b!876112 m!815903))

(assert (=> b!876112 m!815917))

(assert (=> b!876112 m!815937))

(declare-fun m!815943 () Bool)

(assert (=> bm!38700 m!815943))

(check-sat (not b_next!15153) (not b!876110) (not bm!38700) (not mapNonEmpty!27707) tp_is_empty!17397 (not start!74410) (not b!876115) (not b!876119) (not b!876109) (not bm!38699) (not b_lambda!12221) (not b!876112) (not b!876108) b_and!24961 (not b!876107) (not b!876120))
(check-sat b_and!24961 (not b_next!15153))
