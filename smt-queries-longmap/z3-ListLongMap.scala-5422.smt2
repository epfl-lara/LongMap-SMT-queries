; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72298 () Bool)

(assert start!72298)

(declare-fun b!837600 () Bool)

(declare-fun res!569666 () Bool)

(declare-fun e!467517 () Bool)

(assert (=> b!837600 (=> (not res!569666) (not e!467517))))

(declare-datatypes ((array!46999 0))(
  ( (array!47000 (arr!22531 (Array (_ BitVec 32) (_ BitVec 64))) (size!22973 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46999)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46999 (_ BitVec 32)) Bool)

(assert (=> b!837600 (= res!569666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837601 () Bool)

(assert (=> b!837601 (= e!467517 false)))

(declare-fun lt!380381 () Bool)

(declare-datatypes ((List!16037 0))(
  ( (Nil!16034) (Cons!16033 (h!17164 (_ BitVec 64)) (t!22399 List!16037)) )
))
(declare-fun arrayNoDuplicates!0 (array!46999 (_ BitVec 32) List!16037) Bool)

(assert (=> b!837601 (= lt!380381 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16034))))

(declare-fun mapNonEmpty!24650 () Bool)

(declare-fun mapRes!24650 () Bool)

(declare-fun tp!47645 () Bool)

(declare-fun e!467520 () Bool)

(assert (=> mapNonEmpty!24650 (= mapRes!24650 (and tp!47645 e!467520))))

(declare-fun mapKey!24650 () (_ BitVec 32))

(declare-datatypes ((V!25537 0))(
  ( (V!25538 (val!7731 Int)) )
))
(declare-datatypes ((ValueCell!7244 0))(
  ( (ValueCellFull!7244 (v!10150 V!25537)) (EmptyCell!7244) )
))
(declare-datatypes ((array!47001 0))(
  ( (array!47002 (arr!22532 (Array (_ BitVec 32) ValueCell!7244)) (size!22974 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47001)

(declare-fun mapValue!24650 () ValueCell!7244)

(declare-fun mapRest!24650 () (Array (_ BitVec 32) ValueCell!7244))

(assert (=> mapNonEmpty!24650 (= (arr!22532 _values!688) (store mapRest!24650 mapKey!24650 mapValue!24650))))

(declare-fun b!837602 () Bool)

(declare-fun tp_is_empty!15367 () Bool)

(assert (=> b!837602 (= e!467520 tp_is_empty!15367)))

(declare-fun mapIsEmpty!24650 () Bool)

(assert (=> mapIsEmpty!24650 mapRes!24650))

(declare-fun b!837603 () Bool)

(declare-fun e!467516 () Bool)

(assert (=> b!837603 (= e!467516 tp_is_empty!15367)))

(declare-fun res!569665 () Bool)

(assert (=> start!72298 (=> (not res!569665) (not e!467517))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72298 (= res!569665 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22973 _keys!868))))))

(assert (=> start!72298 e!467517))

(assert (=> start!72298 true))

(declare-fun array_inv!18024 (array!46999) Bool)

(assert (=> start!72298 (array_inv!18024 _keys!868)))

(declare-fun e!467519 () Bool)

(declare-fun array_inv!18025 (array!47001) Bool)

(assert (=> start!72298 (and (array_inv!18025 _values!688) e!467519)))

(declare-fun b!837604 () Bool)

(assert (=> b!837604 (= e!467519 (and e!467516 mapRes!24650))))

(declare-fun condMapEmpty!24650 () Bool)

(declare-fun mapDefault!24650 () ValueCell!7244)

(assert (=> b!837604 (= condMapEmpty!24650 (= (arr!22532 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7244)) mapDefault!24650)))))

(declare-fun b!837605 () Bool)

(declare-fun res!569664 () Bool)

(assert (=> b!837605 (=> (not res!569664) (not e!467517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837605 (= res!569664 (validMask!0 mask!1196))))

(declare-fun b!837606 () Bool)

(declare-fun res!569667 () Bool)

(assert (=> b!837606 (=> (not res!569667) (not e!467517))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837606 (= res!569667 (and (= (size!22974 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22973 _keys!868) (size!22974 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72298 res!569665) b!837605))

(assert (= (and b!837605 res!569664) b!837606))

(assert (= (and b!837606 res!569667) b!837600))

(assert (= (and b!837600 res!569666) b!837601))

(assert (= (and b!837604 condMapEmpty!24650) mapIsEmpty!24650))

(assert (= (and b!837604 (not condMapEmpty!24650)) mapNonEmpty!24650))

(get-info :version)

(assert (= (and mapNonEmpty!24650 ((_ is ValueCellFull!7244) mapValue!24650)) b!837602))

(assert (= (and b!837604 ((_ is ValueCellFull!7244) mapDefault!24650)) b!837603))

(assert (= start!72298 b!837604))

(declare-fun m!781763 () Bool)

(assert (=> b!837600 m!781763))

(declare-fun m!781765 () Bool)

(assert (=> mapNonEmpty!24650 m!781765))

(declare-fun m!781767 () Bool)

(assert (=> b!837605 m!781767))

(declare-fun m!781769 () Bool)

(assert (=> b!837601 m!781769))

(declare-fun m!781771 () Bool)

(assert (=> start!72298 m!781771))

(declare-fun m!781773 () Bool)

(assert (=> start!72298 m!781773))

(check-sat (not b!837601) (not start!72298) tp_is_empty!15367 (not mapNonEmpty!24650) (not b!837600) (not b!837605))
(check-sat)
