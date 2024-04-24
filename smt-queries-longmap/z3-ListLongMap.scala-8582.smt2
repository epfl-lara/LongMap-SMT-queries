; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104934 () Bool)

(assert start!104934)

(declare-fun b_free!26527 () Bool)

(declare-fun b_next!26527 () Bool)

(assert (=> start!104934 (= b_free!26527 (not b_next!26527))))

(declare-fun tp!93067 () Bool)

(declare-fun b_and!44293 () Bool)

(assert (=> start!104934 (= tp!93067 b_and!44293)))

(declare-fun b!1249656 () Bool)

(declare-fun e!709210 () Bool)

(declare-fun e!709211 () Bool)

(declare-fun mapRes!48901 () Bool)

(assert (=> b!1249656 (= e!709210 (and e!709211 mapRes!48901))))

(declare-fun condMapEmpty!48901 () Bool)

(declare-datatypes ((V!47271 0))(
  ( (V!47272 (val!15777 Int)) )
))
(declare-datatypes ((ValueCell!14951 0))(
  ( (ValueCellFull!14951 (v!18469 V!47271)) (EmptyCell!14951) )
))
(declare-datatypes ((array!80583 0))(
  ( (array!80584 (arr!38855 (Array (_ BitVec 32) ValueCell!14951)) (size!39392 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80583)

(declare-fun mapDefault!48901 () ValueCell!14951)

(assert (=> b!1249656 (= condMapEmpty!48901 (= (arr!38855 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14951)) mapDefault!48901)))))

(declare-fun b!1249657 () Bool)

(declare-fun res!833380 () Bool)

(declare-fun e!709207 () Bool)

(assert (=> b!1249657 (=> (not res!833380) (not e!709207))))

(declare-datatypes ((array!80585 0))(
  ( (array!80586 (arr!38856 (Array (_ BitVec 32) (_ BitVec 64))) (size!39393 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80585)

(declare-datatypes ((List!27599 0))(
  ( (Nil!27596) (Cons!27595 (h!28813 (_ BitVec 64)) (t!41060 List!27599)) )
))
(declare-fun arrayNoDuplicates!0 (array!80585 (_ BitVec 32) List!27599) Bool)

(assert (=> b!1249657 (= res!833380 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27596))))

(declare-fun mapNonEmpty!48901 () Bool)

(declare-fun tp!93068 () Bool)

(declare-fun e!709208 () Bool)

(assert (=> mapNonEmpty!48901 (= mapRes!48901 (and tp!93068 e!709208))))

(declare-fun mapValue!48901 () ValueCell!14951)

(declare-fun mapKey!48901 () (_ BitVec 32))

(declare-fun mapRest!48901 () (Array (_ BitVec 32) ValueCell!14951))

(assert (=> mapNonEmpty!48901 (= (arr!38855 _values!914) (store mapRest!48901 mapKey!48901 mapValue!48901))))

(declare-fun b!1249658 () Bool)

(declare-fun tp_is_empty!31429 () Bool)

(assert (=> b!1249658 (= e!709208 tp_is_empty!31429)))

(declare-fun b!1249659 () Bool)

(declare-fun res!833378 () Bool)

(assert (=> b!1249659 (=> (not res!833378) (not e!709207))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1249659 (= res!833378 (and (= (size!39392 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39393 _keys!1118) (size!39392 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48901 () Bool)

(assert (=> mapIsEmpty!48901 mapRes!48901))

(declare-fun b!1249660 () Bool)

(assert (=> b!1249660 (= e!709207 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20342 0))(
  ( (tuple2!20343 (_1!10182 (_ BitVec 64)) (_2!10182 V!47271)) )
))
(declare-datatypes ((List!27600 0))(
  ( (Nil!27597) (Cons!27596 (h!28814 tuple2!20342) (t!41061 List!27600)) )
))
(declare-datatypes ((ListLongMap!18223 0))(
  ( (ListLongMap!18224 (toList!9127 List!27600)) )
))
(declare-fun lt!563879 () ListLongMap!18223)

(declare-fun zeroValue!871 () V!47271)

(declare-fun minValueBefore!43 () V!47271)

(declare-fun getCurrentListMapNoExtraKeys!5562 (array!80585 array!80583 (_ BitVec 32) (_ BitVec 32) V!47271 V!47271 (_ BitVec 32) Int) ListLongMap!18223)

(assert (=> b!1249660 (= lt!563879 (getCurrentListMapNoExtraKeys!5562 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249661 () Bool)

(declare-fun res!833377 () Bool)

(assert (=> b!1249661 (=> (not res!833377) (not e!709207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80585 (_ BitVec 32)) Bool)

(assert (=> b!1249661 (= res!833377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833379 () Bool)

(assert (=> start!104934 (=> (not res!833379) (not e!709207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104934 (= res!833379 (validMask!0 mask!1466))))

(assert (=> start!104934 e!709207))

(assert (=> start!104934 true))

(assert (=> start!104934 tp!93067))

(assert (=> start!104934 tp_is_empty!31429))

(declare-fun array_inv!29763 (array!80585) Bool)

(assert (=> start!104934 (array_inv!29763 _keys!1118)))

(declare-fun array_inv!29764 (array!80583) Bool)

(assert (=> start!104934 (and (array_inv!29764 _values!914) e!709210)))

(declare-fun b!1249655 () Bool)

(assert (=> b!1249655 (= e!709211 tp_is_empty!31429)))

(assert (= (and start!104934 res!833379) b!1249659))

(assert (= (and b!1249659 res!833378) b!1249661))

(assert (= (and b!1249661 res!833377) b!1249657))

(assert (= (and b!1249657 res!833380) b!1249660))

(assert (= (and b!1249656 condMapEmpty!48901) mapIsEmpty!48901))

(assert (= (and b!1249656 (not condMapEmpty!48901)) mapNonEmpty!48901))

(get-info :version)

(assert (= (and mapNonEmpty!48901 ((_ is ValueCellFull!14951) mapValue!48901)) b!1249658))

(assert (= (and b!1249656 ((_ is ValueCellFull!14951) mapDefault!48901)) b!1249655))

(assert (= start!104934 b!1249656))

(declare-fun m!1151155 () Bool)

(assert (=> mapNonEmpty!48901 m!1151155))

(declare-fun m!1151157 () Bool)

(assert (=> b!1249660 m!1151157))

(declare-fun m!1151159 () Bool)

(assert (=> b!1249657 m!1151159))

(declare-fun m!1151161 () Bool)

(assert (=> b!1249661 m!1151161))

(declare-fun m!1151163 () Bool)

(assert (=> start!104934 m!1151163))

(declare-fun m!1151165 () Bool)

(assert (=> start!104934 m!1151165))

(declare-fun m!1151167 () Bool)

(assert (=> start!104934 m!1151167))

(check-sat b_and!44293 (not mapNonEmpty!48901) (not b!1249661) (not b_next!26527) (not b!1249660) tp_is_empty!31429 (not start!104934) (not b!1249657))
(check-sat b_and!44293 (not b_next!26527))
