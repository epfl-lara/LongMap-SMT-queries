; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74242 () Bool)

(assert start!74242)

(declare-fun b!872348 () Bool)

(declare-fun e!485781 () Bool)

(assert (=> b!872348 (= e!485781 false)))

(declare-fun lt!395828 () Bool)

(declare-datatypes ((array!50447 0))(
  ( (array!50448 (arr!24250 (Array (_ BitVec 32) (_ BitVec 64))) (size!24691 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50447)

(declare-datatypes ((List!17189 0))(
  ( (Nil!17186) (Cons!17185 (h!18322 (_ BitVec 64)) (t!24218 List!17189)) )
))
(declare-fun arrayNoDuplicates!0 (array!50447 (_ BitVec 32) List!17189) Bool)

(assert (=> b!872348 (= lt!395828 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17186))))

(declare-fun b!872349 () Bool)

(declare-fun e!485778 () Bool)

(declare-fun tp_is_empty!17125 () Bool)

(assert (=> b!872349 (= e!485778 tp_is_empty!17125)))

(declare-fun b!872350 () Bool)

(declare-fun e!485779 () Bool)

(assert (=> b!872350 (= e!485779 tp_is_empty!17125)))

(declare-fun b!872351 () Bool)

(declare-fun res!592700 () Bool)

(assert (=> b!872351 (=> (not res!592700) (not e!485781))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872351 (= res!592700 (validMask!0 mask!1196))))

(declare-fun b!872352 () Bool)

(declare-fun res!592702 () Bool)

(assert (=> b!872352 (=> (not res!592702) (not e!485781))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27881 0))(
  ( (V!27882 (val!8610 Int)) )
))
(declare-datatypes ((ValueCell!8123 0))(
  ( (ValueCellFull!8123 (v!11035 V!27881)) (EmptyCell!8123) )
))
(declare-datatypes ((array!50449 0))(
  ( (array!50450 (arr!24251 (Array (_ BitVec 32) ValueCell!8123)) (size!24692 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50449)

(assert (=> b!872352 (= res!592702 (and (= (size!24692 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24691 _keys!868) (size!24692 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872353 () Bool)

(declare-fun res!592699 () Bool)

(assert (=> b!872353 (=> (not res!592699) (not e!485781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50447 (_ BitVec 32)) Bool)

(assert (=> b!872353 (= res!592699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27287 () Bool)

(declare-fun mapRes!27287 () Bool)

(assert (=> mapIsEmpty!27287 mapRes!27287))

(declare-fun mapNonEmpty!27287 () Bool)

(declare-fun tp!52469 () Bool)

(assert (=> mapNonEmpty!27287 (= mapRes!27287 (and tp!52469 e!485779))))

(declare-fun mapRest!27287 () (Array (_ BitVec 32) ValueCell!8123))

(declare-fun mapKey!27287 () (_ BitVec 32))

(declare-fun mapValue!27287 () ValueCell!8123)

(assert (=> mapNonEmpty!27287 (= (arr!24251 _values!688) (store mapRest!27287 mapKey!27287 mapValue!27287))))

(declare-fun b!872354 () Bool)

(declare-fun e!485780 () Bool)

(assert (=> b!872354 (= e!485780 (and e!485778 mapRes!27287))))

(declare-fun condMapEmpty!27287 () Bool)

(declare-fun mapDefault!27287 () ValueCell!8123)

(assert (=> b!872354 (= condMapEmpty!27287 (= (arr!24251 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8123)) mapDefault!27287)))))

(declare-fun res!592701 () Bool)

(assert (=> start!74242 (=> (not res!592701) (not e!485781))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74242 (= res!592701 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24691 _keys!868))))))

(assert (=> start!74242 e!485781))

(assert (=> start!74242 true))

(declare-fun array_inv!19202 (array!50447) Bool)

(assert (=> start!74242 (array_inv!19202 _keys!868)))

(declare-fun array_inv!19203 (array!50449) Bool)

(assert (=> start!74242 (and (array_inv!19203 _values!688) e!485780)))

(assert (= (and start!74242 res!592701) b!872351))

(assert (= (and b!872351 res!592700) b!872352))

(assert (= (and b!872352 res!592702) b!872353))

(assert (= (and b!872353 res!592699) b!872348))

(assert (= (and b!872354 condMapEmpty!27287) mapIsEmpty!27287))

(assert (= (and b!872354 (not condMapEmpty!27287)) mapNonEmpty!27287))

(get-info :version)

(assert (= (and mapNonEmpty!27287 ((_ is ValueCellFull!8123) mapValue!27287)) b!872350))

(assert (= (and b!872354 ((_ is ValueCellFull!8123) mapDefault!27287)) b!872349))

(assert (= start!74242 b!872354))

(declare-fun m!813947 () Bool)

(assert (=> b!872348 m!813947))

(declare-fun m!813949 () Bool)

(assert (=> b!872353 m!813949))

(declare-fun m!813951 () Bool)

(assert (=> b!872351 m!813951))

(declare-fun m!813953 () Bool)

(assert (=> start!74242 m!813953))

(declare-fun m!813955 () Bool)

(assert (=> start!74242 m!813955))

(declare-fun m!813957 () Bool)

(assert (=> mapNonEmpty!27287 m!813957))

(check-sat (not mapNonEmpty!27287) (not b!872353) (not b!872348) (not start!74242) (not b!872351) tp_is_empty!17125)
(check-sat)
