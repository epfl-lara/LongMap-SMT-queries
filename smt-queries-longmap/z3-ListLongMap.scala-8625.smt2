; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105040 () Bool)

(assert start!105040)

(declare-fun b_free!26787 () Bool)

(declare-fun b_next!26787 () Bool)

(assert (=> start!105040 (= b_free!26787 (not b_next!26787))))

(declare-fun tp!93859 () Bool)

(declare-fun b_and!44583 () Bool)

(assert (=> start!105040 (= tp!93859 b_and!44583)))

(declare-fun b!1251885 () Bool)

(declare-fun e!710948 () Bool)

(assert (=> b!1251885 (= e!710948 (not true))))

(declare-datatypes ((V!47617 0))(
  ( (V!47618 (val!15907 Int)) )
))
(declare-datatypes ((tuple2!20514 0))(
  ( (tuple2!20515 (_1!10268 (_ BitVec 64)) (_2!10268 V!47617)) )
))
(declare-datatypes ((List!27746 0))(
  ( (Nil!27743) (Cons!27742 (h!28951 tuple2!20514) (t!41223 List!27746)) )
))
(declare-datatypes ((ListLongMap!18387 0))(
  ( (ListLongMap!18388 (toList!9209 List!27746)) )
))
(declare-fun lt!565087 () ListLongMap!18387)

(declare-fun lt!565086 () ListLongMap!18387)

(assert (=> b!1251885 (= lt!565087 lt!565086)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41607 0))(
  ( (Unit!41608) )
))
(declare-fun lt!565085 () Unit!41607)

(declare-fun minValueAfter!43 () V!47617)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47617)

(declare-datatypes ((array!81044 0))(
  ( (array!81045 (arr!39086 (Array (_ BitVec 32) (_ BitVec 64))) (size!39622 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81044)

(declare-datatypes ((ValueCell!15081 0))(
  ( (ValueCellFull!15081 (v!18605 V!47617)) (EmptyCell!15081) )
))
(declare-datatypes ((array!81046 0))(
  ( (array!81047 (arr!39087 (Array (_ BitVec 32) ValueCell!15081)) (size!39623 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81046)

(declare-fun minValueBefore!43 () V!47617)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!969 (array!81044 array!81046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47617 V!47617 V!47617 V!47617 (_ BitVec 32) Int) Unit!41607)

(assert (=> b!1251885 (= lt!565085 (lemmaNoChangeToArrayThenSameMapNoExtras!969 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5605 (array!81044 array!81046 (_ BitVec 32) (_ BitVec 32) V!47617 V!47617 (_ BitVec 32) Int) ListLongMap!18387)

(assert (=> b!1251885 (= lt!565086 (getCurrentListMapNoExtraKeys!5605 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251885 (= lt!565087 (getCurrentListMapNoExtraKeys!5605 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251886 () Bool)

(declare-fun e!710946 () Bool)

(declare-fun tp_is_empty!31689 () Bool)

(assert (=> b!1251886 (= e!710946 tp_is_empty!31689)))

(declare-fun b!1251887 () Bool)

(declare-fun e!710949 () Bool)

(declare-fun mapRes!49303 () Bool)

(assert (=> b!1251887 (= e!710949 (and e!710946 mapRes!49303))))

(declare-fun condMapEmpty!49303 () Bool)

(declare-fun mapDefault!49303 () ValueCell!15081)

(assert (=> b!1251887 (= condMapEmpty!49303 (= (arr!39087 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15081)) mapDefault!49303)))))

(declare-fun b!1251888 () Bool)

(declare-fun res!834931 () Bool)

(assert (=> b!1251888 (=> (not res!834931) (not e!710948))))

(declare-datatypes ((List!27747 0))(
  ( (Nil!27744) (Cons!27743 (h!28952 (_ BitVec 64)) (t!41224 List!27747)) )
))
(declare-fun arrayNoDuplicates!0 (array!81044 (_ BitVec 32) List!27747) Bool)

(assert (=> b!1251888 (= res!834931 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27744))))

(declare-fun b!1251889 () Bool)

(declare-fun res!834930 () Bool)

(assert (=> b!1251889 (=> (not res!834930) (not e!710948))))

(assert (=> b!1251889 (= res!834930 (and (= (size!39623 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39622 _keys!1118) (size!39623 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251890 () Bool)

(declare-fun res!834932 () Bool)

(assert (=> b!1251890 (=> (not res!834932) (not e!710948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81044 (_ BitVec 32)) Bool)

(assert (=> b!1251890 (= res!834932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251891 () Bool)

(declare-fun e!710947 () Bool)

(assert (=> b!1251891 (= e!710947 tp_is_empty!31689)))

(declare-fun mapIsEmpty!49303 () Bool)

(assert (=> mapIsEmpty!49303 mapRes!49303))

(declare-fun mapNonEmpty!49303 () Bool)

(declare-fun tp!93860 () Bool)

(assert (=> mapNonEmpty!49303 (= mapRes!49303 (and tp!93860 e!710947))))

(declare-fun mapValue!49303 () ValueCell!15081)

(declare-fun mapRest!49303 () (Array (_ BitVec 32) ValueCell!15081))

(declare-fun mapKey!49303 () (_ BitVec 32))

(assert (=> mapNonEmpty!49303 (= (arr!39087 _values!914) (store mapRest!49303 mapKey!49303 mapValue!49303))))

(declare-fun res!834933 () Bool)

(assert (=> start!105040 (=> (not res!834933) (not e!710948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105040 (= res!834933 (validMask!0 mask!1466))))

(assert (=> start!105040 e!710948))

(assert (=> start!105040 true))

(assert (=> start!105040 tp!93859))

(assert (=> start!105040 tp_is_empty!31689))

(declare-fun array_inv!29813 (array!81044) Bool)

(assert (=> start!105040 (array_inv!29813 _keys!1118)))

(declare-fun array_inv!29814 (array!81046) Bool)

(assert (=> start!105040 (and (array_inv!29814 _values!914) e!710949)))

(assert (= (and start!105040 res!834933) b!1251889))

(assert (= (and b!1251889 res!834930) b!1251890))

(assert (= (and b!1251890 res!834932) b!1251888))

(assert (= (and b!1251888 res!834931) b!1251885))

(assert (= (and b!1251887 condMapEmpty!49303) mapIsEmpty!49303))

(assert (= (and b!1251887 (not condMapEmpty!49303)) mapNonEmpty!49303))

(get-info :version)

(assert (= (and mapNonEmpty!49303 ((_ is ValueCellFull!15081) mapValue!49303)) b!1251891))

(assert (= (and b!1251887 ((_ is ValueCellFull!15081) mapDefault!49303)) b!1251886))

(assert (= start!105040 b!1251887))

(declare-fun m!1152599 () Bool)

(assert (=> b!1251890 m!1152599))

(declare-fun m!1152601 () Bool)

(assert (=> start!105040 m!1152601))

(declare-fun m!1152603 () Bool)

(assert (=> start!105040 m!1152603))

(declare-fun m!1152605 () Bool)

(assert (=> start!105040 m!1152605))

(declare-fun m!1152607 () Bool)

(assert (=> b!1251888 m!1152607))

(declare-fun m!1152609 () Bool)

(assert (=> mapNonEmpty!49303 m!1152609))

(declare-fun m!1152611 () Bool)

(assert (=> b!1251885 m!1152611))

(declare-fun m!1152613 () Bool)

(assert (=> b!1251885 m!1152613))

(declare-fun m!1152615 () Bool)

(assert (=> b!1251885 m!1152615))

(check-sat (not b_next!26787) b_and!44583 (not start!105040) (not mapNonEmpty!49303) (not b!1251885) tp_is_empty!31689 (not b!1251890) (not b!1251888))
(check-sat b_and!44583 (not b_next!26787))
