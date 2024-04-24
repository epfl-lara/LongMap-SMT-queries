; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84298 () Bool)

(assert start!84298)

(declare-fun mapIsEmpty!36428 () Bool)

(declare-fun mapRes!36428 () Bool)

(assert (=> mapIsEmpty!36428 mapRes!36428))

(declare-fun b!984565 () Bool)

(declare-fun res!658550 () Bool)

(declare-fun e!555128 () Bool)

(assert (=> b!984565 (=> (not res!658550) (not e!555128))))

(declare-datatypes ((array!61890 0))(
  ( (array!61891 (arr!29798 (Array (_ BitVec 32) (_ BitVec 64))) (size!30278 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61890)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61890 (_ BitVec 32)) Bool)

(assert (=> b!984565 (= res!658550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984566 () Bool)

(assert (=> b!984566 (= e!555128 false)))

(declare-fun lt!436917 () Bool)

(declare-datatypes ((List!20635 0))(
  ( (Nil!20632) (Cons!20631 (h!21799 (_ BitVec 64)) (t!29418 List!20635)) )
))
(declare-fun arrayNoDuplicates!0 (array!61890 (_ BitVec 32) List!20635) Bool)

(assert (=> b!984566 (= lt!436917 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20632))))

(declare-fun res!658551 () Bool)

(assert (=> start!84298 (=> (not res!658551) (not e!555128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84298 (= res!658551 (validMask!0 mask!1948))))

(assert (=> start!84298 e!555128))

(assert (=> start!84298 true))

(declare-datatypes ((V!35561 0))(
  ( (V!35562 (val!11517 Int)) )
))
(declare-datatypes ((ValueCell!10985 0))(
  ( (ValueCellFull!10985 (v!14076 V!35561)) (EmptyCell!10985) )
))
(declare-datatypes ((array!61892 0))(
  ( (array!61893 (arr!29799 (Array (_ BitVec 32) ValueCell!10985)) (size!30279 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61892)

(declare-fun e!555131 () Bool)

(declare-fun array_inv!23057 (array!61892) Bool)

(assert (=> start!84298 (and (array_inv!23057 _values!1278) e!555131)))

(declare-fun array_inv!23058 (array!61890) Bool)

(assert (=> start!84298 (array_inv!23058 _keys!1544)))

(declare-fun b!984567 () Bool)

(declare-fun e!555130 () Bool)

(declare-fun tp_is_empty!22933 () Bool)

(assert (=> b!984567 (= e!555130 tp_is_empty!22933)))

(declare-fun mapNonEmpty!36428 () Bool)

(declare-fun tp!69113 () Bool)

(declare-fun e!555132 () Bool)

(assert (=> mapNonEmpty!36428 (= mapRes!36428 (and tp!69113 e!555132))))

(declare-fun mapValue!36428 () ValueCell!10985)

(declare-fun mapRest!36428 () (Array (_ BitVec 32) ValueCell!10985))

(declare-fun mapKey!36428 () (_ BitVec 32))

(assert (=> mapNonEmpty!36428 (= (arr!29799 _values!1278) (store mapRest!36428 mapKey!36428 mapValue!36428))))

(declare-fun b!984568 () Bool)

(declare-fun res!658552 () Bool)

(assert (=> b!984568 (=> (not res!658552) (not e!555128))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984568 (= res!658552 (and (= (size!30279 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30278 _keys!1544) (size!30279 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984569 () Bool)

(assert (=> b!984569 (= e!555132 tp_is_empty!22933)))

(declare-fun b!984570 () Bool)

(assert (=> b!984570 (= e!555131 (and e!555130 mapRes!36428))))

(declare-fun condMapEmpty!36428 () Bool)

(declare-fun mapDefault!36428 () ValueCell!10985)

(assert (=> b!984570 (= condMapEmpty!36428 (= (arr!29799 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10985)) mapDefault!36428)))))

(assert (= (and start!84298 res!658551) b!984568))

(assert (= (and b!984568 res!658552) b!984565))

(assert (= (and b!984565 res!658550) b!984566))

(assert (= (and b!984570 condMapEmpty!36428) mapIsEmpty!36428))

(assert (= (and b!984570 (not condMapEmpty!36428)) mapNonEmpty!36428))

(get-info :version)

(assert (= (and mapNonEmpty!36428 ((_ is ValueCellFull!10985) mapValue!36428)) b!984569))

(assert (= (and b!984570 ((_ is ValueCellFull!10985) mapDefault!36428)) b!984567))

(assert (= start!84298 b!984570))

(declare-fun m!912155 () Bool)

(assert (=> b!984565 m!912155))

(declare-fun m!912157 () Bool)

(assert (=> b!984566 m!912157))

(declare-fun m!912159 () Bool)

(assert (=> start!84298 m!912159))

(declare-fun m!912161 () Bool)

(assert (=> start!84298 m!912161))

(declare-fun m!912163 () Bool)

(assert (=> start!84298 m!912163))

(declare-fun m!912165 () Bool)

(assert (=> mapNonEmpty!36428 m!912165))

(check-sat (not b!984565) (not start!84298) (not mapNonEmpty!36428) (not b!984566) tp_is_empty!22933)
(check-sat)
