; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74268 () Bool)

(assert start!74268)

(declare-fun b_free!15049 () Bool)

(declare-fun b_next!15049 () Bool)

(assert (=> start!74268 (= b_free!15049 (not b_next!15049))))

(declare-fun tp!52822 () Bool)

(declare-fun b_and!24799 () Bool)

(assert (=> start!74268 (= tp!52822 b_and!24799)))

(declare-fun res!593809 () Bool)

(declare-fun e!486516 () Bool)

(assert (=> start!74268 (=> (not res!593809) (not e!486516))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50699 0))(
  ( (array!50700 (arr!24378 (Array (_ BitVec 32) (_ BitVec 64))) (size!24820 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50699)

(assert (=> start!74268 (= res!593809 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24820 _keys!868))))))

(assert (=> start!74268 e!486516))

(declare-fun tp_is_empty!17293 () Bool)

(assert (=> start!74268 tp_is_empty!17293))

(assert (=> start!74268 true))

(assert (=> start!74268 tp!52822))

(declare-fun array_inv!19282 (array!50699) Bool)

(assert (=> start!74268 (array_inv!19282 _keys!868)))

(declare-datatypes ((V!28105 0))(
  ( (V!28106 (val!8694 Int)) )
))
(declare-datatypes ((ValueCell!8207 0))(
  ( (ValueCellFull!8207 (v!11117 V!28105)) (EmptyCell!8207) )
))
(declare-datatypes ((array!50701 0))(
  ( (array!50702 (arr!24379 (Array (_ BitVec 32) ValueCell!8207)) (size!24821 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50701)

(declare-fun e!486513 () Bool)

(declare-fun array_inv!19283 (array!50701) Bool)

(assert (=> start!74268 (and (array_inv!19283 _values!688) e!486513)))

(declare-fun b!873744 () Bool)

(declare-fun res!593807 () Bool)

(assert (=> b!873744 (=> (not res!593807) (not e!486516))))

(declare-datatypes ((List!17311 0))(
  ( (Nil!17308) (Cons!17307 (h!18438 (_ BitVec 64)) (t!24343 List!17311)) )
))
(declare-fun arrayNoDuplicates!0 (array!50699 (_ BitVec 32) List!17311) Bool)

(assert (=> b!873744 (= res!593807 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17308))))

(declare-fun mapIsEmpty!27548 () Bool)

(declare-fun mapRes!27548 () Bool)

(assert (=> mapIsEmpty!27548 mapRes!27548))

(declare-fun b!873745 () Bool)

(declare-fun e!486517 () Bool)

(assert (=> b!873745 (= e!486513 (and e!486517 mapRes!27548))))

(declare-fun condMapEmpty!27548 () Bool)

(declare-fun mapDefault!27548 () ValueCell!8207)

(assert (=> b!873745 (= condMapEmpty!27548 (= (arr!24379 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8207)) mapDefault!27548)))))

(declare-fun b!873746 () Bool)

(declare-fun e!486514 () Bool)

(assert (=> b!873746 (= e!486514 tp_is_empty!17293)))

(declare-fun b!873747 () Bool)

(declare-fun res!593812 () Bool)

(assert (=> b!873747 (=> (not res!593812) (not e!486516))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!873747 (= res!593812 (and (= (size!24821 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24820 _keys!868) (size!24821 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873748 () Bool)

(declare-fun res!593810 () Bool)

(assert (=> b!873748 (=> (not res!593810) (not e!486516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50699 (_ BitVec 32)) Bool)

(assert (=> b!873748 (= res!593810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873749 () Bool)

(declare-fun res!593806 () Bool)

(assert (=> b!873749 (=> (not res!593806) (not e!486516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873749 (= res!593806 (validMask!0 mask!1196))))

(declare-fun b!873750 () Bool)

(assert (=> b!873750 (= e!486517 tp_is_empty!17293)))

(declare-fun b!873751 () Bool)

(declare-fun res!593805 () Bool)

(assert (=> b!873751 (=> (not res!593805) (not e!486516))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!873751 (= res!593805 (and (= (select (arr!24378 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873752 () Bool)

(declare-fun res!593811 () Bool)

(assert (=> b!873752 (=> (not res!593811) (not e!486516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873752 (= res!593811 (validKeyInArray!0 k0!854))))

(declare-fun b!873753 () Bool)

(assert (=> b!873753 (= e!486516 false)))

(declare-datatypes ((tuple2!11500 0))(
  ( (tuple2!11501 (_1!5761 (_ BitVec 64)) (_2!5761 V!28105)) )
))
(declare-datatypes ((List!17312 0))(
  ( (Nil!17309) (Cons!17308 (h!18439 tuple2!11500) (t!24344 List!17312)) )
))
(declare-datatypes ((ListLongMap!10259 0))(
  ( (ListLongMap!10260 (toList!5145 List!17312)) )
))
(declare-fun lt!395625 () ListLongMap!10259)

(declare-fun v!557 () V!28105)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28105)

(declare-fun zeroValue!654 () V!28105)

(declare-fun getCurrentListMapNoExtraKeys!3138 (array!50699 array!50701 (_ BitVec 32) (_ BitVec 32) V!28105 V!28105 (_ BitVec 32) Int) ListLongMap!10259)

(assert (=> b!873753 (= lt!395625 (getCurrentListMapNoExtraKeys!3138 _keys!868 (array!50702 (store (arr!24379 _values!688) i!612 (ValueCellFull!8207 v!557)) (size!24821 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395624 () ListLongMap!10259)

(assert (=> b!873753 (= lt!395624 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873754 () Bool)

(declare-fun res!593808 () Bool)

(assert (=> b!873754 (=> (not res!593808) (not e!486516))))

(assert (=> b!873754 (= res!593808 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24820 _keys!868))))))

(declare-fun mapNonEmpty!27548 () Bool)

(declare-fun tp!52823 () Bool)

(assert (=> mapNonEmpty!27548 (= mapRes!27548 (and tp!52823 e!486514))))

(declare-fun mapKey!27548 () (_ BitVec 32))

(declare-fun mapRest!27548 () (Array (_ BitVec 32) ValueCell!8207))

(declare-fun mapValue!27548 () ValueCell!8207)

(assert (=> mapNonEmpty!27548 (= (arr!24379 _values!688) (store mapRest!27548 mapKey!27548 mapValue!27548))))

(assert (= (and start!74268 res!593809) b!873749))

(assert (= (and b!873749 res!593806) b!873747))

(assert (= (and b!873747 res!593812) b!873748))

(assert (= (and b!873748 res!593810) b!873744))

(assert (= (and b!873744 res!593807) b!873754))

(assert (= (and b!873754 res!593808) b!873752))

(assert (= (and b!873752 res!593811) b!873751))

(assert (= (and b!873751 res!593805) b!873753))

(assert (= (and b!873745 condMapEmpty!27548) mapIsEmpty!27548))

(assert (= (and b!873745 (not condMapEmpty!27548)) mapNonEmpty!27548))

(get-info :version)

(assert (= (and mapNonEmpty!27548 ((_ is ValueCellFull!8207) mapValue!27548)) b!873746))

(assert (= (and b!873745 ((_ is ValueCellFull!8207) mapDefault!27548)) b!873750))

(assert (= start!74268 b!873745))

(declare-fun m!813545 () Bool)

(assert (=> b!873749 m!813545))

(declare-fun m!813547 () Bool)

(assert (=> b!873751 m!813547))

(declare-fun m!813549 () Bool)

(assert (=> start!74268 m!813549))

(declare-fun m!813551 () Bool)

(assert (=> start!74268 m!813551))

(declare-fun m!813553 () Bool)

(assert (=> b!873753 m!813553))

(declare-fun m!813555 () Bool)

(assert (=> b!873753 m!813555))

(declare-fun m!813557 () Bool)

(assert (=> b!873753 m!813557))

(declare-fun m!813559 () Bool)

(assert (=> b!873752 m!813559))

(declare-fun m!813561 () Bool)

(assert (=> mapNonEmpty!27548 m!813561))

(declare-fun m!813563 () Bool)

(assert (=> b!873744 m!813563))

(declare-fun m!813565 () Bool)

(assert (=> b!873748 m!813565))

(check-sat (not b!873748) (not b!873744) (not b_next!15049) b_and!24799 (not b!873752) (not b!873749) (not mapNonEmpty!27548) (not start!74268) (not b!873753) tp_is_empty!17293)
(check-sat b_and!24799 (not b_next!15049))
