; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105064 () Bool)

(assert start!105064)

(declare-fun b_free!26815 () Bool)

(declare-fun b_next!26815 () Bool)

(assert (=> start!105064 (= b_free!26815 (not b_next!26815))))

(declare-fun tp!93943 () Bool)

(declare-fun b_and!44593 () Bool)

(assert (=> start!105064 (= tp!93943 b_and!44593)))

(declare-fun res!835059 () Bool)

(declare-fun e!711113 () Bool)

(assert (=> start!105064 (=> (not res!835059) (not e!711113))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105064 (= res!835059 (validMask!0 mask!1466))))

(assert (=> start!105064 e!711113))

(assert (=> start!105064 true))

(assert (=> start!105064 tp!93943))

(declare-fun tp_is_empty!31717 () Bool)

(assert (=> start!105064 tp_is_empty!31717))

(declare-datatypes ((array!81019 0))(
  ( (array!81020 (arr!39074 (Array (_ BitVec 32) (_ BitVec 64))) (size!39612 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81019)

(declare-fun array_inv!29929 (array!81019) Bool)

(assert (=> start!105064 (array_inv!29929 _keys!1118)))

(declare-datatypes ((V!47655 0))(
  ( (V!47656 (val!15921 Int)) )
))
(declare-datatypes ((ValueCell!15095 0))(
  ( (ValueCellFull!15095 (v!18618 V!47655)) (EmptyCell!15095) )
))
(declare-datatypes ((array!81021 0))(
  ( (array!81022 (arr!39075 (Array (_ BitVec 32) ValueCell!15095)) (size!39613 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81021)

(declare-fun e!711112 () Bool)

(declare-fun array_inv!29930 (array!81021) Bool)

(assert (=> start!105064 (and (array_inv!29930 _values!914) e!711112)))

(declare-fun b!1252097 () Bool)

(declare-fun res!835058 () Bool)

(assert (=> b!1252097 (=> (not res!835058) (not e!711113))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252097 (= res!835058 (and (= (size!39613 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39612 _keys!1118) (size!39613 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252098 () Bool)

(declare-fun res!835061 () Bool)

(assert (=> b!1252098 (=> (not res!835061) (not e!711113))))

(declare-datatypes ((List!27837 0))(
  ( (Nil!27834) (Cons!27833 (h!29042 (_ BitVec 64)) (t!41305 List!27837)) )
))
(declare-fun arrayNoDuplicates!0 (array!81019 (_ BitVec 32) List!27837) Bool)

(assert (=> b!1252098 (= res!835061 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27834))))

(declare-fun b!1252099 () Bool)

(declare-fun e!711114 () Bool)

(declare-fun mapRes!49345 () Bool)

(assert (=> b!1252099 (= e!711112 (and e!711114 mapRes!49345))))

(declare-fun condMapEmpty!49345 () Bool)

(declare-fun mapDefault!49345 () ValueCell!15095)

(assert (=> b!1252099 (= condMapEmpty!49345 (= (arr!39075 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15095)) mapDefault!49345)))))

(declare-fun b!1252100 () Bool)

(declare-fun e!711111 () Bool)

(assert (=> b!1252100 (= e!711111 tp_is_empty!31717)))

(declare-fun mapIsEmpty!49345 () Bool)

(assert (=> mapIsEmpty!49345 mapRes!49345))

(declare-fun b!1252101 () Bool)

(assert (=> b!1252101 (= e!711113 (not true))))

(declare-datatypes ((tuple2!20624 0))(
  ( (tuple2!20625 (_1!10323 (_ BitVec 64)) (_2!10323 V!47655)) )
))
(declare-datatypes ((List!27838 0))(
  ( (Nil!27835) (Cons!27834 (h!29043 tuple2!20624) (t!41306 List!27838)) )
))
(declare-datatypes ((ListLongMap!18497 0))(
  ( (ListLongMap!18498 (toList!9264 List!27838)) )
))
(declare-fun lt!565034 () ListLongMap!18497)

(declare-fun lt!565033 () ListLongMap!18497)

(assert (=> b!1252101 (= lt!565034 lt!565033)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41494 0))(
  ( (Unit!41495) )
))
(declare-fun lt!565032 () Unit!41494)

(declare-fun minValueAfter!43 () V!47655)

(declare-fun zeroValue!871 () V!47655)

(declare-fun minValueBefore!43 () V!47655)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!990 (array!81019 array!81021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47655 V!47655 V!47655 V!47655 (_ BitVec 32) Int) Unit!41494)

(assert (=> b!1252101 (= lt!565032 (lemmaNoChangeToArrayThenSameMapNoExtras!990 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5668 (array!81019 array!81021 (_ BitVec 32) (_ BitVec 32) V!47655 V!47655 (_ BitVec 32) Int) ListLongMap!18497)

(assert (=> b!1252101 (= lt!565033 (getCurrentListMapNoExtraKeys!5668 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252101 (= lt!565034 (getCurrentListMapNoExtraKeys!5668 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252102 () Bool)

(assert (=> b!1252102 (= e!711114 tp_is_empty!31717)))

(declare-fun mapNonEmpty!49345 () Bool)

(declare-fun tp!93944 () Bool)

(assert (=> mapNonEmpty!49345 (= mapRes!49345 (and tp!93944 e!711111))))

(declare-fun mapKey!49345 () (_ BitVec 32))

(declare-fun mapRest!49345 () (Array (_ BitVec 32) ValueCell!15095))

(declare-fun mapValue!49345 () ValueCell!15095)

(assert (=> mapNonEmpty!49345 (= (arr!39075 _values!914) (store mapRest!49345 mapKey!49345 mapValue!49345))))

(declare-fun b!1252103 () Bool)

(declare-fun res!835060 () Bool)

(assert (=> b!1252103 (=> (not res!835060) (not e!711113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81019 (_ BitVec 32)) Bool)

(assert (=> b!1252103 (= res!835060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105064 res!835059) b!1252097))

(assert (= (and b!1252097 res!835058) b!1252103))

(assert (= (and b!1252103 res!835060) b!1252098))

(assert (= (and b!1252098 res!835061) b!1252101))

(assert (= (and b!1252099 condMapEmpty!49345) mapIsEmpty!49345))

(assert (= (and b!1252099 (not condMapEmpty!49345)) mapNonEmpty!49345))

(get-info :version)

(assert (= (and mapNonEmpty!49345 ((_ is ValueCellFull!15095) mapValue!49345)) b!1252100))

(assert (= (and b!1252099 ((_ is ValueCellFull!15095) mapDefault!49345)) b!1252102))

(assert (= start!105064 b!1252099))

(declare-fun m!1152331 () Bool)

(assert (=> b!1252101 m!1152331))

(declare-fun m!1152333 () Bool)

(assert (=> b!1252101 m!1152333))

(declare-fun m!1152335 () Bool)

(assert (=> b!1252101 m!1152335))

(declare-fun m!1152337 () Bool)

(assert (=> b!1252103 m!1152337))

(declare-fun m!1152339 () Bool)

(assert (=> b!1252098 m!1152339))

(declare-fun m!1152341 () Bool)

(assert (=> start!105064 m!1152341))

(declare-fun m!1152343 () Bool)

(assert (=> start!105064 m!1152343))

(declare-fun m!1152345 () Bool)

(assert (=> start!105064 m!1152345))

(declare-fun m!1152347 () Bool)

(assert (=> mapNonEmpty!49345 m!1152347))

(check-sat tp_is_empty!31717 (not b!1252103) (not start!105064) (not b!1252098) (not b_next!26815) (not mapNonEmpty!49345) b_and!44593 (not b!1252101))
(check-sat b_and!44593 (not b_next!26815))
