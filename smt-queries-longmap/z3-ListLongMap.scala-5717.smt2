; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74088 () Bool)

(assert start!74088)

(declare-fun b_free!14997 () Bool)

(declare-fun b_next!14997 () Bool)

(assert (=> start!74088 (= b_free!14997 (not b_next!14997))))

(declare-fun tp!52503 () Bool)

(declare-fun b_and!24749 () Bool)

(assert (=> start!74088 (= tp!52503 b_and!24749)))

(declare-fun b!871675 () Bool)

(declare-fun e!485323 () Bool)

(declare-fun e!485322 () Bool)

(declare-fun mapRes!27308 () Bool)

(assert (=> b!871675 (= e!485323 (and e!485322 mapRes!27308))))

(declare-fun condMapEmpty!27308 () Bool)

(declare-datatypes ((V!27899 0))(
  ( (V!27900 (val!8617 Int)) )
))
(declare-datatypes ((ValueCell!8130 0))(
  ( (ValueCellFull!8130 (v!11042 V!27899)) (EmptyCell!8130) )
))
(declare-datatypes ((array!50416 0))(
  ( (array!50417 (arr!24239 (Array (_ BitVec 32) ValueCell!8130)) (size!24679 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50416)

(declare-fun mapDefault!27308 () ValueCell!8130)

(assert (=> b!871675 (= condMapEmpty!27308 (= (arr!24239 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8130)) mapDefault!27308)))))

(declare-fun res!592505 () Bool)

(declare-fun e!485321 () Bool)

(assert (=> start!74088 (=> (not res!592505) (not e!485321))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50418 0))(
  ( (array!50419 (arr!24240 (Array (_ BitVec 32) (_ BitVec 64))) (size!24680 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50418)

(assert (=> start!74088 (= res!592505 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24680 _keys!868))))))

(assert (=> start!74088 e!485321))

(declare-fun tp_is_empty!17139 () Bool)

(assert (=> start!74088 tp_is_empty!17139))

(assert (=> start!74088 true))

(assert (=> start!74088 tp!52503))

(declare-fun array_inv!19140 (array!50418) Bool)

(assert (=> start!74088 (array_inv!19140 _keys!868)))

(declare-fun array_inv!19141 (array!50416) Bool)

(assert (=> start!74088 (and (array_inv!19141 _values!688) e!485323)))

(declare-fun b!871676 () Bool)

(assert (=> b!871676 (= e!485322 tp_is_empty!17139)))

(declare-fun b!871677 () Bool)

(declare-fun res!592510 () Bool)

(assert (=> b!871677 (=> (not res!592510) (not e!485321))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871677 (= res!592510 (validMask!0 mask!1196))))

(declare-fun b!871678 () Bool)

(declare-fun res!592508 () Bool)

(assert (=> b!871678 (=> (not res!592508) (not e!485321))))

(declare-datatypes ((List!17238 0))(
  ( (Nil!17235) (Cons!17234 (h!18365 (_ BitVec 64)) (t!24275 List!17238)) )
))
(declare-fun arrayNoDuplicates!0 (array!50418 (_ BitVec 32) List!17238) Bool)

(assert (=> b!871678 (= res!592508 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17235))))

(declare-fun mapIsEmpty!27308 () Bool)

(assert (=> mapIsEmpty!27308 mapRes!27308))

(declare-fun b!871679 () Bool)

(declare-fun res!592507 () Bool)

(assert (=> b!871679 (=> (not res!592507) (not e!485321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50418 (_ BitVec 32)) Bool)

(assert (=> b!871679 (= res!592507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871680 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871680 (= e!485321 (and (not (= from!1053 i!612)) (bvsge from!1053 i!612)))))

(declare-fun v!557 () V!27899)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11450 0))(
  ( (tuple2!11451 (_1!5736 (_ BitVec 64)) (_2!5736 V!27899)) )
))
(declare-datatypes ((List!17239 0))(
  ( (Nil!17236) (Cons!17235 (h!18366 tuple2!11450) (t!24276 List!17239)) )
))
(declare-datatypes ((ListLongMap!10219 0))(
  ( (ListLongMap!10220 (toList!5125 List!17239)) )
))
(declare-fun lt!395520 () ListLongMap!10219)

(declare-fun minValue!654 () V!27899)

(declare-fun zeroValue!654 () V!27899)

(declare-fun getCurrentListMapNoExtraKeys!3094 (array!50418 array!50416 (_ BitVec 32) (_ BitVec 32) V!27899 V!27899 (_ BitVec 32) Int) ListLongMap!10219)

(assert (=> b!871680 (= lt!395520 (getCurrentListMapNoExtraKeys!3094 _keys!868 (array!50417 (store (arr!24239 _values!688) i!612 (ValueCellFull!8130 v!557)) (size!24679 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395521 () ListLongMap!10219)

(assert (=> b!871680 (= lt!395521 (getCurrentListMapNoExtraKeys!3094 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871681 () Bool)

(declare-fun res!592504 () Bool)

(assert (=> b!871681 (=> (not res!592504) (not e!485321))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871681 (= res!592504 (validKeyInArray!0 k0!854))))

(declare-fun b!871682 () Bool)

(declare-fun res!592511 () Bool)

(assert (=> b!871682 (=> (not res!592511) (not e!485321))))

(assert (=> b!871682 (= res!592511 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24680 _keys!868))))))

(declare-fun b!871683 () Bool)

(declare-fun e!485320 () Bool)

(assert (=> b!871683 (= e!485320 tp_is_empty!17139)))

(declare-fun b!871684 () Bool)

(declare-fun res!592506 () Bool)

(assert (=> b!871684 (=> (not res!592506) (not e!485321))))

(assert (=> b!871684 (= res!592506 (and (= (select (arr!24240 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871685 () Bool)

(declare-fun res!592509 () Bool)

(assert (=> b!871685 (=> (not res!592509) (not e!485321))))

(assert (=> b!871685 (= res!592509 (and (= (size!24679 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24680 _keys!868) (size!24679 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27308 () Bool)

(declare-fun tp!52504 () Bool)

(assert (=> mapNonEmpty!27308 (= mapRes!27308 (and tp!52504 e!485320))))

(declare-fun mapKey!27308 () (_ BitVec 32))

(declare-fun mapRest!27308 () (Array (_ BitVec 32) ValueCell!8130))

(declare-fun mapValue!27308 () ValueCell!8130)

(assert (=> mapNonEmpty!27308 (= (arr!24239 _values!688) (store mapRest!27308 mapKey!27308 mapValue!27308))))

(assert (= (and start!74088 res!592505) b!871677))

(assert (= (and b!871677 res!592510) b!871685))

(assert (= (and b!871685 res!592509) b!871679))

(assert (= (and b!871679 res!592507) b!871678))

(assert (= (and b!871678 res!592508) b!871682))

(assert (= (and b!871682 res!592511) b!871681))

(assert (= (and b!871681 res!592504) b!871684))

(assert (= (and b!871684 res!592506) b!871680))

(assert (= (and b!871675 condMapEmpty!27308) mapIsEmpty!27308))

(assert (= (and b!871675 (not condMapEmpty!27308)) mapNonEmpty!27308))

(get-info :version)

(assert (= (and mapNonEmpty!27308 ((_ is ValueCellFull!8130) mapValue!27308)) b!871683))

(assert (= (and b!871675 ((_ is ValueCellFull!8130) mapDefault!27308)) b!871676))

(assert (= start!74088 b!871675))

(declare-fun m!812817 () Bool)

(assert (=> mapNonEmpty!27308 m!812817))

(declare-fun m!812819 () Bool)

(assert (=> start!74088 m!812819))

(declare-fun m!812821 () Bool)

(assert (=> start!74088 m!812821))

(declare-fun m!812823 () Bool)

(assert (=> b!871681 m!812823))

(declare-fun m!812825 () Bool)

(assert (=> b!871684 m!812825))

(declare-fun m!812827 () Bool)

(assert (=> b!871680 m!812827))

(declare-fun m!812829 () Bool)

(assert (=> b!871680 m!812829))

(declare-fun m!812831 () Bool)

(assert (=> b!871680 m!812831))

(declare-fun m!812833 () Bool)

(assert (=> b!871678 m!812833))

(declare-fun m!812835 () Bool)

(assert (=> b!871679 m!812835))

(declare-fun m!812837 () Bool)

(assert (=> b!871677 m!812837))

(check-sat (not b!871679) (not start!74088) (not b!871680) b_and!24749 (not b_next!14997) (not b!871678) tp_is_empty!17139 (not b!871677) (not b!871681) (not mapNonEmpty!27308))
(check-sat b_and!24749 (not b_next!14997))
