; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74262 () Bool)

(assert start!74262)

(declare-fun b_free!15043 () Bool)

(declare-fun b_next!15043 () Bool)

(assert (=> start!74262 (= b_free!15043 (not b_next!15043))))

(declare-fun tp!52805 () Bool)

(declare-fun b_and!24793 () Bool)

(assert (=> start!74262 (= tp!52805 b_and!24793)))

(declare-fun res!593736 () Bool)

(declare-fun e!486469 () Bool)

(assert (=> start!74262 (=> (not res!593736) (not e!486469))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50687 0))(
  ( (array!50688 (arr!24372 (Array (_ BitVec 32) (_ BitVec 64))) (size!24814 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50687)

(assert (=> start!74262 (= res!593736 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24814 _keys!868))))))

(assert (=> start!74262 e!486469))

(declare-fun tp_is_empty!17287 () Bool)

(assert (=> start!74262 tp_is_empty!17287))

(assert (=> start!74262 true))

(assert (=> start!74262 tp!52805))

(declare-fun array_inv!19280 (array!50687) Bool)

(assert (=> start!74262 (array_inv!19280 _keys!868)))

(declare-datatypes ((V!28097 0))(
  ( (V!28098 (val!8691 Int)) )
))
(declare-datatypes ((ValueCell!8204 0))(
  ( (ValueCellFull!8204 (v!11114 V!28097)) (EmptyCell!8204) )
))
(declare-datatypes ((array!50689 0))(
  ( (array!50690 (arr!24373 (Array (_ BitVec 32) ValueCell!8204)) (size!24815 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50689)

(declare-fun e!486468 () Bool)

(declare-fun array_inv!19281 (array!50689) Bool)

(assert (=> start!74262 (and (array_inv!19281 _values!688) e!486468)))

(declare-fun b!873645 () Bool)

(declare-fun res!593738 () Bool)

(assert (=> b!873645 (=> (not res!593738) (not e!486469))))

(declare-datatypes ((List!17308 0))(
  ( (Nil!17305) (Cons!17304 (h!18435 (_ BitVec 64)) (t!24340 List!17308)) )
))
(declare-fun arrayNoDuplicates!0 (array!50687 (_ BitVec 32) List!17308) Bool)

(assert (=> b!873645 (= res!593738 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17305))))

(declare-fun b!873646 () Bool)

(declare-fun e!486471 () Bool)

(declare-fun mapRes!27539 () Bool)

(assert (=> b!873646 (= e!486468 (and e!486471 mapRes!27539))))

(declare-fun condMapEmpty!27539 () Bool)

(declare-fun mapDefault!27539 () ValueCell!8204)

(assert (=> b!873646 (= condMapEmpty!27539 (= (arr!24373 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8204)) mapDefault!27539)))))

(declare-fun b!873647 () Bool)

(declare-fun res!593734 () Bool)

(assert (=> b!873647 (=> (not res!593734) (not e!486469))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873647 (= res!593734 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27539 () Bool)

(declare-fun tp!52804 () Bool)

(declare-fun e!486472 () Bool)

(assert (=> mapNonEmpty!27539 (= mapRes!27539 (and tp!52804 e!486472))))

(declare-fun mapKey!27539 () (_ BitVec 32))

(declare-fun mapValue!27539 () ValueCell!8204)

(declare-fun mapRest!27539 () (Array (_ BitVec 32) ValueCell!8204))

(assert (=> mapNonEmpty!27539 (= (arr!24373 _values!688) (store mapRest!27539 mapKey!27539 mapValue!27539))))

(declare-fun b!873648 () Bool)

(declare-fun res!593733 () Bool)

(assert (=> b!873648 (=> (not res!593733) (not e!486469))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873648 (= res!593733 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24814 _keys!868))))))

(declare-fun b!873649 () Bool)

(assert (=> b!873649 (= e!486472 tp_is_empty!17287)))

(declare-fun b!873650 () Bool)

(declare-fun res!593737 () Bool)

(assert (=> b!873650 (=> (not res!593737) (not e!486469))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873650 (= res!593737 (and (= (size!24815 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24814 _keys!868) (size!24815 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873651 () Bool)

(assert (=> b!873651 (= e!486469 false)))

(declare-fun v!557 () V!28097)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28097)

(declare-fun zeroValue!654 () V!28097)

(declare-datatypes ((tuple2!11496 0))(
  ( (tuple2!11497 (_1!5759 (_ BitVec 64)) (_2!5759 V!28097)) )
))
(declare-datatypes ((List!17309 0))(
  ( (Nil!17306) (Cons!17305 (h!18436 tuple2!11496) (t!24341 List!17309)) )
))
(declare-datatypes ((ListLongMap!10255 0))(
  ( (ListLongMap!10256 (toList!5143 List!17309)) )
))
(declare-fun lt!395607 () ListLongMap!10255)

(declare-fun getCurrentListMapNoExtraKeys!3136 (array!50687 array!50689 (_ BitVec 32) (_ BitVec 32) V!28097 V!28097 (_ BitVec 32) Int) ListLongMap!10255)

(assert (=> b!873651 (= lt!395607 (getCurrentListMapNoExtraKeys!3136 _keys!868 (array!50690 (store (arr!24373 _values!688) i!612 (ValueCellFull!8204 v!557)) (size!24815 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395606 () ListLongMap!10255)

(assert (=> b!873651 (= lt!395606 (getCurrentListMapNoExtraKeys!3136 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873652 () Bool)

(declare-fun res!593735 () Bool)

(assert (=> b!873652 (=> (not res!593735) (not e!486469))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873652 (= res!593735 (validKeyInArray!0 k0!854))))

(declare-fun b!873653 () Bool)

(declare-fun res!593739 () Bool)

(assert (=> b!873653 (=> (not res!593739) (not e!486469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50687 (_ BitVec 32)) Bool)

(assert (=> b!873653 (= res!593739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27539 () Bool)

(assert (=> mapIsEmpty!27539 mapRes!27539))

(declare-fun b!873654 () Bool)

(declare-fun res!593740 () Bool)

(assert (=> b!873654 (=> (not res!593740) (not e!486469))))

(assert (=> b!873654 (= res!593740 (and (= (select (arr!24372 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873655 () Bool)

(assert (=> b!873655 (= e!486471 tp_is_empty!17287)))

(assert (= (and start!74262 res!593736) b!873647))

(assert (= (and b!873647 res!593734) b!873650))

(assert (= (and b!873650 res!593737) b!873653))

(assert (= (and b!873653 res!593739) b!873645))

(assert (= (and b!873645 res!593738) b!873648))

(assert (= (and b!873648 res!593733) b!873652))

(assert (= (and b!873652 res!593735) b!873654))

(assert (= (and b!873654 res!593740) b!873651))

(assert (= (and b!873646 condMapEmpty!27539) mapIsEmpty!27539))

(assert (= (and b!873646 (not condMapEmpty!27539)) mapNonEmpty!27539))

(get-info :version)

(assert (= (and mapNonEmpty!27539 ((_ is ValueCellFull!8204) mapValue!27539)) b!873649))

(assert (= (and b!873646 ((_ is ValueCellFull!8204) mapDefault!27539)) b!873655))

(assert (= start!74262 b!873646))

(declare-fun m!813479 () Bool)

(assert (=> mapNonEmpty!27539 m!813479))

(declare-fun m!813481 () Bool)

(assert (=> b!873652 m!813481))

(declare-fun m!813483 () Bool)

(assert (=> b!873645 m!813483))

(declare-fun m!813485 () Bool)

(assert (=> start!74262 m!813485))

(declare-fun m!813487 () Bool)

(assert (=> start!74262 m!813487))

(declare-fun m!813489 () Bool)

(assert (=> b!873653 m!813489))

(declare-fun m!813491 () Bool)

(assert (=> b!873651 m!813491))

(declare-fun m!813493 () Bool)

(assert (=> b!873651 m!813493))

(declare-fun m!813495 () Bool)

(assert (=> b!873651 m!813495))

(declare-fun m!813497 () Bool)

(assert (=> b!873647 m!813497))

(declare-fun m!813499 () Bool)

(assert (=> b!873654 m!813499))

(check-sat (not b!873645) tp_is_empty!17287 (not start!74262) (not b!873652) b_and!24793 (not b!873651) (not b!873653) (not b!873647) (not b_next!15043) (not mapNonEmpty!27539))
(check-sat b_and!24793 (not b_next!15043))
