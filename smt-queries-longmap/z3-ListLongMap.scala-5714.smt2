; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74236 () Bool)

(assert start!74236)

(declare-fun b_free!14983 () Bool)

(declare-fun b_next!14983 () Bool)

(assert (=> start!74236 (= b_free!14983 (not b_next!14983))))

(declare-fun tp!52454 () Bool)

(declare-fun b_and!24745 () Bool)

(assert (=> start!74236 (= tp!52454 b_and!24745)))

(declare-fun b!872250 () Bool)

(declare-fun e!485730 () Bool)

(declare-fun e!485731 () Bool)

(declare-fun mapRes!27278 () Bool)

(assert (=> b!872250 (= e!485730 (and e!485731 mapRes!27278))))

(declare-fun condMapEmpty!27278 () Bool)

(declare-datatypes ((V!27873 0))(
  ( (V!27874 (val!8607 Int)) )
))
(declare-datatypes ((ValueCell!8120 0))(
  ( (ValueCellFull!8120 (v!11032 V!27873)) (EmptyCell!8120) )
))
(declare-datatypes ((array!50435 0))(
  ( (array!50436 (arr!24244 (Array (_ BitVec 32) ValueCell!8120)) (size!24685 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50435)

(declare-fun mapDefault!27278 () ValueCell!8120)

(assert (=> b!872250 (= condMapEmpty!27278 (= (arr!24244 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8120)) mapDefault!27278)))))

(declare-fun b!872251 () Bool)

(declare-fun res!592635 () Bool)

(declare-fun e!485726 () Bool)

(assert (=> b!872251 (=> (not res!592635) (not e!485726))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50437 0))(
  ( (array!50438 (arr!24245 (Array (_ BitVec 32) (_ BitVec 64))) (size!24686 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50437)

(assert (=> b!872251 (= res!592635 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24686 _keys!868))))))

(declare-fun b!872252 () Bool)

(declare-fun res!592631 () Bool)

(assert (=> b!872252 (=> (not res!592631) (not e!485726))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!872252 (= res!592631 (and (= (select (arr!24245 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!872253 () Bool)

(declare-fun res!592630 () Bool)

(assert (=> b!872253 (=> (not res!592630) (not e!485726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872253 (= res!592630 (validKeyInArray!0 k0!854))))

(declare-fun b!872254 () Bool)

(declare-fun res!592634 () Bool)

(assert (=> b!872254 (=> (not res!592634) (not e!485726))))

(declare-datatypes ((List!17184 0))(
  ( (Nil!17181) (Cons!17180 (h!18317 (_ BitVec 64)) (t!24213 List!17184)) )
))
(declare-fun arrayNoDuplicates!0 (array!50437 (_ BitVec 32) List!17184) Bool)

(assert (=> b!872254 (= res!592634 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17181))))

(declare-fun res!592632 () Bool)

(assert (=> start!74236 (=> (not res!592632) (not e!485726))))

(assert (=> start!74236 (= res!592632 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24686 _keys!868))))))

(assert (=> start!74236 e!485726))

(declare-fun tp_is_empty!17119 () Bool)

(assert (=> start!74236 tp_is_empty!17119))

(assert (=> start!74236 true))

(assert (=> start!74236 tp!52454))

(declare-fun array_inv!19196 (array!50437) Bool)

(assert (=> start!74236 (array_inv!19196 _keys!868)))

(declare-fun array_inv!19197 (array!50435) Bool)

(assert (=> start!74236 (and (array_inv!19197 _values!688) e!485730)))

(declare-fun b!872255 () Bool)

(assert (=> b!872255 (= e!485731 tp_is_empty!17119)))

(declare-fun b!872256 () Bool)

(declare-fun e!485729 () Bool)

(assert (=> b!872256 (= e!485729 tp_is_empty!17119)))

(declare-fun b!872257 () Bool)

(declare-fun res!592633 () Bool)

(assert (=> b!872257 (=> (not res!592633) (not e!485726))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872257 (= res!592633 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27278 () Bool)

(assert (=> mapIsEmpty!27278 mapRes!27278))

(declare-fun b!872258 () Bool)

(declare-fun res!592628 () Bool)

(assert (=> b!872258 (=> (not res!592628) (not e!485726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50437 (_ BitVec 32)) Bool)

(assert (=> b!872258 (= res!592628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872259 () Bool)

(declare-fun res!592636 () Bool)

(assert (=> b!872259 (=> (not res!592636) (not e!485726))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872259 (= res!592636 (and (= (size!24685 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24686 _keys!868) (size!24685 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872260 () Bool)

(declare-fun e!485727 () Bool)

(assert (=> b!872260 (= e!485726 e!485727)))

(declare-fun res!592629 () Bool)

(assert (=> b!872260 (=> (not res!592629) (not e!485727))))

(assert (=> b!872260 (= res!592629 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11366 0))(
  ( (tuple2!11367 (_1!5694 (_ BitVec 64)) (_2!5694 V!27873)) )
))
(declare-datatypes ((List!17185 0))(
  ( (Nil!17182) (Cons!17181 (h!18318 tuple2!11366) (t!24214 List!17185)) )
))
(declare-datatypes ((ListLongMap!10137 0))(
  ( (ListLongMap!10138 (toList!5084 List!17185)) )
))
(declare-fun lt!395800 () ListLongMap!10137)

(declare-fun lt!395799 () array!50435)

(declare-fun minValue!654 () V!27873)

(declare-fun zeroValue!654 () V!27873)

(declare-fun getCurrentListMapNoExtraKeys!3128 (array!50437 array!50435 (_ BitVec 32) (_ BitVec 32) V!27873 V!27873 (_ BitVec 32) Int) ListLongMap!10137)

(assert (=> b!872260 (= lt!395800 (getCurrentListMapNoExtraKeys!3128 _keys!868 lt!395799 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27873)

(assert (=> b!872260 (= lt!395799 (array!50436 (store (arr!24244 _values!688) i!612 (ValueCellFull!8120 v!557)) (size!24685 _values!688)))))

(declare-fun lt!395801 () ListLongMap!10137)

(assert (=> b!872260 (= lt!395801 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27278 () Bool)

(declare-fun tp!52453 () Bool)

(assert (=> mapNonEmpty!27278 (= mapRes!27278 (and tp!52453 e!485729))))

(declare-fun mapValue!27278 () ValueCell!8120)

(declare-fun mapKey!27278 () (_ BitVec 32))

(declare-fun mapRest!27278 () (Array (_ BitVec 32) ValueCell!8120))

(assert (=> mapNonEmpty!27278 (= (arr!24244 _values!688) (store mapRest!27278 mapKey!27278 mapValue!27278))))

(declare-fun b!872261 () Bool)

(assert (=> b!872261 (= e!485727 (not true))))

(declare-fun +!2472 (ListLongMap!10137 tuple2!11366) ListLongMap!10137)

(assert (=> b!872261 (= (getCurrentListMapNoExtraKeys!3128 _keys!868 lt!395799 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2472 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11367 k0!854 v!557)))))

(declare-datatypes ((Unit!29894 0))(
  ( (Unit!29895) )
))
(declare-fun lt!395798 () Unit!29894)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!643 (array!50437 array!50435 (_ BitVec 32) (_ BitVec 32) V!27873 V!27873 (_ BitVec 32) (_ BitVec 64) V!27873 (_ BitVec 32) Int) Unit!29894)

(assert (=> b!872261 (= lt!395798 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!643 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74236 res!592632) b!872257))

(assert (= (and b!872257 res!592633) b!872259))

(assert (= (and b!872259 res!592636) b!872258))

(assert (= (and b!872258 res!592628) b!872254))

(assert (= (and b!872254 res!592634) b!872251))

(assert (= (and b!872251 res!592635) b!872253))

(assert (= (and b!872253 res!592630) b!872252))

(assert (= (and b!872252 res!592631) b!872260))

(assert (= (and b!872260 res!592629) b!872261))

(assert (= (and b!872250 condMapEmpty!27278) mapIsEmpty!27278))

(assert (= (and b!872250 (not condMapEmpty!27278)) mapNonEmpty!27278))

(get-info :version)

(assert (= (and mapNonEmpty!27278 ((_ is ValueCellFull!8120) mapValue!27278)) b!872256))

(assert (= (and b!872250 ((_ is ValueCellFull!8120) mapDefault!27278)) b!872255))

(assert (= start!74236 b!872250))

(declare-fun m!813857 () Bool)

(assert (=> b!872252 m!813857))

(declare-fun m!813859 () Bool)

(assert (=> start!74236 m!813859))

(declare-fun m!813861 () Bool)

(assert (=> start!74236 m!813861))

(declare-fun m!813863 () Bool)

(assert (=> b!872254 m!813863))

(declare-fun m!813865 () Bool)

(assert (=> b!872258 m!813865))

(declare-fun m!813867 () Bool)

(assert (=> b!872260 m!813867))

(declare-fun m!813869 () Bool)

(assert (=> b!872260 m!813869))

(declare-fun m!813871 () Bool)

(assert (=> b!872260 m!813871))

(declare-fun m!813873 () Bool)

(assert (=> mapNonEmpty!27278 m!813873))

(declare-fun m!813875 () Bool)

(assert (=> b!872253 m!813875))

(declare-fun m!813877 () Bool)

(assert (=> b!872257 m!813877))

(declare-fun m!813879 () Bool)

(assert (=> b!872261 m!813879))

(declare-fun m!813881 () Bool)

(assert (=> b!872261 m!813881))

(assert (=> b!872261 m!813881))

(declare-fun m!813883 () Bool)

(assert (=> b!872261 m!813883))

(declare-fun m!813885 () Bool)

(assert (=> b!872261 m!813885))

(check-sat (not b!872253) (not b!872257) (not b!872260) (not b!872258) (not mapNonEmpty!27278) tp_is_empty!17119 (not b!872254) (not start!74236) (not b_next!14983) (not b!872261) b_and!24745)
(check-sat b_and!24745 (not b_next!14983))
