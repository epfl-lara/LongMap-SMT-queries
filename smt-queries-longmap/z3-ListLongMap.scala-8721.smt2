; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105800 () Bool)

(assert start!105800)

(declare-fun b_free!27363 () Bool)

(declare-fun b_next!27363 () Bool)

(assert (=> start!105800 (= b_free!27363 (not b_next!27363))))

(declare-fun tp!95618 () Bool)

(declare-fun b_and!45259 () Bool)

(assert (=> start!105800 (= tp!95618 b_and!45259)))

(declare-fun b!1260309 () Bool)

(declare-fun res!839923 () Bool)

(declare-fun e!717134 () Bool)

(assert (=> b!1260309 (=> (not res!839923) (not e!717134))))

(declare-datatypes ((array!82148 0))(
  ( (array!82149 (arr!39628 (Array (_ BitVec 32) (_ BitVec 64))) (size!40164 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82148)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82148 (_ BitVec 32)) Bool)

(assert (=> b!1260309 (= res!839923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260310 () Bool)

(declare-fun res!839927 () Bool)

(assert (=> b!1260310 (=> (not res!839927) (not e!717134))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48385 0))(
  ( (V!48386 (val!16195 Int)) )
))
(declare-datatypes ((ValueCell!15369 0))(
  ( (ValueCellFull!15369 (v!18898 V!48385)) (EmptyCell!15369) )
))
(declare-datatypes ((array!82150 0))(
  ( (array!82151 (arr!39629 (Array (_ BitVec 32) ValueCell!15369)) (size!40165 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82150)

(assert (=> b!1260310 (= res!839927 (and (= (size!40165 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40164 _keys!1118) (size!40165 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50197 () Bool)

(declare-fun mapRes!50197 () Bool)

(assert (=> mapIsEmpty!50197 mapRes!50197))

(declare-fun b!1260311 () Bool)

(declare-fun e!717138 () Bool)

(declare-datatypes ((tuple2!20950 0))(
  ( (tuple2!20951 (_1!10486 (_ BitVec 64)) (_2!10486 V!48385)) )
))
(declare-fun lt!570978 () tuple2!20950)

(declare-datatypes ((List!28149 0))(
  ( (Nil!28146) (Cons!28145 (h!29354 tuple2!20950) (t!41646 List!28149)) )
))
(declare-datatypes ((ListLongMap!18823 0))(
  ( (ListLongMap!18824 (toList!9427 List!28149)) )
))
(declare-fun lt!570974 () ListLongMap!18823)

(declare-fun lt!570977 () ListLongMap!18823)

(declare-fun +!4230 (ListLongMap!18823 tuple2!20950) ListLongMap!18823)

(assert (=> b!1260311 (= e!717138 (= lt!570974 (+!4230 lt!570977 lt!570978)))))

(declare-fun res!839924 () Bool)

(assert (=> start!105800 (=> (not res!839924) (not e!717134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105800 (= res!839924 (validMask!0 mask!1466))))

(assert (=> start!105800 e!717134))

(assert (=> start!105800 true))

(assert (=> start!105800 tp!95618))

(declare-fun tp_is_empty!32265 () Bool)

(assert (=> start!105800 tp_is_empty!32265))

(declare-fun array_inv!30169 (array!82148) Bool)

(assert (=> start!105800 (array_inv!30169 _keys!1118)))

(declare-fun e!717136 () Bool)

(declare-fun array_inv!30170 (array!82150) Bool)

(assert (=> start!105800 (and (array_inv!30170 _values!914) e!717136)))

(declare-fun b!1260312 () Bool)

(declare-fun res!839925 () Bool)

(assert (=> b!1260312 (=> (not res!839925) (not e!717134))))

(declare-datatypes ((List!28150 0))(
  ( (Nil!28147) (Cons!28146 (h!29355 (_ BitVec 64)) (t!41647 List!28150)) )
))
(declare-fun arrayNoDuplicates!0 (array!82148 (_ BitVec 32) List!28150) Bool)

(assert (=> b!1260312 (= res!839925 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28147))))

(declare-fun b!1260313 () Bool)

(declare-fun e!717139 () Bool)

(assert (=> b!1260313 (= e!717134 (not e!717139))))

(declare-fun res!839926 () Bool)

(assert (=> b!1260313 (=> res!839926 e!717139)))

(assert (=> b!1260313 (= res!839926 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570976 () ListLongMap!18823)

(assert (=> b!1260313 (= lt!570976 lt!570977)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!42039 0))(
  ( (Unit!42040) )
))
(declare-fun lt!570981 () Unit!42039)

(declare-fun minValueAfter!43 () V!48385)

(declare-fun zeroValue!871 () V!48385)

(declare-fun minValueBefore!43 () V!48385)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1164 (array!82148 array!82150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48385 V!48385 V!48385 V!48385 (_ BitVec 32) Int) Unit!42039)

(assert (=> b!1260313 (= lt!570981 (lemmaNoChangeToArrayThenSameMapNoExtras!1164 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5800 (array!82148 array!82150 (_ BitVec 32) (_ BitVec 32) V!48385 V!48385 (_ BitVec 32) Int) ListLongMap!18823)

(assert (=> b!1260313 (= lt!570977 (getCurrentListMapNoExtraKeys!5800 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260313 (= lt!570976 (getCurrentListMapNoExtraKeys!5800 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260314 () Bool)

(declare-fun e!717137 () Bool)

(assert (=> b!1260314 (= e!717137 tp_is_empty!32265)))

(declare-fun b!1260315 () Bool)

(assert (=> b!1260315 (= e!717139 true)))

(declare-fun lt!570979 () ListLongMap!18823)

(declare-fun lt!570980 () ListLongMap!18823)

(declare-fun -!2132 (ListLongMap!18823 (_ BitVec 64)) ListLongMap!18823)

(assert (=> b!1260315 (= lt!570979 (-!2132 lt!570980 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570973 () ListLongMap!18823)

(declare-fun lt!570982 () ListLongMap!18823)

(assert (=> b!1260315 (= (-!2132 lt!570973 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570982)))

(declare-fun lt!570975 () Unit!42039)

(declare-fun addThenRemoveForNewKeyIsSame!369 (ListLongMap!18823 (_ BitVec 64) V!48385) Unit!42039)

(assert (=> b!1260315 (= lt!570975 (addThenRemoveForNewKeyIsSame!369 lt!570982 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260315 e!717138))

(declare-fun res!839922 () Bool)

(assert (=> b!1260315 (=> (not res!839922) (not e!717138))))

(assert (=> b!1260315 (= res!839922 (= lt!570980 lt!570973))))

(assert (=> b!1260315 (= lt!570973 (+!4230 lt!570982 (tuple2!20951 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1260315 (= lt!570982 (+!4230 lt!570976 lt!570978))))

(assert (=> b!1260315 (= lt!570978 (tuple2!20951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4623 (array!82148 array!82150 (_ BitVec 32) (_ BitVec 32) V!48385 V!48385 (_ BitVec 32) Int) ListLongMap!18823)

(assert (=> b!1260315 (= lt!570974 (getCurrentListMap!4623 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260315 (= lt!570980 (getCurrentListMap!4623 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260316 () Bool)

(declare-fun e!717133 () Bool)

(assert (=> b!1260316 (= e!717133 tp_is_empty!32265)))

(declare-fun b!1260317 () Bool)

(assert (=> b!1260317 (= e!717136 (and e!717133 mapRes!50197))))

(declare-fun condMapEmpty!50197 () Bool)

(declare-fun mapDefault!50197 () ValueCell!15369)

(assert (=> b!1260317 (= condMapEmpty!50197 (= (arr!39629 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15369)) mapDefault!50197)))))

(declare-fun mapNonEmpty!50197 () Bool)

(declare-fun tp!95617 () Bool)

(assert (=> mapNonEmpty!50197 (= mapRes!50197 (and tp!95617 e!717137))))

(declare-fun mapValue!50197 () ValueCell!15369)

(declare-fun mapKey!50197 () (_ BitVec 32))

(declare-fun mapRest!50197 () (Array (_ BitVec 32) ValueCell!15369))

(assert (=> mapNonEmpty!50197 (= (arr!39629 _values!914) (store mapRest!50197 mapKey!50197 mapValue!50197))))

(assert (= (and start!105800 res!839924) b!1260310))

(assert (= (and b!1260310 res!839927) b!1260309))

(assert (= (and b!1260309 res!839923) b!1260312))

(assert (= (and b!1260312 res!839925) b!1260313))

(assert (= (and b!1260313 (not res!839926)) b!1260315))

(assert (= (and b!1260315 res!839922) b!1260311))

(assert (= (and b!1260317 condMapEmpty!50197) mapIsEmpty!50197))

(assert (= (and b!1260317 (not condMapEmpty!50197)) mapNonEmpty!50197))

(get-info :version)

(assert (= (and mapNonEmpty!50197 ((_ is ValueCellFull!15369) mapValue!50197)) b!1260314))

(assert (= (and b!1260317 ((_ is ValueCellFull!15369) mapDefault!50197)) b!1260316))

(assert (= start!105800 b!1260317))

(declare-fun m!1160981 () Bool)

(assert (=> b!1260309 m!1160981))

(declare-fun m!1160983 () Bool)

(assert (=> b!1260312 m!1160983))

(declare-fun m!1160985 () Bool)

(assert (=> b!1260313 m!1160985))

(declare-fun m!1160987 () Bool)

(assert (=> b!1260313 m!1160987))

(declare-fun m!1160989 () Bool)

(assert (=> b!1260313 m!1160989))

(declare-fun m!1160991 () Bool)

(assert (=> start!105800 m!1160991))

(declare-fun m!1160993 () Bool)

(assert (=> start!105800 m!1160993))

(declare-fun m!1160995 () Bool)

(assert (=> start!105800 m!1160995))

(declare-fun m!1160997 () Bool)

(assert (=> b!1260315 m!1160997))

(declare-fun m!1160999 () Bool)

(assert (=> b!1260315 m!1160999))

(declare-fun m!1161001 () Bool)

(assert (=> b!1260315 m!1161001))

(declare-fun m!1161003 () Bool)

(assert (=> b!1260315 m!1161003))

(declare-fun m!1161005 () Bool)

(assert (=> b!1260315 m!1161005))

(declare-fun m!1161007 () Bool)

(assert (=> b!1260315 m!1161007))

(declare-fun m!1161009 () Bool)

(assert (=> b!1260315 m!1161009))

(declare-fun m!1161011 () Bool)

(assert (=> b!1260311 m!1161011))

(declare-fun m!1161013 () Bool)

(assert (=> mapNonEmpty!50197 m!1161013))

(check-sat (not start!105800) (not b!1260313) (not b!1260311) tp_is_empty!32265 (not mapNonEmpty!50197) (not b!1260309) (not b!1260315) (not b_next!27363) (not b!1260312) b_and!45259)
(check-sat b_and!45259 (not b_next!27363))
