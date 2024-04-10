; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105184 () Bool)

(assert start!105184)

(declare-fun b_free!26901 () Bool)

(declare-fun b_next!26901 () Bool)

(assert (=> start!105184 (= b_free!26901 (not b_next!26901))))

(declare-fun tp!94207 () Bool)

(declare-fun b_and!44715 () Bool)

(assert (=> start!105184 (= tp!94207 b_and!44715)))

(declare-fun b!1253437 () Bool)

(declare-fun e!712075 () Bool)

(declare-fun e!712077 () Bool)

(declare-fun mapRes!49480 () Bool)

(assert (=> b!1253437 (= e!712075 (and e!712077 mapRes!49480))))

(declare-fun condMapEmpty!49480 () Bool)

(declare-datatypes ((V!47769 0))(
  ( (V!47770 (val!15964 Int)) )
))
(declare-datatypes ((ValueCell!15138 0))(
  ( (ValueCellFull!15138 (v!18662 V!47769)) (EmptyCell!15138) )
))
(declare-datatypes ((array!81264 0))(
  ( (array!81265 (arr!39194 (Array (_ BitVec 32) ValueCell!15138)) (size!39730 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81264)

(declare-fun mapDefault!49480 () ValueCell!15138)

(assert (=> b!1253437 (= condMapEmpty!49480 (= (arr!39194 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15138)) mapDefault!49480)))))

(declare-fun b!1253438 () Bool)

(declare-fun e!712074 () Bool)

(assert (=> b!1253438 (= e!712074 true)))

(declare-datatypes ((tuple2!20602 0))(
  ( (tuple2!20603 (_1!10312 (_ BitVec 64)) (_2!10312 V!47769)) )
))
(declare-datatypes ((List!27831 0))(
  ( (Nil!27828) (Cons!27827 (h!29036 tuple2!20602) (t!41312 List!27831)) )
))
(declare-datatypes ((ListLongMap!18475 0))(
  ( (ListLongMap!18476 (toList!9253 List!27831)) )
))
(declare-fun lt!565974 () ListLongMap!18475)

(declare-fun lt!565970 () ListLongMap!18475)

(declare-fun -!2026 (ListLongMap!18475 (_ BitVec 64)) ListLongMap!18475)

(assert (=> b!1253438 (= lt!565974 (-!2026 lt!565970 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565971 () ListLongMap!18475)

(declare-fun lt!565972 () ListLongMap!18475)

(assert (=> b!1253438 (= (-!2026 lt!565971 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565972)))

(declare-datatypes ((Unit!41688 0))(
  ( (Unit!41689) )
))
(declare-fun lt!565969 () Unit!41688)

(declare-fun minValueBefore!43 () V!47769)

(declare-fun addThenRemoveForNewKeyIsSame!296 (ListLongMap!18475 (_ BitVec 64) V!47769) Unit!41688)

(assert (=> b!1253438 (= lt!565969 (addThenRemoveForNewKeyIsSame!296 lt!565972 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565968 () ListLongMap!18475)

(declare-fun lt!565973 () ListLongMap!18475)

(assert (=> b!1253438 (and (= lt!565970 lt!565971) (= lt!565973 lt!565968))))

(declare-fun +!4149 (ListLongMap!18475 tuple2!20602) ListLongMap!18475)

(assert (=> b!1253438 (= lt!565971 (+!4149 lt!565972 (tuple2!20603 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47769)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47769)

(declare-datatypes ((array!81266 0))(
  ( (array!81267 (arr!39195 (Array (_ BitVec 32) (_ BitVec 64))) (size!39731 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81266)

(declare-fun getCurrentListMap!4497 (array!81266 array!81264 (_ BitVec 32) (_ BitVec 32) V!47769 V!47769 (_ BitVec 32) Int) ListLongMap!18475)

(assert (=> b!1253438 (= lt!565973 (getCurrentListMap!4497 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253438 (= lt!565970 (getCurrentListMap!4497 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253439 () Bool)

(declare-fun tp_is_empty!31803 () Bool)

(assert (=> b!1253439 (= e!712077 tp_is_empty!31803)))

(declare-fun mapNonEmpty!49480 () Bool)

(declare-fun tp!94208 () Bool)

(declare-fun e!712072 () Bool)

(assert (=> mapNonEmpty!49480 (= mapRes!49480 (and tp!94208 e!712072))))

(declare-fun mapValue!49480 () ValueCell!15138)

(declare-fun mapKey!49480 () (_ BitVec 32))

(declare-fun mapRest!49480 () (Array (_ BitVec 32) ValueCell!15138))

(assert (=> mapNonEmpty!49480 (= (arr!39194 _values!914) (store mapRest!49480 mapKey!49480 mapValue!49480))))

(declare-fun b!1253440 () Bool)

(assert (=> b!1253440 (= e!712072 tp_is_empty!31803)))

(declare-fun b!1253441 () Bool)

(declare-fun res!835828 () Bool)

(declare-fun e!712073 () Bool)

(assert (=> b!1253441 (=> (not res!835828) (not e!712073))))

(declare-datatypes ((List!27832 0))(
  ( (Nil!27829) (Cons!27828 (h!29037 (_ BitVec 64)) (t!41313 List!27832)) )
))
(declare-fun arrayNoDuplicates!0 (array!81266 (_ BitVec 32) List!27832) Bool)

(assert (=> b!1253441 (= res!835828 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27829))))

(declare-fun res!835826 () Bool)

(assert (=> start!105184 (=> (not res!835826) (not e!712073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105184 (= res!835826 (validMask!0 mask!1466))))

(assert (=> start!105184 e!712073))

(assert (=> start!105184 true))

(assert (=> start!105184 tp!94207))

(assert (=> start!105184 tp_is_empty!31803))

(declare-fun array_inv!29881 (array!81266) Bool)

(assert (=> start!105184 (array_inv!29881 _keys!1118)))

(declare-fun array_inv!29882 (array!81264) Bool)

(assert (=> start!105184 (and (array_inv!29882 _values!914) e!712075)))

(declare-fun b!1253442 () Bool)

(declare-fun res!835825 () Bool)

(assert (=> b!1253442 (=> (not res!835825) (not e!712073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81266 (_ BitVec 32)) Bool)

(assert (=> b!1253442 (= res!835825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253443 () Bool)

(declare-fun res!835829 () Bool)

(assert (=> b!1253443 (=> (not res!835829) (not e!712073))))

(assert (=> b!1253443 (= res!835829 (and (= (size!39730 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39731 _keys!1118) (size!39730 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253444 () Bool)

(assert (=> b!1253444 (= e!712073 (not e!712074))))

(declare-fun res!835827 () Bool)

(assert (=> b!1253444 (=> res!835827 e!712074)))

(assert (=> b!1253444 (= res!835827 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253444 (= lt!565972 lt!565968)))

(declare-fun lt!565967 () Unit!41688)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1008 (array!81266 array!81264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47769 V!47769 V!47769 V!47769 (_ BitVec 32) Int) Unit!41688)

(assert (=> b!1253444 (= lt!565967 (lemmaNoChangeToArrayThenSameMapNoExtras!1008 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5644 (array!81266 array!81264 (_ BitVec 32) (_ BitVec 32) V!47769 V!47769 (_ BitVec 32) Int) ListLongMap!18475)

(assert (=> b!1253444 (= lt!565968 (getCurrentListMapNoExtraKeys!5644 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253444 (= lt!565972 (getCurrentListMapNoExtraKeys!5644 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49480 () Bool)

(assert (=> mapIsEmpty!49480 mapRes!49480))

(assert (= (and start!105184 res!835826) b!1253443))

(assert (= (and b!1253443 res!835829) b!1253442))

(assert (= (and b!1253442 res!835825) b!1253441))

(assert (= (and b!1253441 res!835828) b!1253444))

(assert (= (and b!1253444 (not res!835827)) b!1253438))

(assert (= (and b!1253437 condMapEmpty!49480) mapIsEmpty!49480))

(assert (= (and b!1253437 (not condMapEmpty!49480)) mapNonEmpty!49480))

(get-info :version)

(assert (= (and mapNonEmpty!49480 ((_ is ValueCellFull!15138) mapValue!49480)) b!1253440))

(assert (= (and b!1253437 ((_ is ValueCellFull!15138) mapDefault!49480)) b!1253439))

(assert (= start!105184 b!1253437))

(declare-fun m!1153965 () Bool)

(assert (=> b!1253444 m!1153965))

(declare-fun m!1153967 () Bool)

(assert (=> b!1253444 m!1153967))

(declare-fun m!1153969 () Bool)

(assert (=> b!1253444 m!1153969))

(declare-fun m!1153971 () Bool)

(assert (=> b!1253441 m!1153971))

(declare-fun m!1153973 () Bool)

(assert (=> start!105184 m!1153973))

(declare-fun m!1153975 () Bool)

(assert (=> start!105184 m!1153975))

(declare-fun m!1153977 () Bool)

(assert (=> start!105184 m!1153977))

(declare-fun m!1153979 () Bool)

(assert (=> mapNonEmpty!49480 m!1153979))

(declare-fun m!1153981 () Bool)

(assert (=> b!1253442 m!1153981))

(declare-fun m!1153983 () Bool)

(assert (=> b!1253438 m!1153983))

(declare-fun m!1153985 () Bool)

(assert (=> b!1253438 m!1153985))

(declare-fun m!1153987 () Bool)

(assert (=> b!1253438 m!1153987))

(declare-fun m!1153989 () Bool)

(assert (=> b!1253438 m!1153989))

(declare-fun m!1153991 () Bool)

(assert (=> b!1253438 m!1153991))

(declare-fun m!1153993 () Bool)

(assert (=> b!1253438 m!1153993))

(check-sat b_and!44715 (not b!1253444) (not mapNonEmpty!49480) (not b_next!26901) (not b!1253438) tp_is_empty!31803 (not start!105184) (not b!1253442) (not b!1253441))
(check-sat b_and!44715 (not b_next!26901))
