; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74164 () Bool)

(assert start!74164)

(declare-fun b!872375 () Bool)

(declare-fun res!592946 () Bool)

(declare-fun e!485817 () Bool)

(assert (=> b!872375 (=> (not res!592946) (not e!485817))))

(declare-datatypes ((array!50559 0))(
  ( (array!50560 (arr!24310 (Array (_ BitVec 32) (_ BitVec 64))) (size!24752 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50559)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50559 (_ BitVec 32)) Bool)

(assert (=> b!872375 (= res!592946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27434 () Bool)

(declare-fun mapRes!27434 () Bool)

(assert (=> mapIsEmpty!27434 mapRes!27434))

(declare-fun b!872376 () Bool)

(declare-fun res!592944 () Bool)

(assert (=> b!872376 (=> (not res!592944) (not e!485817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872376 (= res!592944 (validMask!0 mask!1196))))

(declare-fun b!872377 () Bool)

(declare-fun res!592947 () Bool)

(assert (=> b!872377 (=> (not res!592947) (not e!485817))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28009 0))(
  ( (V!28010 (val!8658 Int)) )
))
(declare-datatypes ((ValueCell!8171 0))(
  ( (ValueCellFull!8171 (v!11077 V!28009)) (EmptyCell!8171) )
))
(declare-datatypes ((array!50561 0))(
  ( (array!50562 (arr!24311 (Array (_ BitVec 32) ValueCell!8171)) (size!24753 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50561)

(assert (=> b!872377 (= res!592947 (and (= (size!24753 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24752 _keys!868) (size!24753 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27434 () Bool)

(declare-fun tp!52634 () Bool)

(declare-fun e!485814 () Bool)

(assert (=> mapNonEmpty!27434 (= mapRes!27434 (and tp!52634 e!485814))))

(declare-fun mapRest!27434 () (Array (_ BitVec 32) ValueCell!8171))

(declare-fun mapKey!27434 () (_ BitVec 32))

(declare-fun mapValue!27434 () ValueCell!8171)

(assert (=> mapNonEmpty!27434 (= (arr!24311 _values!688) (store mapRest!27434 mapKey!27434 mapValue!27434))))

(declare-fun b!872378 () Bool)

(declare-fun tp_is_empty!17221 () Bool)

(assert (=> b!872378 (= e!485814 tp_is_empty!17221)))

(declare-fun res!592945 () Bool)

(assert (=> start!74164 (=> (not res!592945) (not e!485817))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74164 (= res!592945 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24752 _keys!868))))))

(assert (=> start!74164 e!485817))

(assert (=> start!74164 true))

(declare-fun array_inv!19250 (array!50559) Bool)

(assert (=> start!74164 (array_inv!19250 _keys!868)))

(declare-fun e!485813 () Bool)

(declare-fun array_inv!19251 (array!50561) Bool)

(assert (=> start!74164 (and (array_inv!19251 _values!688) e!485813)))

(declare-fun b!872379 () Bool)

(declare-fun e!485816 () Bool)

(assert (=> b!872379 (= e!485813 (and e!485816 mapRes!27434))))

(declare-fun condMapEmpty!27434 () Bool)

(declare-fun mapDefault!27434 () ValueCell!8171)

(assert (=> b!872379 (= condMapEmpty!27434 (= (arr!24311 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8171)) mapDefault!27434)))))

(declare-fun b!872380 () Bool)

(assert (=> b!872380 (= e!485817 false)))

(declare-fun lt!395411 () Bool)

(declare-datatypes ((List!17273 0))(
  ( (Nil!17270) (Cons!17269 (h!18400 (_ BitVec 64)) (t!24301 List!17273)) )
))
(declare-fun arrayNoDuplicates!0 (array!50559 (_ BitVec 32) List!17273) Bool)

(assert (=> b!872380 (= lt!395411 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17270))))

(declare-fun b!872381 () Bool)

(assert (=> b!872381 (= e!485816 tp_is_empty!17221)))

(assert (= (and start!74164 res!592945) b!872376))

(assert (= (and b!872376 res!592944) b!872377))

(assert (= (and b!872377 res!592947) b!872375))

(assert (= (and b!872375 res!592946) b!872380))

(assert (= (and b!872379 condMapEmpty!27434) mapIsEmpty!27434))

(assert (= (and b!872379 (not condMapEmpty!27434)) mapNonEmpty!27434))

(get-info :version)

(assert (= (and mapNonEmpty!27434 ((_ is ValueCellFull!8171) mapValue!27434)) b!872378))

(assert (= (and b!872379 ((_ is ValueCellFull!8171) mapDefault!27434)) b!872381))

(assert (= start!74164 b!872379))

(declare-fun m!812601 () Bool)

(assert (=> mapNonEmpty!27434 m!812601))

(declare-fun m!812603 () Bool)

(assert (=> b!872376 m!812603))

(declare-fun m!812605 () Bool)

(assert (=> b!872375 m!812605))

(declare-fun m!812607 () Bool)

(assert (=> start!74164 m!812607))

(declare-fun m!812609 () Bool)

(assert (=> start!74164 m!812609))

(declare-fun m!812611 () Bool)

(assert (=> b!872380 m!812611))

(check-sat (not mapNonEmpty!27434) (not b!872380) (not b!872376) (not start!74164) tp_is_empty!17221 (not b!872375))
(check-sat)
