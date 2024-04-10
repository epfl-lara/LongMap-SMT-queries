; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77476 () Bool)

(assert start!77476)

(declare-fun mapIsEmpty!29443 () Bool)

(declare-fun mapRes!29443 () Bool)

(assert (=> mapIsEmpty!29443 mapRes!29443))

(declare-fun b!902867 () Bool)

(declare-fun e!505755 () Bool)

(declare-fun e!505754 () Bool)

(assert (=> b!902867 (= e!505755 (and e!505754 mapRes!29443))))

(declare-fun condMapEmpty!29443 () Bool)

(declare-datatypes ((V!29617 0))(
  ( (V!29618 (val!9295 Int)) )
))
(declare-datatypes ((ValueCell!8763 0))(
  ( (ValueCellFull!8763 (v!11800 V!29617)) (EmptyCell!8763) )
))
(declare-datatypes ((array!53038 0))(
  ( (array!53039 (arr!25479 (Array (_ BitVec 32) ValueCell!8763)) (size!25938 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53038)

(declare-fun mapDefault!29443 () ValueCell!8763)

(assert (=> b!902867 (= condMapEmpty!29443 (= (arr!25479 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8763)) mapDefault!29443)))))

(declare-fun b!902868 () Bool)

(declare-fun res!609228 () Bool)

(declare-fun e!505758 () Bool)

(assert (=> b!902868 (=> (not res!609228) (not e!505758))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53040 0))(
  ( (array!53041 (arr!25480 (Array (_ BitVec 32) (_ BitVec 64))) (size!25939 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53040)

(assert (=> b!902868 (= res!609228 (and (= (size!25938 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25939 _keys!1386) (size!25938 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609230 () Bool)

(assert (=> start!77476 (=> (not res!609230) (not e!505758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77476 (= res!609230 (validMask!0 mask!1756))))

(assert (=> start!77476 e!505758))

(assert (=> start!77476 true))

(declare-fun array_inv!19974 (array!53038) Bool)

(assert (=> start!77476 (and (array_inv!19974 _values!1152) e!505755)))

(declare-fun array_inv!19975 (array!53040) Bool)

(assert (=> start!77476 (array_inv!19975 _keys!1386)))

(declare-fun b!902866 () Bool)

(declare-fun tp_is_empty!18489 () Bool)

(assert (=> b!902866 (= e!505754 tp_is_empty!18489)))

(declare-fun b!902869 () Bool)

(assert (=> b!902869 (= e!505758 false)))

(declare-fun lt!407928 () Bool)

(declare-datatypes ((List!17897 0))(
  ( (Nil!17894) (Cons!17893 (h!19039 (_ BitVec 64)) (t!25280 List!17897)) )
))
(declare-fun arrayNoDuplicates!0 (array!53040 (_ BitVec 32) List!17897) Bool)

(assert (=> b!902869 (= lt!407928 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17894))))

(declare-fun b!902870 () Bool)

(declare-fun e!505756 () Bool)

(assert (=> b!902870 (= e!505756 tp_is_empty!18489)))

(declare-fun mapNonEmpty!29443 () Bool)

(declare-fun tp!56502 () Bool)

(assert (=> mapNonEmpty!29443 (= mapRes!29443 (and tp!56502 e!505756))))

(declare-fun mapKey!29443 () (_ BitVec 32))

(declare-fun mapRest!29443 () (Array (_ BitVec 32) ValueCell!8763))

(declare-fun mapValue!29443 () ValueCell!8763)

(assert (=> mapNonEmpty!29443 (= (arr!25479 _values!1152) (store mapRest!29443 mapKey!29443 mapValue!29443))))

(declare-fun b!902871 () Bool)

(declare-fun res!609229 () Bool)

(assert (=> b!902871 (=> (not res!609229) (not e!505758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53040 (_ BitVec 32)) Bool)

(assert (=> b!902871 (= res!609229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77476 res!609230) b!902868))

(assert (= (and b!902868 res!609228) b!902871))

(assert (= (and b!902871 res!609229) b!902869))

(assert (= (and b!902867 condMapEmpty!29443) mapIsEmpty!29443))

(assert (= (and b!902867 (not condMapEmpty!29443)) mapNonEmpty!29443))

(get-info :version)

(assert (= (and mapNonEmpty!29443 ((_ is ValueCellFull!8763) mapValue!29443)) b!902870))

(assert (= (and b!902867 ((_ is ValueCellFull!8763) mapDefault!29443)) b!902866))

(assert (= start!77476 b!902867))

(declare-fun m!838723 () Bool)

(assert (=> start!77476 m!838723))

(declare-fun m!838725 () Bool)

(assert (=> start!77476 m!838725))

(declare-fun m!838727 () Bool)

(assert (=> start!77476 m!838727))

(declare-fun m!838729 () Bool)

(assert (=> b!902869 m!838729))

(declare-fun m!838731 () Bool)

(assert (=> mapNonEmpty!29443 m!838731))

(declare-fun m!838733 () Bool)

(assert (=> b!902871 m!838733))

(check-sat (not mapNonEmpty!29443) tp_is_empty!18489 (not start!77476) (not b!902871) (not b!902869))
(check-sat)
