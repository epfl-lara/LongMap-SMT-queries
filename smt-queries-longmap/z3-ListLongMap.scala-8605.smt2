; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104876 () Bool)

(assert start!104876)

(declare-fun b_free!26667 () Bool)

(declare-fun b_next!26667 () Bool)

(assert (=> start!104876 (= b_free!26667 (not b_next!26667))))

(declare-fun tp!93494 () Bool)

(declare-fun b_and!44443 () Bool)

(assert (=> start!104876 (= tp!93494 b_and!44443)))

(declare-fun b!1249997 () Bool)

(declare-fun e!709534 () Bool)

(declare-fun tp_is_empty!31569 () Bool)

(assert (=> b!1249997 (= e!709534 tp_is_empty!31569)))

(declare-fun res!833774 () Bool)

(declare-fun e!709532 () Bool)

(assert (=> start!104876 (=> (not res!833774) (not e!709532))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104876 (= res!833774 (validMask!0 mask!1466))))

(assert (=> start!104876 e!709532))

(assert (=> start!104876 true))

(assert (=> start!104876 tp!93494))

(assert (=> start!104876 tp_is_empty!31569))

(declare-datatypes ((array!80808 0))(
  ( (array!80809 (arr!38970 (Array (_ BitVec 32) (_ BitVec 64))) (size!39506 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80808)

(declare-fun array_inv!29735 (array!80808) Bool)

(assert (=> start!104876 (array_inv!29735 _keys!1118)))

(declare-datatypes ((V!47457 0))(
  ( (V!47458 (val!15847 Int)) )
))
(declare-datatypes ((ValueCell!15021 0))(
  ( (ValueCellFull!15021 (v!18543 V!47457)) (EmptyCell!15021) )
))
(declare-datatypes ((array!80810 0))(
  ( (array!80811 (arr!38971 (Array (_ BitVec 32) ValueCell!15021)) (size!39507 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80810)

(declare-fun e!709537 () Bool)

(declare-fun array_inv!29736 (array!80810) Bool)

(assert (=> start!104876 (and (array_inv!29736 _values!914) e!709537)))

(declare-fun b!1249998 () Bool)

(declare-fun res!833777 () Bool)

(assert (=> b!1249998 (=> (not res!833777) (not e!709532))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249998 (= res!833777 (and (= (size!39507 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39506 _keys!1118) (size!39507 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49117 () Bool)

(declare-fun mapRes!49117 () Bool)

(assert (=> mapIsEmpty!49117 mapRes!49117))

(declare-fun b!1249999 () Bool)

(declare-fun e!709536 () Bool)

(assert (=> b!1249999 (= e!709536 true)))

(declare-datatypes ((tuple2!20410 0))(
  ( (tuple2!20411 (_1!10216 (_ BitVec 64)) (_2!10216 V!47457)) )
))
(declare-datatypes ((List!27654 0))(
  ( (Nil!27651) (Cons!27650 (h!28859 tuple2!20410) (t!41127 List!27654)) )
))
(declare-datatypes ((ListLongMap!18283 0))(
  ( (ListLongMap!18284 (toList!9157 List!27654)) )
))
(declare-fun lt!563987 () ListLongMap!18283)

(declare-fun -!1989 (ListLongMap!18283 (_ BitVec 64)) ListLongMap!18283)

(assert (=> b!1249999 (= (-!1989 lt!563987 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563987)))

(declare-datatypes ((Unit!41511 0))(
  ( (Unit!41512) )
))
(declare-fun lt!563986 () Unit!41511)

(declare-fun removeNotPresentStillSame!84 (ListLongMap!18283 (_ BitVec 64)) Unit!41511)

(assert (=> b!1249999 (= lt!563986 (removeNotPresentStillSame!84 lt!563987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250000 () Bool)

(declare-fun e!709533 () Bool)

(assert (=> b!1250000 (= e!709533 tp_is_empty!31569)))

(declare-fun b!1250001 () Bool)

(declare-fun res!833776 () Bool)

(assert (=> b!1250001 (=> (not res!833776) (not e!709532))))

(declare-datatypes ((List!27655 0))(
  ( (Nil!27652) (Cons!27651 (h!28860 (_ BitVec 64)) (t!41128 List!27655)) )
))
(declare-fun arrayNoDuplicates!0 (array!80808 (_ BitVec 32) List!27655) Bool)

(assert (=> b!1250001 (= res!833776 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27652))))

(declare-fun b!1250002 () Bool)

(assert (=> b!1250002 (= e!709537 (and e!709533 mapRes!49117))))

(declare-fun condMapEmpty!49117 () Bool)

(declare-fun mapDefault!49117 () ValueCell!15021)

(assert (=> b!1250002 (= condMapEmpty!49117 (= (arr!38971 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15021)) mapDefault!49117)))))

(declare-fun b!1250003 () Bool)

(declare-fun e!709535 () Bool)

(assert (=> b!1250003 (= e!709532 (not e!709535))))

(declare-fun res!833775 () Bool)

(assert (=> b!1250003 (=> res!833775 e!709535)))

(assert (=> b!1250003 (= res!833775 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!563985 () ListLongMap!18283)

(declare-fun lt!563984 () ListLongMap!18283)

(assert (=> b!1250003 (= lt!563985 lt!563984)))

(declare-fun minValueAfter!43 () V!47457)

(declare-fun zeroValue!871 () V!47457)

(declare-fun minValueBefore!43 () V!47457)

(declare-fun lt!563983 () Unit!41511)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!928 (array!80808 array!80810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47457 V!47457 V!47457 V!47457 (_ BitVec 32) Int) Unit!41511)

(assert (=> b!1250003 (= lt!563983 (lemmaNoChangeToArrayThenSameMapNoExtras!928 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5564 (array!80808 array!80810 (_ BitVec 32) (_ BitVec 32) V!47457 V!47457 (_ BitVec 32) Int) ListLongMap!18283)

(assert (=> b!1250003 (= lt!563984 (getCurrentListMapNoExtraKeys!5564 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250003 (= lt!563985 (getCurrentListMapNoExtraKeys!5564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250004 () Bool)

(assert (=> b!1250004 (= e!709535 e!709536)))

(declare-fun res!833778 () Bool)

(assert (=> b!1250004 (=> res!833778 e!709536)))

(declare-fun contains!7474 (ListLongMap!18283 (_ BitVec 64)) Bool)

(assert (=> b!1250004 (= res!833778 (contains!7474 lt!563987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4435 (array!80808 array!80810 (_ BitVec 32) (_ BitVec 32) V!47457 V!47457 (_ BitVec 32) Int) ListLongMap!18283)

(assert (=> b!1250004 (= lt!563987 (getCurrentListMap!4435 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250005 () Bool)

(declare-fun res!833779 () Bool)

(assert (=> b!1250005 (=> (not res!833779) (not e!709532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80808 (_ BitVec 32)) Bool)

(assert (=> b!1250005 (= res!833779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49117 () Bool)

(declare-fun tp!93493 () Bool)

(assert (=> mapNonEmpty!49117 (= mapRes!49117 (and tp!93493 e!709534))))

(declare-fun mapRest!49117 () (Array (_ BitVec 32) ValueCell!15021))

(declare-fun mapValue!49117 () ValueCell!15021)

(declare-fun mapKey!49117 () (_ BitVec 32))

(assert (=> mapNonEmpty!49117 (= (arr!38971 _values!914) (store mapRest!49117 mapKey!49117 mapValue!49117))))

(assert (= (and start!104876 res!833774) b!1249998))

(assert (= (and b!1249998 res!833777) b!1250005))

(assert (= (and b!1250005 res!833779) b!1250001))

(assert (= (and b!1250001 res!833776) b!1250003))

(assert (= (and b!1250003 (not res!833775)) b!1250004))

(assert (= (and b!1250004 (not res!833778)) b!1249999))

(assert (= (and b!1250002 condMapEmpty!49117) mapIsEmpty!49117))

(assert (= (and b!1250002 (not condMapEmpty!49117)) mapNonEmpty!49117))

(get-info :version)

(assert (= (and mapNonEmpty!49117 ((_ is ValueCellFull!15021) mapValue!49117)) b!1249997))

(assert (= (and b!1250002 ((_ is ValueCellFull!15021) mapDefault!49117)) b!1250000))

(assert (= start!104876 b!1250002))

(declare-fun m!1150843 () Bool)

(assert (=> b!1250003 m!1150843))

(declare-fun m!1150845 () Bool)

(assert (=> b!1250003 m!1150845))

(declare-fun m!1150847 () Bool)

(assert (=> b!1250003 m!1150847))

(declare-fun m!1150849 () Bool)

(assert (=> mapNonEmpty!49117 m!1150849))

(declare-fun m!1150851 () Bool)

(assert (=> b!1249999 m!1150851))

(declare-fun m!1150853 () Bool)

(assert (=> b!1249999 m!1150853))

(declare-fun m!1150855 () Bool)

(assert (=> b!1250001 m!1150855))

(declare-fun m!1150857 () Bool)

(assert (=> start!104876 m!1150857))

(declare-fun m!1150859 () Bool)

(assert (=> start!104876 m!1150859))

(declare-fun m!1150861 () Bool)

(assert (=> start!104876 m!1150861))

(declare-fun m!1150863 () Bool)

(assert (=> b!1250004 m!1150863))

(declare-fun m!1150865 () Bool)

(assert (=> b!1250004 m!1150865))

(declare-fun m!1150867 () Bool)

(assert (=> b!1250005 m!1150867))

(check-sat b_and!44443 (not b!1250005) tp_is_empty!31569 (not b!1250003) (not b!1249999) (not mapNonEmpty!49117) (not b_next!26667) (not start!104876) (not b!1250001) (not b!1250004))
(check-sat b_and!44443 (not b_next!26667))
