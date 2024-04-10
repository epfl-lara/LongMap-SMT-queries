; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74348 () Bool)

(assert start!74348)

(declare-fun b_free!15111 () Bool)

(declare-fun b_next!15111 () Bool)

(assert (=> start!74348 (= b_free!15111 (not b_next!15111))))

(declare-fun tp!53008 () Bool)

(declare-fun b_and!24887 () Bool)

(assert (=> start!74348 (= tp!53008 b_and!24887)))

(declare-fun mapNonEmpty!27641 () Bool)

(declare-fun mapRes!27641 () Bool)

(declare-fun tp!53007 () Bool)

(declare-fun e!487142 () Bool)

(assert (=> mapNonEmpty!27641 (= mapRes!27641 (and tp!53007 e!487142))))

(declare-datatypes ((V!28187 0))(
  ( (V!28188 (val!8725 Int)) )
))
(declare-datatypes ((ValueCell!8238 0))(
  ( (ValueCellFull!8238 (v!11154 V!28187)) (EmptyCell!8238) )
))
(declare-fun mapRest!27641 () (Array (_ BitVec 32) ValueCell!8238))

(declare-fun mapValue!27641 () ValueCell!8238)

(declare-fun mapKey!27641 () (_ BitVec 32))

(declare-datatypes ((array!50836 0))(
  ( (array!50837 (arr!24446 (Array (_ BitVec 32) ValueCell!8238)) (size!24886 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50836)

(assert (=> mapNonEmpty!27641 (= (arr!24446 _values!688) (store mapRest!27641 mapKey!27641 mapValue!27641))))

(declare-fun b!875021 () Bool)

(declare-fun e!487141 () Bool)

(declare-fun e!487139 () Bool)

(assert (=> b!875021 (= e!487141 (and e!487139 mapRes!27641))))

(declare-fun condMapEmpty!27641 () Bool)

(declare-fun mapDefault!27641 () ValueCell!8238)

(assert (=> b!875021 (= condMapEmpty!27641 (= (arr!24446 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8238)) mapDefault!27641)))))

(declare-fun b!875022 () Bool)

(declare-fun tp_is_empty!17355 () Bool)

(assert (=> b!875022 (= e!487142 tp_is_empty!17355)))

(declare-fun mapIsEmpty!27641 () Bool)

(assert (=> mapIsEmpty!27641 mapRes!27641))

(declare-fun b!875023 () Bool)

(declare-fun res!594664 () Bool)

(declare-fun e!487138 () Bool)

(assert (=> b!875023 (=> (not res!594664) (not e!487138))))

(declare-datatypes ((array!50838 0))(
  ( (array!50839 (arr!24447 (Array (_ BitVec 32) (_ BitVec 64))) (size!24887 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50838)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50838 (_ BitVec 32)) Bool)

(assert (=> b!875023 (= res!594664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875024 () Bool)

(declare-fun res!594672 () Bool)

(assert (=> b!875024 (=> (not res!594672) (not e!487138))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!875024 (= res!594672 (and (= (size!24886 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24887 _keys!868) (size!24886 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!11524 0))(
  ( (tuple2!11525 (_1!5773 (_ BitVec 64)) (_2!5773 V!28187)) )
))
(declare-datatypes ((List!17349 0))(
  ( (Nil!17346) (Cons!17345 (h!18476 tuple2!11524) (t!24390 List!17349)) )
))
(declare-datatypes ((ListLongMap!10293 0))(
  ( (ListLongMap!10294 (toList!5162 List!17349)) )
))
(declare-fun call!38559 () ListLongMap!10293)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28187)

(declare-fun zeroValue!654 () V!28187)

(declare-fun bm!38555 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3129 (array!50838 array!50836 (_ BitVec 32) (_ BitVec 32) V!28187 V!28187 (_ BitVec 32) Int) ListLongMap!10293)

(assert (=> bm!38555 (= call!38559 (getCurrentListMapNoExtraKeys!3129 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875025 () Bool)

(declare-fun e!487136 () Bool)

(assert (=> b!875025 (= e!487138 e!487136)))

(declare-fun res!594668 () Bool)

(assert (=> b!875025 (=> (not res!594668) (not e!487136))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875025 (= res!594668 (= from!1053 i!612))))

(declare-fun lt!396059 () array!50836)

(declare-fun lt!396058 () ListLongMap!10293)

(assert (=> b!875025 (= lt!396058 (getCurrentListMapNoExtraKeys!3129 _keys!868 lt!396059 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28187)

(assert (=> b!875025 (= lt!396059 (array!50837 (store (arr!24446 _values!688) i!612 (ValueCellFull!8238 v!557)) (size!24886 _values!688)))))

(declare-fun lt!396056 () ListLongMap!10293)

(assert (=> b!875025 (= lt!396056 (getCurrentListMapNoExtraKeys!3129 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38556 () Bool)

(declare-fun call!38558 () ListLongMap!10293)

(assert (=> bm!38556 (= call!38558 (getCurrentListMapNoExtraKeys!3129 _keys!868 lt!396059 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875026 () Bool)

(declare-fun res!594671 () Bool)

(assert (=> b!875026 (=> (not res!594671) (not e!487138))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!875026 (= res!594671 (and (= (select (arr!24447 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!594670 () Bool)

(assert (=> start!74348 (=> (not res!594670) (not e!487138))))

(assert (=> start!74348 (= res!594670 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24887 _keys!868))))))

(assert (=> start!74348 e!487138))

(assert (=> start!74348 tp_is_empty!17355))

(assert (=> start!74348 true))

(assert (=> start!74348 tp!53008))

(declare-fun array_inv!19272 (array!50838) Bool)

(assert (=> start!74348 (array_inv!19272 _keys!868)))

(declare-fun array_inv!19273 (array!50836) Bool)

(assert (=> start!74348 (and (array_inv!19273 _values!688) e!487141)))

(declare-fun b!875027 () Bool)

(declare-fun res!594669 () Bool)

(assert (=> b!875027 (=> (not res!594669) (not e!487138))))

(declare-datatypes ((List!17350 0))(
  ( (Nil!17347) (Cons!17346 (h!18477 (_ BitVec 64)) (t!24391 List!17350)) )
))
(declare-fun arrayNoDuplicates!0 (array!50838 (_ BitVec 32) List!17350) Bool)

(assert (=> b!875027 (= res!594669 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17347))))

(declare-fun b!875028 () Bool)

(declare-fun res!594666 () Bool)

(assert (=> b!875028 (=> (not res!594666) (not e!487138))))

(assert (=> b!875028 (= res!594666 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24887 _keys!868))))))

(declare-fun b!875029 () Bool)

(assert (=> b!875029 (= e!487139 tp_is_empty!17355)))

(declare-fun b!875030 () Bool)

(declare-fun res!594665 () Bool)

(assert (=> b!875030 (=> (not res!594665) (not e!487138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875030 (= res!594665 (validMask!0 mask!1196))))

(declare-fun b!875031 () Bool)

(assert (=> b!875031 (= e!487136 (not (bvslt from!1053 (size!24887 _keys!868))))))

(declare-fun e!487137 () Bool)

(assert (=> b!875031 e!487137))

(declare-fun c!92480 () Bool)

(assert (=> b!875031 (= c!92480 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29930 0))(
  ( (Unit!29931) )
))
(declare-fun lt!396057 () Unit!29930)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!658 (array!50838 array!50836 (_ BitVec 32) (_ BitVec 32) V!28187 V!28187 (_ BitVec 32) (_ BitVec 64) V!28187 (_ BitVec 32) Int) Unit!29930)

(assert (=> b!875031 (= lt!396057 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!658 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875032 () Bool)

(assert (=> b!875032 (= e!487137 (= call!38558 call!38559))))

(declare-fun b!875033 () Bool)

(declare-fun res!594667 () Bool)

(assert (=> b!875033 (=> (not res!594667) (not e!487138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875033 (= res!594667 (validKeyInArray!0 k0!854))))

(declare-fun b!875034 () Bool)

(declare-fun +!2466 (ListLongMap!10293 tuple2!11524) ListLongMap!10293)

(assert (=> b!875034 (= e!487137 (= call!38558 (+!2466 call!38559 (tuple2!11525 k0!854 v!557))))))

(assert (= (and start!74348 res!594670) b!875030))

(assert (= (and b!875030 res!594665) b!875024))

(assert (= (and b!875024 res!594672) b!875023))

(assert (= (and b!875023 res!594664) b!875027))

(assert (= (and b!875027 res!594669) b!875028))

(assert (= (and b!875028 res!594666) b!875033))

(assert (= (and b!875033 res!594667) b!875026))

(assert (= (and b!875026 res!594671) b!875025))

(assert (= (and b!875025 res!594668) b!875031))

(assert (= (and b!875031 c!92480) b!875034))

(assert (= (and b!875031 (not c!92480)) b!875032))

(assert (= (or b!875034 b!875032) bm!38556))

(assert (= (or b!875034 b!875032) bm!38555))

(assert (= (and b!875021 condMapEmpty!27641) mapIsEmpty!27641))

(assert (= (and b!875021 (not condMapEmpty!27641)) mapNonEmpty!27641))

(get-info :version)

(assert (= (and mapNonEmpty!27641 ((_ is ValueCellFull!8238) mapValue!27641)) b!875022))

(assert (= (and b!875021 ((_ is ValueCellFull!8238) mapDefault!27641)) b!875029))

(assert (= start!74348 b!875021))

(declare-fun m!814993 () Bool)

(assert (=> b!875034 m!814993))

(declare-fun m!814995 () Bool)

(assert (=> bm!38555 m!814995))

(declare-fun m!814997 () Bool)

(assert (=> b!875027 m!814997))

(declare-fun m!814999 () Bool)

(assert (=> b!875031 m!814999))

(declare-fun m!815001 () Bool)

(assert (=> b!875030 m!815001))

(declare-fun m!815003 () Bool)

(assert (=> mapNonEmpty!27641 m!815003))

(declare-fun m!815005 () Bool)

(assert (=> bm!38556 m!815005))

(declare-fun m!815007 () Bool)

(assert (=> b!875026 m!815007))

(declare-fun m!815009 () Bool)

(assert (=> b!875025 m!815009))

(declare-fun m!815011 () Bool)

(assert (=> b!875025 m!815011))

(declare-fun m!815013 () Bool)

(assert (=> b!875025 m!815013))

(declare-fun m!815015 () Bool)

(assert (=> b!875023 m!815015))

(declare-fun m!815017 () Bool)

(assert (=> b!875033 m!815017))

(declare-fun m!815019 () Bool)

(assert (=> start!74348 m!815019))

(declare-fun m!815021 () Bool)

(assert (=> start!74348 m!815021))

(check-sat (not bm!38555) (not bm!38556) (not b!875025) (not start!74348) tp_is_empty!17355 (not b!875030) (not b!875023) (not b!875034) (not mapNonEmpty!27641) b_and!24887 (not b!875027) (not b!875031) (not b!875033) (not b_next!15111))
(check-sat b_and!24887 (not b_next!15111))
