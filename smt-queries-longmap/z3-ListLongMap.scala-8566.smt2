; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104600 () Bool)

(assert start!104600)

(declare-fun b!1247296 () Bool)

(declare-fun e!707569 () Bool)

(declare-fun tp_is_empty!31333 () Bool)

(assert (=> b!1247296 (= e!707569 tp_is_empty!31333)))

(declare-fun mapIsEmpty!48754 () Bool)

(declare-fun mapRes!48754 () Bool)

(assert (=> mapIsEmpty!48754 mapRes!48754))

(declare-fun b!1247297 () Bool)

(declare-fun res!832298 () Bool)

(declare-fun e!707572 () Bool)

(assert (=> b!1247297 (=> (not res!832298) (not e!707572))))

(declare-datatypes ((array!80283 0))(
  ( (array!80284 (arr!38711 (Array (_ BitVec 32) (_ BitVec 64))) (size!39249 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80283)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80283 (_ BitVec 32)) Bool)

(assert (=> b!1247297 (= res!832298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247298 () Bool)

(assert (=> b!1247298 (= e!707572 false)))

(declare-fun lt!563072 () Bool)

(declare-datatypes ((List!27588 0))(
  ( (Nil!27585) (Cons!27584 (h!28793 (_ BitVec 64)) (t!41048 List!27588)) )
))
(declare-fun arrayNoDuplicates!0 (array!80283 (_ BitVec 32) List!27588) Bool)

(assert (=> b!1247298 (= lt!563072 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27585))))

(declare-fun mapNonEmpty!48754 () Bool)

(declare-fun tp!92855 () Bool)

(assert (=> mapNonEmpty!48754 (= mapRes!48754 (and tp!92855 e!707569))))

(declare-fun mapKey!48754 () (_ BitVec 32))

(declare-datatypes ((V!47143 0))(
  ( (V!47144 (val!15729 Int)) )
))
(declare-datatypes ((ValueCell!14903 0))(
  ( (ValueCellFull!14903 (v!18424 V!47143)) (EmptyCell!14903) )
))
(declare-fun mapRest!48754 () (Array (_ BitVec 32) ValueCell!14903))

(declare-datatypes ((array!80285 0))(
  ( (array!80286 (arr!38712 (Array (_ BitVec 32) ValueCell!14903)) (size!39250 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80285)

(declare-fun mapValue!48754 () ValueCell!14903)

(assert (=> mapNonEmpty!48754 (= (arr!38712 _values!914) (store mapRest!48754 mapKey!48754 mapValue!48754))))

(declare-fun res!832296 () Bool)

(assert (=> start!104600 (=> (not res!832296) (not e!707572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104600 (= res!832296 (validMask!0 mask!1466))))

(assert (=> start!104600 e!707572))

(assert (=> start!104600 true))

(declare-fun array_inv!29681 (array!80283) Bool)

(assert (=> start!104600 (array_inv!29681 _keys!1118)))

(declare-fun e!707571 () Bool)

(declare-fun array_inv!29682 (array!80285) Bool)

(assert (=> start!104600 (and (array_inv!29682 _values!914) e!707571)))

(declare-fun b!1247295 () Bool)

(declare-fun e!707570 () Bool)

(assert (=> b!1247295 (= e!707570 tp_is_empty!31333)))

(declare-fun b!1247299 () Bool)

(assert (=> b!1247299 (= e!707571 (and e!707570 mapRes!48754))))

(declare-fun condMapEmpty!48754 () Bool)

(declare-fun mapDefault!48754 () ValueCell!14903)

(assert (=> b!1247299 (= condMapEmpty!48754 (= (arr!38712 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14903)) mapDefault!48754)))))

(declare-fun b!1247300 () Bool)

(declare-fun res!832297 () Bool)

(assert (=> b!1247300 (=> (not res!832297) (not e!707572))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247300 (= res!832297 (and (= (size!39250 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39249 _keys!1118) (size!39250 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104600 res!832296) b!1247300))

(assert (= (and b!1247300 res!832297) b!1247297))

(assert (= (and b!1247297 res!832298) b!1247298))

(assert (= (and b!1247299 condMapEmpty!48754) mapIsEmpty!48754))

(assert (= (and b!1247299 (not condMapEmpty!48754)) mapNonEmpty!48754))

(get-info :version)

(assert (= (and mapNonEmpty!48754 ((_ is ValueCellFull!14903) mapValue!48754)) b!1247296))

(assert (= (and b!1247299 ((_ is ValueCellFull!14903) mapDefault!48754)) b!1247295))

(assert (= start!104600 b!1247299))

(declare-fun m!1148387 () Bool)

(assert (=> b!1247297 m!1148387))

(declare-fun m!1148389 () Bool)

(assert (=> b!1247298 m!1148389))

(declare-fun m!1148391 () Bool)

(assert (=> mapNonEmpty!48754 m!1148391))

(declare-fun m!1148393 () Bool)

(assert (=> start!104600 m!1148393))

(declare-fun m!1148395 () Bool)

(assert (=> start!104600 m!1148395))

(declare-fun m!1148397 () Bool)

(assert (=> start!104600 m!1148397))

(check-sat (not start!104600) (not mapNonEmpty!48754) (not b!1247297) tp_is_empty!31333 (not b!1247298))
(check-sat)
