; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104778 () Bool)

(assert start!104778)

(declare-fun b_free!26587 () Bool)

(declare-fun b_next!26587 () Bool)

(assert (=> start!104778 (= b_free!26587 (not b_next!26587))))

(declare-fun tp!93250 () Bool)

(declare-fun b_and!44337 () Bool)

(assert (=> start!104778 (= tp!93250 b_and!44337)))

(declare-fun b!1248971 () Bool)

(declare-fun res!833204 () Bool)

(declare-fun e!708816 () Bool)

(assert (=> b!1248971 (=> (not res!833204) (not e!708816))))

(declare-datatypes ((array!80577 0))(
  ( (array!80578 (arr!38856 (Array (_ BitVec 32) (_ BitVec 64))) (size!39394 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80577)

(declare-datatypes ((List!27668 0))(
  ( (Nil!27665) (Cons!27664 (h!28873 (_ BitVec 64)) (t!41130 List!27668)) )
))
(declare-fun arrayNoDuplicates!0 (array!80577 (_ BitVec 32) List!27668) Bool)

(assert (=> b!1248971 (= res!833204 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27665))))

(declare-fun res!833206 () Bool)

(assert (=> start!104778 (=> (not res!833206) (not e!708816))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104778 (= res!833206 (validMask!0 mask!1466))))

(assert (=> start!104778 e!708816))

(assert (=> start!104778 true))

(assert (=> start!104778 tp!93250))

(declare-fun tp_is_empty!31489 () Bool)

(assert (=> start!104778 tp_is_empty!31489))

(declare-fun array_inv!29789 (array!80577) Bool)

(assert (=> start!104778 (array_inv!29789 _keys!1118)))

(declare-datatypes ((V!47351 0))(
  ( (V!47352 (val!15807 Int)) )
))
(declare-datatypes ((ValueCell!14981 0))(
  ( (ValueCellFull!14981 (v!18502 V!47351)) (EmptyCell!14981) )
))
(declare-datatypes ((array!80579 0))(
  ( (array!80580 (arr!38857 (Array (_ BitVec 32) ValueCell!14981)) (size!39395 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80579)

(declare-fun e!708817 () Bool)

(declare-fun array_inv!29790 (array!80579) Bool)

(assert (=> start!104778 (and (array_inv!29790 _values!914) e!708817)))

(declare-fun mapNonEmpty!48994 () Bool)

(declare-fun mapRes!48994 () Bool)

(declare-fun tp!93251 () Bool)

(declare-fun e!708813 () Bool)

(assert (=> mapNonEmpty!48994 (= mapRes!48994 (and tp!93251 e!708813))))

(declare-fun mapRest!48994 () (Array (_ BitVec 32) ValueCell!14981))

(declare-fun mapValue!48994 () ValueCell!14981)

(declare-fun mapKey!48994 () (_ BitVec 32))

(assert (=> mapNonEmpty!48994 (= (arr!38857 _values!914) (store mapRest!48994 mapKey!48994 mapValue!48994))))

(declare-fun b!1248972 () Bool)

(declare-fun e!708814 () Bool)

(assert (=> b!1248972 (= e!708817 (and e!708814 mapRes!48994))))

(declare-fun condMapEmpty!48994 () Bool)

(declare-fun mapDefault!48994 () ValueCell!14981)

(assert (=> b!1248972 (= condMapEmpty!48994 (= (arr!38857 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14981)) mapDefault!48994)))))

(declare-fun b!1248973 () Bool)

(assert (=> b!1248973 (= e!708814 tp_is_empty!31489)))

(declare-fun mapIsEmpty!48994 () Bool)

(assert (=> mapIsEmpty!48994 mapRes!48994))

(declare-fun b!1248974 () Bool)

(declare-fun res!833207 () Bool)

(assert (=> b!1248974 (=> (not res!833207) (not e!708816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80577 (_ BitVec 32)) Bool)

(assert (=> b!1248974 (= res!833207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248975 () Bool)

(declare-fun res!833205 () Bool)

(assert (=> b!1248975 (=> (not res!833205) (not e!708816))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1248975 (= res!833205 (and (= (size!39395 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39394 _keys!1118) (size!39395 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248976 () Bool)

(assert (=> b!1248976 (= e!708816 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20440 0))(
  ( (tuple2!20441 (_1!10231 (_ BitVec 64)) (_2!10231 V!47351)) )
))
(declare-datatypes ((List!27669 0))(
  ( (Nil!27666) (Cons!27665 (h!28874 tuple2!20440) (t!41131 List!27669)) )
))
(declare-datatypes ((ListLongMap!18313 0))(
  ( (ListLongMap!18314 (toList!9172 List!27669)) )
))
(declare-fun lt!563411 () ListLongMap!18313)

(declare-fun minValueAfter!43 () V!47351)

(declare-fun zeroValue!871 () V!47351)

(declare-fun getCurrentListMapNoExtraKeys!5589 (array!80577 array!80579 (_ BitVec 32) (_ BitVec 32) V!47351 V!47351 (_ BitVec 32) Int) ListLongMap!18313)

(assert (=> b!1248976 (= lt!563411 (getCurrentListMapNoExtraKeys!5589 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!47351)

(declare-fun lt!563410 () ListLongMap!18313)

(assert (=> b!1248976 (= lt!563410 (getCurrentListMapNoExtraKeys!5589 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248977 () Bool)

(assert (=> b!1248977 (= e!708813 tp_is_empty!31489)))

(assert (= (and start!104778 res!833206) b!1248975))

(assert (= (and b!1248975 res!833205) b!1248974))

(assert (= (and b!1248974 res!833207) b!1248971))

(assert (= (and b!1248971 res!833204) b!1248976))

(assert (= (and b!1248972 condMapEmpty!48994) mapIsEmpty!48994))

(assert (= (and b!1248972 (not condMapEmpty!48994)) mapNonEmpty!48994))

(get-info :version)

(assert (= (and mapNonEmpty!48994 ((_ is ValueCellFull!14981) mapValue!48994)) b!1248977))

(assert (= (and b!1248972 ((_ is ValueCellFull!14981) mapDefault!48994)) b!1248973))

(assert (= start!104778 b!1248972))

(declare-fun m!1149535 () Bool)

(assert (=> mapNonEmpty!48994 m!1149535))

(declare-fun m!1149537 () Bool)

(assert (=> start!104778 m!1149537))

(declare-fun m!1149539 () Bool)

(assert (=> start!104778 m!1149539))

(declare-fun m!1149541 () Bool)

(assert (=> start!104778 m!1149541))

(declare-fun m!1149543 () Bool)

(assert (=> b!1248974 m!1149543))

(declare-fun m!1149545 () Bool)

(assert (=> b!1248976 m!1149545))

(declare-fun m!1149547 () Bool)

(assert (=> b!1248976 m!1149547))

(declare-fun m!1149549 () Bool)

(assert (=> b!1248971 m!1149549))

(check-sat (not b!1248971) (not b_next!26587) (not mapNonEmpty!48994) b_and!44337 (not start!104778) (not b!1248974) tp_is_empty!31489 (not b!1248976))
(check-sat b_and!44337 (not b_next!26587))
