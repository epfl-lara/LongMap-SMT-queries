; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105812 () Bool)

(assert start!105812)

(declare-fun b_free!27375 () Bool)

(declare-fun b_next!27375 () Bool)

(assert (=> start!105812 (= b_free!27375 (not b_next!27375))))

(declare-fun tp!95654 () Bool)

(declare-fun b_and!45271 () Bool)

(assert (=> start!105812 (= tp!95654 b_and!45271)))

(declare-fun b!1260471 () Bool)

(declare-fun res!840032 () Bool)

(declare-fun e!717261 () Bool)

(assert (=> b!1260471 (=> (not res!840032) (not e!717261))))

(declare-datatypes ((array!82172 0))(
  ( (array!82173 (arr!39640 (Array (_ BitVec 32) (_ BitVec 64))) (size!40176 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82172)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82172 (_ BitVec 32)) Bool)

(assert (=> b!1260471 (= res!840032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50215 () Bool)

(declare-fun mapRes!50215 () Bool)

(declare-fun tp!95653 () Bool)

(declare-fun e!717259 () Bool)

(assert (=> mapNonEmpty!50215 (= mapRes!50215 (and tp!95653 e!717259))))

(declare-datatypes ((V!48401 0))(
  ( (V!48402 (val!16201 Int)) )
))
(declare-datatypes ((ValueCell!15375 0))(
  ( (ValueCellFull!15375 (v!18904 V!48401)) (EmptyCell!15375) )
))
(declare-fun mapRest!50215 () (Array (_ BitVec 32) ValueCell!15375))

(declare-fun mapValue!50215 () ValueCell!15375)

(declare-datatypes ((array!82174 0))(
  ( (array!82175 (arr!39641 (Array (_ BitVec 32) ValueCell!15375)) (size!40177 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82174)

(declare-fun mapKey!50215 () (_ BitVec 32))

(assert (=> mapNonEmpty!50215 (= (arr!39641 _values!914) (store mapRest!50215 mapKey!50215 mapValue!50215))))

(declare-fun b!1260473 () Bool)

(declare-fun tp_is_empty!32277 () Bool)

(assert (=> b!1260473 (= e!717259 tp_is_empty!32277)))

(declare-fun b!1260474 () Bool)

(declare-fun e!717264 () Bool)

(declare-fun e!717263 () Bool)

(assert (=> b!1260474 (= e!717264 (and e!717263 mapRes!50215))))

(declare-fun condMapEmpty!50215 () Bool)

(declare-fun mapDefault!50215 () ValueCell!15375)

(assert (=> b!1260474 (= condMapEmpty!50215 (= (arr!39641 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15375)) mapDefault!50215)))))

(declare-fun b!1260475 () Bool)

(declare-fun e!717265 () Bool)

(assert (=> b!1260475 (= e!717265 true)))

(declare-datatypes ((tuple2!20960 0))(
  ( (tuple2!20961 (_1!10491 (_ BitVec 64)) (_2!10491 V!48401)) )
))
(declare-datatypes ((List!28158 0))(
  ( (Nil!28155) (Cons!28154 (h!29363 tuple2!20960) (t!41655 List!28158)) )
))
(declare-datatypes ((ListLongMap!18833 0))(
  ( (ListLongMap!18834 (toList!9432 List!28158)) )
))
(declare-fun lt!571160 () ListLongMap!18833)

(declare-fun lt!571161 () ListLongMap!18833)

(declare-fun -!2136 (ListLongMap!18833 (_ BitVec 64)) ListLongMap!18833)

(assert (=> b!1260475 (= lt!571160 (-!2136 lt!571161 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571158 () ListLongMap!18833)

(declare-fun lt!571157 () ListLongMap!18833)

(assert (=> b!1260475 (= (-!2136 lt!571158 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571157)))

(declare-datatypes ((Unit!42047 0))(
  ( (Unit!42048) )
))
(declare-fun lt!571153 () Unit!42047)

(declare-fun minValueBefore!43 () V!48401)

(declare-fun addThenRemoveForNewKeyIsSame!373 (ListLongMap!18833 (_ BitVec 64) V!48401) Unit!42047)

(assert (=> b!1260475 (= lt!571153 (addThenRemoveForNewKeyIsSame!373 lt!571157 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717260 () Bool)

(assert (=> b!1260475 e!717260))

(declare-fun res!840031 () Bool)

(assert (=> b!1260475 (=> (not res!840031) (not e!717260))))

(assert (=> b!1260475 (= res!840031 (= lt!571161 lt!571158))))

(declare-fun +!4235 (ListLongMap!18833 tuple2!20960) ListLongMap!18833)

(assert (=> b!1260475 (= lt!571158 (+!4235 lt!571157 (tuple2!20961 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571156 () ListLongMap!18833)

(declare-fun lt!571154 () tuple2!20960)

(assert (=> b!1260475 (= lt!571157 (+!4235 lt!571156 lt!571154))))

(declare-fun zeroValue!871 () V!48401)

(assert (=> b!1260475 (= lt!571154 (tuple2!20961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48401)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!571159 () ListLongMap!18833)

(declare-fun getCurrentListMap!4627 (array!82172 array!82174 (_ BitVec 32) (_ BitVec 32) V!48401 V!48401 (_ BitVec 32) Int) ListLongMap!18833)

(assert (=> b!1260475 (= lt!571159 (getCurrentListMap!4627 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260475 (= lt!571161 (getCurrentListMap!4627 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260476 () Bool)

(declare-fun res!840033 () Bool)

(assert (=> b!1260476 (=> (not res!840033) (not e!717261))))

(declare-datatypes ((List!28159 0))(
  ( (Nil!28156) (Cons!28155 (h!29364 (_ BitVec 64)) (t!41656 List!28159)) )
))
(declare-fun arrayNoDuplicates!0 (array!82172 (_ BitVec 32) List!28159) Bool)

(assert (=> b!1260476 (= res!840033 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28156))))

(declare-fun b!1260477 () Bool)

(declare-fun res!840035 () Bool)

(assert (=> b!1260477 (=> (not res!840035) (not e!717261))))

(assert (=> b!1260477 (= res!840035 (and (= (size!40177 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40176 _keys!1118) (size!40177 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50215 () Bool)

(assert (=> mapIsEmpty!50215 mapRes!50215))

(declare-fun lt!571155 () ListLongMap!18833)

(declare-fun b!1260478 () Bool)

(assert (=> b!1260478 (= e!717260 (= lt!571159 (+!4235 lt!571155 lt!571154)))))

(declare-fun b!1260479 () Bool)

(assert (=> b!1260479 (= e!717263 tp_is_empty!32277)))

(declare-fun res!840034 () Bool)

(assert (=> start!105812 (=> (not res!840034) (not e!717261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105812 (= res!840034 (validMask!0 mask!1466))))

(assert (=> start!105812 e!717261))

(assert (=> start!105812 true))

(assert (=> start!105812 tp!95654))

(assert (=> start!105812 tp_is_empty!32277))

(declare-fun array_inv!30177 (array!82172) Bool)

(assert (=> start!105812 (array_inv!30177 _keys!1118)))

(declare-fun array_inv!30178 (array!82174) Bool)

(assert (=> start!105812 (and (array_inv!30178 _values!914) e!717264)))

(declare-fun b!1260472 () Bool)

(assert (=> b!1260472 (= e!717261 (not e!717265))))

(declare-fun res!840030 () Bool)

(assert (=> b!1260472 (=> res!840030 e!717265)))

(assert (=> b!1260472 (= res!840030 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260472 (= lt!571156 lt!571155)))

(declare-fun lt!571162 () Unit!42047)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1166 (array!82172 array!82174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48401 V!48401 V!48401 V!48401 (_ BitVec 32) Int) Unit!42047)

(assert (=> b!1260472 (= lt!571162 (lemmaNoChangeToArrayThenSameMapNoExtras!1166 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5802 (array!82172 array!82174 (_ BitVec 32) (_ BitVec 32) V!48401 V!48401 (_ BitVec 32) Int) ListLongMap!18833)

(assert (=> b!1260472 (= lt!571155 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260472 (= lt!571156 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105812 res!840034) b!1260477))

(assert (= (and b!1260477 res!840035) b!1260471))

(assert (= (and b!1260471 res!840032) b!1260476))

(assert (= (and b!1260476 res!840033) b!1260472))

(assert (= (and b!1260472 (not res!840030)) b!1260475))

(assert (= (and b!1260475 res!840031) b!1260478))

(assert (= (and b!1260474 condMapEmpty!50215) mapIsEmpty!50215))

(assert (= (and b!1260474 (not condMapEmpty!50215)) mapNonEmpty!50215))

(get-info :version)

(assert (= (and mapNonEmpty!50215 ((_ is ValueCellFull!15375) mapValue!50215)) b!1260473))

(assert (= (and b!1260474 ((_ is ValueCellFull!15375) mapDefault!50215)) b!1260479))

(assert (= start!105812 b!1260474))

(declare-fun m!1161185 () Bool)

(assert (=> start!105812 m!1161185))

(declare-fun m!1161187 () Bool)

(assert (=> start!105812 m!1161187))

(declare-fun m!1161189 () Bool)

(assert (=> start!105812 m!1161189))

(declare-fun m!1161191 () Bool)

(assert (=> b!1260478 m!1161191))

(declare-fun m!1161193 () Bool)

(assert (=> b!1260475 m!1161193))

(declare-fun m!1161195 () Bool)

(assert (=> b!1260475 m!1161195))

(declare-fun m!1161197 () Bool)

(assert (=> b!1260475 m!1161197))

(declare-fun m!1161199 () Bool)

(assert (=> b!1260475 m!1161199))

(declare-fun m!1161201 () Bool)

(assert (=> b!1260475 m!1161201))

(declare-fun m!1161203 () Bool)

(assert (=> b!1260475 m!1161203))

(declare-fun m!1161205 () Bool)

(assert (=> b!1260475 m!1161205))

(declare-fun m!1161207 () Bool)

(assert (=> b!1260471 m!1161207))

(declare-fun m!1161209 () Bool)

(assert (=> b!1260472 m!1161209))

(declare-fun m!1161211 () Bool)

(assert (=> b!1260472 m!1161211))

(declare-fun m!1161213 () Bool)

(assert (=> b!1260472 m!1161213))

(declare-fun m!1161215 () Bool)

(assert (=> b!1260476 m!1161215))

(declare-fun m!1161217 () Bool)

(assert (=> mapNonEmpty!50215 m!1161217))

(check-sat (not b!1260475) (not b!1260478) (not start!105812) (not b!1260472) b_and!45271 (not b_next!27375) (not mapNonEmpty!50215) (not b!1260476) (not b!1260471) tp_is_empty!32277)
(check-sat b_and!45271 (not b_next!27375))
