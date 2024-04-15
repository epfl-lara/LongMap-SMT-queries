; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104772 () Bool)

(assert start!104772)

(declare-fun b_free!26581 () Bool)

(declare-fun b_next!26581 () Bool)

(assert (=> start!104772 (= b_free!26581 (not b_next!26581))))

(declare-fun tp!93233 () Bool)

(declare-fun b_and!44331 () Bool)

(assert (=> start!104772 (= tp!93233 b_and!44331)))

(declare-fun b!1248908 () Bool)

(declare-fun res!833169 () Bool)

(declare-fun e!708769 () Bool)

(assert (=> b!1248908 (=> (not res!833169) (not e!708769))))

(declare-datatypes ((array!80565 0))(
  ( (array!80566 (arr!38850 (Array (_ BitVec 32) (_ BitVec 64))) (size!39388 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80565)

(declare-datatypes ((List!27664 0))(
  ( (Nil!27661) (Cons!27660 (h!28869 (_ BitVec 64)) (t!41126 List!27664)) )
))
(declare-fun arrayNoDuplicates!0 (array!80565 (_ BitVec 32) List!27664) Bool)

(assert (=> b!1248908 (= res!833169 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27661))))

(declare-fun b!1248909 () Bool)

(declare-fun e!708768 () Bool)

(declare-fun e!708772 () Bool)

(declare-fun mapRes!48985 () Bool)

(assert (=> b!1248909 (= e!708768 (and e!708772 mapRes!48985))))

(declare-fun condMapEmpty!48985 () Bool)

(declare-datatypes ((V!47343 0))(
  ( (V!47344 (val!15804 Int)) )
))
(declare-datatypes ((ValueCell!14978 0))(
  ( (ValueCellFull!14978 (v!18499 V!47343)) (EmptyCell!14978) )
))
(declare-datatypes ((array!80567 0))(
  ( (array!80568 (arr!38851 (Array (_ BitVec 32) ValueCell!14978)) (size!39389 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80567)

(declare-fun mapDefault!48985 () ValueCell!14978)

(assert (=> b!1248909 (= condMapEmpty!48985 (= (arr!38851 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14978)) mapDefault!48985)))))

(declare-fun b!1248910 () Bool)

(declare-fun tp_is_empty!31483 () Bool)

(assert (=> b!1248910 (= e!708772 tp_is_empty!31483)))

(declare-fun b!1248912 () Bool)

(declare-fun res!833171 () Bool)

(assert (=> b!1248912 (=> (not res!833171) (not e!708769))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80565 (_ BitVec 32)) Bool)

(assert (=> b!1248912 (= res!833171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248913 () Bool)

(declare-fun e!708770 () Bool)

(assert (=> b!1248913 (= e!708770 tp_is_empty!31483)))

(declare-fun mapNonEmpty!48985 () Bool)

(declare-fun tp!93232 () Bool)

(assert (=> mapNonEmpty!48985 (= mapRes!48985 (and tp!93232 e!708770))))

(declare-fun mapKey!48985 () (_ BitVec 32))

(declare-fun mapValue!48985 () ValueCell!14978)

(declare-fun mapRest!48985 () (Array (_ BitVec 32) ValueCell!14978))

(assert (=> mapNonEmpty!48985 (= (arr!38851 _values!914) (store mapRest!48985 mapKey!48985 mapValue!48985))))

(declare-fun b!1248914 () Bool)

(declare-fun res!833170 () Bool)

(assert (=> b!1248914 (=> (not res!833170) (not e!708769))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248914 (= res!833170 (and (= (size!39389 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39388 _keys!1118) (size!39389 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48985 () Bool)

(assert (=> mapIsEmpty!48985 mapRes!48985))

(declare-fun res!833168 () Bool)

(assert (=> start!104772 (=> (not res!833168) (not e!708769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104772 (= res!833168 (validMask!0 mask!1466))))

(assert (=> start!104772 e!708769))

(assert (=> start!104772 true))

(assert (=> start!104772 tp!93233))

(assert (=> start!104772 tp_is_empty!31483))

(declare-fun array_inv!29783 (array!80565) Bool)

(assert (=> start!104772 (array_inv!29783 _keys!1118)))

(declare-fun array_inv!29784 (array!80567) Bool)

(assert (=> start!104772 (and (array_inv!29784 _values!914) e!708768)))

(declare-fun b!1248911 () Bool)

(assert (=> b!1248911 (= e!708769 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20436 0))(
  ( (tuple2!20437 (_1!10229 (_ BitVec 64)) (_2!10229 V!47343)) )
))
(declare-datatypes ((List!27665 0))(
  ( (Nil!27662) (Cons!27661 (h!28870 tuple2!20436) (t!41127 List!27665)) )
))
(declare-datatypes ((ListLongMap!18309 0))(
  ( (ListLongMap!18310 (toList!9170 List!27665)) )
))
(declare-fun lt!563392 () ListLongMap!18309)

(declare-fun minValueAfter!43 () V!47343)

(declare-fun zeroValue!871 () V!47343)

(declare-fun getCurrentListMapNoExtraKeys!5587 (array!80565 array!80567 (_ BitVec 32) (_ BitVec 32) V!47343 V!47343 (_ BitVec 32) Int) ListLongMap!18309)

(assert (=> b!1248911 (= lt!563392 (getCurrentListMapNoExtraKeys!5587 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563393 () ListLongMap!18309)

(declare-fun minValueBefore!43 () V!47343)

(assert (=> b!1248911 (= lt!563393 (getCurrentListMapNoExtraKeys!5587 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104772 res!833168) b!1248914))

(assert (= (and b!1248914 res!833170) b!1248912))

(assert (= (and b!1248912 res!833171) b!1248908))

(assert (= (and b!1248908 res!833169) b!1248911))

(assert (= (and b!1248909 condMapEmpty!48985) mapIsEmpty!48985))

(assert (= (and b!1248909 (not condMapEmpty!48985)) mapNonEmpty!48985))

(get-info :version)

(assert (= (and mapNonEmpty!48985 ((_ is ValueCellFull!14978) mapValue!48985)) b!1248913))

(assert (= (and b!1248909 ((_ is ValueCellFull!14978) mapDefault!48985)) b!1248910))

(assert (= start!104772 b!1248909))

(declare-fun m!1149487 () Bool)

(assert (=> mapNonEmpty!48985 m!1149487))

(declare-fun m!1149489 () Bool)

(assert (=> start!104772 m!1149489))

(declare-fun m!1149491 () Bool)

(assert (=> start!104772 m!1149491))

(declare-fun m!1149493 () Bool)

(assert (=> start!104772 m!1149493))

(declare-fun m!1149495 () Bool)

(assert (=> b!1248908 m!1149495))

(declare-fun m!1149497 () Bool)

(assert (=> b!1248911 m!1149497))

(declare-fun m!1149499 () Bool)

(assert (=> b!1248911 m!1149499))

(declare-fun m!1149501 () Bool)

(assert (=> b!1248912 m!1149501))

(check-sat (not mapNonEmpty!48985) (not b!1248911) b_and!44331 (not b!1248908) (not b!1248912) tp_is_empty!31483 (not b_next!26581) (not start!104772))
(check-sat b_and!44331 (not b_next!26581))
