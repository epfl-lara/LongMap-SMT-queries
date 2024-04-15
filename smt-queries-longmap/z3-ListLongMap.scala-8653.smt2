; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105254 () Bool)

(assert start!105254)

(declare-fun b_free!26953 () Bool)

(declare-fun b_next!26953 () Bool)

(assert (=> start!105254 (= b_free!26953 (not b_next!26953))))

(declare-fun tp!94366 () Bool)

(declare-fun b_and!44761 () Bool)

(assert (=> start!105254 (= tp!94366 b_and!44761)))

(declare-fun res!836257 () Bool)

(declare-fun e!712615 () Bool)

(assert (=> start!105254 (=> (not res!836257) (not e!712615))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105254 (= res!836257 (validMask!0 mask!1466))))

(assert (=> start!105254 e!712615))

(assert (=> start!105254 true))

(assert (=> start!105254 tp!94366))

(declare-fun tp_is_empty!31855 () Bool)

(assert (=> start!105254 tp_is_empty!31855))

(declare-datatypes ((array!81293 0))(
  ( (array!81294 (arr!39208 (Array (_ BitVec 32) (_ BitVec 64))) (size!39746 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81293)

(declare-fun array_inv!30019 (array!81293) Bool)

(assert (=> start!105254 (array_inv!30019 _keys!1118)))

(declare-datatypes ((V!47839 0))(
  ( (V!47840 (val!15990 Int)) )
))
(declare-datatypes ((ValueCell!15164 0))(
  ( (ValueCellFull!15164 (v!18688 V!47839)) (EmptyCell!15164) )
))
(declare-datatypes ((array!81295 0))(
  ( (array!81296 (arr!39209 (Array (_ BitVec 32) ValueCell!15164)) (size!39747 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81295)

(declare-fun e!712614 () Bool)

(declare-fun array_inv!30020 (array!81295) Bool)

(assert (=> start!105254 (and (array_inv!30020 _values!914) e!712614)))

(declare-fun b!1254163 () Bool)

(declare-fun e!712618 () Bool)

(assert (=> b!1254163 (= e!712618 tp_is_empty!31855)))

(declare-fun b!1254164 () Bool)

(declare-fun res!836261 () Bool)

(assert (=> b!1254164 (=> (not res!836261) (not e!712615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81293 (_ BitVec 32)) Bool)

(assert (=> b!1254164 (= res!836261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254165 () Bool)

(declare-fun e!712617 () Bool)

(assert (=> b!1254165 (= e!712617 tp_is_empty!31855)))

(declare-fun mapIsEmpty!49561 () Bool)

(declare-fun mapRes!49561 () Bool)

(assert (=> mapIsEmpty!49561 mapRes!49561))

(declare-fun b!1254166 () Bool)

(declare-fun e!712616 () Bool)

(assert (=> b!1254166 (= e!712616 true)))

(declare-datatypes ((tuple2!20730 0))(
  ( (tuple2!20731 (_1!10376 (_ BitVec 64)) (_2!10376 V!47839)) )
))
(declare-datatypes ((List!27941 0))(
  ( (Nil!27938) (Cons!27937 (h!29146 tuple2!20730) (t!41415 List!27941)) )
))
(declare-datatypes ((ListLongMap!18603 0))(
  ( (ListLongMap!18604 (toList!9317 List!27941)) )
))
(declare-fun lt!566553 () ListLongMap!18603)

(declare-fun lt!566550 () ListLongMap!18603)

(declare-fun -!2010 (ListLongMap!18603 (_ BitVec 64)) ListLongMap!18603)

(assert (=> b!1254166 (= lt!566553 (-!2010 lt!566550 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566555 () ListLongMap!18603)

(declare-fun lt!566552 () ListLongMap!18603)

(assert (=> b!1254166 (= (-!2010 lt!566555 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566552)))

(declare-datatypes ((Unit!41599 0))(
  ( (Unit!41600) )
))
(declare-fun lt!566551 () Unit!41599)

(declare-fun minValueBefore!43 () V!47839)

(declare-fun addThenRemoveForNewKeyIsSame!299 (ListLongMap!18603 (_ BitVec 64) V!47839) Unit!41599)

(assert (=> b!1254166 (= lt!566551 (addThenRemoveForNewKeyIsSame!299 lt!566552 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566556 () ListLongMap!18603)

(declare-fun lt!566554 () ListLongMap!18603)

(assert (=> b!1254166 (and (= lt!566550 lt!566555) (= lt!566554 lt!566556))))

(declare-fun +!4213 (ListLongMap!18603 tuple2!20730) ListLongMap!18603)

(assert (=> b!1254166 (= lt!566555 (+!4213 lt!566552 (tuple2!20731 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47839)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47839)

(declare-fun getCurrentListMap!4449 (array!81293 array!81295 (_ BitVec 32) (_ BitVec 32) V!47839 V!47839 (_ BitVec 32) Int) ListLongMap!18603)

(assert (=> b!1254166 (= lt!566554 (getCurrentListMap!4449 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254166 (= lt!566550 (getCurrentListMap!4449 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254167 () Bool)

(assert (=> b!1254167 (= e!712615 (not e!712616))))

(declare-fun res!836258 () Bool)

(assert (=> b!1254167 (=> res!836258 e!712616)))

(assert (=> b!1254167 (= res!836258 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254167 (= lt!566552 lt!566556)))

(declare-fun lt!566557 () Unit!41599)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1037 (array!81293 array!81295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47839 V!47839 V!47839 V!47839 (_ BitVec 32) Int) Unit!41599)

(assert (=> b!1254167 (= lt!566557 (lemmaNoChangeToArrayThenSameMapNoExtras!1037 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5715 (array!81293 array!81295 (_ BitVec 32) (_ BitVec 32) V!47839 V!47839 (_ BitVec 32) Int) ListLongMap!18603)

(assert (=> b!1254167 (= lt!566556 (getCurrentListMapNoExtraKeys!5715 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254167 (= lt!566552 (getCurrentListMapNoExtraKeys!5715 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254168 () Bool)

(declare-fun res!836260 () Bool)

(assert (=> b!1254168 (=> (not res!836260) (not e!712615))))

(declare-datatypes ((List!27942 0))(
  ( (Nil!27939) (Cons!27938 (h!29147 (_ BitVec 64)) (t!41416 List!27942)) )
))
(declare-fun arrayNoDuplicates!0 (array!81293 (_ BitVec 32) List!27942) Bool)

(assert (=> b!1254168 (= res!836260 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27939))))

(declare-fun mapNonEmpty!49561 () Bool)

(declare-fun tp!94367 () Bool)

(assert (=> mapNonEmpty!49561 (= mapRes!49561 (and tp!94367 e!712618))))

(declare-fun mapValue!49561 () ValueCell!15164)

(declare-fun mapKey!49561 () (_ BitVec 32))

(declare-fun mapRest!49561 () (Array (_ BitVec 32) ValueCell!15164))

(assert (=> mapNonEmpty!49561 (= (arr!39209 _values!914) (store mapRest!49561 mapKey!49561 mapValue!49561))))

(declare-fun b!1254169 () Bool)

(declare-fun res!836259 () Bool)

(assert (=> b!1254169 (=> (not res!836259) (not e!712615))))

(assert (=> b!1254169 (= res!836259 (and (= (size!39747 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39746 _keys!1118) (size!39747 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254170 () Bool)

(assert (=> b!1254170 (= e!712614 (and e!712617 mapRes!49561))))

(declare-fun condMapEmpty!49561 () Bool)

(declare-fun mapDefault!49561 () ValueCell!15164)

(assert (=> b!1254170 (= condMapEmpty!49561 (= (arr!39209 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15164)) mapDefault!49561)))))

(assert (= (and start!105254 res!836257) b!1254169))

(assert (= (and b!1254169 res!836259) b!1254164))

(assert (= (and b!1254164 res!836261) b!1254168))

(assert (= (and b!1254168 res!836260) b!1254167))

(assert (= (and b!1254167 (not res!836258)) b!1254166))

(assert (= (and b!1254170 condMapEmpty!49561) mapIsEmpty!49561))

(assert (= (and b!1254170 (not condMapEmpty!49561)) mapNonEmpty!49561))

(get-info :version)

(assert (= (and mapNonEmpty!49561 ((_ is ValueCellFull!15164) mapValue!49561)) b!1254163))

(assert (= (and b!1254170 ((_ is ValueCellFull!15164) mapDefault!49561)) b!1254165))

(assert (= start!105254 b!1254170))

(declare-fun m!1154409 () Bool)

(assert (=> b!1254166 m!1154409))

(declare-fun m!1154411 () Bool)

(assert (=> b!1254166 m!1154411))

(declare-fun m!1154413 () Bool)

(assert (=> b!1254166 m!1154413))

(declare-fun m!1154415 () Bool)

(assert (=> b!1254166 m!1154415))

(declare-fun m!1154417 () Bool)

(assert (=> b!1254166 m!1154417))

(declare-fun m!1154419 () Bool)

(assert (=> b!1254166 m!1154419))

(declare-fun m!1154421 () Bool)

(assert (=> b!1254168 m!1154421))

(declare-fun m!1154423 () Bool)

(assert (=> b!1254164 m!1154423))

(declare-fun m!1154425 () Bool)

(assert (=> start!105254 m!1154425))

(declare-fun m!1154427 () Bool)

(assert (=> start!105254 m!1154427))

(declare-fun m!1154429 () Bool)

(assert (=> start!105254 m!1154429))

(declare-fun m!1154431 () Bool)

(assert (=> b!1254167 m!1154431))

(declare-fun m!1154433 () Bool)

(assert (=> b!1254167 m!1154433))

(declare-fun m!1154435 () Bool)

(assert (=> b!1254167 m!1154435))

(declare-fun m!1154437 () Bool)

(assert (=> mapNonEmpty!49561 m!1154437))

(check-sat (not mapNonEmpty!49561) (not b!1254166) tp_is_empty!31855 b_and!44761 (not start!105254) (not b!1254167) (not b_next!26953) (not b!1254168) (not b!1254164))
(check-sat b_and!44761 (not b_next!26953))
