; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105712 () Bool)

(assert start!105712)

(declare-fun b_free!27301 () Bool)

(declare-fun b_next!27301 () Bool)

(assert (=> start!105712 (= b_free!27301 (not b_next!27301))))

(declare-fun tp!95429 () Bool)

(declare-fun b_and!45167 () Bool)

(assert (=> start!105712 (= tp!95429 b_and!45167)))

(declare-fun res!839243 () Bool)

(declare-fun e!716319 () Bool)

(assert (=> start!105712 (=> (not res!839243) (not e!716319))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105712 (= res!839243 (validMask!0 mask!1466))))

(assert (=> start!105712 e!716319))

(assert (=> start!105712 true))

(assert (=> start!105712 tp!95429))

(declare-fun tp_is_empty!32203 () Bool)

(assert (=> start!105712 tp_is_empty!32203))

(declare-datatypes ((array!81951 0))(
  ( (array!81952 (arr!39531 (Array (_ BitVec 32) (_ BitVec 64))) (size!40069 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81951)

(declare-fun array_inv!30243 (array!81951) Bool)

(assert (=> start!105712 (array_inv!30243 _keys!1118)))

(declare-datatypes ((V!48303 0))(
  ( (V!48304 (val!16164 Int)) )
))
(declare-datatypes ((ValueCell!15338 0))(
  ( (ValueCellFull!15338 (v!18865 V!48303)) (EmptyCell!15338) )
))
(declare-datatypes ((array!81953 0))(
  ( (array!81954 (arr!39532 (Array (_ BitVec 32) ValueCell!15338)) (size!40070 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81953)

(declare-fun e!716321 () Bool)

(declare-fun array_inv!30244 (array!81953) Bool)

(assert (=> start!105712 (and (array_inv!30244 _values!914) e!716321)))

(declare-fun b!1259202 () Bool)

(declare-fun res!839242 () Bool)

(assert (=> b!1259202 (=> (not res!839242) (not e!716319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81951 (_ BitVec 32)) Bool)

(assert (=> b!1259202 (= res!839242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259203 () Bool)

(declare-fun res!839239 () Bool)

(assert (=> b!1259203 (=> (not res!839239) (not e!716319))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1259203 (= res!839239 (and (= (size!40070 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40069 _keys!1118) (size!40070 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!716318 () Bool)

(declare-fun b!1259204 () Bool)

(declare-datatypes ((tuple2!20976 0))(
  ( (tuple2!20977 (_1!10499 (_ BitVec 64)) (_2!10499 V!48303)) )
))
(declare-fun lt!569723 () tuple2!20976)

(declare-datatypes ((List!28180 0))(
  ( (Nil!28177) (Cons!28176 (h!29385 tuple2!20976) (t!41666 List!28180)) )
))
(declare-datatypes ((ListLongMap!18849 0))(
  ( (ListLongMap!18850 (toList!9440 List!28180)) )
))
(declare-fun lt!569722 () ListLongMap!18849)

(declare-fun lt!569718 () ListLongMap!18849)

(declare-fun +!4241 (ListLongMap!18849 tuple2!20976) ListLongMap!18849)

(assert (=> b!1259204 (= e!716318 (= lt!569722 (+!4241 lt!569718 lt!569723)))))

(declare-fun b!1259205 () Bool)

(declare-fun e!716322 () Bool)

(declare-fun mapRes!50101 () Bool)

(assert (=> b!1259205 (= e!716321 (and e!716322 mapRes!50101))))

(declare-fun condMapEmpty!50101 () Bool)

(declare-fun mapDefault!50101 () ValueCell!15338)

(assert (=> b!1259205 (= condMapEmpty!50101 (= (arr!39532 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15338)) mapDefault!50101)))))

(declare-fun b!1259206 () Bool)

(declare-fun e!716316 () Bool)

(assert (=> b!1259206 (= e!716316 true)))

(declare-fun lt!569719 () ListLongMap!18849)

(declare-fun lt!569725 () ListLongMap!18849)

(declare-fun -!2061 (ListLongMap!18849 (_ BitVec 64)) ListLongMap!18849)

(assert (=> b!1259206 (= lt!569719 (-!2061 lt!569725 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569720 () ListLongMap!18849)

(declare-fun lt!569724 () ListLongMap!18849)

(assert (=> b!1259206 (= (-!2061 lt!569720 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569724)))

(declare-datatypes ((Unit!41824 0))(
  ( (Unit!41825) )
))
(declare-fun lt!569727 () Unit!41824)

(declare-fun minValueBefore!43 () V!48303)

(declare-fun addThenRemoveForNewKeyIsSame!318 (ListLongMap!18849 (_ BitVec 64) V!48303) Unit!41824)

(assert (=> b!1259206 (= lt!569727 (addThenRemoveForNewKeyIsSame!318 lt!569724 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259206 e!716318))

(declare-fun res!839241 () Bool)

(assert (=> b!1259206 (=> (not res!839241) (not e!716318))))

(assert (=> b!1259206 (= res!839241 (= lt!569725 lt!569720))))

(assert (=> b!1259206 (= lt!569720 (+!4241 lt!569724 (tuple2!20977 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569726 () ListLongMap!18849)

(assert (=> b!1259206 (= lt!569724 (+!4241 lt!569726 lt!569723))))

(declare-fun zeroValue!871 () V!48303)

(assert (=> b!1259206 (= lt!569723 (tuple2!20977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48303)

(declare-fun getCurrentListMap!4527 (array!81951 array!81953 (_ BitVec 32) (_ BitVec 32) V!48303 V!48303 (_ BitVec 32) Int) ListLongMap!18849)

(assert (=> b!1259206 (= lt!569722 (getCurrentListMap!4527 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259206 (= lt!569725 (getCurrentListMap!4527 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259207 () Bool)

(declare-fun e!716320 () Bool)

(assert (=> b!1259207 (= e!716320 tp_is_empty!32203)))

(declare-fun b!1259208 () Bool)

(assert (=> b!1259208 (= e!716322 tp_is_empty!32203)))

(declare-fun mapIsEmpty!50101 () Bool)

(assert (=> mapIsEmpty!50101 mapRes!50101))

(declare-fun b!1259209 () Bool)

(assert (=> b!1259209 (= e!716319 (not e!716316))))

(declare-fun res!839240 () Bool)

(assert (=> b!1259209 (=> res!839240 e!716316)))

(assert (=> b!1259209 (= res!839240 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259209 (= lt!569726 lt!569718)))

(declare-fun lt!569721 () Unit!41824)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1135 (array!81951 array!81953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48303 V!48303 V!48303 V!48303 (_ BitVec 32) Int) Unit!41824)

(assert (=> b!1259209 (= lt!569721 (lemmaNoChangeToArrayThenSameMapNoExtras!1135 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5813 (array!81951 array!81953 (_ BitVec 32) (_ BitVec 32) V!48303 V!48303 (_ BitVec 32) Int) ListLongMap!18849)

(assert (=> b!1259209 (= lt!569718 (getCurrentListMapNoExtraKeys!5813 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259209 (= lt!569726 (getCurrentListMapNoExtraKeys!5813 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259210 () Bool)

(declare-fun res!839238 () Bool)

(assert (=> b!1259210 (=> (not res!839238) (not e!716319))))

(declare-datatypes ((List!28181 0))(
  ( (Nil!28178) (Cons!28177 (h!29386 (_ BitVec 64)) (t!41667 List!28181)) )
))
(declare-fun arrayNoDuplicates!0 (array!81951 (_ BitVec 32) List!28181) Bool)

(assert (=> b!1259210 (= res!839238 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28178))))

(declare-fun mapNonEmpty!50101 () Bool)

(declare-fun tp!95428 () Bool)

(assert (=> mapNonEmpty!50101 (= mapRes!50101 (and tp!95428 e!716320))))

(declare-fun mapKey!50101 () (_ BitVec 32))

(declare-fun mapValue!50101 () ValueCell!15338)

(declare-fun mapRest!50101 () (Array (_ BitVec 32) ValueCell!15338))

(assert (=> mapNonEmpty!50101 (= (arr!39532 _values!914) (store mapRest!50101 mapKey!50101 mapValue!50101))))

(assert (= (and start!105712 res!839243) b!1259203))

(assert (= (and b!1259203 res!839239) b!1259202))

(assert (= (and b!1259202 res!839242) b!1259210))

(assert (= (and b!1259210 res!839238) b!1259209))

(assert (= (and b!1259209 (not res!839240)) b!1259206))

(assert (= (and b!1259206 res!839241) b!1259204))

(assert (= (and b!1259205 condMapEmpty!50101) mapIsEmpty!50101))

(assert (= (and b!1259205 (not condMapEmpty!50101)) mapNonEmpty!50101))

(get-info :version)

(assert (= (and mapNonEmpty!50101 ((_ is ValueCellFull!15338) mapValue!50101)) b!1259207))

(assert (= (and b!1259205 ((_ is ValueCellFull!15338) mapDefault!50101)) b!1259208))

(assert (= start!105712 b!1259205))

(declare-fun m!1159199 () Bool)

(assert (=> b!1259206 m!1159199))

(declare-fun m!1159201 () Bool)

(assert (=> b!1259206 m!1159201))

(declare-fun m!1159203 () Bool)

(assert (=> b!1259206 m!1159203))

(declare-fun m!1159205 () Bool)

(assert (=> b!1259206 m!1159205))

(declare-fun m!1159207 () Bool)

(assert (=> b!1259206 m!1159207))

(declare-fun m!1159209 () Bool)

(assert (=> b!1259206 m!1159209))

(declare-fun m!1159211 () Bool)

(assert (=> b!1259206 m!1159211))

(declare-fun m!1159213 () Bool)

(assert (=> mapNonEmpty!50101 m!1159213))

(declare-fun m!1159215 () Bool)

(assert (=> b!1259210 m!1159215))

(declare-fun m!1159217 () Bool)

(assert (=> b!1259209 m!1159217))

(declare-fun m!1159219 () Bool)

(assert (=> b!1259209 m!1159219))

(declare-fun m!1159221 () Bool)

(assert (=> b!1259209 m!1159221))

(declare-fun m!1159223 () Bool)

(assert (=> start!105712 m!1159223))

(declare-fun m!1159225 () Bool)

(assert (=> start!105712 m!1159225))

(declare-fun m!1159227 () Bool)

(assert (=> start!105712 m!1159227))

(declare-fun m!1159229 () Bool)

(assert (=> b!1259204 m!1159229))

(declare-fun m!1159231 () Bool)

(assert (=> b!1259202 m!1159231))

(check-sat (not b!1259210) b_and!45167 (not mapNonEmpty!50101) (not b!1259206) (not b_next!27301) (not start!105712) (not b!1259204) (not b!1259202) (not b!1259209) tp_is_empty!32203)
(check-sat b_and!45167 (not b_next!27301))
