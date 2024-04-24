; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105998 () Bool)

(assert start!105998)

(declare-fun b_free!27337 () Bool)

(declare-fun b_next!27337 () Bool)

(assert (=> start!105998 (= b_free!27337 (not b_next!27337))))

(declare-fun tp!95539 () Bool)

(declare-fun b_and!45235 () Bool)

(assert (=> start!105998 (= tp!95539 b_and!45235)))

(declare-fun res!840209 () Bool)

(declare-fun e!717707 () Bool)

(assert (=> start!105998 (=> (not res!840209) (not e!717707))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105998 (= res!840209 (validMask!0 mask!1466))))

(assert (=> start!105998 e!717707))

(assert (=> start!105998 true))

(assert (=> start!105998 tp!95539))

(declare-fun tp_is_empty!32239 () Bool)

(assert (=> start!105998 tp_is_empty!32239))

(declare-datatypes ((array!82149 0))(
  ( (array!82150 (arr!39624 (Array (_ BitVec 32) (_ BitVec 64))) (size!40161 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82149)

(declare-fun array_inv!30311 (array!82149) Bool)

(assert (=> start!105998 (array_inv!30311 _keys!1118)))

(declare-datatypes ((V!48351 0))(
  ( (V!48352 (val!16182 Int)) )
))
(declare-datatypes ((ValueCell!15356 0))(
  ( (ValueCellFull!15356 (v!18881 V!48351)) (EmptyCell!15356) )
))
(declare-datatypes ((array!82151 0))(
  ( (array!82152 (arr!39625 (Array (_ BitVec 32) ValueCell!15356)) (size!40162 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82151)

(declare-fun e!717711 () Bool)

(declare-fun array_inv!30312 (array!82151) Bool)

(assert (=> start!105998 (and (array_inv!30312 _values!914) e!717711)))

(declare-fun mapNonEmpty!50158 () Bool)

(declare-fun mapRes!50158 () Bool)

(declare-fun tp!95540 () Bool)

(declare-fun e!717708 () Bool)

(assert (=> mapNonEmpty!50158 (= mapRes!50158 (and tp!95540 e!717708))))

(declare-fun mapRest!50158 () (Array (_ BitVec 32) ValueCell!15356))

(declare-fun mapKey!50158 () (_ BitVec 32))

(declare-fun mapValue!50158 () ValueCell!15356)

(assert (=> mapNonEmpty!50158 (= (arr!39625 _values!914) (store mapRest!50158 mapKey!50158 mapValue!50158))))

(declare-fun b!1261263 () Bool)

(declare-fun res!840211 () Bool)

(assert (=> b!1261263 (=> (not res!840211) (not e!717707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82149 (_ BitVec 32)) Bool)

(assert (=> b!1261263 (= res!840211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun e!717710 () Bool)

(declare-datatypes ((tuple2!20944 0))(
  ( (tuple2!20945 (_1!10483 (_ BitVec 64)) (_2!10483 V!48351)) )
))
(declare-datatypes ((List!28169 0))(
  ( (Nil!28166) (Cons!28165 (h!29383 tuple2!20944) (t!41658 List!28169)) )
))
(declare-datatypes ((ListLongMap!18825 0))(
  ( (ListLongMap!18826 (toList!9428 List!28169)) )
))
(declare-fun lt!571074 () ListLongMap!18825)

(declare-fun lt!571067 () ListLongMap!18825)

(declare-fun lt!571068 () tuple2!20944)

(declare-fun b!1261264 () Bool)

(declare-fun +!4267 (ListLongMap!18825 tuple2!20944) ListLongMap!18825)

(assert (=> b!1261264 (= e!717710 (= lt!571074 (+!4267 lt!571067 lt!571068)))))

(declare-fun b!1261265 () Bool)

(assert (=> b!1261265 (= e!717708 tp_is_empty!32239)))

(declare-fun b!1261266 () Bool)

(declare-fun res!840213 () Bool)

(assert (=> b!1261266 (=> (not res!840213) (not e!717707))))

(declare-datatypes ((List!28170 0))(
  ( (Nil!28167) (Cons!28166 (h!29384 (_ BitVec 64)) (t!41659 List!28170)) )
))
(declare-fun arrayNoDuplicates!0 (array!82149 (_ BitVec 32) List!28170) Bool)

(assert (=> b!1261266 (= res!840213 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28167))))

(declare-fun mapIsEmpty!50158 () Bool)

(assert (=> mapIsEmpty!50158 mapRes!50158))

(declare-fun b!1261267 () Bool)

(declare-fun e!717713 () Bool)

(assert (=> b!1261267 (= e!717713 tp_is_empty!32239)))

(declare-fun b!1261268 () Bool)

(declare-fun e!717712 () Bool)

(assert (=> b!1261268 (= e!717712 true)))

(declare-fun lt!571075 () ListLongMap!18825)

(declare-fun lt!571070 () ListLongMap!18825)

(declare-fun -!2095 (ListLongMap!18825 (_ BitVec 64)) ListLongMap!18825)

(assert (=> b!1261268 (= lt!571075 (-!2095 lt!571070 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571069 () ListLongMap!18825)

(declare-fun lt!571071 () ListLongMap!18825)

(assert (=> b!1261268 (= (-!2095 lt!571069 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571071)))

(declare-datatypes ((Unit!41992 0))(
  ( (Unit!41993) )
))
(declare-fun lt!571072 () Unit!41992)

(declare-fun minValueBefore!43 () V!48351)

(declare-fun addThenRemoveForNewKeyIsSame!349 (ListLongMap!18825 (_ BitVec 64) V!48351) Unit!41992)

(assert (=> b!1261268 (= lt!571072 (addThenRemoveForNewKeyIsSame!349 lt!571071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1261268 e!717710))

(declare-fun res!840210 () Bool)

(assert (=> b!1261268 (=> (not res!840210) (not e!717710))))

(assert (=> b!1261268 (= res!840210 (= lt!571070 lt!571069))))

(assert (=> b!1261268 (= lt!571069 (+!4267 lt!571071 (tuple2!20945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571076 () ListLongMap!18825)

(assert (=> b!1261268 (= lt!571071 (+!4267 lt!571076 lt!571068))))

(declare-fun zeroValue!871 () V!48351)

(assert (=> b!1261268 (= lt!571068 (tuple2!20945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!48351)

(declare-fun getCurrentListMap!4607 (array!82149 array!82151 (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 (_ BitVec 32) Int) ListLongMap!18825)

(assert (=> b!1261268 (= lt!571074 (getCurrentListMap!4607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261268 (= lt!571070 (getCurrentListMap!4607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261269 () Bool)

(assert (=> b!1261269 (= e!717711 (and e!717713 mapRes!50158))))

(declare-fun condMapEmpty!50158 () Bool)

(declare-fun mapDefault!50158 () ValueCell!15356)

(assert (=> b!1261269 (= condMapEmpty!50158 (= (arr!39625 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15356)) mapDefault!50158)))))

(declare-fun b!1261270 () Bool)

(assert (=> b!1261270 (= e!717707 (not e!717712))))

(declare-fun res!840208 () Bool)

(assert (=> b!1261270 (=> res!840208 e!717712)))

(assert (=> b!1261270 (= res!840208 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1261270 (= lt!571076 lt!571067)))

(declare-fun lt!571073 () Unit!41992)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1151 (array!82149 array!82151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 V!48351 V!48351 (_ BitVec 32) Int) Unit!41992)

(assert (=> b!1261270 (= lt!571073 (lemmaNoChangeToArrayThenSameMapNoExtras!1151 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5837 (array!82149 array!82151 (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 (_ BitVec 32) Int) ListLongMap!18825)

(assert (=> b!1261270 (= lt!571067 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261270 (= lt!571076 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261271 () Bool)

(declare-fun res!840212 () Bool)

(assert (=> b!1261271 (=> (not res!840212) (not e!717707))))

(assert (=> b!1261271 (= res!840212 (and (= (size!40162 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40161 _keys!1118) (size!40162 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105998 res!840209) b!1261271))

(assert (= (and b!1261271 res!840212) b!1261263))

(assert (= (and b!1261263 res!840211) b!1261266))

(assert (= (and b!1261266 res!840213) b!1261270))

(assert (= (and b!1261270 (not res!840208)) b!1261268))

(assert (= (and b!1261268 res!840210) b!1261264))

(assert (= (and b!1261269 condMapEmpty!50158) mapIsEmpty!50158))

(assert (= (and b!1261269 (not condMapEmpty!50158)) mapNonEmpty!50158))

(get-info :version)

(assert (= (and mapNonEmpty!50158 ((_ is ValueCellFull!15356) mapValue!50158)) b!1261265))

(assert (= (and b!1261269 ((_ is ValueCellFull!15356) mapDefault!50158)) b!1261267))

(assert (= start!105998 b!1261269))

(declare-fun m!1162151 () Bool)

(assert (=> start!105998 m!1162151))

(declare-fun m!1162153 () Bool)

(assert (=> start!105998 m!1162153))

(declare-fun m!1162155 () Bool)

(assert (=> start!105998 m!1162155))

(declare-fun m!1162157 () Bool)

(assert (=> b!1261268 m!1162157))

(declare-fun m!1162159 () Bool)

(assert (=> b!1261268 m!1162159))

(declare-fun m!1162161 () Bool)

(assert (=> b!1261268 m!1162161))

(declare-fun m!1162163 () Bool)

(assert (=> b!1261268 m!1162163))

(declare-fun m!1162165 () Bool)

(assert (=> b!1261268 m!1162165))

(declare-fun m!1162167 () Bool)

(assert (=> b!1261268 m!1162167))

(declare-fun m!1162169 () Bool)

(assert (=> b!1261268 m!1162169))

(declare-fun m!1162171 () Bool)

(assert (=> b!1261266 m!1162171))

(declare-fun m!1162173 () Bool)

(assert (=> b!1261263 m!1162173))

(declare-fun m!1162175 () Bool)

(assert (=> mapNonEmpty!50158 m!1162175))

(declare-fun m!1162177 () Bool)

(assert (=> b!1261270 m!1162177))

(declare-fun m!1162179 () Bool)

(assert (=> b!1261270 m!1162179))

(declare-fun m!1162181 () Bool)

(assert (=> b!1261270 m!1162181))

(declare-fun m!1162183 () Bool)

(assert (=> b!1261264 m!1162183))

(check-sat (not mapNonEmpty!50158) b_and!45235 (not b!1261268) (not b!1261263) tp_is_empty!32239 (not start!105998) (not b_next!27337) (not b!1261264) (not b!1261266) (not b!1261270))
(check-sat b_and!45235 (not b_next!27337))
