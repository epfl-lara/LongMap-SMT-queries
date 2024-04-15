; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74050 () Bool)

(assert start!74050)

(declare-fun b_free!14983 () Bool)

(declare-fun b_next!14983 () Bool)

(assert (=> start!74050 (= b_free!14983 (not b_next!14983))))

(declare-fun tp!52453 () Bool)

(declare-fun b_and!24709 () Bool)

(assert (=> start!74050 (= tp!52453 b_and!24709)))

(declare-fun b!871108 () Bool)

(declare-fun e!484996 () Bool)

(declare-fun tp_is_empty!17119 () Bool)

(assert (=> b!871108 (= e!484996 tp_is_empty!17119)))

(declare-fun b!871109 () Bool)

(declare-fun res!592179 () Bool)

(declare-fun e!485000 () Bool)

(assert (=> b!871109 (=> (not res!592179) (not e!485000))))

(declare-datatypes ((array!50365 0))(
  ( (array!50366 (arr!24214 (Array (_ BitVec 32) (_ BitVec 64))) (size!24656 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50365)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50365 (_ BitVec 32)) Bool)

(assert (=> b!871109 (= res!592179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27278 () Bool)

(declare-fun mapRes!27278 () Bool)

(declare-fun tp!52454 () Bool)

(assert (=> mapNonEmpty!27278 (= mapRes!27278 (and tp!52454 e!484996))))

(declare-datatypes ((V!27873 0))(
  ( (V!27874 (val!8607 Int)) )
))
(declare-datatypes ((ValueCell!8120 0))(
  ( (ValueCellFull!8120 (v!11026 V!27873)) (EmptyCell!8120) )
))
(declare-fun mapValue!27278 () ValueCell!8120)

(declare-fun mapKey!27278 () (_ BitVec 32))

(declare-fun mapRest!27278 () (Array (_ BitVec 32) ValueCell!8120))

(declare-datatypes ((array!50367 0))(
  ( (array!50368 (arr!24215 (Array (_ BitVec 32) ValueCell!8120)) (size!24657 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50367)

(assert (=> mapNonEmpty!27278 (= (arr!24215 _values!688) (store mapRest!27278 mapKey!27278 mapValue!27278))))

(declare-fun b!871110 () Bool)

(declare-fun res!592181 () Bool)

(assert (=> b!871110 (=> (not res!592181) (not e!485000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871110 (= res!592181 (validMask!0 mask!1196))))

(declare-fun b!871111 () Bool)

(declare-fun res!592175 () Bool)

(assert (=> b!871111 (=> (not res!592175) (not e!485000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871111 (= res!592175 (and (= (size!24657 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24656 _keys!868) (size!24657 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!592174 () Bool)

(assert (=> start!74050 (=> (not res!592174) (not e!485000))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74050 (= res!592174 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24656 _keys!868))))))

(assert (=> start!74050 e!485000))

(assert (=> start!74050 tp_is_empty!17119))

(assert (=> start!74050 true))

(assert (=> start!74050 tp!52453))

(declare-fun array_inv!19178 (array!50365) Bool)

(assert (=> start!74050 (array_inv!19178 _keys!868)))

(declare-fun e!485001 () Bool)

(declare-fun array_inv!19179 (array!50367) Bool)

(assert (=> start!74050 (and (array_inv!19179 _values!688) e!485001)))

(declare-fun b!871112 () Bool)

(declare-fun res!592180 () Bool)

(assert (=> b!871112 (=> (not res!592180) (not e!485000))))

(declare-datatypes ((List!17232 0))(
  ( (Nil!17229) (Cons!17228 (h!18359 (_ BitVec 64)) (t!24260 List!17232)) )
))
(declare-fun arrayNoDuplicates!0 (array!50365 (_ BitVec 32) List!17232) Bool)

(assert (=> b!871112 (= res!592180 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17229))))

(declare-fun b!871113 () Bool)

(declare-fun e!484999 () Bool)

(assert (=> b!871113 (= e!485001 (and e!484999 mapRes!27278))))

(declare-fun condMapEmpty!27278 () Bool)

(declare-fun mapDefault!27278 () ValueCell!8120)

(assert (=> b!871113 (= condMapEmpty!27278 (= (arr!24215 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8120)) mapDefault!27278)))))

(declare-fun mapIsEmpty!27278 () Bool)

(assert (=> mapIsEmpty!27278 mapRes!27278))

(declare-fun b!871114 () Bool)

(declare-fun e!484997 () Bool)

(assert (=> b!871114 (= e!484997 (not true))))

(declare-fun v!557 () V!27873)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395203 () array!50367)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27873)

(declare-fun zeroValue!654 () V!27873)

(declare-datatypes ((tuple2!11458 0))(
  ( (tuple2!11459 (_1!5740 (_ BitVec 64)) (_2!5740 V!27873)) )
))
(declare-datatypes ((List!17233 0))(
  ( (Nil!17230) (Cons!17229 (h!18360 tuple2!11458) (t!24261 List!17233)) )
))
(declare-datatypes ((ListLongMap!10217 0))(
  ( (ListLongMap!10218 (toList!5124 List!17233)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3117 (array!50365 array!50367 (_ BitVec 32) (_ BitVec 32) V!27873 V!27873 (_ BitVec 32) Int) ListLongMap!10217)

(declare-fun +!2482 (ListLongMap!10217 tuple2!11458) ListLongMap!10217)

(assert (=> b!871114 (= (getCurrentListMapNoExtraKeys!3117 _keys!868 lt!395203 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2482 (getCurrentListMapNoExtraKeys!3117 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11459 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29851 0))(
  ( (Unit!29852) )
))
(declare-fun lt!395204 () Unit!29851)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!650 (array!50365 array!50367 (_ BitVec 32) (_ BitVec 32) V!27873 V!27873 (_ BitVec 32) (_ BitVec 64) V!27873 (_ BitVec 32) Int) Unit!29851)

(assert (=> b!871114 (= lt!395204 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!650 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871115 () Bool)

(declare-fun res!592178 () Bool)

(assert (=> b!871115 (=> (not res!592178) (not e!485000))))

(assert (=> b!871115 (= res!592178 (and (= (select (arr!24214 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871116 () Bool)

(declare-fun res!592177 () Bool)

(assert (=> b!871116 (=> (not res!592177) (not e!485000))))

(assert (=> b!871116 (= res!592177 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24656 _keys!868))))))

(declare-fun b!871117 () Bool)

(assert (=> b!871117 (= e!484999 tp_is_empty!17119)))

(declare-fun b!871118 () Bool)

(assert (=> b!871118 (= e!485000 e!484997)))

(declare-fun res!592182 () Bool)

(assert (=> b!871118 (=> (not res!592182) (not e!484997))))

(assert (=> b!871118 (= res!592182 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395201 () ListLongMap!10217)

(assert (=> b!871118 (= lt!395201 (getCurrentListMapNoExtraKeys!3117 _keys!868 lt!395203 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871118 (= lt!395203 (array!50368 (store (arr!24215 _values!688) i!612 (ValueCellFull!8120 v!557)) (size!24657 _values!688)))))

(declare-fun lt!395202 () ListLongMap!10217)

(assert (=> b!871118 (= lt!395202 (getCurrentListMapNoExtraKeys!3117 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871119 () Bool)

(declare-fun res!592176 () Bool)

(assert (=> b!871119 (=> (not res!592176) (not e!485000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871119 (= res!592176 (validKeyInArray!0 k0!854))))

(assert (= (and start!74050 res!592174) b!871110))

(assert (= (and b!871110 res!592181) b!871111))

(assert (= (and b!871111 res!592175) b!871109))

(assert (= (and b!871109 res!592179) b!871112))

(assert (= (and b!871112 res!592180) b!871116))

(assert (= (and b!871116 res!592177) b!871119))

(assert (= (and b!871119 res!592176) b!871115))

(assert (= (and b!871115 res!592178) b!871118))

(assert (= (and b!871118 res!592182) b!871114))

(assert (= (and b!871113 condMapEmpty!27278) mapIsEmpty!27278))

(assert (= (and b!871113 (not condMapEmpty!27278)) mapNonEmpty!27278))

(get-info :version)

(assert (= (and mapNonEmpty!27278 ((_ is ValueCellFull!8120) mapValue!27278)) b!871108))

(assert (= (and b!871113 ((_ is ValueCellFull!8120) mapDefault!27278)) b!871117))

(assert (= start!74050 b!871113))

(declare-fun m!811809 () Bool)

(assert (=> b!871110 m!811809))

(declare-fun m!811811 () Bool)

(assert (=> b!871118 m!811811))

(declare-fun m!811813 () Bool)

(assert (=> b!871118 m!811813))

(declare-fun m!811815 () Bool)

(assert (=> b!871118 m!811815))

(declare-fun m!811817 () Bool)

(assert (=> b!871109 m!811817))

(declare-fun m!811819 () Bool)

(assert (=> b!871119 m!811819))

(declare-fun m!811821 () Bool)

(assert (=> b!871115 m!811821))

(declare-fun m!811823 () Bool)

(assert (=> start!74050 m!811823))

(declare-fun m!811825 () Bool)

(assert (=> start!74050 m!811825))

(declare-fun m!811827 () Bool)

(assert (=> b!871114 m!811827))

(declare-fun m!811829 () Bool)

(assert (=> b!871114 m!811829))

(assert (=> b!871114 m!811829))

(declare-fun m!811831 () Bool)

(assert (=> b!871114 m!811831))

(declare-fun m!811833 () Bool)

(assert (=> b!871114 m!811833))

(declare-fun m!811835 () Bool)

(assert (=> mapNonEmpty!27278 m!811835))

(declare-fun m!811837 () Bool)

(assert (=> b!871112 m!811837))

(check-sat (not b!871110) tp_is_empty!17119 (not b!871114) (not b!871118) b_and!24709 (not b_next!14983) (not b!871112) (not start!74050) (not b!871109) (not b!871119) (not mapNonEmpty!27278))
(check-sat b_and!24709 (not b_next!14983))
