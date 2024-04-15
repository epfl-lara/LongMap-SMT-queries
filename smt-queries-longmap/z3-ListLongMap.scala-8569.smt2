; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104618 () Bool)

(assert start!104618)

(declare-fun mapNonEmpty!48781 () Bool)

(declare-fun mapRes!48781 () Bool)

(declare-fun tp!92882 () Bool)

(declare-fun e!707704 () Bool)

(assert (=> mapNonEmpty!48781 (= mapRes!48781 (and tp!92882 e!707704))))

(declare-datatypes ((V!47167 0))(
  ( (V!47168 (val!15738 Int)) )
))
(declare-datatypes ((ValueCell!14912 0))(
  ( (ValueCellFull!14912 (v!18433 V!47167)) (EmptyCell!14912) )
))
(declare-fun mapRest!48781 () (Array (_ BitVec 32) ValueCell!14912))

(declare-fun mapKey!48781 () (_ BitVec 32))

(declare-fun mapValue!48781 () ValueCell!14912)

(declare-datatypes ((array!80319 0))(
  ( (array!80320 (arr!38729 (Array (_ BitVec 32) ValueCell!14912)) (size!39267 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80319)

(assert (=> mapNonEmpty!48781 (= (arr!38729 _values!914) (store mapRest!48781 mapKey!48781 mapValue!48781))))

(declare-fun b!1247457 () Bool)

(declare-fun res!832377 () Bool)

(declare-fun e!707706 () Bool)

(assert (=> b!1247457 (=> (not res!832377) (not e!707706))))

(declare-datatypes ((array!80321 0))(
  ( (array!80322 (arr!38730 (Array (_ BitVec 32) (_ BitVec 64))) (size!39268 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80321)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80321 (_ BitVec 32)) Bool)

(assert (=> b!1247457 (= res!832377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48781 () Bool)

(assert (=> mapIsEmpty!48781 mapRes!48781))

(declare-fun b!1247458 () Bool)

(declare-fun e!707707 () Bool)

(declare-fun tp_is_empty!31351 () Bool)

(assert (=> b!1247458 (= e!707707 tp_is_empty!31351)))

(declare-fun b!1247459 () Bool)

(assert (=> b!1247459 (= e!707704 tp_is_empty!31351)))

(declare-fun b!1247460 () Bool)

(declare-fun e!707705 () Bool)

(assert (=> b!1247460 (= e!707705 (and e!707707 mapRes!48781))))

(declare-fun condMapEmpty!48781 () Bool)

(declare-fun mapDefault!48781 () ValueCell!14912)

(assert (=> b!1247460 (= condMapEmpty!48781 (= (arr!38729 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14912)) mapDefault!48781)))))

(declare-fun res!832378 () Bool)

(assert (=> start!104618 (=> (not res!832378) (not e!707706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104618 (= res!832378 (validMask!0 mask!1466))))

(assert (=> start!104618 e!707706))

(assert (=> start!104618 true))

(declare-fun array_inv!29695 (array!80321) Bool)

(assert (=> start!104618 (array_inv!29695 _keys!1118)))

(declare-fun array_inv!29696 (array!80319) Bool)

(assert (=> start!104618 (and (array_inv!29696 _values!914) e!707705)))

(declare-fun b!1247461 () Bool)

(assert (=> b!1247461 (= e!707706 false)))

(declare-fun lt!563099 () Bool)

(declare-datatypes ((List!27595 0))(
  ( (Nil!27592) (Cons!27591 (h!28800 (_ BitVec 64)) (t!41055 List!27595)) )
))
(declare-fun arrayNoDuplicates!0 (array!80321 (_ BitVec 32) List!27595) Bool)

(assert (=> b!1247461 (= lt!563099 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27592))))

(declare-fun b!1247462 () Bool)

(declare-fun res!832379 () Bool)

(assert (=> b!1247462 (=> (not res!832379) (not e!707706))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247462 (= res!832379 (and (= (size!39267 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39268 _keys!1118) (size!39267 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104618 res!832378) b!1247462))

(assert (= (and b!1247462 res!832379) b!1247457))

(assert (= (and b!1247457 res!832377) b!1247461))

(assert (= (and b!1247460 condMapEmpty!48781) mapIsEmpty!48781))

(assert (= (and b!1247460 (not condMapEmpty!48781)) mapNonEmpty!48781))

(get-info :version)

(assert (= (and mapNonEmpty!48781 ((_ is ValueCellFull!14912) mapValue!48781)) b!1247459))

(assert (= (and b!1247460 ((_ is ValueCellFull!14912) mapDefault!48781)) b!1247458))

(assert (= start!104618 b!1247460))

(declare-fun m!1148495 () Bool)

(assert (=> mapNonEmpty!48781 m!1148495))

(declare-fun m!1148497 () Bool)

(assert (=> b!1247457 m!1148497))

(declare-fun m!1148499 () Bool)

(assert (=> start!104618 m!1148499))

(declare-fun m!1148501 () Bool)

(assert (=> start!104618 m!1148501))

(declare-fun m!1148503 () Bool)

(assert (=> start!104618 m!1148503))

(declare-fun m!1148505 () Bool)

(assert (=> b!1247461 m!1148505))

(check-sat (not start!104618) tp_is_empty!31351 (not mapNonEmpty!48781) (not b!1247457) (not b!1247461))
(check-sat)
