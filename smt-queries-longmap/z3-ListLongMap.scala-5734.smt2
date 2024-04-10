; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74202 () Bool)

(assert start!74202)

(declare-fun b_free!15009 () Bool)

(declare-fun b_next!15009 () Bool)

(assert (=> start!74202 (= b_free!15009 (not b_next!15009))))

(declare-fun tp!52677 () Bool)

(declare-fun b_and!24761 () Bool)

(assert (=> start!74202 (= tp!52677 b_and!24761)))

(declare-fun b!872935 () Bool)

(declare-fun res!593263 () Bool)

(declare-fun e!486126 () Bool)

(assert (=> b!872935 (=> (not res!593263) (not e!486126))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872935 (= res!593263 (validMask!0 mask!1196))))

(declare-fun res!593264 () Bool)

(assert (=> start!74202 (=> (not res!593264) (not e!486126))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50610 0))(
  ( (array!50611 (arr!24335 (Array (_ BitVec 32) (_ BitVec 64))) (size!24775 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50610)

(assert (=> start!74202 (= res!593264 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24775 _keys!868))))))

(assert (=> start!74202 e!486126))

(declare-fun tp_is_empty!17241 () Bool)

(assert (=> start!74202 tp_is_empty!17241))

(assert (=> start!74202 true))

(assert (=> start!74202 tp!52677))

(declare-fun array_inv!19202 (array!50610) Bool)

(assert (=> start!74202 (array_inv!19202 _keys!868)))

(declare-datatypes ((V!28035 0))(
  ( (V!28036 (val!8668 Int)) )
))
(declare-datatypes ((ValueCell!8181 0))(
  ( (ValueCellFull!8181 (v!11093 V!28035)) (EmptyCell!8181) )
))
(declare-datatypes ((array!50612 0))(
  ( (array!50613 (arr!24336 (Array (_ BitVec 32) ValueCell!8181)) (size!24776 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50612)

(declare-fun e!486125 () Bool)

(declare-fun array_inv!19203 (array!50612) Bool)

(assert (=> start!74202 (and (array_inv!19203 _values!688) e!486125)))

(declare-fun b!872936 () Bool)

(declare-fun e!486129 () Bool)

(declare-fun mapRes!27464 () Bool)

(assert (=> b!872936 (= e!486125 (and e!486129 mapRes!27464))))

(declare-fun condMapEmpty!27464 () Bool)

(declare-fun mapDefault!27464 () ValueCell!8181)

(assert (=> b!872936 (= condMapEmpty!27464 (= (arr!24336 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8181)) mapDefault!27464)))))

(declare-datatypes ((tuple2!11462 0))(
  ( (tuple2!11463 (_1!5742 (_ BitVec 64)) (_2!5742 V!28035)) )
))
(declare-datatypes ((List!17279 0))(
  ( (Nil!17276) (Cons!17275 (h!18406 tuple2!11462) (t!24316 List!17279)) )
))
(declare-datatypes ((ListLongMap!10231 0))(
  ( (ListLongMap!10232 (toList!5131 List!17279)) )
))
(declare-fun call!38494 () ListLongMap!10231)

(declare-fun v!557 () V!28035)

(declare-fun call!38495 () ListLongMap!10231)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!872937 () Bool)

(declare-fun e!486130 () Bool)

(declare-fun +!2461 (ListLongMap!10231 tuple2!11462) ListLongMap!10231)

(assert (=> b!872937 (= e!486130 (= call!38494 (+!2461 call!38495 (tuple2!11463 k0!854 v!557))))))

(declare-fun b!872938 () Bool)

(assert (=> b!872938 (= e!486129 tp_is_empty!17241)))

(declare-fun b!872939 () Bool)

(declare-fun res!593257 () Bool)

(assert (=> b!872939 (=> (not res!593257) (not e!486126))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!872939 (= res!593257 (and (= (select (arr!24335 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24775 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!27464 () Bool)

(declare-fun tp!52678 () Bool)

(declare-fun e!486127 () Bool)

(assert (=> mapNonEmpty!27464 (= mapRes!27464 (and tp!52678 e!486127))))

(declare-fun mapValue!27464 () ValueCell!8181)

(declare-fun mapKey!27464 () (_ BitVec 32))

(declare-fun mapRest!27464 () (Array (_ BitVec 32) ValueCell!8181))

(assert (=> mapNonEmpty!27464 (= (arr!24336 _values!688) (store mapRest!27464 mapKey!27464 mapValue!27464))))

(declare-fun b!872940 () Bool)

(declare-fun res!593259 () Bool)

(assert (=> b!872940 (=> (not res!593259) (not e!486126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50610 (_ BitVec 32)) Bool)

(assert (=> b!872940 (= res!593259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872941 () Bool)

(declare-fun res!593261 () Bool)

(assert (=> b!872941 (=> (not res!593261) (not e!486126))))

(declare-datatypes ((List!17280 0))(
  ( (Nil!17277) (Cons!17276 (h!18407 (_ BitVec 64)) (t!24317 List!17280)) )
))
(declare-fun arrayNoDuplicates!0 (array!50610 (_ BitVec 32) List!17280) Bool)

(assert (=> b!872941 (= res!593261 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17277))))

(declare-fun b!872942 () Bool)

(declare-fun res!593262 () Bool)

(assert (=> b!872942 (=> (not res!593262) (not e!486126))))

(assert (=> b!872942 (= res!593262 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24775 _keys!868))))))

(declare-fun b!872943 () Bool)

(declare-fun res!593258 () Bool)

(assert (=> b!872943 (=> (not res!593258) (not e!486126))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872943 (= res!593258 (and (= (size!24776 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24775 _keys!868) (size!24776 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872944 () Bool)

(assert (=> b!872944 (= e!486126 (not (bvslt i!612 (size!24776 _values!688))))))

(assert (=> b!872944 e!486130))

(declare-fun c!92407 () Bool)

(assert (=> b!872944 (= c!92407 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29920 0))(
  ( (Unit!29921) )
))
(declare-fun lt!395668 () Unit!29920)

(declare-fun minValue!654 () V!28035)

(declare-fun zeroValue!654 () V!28035)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!654 (array!50610 array!50612 (_ BitVec 32) (_ BitVec 32) V!28035 V!28035 (_ BitVec 32) (_ BitVec 64) V!28035 (_ BitVec 32) Int) Unit!29920)

(assert (=> b!872944 (= lt!395668 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!654 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872945 () Bool)

(assert (=> b!872945 (= e!486130 (= call!38494 call!38495))))

(declare-fun mapIsEmpty!27464 () Bool)

(assert (=> mapIsEmpty!27464 mapRes!27464))

(declare-fun b!872946 () Bool)

(assert (=> b!872946 (= e!486127 tp_is_empty!17241)))

(declare-fun bm!38491 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3099 (array!50610 array!50612 (_ BitVec 32) (_ BitVec 32) V!28035 V!28035 (_ BitVec 32) Int) ListLongMap!10231)

(assert (=> bm!38491 (= call!38495 (getCurrentListMapNoExtraKeys!3099 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38492 () Bool)

(assert (=> bm!38492 (= call!38494 (getCurrentListMapNoExtraKeys!3099 _keys!868 (array!50613 (store (arr!24336 _values!688) i!612 (ValueCellFull!8181 v!557)) (size!24776 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872947 () Bool)

(declare-fun res!593260 () Bool)

(assert (=> b!872947 (=> (not res!593260) (not e!486126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872947 (= res!593260 (validKeyInArray!0 k0!854))))

(assert (= (and start!74202 res!593264) b!872935))

(assert (= (and b!872935 res!593263) b!872943))

(assert (= (and b!872943 res!593258) b!872940))

(assert (= (and b!872940 res!593259) b!872941))

(assert (= (and b!872941 res!593261) b!872942))

(assert (= (and b!872942 res!593262) b!872947))

(assert (= (and b!872947 res!593260) b!872939))

(assert (= (and b!872939 res!593257) b!872944))

(assert (= (and b!872944 c!92407) b!872937))

(assert (= (and b!872944 (not c!92407)) b!872945))

(assert (= (or b!872937 b!872945) bm!38492))

(assert (= (or b!872937 b!872945) bm!38491))

(assert (= (and b!872936 condMapEmpty!27464) mapIsEmpty!27464))

(assert (= (and b!872936 (not condMapEmpty!27464)) mapNonEmpty!27464))

(get-info :version)

(assert (= (and mapNonEmpty!27464 ((_ is ValueCellFull!8181) mapValue!27464)) b!872946))

(assert (= (and b!872936 ((_ is ValueCellFull!8181) mapDefault!27464)) b!872938))

(assert (= start!74202 b!872936))

(declare-fun m!813547 () Bool)

(assert (=> b!872944 m!813547))

(declare-fun m!813549 () Bool)

(assert (=> bm!38492 m!813549))

(declare-fun m!813551 () Bool)

(assert (=> bm!38492 m!813551))

(declare-fun m!813553 () Bool)

(assert (=> b!872947 m!813553))

(declare-fun m!813555 () Bool)

(assert (=> b!872940 m!813555))

(declare-fun m!813557 () Bool)

(assert (=> bm!38491 m!813557))

(declare-fun m!813559 () Bool)

(assert (=> b!872939 m!813559))

(declare-fun m!813561 () Bool)

(assert (=> b!872941 m!813561))

(declare-fun m!813563 () Bool)

(assert (=> mapNonEmpty!27464 m!813563))

(declare-fun m!813565 () Bool)

(assert (=> b!872937 m!813565))

(declare-fun m!813567 () Bool)

(assert (=> b!872935 m!813567))

(declare-fun m!813569 () Bool)

(assert (=> start!74202 m!813569))

(declare-fun m!813571 () Bool)

(assert (=> start!74202 m!813571))

(check-sat (not bm!38492) (not b!872941) (not mapNonEmpty!27464) (not start!74202) (not b!872940) (not bm!38491) (not b!872944) (not b!872947) b_and!24761 (not b!872937) tp_is_empty!17241 (not b!872935) (not b_next!15009))
(check-sat b_and!24761 (not b_next!15009))
