; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77654 () Bool)

(assert start!77654)

(declare-fun mapIsEmpty!29458 () Bool)

(declare-fun mapRes!29458 () Bool)

(assert (=> mapIsEmpty!29458 mapRes!29458))

(declare-fun b!903859 () Bool)

(declare-fun e!506415 () Bool)

(declare-fun e!506412 () Bool)

(assert (=> b!903859 (= e!506415 (and e!506412 mapRes!29458))))

(declare-fun condMapEmpty!29458 () Bool)

(declare-datatypes ((V!29631 0))(
  ( (V!29632 (val!9300 Int)) )
))
(declare-datatypes ((ValueCell!8768 0))(
  ( (ValueCellFull!8768 (v!11802 V!29631)) (EmptyCell!8768) )
))
(declare-datatypes ((array!53093 0))(
  ( (array!53094 (arr!25502 (Array (_ BitVec 32) ValueCell!8768)) (size!25962 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53093)

(declare-fun mapDefault!29458 () ValueCell!8768)

(assert (=> b!903859 (= condMapEmpty!29458 (= (arr!25502 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8768)) mapDefault!29458)))))

(declare-fun b!903860 () Bool)

(declare-fun e!506411 () Bool)

(assert (=> b!903860 (= e!506411 false)))

(declare-fun lt!408304 () Bool)

(declare-datatypes ((array!53095 0))(
  ( (array!53096 (arr!25503 (Array (_ BitVec 32) (_ BitVec 64))) (size!25963 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53095)

(declare-datatypes ((List!17859 0))(
  ( (Nil!17856) (Cons!17855 (h!19007 (_ BitVec 64)) (t!25234 List!17859)) )
))
(declare-fun arrayNoDuplicates!0 (array!53095 (_ BitVec 32) List!17859) Bool)

(assert (=> b!903860 (= lt!408304 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17856))))

(declare-fun b!903861 () Bool)

(declare-fun tp_is_empty!18499 () Bool)

(assert (=> b!903861 (= e!506412 tp_is_empty!18499)))

(declare-fun b!903862 () Bool)

(declare-fun e!506414 () Bool)

(assert (=> b!903862 (= e!506414 tp_is_empty!18499)))

(declare-fun res!609618 () Bool)

(assert (=> start!77654 (=> (not res!609618) (not e!506411))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77654 (= res!609618 (validMask!0 mask!1756))))

(assert (=> start!77654 e!506411))

(assert (=> start!77654 true))

(declare-fun array_inv!20052 (array!53093) Bool)

(assert (=> start!77654 (and (array_inv!20052 _values!1152) e!506415)))

(declare-fun array_inv!20053 (array!53095) Bool)

(assert (=> start!77654 (array_inv!20053 _keys!1386)))

(declare-fun b!903863 () Bool)

(declare-fun res!609619 () Bool)

(assert (=> b!903863 (=> (not res!609619) (not e!506411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53095 (_ BitVec 32)) Bool)

(assert (=> b!903863 (= res!609619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903864 () Bool)

(declare-fun res!609617 () Bool)

(assert (=> b!903864 (=> (not res!609617) (not e!506411))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903864 (= res!609617 (and (= (size!25962 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25963 _keys!1386) (size!25962 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29458 () Bool)

(declare-fun tp!56518 () Bool)

(assert (=> mapNonEmpty!29458 (= mapRes!29458 (and tp!56518 e!506414))))

(declare-fun mapValue!29458 () ValueCell!8768)

(declare-fun mapRest!29458 () (Array (_ BitVec 32) ValueCell!8768))

(declare-fun mapKey!29458 () (_ BitVec 32))

(assert (=> mapNonEmpty!29458 (= (arr!25502 _values!1152) (store mapRest!29458 mapKey!29458 mapValue!29458))))

(assert (= (and start!77654 res!609618) b!903864))

(assert (= (and b!903864 res!609617) b!903863))

(assert (= (and b!903863 res!609619) b!903860))

(assert (= (and b!903859 condMapEmpty!29458) mapIsEmpty!29458))

(assert (= (and b!903859 (not condMapEmpty!29458)) mapNonEmpty!29458))

(get-info :version)

(assert (= (and mapNonEmpty!29458 ((_ is ValueCellFull!8768) mapValue!29458)) b!903862))

(assert (= (and b!903859 ((_ is ValueCellFull!8768) mapDefault!29458)) b!903861))

(assert (= start!77654 b!903859))

(declare-fun m!840077 () Bool)

(assert (=> b!903860 m!840077))

(declare-fun m!840079 () Bool)

(assert (=> start!77654 m!840079))

(declare-fun m!840081 () Bool)

(assert (=> start!77654 m!840081))

(declare-fun m!840083 () Bool)

(assert (=> start!77654 m!840083))

(declare-fun m!840085 () Bool)

(assert (=> b!903863 m!840085))

(declare-fun m!840087 () Bool)

(assert (=> mapNonEmpty!29458 m!840087))

(check-sat tp_is_empty!18499 (not start!77654) (not b!903863) (not mapNonEmpty!29458) (not b!903860))
(check-sat)
