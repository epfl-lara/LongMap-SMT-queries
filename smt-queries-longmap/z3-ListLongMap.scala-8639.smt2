; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105360 () Bool)

(assert start!105360)

(declare-fun b_free!26869 () Bool)

(declare-fun b_next!26869 () Bool)

(assert (=> start!105360 (= b_free!26869 (not b_next!26869))))

(declare-fun tp!94108 () Bool)

(declare-fun b_and!44675 () Bool)

(assert (=> start!105360 (= tp!94108 b_and!44675)))

(declare-fun b!1254201 () Bool)

(declare-fun res!836042 () Bool)

(declare-fun e!712530 () Bool)

(assert (=> b!1254201 (=> (not res!836042) (not e!712530))))

(declare-datatypes ((array!81245 0))(
  ( (array!81246 (arr!39181 (Array (_ BitVec 32) (_ BitVec 64))) (size!39718 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81245)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81245 (_ BitVec 32)) Bool)

(assert (=> b!1254201 (= res!836042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254202 () Bool)

(declare-fun e!712533 () Bool)

(declare-fun tp_is_empty!31771 () Bool)

(assert (=> b!1254202 (= e!712533 tp_is_empty!31771)))

(declare-fun b!1254203 () Bool)

(declare-fun e!712532 () Bool)

(assert (=> b!1254203 (= e!712532 tp_is_empty!31771)))

(declare-fun b!1254204 () Bool)

(declare-fun e!712531 () Bool)

(declare-fun mapRes!49429 () Bool)

(assert (=> b!1254204 (= e!712531 (and e!712532 mapRes!49429))))

(declare-fun condMapEmpty!49429 () Bool)

(declare-datatypes ((V!47727 0))(
  ( (V!47728 (val!15948 Int)) )
))
(declare-datatypes ((ValueCell!15122 0))(
  ( (ValueCellFull!15122 (v!18642 V!47727)) (EmptyCell!15122) )
))
(declare-datatypes ((array!81247 0))(
  ( (array!81248 (arr!39182 (Array (_ BitVec 32) ValueCell!15122)) (size!39719 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81247)

(declare-fun mapDefault!49429 () ValueCell!15122)

(assert (=> b!1254204 (= condMapEmpty!49429 (= (arr!39182 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15122)) mapDefault!49429)))))

(declare-fun b!1254205 () Bool)

(declare-fun res!836041 () Bool)

(assert (=> b!1254205 (=> (not res!836041) (not e!712530))))

(declare-datatypes ((List!27834 0))(
  ( (Nil!27831) (Cons!27830 (h!29048 (_ BitVec 64)) (t!41305 List!27834)) )
))
(declare-fun arrayNoDuplicates!0 (array!81245 (_ BitVec 32) List!27834) Bool)

(assert (=> b!1254205 (= res!836041 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27831))))

(declare-fun mapIsEmpty!49429 () Bool)

(assert (=> mapIsEmpty!49429 mapRes!49429))

(declare-fun b!1254206 () Bool)

(declare-fun e!712529 () Bool)

(assert (=> b!1254206 (= e!712530 (not e!712529))))

(declare-fun res!836039 () Bool)

(assert (=> b!1254206 (=> res!836039 e!712529)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254206 (= res!836039 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20594 0))(
  ( (tuple2!20595 (_1!10308 (_ BitVec 64)) (_2!10308 V!47727)) )
))
(declare-datatypes ((List!27835 0))(
  ( (Nil!27832) (Cons!27831 (h!29049 tuple2!20594) (t!41306 List!27835)) )
))
(declare-datatypes ((ListLongMap!18475 0))(
  ( (ListLongMap!18476 (toList!9253 List!27835)) )
))
(declare-fun lt!566046 () ListLongMap!18475)

(declare-fun lt!566043 () ListLongMap!18475)

(assert (=> b!1254206 (= lt!566046 lt!566043)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41642 0))(
  ( (Unit!41643) )
))
(declare-fun lt!566045 () Unit!41642)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47727)

(declare-fun minValueBefore!43 () V!47727)

(declare-fun minValueAfter!43 () V!47727)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!993 (array!81245 array!81247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 V!47727 V!47727 (_ BitVec 32) Int) Unit!41642)

(assert (=> b!1254206 (= lt!566045 (lemmaNoChangeToArrayThenSameMapNoExtras!993 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5679 (array!81245 array!81247 (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 (_ BitVec 32) Int) ListLongMap!18475)

(assert (=> b!1254206 (= lt!566043 (getCurrentListMapNoExtraKeys!5679 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254206 (= lt!566046 (getCurrentListMapNoExtraKeys!5679 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254207 () Bool)

(declare-fun res!836040 () Bool)

(assert (=> b!1254207 (=> (not res!836040) (not e!712530))))

(assert (=> b!1254207 (= res!836040 (and (= (size!39719 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39718 _keys!1118) (size!39719 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49429 () Bool)

(declare-fun tp!94109 () Bool)

(assert (=> mapNonEmpty!49429 (= mapRes!49429 (and tp!94109 e!712533))))

(declare-fun mapValue!49429 () ValueCell!15122)

(declare-fun mapRest!49429 () (Array (_ BitVec 32) ValueCell!15122))

(declare-fun mapKey!49429 () (_ BitVec 32))

(assert (=> mapNonEmpty!49429 (= (arr!39182 _values!914) (store mapRest!49429 mapKey!49429 mapValue!49429))))

(declare-fun b!1254208 () Bool)

(assert (=> b!1254208 (= e!712529 true)))

(declare-fun lt!566044 () ListLongMap!18475)

(declare-fun getCurrentListMap!4492 (array!81245 array!81247 (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 (_ BitVec 32) Int) ListLongMap!18475)

(assert (=> b!1254208 (= lt!566044 (getCurrentListMap!4492 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836038 () Bool)

(assert (=> start!105360 (=> (not res!836038) (not e!712530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105360 (= res!836038 (validMask!0 mask!1466))))

(assert (=> start!105360 e!712530))

(assert (=> start!105360 true))

(assert (=> start!105360 tp!94108))

(assert (=> start!105360 tp_is_empty!31771))

(declare-fun array_inv!29987 (array!81245) Bool)

(assert (=> start!105360 (array_inv!29987 _keys!1118)))

(declare-fun array_inv!29988 (array!81247) Bool)

(assert (=> start!105360 (and (array_inv!29988 _values!914) e!712531)))

(assert (= (and start!105360 res!836038) b!1254207))

(assert (= (and b!1254207 res!836040) b!1254201))

(assert (= (and b!1254201 res!836042) b!1254205))

(assert (= (and b!1254205 res!836041) b!1254206))

(assert (= (and b!1254206 (not res!836039)) b!1254208))

(assert (= (and b!1254204 condMapEmpty!49429) mapIsEmpty!49429))

(assert (= (and b!1254204 (not condMapEmpty!49429)) mapNonEmpty!49429))

(get-info :version)

(assert (= (and mapNonEmpty!49429 ((_ is ValueCellFull!15122) mapValue!49429)) b!1254202))

(assert (= (and b!1254204 ((_ is ValueCellFull!15122) mapDefault!49429)) b!1254203))

(assert (= start!105360 b!1254204))

(declare-fun m!1155057 () Bool)

(assert (=> mapNonEmpty!49429 m!1155057))

(declare-fun m!1155059 () Bool)

(assert (=> b!1254208 m!1155059))

(declare-fun m!1155061 () Bool)

(assert (=> b!1254205 m!1155061))

(declare-fun m!1155063 () Bool)

(assert (=> b!1254206 m!1155063))

(declare-fun m!1155065 () Bool)

(assert (=> b!1254206 m!1155065))

(declare-fun m!1155067 () Bool)

(assert (=> b!1254206 m!1155067))

(declare-fun m!1155069 () Bool)

(assert (=> b!1254201 m!1155069))

(declare-fun m!1155071 () Bool)

(assert (=> start!105360 m!1155071))

(declare-fun m!1155073 () Bool)

(assert (=> start!105360 m!1155073))

(declare-fun m!1155075 () Bool)

(assert (=> start!105360 m!1155075))

(check-sat tp_is_empty!31771 (not b!1254201) (not b!1254208) (not b!1254205) (not mapNonEmpty!49429) (not b_next!26869) (not b!1254206) (not start!105360) b_and!44675)
(check-sat b_and!44675 (not b_next!26869))
