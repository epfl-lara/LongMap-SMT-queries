; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104894 () Bool)

(assert start!104894)

(declare-fun b_free!26685 () Bool)

(declare-fun b_next!26685 () Bool)

(assert (=> start!104894 (= b_free!26685 (not b_next!26685))))

(declare-fun tp!93547 () Bool)

(declare-fun b_and!44461 () Bool)

(assert (=> start!104894 (= tp!93547 b_and!44461)))

(declare-fun res!833938 () Bool)

(declare-fun e!709722 () Bool)

(assert (=> start!104894 (=> (not res!833938) (not e!709722))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104894 (= res!833938 (validMask!0 mask!1466))))

(assert (=> start!104894 e!709722))

(assert (=> start!104894 true))

(assert (=> start!104894 tp!93547))

(declare-fun tp_is_empty!31587 () Bool)

(assert (=> start!104894 tp_is_empty!31587))

(declare-datatypes ((array!80844 0))(
  ( (array!80845 (arr!38988 (Array (_ BitVec 32) (_ BitVec 64))) (size!39524 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80844)

(declare-fun array_inv!29745 (array!80844) Bool)

(assert (=> start!104894 (array_inv!29745 _keys!1118)))

(declare-datatypes ((V!47481 0))(
  ( (V!47482 (val!15856 Int)) )
))
(declare-datatypes ((ValueCell!15030 0))(
  ( (ValueCellFull!15030 (v!18552 V!47481)) (EmptyCell!15030) )
))
(declare-datatypes ((array!80846 0))(
  ( (array!80847 (arr!38989 (Array (_ BitVec 32) ValueCell!15030)) (size!39525 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80846)

(declare-fun e!709726 () Bool)

(declare-fun array_inv!29746 (array!80846) Bool)

(assert (=> start!104894 (and (array_inv!29746 _values!914) e!709726)))

(declare-fun b!1250240 () Bool)

(declare-fun e!709724 () Bool)

(assert (=> b!1250240 (= e!709724 tp_is_empty!31587)))

(declare-fun mapIsEmpty!49144 () Bool)

(declare-fun mapRes!49144 () Bool)

(assert (=> mapIsEmpty!49144 mapRes!49144))

(declare-fun b!1250241 () Bool)

(declare-fun e!709723 () Bool)

(assert (=> b!1250241 (= e!709722 (not e!709723))))

(declare-fun res!833940 () Bool)

(assert (=> b!1250241 (=> res!833940 e!709723)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250241 (= res!833940 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20426 0))(
  ( (tuple2!20427 (_1!10224 (_ BitVec 64)) (_2!10224 V!47481)) )
))
(declare-datatypes ((List!27668 0))(
  ( (Nil!27665) (Cons!27664 (h!28873 tuple2!20426) (t!41141 List!27668)) )
))
(declare-datatypes ((ListLongMap!18299 0))(
  ( (ListLongMap!18300 (toList!9165 List!27668)) )
))
(declare-fun lt!564121 () ListLongMap!18299)

(declare-fun lt!564119 () ListLongMap!18299)

(assert (=> b!1250241 (= lt!564121 lt!564119)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47481)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47481)

(declare-fun minValueBefore!43 () V!47481)

(declare-datatypes ((Unit!41523 0))(
  ( (Unit!41524) )
))
(declare-fun lt!564120 () Unit!41523)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!934 (array!80844 array!80846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47481 V!47481 V!47481 V!47481 (_ BitVec 32) Int) Unit!41523)

(assert (=> b!1250241 (= lt!564120 (lemmaNoChangeToArrayThenSameMapNoExtras!934 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5570 (array!80844 array!80846 (_ BitVec 32) (_ BitVec 32) V!47481 V!47481 (_ BitVec 32) Int) ListLongMap!18299)

(assert (=> b!1250241 (= lt!564119 (getCurrentListMapNoExtraKeys!5570 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250241 (= lt!564121 (getCurrentListMapNoExtraKeys!5570 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250242 () Bool)

(declare-fun e!709721 () Bool)

(assert (=> b!1250242 (= e!709721 true)))

(declare-fun lt!564118 () ListLongMap!18299)

(declare-fun -!1994 (ListLongMap!18299 (_ BitVec 64)) ListLongMap!18299)

(assert (=> b!1250242 (= (-!1994 lt!564118 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564118)))

(declare-fun lt!564122 () Unit!41523)

(declare-fun removeNotPresentStillSame!89 (ListLongMap!18299 (_ BitVec 64)) Unit!41523)

(assert (=> b!1250242 (= lt!564122 (removeNotPresentStillSame!89 lt!564118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250243 () Bool)

(declare-fun res!833941 () Bool)

(assert (=> b!1250243 (=> (not res!833941) (not e!709722))))

(assert (=> b!1250243 (= res!833941 (and (= (size!39525 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39524 _keys!1118) (size!39525 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250244 () Bool)

(assert (=> b!1250244 (= e!709723 e!709721)))

(declare-fun res!833937 () Bool)

(assert (=> b!1250244 (=> res!833937 e!709721)))

(declare-fun contains!7481 (ListLongMap!18299 (_ BitVec 64)) Bool)

(assert (=> b!1250244 (= res!833937 (contains!7481 lt!564118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4442 (array!80844 array!80846 (_ BitVec 32) (_ BitVec 32) V!47481 V!47481 (_ BitVec 32) Int) ListLongMap!18299)

(assert (=> b!1250244 (= lt!564118 (getCurrentListMap!4442 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250245 () Bool)

(declare-fun e!709725 () Bool)

(assert (=> b!1250245 (= e!709726 (and e!709725 mapRes!49144))))

(declare-fun condMapEmpty!49144 () Bool)

(declare-fun mapDefault!49144 () ValueCell!15030)

(assert (=> b!1250245 (= condMapEmpty!49144 (= (arr!38989 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15030)) mapDefault!49144)))))

(declare-fun b!1250246 () Bool)

(declare-fun res!833939 () Bool)

(assert (=> b!1250246 (=> (not res!833939) (not e!709722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80844 (_ BitVec 32)) Bool)

(assert (=> b!1250246 (= res!833939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250247 () Bool)

(declare-fun res!833936 () Bool)

(assert (=> b!1250247 (=> (not res!833936) (not e!709722))))

(declare-datatypes ((List!27669 0))(
  ( (Nil!27666) (Cons!27665 (h!28874 (_ BitVec 64)) (t!41142 List!27669)) )
))
(declare-fun arrayNoDuplicates!0 (array!80844 (_ BitVec 32) List!27669) Bool)

(assert (=> b!1250247 (= res!833936 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27666))))

(declare-fun mapNonEmpty!49144 () Bool)

(declare-fun tp!93548 () Bool)

(assert (=> mapNonEmpty!49144 (= mapRes!49144 (and tp!93548 e!709724))))

(declare-fun mapRest!49144 () (Array (_ BitVec 32) ValueCell!15030))

(declare-fun mapValue!49144 () ValueCell!15030)

(declare-fun mapKey!49144 () (_ BitVec 32))

(assert (=> mapNonEmpty!49144 (= (arr!38989 _values!914) (store mapRest!49144 mapKey!49144 mapValue!49144))))

(declare-fun b!1250248 () Bool)

(assert (=> b!1250248 (= e!709725 tp_is_empty!31587)))

(assert (= (and start!104894 res!833938) b!1250243))

(assert (= (and b!1250243 res!833941) b!1250246))

(assert (= (and b!1250246 res!833939) b!1250247))

(assert (= (and b!1250247 res!833936) b!1250241))

(assert (= (and b!1250241 (not res!833940)) b!1250244))

(assert (= (and b!1250244 (not res!833937)) b!1250242))

(assert (= (and b!1250245 condMapEmpty!49144) mapIsEmpty!49144))

(assert (= (and b!1250245 (not condMapEmpty!49144)) mapNonEmpty!49144))

(get-info :version)

(assert (= (and mapNonEmpty!49144 ((_ is ValueCellFull!15030) mapValue!49144)) b!1250240))

(assert (= (and b!1250245 ((_ is ValueCellFull!15030) mapDefault!49144)) b!1250248))

(assert (= start!104894 b!1250245))

(declare-fun m!1151077 () Bool)

(assert (=> mapNonEmpty!49144 m!1151077))

(declare-fun m!1151079 () Bool)

(assert (=> b!1250244 m!1151079))

(declare-fun m!1151081 () Bool)

(assert (=> b!1250244 m!1151081))

(declare-fun m!1151083 () Bool)

(assert (=> b!1250247 m!1151083))

(declare-fun m!1151085 () Bool)

(assert (=> b!1250242 m!1151085))

(declare-fun m!1151087 () Bool)

(assert (=> b!1250242 m!1151087))

(declare-fun m!1151089 () Bool)

(assert (=> b!1250246 m!1151089))

(declare-fun m!1151091 () Bool)

(assert (=> start!104894 m!1151091))

(declare-fun m!1151093 () Bool)

(assert (=> start!104894 m!1151093))

(declare-fun m!1151095 () Bool)

(assert (=> start!104894 m!1151095))

(declare-fun m!1151097 () Bool)

(assert (=> b!1250241 m!1151097))

(declare-fun m!1151099 () Bool)

(assert (=> b!1250241 m!1151099))

(declare-fun m!1151101 () Bool)

(assert (=> b!1250241 m!1151101))

(check-sat (not b!1250244) b_and!44461 (not b!1250247) (not b!1250241) tp_is_empty!31587 (not b_next!26685) (not b!1250242) (not start!104894) (not mapNonEmpty!49144) (not b!1250246))
(check-sat b_and!44461 (not b_next!26685))
