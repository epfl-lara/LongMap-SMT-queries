; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104870 () Bool)

(assert start!104870)

(declare-fun b_free!26661 () Bool)

(declare-fun b_next!26661 () Bool)

(assert (=> start!104870 (= b_free!26661 (not b_next!26661))))

(declare-fun tp!93476 () Bool)

(declare-fun b_and!44437 () Bool)

(assert (=> start!104870 (= tp!93476 b_and!44437)))

(declare-fun b!1249920 () Bool)

(declare-fun e!709478 () Bool)

(declare-fun e!709477 () Bool)

(assert (=> b!1249920 (= e!709478 (not e!709477))))

(declare-fun res!833724 () Bool)

(assert (=> b!1249920 (=> res!833724 e!709477)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1249920 (= res!833724 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47449 0))(
  ( (V!47450 (val!15844 Int)) )
))
(declare-datatypes ((tuple2!20406 0))(
  ( (tuple2!20407 (_1!10214 (_ BitVec 64)) (_2!10214 V!47449)) )
))
(declare-datatypes ((List!27650 0))(
  ( (Nil!27647) (Cons!27646 (h!28855 tuple2!20406) (t!41123 List!27650)) )
))
(declare-datatypes ((ListLongMap!18279 0))(
  ( (ListLongMap!18280 (toList!9155 List!27650)) )
))
(declare-fun lt!563944 () ListLongMap!18279)

(declare-fun lt!563943 () ListLongMap!18279)

(assert (=> b!1249920 (= lt!563944 lt!563943)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47449)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47449)

(declare-datatypes ((array!80798 0))(
  ( (array!80799 (arr!38965 (Array (_ BitVec 32) (_ BitVec 64))) (size!39501 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80798)

(declare-datatypes ((ValueCell!15018 0))(
  ( (ValueCellFull!15018 (v!18540 V!47449)) (EmptyCell!15018) )
))
(declare-datatypes ((array!80800 0))(
  ( (array!80801 (arr!38966 (Array (_ BitVec 32) ValueCell!15018)) (size!39502 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80800)

(declare-datatypes ((Unit!41507 0))(
  ( (Unit!41508) )
))
(declare-fun lt!563942 () Unit!41507)

(declare-fun minValueBefore!43 () V!47449)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!926 (array!80798 array!80800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47449 V!47449 V!47449 V!47449 (_ BitVec 32) Int) Unit!41507)

(assert (=> b!1249920 (= lt!563942 (lemmaNoChangeToArrayThenSameMapNoExtras!926 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5562 (array!80798 array!80800 (_ BitVec 32) (_ BitVec 32) V!47449 V!47449 (_ BitVec 32) Int) ListLongMap!18279)

(assert (=> b!1249920 (= lt!563943 (getCurrentListMapNoExtraKeys!5562 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249920 (= lt!563944 (getCurrentListMapNoExtraKeys!5562 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249921 () Bool)

(declare-fun res!833728 () Bool)

(assert (=> b!1249921 (=> (not res!833728) (not e!709478))))

(declare-datatypes ((List!27651 0))(
  ( (Nil!27648) (Cons!27647 (h!28856 (_ BitVec 64)) (t!41124 List!27651)) )
))
(declare-fun arrayNoDuplicates!0 (array!80798 (_ BitVec 32) List!27651) Bool)

(assert (=> b!1249921 (= res!833728 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27648))))

(declare-fun b!1249922 () Bool)

(assert (=> b!1249922 (= e!709477 true)))

(declare-fun lt!563945 () Bool)

(declare-fun contains!7473 (ListLongMap!18279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4434 (array!80798 array!80800 (_ BitVec 32) (_ BitVec 32) V!47449 V!47449 (_ BitVec 32) Int) ListLongMap!18279)

(assert (=> b!1249922 (= lt!563945 (contains!7473 (getCurrentListMap!4434 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!49108 () Bool)

(declare-fun mapRes!49108 () Bool)

(assert (=> mapIsEmpty!49108 mapRes!49108))

(declare-fun b!1249923 () Bool)

(declare-fun e!709476 () Bool)

(declare-fun tp_is_empty!31563 () Bool)

(assert (=> b!1249923 (= e!709476 tp_is_empty!31563)))

(declare-fun res!833727 () Bool)

(assert (=> start!104870 (=> (not res!833727) (not e!709478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104870 (= res!833727 (validMask!0 mask!1466))))

(assert (=> start!104870 e!709478))

(assert (=> start!104870 true))

(assert (=> start!104870 tp!93476))

(assert (=> start!104870 tp_is_empty!31563))

(declare-fun array_inv!29731 (array!80798) Bool)

(assert (=> start!104870 (array_inv!29731 _keys!1118)))

(declare-fun e!709474 () Bool)

(declare-fun array_inv!29732 (array!80800) Bool)

(assert (=> start!104870 (and (array_inv!29732 _values!914) e!709474)))

(declare-fun b!1249924 () Bool)

(declare-fun res!833726 () Bool)

(assert (=> b!1249924 (=> (not res!833726) (not e!709478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80798 (_ BitVec 32)) Bool)

(assert (=> b!1249924 (= res!833726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249925 () Bool)

(declare-fun e!709473 () Bool)

(assert (=> b!1249925 (= e!709473 tp_is_empty!31563)))

(declare-fun b!1249926 () Bool)

(assert (=> b!1249926 (= e!709474 (and e!709476 mapRes!49108))))

(declare-fun condMapEmpty!49108 () Bool)

(declare-fun mapDefault!49108 () ValueCell!15018)

(assert (=> b!1249926 (= condMapEmpty!49108 (= (arr!38966 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15018)) mapDefault!49108)))))

(declare-fun b!1249927 () Bool)

(declare-fun res!833725 () Bool)

(assert (=> b!1249927 (=> (not res!833725) (not e!709478))))

(assert (=> b!1249927 (= res!833725 (and (= (size!39502 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39501 _keys!1118) (size!39502 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49108 () Bool)

(declare-fun tp!93475 () Bool)

(assert (=> mapNonEmpty!49108 (= mapRes!49108 (and tp!93475 e!709473))))

(declare-fun mapValue!49108 () ValueCell!15018)

(declare-fun mapKey!49108 () (_ BitVec 32))

(declare-fun mapRest!49108 () (Array (_ BitVec 32) ValueCell!15018))

(assert (=> mapNonEmpty!49108 (= (arr!38966 _values!914) (store mapRest!49108 mapKey!49108 mapValue!49108))))

(assert (= (and start!104870 res!833727) b!1249927))

(assert (= (and b!1249927 res!833725) b!1249924))

(assert (= (and b!1249924 res!833726) b!1249921))

(assert (= (and b!1249921 res!833728) b!1249920))

(assert (= (and b!1249920 (not res!833724)) b!1249922))

(assert (= (and b!1249926 condMapEmpty!49108) mapIsEmpty!49108))

(assert (= (and b!1249926 (not condMapEmpty!49108)) mapNonEmpty!49108))

(get-info :version)

(assert (= (and mapNonEmpty!49108 ((_ is ValueCellFull!15018) mapValue!49108)) b!1249925))

(assert (= (and b!1249926 ((_ is ValueCellFull!15018) mapDefault!49108)) b!1249923))

(assert (= start!104870 b!1249926))

(declare-fun m!1150773 () Bool)

(assert (=> b!1249921 m!1150773))

(declare-fun m!1150775 () Bool)

(assert (=> mapNonEmpty!49108 m!1150775))

(declare-fun m!1150777 () Bool)

(assert (=> b!1249922 m!1150777))

(assert (=> b!1249922 m!1150777))

(declare-fun m!1150779 () Bool)

(assert (=> b!1249922 m!1150779))

(declare-fun m!1150781 () Bool)

(assert (=> b!1249924 m!1150781))

(declare-fun m!1150783 () Bool)

(assert (=> b!1249920 m!1150783))

(declare-fun m!1150785 () Bool)

(assert (=> b!1249920 m!1150785))

(declare-fun m!1150787 () Bool)

(assert (=> b!1249920 m!1150787))

(declare-fun m!1150789 () Bool)

(assert (=> start!104870 m!1150789))

(declare-fun m!1150791 () Bool)

(assert (=> start!104870 m!1150791))

(declare-fun m!1150793 () Bool)

(assert (=> start!104870 m!1150793))

(check-sat tp_is_empty!31563 (not start!104870) (not mapNonEmpty!49108) (not b!1249924) b_and!44437 (not b!1249922) (not b!1249921) (not b!1249920) (not b_next!26661))
(check-sat b_and!44437 (not b_next!26661))
