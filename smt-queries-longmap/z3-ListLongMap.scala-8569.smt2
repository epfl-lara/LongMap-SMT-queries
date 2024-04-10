; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104624 () Bool)

(assert start!104624)

(declare-fun b!1247557 () Bool)

(declare-fun e!707764 () Bool)

(declare-fun tp_is_empty!31353 () Bool)

(assert (=> b!1247557 (= e!707764 tp_is_empty!31353)))

(declare-fun b!1247558 () Bool)

(declare-fun e!707766 () Bool)

(declare-fun mapRes!48784 () Bool)

(assert (=> b!1247558 (= e!707766 (and e!707764 mapRes!48784))))

(declare-fun condMapEmpty!48784 () Bool)

(declare-datatypes ((V!47169 0))(
  ( (V!47170 (val!15739 Int)) )
))
(declare-datatypes ((ValueCell!14913 0))(
  ( (ValueCellFull!14913 (v!18435 V!47169)) (EmptyCell!14913) )
))
(declare-datatypes ((array!80402 0))(
  ( (array!80403 (arr!38770 (Array (_ BitVec 32) ValueCell!14913)) (size!39306 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80402)

(declare-fun mapDefault!48784 () ValueCell!14913)

(assert (=> b!1247558 (= condMapEmpty!48784 (= (arr!38770 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14913)) mapDefault!48784)))))

(declare-fun b!1247559 () Bool)

(declare-fun e!707765 () Bool)

(assert (=> b!1247559 (= e!707765 false)))

(declare-fun lt!563281 () Bool)

(declare-datatypes ((array!80404 0))(
  ( (array!80405 (arr!38771 (Array (_ BitVec 32) (_ BitVec 64))) (size!39307 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80404)

(declare-datatypes ((List!27531 0))(
  ( (Nil!27528) (Cons!27527 (h!28736 (_ BitVec 64)) (t!41000 List!27531)) )
))
(declare-fun arrayNoDuplicates!0 (array!80404 (_ BitVec 32) List!27531) Bool)

(assert (=> b!1247559 (= lt!563281 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27528))))

(declare-fun res!832428 () Bool)

(assert (=> start!104624 (=> (not res!832428) (not e!707765))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104624 (= res!832428 (validMask!0 mask!1466))))

(assert (=> start!104624 e!707765))

(assert (=> start!104624 true))

(declare-fun array_inv!29603 (array!80404) Bool)

(assert (=> start!104624 (array_inv!29603 _keys!1118)))

(declare-fun array_inv!29604 (array!80402) Bool)

(assert (=> start!104624 (and (array_inv!29604 _values!914) e!707766)))

(declare-fun b!1247560 () Bool)

(declare-fun e!707767 () Bool)

(assert (=> b!1247560 (= e!707767 tp_is_empty!31353)))

(declare-fun b!1247561 () Bool)

(declare-fun res!832427 () Bool)

(assert (=> b!1247561 (=> (not res!832427) (not e!707765))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247561 (= res!832427 (and (= (size!39306 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39307 _keys!1118) (size!39306 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48784 () Bool)

(assert (=> mapIsEmpty!48784 mapRes!48784))

(declare-fun mapNonEmpty!48784 () Bool)

(declare-fun tp!92885 () Bool)

(assert (=> mapNonEmpty!48784 (= mapRes!48784 (and tp!92885 e!707767))))

(declare-fun mapValue!48784 () ValueCell!14913)

(declare-fun mapRest!48784 () (Array (_ BitVec 32) ValueCell!14913))

(declare-fun mapKey!48784 () (_ BitVec 32))

(assert (=> mapNonEmpty!48784 (= (arr!38770 _values!914) (store mapRest!48784 mapKey!48784 mapValue!48784))))

(declare-fun b!1247562 () Bool)

(declare-fun res!832426 () Bool)

(assert (=> b!1247562 (=> (not res!832426) (not e!707765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80404 (_ BitVec 32)) Bool)

(assert (=> b!1247562 (= res!832426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104624 res!832428) b!1247561))

(assert (= (and b!1247561 res!832427) b!1247562))

(assert (= (and b!1247562 res!832426) b!1247559))

(assert (= (and b!1247558 condMapEmpty!48784) mapIsEmpty!48784))

(assert (= (and b!1247558 (not condMapEmpty!48784)) mapNonEmpty!48784))

(get-info :version)

(assert (= (and mapNonEmpty!48784 ((_ is ValueCellFull!14913) mapValue!48784)) b!1247560))

(assert (= (and b!1247558 ((_ is ValueCellFull!14913) mapDefault!48784)) b!1247557))

(assert (= start!104624 b!1247558))

(declare-fun m!1149027 () Bool)

(assert (=> b!1247559 m!1149027))

(declare-fun m!1149029 () Bool)

(assert (=> start!104624 m!1149029))

(declare-fun m!1149031 () Bool)

(assert (=> start!104624 m!1149031))

(declare-fun m!1149033 () Bool)

(assert (=> start!104624 m!1149033))

(declare-fun m!1149035 () Bool)

(assert (=> mapNonEmpty!48784 m!1149035))

(declare-fun m!1149037 () Bool)

(assert (=> b!1247562 m!1149037))

(check-sat (not b!1247562) (not start!104624) (not mapNonEmpty!48784) tp_is_empty!31353 (not b!1247559))
(check-sat)
