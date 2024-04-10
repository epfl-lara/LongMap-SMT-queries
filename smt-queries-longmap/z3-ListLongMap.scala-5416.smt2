; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72282 () Bool)

(assert start!72282)

(declare-fun mapNonEmpty!24599 () Bool)

(declare-fun mapRes!24599 () Bool)

(declare-fun tp!47593 () Bool)

(declare-fun e!467410 () Bool)

(assert (=> mapNonEmpty!24599 (= mapRes!24599 (and tp!47593 e!467410))))

(declare-datatypes ((V!25491 0))(
  ( (V!25492 (val!7714 Int)) )
))
(declare-datatypes ((ValueCell!7227 0))(
  ( (ValueCellFull!7227 (v!10139 V!25491)) (EmptyCell!7227) )
))
(declare-fun mapRest!24599 () (Array (_ BitVec 32) ValueCell!7227))

(declare-fun mapKey!24599 () (_ BitVec 32))

(declare-datatypes ((array!46964 0))(
  ( (array!46965 (arr!22513 (Array (_ BitVec 32) ValueCell!7227)) (size!22953 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46964)

(declare-fun mapValue!24599 () ValueCell!7227)

(assert (=> mapNonEmpty!24599 (= (arr!22513 _values!688) (store mapRest!24599 mapKey!24599 mapValue!24599))))

(declare-fun mapIsEmpty!24599 () Bool)

(assert (=> mapIsEmpty!24599 mapRes!24599))

(declare-fun b!837482 () Bool)

(declare-fun tp_is_empty!15333 () Bool)

(assert (=> b!837482 (= e!467410 tp_is_empty!15333)))

(declare-fun b!837484 () Bool)

(declare-fun res!569571 () Bool)

(declare-fun e!467411 () Bool)

(assert (=> b!837484 (=> (not res!569571) (not e!467411))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837484 (= res!569571 (validMask!0 mask!1196))))

(declare-fun b!837483 () Bool)

(declare-fun res!569572 () Bool)

(assert (=> b!837483 (=> (not res!569572) (not e!467411))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!46966 0))(
  ( (array!46967 (arr!22514 (Array (_ BitVec 32) (_ BitVec 64))) (size!22954 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46966)

(assert (=> b!837483 (= res!569572 (and (= (size!22953 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22954 _keys!868) (size!22953 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!569573 () Bool)

(assert (=> start!72282 (=> (not res!569573) (not e!467411))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72282 (= res!569573 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22954 _keys!868))))))

(assert (=> start!72282 e!467411))

(assert (=> start!72282 true))

(declare-fun array_inv!17946 (array!46966) Bool)

(assert (=> start!72282 (array_inv!17946 _keys!868)))

(declare-fun e!467409 () Bool)

(declare-fun array_inv!17947 (array!46964) Bool)

(assert (=> start!72282 (and (array_inv!17947 _values!688) e!467409)))

(declare-fun b!837485 () Bool)

(declare-fun e!467412 () Bool)

(assert (=> b!837485 (= e!467412 tp_is_empty!15333)))

(declare-fun b!837486 () Bool)

(assert (=> b!837486 (= e!467411 false)))

(declare-fun lt!380566 () Bool)

(declare-datatypes ((List!16028 0))(
  ( (Nil!16025) (Cons!16024 (h!17155 (_ BitVec 64)) (t!22399 List!16028)) )
))
(declare-fun arrayNoDuplicates!0 (array!46966 (_ BitVec 32) List!16028) Bool)

(assert (=> b!837486 (= lt!380566 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16025))))

(declare-fun b!837487 () Bool)

(assert (=> b!837487 (= e!467409 (and e!467412 mapRes!24599))))

(declare-fun condMapEmpty!24599 () Bool)

(declare-fun mapDefault!24599 () ValueCell!7227)

(assert (=> b!837487 (= condMapEmpty!24599 (= (arr!22513 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7227)) mapDefault!24599)))))

(declare-fun b!837488 () Bool)

(declare-fun res!569570 () Bool)

(assert (=> b!837488 (=> (not res!569570) (not e!467411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46966 (_ BitVec 32)) Bool)

(assert (=> b!837488 (= res!569570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72282 res!569573) b!837484))

(assert (= (and b!837484 res!569571) b!837483))

(assert (= (and b!837483 res!569572) b!837488))

(assert (= (and b!837488 res!569570) b!837486))

(assert (= (and b!837487 condMapEmpty!24599) mapIsEmpty!24599))

(assert (= (and b!837487 (not condMapEmpty!24599)) mapNonEmpty!24599))

(get-info :version)

(assert (= (and mapNonEmpty!24599 ((_ is ValueCellFull!7227) mapValue!24599)) b!837482))

(assert (= (and b!837487 ((_ is ValueCellFull!7227) mapDefault!24599)) b!837485))

(assert (= start!72282 b!837487))

(declare-fun m!782313 () Bool)

(assert (=> b!837488 m!782313))

(declare-fun m!782315 () Bool)

(assert (=> b!837486 m!782315))

(declare-fun m!782317 () Bool)

(assert (=> start!72282 m!782317))

(declare-fun m!782319 () Bool)

(assert (=> start!72282 m!782319))

(declare-fun m!782321 () Bool)

(assert (=> b!837484 m!782321))

(declare-fun m!782323 () Bool)

(assert (=> mapNonEmpty!24599 m!782323))

(check-sat (not b!837488) (not start!72282) (not b!837486) (not mapNonEmpty!24599) tp_is_empty!15333 (not b!837484))
(check-sat)
