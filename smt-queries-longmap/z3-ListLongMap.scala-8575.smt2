; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104664 () Bool)

(assert start!104664)

(declare-fun b_free!26485 () Bool)

(declare-fun b_next!26485 () Bool)

(assert (=> start!104664 (= b_free!26485 (not b_next!26485))))

(declare-fun tp!92942 () Bool)

(declare-fun b_and!44231 () Bool)

(assert (=> start!104664 (= tp!92942 b_and!44231)))

(declare-fun res!832566 () Bool)

(declare-fun e!708000 () Bool)

(assert (=> start!104664 (=> (not res!832566) (not e!708000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104664 (= res!832566 (validMask!0 mask!1466))))

(assert (=> start!104664 e!708000))

(assert (=> start!104664 true))

(assert (=> start!104664 tp!92942))

(declare-fun tp_is_empty!31387 () Bool)

(assert (=> start!104664 tp_is_empty!31387))

(declare-datatypes ((array!80389 0))(
  ( (array!80390 (arr!38763 (Array (_ BitVec 32) (_ BitVec 64))) (size!39301 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80389)

(declare-fun array_inv!29719 (array!80389) Bool)

(assert (=> start!104664 (array_inv!29719 _keys!1118)))

(declare-datatypes ((V!47215 0))(
  ( (V!47216 (val!15756 Int)) )
))
(declare-datatypes ((ValueCell!14930 0))(
  ( (ValueCellFull!14930 (v!18451 V!47215)) (EmptyCell!14930) )
))
(declare-datatypes ((array!80391 0))(
  ( (array!80392 (arr!38764 (Array (_ BitVec 32) ValueCell!14930)) (size!39302 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80391)

(declare-fun e!708002 () Bool)

(declare-fun array_inv!29720 (array!80391) Bool)

(assert (=> start!104664 (and (array_inv!29720 _values!914) e!708002)))

(declare-fun mapIsEmpty!48838 () Bool)

(declare-fun mapRes!48838 () Bool)

(assert (=> mapIsEmpty!48838 mapRes!48838))

(declare-fun b!1247827 () Bool)

(declare-fun res!832567 () Bool)

(assert (=> b!1247827 (=> (not res!832567) (not e!708000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80389 (_ BitVec 32)) Bool)

(assert (=> b!1247827 (= res!832567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247828 () Bool)

(declare-fun e!708004 () Bool)

(assert (=> b!1247828 (= e!708004 tp_is_empty!31387)))

(declare-fun b!1247829 () Bool)

(declare-fun res!832568 () Bool)

(assert (=> b!1247829 (=> (not res!832568) (not e!708000))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247829 (= res!832568 (and (= (size!39302 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39301 _keys!1118) (size!39302 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247830 () Bool)

(assert (=> b!1247830 (= e!708000 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20378 0))(
  ( (tuple2!20379 (_1!10200 (_ BitVec 64)) (_2!10200 V!47215)) )
))
(declare-datatypes ((List!27605 0))(
  ( (Nil!27602) (Cons!27601 (h!28810 tuple2!20378) (t!41065 List!27605)) )
))
(declare-datatypes ((ListLongMap!18251 0))(
  ( (ListLongMap!18252 (toList!9141 List!27605)) )
))
(declare-fun lt!563153 () ListLongMap!18251)

(declare-fun zeroValue!871 () V!47215)

(declare-fun minValueBefore!43 () V!47215)

(declare-fun getCurrentListMapNoExtraKeys!5558 (array!80389 array!80391 (_ BitVec 32) (_ BitVec 32) V!47215 V!47215 (_ BitVec 32) Int) ListLongMap!18251)

(assert (=> b!1247830 (= lt!563153 (getCurrentListMapNoExtraKeys!5558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48838 () Bool)

(declare-fun tp!92941 () Bool)

(assert (=> mapNonEmpty!48838 (= mapRes!48838 (and tp!92941 e!708004))))

(declare-fun mapValue!48838 () ValueCell!14930)

(declare-fun mapRest!48838 () (Array (_ BitVec 32) ValueCell!14930))

(declare-fun mapKey!48838 () (_ BitVec 32))

(assert (=> mapNonEmpty!48838 (= (arr!38764 _values!914) (store mapRest!48838 mapKey!48838 mapValue!48838))))

(declare-fun b!1247831 () Bool)

(declare-fun e!708003 () Bool)

(assert (=> b!1247831 (= e!708002 (and e!708003 mapRes!48838))))

(declare-fun condMapEmpty!48838 () Bool)

(declare-fun mapDefault!48838 () ValueCell!14930)

(assert (=> b!1247831 (= condMapEmpty!48838 (= (arr!38764 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14930)) mapDefault!48838)))))

(declare-fun b!1247832 () Bool)

(assert (=> b!1247832 (= e!708003 tp_is_empty!31387)))

(declare-fun b!1247833 () Bool)

(declare-fun res!832565 () Bool)

(assert (=> b!1247833 (=> (not res!832565) (not e!708000))))

(declare-datatypes ((List!27606 0))(
  ( (Nil!27603) (Cons!27602 (h!28811 (_ BitVec 64)) (t!41066 List!27606)) )
))
(declare-fun arrayNoDuplicates!0 (array!80389 (_ BitVec 32) List!27606) Bool)

(assert (=> b!1247833 (= res!832565 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27603))))

(assert (= (and start!104664 res!832566) b!1247829))

(assert (= (and b!1247829 res!832568) b!1247827))

(assert (= (and b!1247827 res!832567) b!1247833))

(assert (= (and b!1247833 res!832565) b!1247830))

(assert (= (and b!1247831 condMapEmpty!48838) mapIsEmpty!48838))

(assert (= (and b!1247831 (not condMapEmpty!48838)) mapNonEmpty!48838))

(get-info :version)

(assert (= (and mapNonEmpty!48838 ((_ is ValueCellFull!14930) mapValue!48838)) b!1247828))

(assert (= (and b!1247831 ((_ is ValueCellFull!14930) mapDefault!48838)) b!1247832))

(assert (= start!104664 b!1247831))

(declare-fun m!1148729 () Bool)

(assert (=> b!1247830 m!1148729))

(declare-fun m!1148731 () Bool)

(assert (=> b!1247827 m!1148731))

(declare-fun m!1148733 () Bool)

(assert (=> b!1247833 m!1148733))

(declare-fun m!1148735 () Bool)

(assert (=> mapNonEmpty!48838 m!1148735))

(declare-fun m!1148737 () Bool)

(assert (=> start!104664 m!1148737))

(declare-fun m!1148739 () Bool)

(assert (=> start!104664 m!1148739))

(declare-fun m!1148741 () Bool)

(assert (=> start!104664 m!1148741))

(check-sat (not mapNonEmpty!48838) (not b!1247833) (not start!104664) b_and!44231 (not b!1247830) (not b_next!26485) (not b!1247827) tp_is_empty!31387)
(check-sat b_and!44231 (not b_next!26485))
