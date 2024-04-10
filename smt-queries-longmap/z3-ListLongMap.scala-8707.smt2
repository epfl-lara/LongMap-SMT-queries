; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105694 () Bool)

(assert start!105694)

(declare-fun b_free!27279 () Bool)

(declare-fun b_next!27279 () Bool)

(assert (=> start!105694 (= b_free!27279 (not b_next!27279))))

(declare-fun tp!95362 () Bool)

(declare-fun b_and!45163 () Bool)

(assert (=> start!105694 (= tp!95362 b_and!45163)))

(declare-fun b!1258987 () Bool)

(declare-fun e!716134 () Bool)

(declare-fun e!716132 () Bool)

(assert (=> b!1258987 (= e!716134 (not e!716132))))

(declare-fun res!839082 () Bool)

(assert (=> b!1258987 (=> res!839082 e!716132)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258987 (= res!839082 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48273 0))(
  ( (V!48274 (val!16153 Int)) )
))
(declare-datatypes ((tuple2!20872 0))(
  ( (tuple2!20873 (_1!10447 (_ BitVec 64)) (_2!10447 V!48273)) )
))
(declare-datatypes ((List!28082 0))(
  ( (Nil!28079) (Cons!28078 (h!29287 tuple2!20872) (t!41577 List!28082)) )
))
(declare-datatypes ((ListLongMap!18745 0))(
  ( (ListLongMap!18746 (toList!9388 List!28082)) )
))
(declare-fun lt!569567 () ListLongMap!18745)

(declare-fun lt!569575 () ListLongMap!18745)

(assert (=> b!1258987 (= lt!569567 lt!569575)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48273)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48273)

(declare-datatypes ((array!81982 0))(
  ( (array!81983 (arr!39546 (Array (_ BitVec 32) (_ BitVec 64))) (size!40082 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81982)

(declare-datatypes ((ValueCell!15327 0))(
  ( (ValueCellFull!15327 (v!18855 V!48273)) (EmptyCell!15327) )
))
(declare-datatypes ((array!81984 0))(
  ( (array!81985 (arr!39547 (Array (_ BitVec 32) ValueCell!15327)) (size!40083 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81984)

(declare-datatypes ((Unit!41959 0))(
  ( (Unit!41960) )
))
(declare-fun lt!569569 () Unit!41959)

(declare-fun minValueBefore!43 () V!48273)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1129 (array!81982 array!81984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48273 V!48273 V!48273 V!48273 (_ BitVec 32) Int) Unit!41959)

(assert (=> b!1258987 (= lt!569569 (lemmaNoChangeToArrayThenSameMapNoExtras!1129 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5765 (array!81982 array!81984 (_ BitVec 32) (_ BitVec 32) V!48273 V!48273 (_ BitVec 32) Int) ListLongMap!18745)

(assert (=> b!1258987 (= lt!569575 (getCurrentListMapNoExtraKeys!5765 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258987 (= lt!569567 (getCurrentListMapNoExtraKeys!5765 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258988 () Bool)

(declare-fun res!839084 () Bool)

(assert (=> b!1258988 (=> (not res!839084) (not e!716134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81982 (_ BitVec 32)) Bool)

(assert (=> b!1258988 (= res!839084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50068 () Bool)

(declare-fun mapRes!50068 () Bool)

(assert (=> mapIsEmpty!50068 mapRes!50068))

(declare-fun b!1258990 () Bool)

(declare-fun e!716136 () Bool)

(declare-fun tp_is_empty!32181 () Bool)

(assert (=> b!1258990 (= e!716136 tp_is_empty!32181)))

(declare-fun lt!569574 () ListLongMap!18745)

(declare-fun e!716130 () Bool)

(declare-fun lt!569573 () tuple2!20872)

(declare-fun b!1258991 () Bool)

(declare-fun +!4194 (ListLongMap!18745 tuple2!20872) ListLongMap!18745)

(assert (=> b!1258991 (= e!716130 (= lt!569574 (+!4194 lt!569575 lt!569573)))))

(declare-fun b!1258992 () Bool)

(declare-fun res!839080 () Bool)

(assert (=> b!1258992 (=> (not res!839080) (not e!716134))))

(assert (=> b!1258992 (= res!839080 (and (= (size!40083 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40082 _keys!1118) (size!40083 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!839085 () Bool)

(assert (=> start!105694 (=> (not res!839085) (not e!716134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105694 (= res!839085 (validMask!0 mask!1466))))

(assert (=> start!105694 e!716134))

(assert (=> start!105694 true))

(assert (=> start!105694 tp!95362))

(assert (=> start!105694 tp_is_empty!32181))

(declare-fun array_inv!30111 (array!81982) Bool)

(assert (=> start!105694 (array_inv!30111 _keys!1118)))

(declare-fun e!716133 () Bool)

(declare-fun array_inv!30112 (array!81984) Bool)

(assert (=> start!105694 (and (array_inv!30112 _values!914) e!716133)))

(declare-fun b!1258989 () Bool)

(declare-fun e!716135 () Bool)

(assert (=> b!1258989 (= e!716135 tp_is_empty!32181)))

(declare-fun b!1258993 () Bool)

(declare-fun res!839081 () Bool)

(assert (=> b!1258993 (=> (not res!839081) (not e!716134))))

(declare-datatypes ((List!28083 0))(
  ( (Nil!28080) (Cons!28079 (h!29288 (_ BitVec 64)) (t!41578 List!28083)) )
))
(declare-fun arrayNoDuplicates!0 (array!81982 (_ BitVec 32) List!28083) Bool)

(assert (=> b!1258993 (= res!839081 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28080))))

(declare-fun mapNonEmpty!50068 () Bool)

(declare-fun tp!95363 () Bool)

(assert (=> mapNonEmpty!50068 (= mapRes!50068 (and tp!95363 e!716136))))

(declare-fun mapValue!50068 () ValueCell!15327)

(declare-fun mapKey!50068 () (_ BitVec 32))

(declare-fun mapRest!50068 () (Array (_ BitVec 32) ValueCell!15327))

(assert (=> mapNonEmpty!50068 (= (arr!39547 _values!914) (store mapRest!50068 mapKey!50068 mapValue!50068))))

(declare-fun b!1258994 () Bool)

(assert (=> b!1258994 (= e!716132 true)))

(declare-fun lt!569572 () ListLongMap!18745)

(declare-fun lt!569576 () ListLongMap!18745)

(declare-fun -!2097 (ListLongMap!18745 (_ BitVec 64)) ListLongMap!18745)

(assert (=> b!1258994 (= lt!569572 (-!2097 lt!569576 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569568 () ListLongMap!18745)

(declare-fun lt!569571 () ListLongMap!18745)

(assert (=> b!1258994 (= (-!2097 lt!569568 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569571)))

(declare-fun lt!569570 () Unit!41959)

(declare-fun addThenRemoveForNewKeyIsSame!334 (ListLongMap!18745 (_ BitVec 64) V!48273) Unit!41959)

(assert (=> b!1258994 (= lt!569570 (addThenRemoveForNewKeyIsSame!334 lt!569571 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1258994 e!716130))

(declare-fun res!839083 () Bool)

(assert (=> b!1258994 (=> (not res!839083) (not e!716130))))

(assert (=> b!1258994 (= res!839083 (= lt!569576 lt!569568))))

(assert (=> b!1258994 (= lt!569568 (+!4194 lt!569571 (tuple2!20873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1258994 (= lt!569571 (+!4194 lt!569567 lt!569573))))

(assert (=> b!1258994 (= lt!569573 (tuple2!20873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4588 (array!81982 array!81984 (_ BitVec 32) (_ BitVec 32) V!48273 V!48273 (_ BitVec 32) Int) ListLongMap!18745)

(assert (=> b!1258994 (= lt!569574 (getCurrentListMap!4588 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258994 (= lt!569576 (getCurrentListMap!4588 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258995 () Bool)

(assert (=> b!1258995 (= e!716133 (and e!716135 mapRes!50068))))

(declare-fun condMapEmpty!50068 () Bool)

(declare-fun mapDefault!50068 () ValueCell!15327)

(assert (=> b!1258995 (= condMapEmpty!50068 (= (arr!39547 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15327)) mapDefault!50068)))))

(assert (= (and start!105694 res!839085) b!1258992))

(assert (= (and b!1258992 res!839080) b!1258988))

(assert (= (and b!1258988 res!839084) b!1258993))

(assert (= (and b!1258993 res!839081) b!1258987))

(assert (= (and b!1258987 (not res!839082)) b!1258994))

(assert (= (and b!1258994 res!839083) b!1258991))

(assert (= (and b!1258995 condMapEmpty!50068) mapIsEmpty!50068))

(assert (= (and b!1258995 (not condMapEmpty!50068)) mapNonEmpty!50068))

(get-info :version)

(assert (= (and mapNonEmpty!50068 ((_ is ValueCellFull!15327) mapValue!50068)) b!1258990))

(assert (= (and b!1258995 ((_ is ValueCellFull!15327) mapDefault!50068)) b!1258989))

(assert (= start!105694 b!1258995))

(declare-fun m!1159345 () Bool)

(assert (=> b!1258994 m!1159345))

(declare-fun m!1159347 () Bool)

(assert (=> b!1258994 m!1159347))

(declare-fun m!1159349 () Bool)

(assert (=> b!1258994 m!1159349))

(declare-fun m!1159351 () Bool)

(assert (=> b!1258994 m!1159351))

(declare-fun m!1159353 () Bool)

(assert (=> b!1258994 m!1159353))

(declare-fun m!1159355 () Bool)

(assert (=> b!1258994 m!1159355))

(declare-fun m!1159357 () Bool)

(assert (=> b!1258994 m!1159357))

(declare-fun m!1159359 () Bool)

(assert (=> b!1258987 m!1159359))

(declare-fun m!1159361 () Bool)

(assert (=> b!1258987 m!1159361))

(declare-fun m!1159363 () Bool)

(assert (=> b!1258987 m!1159363))

(declare-fun m!1159365 () Bool)

(assert (=> mapNonEmpty!50068 m!1159365))

(declare-fun m!1159367 () Bool)

(assert (=> start!105694 m!1159367))

(declare-fun m!1159369 () Bool)

(assert (=> start!105694 m!1159369))

(declare-fun m!1159371 () Bool)

(assert (=> start!105694 m!1159371))

(declare-fun m!1159373 () Bool)

(assert (=> b!1258988 m!1159373))

(declare-fun m!1159375 () Bool)

(assert (=> b!1258991 m!1159375))

(declare-fun m!1159377 () Bool)

(assert (=> b!1258993 m!1159377))

(check-sat (not b!1258993) (not mapNonEmpty!50068) (not b!1258988) (not b_next!27279) (not start!105694) (not b!1258991) b_and!45163 (not b!1258994) (not b!1258987) tp_is_empty!32181)
(check-sat b_and!45163 (not b_next!27279))
