; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104712 () Bool)

(assert start!104712)

(declare-fun b_free!26529 () Bool)

(declare-fun b_next!26529 () Bool)

(assert (=> start!104712 (= b_free!26529 (not b_next!26529))))

(declare-fun tp!93073 () Bool)

(declare-fun b_and!44293 () Bool)

(assert (=> start!104712 (= tp!93073 b_and!44293)))

(declare-fun b!1248371 () Bool)

(declare-fun res!832871 () Bool)

(declare-fun e!708377 () Bool)

(assert (=> b!1248371 (=> (not res!832871) (not e!708377))))

(declare-datatypes ((array!80554 0))(
  ( (array!80555 (arr!38845 (Array (_ BitVec 32) (_ BitVec 64))) (size!39381 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80554)

(declare-datatypes ((List!27571 0))(
  ( (Nil!27568) (Cons!27567 (h!28776 (_ BitVec 64)) (t!41040 List!27571)) )
))
(declare-fun arrayNoDuplicates!0 (array!80554 (_ BitVec 32) List!27571) Bool)

(assert (=> b!1248371 (= res!832871 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27568))))

(declare-fun res!832870 () Bool)

(assert (=> start!104712 (=> (not res!832870) (not e!708377))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104712 (= res!832870 (validMask!0 mask!1466))))

(assert (=> start!104712 e!708377))

(assert (=> start!104712 true))

(assert (=> start!104712 tp!93073))

(declare-fun tp_is_empty!31431 () Bool)

(assert (=> start!104712 tp_is_empty!31431))

(declare-fun array_inv!29649 (array!80554) Bool)

(assert (=> start!104712 (array_inv!29649 _keys!1118)))

(declare-datatypes ((V!47273 0))(
  ( (V!47274 (val!15778 Int)) )
))
(declare-datatypes ((ValueCell!14952 0))(
  ( (ValueCellFull!14952 (v!18474 V!47273)) (EmptyCell!14952) )
))
(declare-datatypes ((array!80556 0))(
  ( (array!80557 (arr!38846 (Array (_ BitVec 32) ValueCell!14952)) (size!39382 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80556)

(declare-fun e!708375 () Bool)

(declare-fun array_inv!29650 (array!80556) Bool)

(assert (=> start!104712 (and (array_inv!29650 _values!914) e!708375)))

(declare-fun b!1248372 () Bool)

(declare-fun res!832872 () Bool)

(assert (=> b!1248372 (=> (not res!832872) (not e!708377))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248372 (= res!832872 (and (= (size!39382 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39381 _keys!1118) (size!39382 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248373 () Bool)

(declare-fun res!832869 () Bool)

(assert (=> b!1248373 (=> (not res!832869) (not e!708377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80554 (_ BitVec 32)) Bool)

(assert (=> b!1248373 (= res!832869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48904 () Bool)

(declare-fun mapRes!48904 () Bool)

(assert (=> mapIsEmpty!48904 mapRes!48904))

(declare-fun mapNonEmpty!48904 () Bool)

(declare-fun tp!93074 () Bool)

(declare-fun e!708379 () Bool)

(assert (=> mapNonEmpty!48904 (= mapRes!48904 (and tp!93074 e!708379))))

(declare-fun mapRest!48904 () (Array (_ BitVec 32) ValueCell!14952))

(declare-fun mapKey!48904 () (_ BitVec 32))

(declare-fun mapValue!48904 () ValueCell!14952)

(assert (=> mapNonEmpty!48904 (= (arr!38846 _values!914) (store mapRest!48904 mapKey!48904 mapValue!48904))))

(declare-fun b!1248374 () Bool)

(declare-fun e!708378 () Bool)

(assert (=> b!1248374 (= e!708375 (and e!708378 mapRes!48904))))

(declare-fun condMapEmpty!48904 () Bool)

(declare-fun mapDefault!48904 () ValueCell!14952)

(assert (=> b!1248374 (= condMapEmpty!48904 (= (arr!38846 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14952)) mapDefault!48904)))))

(declare-fun b!1248375 () Bool)

(assert (=> b!1248375 (= e!708378 tp_is_empty!31431)))

(declare-fun b!1248376 () Bool)

(assert (=> b!1248376 (= e!708379 tp_is_empty!31431)))

(declare-fun b!1248377 () Bool)

(assert (=> b!1248377 (= e!708377 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20324 0))(
  ( (tuple2!20325 (_1!10173 (_ BitVec 64)) (_2!10173 V!47273)) )
))
(declare-datatypes ((List!27572 0))(
  ( (Nil!27569) (Cons!27568 (h!28777 tuple2!20324) (t!41041 List!27572)) )
))
(declare-datatypes ((ListLongMap!18197 0))(
  ( (ListLongMap!18198 (toList!9114 List!27572)) )
))
(declare-fun lt!563398 () ListLongMap!18197)

(declare-fun zeroValue!871 () V!47273)

(declare-fun minValueBefore!43 () V!47273)

(declare-fun getCurrentListMapNoExtraKeys!5521 (array!80554 array!80556 (_ BitVec 32) (_ BitVec 32) V!47273 V!47273 (_ BitVec 32) Int) ListLongMap!18197)

(assert (=> b!1248377 (= lt!563398 (getCurrentListMapNoExtraKeys!5521 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104712 res!832870) b!1248372))

(assert (= (and b!1248372 res!832872) b!1248373))

(assert (= (and b!1248373 res!832869) b!1248371))

(assert (= (and b!1248371 res!832871) b!1248377))

(assert (= (and b!1248374 condMapEmpty!48904) mapIsEmpty!48904))

(assert (= (and b!1248374 (not condMapEmpty!48904)) mapNonEmpty!48904))

(get-info :version)

(assert (= (and mapNonEmpty!48904 ((_ is ValueCellFull!14952) mapValue!48904)) b!1248376))

(assert (= (and b!1248374 ((_ is ValueCellFull!14952) mapDefault!48904)) b!1248375))

(assert (= start!104712 b!1248374))

(declare-fun m!1149557 () Bool)

(assert (=> start!104712 m!1149557))

(declare-fun m!1149559 () Bool)

(assert (=> start!104712 m!1149559))

(declare-fun m!1149561 () Bool)

(assert (=> start!104712 m!1149561))

(declare-fun m!1149563 () Bool)

(assert (=> b!1248377 m!1149563))

(declare-fun m!1149565 () Bool)

(assert (=> b!1248371 m!1149565))

(declare-fun m!1149567 () Bool)

(assert (=> mapNonEmpty!48904 m!1149567))

(declare-fun m!1149569 () Bool)

(assert (=> b!1248373 m!1149569))

(check-sat (not start!104712) (not b!1248373) b_and!44293 (not b_next!26529) (not b!1248377) (not b!1248371) tp_is_empty!31431 (not mapNonEmpty!48904))
(check-sat b_and!44293 (not b_next!26529))
