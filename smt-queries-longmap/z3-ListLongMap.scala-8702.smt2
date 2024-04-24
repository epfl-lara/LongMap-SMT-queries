; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105870 () Bool)

(assert start!105870)

(declare-fun b_free!27247 () Bool)

(declare-fun b_next!27247 () Bool)

(assert (=> start!105870 (= b_free!27247 (not b_next!27247))))

(declare-fun tp!95264 () Bool)

(declare-fun b_and!45123 () Bool)

(assert (=> start!105870 (= tp!95264 b_and!45123)))

(declare-fun res!839288 () Bool)

(declare-fun e!716581 () Bool)

(assert (=> start!105870 (=> (not res!839288) (not e!716581))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105870 (= res!839288 (validMask!0 mask!1466))))

(assert (=> start!105870 e!716581))

(assert (=> start!105870 true))

(assert (=> start!105870 tp!95264))

(declare-fun tp_is_empty!32149 () Bool)

(assert (=> start!105870 tp_is_empty!32149))

(declare-datatypes ((array!81971 0))(
  ( (array!81972 (arr!39537 (Array (_ BitVec 32) (_ BitVec 64))) (size!40074 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81971)

(declare-fun array_inv!30251 (array!81971) Bool)

(assert (=> start!105870 (array_inv!30251 _keys!1118)))

(declare-datatypes ((V!48231 0))(
  ( (V!48232 (val!16137 Int)) )
))
(declare-datatypes ((ValueCell!15311 0))(
  ( (ValueCellFull!15311 (v!18835 V!48231)) (EmptyCell!15311) )
))
(declare-datatypes ((array!81973 0))(
  ( (array!81974 (arr!39538 (Array (_ BitVec 32) ValueCell!15311)) (size!40075 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81973)

(declare-fun e!716585 () Bool)

(declare-fun array_inv!30252 (array!81973) Bool)

(assert (=> start!105870 (and (array_inv!30252 _values!914) e!716585)))

(declare-fun mapNonEmpty!50017 () Bool)

(declare-fun mapRes!50017 () Bool)

(declare-fun tp!95263 () Bool)

(declare-fun e!716586 () Bool)

(assert (=> mapNonEmpty!50017 (= mapRes!50017 (and tp!95263 e!716586))))

(declare-fun mapKey!50017 () (_ BitVec 32))

(declare-fun mapRest!50017 () (Array (_ BitVec 32) ValueCell!15311))

(declare-fun mapValue!50017 () ValueCell!15311)

(assert (=> mapNonEmpty!50017 (= (arr!39538 _values!914) (store mapRest!50017 mapKey!50017 mapValue!50017))))

(declare-fun b!1259746 () Bool)

(declare-fun e!716582 () Bool)

(assert (=> b!1259746 (= e!716582 tp_is_empty!32149)))

(declare-fun b!1259747 () Bool)

(declare-fun res!839290 () Bool)

(assert (=> b!1259747 (=> (not res!839290) (not e!716581))))

(declare-datatypes ((List!28097 0))(
  ( (Nil!28094) (Cons!28093 (h!29311 (_ BitVec 64)) (t!41582 List!28097)) )
))
(declare-fun arrayNoDuplicates!0 (array!81971 (_ BitVec 32) List!28097) Bool)

(assert (=> b!1259747 (= res!839290 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28094))))

(declare-fun b!1259748 () Bool)

(declare-fun res!839291 () Bool)

(assert (=> b!1259748 (=> (not res!839291) (not e!716581))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1259748 (= res!839291 (and (= (size!40075 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40074 _keys!1118) (size!40075 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259749 () Bool)

(declare-fun e!716583 () Bool)

(assert (=> b!1259749 (= e!716583 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20868 0))(
  ( (tuple2!20869 (_1!10445 (_ BitVec 64)) (_2!10445 V!48231)) )
))
(declare-datatypes ((List!28098 0))(
  ( (Nil!28095) (Cons!28094 (h!29312 tuple2!20868) (t!41583 List!28098)) )
))
(declare-datatypes ((ListLongMap!18749 0))(
  ( (ListLongMap!18750 (toList!9390 List!28098)) )
))
(declare-fun lt!569688 () ListLongMap!18749)

(declare-fun zeroValue!871 () V!48231)

(declare-fun minValueBefore!43 () V!48231)

(declare-fun getCurrentListMap!4577 (array!81971 array!81973 (_ BitVec 32) (_ BitVec 32) V!48231 V!48231 (_ BitVec 32) Int) ListLongMap!18749)

(assert (=> b!1259749 (= lt!569688 (getCurrentListMap!4577 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259750 () Bool)

(assert (=> b!1259750 (= e!716585 (and e!716582 mapRes!50017))))

(declare-fun condMapEmpty!50017 () Bool)

(declare-fun mapDefault!50017 () ValueCell!15311)

(assert (=> b!1259750 (= condMapEmpty!50017 (= (arr!39538 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15311)) mapDefault!50017)))))

(declare-fun b!1259751 () Bool)

(declare-fun res!839292 () Bool)

(assert (=> b!1259751 (=> (not res!839292) (not e!716581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81971 (_ BitVec 32)) Bool)

(assert (=> b!1259751 (= res!839292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50017 () Bool)

(assert (=> mapIsEmpty!50017 mapRes!50017))

(declare-fun b!1259752 () Bool)

(assert (=> b!1259752 (= e!716581 (not e!716583))))

(declare-fun res!839289 () Bool)

(assert (=> b!1259752 (=> res!839289 e!716583)))

(assert (=> b!1259752 (= res!839289 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569687 () ListLongMap!18749)

(declare-fun lt!569689 () ListLongMap!18749)

(assert (=> b!1259752 (= lt!569687 lt!569689)))

(declare-fun minValueAfter!43 () V!48231)

(declare-datatypes ((Unit!41923 0))(
  ( (Unit!41924) )
))
(declare-fun lt!569690 () Unit!41923)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1120 (array!81971 array!81973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48231 V!48231 V!48231 V!48231 (_ BitVec 32) Int) Unit!41923)

(assert (=> b!1259752 (= lt!569690 (lemmaNoChangeToArrayThenSameMapNoExtras!1120 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5806 (array!81971 array!81973 (_ BitVec 32) (_ BitVec 32) V!48231 V!48231 (_ BitVec 32) Int) ListLongMap!18749)

(assert (=> b!1259752 (= lt!569689 (getCurrentListMapNoExtraKeys!5806 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259752 (= lt!569687 (getCurrentListMapNoExtraKeys!5806 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259753 () Bool)

(assert (=> b!1259753 (= e!716586 tp_is_empty!32149)))

(assert (= (and start!105870 res!839288) b!1259748))

(assert (= (and b!1259748 res!839291) b!1259751))

(assert (= (and b!1259751 res!839292) b!1259747))

(assert (= (and b!1259747 res!839290) b!1259752))

(assert (= (and b!1259752 (not res!839289)) b!1259749))

(assert (= (and b!1259750 condMapEmpty!50017) mapIsEmpty!50017))

(assert (= (and b!1259750 (not condMapEmpty!50017)) mapNonEmpty!50017))

(get-info :version)

(assert (= (and mapNonEmpty!50017 ((_ is ValueCellFull!15311) mapValue!50017)) b!1259753))

(assert (= (and b!1259750 ((_ is ValueCellFull!15311) mapDefault!50017)) b!1259746))

(assert (= start!105870 b!1259750))

(declare-fun m!1160481 () Bool)

(assert (=> b!1259751 m!1160481))

(declare-fun m!1160483 () Bool)

(assert (=> b!1259747 m!1160483))

(declare-fun m!1160485 () Bool)

(assert (=> b!1259749 m!1160485))

(declare-fun m!1160487 () Bool)

(assert (=> start!105870 m!1160487))

(declare-fun m!1160489 () Bool)

(assert (=> start!105870 m!1160489))

(declare-fun m!1160491 () Bool)

(assert (=> start!105870 m!1160491))

(declare-fun m!1160493 () Bool)

(assert (=> b!1259752 m!1160493))

(declare-fun m!1160495 () Bool)

(assert (=> b!1259752 m!1160495))

(declare-fun m!1160497 () Bool)

(assert (=> b!1259752 m!1160497))

(declare-fun m!1160499 () Bool)

(assert (=> mapNonEmpty!50017 m!1160499))

(check-sat b_and!45123 (not start!105870) tp_is_empty!32149 (not b!1259749) (not b_next!27247) (not mapNonEmpty!50017) (not b!1259751) (not b!1259747) (not b!1259752))
(check-sat b_and!45123 (not b_next!27247))
