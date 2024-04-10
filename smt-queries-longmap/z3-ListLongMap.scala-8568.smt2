; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104618 () Bool)

(assert start!104618)

(declare-fun b!1247503 () Bool)

(declare-fun res!832400 () Bool)

(declare-fun e!707722 () Bool)

(assert (=> b!1247503 (=> (not res!832400) (not e!707722))))

(declare-datatypes ((array!80390 0))(
  ( (array!80391 (arr!38764 (Array (_ BitVec 32) (_ BitVec 64))) (size!39300 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80390)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80390 (_ BitVec 32)) Bool)

(assert (=> b!1247503 (= res!832400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247504 () Bool)

(declare-fun e!707721 () Bool)

(declare-fun e!707720 () Bool)

(declare-fun mapRes!48775 () Bool)

(assert (=> b!1247504 (= e!707721 (and e!707720 mapRes!48775))))

(declare-fun condMapEmpty!48775 () Bool)

(declare-datatypes ((V!47161 0))(
  ( (V!47162 (val!15736 Int)) )
))
(declare-datatypes ((ValueCell!14910 0))(
  ( (ValueCellFull!14910 (v!18432 V!47161)) (EmptyCell!14910) )
))
(declare-datatypes ((array!80392 0))(
  ( (array!80393 (arr!38765 (Array (_ BitVec 32) ValueCell!14910)) (size!39301 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80392)

(declare-fun mapDefault!48775 () ValueCell!14910)

(assert (=> b!1247504 (= condMapEmpty!48775 (= (arr!38765 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14910)) mapDefault!48775)))))

(declare-fun res!832401 () Bool)

(assert (=> start!104618 (=> (not res!832401) (not e!707722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104618 (= res!832401 (validMask!0 mask!1466))))

(assert (=> start!104618 e!707722))

(assert (=> start!104618 true))

(declare-fun array_inv!29599 (array!80390) Bool)

(assert (=> start!104618 (array_inv!29599 _keys!1118)))

(declare-fun array_inv!29600 (array!80392) Bool)

(assert (=> start!104618 (and (array_inv!29600 _values!914) e!707721)))

(declare-fun b!1247505 () Bool)

(assert (=> b!1247505 (= e!707722 false)))

(declare-fun lt!563272 () Bool)

(declare-datatypes ((List!27529 0))(
  ( (Nil!27526) (Cons!27525 (h!28734 (_ BitVec 64)) (t!40998 List!27529)) )
))
(declare-fun arrayNoDuplicates!0 (array!80390 (_ BitVec 32) List!27529) Bool)

(assert (=> b!1247505 (= lt!563272 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27526))))

(declare-fun b!1247506 () Bool)

(declare-fun e!707719 () Bool)

(declare-fun tp_is_empty!31347 () Bool)

(assert (=> b!1247506 (= e!707719 tp_is_empty!31347)))

(declare-fun mapIsEmpty!48775 () Bool)

(assert (=> mapIsEmpty!48775 mapRes!48775))

(declare-fun mapNonEmpty!48775 () Bool)

(declare-fun tp!92876 () Bool)

(assert (=> mapNonEmpty!48775 (= mapRes!48775 (and tp!92876 e!707719))))

(declare-fun mapKey!48775 () (_ BitVec 32))

(declare-fun mapRest!48775 () (Array (_ BitVec 32) ValueCell!14910))

(declare-fun mapValue!48775 () ValueCell!14910)

(assert (=> mapNonEmpty!48775 (= (arr!38765 _values!914) (store mapRest!48775 mapKey!48775 mapValue!48775))))

(declare-fun b!1247507 () Bool)

(declare-fun res!832399 () Bool)

(assert (=> b!1247507 (=> (not res!832399) (not e!707722))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247507 (= res!832399 (and (= (size!39301 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39300 _keys!1118) (size!39301 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247508 () Bool)

(assert (=> b!1247508 (= e!707720 tp_is_empty!31347)))

(assert (= (and start!104618 res!832401) b!1247507))

(assert (= (and b!1247507 res!832399) b!1247503))

(assert (= (and b!1247503 res!832400) b!1247505))

(assert (= (and b!1247504 condMapEmpty!48775) mapIsEmpty!48775))

(assert (= (and b!1247504 (not condMapEmpty!48775)) mapNonEmpty!48775))

(get-info :version)

(assert (= (and mapNonEmpty!48775 ((_ is ValueCellFull!14910) mapValue!48775)) b!1247506))

(assert (= (and b!1247504 ((_ is ValueCellFull!14910) mapDefault!48775)) b!1247508))

(assert (= start!104618 b!1247504))

(declare-fun m!1148991 () Bool)

(assert (=> b!1247503 m!1148991))

(declare-fun m!1148993 () Bool)

(assert (=> start!104618 m!1148993))

(declare-fun m!1148995 () Bool)

(assert (=> start!104618 m!1148995))

(declare-fun m!1148997 () Bool)

(assert (=> start!104618 m!1148997))

(declare-fun m!1148999 () Bool)

(assert (=> b!1247505 m!1148999))

(declare-fun m!1149001 () Bool)

(assert (=> mapNonEmpty!48775 m!1149001))

(check-sat (not b!1247505) tp_is_empty!31347 (not b!1247503) (not mapNonEmpty!48775) (not start!104618))
(check-sat)
