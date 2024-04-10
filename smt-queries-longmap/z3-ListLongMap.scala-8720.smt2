; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105794 () Bool)

(assert start!105794)

(declare-fun b_free!27357 () Bool)

(declare-fun b_next!27357 () Bool)

(assert (=> start!105794 (= b_free!27357 (not b_next!27357))))

(declare-fun tp!95599 () Bool)

(declare-fun b_and!45253 () Bool)

(assert (=> start!105794 (= tp!95599 b_and!45253)))

(declare-fun b!1260228 () Bool)

(declare-fun res!839869 () Bool)

(declare-fun e!717076 () Bool)

(assert (=> b!1260228 (=> (not res!839869) (not e!717076))))

(declare-datatypes ((array!82136 0))(
  ( (array!82137 (arr!39622 (Array (_ BitVec 32) (_ BitVec 64))) (size!40158 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82136)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82136 (_ BitVec 32)) Bool)

(assert (=> b!1260228 (= res!839869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50188 () Bool)

(declare-fun mapRes!50188 () Bool)

(declare-fun tp!95600 () Bool)

(declare-fun e!717075 () Bool)

(assert (=> mapNonEmpty!50188 (= mapRes!50188 (and tp!95600 e!717075))))

(declare-datatypes ((V!48377 0))(
  ( (V!48378 (val!16192 Int)) )
))
(declare-datatypes ((ValueCell!15366 0))(
  ( (ValueCellFull!15366 (v!18895 V!48377)) (EmptyCell!15366) )
))
(declare-fun mapValue!50188 () ValueCell!15366)

(declare-datatypes ((array!82138 0))(
  ( (array!82139 (arr!39623 (Array (_ BitVec 32) ValueCell!15366)) (size!40159 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82138)

(declare-fun mapKey!50188 () (_ BitVec 32))

(declare-fun mapRest!50188 () (Array (_ BitVec 32) ValueCell!15366))

(assert (=> mapNonEmpty!50188 (= (arr!39623 _values!914) (store mapRest!50188 mapKey!50188 mapValue!50188))))

(declare-fun b!1260229 () Bool)

(declare-fun res!839872 () Bool)

(assert (=> b!1260229 (=> (not res!839872) (not e!717076))))

(declare-datatypes ((List!28144 0))(
  ( (Nil!28141) (Cons!28140 (h!29349 (_ BitVec 64)) (t!41641 List!28144)) )
))
(declare-fun arrayNoDuplicates!0 (array!82136 (_ BitVec 32) List!28144) Bool)

(assert (=> b!1260229 (= res!839872 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28141))))

(declare-fun b!1260230 () Bool)

(declare-fun e!717071 () Bool)

(declare-fun tp_is_empty!32259 () Bool)

(assert (=> b!1260230 (= e!717071 tp_is_empty!32259)))

(declare-fun b!1260231 () Bool)

(declare-fun res!839873 () Bool)

(assert (=> b!1260231 (=> (not res!839873) (not e!717076))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1260231 (= res!839873 (and (= (size!40159 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40158 _keys!1118) (size!40159 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260233 () Bool)

(declare-fun e!717074 () Bool)

(assert (=> b!1260233 (= e!717074 true)))

(declare-datatypes ((tuple2!20944 0))(
  ( (tuple2!20945 (_1!10483 (_ BitVec 64)) (_2!10483 V!48377)) )
))
(declare-datatypes ((List!28145 0))(
  ( (Nil!28142) (Cons!28141 (h!29350 tuple2!20944) (t!41642 List!28145)) )
))
(declare-datatypes ((ListLongMap!18817 0))(
  ( (ListLongMap!18818 (toList!9424 List!28145)) )
))
(declare-fun lt!570891 () ListLongMap!18817)

(declare-fun lt!570884 () ListLongMap!18817)

(declare-fun -!2129 (ListLongMap!18817 (_ BitVec 64)) ListLongMap!18817)

(assert (=> b!1260233 (= lt!570891 (-!2129 lt!570884 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570889 () ListLongMap!18817)

(declare-fun lt!570887 () ListLongMap!18817)

(assert (=> b!1260233 (= (-!2129 lt!570889 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570887)))

(declare-datatypes ((Unit!42033 0))(
  ( (Unit!42034) )
))
(declare-fun lt!570892 () Unit!42033)

(declare-fun minValueBefore!43 () V!48377)

(declare-fun addThenRemoveForNewKeyIsSame!366 (ListLongMap!18817 (_ BitVec 64) V!48377) Unit!42033)

(assert (=> b!1260233 (= lt!570892 (addThenRemoveForNewKeyIsSame!366 lt!570887 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717072 () Bool)

(assert (=> b!1260233 e!717072))

(declare-fun res!839870 () Bool)

(assert (=> b!1260233 (=> (not res!839870) (not e!717072))))

(assert (=> b!1260233 (= res!839870 (= lt!570884 lt!570889))))

(declare-fun +!4227 (ListLongMap!18817 tuple2!20944) ListLongMap!18817)

(assert (=> b!1260233 (= lt!570889 (+!4227 lt!570887 (tuple2!20945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570883 () ListLongMap!18817)

(declare-fun lt!570890 () tuple2!20944)

(assert (=> b!1260233 (= lt!570887 (+!4227 lt!570883 lt!570890))))

(declare-fun zeroValue!871 () V!48377)

(assert (=> b!1260233 (= lt!570890 (tuple2!20945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48377)

(declare-fun lt!570886 () ListLongMap!18817)

(declare-fun getCurrentListMap!4620 (array!82136 array!82138 (_ BitVec 32) (_ BitVec 32) V!48377 V!48377 (_ BitVec 32) Int) ListLongMap!18817)

(assert (=> b!1260233 (= lt!570886 (getCurrentListMap!4620 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260233 (= lt!570884 (getCurrentListMap!4620 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260234 () Bool)

(assert (=> b!1260234 (= e!717076 (not e!717074))))

(declare-fun res!839868 () Bool)

(assert (=> b!1260234 (=> res!839868 e!717074)))

(assert (=> b!1260234 (= res!839868 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570885 () ListLongMap!18817)

(assert (=> b!1260234 (= lt!570883 lt!570885)))

(declare-fun lt!570888 () Unit!42033)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1161 (array!82136 array!82138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48377 V!48377 V!48377 V!48377 (_ BitVec 32) Int) Unit!42033)

(assert (=> b!1260234 (= lt!570888 (lemmaNoChangeToArrayThenSameMapNoExtras!1161 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5797 (array!82136 array!82138 (_ BitVec 32) (_ BitVec 32) V!48377 V!48377 (_ BitVec 32) Int) ListLongMap!18817)

(assert (=> b!1260234 (= lt!570885 (getCurrentListMapNoExtraKeys!5797 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260234 (= lt!570883 (getCurrentListMapNoExtraKeys!5797 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260235 () Bool)

(assert (=> b!1260235 (= e!717072 (= lt!570886 (+!4227 lt!570885 lt!570890)))))

(declare-fun mapIsEmpty!50188 () Bool)

(assert (=> mapIsEmpty!50188 mapRes!50188))

(declare-fun b!1260236 () Bool)

(assert (=> b!1260236 (= e!717075 tp_is_empty!32259)))

(declare-fun res!839871 () Bool)

(assert (=> start!105794 (=> (not res!839871) (not e!717076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105794 (= res!839871 (validMask!0 mask!1466))))

(assert (=> start!105794 e!717076))

(assert (=> start!105794 true))

(assert (=> start!105794 tp!95599))

(assert (=> start!105794 tp_is_empty!32259))

(declare-fun array_inv!30165 (array!82136) Bool)

(assert (=> start!105794 (array_inv!30165 _keys!1118)))

(declare-fun e!717073 () Bool)

(declare-fun array_inv!30166 (array!82138) Bool)

(assert (=> start!105794 (and (array_inv!30166 _values!914) e!717073)))

(declare-fun b!1260232 () Bool)

(assert (=> b!1260232 (= e!717073 (and e!717071 mapRes!50188))))

(declare-fun condMapEmpty!50188 () Bool)

(declare-fun mapDefault!50188 () ValueCell!15366)

(assert (=> b!1260232 (= condMapEmpty!50188 (= (arr!39623 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15366)) mapDefault!50188)))))

(assert (= (and start!105794 res!839871) b!1260231))

(assert (= (and b!1260231 res!839873) b!1260228))

(assert (= (and b!1260228 res!839869) b!1260229))

(assert (= (and b!1260229 res!839872) b!1260234))

(assert (= (and b!1260234 (not res!839868)) b!1260233))

(assert (= (and b!1260233 res!839870) b!1260235))

(assert (= (and b!1260232 condMapEmpty!50188) mapIsEmpty!50188))

(assert (= (and b!1260232 (not condMapEmpty!50188)) mapNonEmpty!50188))

(get-info :version)

(assert (= (and mapNonEmpty!50188 ((_ is ValueCellFull!15366) mapValue!50188)) b!1260236))

(assert (= (and b!1260232 ((_ is ValueCellFull!15366) mapDefault!50188)) b!1260230))

(assert (= start!105794 b!1260232))

(declare-fun m!1160879 () Bool)

(assert (=> b!1260233 m!1160879))

(declare-fun m!1160881 () Bool)

(assert (=> b!1260233 m!1160881))

(declare-fun m!1160883 () Bool)

(assert (=> b!1260233 m!1160883))

(declare-fun m!1160885 () Bool)

(assert (=> b!1260233 m!1160885))

(declare-fun m!1160887 () Bool)

(assert (=> b!1260233 m!1160887))

(declare-fun m!1160889 () Bool)

(assert (=> b!1260233 m!1160889))

(declare-fun m!1160891 () Bool)

(assert (=> b!1260233 m!1160891))

(declare-fun m!1160893 () Bool)

(assert (=> start!105794 m!1160893))

(declare-fun m!1160895 () Bool)

(assert (=> start!105794 m!1160895))

(declare-fun m!1160897 () Bool)

(assert (=> start!105794 m!1160897))

(declare-fun m!1160899 () Bool)

(assert (=> b!1260234 m!1160899))

(declare-fun m!1160901 () Bool)

(assert (=> b!1260234 m!1160901))

(declare-fun m!1160903 () Bool)

(assert (=> b!1260234 m!1160903))

(declare-fun m!1160905 () Bool)

(assert (=> b!1260235 m!1160905))

(declare-fun m!1160907 () Bool)

(assert (=> b!1260229 m!1160907))

(declare-fun m!1160909 () Bool)

(assert (=> b!1260228 m!1160909))

(declare-fun m!1160911 () Bool)

(assert (=> mapNonEmpty!50188 m!1160911))

(check-sat (not b_next!27357) (not b!1260228) tp_is_empty!32259 (not b!1260233) (not b!1260234) (not b!1260235) (not b!1260229) b_and!45253 (not mapNonEmpty!50188) (not start!105794))
(check-sat b_and!45253 (not b_next!27357))
