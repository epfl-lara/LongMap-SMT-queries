; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104894 () Bool)

(assert start!104894)

(declare-fun b_free!26689 () Bool)

(declare-fun b_next!26689 () Bool)

(assert (=> start!104894 (= b_free!26689 (not b_next!26689))))

(declare-fun tp!93559 () Bool)

(declare-fun b_and!44447 () Bool)

(assert (=> start!104894 (= tp!93559 b_and!44447)))

(declare-fun b!1250212 () Bool)

(declare-fun res!833935 () Bool)

(declare-fun e!709718 () Bool)

(assert (=> b!1250212 (=> (not res!833935) (not e!709718))))

(declare-datatypes ((array!80771 0))(
  ( (array!80772 (arr!38952 (Array (_ BitVec 32) (_ BitVec 64))) (size!39490 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80771)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80771 (_ BitVec 32)) Bool)

(assert (=> b!1250212 (= res!833935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833932 () Bool)

(assert (=> start!104894 (=> (not res!833932) (not e!709718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104894 (= res!833932 (validMask!0 mask!1466))))

(assert (=> start!104894 e!709718))

(assert (=> start!104894 true))

(assert (=> start!104894 tp!93559))

(declare-fun tp_is_empty!31591 () Bool)

(assert (=> start!104894 tp_is_empty!31591))

(declare-fun array_inv!29845 (array!80771) Bool)

(assert (=> start!104894 (array_inv!29845 _keys!1118)))

(declare-datatypes ((V!47487 0))(
  ( (V!47488 (val!15858 Int)) )
))
(declare-datatypes ((ValueCell!15032 0))(
  ( (ValueCellFull!15032 (v!18553 V!47487)) (EmptyCell!15032) )
))
(declare-datatypes ((array!80773 0))(
  ( (array!80774 (arr!38953 (Array (_ BitVec 32) ValueCell!15032)) (size!39491 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80773)

(declare-fun e!709719 () Bool)

(declare-fun array_inv!29846 (array!80773) Bool)

(assert (=> start!104894 (and (array_inv!29846 _values!914) e!709719)))

(declare-fun b!1250213 () Bool)

(declare-fun e!709724 () Bool)

(assert (=> b!1250213 (= e!709724 tp_is_empty!31591)))

(declare-fun mapNonEmpty!49150 () Bool)

(declare-fun mapRes!49150 () Bool)

(declare-fun tp!93560 () Bool)

(assert (=> mapNonEmpty!49150 (= mapRes!49150 (and tp!93560 e!709724))))

(declare-fun mapValue!49150 () ValueCell!15032)

(declare-fun mapKey!49150 () (_ BitVec 32))

(declare-fun mapRest!49150 () (Array (_ BitVec 32) ValueCell!15032))

(assert (=> mapNonEmpty!49150 (= (arr!38953 _values!914) (store mapRest!49150 mapKey!49150 mapValue!49150))))

(declare-fun b!1250214 () Bool)

(declare-fun e!709722 () Bool)

(declare-fun e!709720 () Bool)

(assert (=> b!1250214 (= e!709722 e!709720)))

(declare-fun res!833934 () Bool)

(assert (=> b!1250214 (=> res!833934 e!709720)))

(declare-datatypes ((tuple2!20514 0))(
  ( (tuple2!20515 (_1!10268 (_ BitVec 64)) (_2!10268 V!47487)) )
))
(declare-datatypes ((List!27739 0))(
  ( (Nil!27736) (Cons!27735 (h!28944 tuple2!20514) (t!41203 List!27739)) )
))
(declare-datatypes ((ListLongMap!18387 0))(
  ( (ListLongMap!18388 (toList!9209 List!27739)) )
))
(declare-fun lt!563970 () ListLongMap!18387)

(declare-fun contains!7456 (ListLongMap!18387 (_ BitVec 64)) Bool)

(assert (=> b!1250214 (= res!833934 (contains!7456 lt!563970 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47487)

(declare-fun minValueBefore!43 () V!47487)

(declare-fun getCurrentListMap!4383 (array!80771 array!80773 (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 (_ BitVec 32) Int) ListLongMap!18387)

(assert (=> b!1250214 (= lt!563970 (getCurrentListMap!4383 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49150 () Bool)

(assert (=> mapIsEmpty!49150 mapRes!49150))

(declare-fun b!1250215 () Bool)

(assert (=> b!1250215 (= e!709718 (not e!709722))))

(declare-fun res!833933 () Bool)

(assert (=> b!1250215 (=> res!833933 e!709722)))

(assert (=> b!1250215 (= res!833933 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!563973 () ListLongMap!18387)

(declare-fun lt!563972 () ListLongMap!18387)

(assert (=> b!1250215 (= lt!563973 lt!563972)))

(declare-fun minValueAfter!43 () V!47487)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41382 0))(
  ( (Unit!41383) )
))
(declare-fun lt!563971 () Unit!41382)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!943 (array!80771 array!80773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 V!47487 V!47487 (_ BitVec 32) Int) Unit!41382)

(assert (=> b!1250215 (= lt!563971 (lemmaNoChangeToArrayThenSameMapNoExtras!943 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5621 (array!80771 array!80773 (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 (_ BitVec 32) Int) ListLongMap!18387)

(assert (=> b!1250215 (= lt!563972 (getCurrentListMapNoExtraKeys!5621 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250215 (= lt!563973 (getCurrentListMapNoExtraKeys!5621 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250216 () Bool)

(declare-fun res!833937 () Bool)

(assert (=> b!1250216 (=> (not res!833937) (not e!709718))))

(declare-datatypes ((List!27740 0))(
  ( (Nil!27737) (Cons!27736 (h!28945 (_ BitVec 64)) (t!41204 List!27740)) )
))
(declare-fun arrayNoDuplicates!0 (array!80771 (_ BitVec 32) List!27740) Bool)

(assert (=> b!1250216 (= res!833937 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27737))))

(declare-fun b!1250217 () Bool)

(declare-fun e!709723 () Bool)

(assert (=> b!1250217 (= e!709719 (and e!709723 mapRes!49150))))

(declare-fun condMapEmpty!49150 () Bool)

(declare-fun mapDefault!49150 () ValueCell!15032)

(assert (=> b!1250217 (= condMapEmpty!49150 (= (arr!38953 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15032)) mapDefault!49150)))))

(declare-fun b!1250218 () Bool)

(assert (=> b!1250218 (= e!709723 tp_is_empty!31591)))

(declare-fun b!1250219 () Bool)

(assert (=> b!1250219 (= e!709720 true)))

(declare-fun -!1955 (ListLongMap!18387 (_ BitVec 64)) ListLongMap!18387)

(assert (=> b!1250219 (= (-!1955 lt!563970 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563970)))

(declare-fun lt!563969 () Unit!41382)

(declare-fun removeNotPresentStillSame!83 (ListLongMap!18387 (_ BitVec 64)) Unit!41382)

(assert (=> b!1250219 (= lt!563969 (removeNotPresentStillSame!83 lt!563970 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250220 () Bool)

(declare-fun res!833936 () Bool)

(assert (=> b!1250220 (=> (not res!833936) (not e!709718))))

(assert (=> b!1250220 (= res!833936 (and (= (size!39491 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39490 _keys!1118) (size!39491 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104894 res!833932) b!1250220))

(assert (= (and b!1250220 res!833936) b!1250212))

(assert (= (and b!1250212 res!833935) b!1250216))

(assert (= (and b!1250216 res!833937) b!1250215))

(assert (= (and b!1250215 (not res!833933)) b!1250214))

(assert (= (and b!1250214 (not res!833934)) b!1250219))

(assert (= (and b!1250217 condMapEmpty!49150) mapIsEmpty!49150))

(assert (= (and b!1250217 (not condMapEmpty!49150)) mapNonEmpty!49150))

(get-info :version)

(assert (= (and mapNonEmpty!49150 ((_ is ValueCellFull!15032) mapValue!49150)) b!1250213))

(assert (= (and b!1250217 ((_ is ValueCellFull!15032) mapDefault!49150)) b!1250218))

(assert (= start!104894 b!1250217))

(declare-fun m!1150609 () Bool)

(assert (=> b!1250215 m!1150609))

(declare-fun m!1150611 () Bool)

(assert (=> b!1250215 m!1150611))

(declare-fun m!1150613 () Bool)

(assert (=> b!1250215 m!1150613))

(declare-fun m!1150615 () Bool)

(assert (=> b!1250212 m!1150615))

(declare-fun m!1150617 () Bool)

(assert (=> b!1250216 m!1150617))

(declare-fun m!1150619 () Bool)

(assert (=> start!104894 m!1150619))

(declare-fun m!1150621 () Bool)

(assert (=> start!104894 m!1150621))

(declare-fun m!1150623 () Bool)

(assert (=> start!104894 m!1150623))

(declare-fun m!1150625 () Bool)

(assert (=> b!1250214 m!1150625))

(declare-fun m!1150627 () Bool)

(assert (=> b!1250214 m!1150627))

(declare-fun m!1150629 () Bool)

(assert (=> b!1250219 m!1150629))

(declare-fun m!1150631 () Bool)

(assert (=> b!1250219 m!1150631))

(declare-fun m!1150633 () Bool)

(assert (=> mapNonEmpty!49150 m!1150633))

(check-sat (not mapNonEmpty!49150) (not b_next!26689) (not b!1250219) (not b!1250212) (not b!1250216) b_and!44447 (not b!1250215) (not b!1250214) (not start!104894) tp_is_empty!31591)
(check-sat b_and!44447 (not b_next!26689))
