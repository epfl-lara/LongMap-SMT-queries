; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77458 () Bool)

(assert start!77458)

(declare-fun mapNonEmpty!29416 () Bool)

(declare-fun mapRes!29416 () Bool)

(declare-fun tp!56475 () Bool)

(declare-fun e!505619 () Bool)

(assert (=> mapNonEmpty!29416 (= mapRes!29416 (and tp!56475 e!505619))))

(declare-datatypes ((V!29593 0))(
  ( (V!29594 (val!9286 Int)) )
))
(declare-datatypes ((ValueCell!8754 0))(
  ( (ValueCellFull!8754 (v!11791 V!29593)) (EmptyCell!8754) )
))
(declare-fun mapRest!29416 () (Array (_ BitVec 32) ValueCell!8754))

(declare-fun mapValue!29416 () ValueCell!8754)

(declare-datatypes ((array!53002 0))(
  ( (array!53003 (arr!25461 (Array (_ BitVec 32) ValueCell!8754)) (size!25920 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53002)

(declare-fun mapKey!29416 () (_ BitVec 32))

(assert (=> mapNonEmpty!29416 (= (arr!25461 _values!1152) (store mapRest!29416 mapKey!29416 mapValue!29416))))

(declare-fun b!902704 () Bool)

(declare-fun tp_is_empty!18471 () Bool)

(assert (=> b!902704 (= e!505619 tp_is_empty!18471)))

(declare-fun b!902705 () Bool)

(declare-fun e!505621 () Bool)

(assert (=> b!902705 (= e!505621 false)))

(declare-fun lt!407901 () Bool)

(declare-datatypes ((array!53004 0))(
  ( (array!53005 (arr!25462 (Array (_ BitVec 32) (_ BitVec 64))) (size!25921 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53004)

(declare-datatypes ((List!17889 0))(
  ( (Nil!17886) (Cons!17885 (h!19031 (_ BitVec 64)) (t!25272 List!17889)) )
))
(declare-fun arrayNoDuplicates!0 (array!53004 (_ BitVec 32) List!17889) Bool)

(assert (=> b!902705 (= lt!407901 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17886))))

(declare-fun b!902706 () Bool)

(declare-fun res!609149 () Bool)

(assert (=> b!902706 (=> (not res!609149) (not e!505621))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!902706 (= res!609149 (and (= (size!25920 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25921 _keys!1386) (size!25920 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902707 () Bool)

(declare-fun e!505622 () Bool)

(assert (=> b!902707 (= e!505622 tp_is_empty!18471)))

(declare-fun b!902708 () Bool)

(declare-fun e!505620 () Bool)

(assert (=> b!902708 (= e!505620 (and e!505622 mapRes!29416))))

(declare-fun condMapEmpty!29416 () Bool)

(declare-fun mapDefault!29416 () ValueCell!8754)

(assert (=> b!902708 (= condMapEmpty!29416 (= (arr!25461 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8754)) mapDefault!29416)))))

(declare-fun res!609148 () Bool)

(assert (=> start!77458 (=> (not res!609148) (not e!505621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77458 (= res!609148 (validMask!0 mask!1756))))

(assert (=> start!77458 e!505621))

(assert (=> start!77458 true))

(declare-fun array_inv!19956 (array!53002) Bool)

(assert (=> start!77458 (and (array_inv!19956 _values!1152) e!505620)))

(declare-fun array_inv!19957 (array!53004) Bool)

(assert (=> start!77458 (array_inv!19957 _keys!1386)))

(declare-fun b!902709 () Bool)

(declare-fun res!609147 () Bool)

(assert (=> b!902709 (=> (not res!609147) (not e!505621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53004 (_ BitVec 32)) Bool)

(assert (=> b!902709 (= res!609147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29416 () Bool)

(assert (=> mapIsEmpty!29416 mapRes!29416))

(assert (= (and start!77458 res!609148) b!902706))

(assert (= (and b!902706 res!609149) b!902709))

(assert (= (and b!902709 res!609147) b!902705))

(assert (= (and b!902708 condMapEmpty!29416) mapIsEmpty!29416))

(assert (= (and b!902708 (not condMapEmpty!29416)) mapNonEmpty!29416))

(get-info :version)

(assert (= (and mapNonEmpty!29416 ((_ is ValueCellFull!8754) mapValue!29416)) b!902704))

(assert (= (and b!902708 ((_ is ValueCellFull!8754) mapDefault!29416)) b!902707))

(assert (= start!77458 b!902708))

(declare-fun m!838615 () Bool)

(assert (=> mapNonEmpty!29416 m!838615))

(declare-fun m!838617 () Bool)

(assert (=> b!902705 m!838617))

(declare-fun m!838619 () Bool)

(assert (=> start!77458 m!838619))

(declare-fun m!838621 () Bool)

(assert (=> start!77458 m!838621))

(declare-fun m!838623 () Bool)

(assert (=> start!77458 m!838623))

(declare-fun m!838625 () Bool)

(assert (=> b!902709 m!838625))

(check-sat (not b!902709) (not b!902705) tp_is_empty!18471 (not start!77458) (not mapNonEmpty!29416))
(check-sat)
