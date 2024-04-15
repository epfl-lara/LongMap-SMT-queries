; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106050 () Bool)

(assert start!106050)

(declare-fun b_free!27487 () Bool)

(declare-fun b_next!27487 () Bool)

(assert (=> start!106050 (= b_free!27487 (not b_next!27487))))

(declare-fun tp!96010 () Bool)

(declare-fun b_and!45443 () Bool)

(assert (=> start!106050 (= tp!96010 b_and!45443)))

(declare-fun b!1262816 () Bool)

(declare-fun res!841243 () Bool)

(declare-fun e!718891 () Bool)

(assert (=> b!1262816 (=> (not res!841243) (not e!718891))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82321 0))(
  ( (array!82322 (arr!39708 (Array (_ BitVec 32) (_ BitVec 64))) (size!40246 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82321)

(declare-datatypes ((V!48551 0))(
  ( (V!48552 (val!16257 Int)) )
))
(declare-datatypes ((ValueCell!15431 0))(
  ( (ValueCellFull!15431 (v!18965 V!48551)) (EmptyCell!15431) )
))
(declare-datatypes ((array!82323 0))(
  ( (array!82324 (arr!39709 (Array (_ BitVec 32) ValueCell!15431)) (size!40247 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82323)

(assert (=> b!1262816 (= res!841243 (and (= (size!40247 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40246 _keys!1118) (size!40247 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262817 () Bool)

(declare-fun res!841245 () Bool)

(assert (=> b!1262817 (=> (not res!841245) (not e!718891))))

(declare-datatypes ((List!28321 0))(
  ( (Nil!28318) (Cons!28317 (h!29526 (_ BitVec 64)) (t!41823 List!28321)) )
))
(declare-fun arrayNoDuplicates!0 (array!82321 (_ BitVec 32) List!28321) Bool)

(assert (=> b!1262817 (= res!841245 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28318))))

(declare-fun b!1262818 () Bool)

(declare-fun e!718890 () Bool)

(declare-fun tp_is_empty!32389 () Bool)

(assert (=> b!1262818 (= e!718890 tp_is_empty!32389)))

(declare-fun b!1262819 () Bool)

(declare-fun e!718893 () Bool)

(assert (=> b!1262819 (= e!718893 tp_is_empty!32389)))

(declare-fun b!1262820 () Bool)

(declare-fun e!718889 () Bool)

(declare-fun mapRes!50404 () Bool)

(assert (=> b!1262820 (= e!718889 (and e!718893 mapRes!50404))))

(declare-fun condMapEmpty!50404 () Bool)

(declare-fun mapDefault!50404 () ValueCell!15431)

(assert (=> b!1262820 (= condMapEmpty!50404 (= (arr!39709 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15431)) mapDefault!50404)))))

(declare-fun b!1262821 () Bool)

(declare-fun e!718888 () Bool)

(assert (=> b!1262821 (= e!718891 (not e!718888))))

(declare-fun res!841241 () Bool)

(assert (=> b!1262821 (=> res!841241 e!718888)))

(assert (=> b!1262821 (= res!841241 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21120 0))(
  ( (tuple2!21121 (_1!10571 (_ BitVec 64)) (_2!10571 V!48551)) )
))
(declare-datatypes ((List!28322 0))(
  ( (Nil!28319) (Cons!28318 (h!29527 tuple2!21120) (t!41824 List!28322)) )
))
(declare-datatypes ((ListLongMap!18993 0))(
  ( (ListLongMap!18994 (toList!9512 List!28322)) )
))
(declare-fun lt!572413 () ListLongMap!18993)

(declare-fun lt!572416 () ListLongMap!18993)

(assert (=> b!1262821 (= lt!572413 lt!572416)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48551)

(declare-fun zeroValue!871 () V!48551)

(declare-datatypes ((Unit!41938 0))(
  ( (Unit!41939) )
))
(declare-fun lt!572414 () Unit!41938)

(declare-fun minValueBefore!43 () V!48551)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1179 (array!82321 array!82323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 V!48551 V!48551 (_ BitVec 32) Int) Unit!41938)

(assert (=> b!1262821 (= lt!572414 (lemmaNoChangeToArrayThenSameMapNoExtras!1179 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5879 (array!82321 array!82323 (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 (_ BitVec 32) Int) ListLongMap!18993)

(assert (=> b!1262821 (= lt!572416 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262821 (= lt!572413 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262822 () Bool)

(declare-fun res!841244 () Bool)

(assert (=> b!1262822 (=> (not res!841244) (not e!718891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82321 (_ BitVec 32)) Bool)

(assert (=> b!1262822 (= res!841244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50404 () Bool)

(declare-fun tp!96011 () Bool)

(assert (=> mapNonEmpty!50404 (= mapRes!50404 (and tp!96011 e!718890))))

(declare-fun mapKey!50404 () (_ BitVec 32))

(declare-fun mapRest!50404 () (Array (_ BitVec 32) ValueCell!15431))

(declare-fun mapValue!50404 () ValueCell!15431)

(assert (=> mapNonEmpty!50404 (= (arr!39709 _values!914) (store mapRest!50404 mapKey!50404 mapValue!50404))))

(declare-fun mapIsEmpty!50404 () Bool)

(assert (=> mapIsEmpty!50404 mapRes!50404))

(declare-fun res!841242 () Bool)

(assert (=> start!106050 (=> (not res!841242) (not e!718891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106050 (= res!841242 (validMask!0 mask!1466))))

(assert (=> start!106050 e!718891))

(assert (=> start!106050 true))

(assert (=> start!106050 tp!96010))

(assert (=> start!106050 tp_is_empty!32389))

(declare-fun array_inv!30377 (array!82321) Bool)

(assert (=> start!106050 (array_inv!30377 _keys!1118)))

(declare-fun array_inv!30378 (array!82323) Bool)

(assert (=> start!106050 (and (array_inv!30378 _values!914) e!718889)))

(declare-fun b!1262823 () Bool)

(declare-fun lt!572411 () ListLongMap!18993)

(declare-fun lt!572417 () ListLongMap!18993)

(declare-fun -!2094 (ListLongMap!18993 (_ BitVec 64)) ListLongMap!18993)

(assert (=> b!1262823 (= e!718888 (= (-!2094 lt!572411 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572417))))

(declare-fun lt!572415 () ListLongMap!18993)

(assert (=> b!1262823 (= (-!2094 lt!572415 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572413)))

(declare-fun lt!572412 () Unit!41938)

(declare-fun addThenRemoveForNewKeyIsSame!349 (ListLongMap!18993 (_ BitVec 64) V!48551) Unit!41938)

(assert (=> b!1262823 (= lt!572412 (addThenRemoveForNewKeyIsSame!349 lt!572413 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1262823 (and (= lt!572411 lt!572415) (= lt!572417 lt!572416))))

(declare-fun +!4285 (ListLongMap!18993 tuple2!21120) ListLongMap!18993)

(assert (=> b!1262823 (= lt!572415 (+!4285 lt!572413 (tuple2!21121 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4568 (array!82321 array!82323 (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 (_ BitVec 32) Int) ListLongMap!18993)

(assert (=> b!1262823 (= lt!572417 (getCurrentListMap!4568 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262823 (= lt!572411 (getCurrentListMap!4568 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106050 res!841242) b!1262816))

(assert (= (and b!1262816 res!841243) b!1262822))

(assert (= (and b!1262822 res!841244) b!1262817))

(assert (= (and b!1262817 res!841245) b!1262821))

(assert (= (and b!1262821 (not res!841241)) b!1262823))

(assert (= (and b!1262820 condMapEmpty!50404) mapIsEmpty!50404))

(assert (= (and b!1262820 (not condMapEmpty!50404)) mapNonEmpty!50404))

(get-info :version)

(assert (= (and mapNonEmpty!50404 ((_ is ValueCellFull!15431) mapValue!50404)) b!1262818))

(assert (= (and b!1262820 ((_ is ValueCellFull!15431) mapDefault!50404)) b!1262819))

(assert (= start!106050 b!1262820))

(declare-fun m!1162871 () Bool)

(assert (=> b!1262823 m!1162871))

(declare-fun m!1162873 () Bool)

(assert (=> b!1262823 m!1162873))

(declare-fun m!1162875 () Bool)

(assert (=> b!1262823 m!1162875))

(declare-fun m!1162877 () Bool)

(assert (=> b!1262823 m!1162877))

(declare-fun m!1162879 () Bool)

(assert (=> b!1262823 m!1162879))

(declare-fun m!1162881 () Bool)

(assert (=> b!1262823 m!1162881))

(declare-fun m!1162883 () Bool)

(assert (=> mapNonEmpty!50404 m!1162883))

(declare-fun m!1162885 () Bool)

(assert (=> b!1262821 m!1162885))

(declare-fun m!1162887 () Bool)

(assert (=> b!1262821 m!1162887))

(declare-fun m!1162889 () Bool)

(assert (=> b!1262821 m!1162889))

(declare-fun m!1162891 () Bool)

(assert (=> b!1262817 m!1162891))

(declare-fun m!1162893 () Bool)

(assert (=> b!1262822 m!1162893))

(declare-fun m!1162895 () Bool)

(assert (=> start!106050 m!1162895))

(declare-fun m!1162897 () Bool)

(assert (=> start!106050 m!1162897))

(declare-fun m!1162899 () Bool)

(assert (=> start!106050 m!1162899))

(check-sat (not b_next!27487) b_and!45443 (not mapNonEmpty!50404) (not start!106050) (not b!1262817) (not b!1262823) (not b!1262822) (not b!1262821) tp_is_empty!32389)
(check-sat b_and!45443 (not b_next!27487))
