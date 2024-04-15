; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74056 () Bool)

(assert start!74056)

(declare-fun b!871206 () Bool)

(declare-fun res!592248 () Bool)

(declare-fun e!485050 () Bool)

(assert (=> b!871206 (=> (not res!592248) (not e!485050))))

(declare-datatypes ((array!50377 0))(
  ( (array!50378 (arr!24220 (Array (_ BitVec 32) (_ BitVec 64))) (size!24662 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50377)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50377 (_ BitVec 32)) Bool)

(assert (=> b!871206 (= res!592248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27287 () Bool)

(declare-fun mapRes!27287 () Bool)

(assert (=> mapIsEmpty!27287 mapRes!27287))

(declare-fun mapNonEmpty!27287 () Bool)

(declare-fun tp!52469 () Bool)

(declare-fun e!485052 () Bool)

(assert (=> mapNonEmpty!27287 (= mapRes!27287 (and tp!52469 e!485052))))

(declare-fun mapKey!27287 () (_ BitVec 32))

(declare-datatypes ((V!27881 0))(
  ( (V!27882 (val!8610 Int)) )
))
(declare-datatypes ((ValueCell!8123 0))(
  ( (ValueCellFull!8123 (v!11029 V!27881)) (EmptyCell!8123) )
))
(declare-fun mapValue!27287 () ValueCell!8123)

(declare-fun mapRest!27287 () (Array (_ BitVec 32) ValueCell!8123))

(declare-datatypes ((array!50379 0))(
  ( (array!50380 (arr!24221 (Array (_ BitVec 32) ValueCell!8123)) (size!24663 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50379)

(assert (=> mapNonEmpty!27287 (= (arr!24221 _values!688) (store mapRest!27287 mapKey!27287 mapValue!27287))))

(declare-fun b!871208 () Bool)

(declare-fun res!592246 () Bool)

(assert (=> b!871208 (=> (not res!592246) (not e!485050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871208 (= res!592246 (validMask!0 mask!1196))))

(declare-fun b!871209 () Bool)

(declare-fun tp_is_empty!17125 () Bool)

(assert (=> b!871209 (= e!485052 tp_is_empty!17125)))

(declare-fun b!871210 () Bool)

(assert (=> b!871210 (= e!485050 false)))

(declare-fun lt!395231 () Bool)

(declare-datatypes ((List!17238 0))(
  ( (Nil!17235) (Cons!17234 (h!18365 (_ BitVec 64)) (t!24266 List!17238)) )
))
(declare-fun arrayNoDuplicates!0 (array!50377 (_ BitVec 32) List!17238) Bool)

(assert (=> b!871210 (= lt!395231 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17235))))

(declare-fun b!871211 () Bool)

(declare-fun res!592245 () Bool)

(assert (=> b!871211 (=> (not res!592245) (not e!485050))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871211 (= res!592245 (and (= (size!24663 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24662 _keys!868) (size!24663 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871212 () Bool)

(declare-fun e!485051 () Bool)

(declare-fun e!485048 () Bool)

(assert (=> b!871212 (= e!485051 (and e!485048 mapRes!27287))))

(declare-fun condMapEmpty!27287 () Bool)

(declare-fun mapDefault!27287 () ValueCell!8123)

(assert (=> b!871212 (= condMapEmpty!27287 (= (arr!24221 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8123)) mapDefault!27287)))))

(declare-fun b!871207 () Bool)

(assert (=> b!871207 (= e!485048 tp_is_empty!17125)))

(declare-fun res!592247 () Bool)

(assert (=> start!74056 (=> (not res!592247) (not e!485050))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74056 (= res!592247 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24662 _keys!868))))))

(assert (=> start!74056 e!485050))

(assert (=> start!74056 true))

(declare-fun array_inv!19184 (array!50377) Bool)

(assert (=> start!74056 (array_inv!19184 _keys!868)))

(declare-fun array_inv!19185 (array!50379) Bool)

(assert (=> start!74056 (and (array_inv!19185 _values!688) e!485051)))

(assert (= (and start!74056 res!592247) b!871208))

(assert (= (and b!871208 res!592246) b!871211))

(assert (= (and b!871211 res!592245) b!871206))

(assert (= (and b!871206 res!592248) b!871210))

(assert (= (and b!871212 condMapEmpty!27287) mapIsEmpty!27287))

(assert (= (and b!871212 (not condMapEmpty!27287)) mapNonEmpty!27287))

(get-info :version)

(assert (= (and mapNonEmpty!27287 ((_ is ValueCellFull!8123) mapValue!27287)) b!871209))

(assert (= (and b!871212 ((_ is ValueCellFull!8123) mapDefault!27287)) b!871207))

(assert (= start!74056 b!871212))

(declare-fun m!811899 () Bool)

(assert (=> b!871208 m!811899))

(declare-fun m!811901 () Bool)

(assert (=> mapNonEmpty!27287 m!811901))

(declare-fun m!811903 () Bool)

(assert (=> b!871206 m!811903))

(declare-fun m!811905 () Bool)

(assert (=> b!871210 m!811905))

(declare-fun m!811907 () Bool)

(assert (=> start!74056 m!811907))

(declare-fun m!811909 () Bool)

(assert (=> start!74056 m!811909))

(check-sat (not b!871206) (not mapNonEmpty!27287) tp_is_empty!17125 (not b!871208) (not start!74056) (not b!871210))
(check-sat)
