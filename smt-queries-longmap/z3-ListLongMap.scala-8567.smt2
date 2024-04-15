; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104606 () Bool)

(assert start!104606)

(declare-fun mapNonEmpty!48763 () Bool)

(declare-fun mapRes!48763 () Bool)

(declare-fun tp!92864 () Bool)

(declare-fun e!707615 () Bool)

(assert (=> mapNonEmpty!48763 (= mapRes!48763 (and tp!92864 e!707615))))

(declare-datatypes ((V!47151 0))(
  ( (V!47152 (val!15732 Int)) )
))
(declare-datatypes ((ValueCell!14906 0))(
  ( (ValueCellFull!14906 (v!18427 V!47151)) (EmptyCell!14906) )
))
(declare-fun mapRest!48763 () (Array (_ BitVec 32) ValueCell!14906))

(declare-fun mapValue!48763 () ValueCell!14906)

(declare-datatypes ((array!80295 0))(
  ( (array!80296 (arr!38717 (Array (_ BitVec 32) ValueCell!14906)) (size!39255 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80295)

(declare-fun mapKey!48763 () (_ BitVec 32))

(assert (=> mapNonEmpty!48763 (= (arr!38717 _values!914) (store mapRest!48763 mapKey!48763 mapValue!48763))))

(declare-fun res!832324 () Bool)

(declare-fun e!707617 () Bool)

(assert (=> start!104606 (=> (not res!832324) (not e!707617))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104606 (= res!832324 (validMask!0 mask!1466))))

(assert (=> start!104606 e!707617))

(assert (=> start!104606 true))

(declare-datatypes ((array!80297 0))(
  ( (array!80298 (arr!38718 (Array (_ BitVec 32) (_ BitVec 64))) (size!39256 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80297)

(declare-fun array_inv!29685 (array!80297) Bool)

(assert (=> start!104606 (array_inv!29685 _keys!1118)))

(declare-fun e!707616 () Bool)

(declare-fun array_inv!29686 (array!80295) Bool)

(assert (=> start!104606 (and (array_inv!29686 _values!914) e!707616)))

(declare-fun b!1247349 () Bool)

(assert (=> b!1247349 (= e!707617 false)))

(declare-fun lt!563081 () Bool)

(declare-datatypes ((List!27590 0))(
  ( (Nil!27587) (Cons!27586 (h!28795 (_ BitVec 64)) (t!41050 List!27590)) )
))
(declare-fun arrayNoDuplicates!0 (array!80297 (_ BitVec 32) List!27590) Bool)

(assert (=> b!1247349 (= lt!563081 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27587))))

(declare-fun b!1247350 () Bool)

(declare-fun e!707613 () Bool)

(declare-fun tp_is_empty!31339 () Bool)

(assert (=> b!1247350 (= e!707613 tp_is_empty!31339)))

(declare-fun b!1247351 () Bool)

(assert (=> b!1247351 (= e!707615 tp_is_empty!31339)))

(declare-fun b!1247352 () Bool)

(declare-fun res!832323 () Bool)

(assert (=> b!1247352 (=> (not res!832323) (not e!707617))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247352 (= res!832323 (and (= (size!39255 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39256 _keys!1118) (size!39255 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247353 () Bool)

(assert (=> b!1247353 (= e!707616 (and e!707613 mapRes!48763))))

(declare-fun condMapEmpty!48763 () Bool)

(declare-fun mapDefault!48763 () ValueCell!14906)

(assert (=> b!1247353 (= condMapEmpty!48763 (= (arr!38717 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14906)) mapDefault!48763)))))

(declare-fun mapIsEmpty!48763 () Bool)

(assert (=> mapIsEmpty!48763 mapRes!48763))

(declare-fun b!1247354 () Bool)

(declare-fun res!832325 () Bool)

(assert (=> b!1247354 (=> (not res!832325) (not e!707617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80297 (_ BitVec 32)) Bool)

(assert (=> b!1247354 (= res!832325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104606 res!832324) b!1247352))

(assert (= (and b!1247352 res!832323) b!1247354))

(assert (= (and b!1247354 res!832325) b!1247349))

(assert (= (and b!1247353 condMapEmpty!48763) mapIsEmpty!48763))

(assert (= (and b!1247353 (not condMapEmpty!48763)) mapNonEmpty!48763))

(get-info :version)

(assert (= (and mapNonEmpty!48763 ((_ is ValueCellFull!14906) mapValue!48763)) b!1247351))

(assert (= (and b!1247353 ((_ is ValueCellFull!14906) mapDefault!48763)) b!1247350))

(assert (= start!104606 b!1247353))

(declare-fun m!1148423 () Bool)

(assert (=> mapNonEmpty!48763 m!1148423))

(declare-fun m!1148425 () Bool)

(assert (=> start!104606 m!1148425))

(declare-fun m!1148427 () Bool)

(assert (=> start!104606 m!1148427))

(declare-fun m!1148429 () Bool)

(assert (=> start!104606 m!1148429))

(declare-fun m!1148431 () Bool)

(assert (=> b!1247349 m!1148431))

(declare-fun m!1148433 () Bool)

(assert (=> b!1247354 m!1148433))

(check-sat (not mapNonEmpty!48763) (not b!1247354) (not start!104606) tp_is_empty!31339 (not b!1247349))
(check-sat)
