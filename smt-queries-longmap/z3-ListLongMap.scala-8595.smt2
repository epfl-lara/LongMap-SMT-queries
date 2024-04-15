; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104796 () Bool)

(assert start!104796)

(declare-fun b_free!26605 () Bool)

(declare-fun b_next!26605 () Bool)

(assert (=> start!104796 (= b_free!26605 (not b_next!26605))))

(declare-fun tp!93304 () Bool)

(declare-fun b_and!44355 () Bool)

(assert (=> start!104796 (= tp!93304 b_and!44355)))

(declare-fun res!833314 () Bool)

(declare-fun e!708950 () Bool)

(assert (=> start!104796 (=> (not res!833314) (not e!708950))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104796 (= res!833314 (validMask!0 mask!1466))))

(assert (=> start!104796 e!708950))

(assert (=> start!104796 true))

(assert (=> start!104796 tp!93304))

(declare-fun tp_is_empty!31507 () Bool)

(assert (=> start!104796 tp_is_empty!31507))

(declare-datatypes ((array!80613 0))(
  ( (array!80614 (arr!38874 (Array (_ BitVec 32) (_ BitVec 64))) (size!39412 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80613)

(declare-fun array_inv!29801 (array!80613) Bool)

(assert (=> start!104796 (array_inv!29801 _keys!1118)))

(declare-datatypes ((V!47375 0))(
  ( (V!47376 (val!15816 Int)) )
))
(declare-datatypes ((ValueCell!14990 0))(
  ( (ValueCellFull!14990 (v!18511 V!47375)) (EmptyCell!14990) )
))
(declare-datatypes ((array!80615 0))(
  ( (array!80616 (arr!38875 (Array (_ BitVec 32) ValueCell!14990)) (size!39413 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80615)

(declare-fun e!708951 () Bool)

(declare-fun array_inv!29802 (array!80615) Bool)

(assert (=> start!104796 (and (array_inv!29802 _values!914) e!708951)))

(declare-fun b!1249160 () Bool)

(assert (=> b!1249160 (= e!708950 (not true))))

(declare-datatypes ((tuple2!20450 0))(
  ( (tuple2!20451 (_1!10236 (_ BitVec 64)) (_2!10236 V!47375)) )
))
(declare-datatypes ((List!27678 0))(
  ( (Nil!27675) (Cons!27674 (h!28883 tuple2!20450) (t!41140 List!27678)) )
))
(declare-datatypes ((ListLongMap!18323 0))(
  ( (ListLongMap!18324 (toList!9177 List!27678)) )
))
(declare-fun lt!563468 () ListLongMap!18323)

(declare-fun lt!563466 () ListLongMap!18323)

(assert (=> b!1249160 (= lt!563468 lt!563466)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47375)

(declare-datatypes ((Unit!41322 0))(
  ( (Unit!41323) )
))
(declare-fun lt!563467 () Unit!41322)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47375)

(declare-fun minValueBefore!43 () V!47375)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!916 (array!80613 array!80615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47375 V!47375 V!47375 V!47375 (_ BitVec 32) Int) Unit!41322)

(assert (=> b!1249160 (= lt!563467 (lemmaNoChangeToArrayThenSameMapNoExtras!916 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5594 (array!80613 array!80615 (_ BitVec 32) (_ BitVec 32) V!47375 V!47375 (_ BitVec 32) Int) ListLongMap!18323)

(assert (=> b!1249160 (= lt!563466 (getCurrentListMapNoExtraKeys!5594 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249160 (= lt!563468 (getCurrentListMapNoExtraKeys!5594 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49021 () Bool)

(declare-fun mapRes!49021 () Bool)

(assert (=> mapIsEmpty!49021 mapRes!49021))

(declare-fun b!1249161 () Bool)

(declare-fun res!833313 () Bool)

(assert (=> b!1249161 (=> (not res!833313) (not e!708950))))

(declare-datatypes ((List!27679 0))(
  ( (Nil!27676) (Cons!27675 (h!28884 (_ BitVec 64)) (t!41141 List!27679)) )
))
(declare-fun arrayNoDuplicates!0 (array!80613 (_ BitVec 32) List!27679) Bool)

(assert (=> b!1249161 (= res!833313 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27676))))

(declare-fun b!1249162 () Bool)

(declare-fun e!708952 () Bool)

(assert (=> b!1249162 (= e!708952 tp_is_empty!31507)))

(declare-fun b!1249163 () Bool)

(declare-fun res!833312 () Bool)

(assert (=> b!1249163 (=> (not res!833312) (not e!708950))))

(assert (=> b!1249163 (= res!833312 (and (= (size!39413 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39412 _keys!1118) (size!39413 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49021 () Bool)

(declare-fun tp!93305 () Bool)

(declare-fun e!708948 () Bool)

(assert (=> mapNonEmpty!49021 (= mapRes!49021 (and tp!93305 e!708948))))

(declare-fun mapKey!49021 () (_ BitVec 32))

(declare-fun mapValue!49021 () ValueCell!14990)

(declare-fun mapRest!49021 () (Array (_ BitVec 32) ValueCell!14990))

(assert (=> mapNonEmpty!49021 (= (arr!38875 _values!914) (store mapRest!49021 mapKey!49021 mapValue!49021))))

(declare-fun b!1249164 () Bool)

(assert (=> b!1249164 (= e!708951 (and e!708952 mapRes!49021))))

(declare-fun condMapEmpty!49021 () Bool)

(declare-fun mapDefault!49021 () ValueCell!14990)

(assert (=> b!1249164 (= condMapEmpty!49021 (= (arr!38875 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14990)) mapDefault!49021)))))

(declare-fun b!1249165 () Bool)

(declare-fun res!833315 () Bool)

(assert (=> b!1249165 (=> (not res!833315) (not e!708950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80613 (_ BitVec 32)) Bool)

(assert (=> b!1249165 (= res!833315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249166 () Bool)

(assert (=> b!1249166 (= e!708948 tp_is_empty!31507)))

(assert (= (and start!104796 res!833314) b!1249163))

(assert (= (and b!1249163 res!833312) b!1249165))

(assert (= (and b!1249165 res!833315) b!1249161))

(assert (= (and b!1249161 res!833313) b!1249160))

(assert (= (and b!1249164 condMapEmpty!49021) mapIsEmpty!49021))

(assert (= (and b!1249164 (not condMapEmpty!49021)) mapNonEmpty!49021))

(get-info :version)

(assert (= (and mapNonEmpty!49021 ((_ is ValueCellFull!14990) mapValue!49021)) b!1249166))

(assert (= (and b!1249164 ((_ is ValueCellFull!14990) mapDefault!49021)) b!1249162))

(assert (= start!104796 b!1249164))

(declare-fun m!1149679 () Bool)

(assert (=> b!1249160 m!1149679))

(declare-fun m!1149681 () Bool)

(assert (=> b!1249160 m!1149681))

(declare-fun m!1149683 () Bool)

(assert (=> b!1249160 m!1149683))

(declare-fun m!1149685 () Bool)

(assert (=> mapNonEmpty!49021 m!1149685))

(declare-fun m!1149687 () Bool)

(assert (=> b!1249161 m!1149687))

(declare-fun m!1149689 () Bool)

(assert (=> start!104796 m!1149689))

(declare-fun m!1149691 () Bool)

(assert (=> start!104796 m!1149691))

(declare-fun m!1149693 () Bool)

(assert (=> start!104796 m!1149693))

(declare-fun m!1149695 () Bool)

(assert (=> b!1249165 m!1149695))

(check-sat b_and!44355 (not mapNonEmpty!49021) (not b_next!26605) (not start!104796) (not b!1249165) (not b!1249160) tp_is_empty!31507 (not b!1249161))
(check-sat b_and!44355 (not b_next!26605))
