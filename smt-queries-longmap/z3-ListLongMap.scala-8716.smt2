; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105770 () Bool)

(assert start!105770)

(declare-fun b_free!27333 () Bool)

(declare-fun b_next!27333 () Bool)

(assert (=> start!105770 (= b_free!27333 (not b_next!27333))))

(declare-fun tp!95527 () Bool)

(declare-fun b_and!45229 () Bool)

(assert (=> start!105770 (= tp!95527 b_and!45229)))

(declare-fun res!839652 () Bool)

(declare-fun e!716823 () Bool)

(assert (=> start!105770 (=> (not res!839652) (not e!716823))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105770 (= res!839652 (validMask!0 mask!1466))))

(assert (=> start!105770 e!716823))

(assert (=> start!105770 true))

(assert (=> start!105770 tp!95527))

(declare-fun tp_is_empty!32235 () Bool)

(assert (=> start!105770 tp_is_empty!32235))

(declare-datatypes ((array!82090 0))(
  ( (array!82091 (arr!39599 (Array (_ BitVec 32) (_ BitVec 64))) (size!40135 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82090)

(declare-fun array_inv!30149 (array!82090) Bool)

(assert (=> start!105770 (array_inv!30149 _keys!1118)))

(declare-datatypes ((V!48345 0))(
  ( (V!48346 (val!16180 Int)) )
))
(declare-datatypes ((ValueCell!15354 0))(
  ( (ValueCellFull!15354 (v!18883 V!48345)) (EmptyCell!15354) )
))
(declare-datatypes ((array!82092 0))(
  ( (array!82093 (arr!39600 (Array (_ BitVec 32) ValueCell!15354)) (size!40136 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82092)

(declare-fun e!716818 () Bool)

(declare-fun array_inv!30150 (array!82092) Bool)

(assert (=> start!105770 (and (array_inv!30150 _values!914) e!716818)))

(declare-fun b!1259904 () Bool)

(declare-fun e!716824 () Bool)

(declare-fun mapRes!50152 () Bool)

(assert (=> b!1259904 (= e!716818 (and e!716824 mapRes!50152))))

(declare-fun condMapEmpty!50152 () Bool)

(declare-fun mapDefault!50152 () ValueCell!15354)

(assert (=> b!1259904 (= condMapEmpty!50152 (= (arr!39600 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15354)) mapDefault!50152)))))

(declare-fun b!1259905 () Bool)

(declare-fun e!716820 () Bool)

(assert (=> b!1259905 (= e!716823 (not e!716820))))

(declare-fun res!839653 () Bool)

(assert (=> b!1259905 (=> res!839653 e!716820)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259905 (= res!839653 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20922 0))(
  ( (tuple2!20923 (_1!10472 (_ BitVec 64)) (_2!10472 V!48345)) )
))
(declare-datatypes ((List!28125 0))(
  ( (Nil!28122) (Cons!28121 (h!29330 tuple2!20922) (t!41622 List!28125)) )
))
(declare-datatypes ((ListLongMap!18795 0))(
  ( (ListLongMap!18796 (toList!9413 List!28125)) )
))
(declare-fun lt!570531 () ListLongMap!18795)

(declare-fun lt!570528 () ListLongMap!18795)

(assert (=> b!1259905 (= lt!570531 lt!570528)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!42011 0))(
  ( (Unit!42012) )
))
(declare-fun lt!570526 () Unit!42011)

(declare-fun minValueAfter!43 () V!48345)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48345)

(declare-fun minValueBefore!43 () V!48345)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1152 (array!82090 array!82092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48345 V!48345 V!48345 V!48345 (_ BitVec 32) Int) Unit!42011)

(assert (=> b!1259905 (= lt!570526 (lemmaNoChangeToArrayThenSameMapNoExtras!1152 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5788 (array!82090 array!82092 (_ BitVec 32) (_ BitVec 32) V!48345 V!48345 (_ BitVec 32) Int) ListLongMap!18795)

(assert (=> b!1259905 (= lt!570528 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259905 (= lt!570531 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50152 () Bool)

(declare-fun tp!95528 () Bool)

(declare-fun e!716819 () Bool)

(assert (=> mapNonEmpty!50152 (= mapRes!50152 (and tp!95528 e!716819))))

(declare-fun mapRest!50152 () (Array (_ BitVec 32) ValueCell!15354))

(declare-fun mapKey!50152 () (_ BitVec 32))

(declare-fun mapValue!50152 () ValueCell!15354)

(assert (=> mapNonEmpty!50152 (= (arr!39600 _values!914) (store mapRest!50152 mapKey!50152 mapValue!50152))))

(declare-fun e!716822 () Bool)

(declare-fun lt!570527 () ListLongMap!18795)

(declare-fun lt!570532 () tuple2!20922)

(declare-fun b!1259906 () Bool)

(declare-fun +!4217 (ListLongMap!18795 tuple2!20922) ListLongMap!18795)

(assert (=> b!1259906 (= e!716822 (= lt!570527 (+!4217 lt!570528 lt!570532)))))

(declare-fun b!1259907 () Bool)

(assert (=> b!1259907 (= e!716819 tp_is_empty!32235)))

(declare-fun b!1259908 () Bool)

(declare-fun res!839656 () Bool)

(assert (=> b!1259908 (=> (not res!839656) (not e!716823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82090 (_ BitVec 32)) Bool)

(assert (=> b!1259908 (= res!839656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259909 () Bool)

(declare-fun res!839655 () Bool)

(assert (=> b!1259909 (=> (not res!839655) (not e!716823))))

(assert (=> b!1259909 (= res!839655 (and (= (size!40136 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40135 _keys!1118) (size!40136 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259910 () Bool)

(assert (=> b!1259910 (= e!716824 tp_is_empty!32235)))

(declare-fun b!1259911 () Bool)

(assert (=> b!1259911 (= e!716820 true)))

(declare-fun lt!570529 () ListLongMap!18795)

(declare-fun lt!570530 () ListLongMap!18795)

(declare-fun -!2119 (ListLongMap!18795 (_ BitVec 64)) ListLongMap!18795)

(assert (=> b!1259911 (= lt!570529 (-!2119 lt!570530 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570525 () ListLongMap!18795)

(declare-fun lt!570524 () ListLongMap!18795)

(assert (=> b!1259911 (= (-!2119 lt!570525 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570524)))

(declare-fun lt!570523 () Unit!42011)

(declare-fun addThenRemoveForNewKeyIsSame!356 (ListLongMap!18795 (_ BitVec 64) V!48345) Unit!42011)

(assert (=> b!1259911 (= lt!570523 (addThenRemoveForNewKeyIsSame!356 lt!570524 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259911 e!716822))

(declare-fun res!839654 () Bool)

(assert (=> b!1259911 (=> (not res!839654) (not e!716822))))

(assert (=> b!1259911 (= res!839654 (= lt!570530 lt!570525))))

(assert (=> b!1259911 (= lt!570525 (+!4217 lt!570524 (tuple2!20923 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1259911 (= lt!570524 (+!4217 lt!570531 lt!570532))))

(assert (=> b!1259911 (= lt!570532 (tuple2!20923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4610 (array!82090 array!82092 (_ BitVec 32) (_ BitVec 32) V!48345 V!48345 (_ BitVec 32) Int) ListLongMap!18795)

(assert (=> b!1259911 (= lt!570527 (getCurrentListMap!4610 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259911 (= lt!570530 (getCurrentListMap!4610 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50152 () Bool)

(assert (=> mapIsEmpty!50152 mapRes!50152))

(declare-fun b!1259912 () Bool)

(declare-fun res!839657 () Bool)

(assert (=> b!1259912 (=> (not res!839657) (not e!716823))))

(declare-datatypes ((List!28126 0))(
  ( (Nil!28123) (Cons!28122 (h!29331 (_ BitVec 64)) (t!41623 List!28126)) )
))
(declare-fun arrayNoDuplicates!0 (array!82090 (_ BitVec 32) List!28126) Bool)

(assert (=> b!1259912 (= res!839657 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28123))))

(assert (= (and start!105770 res!839652) b!1259909))

(assert (= (and b!1259909 res!839655) b!1259908))

(assert (= (and b!1259908 res!839656) b!1259912))

(assert (= (and b!1259912 res!839657) b!1259905))

(assert (= (and b!1259905 (not res!839653)) b!1259911))

(assert (= (and b!1259911 res!839654) b!1259906))

(assert (= (and b!1259904 condMapEmpty!50152) mapIsEmpty!50152))

(assert (= (and b!1259904 (not condMapEmpty!50152)) mapNonEmpty!50152))

(get-info :version)

(assert (= (and mapNonEmpty!50152 ((_ is ValueCellFull!15354) mapValue!50152)) b!1259907))

(assert (= (and b!1259904 ((_ is ValueCellFull!15354) mapDefault!50152)) b!1259910))

(assert (= start!105770 b!1259904))

(declare-fun m!1160471 () Bool)

(assert (=> b!1259908 m!1160471))

(declare-fun m!1160473 () Bool)

(assert (=> b!1259911 m!1160473))

(declare-fun m!1160475 () Bool)

(assert (=> b!1259911 m!1160475))

(declare-fun m!1160477 () Bool)

(assert (=> b!1259911 m!1160477))

(declare-fun m!1160479 () Bool)

(assert (=> b!1259911 m!1160479))

(declare-fun m!1160481 () Bool)

(assert (=> b!1259911 m!1160481))

(declare-fun m!1160483 () Bool)

(assert (=> b!1259911 m!1160483))

(declare-fun m!1160485 () Bool)

(assert (=> b!1259911 m!1160485))

(declare-fun m!1160487 () Bool)

(assert (=> start!105770 m!1160487))

(declare-fun m!1160489 () Bool)

(assert (=> start!105770 m!1160489))

(declare-fun m!1160491 () Bool)

(assert (=> start!105770 m!1160491))

(declare-fun m!1160493 () Bool)

(assert (=> mapNonEmpty!50152 m!1160493))

(declare-fun m!1160495 () Bool)

(assert (=> b!1259912 m!1160495))

(declare-fun m!1160497 () Bool)

(assert (=> b!1259906 m!1160497))

(declare-fun m!1160499 () Bool)

(assert (=> b!1259905 m!1160499))

(declare-fun m!1160501 () Bool)

(assert (=> b!1259905 m!1160501))

(declare-fun m!1160503 () Bool)

(assert (=> b!1259905 m!1160503))

(check-sat (not b_next!27333) (not b!1259911) (not b!1259908) (not b!1259906) (not mapNonEmpty!50152) b_and!45229 (not b!1259905) (not b!1259912) (not start!105770) tp_is_empty!32235)
(check-sat b_and!45229 (not b_next!27333))
