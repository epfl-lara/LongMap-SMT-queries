; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105706 () Bool)

(assert start!105706)

(declare-fun b_free!27295 () Bool)

(declare-fun b_next!27295 () Bool)

(assert (=> start!105706 (= b_free!27295 (not b_next!27295))))

(declare-fun tp!95411 () Bool)

(declare-fun b_and!45161 () Bool)

(assert (=> start!105706 (= tp!95411 b_and!45161)))

(declare-fun b!1259121 () Bool)

(declare-fun e!716256 () Bool)

(assert (=> b!1259121 (= e!716256 true)))

(declare-datatypes ((V!48295 0))(
  ( (V!48296 (val!16161 Int)) )
))
(declare-datatypes ((tuple2!20972 0))(
  ( (tuple2!20973 (_1!10497 (_ BitVec 64)) (_2!10497 V!48295)) )
))
(declare-datatypes ((List!28177 0))(
  ( (Nil!28174) (Cons!28173 (h!29382 tuple2!20972) (t!41663 List!28177)) )
))
(declare-datatypes ((ListLongMap!18845 0))(
  ( (ListLongMap!18846 (toList!9438 List!28177)) )
))
(declare-fun lt!569630 () ListLongMap!18845)

(declare-fun lt!569635 () ListLongMap!18845)

(declare-fun -!2060 (ListLongMap!18845 (_ BitVec 64)) ListLongMap!18845)

(assert (=> b!1259121 (= lt!569630 (-!2060 lt!569635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569637 () ListLongMap!18845)

(declare-fun lt!569632 () ListLongMap!18845)

(assert (=> b!1259121 (= (-!2060 lt!569637 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569632)))

(declare-datatypes ((Unit!41820 0))(
  ( (Unit!41821) )
))
(declare-fun lt!569629 () Unit!41820)

(declare-fun minValueBefore!43 () V!48295)

(declare-fun addThenRemoveForNewKeyIsSame!317 (ListLongMap!18845 (_ BitVec 64) V!48295) Unit!41820)

(assert (=> b!1259121 (= lt!569629 (addThenRemoveForNewKeyIsSame!317 lt!569632 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716254 () Bool)

(assert (=> b!1259121 e!716254))

(declare-fun res!839184 () Bool)

(assert (=> b!1259121 (=> (not res!839184) (not e!716254))))

(assert (=> b!1259121 (= res!839184 (= lt!569635 lt!569637))))

(declare-fun +!4240 (ListLongMap!18845 tuple2!20972) ListLongMap!18845)

(assert (=> b!1259121 (= lt!569637 (+!4240 lt!569632 (tuple2!20973 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569636 () ListLongMap!18845)

(declare-fun lt!569631 () tuple2!20972)

(assert (=> b!1259121 (= lt!569632 (+!4240 lt!569636 lt!569631))))

(declare-fun zeroValue!871 () V!48295)

(assert (=> b!1259121 (= lt!569631 (tuple2!20973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48295)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81939 0))(
  ( (array!81940 (arr!39525 (Array (_ BitVec 32) (_ BitVec 64))) (size!40063 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81939)

(declare-fun lt!569628 () ListLongMap!18845)

(declare-datatypes ((ValueCell!15335 0))(
  ( (ValueCellFull!15335 (v!18862 V!48295)) (EmptyCell!15335) )
))
(declare-datatypes ((array!81941 0))(
  ( (array!81942 (arr!39526 (Array (_ BitVec 32) ValueCell!15335)) (size!40064 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81941)

(declare-fun getCurrentListMap!4526 (array!81939 array!81941 (_ BitVec 32) (_ BitVec 32) V!48295 V!48295 (_ BitVec 32) Int) ListLongMap!18845)

(assert (=> b!1259121 (= lt!569628 (getCurrentListMap!4526 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259121 (= lt!569635 (getCurrentListMap!4526 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259122 () Bool)

(declare-fun e!716255 () Bool)

(assert (=> b!1259122 (= e!716255 (not e!716256))))

(declare-fun res!839185 () Bool)

(assert (=> b!1259122 (=> res!839185 e!716256)))

(assert (=> b!1259122 (= res!839185 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569634 () ListLongMap!18845)

(assert (=> b!1259122 (= lt!569636 lt!569634)))

(declare-fun lt!569633 () Unit!41820)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1133 (array!81939 array!81941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48295 V!48295 V!48295 V!48295 (_ BitVec 32) Int) Unit!41820)

(assert (=> b!1259122 (= lt!569633 (lemmaNoChangeToArrayThenSameMapNoExtras!1133 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5811 (array!81939 array!81941 (_ BitVec 32) (_ BitVec 32) V!48295 V!48295 (_ BitVec 32) Int) ListLongMap!18845)

(assert (=> b!1259122 (= lt!569634 (getCurrentListMapNoExtraKeys!5811 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259122 (= lt!569636 (getCurrentListMapNoExtraKeys!5811 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259123 () Bool)

(declare-fun res!839189 () Bool)

(assert (=> b!1259123 (=> (not res!839189) (not e!716255))))

(assert (=> b!1259123 (= res!839189 (and (= (size!40064 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40063 _keys!1118) (size!40064 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50092 () Bool)

(declare-fun mapRes!50092 () Bool)

(declare-fun tp!95410 () Bool)

(declare-fun e!716257 () Bool)

(assert (=> mapNonEmpty!50092 (= mapRes!50092 (and tp!95410 e!716257))))

(declare-fun mapValue!50092 () ValueCell!15335)

(declare-fun mapKey!50092 () (_ BitVec 32))

(declare-fun mapRest!50092 () (Array (_ BitVec 32) ValueCell!15335))

(assert (=> mapNonEmpty!50092 (= (arr!39526 _values!914) (store mapRest!50092 mapKey!50092 mapValue!50092))))

(declare-fun res!839186 () Bool)

(assert (=> start!105706 (=> (not res!839186) (not e!716255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105706 (= res!839186 (validMask!0 mask!1466))))

(assert (=> start!105706 e!716255))

(assert (=> start!105706 true))

(assert (=> start!105706 tp!95411))

(declare-fun tp_is_empty!32197 () Bool)

(assert (=> start!105706 tp_is_empty!32197))

(declare-fun array_inv!30239 (array!81939) Bool)

(assert (=> start!105706 (array_inv!30239 _keys!1118)))

(declare-fun e!716253 () Bool)

(declare-fun array_inv!30240 (array!81941) Bool)

(assert (=> start!105706 (and (array_inv!30240 _values!914) e!716253)))

(declare-fun b!1259124 () Bool)

(declare-fun res!839188 () Bool)

(assert (=> b!1259124 (=> (not res!839188) (not e!716255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81939 (_ BitVec 32)) Bool)

(assert (=> b!1259124 (= res!839188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259125 () Bool)

(declare-fun res!839187 () Bool)

(assert (=> b!1259125 (=> (not res!839187) (not e!716255))))

(declare-datatypes ((List!28178 0))(
  ( (Nil!28175) (Cons!28174 (h!29383 (_ BitVec 64)) (t!41664 List!28178)) )
))
(declare-fun arrayNoDuplicates!0 (array!81939 (_ BitVec 32) List!28178) Bool)

(assert (=> b!1259125 (= res!839187 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28175))))

(declare-fun b!1259126 () Bool)

(assert (=> b!1259126 (= e!716254 (= lt!569628 (+!4240 lt!569634 lt!569631)))))

(declare-fun mapIsEmpty!50092 () Bool)

(assert (=> mapIsEmpty!50092 mapRes!50092))

(declare-fun b!1259127 () Bool)

(declare-fun e!716258 () Bool)

(assert (=> b!1259127 (= e!716253 (and e!716258 mapRes!50092))))

(declare-fun condMapEmpty!50092 () Bool)

(declare-fun mapDefault!50092 () ValueCell!15335)

(assert (=> b!1259127 (= condMapEmpty!50092 (= (arr!39526 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15335)) mapDefault!50092)))))

(declare-fun b!1259128 () Bool)

(assert (=> b!1259128 (= e!716257 tp_is_empty!32197)))

(declare-fun b!1259129 () Bool)

(assert (=> b!1259129 (= e!716258 tp_is_empty!32197)))

(assert (= (and start!105706 res!839186) b!1259123))

(assert (= (and b!1259123 res!839189) b!1259124))

(assert (= (and b!1259124 res!839188) b!1259125))

(assert (= (and b!1259125 res!839187) b!1259122))

(assert (= (and b!1259122 (not res!839185)) b!1259121))

(assert (= (and b!1259121 res!839184) b!1259126))

(assert (= (and b!1259127 condMapEmpty!50092) mapIsEmpty!50092))

(assert (= (and b!1259127 (not condMapEmpty!50092)) mapNonEmpty!50092))

(get-info :version)

(assert (= (and mapNonEmpty!50092 ((_ is ValueCellFull!15335) mapValue!50092)) b!1259128))

(assert (= (and b!1259127 ((_ is ValueCellFull!15335) mapDefault!50092)) b!1259129))

(assert (= start!105706 b!1259127))

(declare-fun m!1159097 () Bool)

(assert (=> mapNonEmpty!50092 m!1159097))

(declare-fun m!1159099 () Bool)

(assert (=> start!105706 m!1159099))

(declare-fun m!1159101 () Bool)

(assert (=> start!105706 m!1159101))

(declare-fun m!1159103 () Bool)

(assert (=> start!105706 m!1159103))

(declare-fun m!1159105 () Bool)

(assert (=> b!1259126 m!1159105))

(declare-fun m!1159107 () Bool)

(assert (=> b!1259122 m!1159107))

(declare-fun m!1159109 () Bool)

(assert (=> b!1259122 m!1159109))

(declare-fun m!1159111 () Bool)

(assert (=> b!1259122 m!1159111))

(declare-fun m!1159113 () Bool)

(assert (=> b!1259124 m!1159113))

(declare-fun m!1159115 () Bool)

(assert (=> b!1259125 m!1159115))

(declare-fun m!1159117 () Bool)

(assert (=> b!1259121 m!1159117))

(declare-fun m!1159119 () Bool)

(assert (=> b!1259121 m!1159119))

(declare-fun m!1159121 () Bool)

(assert (=> b!1259121 m!1159121))

(declare-fun m!1159123 () Bool)

(assert (=> b!1259121 m!1159123))

(declare-fun m!1159125 () Bool)

(assert (=> b!1259121 m!1159125))

(declare-fun m!1159127 () Bool)

(assert (=> b!1259121 m!1159127))

(declare-fun m!1159129 () Bool)

(assert (=> b!1259121 m!1159129))

(check-sat (not mapNonEmpty!50092) (not b!1259122) (not b_next!27295) b_and!45161 (not b!1259121) (not b!1259125) tp_is_empty!32197 (not start!105706) (not b!1259126) (not b!1259124))
(check-sat b_and!45161 (not b_next!27295))
