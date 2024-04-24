; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105354 () Bool)

(assert start!105354)

(declare-fun b_free!26863 () Bool)

(declare-fun b_next!26863 () Bool)

(assert (=> start!105354 (= b_free!26863 (not b_next!26863))))

(declare-fun tp!94091 () Bool)

(declare-fun b_and!44669 () Bool)

(assert (=> start!105354 (= tp!94091 b_and!44669)))

(declare-fun b!1254129 () Bool)

(declare-fun e!712476 () Bool)

(declare-fun tp_is_empty!31765 () Bool)

(assert (=> b!1254129 (= e!712476 tp_is_empty!31765)))

(declare-fun mapNonEmpty!49420 () Bool)

(declare-fun mapRes!49420 () Bool)

(declare-fun tp!94090 () Bool)

(assert (=> mapNonEmpty!49420 (= mapRes!49420 (and tp!94090 e!712476))))

(declare-fun mapKey!49420 () (_ BitVec 32))

(declare-datatypes ((V!47719 0))(
  ( (V!47720 (val!15945 Int)) )
))
(declare-datatypes ((ValueCell!15119 0))(
  ( (ValueCellFull!15119 (v!18639 V!47719)) (EmptyCell!15119) )
))
(declare-fun mapValue!49420 () ValueCell!15119)

(declare-fun mapRest!49420 () (Array (_ BitVec 32) ValueCell!15119))

(declare-datatypes ((array!81235 0))(
  ( (array!81236 (arr!39176 (Array (_ BitVec 32) ValueCell!15119)) (size!39713 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81235)

(assert (=> mapNonEmpty!49420 (= (arr!39176 _values!914) (store mapRest!49420 mapKey!49420 mapValue!49420))))

(declare-fun b!1254130 () Bool)

(declare-fun res!835995 () Bool)

(declare-fun e!712478 () Bool)

(assert (=> b!1254130 (=> (not res!835995) (not e!712478))))

(declare-datatypes ((array!81237 0))(
  ( (array!81238 (arr!39177 (Array (_ BitVec 32) (_ BitVec 64))) (size!39714 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81237)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81237 (_ BitVec 32)) Bool)

(assert (=> b!1254130 (= res!835995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254131 () Bool)

(declare-fun res!835994 () Bool)

(assert (=> b!1254131 (=> (not res!835994) (not e!712478))))

(declare-datatypes ((List!27831 0))(
  ( (Nil!27828) (Cons!27827 (h!29045 (_ BitVec 64)) (t!41302 List!27831)) )
))
(declare-fun arrayNoDuplicates!0 (array!81237 (_ BitVec 32) List!27831) Bool)

(assert (=> b!1254131 (= res!835994 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27828))))

(declare-fun mapIsEmpty!49420 () Bool)

(assert (=> mapIsEmpty!49420 mapRes!49420))

(declare-fun b!1254133 () Bool)

(declare-fun e!712475 () Bool)

(declare-fun e!712477 () Bool)

(assert (=> b!1254133 (= e!712475 (and e!712477 mapRes!49420))))

(declare-fun condMapEmpty!49420 () Bool)

(declare-fun mapDefault!49420 () ValueCell!15119)

(assert (=> b!1254133 (= condMapEmpty!49420 (= (arr!39176 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15119)) mapDefault!49420)))))

(declare-fun b!1254134 () Bool)

(declare-fun res!835993 () Bool)

(assert (=> b!1254134 (=> (not res!835993) (not e!712478))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1254134 (= res!835993 (and (= (size!39713 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39714 _keys!1118) (size!39713 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254132 () Bool)

(declare-fun e!712474 () Bool)

(assert (=> b!1254132 (= e!712474 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20590 0))(
  ( (tuple2!20591 (_1!10306 (_ BitVec 64)) (_2!10306 V!47719)) )
))
(declare-datatypes ((List!27832 0))(
  ( (Nil!27829) (Cons!27828 (h!29046 tuple2!20590) (t!41303 List!27832)) )
))
(declare-datatypes ((ListLongMap!18471 0))(
  ( (ListLongMap!18472 (toList!9251 List!27832)) )
))
(declare-fun lt!566008 () ListLongMap!18471)

(declare-fun zeroValue!871 () V!47719)

(declare-fun minValueBefore!43 () V!47719)

(declare-fun getCurrentListMap!4490 (array!81237 array!81235 (_ BitVec 32) (_ BitVec 32) V!47719 V!47719 (_ BitVec 32) Int) ListLongMap!18471)

(assert (=> b!1254132 (= lt!566008 (getCurrentListMap!4490 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835996 () Bool)

(assert (=> start!105354 (=> (not res!835996) (not e!712478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105354 (= res!835996 (validMask!0 mask!1466))))

(assert (=> start!105354 e!712478))

(assert (=> start!105354 true))

(assert (=> start!105354 tp!94091))

(assert (=> start!105354 tp_is_empty!31765))

(declare-fun array_inv!29985 (array!81237) Bool)

(assert (=> start!105354 (array_inv!29985 _keys!1118)))

(declare-fun array_inv!29986 (array!81235) Bool)

(assert (=> start!105354 (and (array_inv!29986 _values!914) e!712475)))

(declare-fun b!1254135 () Bool)

(assert (=> b!1254135 (= e!712478 (not e!712474))))

(declare-fun res!835997 () Bool)

(assert (=> b!1254135 (=> res!835997 e!712474)))

(assert (=> b!1254135 (= res!835997 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!566010 () ListLongMap!18471)

(declare-fun lt!566009 () ListLongMap!18471)

(assert (=> b!1254135 (= lt!566010 lt!566009)))

(declare-fun minValueAfter!43 () V!47719)

(declare-datatypes ((Unit!41638 0))(
  ( (Unit!41639) )
))
(declare-fun lt!566007 () Unit!41638)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!991 (array!81237 array!81235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47719 V!47719 V!47719 V!47719 (_ BitVec 32) Int) Unit!41638)

(assert (=> b!1254135 (= lt!566007 (lemmaNoChangeToArrayThenSameMapNoExtras!991 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5677 (array!81237 array!81235 (_ BitVec 32) (_ BitVec 32) V!47719 V!47719 (_ BitVec 32) Int) ListLongMap!18471)

(assert (=> b!1254135 (= lt!566009 (getCurrentListMapNoExtraKeys!5677 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254135 (= lt!566010 (getCurrentListMapNoExtraKeys!5677 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254136 () Bool)

(assert (=> b!1254136 (= e!712477 tp_is_empty!31765)))

(assert (= (and start!105354 res!835996) b!1254134))

(assert (= (and b!1254134 res!835993) b!1254130))

(assert (= (and b!1254130 res!835995) b!1254131))

(assert (= (and b!1254131 res!835994) b!1254135))

(assert (= (and b!1254135 (not res!835997)) b!1254132))

(assert (= (and b!1254133 condMapEmpty!49420) mapIsEmpty!49420))

(assert (= (and b!1254133 (not condMapEmpty!49420)) mapNonEmpty!49420))

(get-info :version)

(assert (= (and mapNonEmpty!49420 ((_ is ValueCellFull!15119) mapValue!49420)) b!1254129))

(assert (= (and b!1254133 ((_ is ValueCellFull!15119) mapDefault!49420)) b!1254136))

(assert (= start!105354 b!1254133))

(declare-fun m!1154997 () Bool)

(assert (=> b!1254132 m!1154997))

(declare-fun m!1154999 () Bool)

(assert (=> b!1254130 m!1154999))

(declare-fun m!1155001 () Bool)

(assert (=> mapNonEmpty!49420 m!1155001))

(declare-fun m!1155003 () Bool)

(assert (=> b!1254131 m!1155003))

(declare-fun m!1155005 () Bool)

(assert (=> start!105354 m!1155005))

(declare-fun m!1155007 () Bool)

(assert (=> start!105354 m!1155007))

(declare-fun m!1155009 () Bool)

(assert (=> start!105354 m!1155009))

(declare-fun m!1155011 () Bool)

(assert (=> b!1254135 m!1155011))

(declare-fun m!1155013 () Bool)

(assert (=> b!1254135 m!1155013))

(declare-fun m!1155015 () Bool)

(assert (=> b!1254135 m!1155015))

(check-sat (not mapNonEmpty!49420) (not b!1254130) (not b!1254132) (not b!1254135) b_and!44669 (not b_next!26863) (not b!1254131) tp_is_empty!31765 (not start!105354))
(check-sat b_and!44669 (not b_next!26863))
