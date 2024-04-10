; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77460 () Bool)

(assert start!77460)

(declare-fun b!902722 () Bool)

(declare-fun res!609158 () Bool)

(declare-fun e!505635 () Bool)

(assert (=> b!902722 (=> (not res!609158) (not e!505635))))

(declare-datatypes ((array!53006 0))(
  ( (array!53007 (arr!25463 (Array (_ BitVec 32) (_ BitVec 64))) (size!25922 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53006)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53006 (_ BitVec 32)) Bool)

(assert (=> b!902722 (= res!609158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29419 () Bool)

(declare-fun mapRes!29419 () Bool)

(declare-fun tp!56478 () Bool)

(declare-fun e!505638 () Bool)

(assert (=> mapNonEmpty!29419 (= mapRes!29419 (and tp!56478 e!505638))))

(declare-datatypes ((V!29595 0))(
  ( (V!29596 (val!9287 Int)) )
))
(declare-datatypes ((ValueCell!8755 0))(
  ( (ValueCellFull!8755 (v!11792 V!29595)) (EmptyCell!8755) )
))
(declare-datatypes ((array!53008 0))(
  ( (array!53009 (arr!25464 (Array (_ BitVec 32) ValueCell!8755)) (size!25923 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53008)

(declare-fun mapRest!29419 () (Array (_ BitVec 32) ValueCell!8755))

(declare-fun mapKey!29419 () (_ BitVec 32))

(declare-fun mapValue!29419 () ValueCell!8755)

(assert (=> mapNonEmpty!29419 (= (arr!25464 _values!1152) (store mapRest!29419 mapKey!29419 mapValue!29419))))

(declare-fun b!902723 () Bool)

(declare-fun e!505634 () Bool)

(declare-fun tp_is_empty!18473 () Bool)

(assert (=> b!902723 (= e!505634 tp_is_empty!18473)))

(declare-fun b!902724 () Bool)

(assert (=> b!902724 (= e!505638 tp_is_empty!18473)))

(declare-fun b!902725 () Bool)

(declare-fun res!609157 () Bool)

(assert (=> b!902725 (=> (not res!609157) (not e!505635))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902725 (= res!609157 (and (= (size!25923 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25922 _keys!1386) (size!25923 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609156 () Bool)

(assert (=> start!77460 (=> (not res!609156) (not e!505635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77460 (= res!609156 (validMask!0 mask!1756))))

(assert (=> start!77460 e!505635))

(assert (=> start!77460 true))

(declare-fun e!505637 () Bool)

(declare-fun array_inv!19958 (array!53008) Bool)

(assert (=> start!77460 (and (array_inv!19958 _values!1152) e!505637)))

(declare-fun array_inv!19959 (array!53006) Bool)

(assert (=> start!77460 (array_inv!19959 _keys!1386)))

(declare-fun b!902726 () Bool)

(assert (=> b!902726 (= e!505637 (and e!505634 mapRes!29419))))

(declare-fun condMapEmpty!29419 () Bool)

(declare-fun mapDefault!29419 () ValueCell!8755)

