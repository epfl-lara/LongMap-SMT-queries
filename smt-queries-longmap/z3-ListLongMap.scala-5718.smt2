; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74074 () Bool)

(assert start!74074)

(declare-fun b!871494 () Bool)

(declare-fun e!485205 () Bool)

(declare-fun tp_is_empty!17143 () Bool)

(assert (=> b!871494 (= e!485205 tp_is_empty!17143)))

(declare-fun b!871496 () Bool)

(declare-fun res!592436 () Bool)

(declare-fun e!485203 () Bool)

(assert (=> b!871496 (=> (not res!592436) (not e!485203))))

(declare-datatypes ((array!50411 0))(
  ( (array!50412 (arr!24237 (Array (_ BitVec 32) (_ BitVec 64))) (size!24679 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50411)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50411 (_ BitVec 32)) Bool)

(assert (=> b!871496 (= res!592436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871497 () Bool)

(declare-fun e!485201 () Bool)

(declare-fun mapRes!27314 () Bool)

(assert (=> b!871497 (= e!485201 (and e!485205 mapRes!27314))))

(declare-fun condMapEmpty!27314 () Bool)

(declare-datatypes ((V!27905 0))(
  ( (V!27906 (val!8619 Int)) )
))
(declare-datatypes ((ValueCell!8132 0))(
  ( (ValueCellFull!8132 (v!11038 V!27905)) (EmptyCell!8132) )
))
(declare-datatypes ((array!50413 0))(
  ( (array!50414 (arr!24238 (Array (_ BitVec 32) ValueCell!8132)) (size!24680 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50413)

(declare-fun mapDefault!27314 () ValueCell!8132)

(assert (=> b!871497 (= condMapEmpty!27314 (= (arr!24238 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8132)) mapDefault!27314)))))

(declare-fun b!871498 () Bool)

(assert (=> b!871498 (= e!485203 false)))

(declare-fun lt!395294 () Bool)

(declare-datatypes ((List!17247 0))(
  ( (Nil!17244) (Cons!17243 (h!18374 (_ BitVec 64)) (t!24275 List!17247)) )
))
(declare-fun arrayNoDuplicates!0 (array!50411 (_ BitVec 32) List!17247) Bool)

(assert (=> b!871498 (= lt!395294 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17244))))

(declare-fun mapNonEmpty!27314 () Bool)

(declare-fun tp!52514 () Bool)

(declare-fun e!485204 () Bool)

(assert (=> mapNonEmpty!27314 (= mapRes!27314 (and tp!52514 e!485204))))

(declare-fun mapKey!27314 () (_ BitVec 32))

(declare-fun mapValue!27314 () ValueCell!8132)

(declare-fun mapRest!27314 () (Array (_ BitVec 32) ValueCell!8132))

(assert (=> mapNonEmpty!27314 (= (arr!24238 _values!688) (store mapRest!27314 mapKey!27314 mapValue!27314))))

(declare-fun b!871499 () Bool)

(declare-fun res!592437 () Bool)

(assert (=> b!871499 (=> (not res!592437) (not e!485203))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871499 (= res!592437 (and (= (size!24680 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24679 _keys!868) (size!24680 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871495 () Bool)

(declare-fun res!592435 () Bool)

(assert (=> b!871495 (=> (not res!592435) (not e!485203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871495 (= res!592435 (validMask!0 mask!1196))))

(declare-fun res!592434 () Bool)

(assert (=> start!74074 (=> (not res!592434) (not e!485203))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74074 (= res!592434 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24679 _keys!868))))))

(assert (=> start!74074 e!485203))

(assert (=> start!74074 true))

(declare-fun array_inv!19200 (array!50411) Bool)

(assert (=> start!74074 (array_inv!19200 _keys!868)))

(declare-fun array_inv!19201 (array!50413) Bool)

(assert (=> start!74074 (and (array_inv!19201 _values!688) e!485201)))

(declare-fun mapIsEmpty!27314 () Bool)

(assert (=> mapIsEmpty!27314 mapRes!27314))

(declare-fun b!871500 () Bool)

(assert (=> b!871500 (= e!485204 tp_is_empty!17143)))

(assert (= (and start!74074 res!592434) b!871495))

(assert (= (and b!871495 res!592435) b!871499))

(assert (= (and b!871499 res!592437) b!871496))

(assert (= (and b!871496 res!592436) b!871498))

(assert (= (and b!871497 condMapEmpty!27314) mapIsEmpty!27314))

(assert (= (and b!871497 (not condMapEmpty!27314)) mapNonEmpty!27314))

(get-info :version)

(assert (= (and mapNonEmpty!27314 ((_ is ValueCellFull!8132) mapValue!27314)) b!871500))

(assert (= (and b!871497 ((_ is ValueCellFull!8132) mapDefault!27314)) b!871494))

(assert (= start!74074 b!871497))

(declare-fun m!812103 () Bool)

(assert (=> b!871498 m!812103))

(declare-fun m!812105 () Bool)

(assert (=> start!74074 m!812105))

(declare-fun m!812107 () Bool)

(assert (=> start!74074 m!812107))

(declare-fun m!812109 () Bool)

(assert (=> b!871495 m!812109))

(declare-fun m!812111 () Bool)

(assert (=> mapNonEmpty!27314 m!812111))

(declare-fun m!812113 () Bool)

(assert (=> b!871496 m!812113))

(check-sat (not b!871498) (not mapNonEmpty!27314) tp_is_empty!17143 (not start!74074) (not b!871496) (not b!871495))
(check-sat)
