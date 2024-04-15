; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72286 () Bool)

(assert start!72286)

(declare-fun b!837474 () Bool)

(declare-fun res!569594 () Bool)

(declare-fun e!467430 () Bool)

(assert (=> b!837474 (=> (not res!569594) (not e!467430))))

(declare-datatypes ((array!46977 0))(
  ( (array!46978 (arr!22520 (Array (_ BitVec 32) (_ BitVec 64))) (size!22962 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46977)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46977 (_ BitVec 32)) Bool)

(assert (=> b!837474 (= res!569594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24632 () Bool)

(declare-fun mapRes!24632 () Bool)

(declare-fun tp!47627 () Bool)

(declare-fun e!467426 () Bool)

(assert (=> mapNonEmpty!24632 (= mapRes!24632 (and tp!47627 e!467426))))

(declare-datatypes ((V!25521 0))(
  ( (V!25522 (val!7725 Int)) )
))
(declare-datatypes ((ValueCell!7238 0))(
  ( (ValueCellFull!7238 (v!10144 V!25521)) (EmptyCell!7238) )
))
(declare-fun mapValue!24632 () ValueCell!7238)

(declare-datatypes ((array!46979 0))(
  ( (array!46980 (arr!22521 (Array (_ BitVec 32) ValueCell!7238)) (size!22963 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46979)

(declare-fun mapRest!24632 () (Array (_ BitVec 32) ValueCell!7238))

(declare-fun mapKey!24632 () (_ BitVec 32))

(assert (=> mapNonEmpty!24632 (= (arr!22521 _values!688) (store mapRest!24632 mapKey!24632 mapValue!24632))))

(declare-fun b!837475 () Bool)

(declare-fun tp_is_empty!15355 () Bool)

(assert (=> b!837475 (= e!467426 tp_is_empty!15355)))

(declare-fun mapIsEmpty!24632 () Bool)

(assert (=> mapIsEmpty!24632 mapRes!24632))

(declare-fun b!837476 () Bool)

(declare-fun res!569592 () Bool)

(assert (=> b!837476 (=> (not res!569592) (not e!467430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837476 (= res!569592 (validMask!0 mask!1196))))

(declare-fun b!837477 () Bool)

(assert (=> b!837477 (= e!467430 false)))

(declare-fun lt!380363 () Bool)

(declare-datatypes ((List!16034 0))(
  ( (Nil!16031) (Cons!16030 (h!17161 (_ BitVec 64)) (t!22396 List!16034)) )
))
(declare-fun arrayNoDuplicates!0 (array!46977 (_ BitVec 32) List!16034) Bool)

(assert (=> b!837477 (= lt!380363 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16031))))

(declare-fun b!837478 () Bool)

(declare-fun res!569593 () Bool)

(assert (=> b!837478 (=> (not res!569593) (not e!467430))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837478 (= res!569593 (and (= (size!22963 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22962 _keys!868) (size!22963 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837479 () Bool)

(declare-fun e!467428 () Bool)

(assert (=> b!837479 (= e!467428 tp_is_empty!15355)))

(declare-fun res!569595 () Bool)

(assert (=> start!72286 (=> (not res!569595) (not e!467430))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72286 (= res!569595 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22962 _keys!868))))))

(assert (=> start!72286 e!467430))

(assert (=> start!72286 true))

(declare-fun array_inv!18016 (array!46977) Bool)

(assert (=> start!72286 (array_inv!18016 _keys!868)))

(declare-fun e!467429 () Bool)

(declare-fun array_inv!18017 (array!46979) Bool)

(assert (=> start!72286 (and (array_inv!18017 _values!688) e!467429)))

(declare-fun b!837480 () Bool)

(assert (=> b!837480 (= e!467429 (and e!467428 mapRes!24632))))

(declare-fun condMapEmpty!24632 () Bool)

(declare-fun mapDefault!24632 () ValueCell!7238)

(assert (=> b!837480 (= condMapEmpty!24632 (= (arr!22521 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7238)) mapDefault!24632)))))

(assert (= (and start!72286 res!569595) b!837476))

(assert (= (and b!837476 res!569592) b!837478))

(assert (= (and b!837478 res!569593) b!837474))

(assert (= (and b!837474 res!569594) b!837477))

(assert (= (and b!837480 condMapEmpty!24632) mapIsEmpty!24632))

(assert (= (and b!837480 (not condMapEmpty!24632)) mapNonEmpty!24632))

(get-info :version)

(assert (= (and mapNonEmpty!24632 ((_ is ValueCellFull!7238) mapValue!24632)) b!837475))

(assert (= (and b!837480 ((_ is ValueCellFull!7238) mapDefault!24632)) b!837479))

(assert (= start!72286 b!837480))

(declare-fun m!781691 () Bool)

(assert (=> b!837477 m!781691))

(declare-fun m!781693 () Bool)

(assert (=> mapNonEmpty!24632 m!781693))

(declare-fun m!781695 () Bool)

(assert (=> b!837476 m!781695))

(declare-fun m!781697 () Bool)

(assert (=> b!837474 m!781697))

(declare-fun m!781699 () Bool)

(assert (=> start!72286 m!781699))

(declare-fun m!781701 () Bool)

(assert (=> start!72286 m!781701))

(check-sat (not start!72286) (not b!837477) (not mapNonEmpty!24632) tp_is_empty!15355 (not b!837474) (not b!837476))
(check-sat)
