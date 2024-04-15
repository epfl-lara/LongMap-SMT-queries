; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74158 () Bool)

(assert start!74158)

(declare-fun b!872312 () Bool)

(declare-fun e!485768 () Bool)

(declare-fun tp_is_empty!17215 () Bool)

(assert (=> b!872312 (= e!485768 tp_is_empty!17215)))

(declare-fun b!872313 () Bool)

(declare-fun e!485769 () Bool)

(declare-fun e!485771 () Bool)

(declare-fun mapRes!27425 () Bool)

(assert (=> b!872313 (= e!485769 (and e!485771 mapRes!27425))))

(declare-fun condMapEmpty!27425 () Bool)

(declare-datatypes ((V!28001 0))(
  ( (V!28002 (val!8655 Int)) )
))
(declare-datatypes ((ValueCell!8168 0))(
  ( (ValueCellFull!8168 (v!11074 V!28001)) (EmptyCell!8168) )
))
(declare-datatypes ((array!50549 0))(
  ( (array!50550 (arr!24305 (Array (_ BitVec 32) ValueCell!8168)) (size!24747 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50549)

(declare-fun mapDefault!27425 () ValueCell!8168)

(assert (=> b!872313 (= condMapEmpty!27425 (= (arr!24305 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8168)) mapDefault!27425)))))

(declare-fun b!872314 () Bool)

(assert (=> b!872314 (= e!485771 tp_is_empty!17215)))

(declare-fun mapIsEmpty!27425 () Bool)

(assert (=> mapIsEmpty!27425 mapRes!27425))

(declare-fun b!872315 () Bool)

(declare-fun res!592909 () Bool)

(declare-fun e!485772 () Bool)

(assert (=> b!872315 (=> (not res!592909) (not e!485772))))

(declare-datatypes ((array!50551 0))(
  ( (array!50552 (arr!24306 (Array (_ BitVec 32) (_ BitVec 64))) (size!24748 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50551)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50551 (_ BitVec 32)) Bool)

(assert (=> b!872315 (= res!592909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592910 () Bool)

(assert (=> start!74158 (=> (not res!592910) (not e!485772))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74158 (= res!592910 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24748 _keys!868))))))

(assert (=> start!74158 e!485772))

(assert (=> start!74158 true))

(declare-fun array_inv!19246 (array!50551) Bool)

(assert (=> start!74158 (array_inv!19246 _keys!868)))

(declare-fun array_inv!19247 (array!50549) Bool)

(assert (=> start!74158 (and (array_inv!19247 _values!688) e!485769)))

(declare-fun b!872316 () Bool)

(declare-fun res!592911 () Bool)

(assert (=> b!872316 (=> (not res!592911) (not e!485772))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872316 (= res!592911 (and (= (size!24747 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24748 _keys!868) (size!24747 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872317 () Bool)

(assert (=> b!872317 (= e!485772 false)))

(declare-fun lt!395402 () Bool)

(declare-datatypes ((List!17272 0))(
  ( (Nil!17269) (Cons!17268 (h!18399 (_ BitVec 64)) (t!24300 List!17272)) )
))
(declare-fun arrayNoDuplicates!0 (array!50551 (_ BitVec 32) List!17272) Bool)

(assert (=> b!872317 (= lt!395402 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17269))))

(declare-fun mapNonEmpty!27425 () Bool)

(declare-fun tp!52625 () Bool)

(assert (=> mapNonEmpty!27425 (= mapRes!27425 (and tp!52625 e!485768))))

(declare-fun mapRest!27425 () (Array (_ BitVec 32) ValueCell!8168))

(declare-fun mapKey!27425 () (_ BitVec 32))

(declare-fun mapValue!27425 () ValueCell!8168)

(assert (=> mapNonEmpty!27425 (= (arr!24305 _values!688) (store mapRest!27425 mapKey!27425 mapValue!27425))))

(declare-fun b!872318 () Bool)

(declare-fun res!592908 () Bool)

(assert (=> b!872318 (=> (not res!592908) (not e!485772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872318 (= res!592908 (validMask!0 mask!1196))))

(assert (= (and start!74158 res!592910) b!872318))

(assert (= (and b!872318 res!592908) b!872316))

(assert (= (and b!872316 res!592911) b!872315))

(assert (= (and b!872315 res!592909) b!872317))

(assert (= (and b!872313 condMapEmpty!27425) mapIsEmpty!27425))

(assert (= (and b!872313 (not condMapEmpty!27425)) mapNonEmpty!27425))

(get-info :version)

(assert (= (and mapNonEmpty!27425 ((_ is ValueCellFull!8168) mapValue!27425)) b!872312))

(assert (= (and b!872313 ((_ is ValueCellFull!8168) mapDefault!27425)) b!872314))

(assert (= start!74158 b!872313))

(declare-fun m!812565 () Bool)

(assert (=> b!872317 m!812565))

(declare-fun m!812567 () Bool)

(assert (=> start!74158 m!812567))

(declare-fun m!812569 () Bool)

(assert (=> start!74158 m!812569))

(declare-fun m!812571 () Bool)

(assert (=> mapNonEmpty!27425 m!812571))

(declare-fun m!812573 () Bool)

(assert (=> b!872315 m!812573))

(declare-fun m!812575 () Bool)

(assert (=> b!872318 m!812575))

(check-sat (not b!872317) (not b!872318) (not start!74158) (not b!872315) tp_is_empty!17215 (not mapNonEmpty!27425))
(check-sat)
