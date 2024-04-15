; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77462 () Bool)

(assert start!77462)

(declare-fun res!609138 () Bool)

(declare-fun e!505637 () Bool)

(assert (=> start!77462 (=> (not res!609138) (not e!505637))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77462 (= res!609138 (validMask!0 mask!1756))))

(assert (=> start!77462 e!505637))

(assert (=> start!77462 true))

(declare-datatypes ((V!29623 0))(
  ( (V!29624 (val!9297 Int)) )
))
(declare-datatypes ((ValueCell!8765 0))(
  ( (ValueCellFull!8765 (v!11801 V!29623)) (EmptyCell!8765) )
))
(declare-datatypes ((array!53029 0))(
  ( (array!53030 (arr!25475 (Array (_ BitVec 32) ValueCell!8765)) (size!25936 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53029)

(declare-fun e!505640 () Bool)

(declare-fun array_inv!20026 (array!53029) Bool)

(assert (=> start!77462 (and (array_inv!20026 _values!1152) e!505640)))

(declare-datatypes ((array!53031 0))(
  ( (array!53032 (arr!25476 (Array (_ BitVec 32) (_ BitVec 64))) (size!25937 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53031)

(declare-fun array_inv!20027 (array!53031) Bool)

(assert (=> start!77462 (array_inv!20027 _keys!1386)))

(declare-fun mapNonEmpty!29449 () Bool)

(declare-fun mapRes!29449 () Bool)

(declare-fun tp!56509 () Bool)

(declare-fun e!505638 () Bool)

(assert (=> mapNonEmpty!29449 (= mapRes!29449 (and tp!56509 e!505638))))

(declare-fun mapRest!29449 () (Array (_ BitVec 32) ValueCell!8765))

(declare-fun mapValue!29449 () ValueCell!8765)

(declare-fun mapKey!29449 () (_ BitVec 32))

(assert (=> mapNonEmpty!29449 (= (arr!25475 _values!1152) (store mapRest!29449 mapKey!29449 mapValue!29449))))

(declare-fun b!902663 () Bool)

(declare-fun tp_is_empty!18493 () Bool)

(assert (=> b!902663 (= e!505638 tp_is_empty!18493)))

(declare-fun b!902664 () Bool)

(declare-fun res!609136 () Bool)

(assert (=> b!902664 (=> (not res!609136) (not e!505637))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902664 (= res!609136 (and (= (size!25936 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25937 _keys!1386) (size!25936 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902665 () Bool)

(declare-fun e!505636 () Bool)

(assert (=> b!902665 (= e!505636 tp_is_empty!18493)))

(declare-fun b!902666 () Bool)

(assert (=> b!902666 (= e!505640 (and e!505636 mapRes!29449))))

(declare-fun condMapEmpty!29449 () Bool)

(declare-fun mapDefault!29449 () ValueCell!8765)

(assert (=> b!902666 (= condMapEmpty!29449 (= (arr!25475 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8765)) mapDefault!29449)))))

(declare-fun b!902667 () Bool)

(assert (=> b!902667 (= e!505637 false)))

(declare-fun lt!407698 () Bool)

(declare-datatypes ((List!17911 0))(
  ( (Nil!17908) (Cons!17907 (h!19053 (_ BitVec 64)) (t!25285 List!17911)) )
))
(declare-fun arrayNoDuplicates!0 (array!53031 (_ BitVec 32) List!17911) Bool)

(assert (=> b!902667 (= lt!407698 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17908))))

(declare-fun b!902668 () Bool)

(declare-fun res!609137 () Bool)

(assert (=> b!902668 (=> (not res!609137) (not e!505637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53031 (_ BitVec 32)) Bool)

(assert (=> b!902668 (= res!609137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29449 () Bool)

(assert (=> mapIsEmpty!29449 mapRes!29449))

(assert (= (and start!77462 res!609138) b!902664))

(assert (= (and b!902664 res!609136) b!902668))

(assert (= (and b!902668 res!609137) b!902667))

(assert (= (and b!902666 condMapEmpty!29449) mapIsEmpty!29449))

(assert (= (and b!902666 (not condMapEmpty!29449)) mapNonEmpty!29449))

(get-info :version)

(assert (= (and mapNonEmpty!29449 ((_ is ValueCellFull!8765) mapValue!29449)) b!902663))

(assert (= (and b!902666 ((_ is ValueCellFull!8765) mapDefault!29449)) b!902665))

(assert (= start!77462 b!902666))

(declare-fun m!837989 () Bool)

(assert (=> start!77462 m!837989))

(declare-fun m!837991 () Bool)

(assert (=> start!77462 m!837991))

(declare-fun m!837993 () Bool)

(assert (=> start!77462 m!837993))

(declare-fun m!837995 () Bool)

(assert (=> mapNonEmpty!29449 m!837995))

(declare-fun m!837997 () Bool)

(assert (=> b!902667 m!837997))

(declare-fun m!837999 () Bool)

(assert (=> b!902668 m!837999))

(check-sat (not b!902667) (not start!77462) (not mapNonEmpty!29449) tp_is_empty!18493 (not b!902668))
(check-sat)
