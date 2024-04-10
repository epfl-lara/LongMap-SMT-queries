; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74136 () Bool)

(assert start!74136)

(declare-fun mapIsEmpty!27365 () Bool)

(declare-fun mapRes!27365 () Bool)

(assert (=> mapIsEmpty!27365 mapRes!27365))

(declare-fun b!872131 () Bool)

(declare-fun res!592781 () Bool)

(declare-fun e!485618 () Bool)

(assert (=> b!872131 (=> (not res!592781) (not e!485618))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50484 0))(
  ( (array!50485 (arr!24272 (Array (_ BitVec 32) (_ BitVec 64))) (size!24712 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50484)

(declare-datatypes ((V!27947 0))(
  ( (V!27948 (val!8635 Int)) )
))
(declare-datatypes ((ValueCell!8148 0))(
  ( (ValueCellFull!8148 (v!11060 V!27947)) (EmptyCell!8148) )
))
(declare-datatypes ((array!50486 0))(
  ( (array!50487 (arr!24273 (Array (_ BitVec 32) ValueCell!8148)) (size!24713 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50486)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872131 (= res!592781 (and (= (size!24713 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24712 _keys!868) (size!24713 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872132 () Bool)

(assert (=> b!872132 (= e!485618 false)))

(declare-fun lt!395578 () Bool)

(declare-datatypes ((List!17253 0))(
  ( (Nil!17250) (Cons!17249 (h!18380 (_ BitVec 64)) (t!24290 List!17253)) )
))
(declare-fun arrayNoDuplicates!0 (array!50484 (_ BitVec 32) List!17253) Bool)

(assert (=> b!872132 (= lt!395578 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17250))))

(declare-fun b!872133 () Bool)

(declare-fun res!592779 () Bool)

(assert (=> b!872133 (=> (not res!592779) (not e!485618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50484 (_ BitVec 32)) Bool)

(assert (=> b!872133 (= res!592779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27365 () Bool)

(declare-fun tp!52564 () Bool)

(declare-fun e!485619 () Bool)

(assert (=> mapNonEmpty!27365 (= mapRes!27365 (and tp!52564 e!485619))))

(declare-fun mapRest!27365 () (Array (_ BitVec 32) ValueCell!8148))

(declare-fun mapValue!27365 () ValueCell!8148)

(declare-fun mapKey!27365 () (_ BitVec 32))

(assert (=> mapNonEmpty!27365 (= (arr!24273 _values!688) (store mapRest!27365 mapKey!27365 mapValue!27365))))

(declare-fun b!872134 () Bool)

(declare-fun e!485620 () Bool)

(declare-fun tp_is_empty!17175 () Bool)

(assert (=> b!872134 (= e!485620 tp_is_empty!17175)))

(declare-fun b!872135 () Bool)

(declare-fun res!592778 () Bool)

(assert (=> b!872135 (=> (not res!592778) (not e!485618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872135 (= res!592778 (validMask!0 mask!1196))))

(declare-fun b!872136 () Bool)

(assert (=> b!872136 (= e!485619 tp_is_empty!17175)))

(declare-fun res!592780 () Bool)

(assert (=> start!74136 (=> (not res!592780) (not e!485618))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74136 (= res!592780 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24712 _keys!868))))))

(assert (=> start!74136 e!485618))

(assert (=> start!74136 true))

(declare-fun array_inv!19164 (array!50484) Bool)

(assert (=> start!74136 (array_inv!19164 _keys!868)))

(declare-fun e!485616 () Bool)

(declare-fun array_inv!19165 (array!50486) Bool)

(assert (=> start!74136 (and (array_inv!19165 _values!688) e!485616)))

(declare-fun b!872137 () Bool)

(assert (=> b!872137 (= e!485616 (and e!485620 mapRes!27365))))

(declare-fun condMapEmpty!27365 () Bool)

(declare-fun mapDefault!27365 () ValueCell!8148)

(assert (=> b!872137 (= condMapEmpty!27365 (= (arr!24273 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8148)) mapDefault!27365)))))

(assert (= (and start!74136 res!592780) b!872135))

(assert (= (and b!872135 res!592778) b!872131))

(assert (= (and b!872131 res!592781) b!872133))

(assert (= (and b!872133 res!592779) b!872132))

(assert (= (and b!872137 condMapEmpty!27365) mapIsEmpty!27365))

(assert (= (and b!872137 (not condMapEmpty!27365)) mapNonEmpty!27365))

(get-info :version)

(assert (= (and mapNonEmpty!27365 ((_ is ValueCellFull!8148) mapValue!27365)) b!872136))

(assert (= (and b!872137 ((_ is ValueCellFull!8148) mapDefault!27365)) b!872134))

(assert (= start!74136 b!872137))

(declare-fun m!813083 () Bool)

(assert (=> b!872135 m!813083))

(declare-fun m!813085 () Bool)

(assert (=> start!74136 m!813085))

(declare-fun m!813087 () Bool)

(assert (=> start!74136 m!813087))

(declare-fun m!813089 () Bool)

(assert (=> b!872132 m!813089))

(declare-fun m!813091 () Bool)

(assert (=> b!872133 m!813091))

(declare-fun m!813093 () Bool)

(assert (=> mapNonEmpty!27365 m!813093))

(check-sat (not b!872133) (not mapNonEmpty!27365) (not b!872132) (not start!74136) (not b!872135) tp_is_empty!17175)
(check-sat)
