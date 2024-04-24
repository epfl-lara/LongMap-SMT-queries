; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106034 () Bool)

(assert start!106034)

(declare-fun b_free!27373 () Bool)

(declare-fun b_next!27373 () Bool)

(assert (=> start!106034 (= b_free!27373 (not b_next!27373))))

(declare-fun tp!95648 () Bool)

(declare-fun b_and!45271 () Bool)

(assert (=> start!106034 (= tp!95648 b_and!45271)))

(declare-fun b!1261750 () Bool)

(declare-fun e!718088 () Bool)

(assert (=> b!1261750 (= e!718088 true)))

(declare-datatypes ((V!48399 0))(
  ( (V!48400 (val!16200 Int)) )
))
(declare-datatypes ((tuple2!20976 0))(
  ( (tuple2!20977 (_1!10499 (_ BitVec 64)) (_2!10499 V!48399)) )
))
(declare-datatypes ((List!28197 0))(
  ( (Nil!28194) (Cons!28193 (h!29411 tuple2!20976) (t!41686 List!28197)) )
))
(declare-datatypes ((ListLongMap!18857 0))(
  ( (ListLongMap!18858 (toList!9444 List!28197)) )
))
(declare-fun lt!571612 () ListLongMap!18857)

(declare-fun lt!571613 () ListLongMap!18857)

(declare-fun -!2110 (ListLongMap!18857 (_ BitVec 64)) ListLongMap!18857)

(assert (=> b!1261750 (= lt!571612 (-!2110 lt!571613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571615 () ListLongMap!18857)

(declare-fun lt!571611 () ListLongMap!18857)

(assert (=> b!1261750 (= (-!2110 lt!571615 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571611)))

(declare-datatypes ((Unit!42024 0))(
  ( (Unit!42025) )
))
(declare-fun lt!571610 () Unit!42024)

(declare-fun minValueBefore!43 () V!48399)

(declare-fun addThenRemoveForNewKeyIsSame!364 (ListLongMap!18857 (_ BitVec 64) V!48399) Unit!42024)

(assert (=> b!1261750 (= lt!571610 (addThenRemoveForNewKeyIsSame!364 lt!571611 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!718091 () Bool)

(assert (=> b!1261750 e!718091))

(declare-fun res!840532 () Bool)

(assert (=> b!1261750 (=> (not res!840532) (not e!718091))))

(assert (=> b!1261750 (= res!840532 (= lt!571613 lt!571615))))

(declare-fun +!4282 (ListLongMap!18857 tuple2!20976) ListLongMap!18857)

(assert (=> b!1261750 (= lt!571615 (+!4282 lt!571611 (tuple2!20977 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571614 () ListLongMap!18857)

(declare-fun lt!571609 () tuple2!20976)

(assert (=> b!1261750 (= lt!571611 (+!4282 lt!571614 lt!571609))))

(declare-fun zeroValue!871 () V!48399)

(assert (=> b!1261750 (= lt!571609 (tuple2!20977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48399)

(declare-datatypes ((array!82219 0))(
  ( (array!82220 (arr!39659 (Array (_ BitVec 32) (_ BitVec 64))) (size!40196 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82219)

(declare-datatypes ((ValueCell!15374 0))(
  ( (ValueCellFull!15374 (v!18899 V!48399)) (EmptyCell!15374) )
))
(declare-datatypes ((array!82221 0))(
  ( (array!82222 (arr!39660 (Array (_ BitVec 32) ValueCell!15374)) (size!40197 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82221)

(declare-fun lt!571616 () ListLongMap!18857)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4622 (array!82219 array!82221 (_ BitVec 32) (_ BitVec 32) V!48399 V!48399 (_ BitVec 32) Int) ListLongMap!18857)

(assert (=> b!1261750 (= lt!571616 (getCurrentListMap!4622 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261750 (= lt!571613 (getCurrentListMap!4622 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50212 () Bool)

(declare-fun mapRes!50212 () Bool)

(assert (=> mapIsEmpty!50212 mapRes!50212))

(declare-fun b!1261751 () Bool)

(declare-fun res!840537 () Bool)

(declare-fun e!718090 () Bool)

(assert (=> b!1261751 (=> (not res!840537) (not e!718090))))

(declare-datatypes ((List!28198 0))(
  ( (Nil!28195) (Cons!28194 (h!29412 (_ BitVec 64)) (t!41687 List!28198)) )
))
(declare-fun arrayNoDuplicates!0 (array!82219 (_ BitVec 32) List!28198) Bool)

(assert (=> b!1261751 (= res!840537 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28195))))

(declare-fun b!1261752 () Bool)

(declare-fun res!840536 () Bool)

(assert (=> b!1261752 (=> (not res!840536) (not e!718090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82219 (_ BitVec 32)) Bool)

(assert (=> b!1261752 (= res!840536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261753 () Bool)

(declare-fun res!840534 () Bool)

(assert (=> b!1261753 (=> (not res!840534) (not e!718090))))

(assert (=> b!1261753 (= res!840534 (and (= (size!40197 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40196 _keys!1118) (size!40197 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261754 () Bool)

(declare-fun lt!571607 () ListLongMap!18857)

(assert (=> b!1261754 (= e!718091 (= lt!571616 (+!4282 lt!571607 lt!571609)))))

(declare-fun res!840535 () Bool)

(assert (=> start!106034 (=> (not res!840535) (not e!718090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106034 (= res!840535 (validMask!0 mask!1466))))

(assert (=> start!106034 e!718090))

(assert (=> start!106034 true))

(assert (=> start!106034 tp!95648))

(declare-fun tp_is_empty!32275 () Bool)

(assert (=> start!106034 tp_is_empty!32275))

(declare-fun array_inv!30337 (array!82219) Bool)

(assert (=> start!106034 (array_inv!30337 _keys!1118)))

(declare-fun e!718085 () Bool)

(declare-fun array_inv!30338 (array!82221) Bool)

(assert (=> start!106034 (and (array_inv!30338 _values!914) e!718085)))

(declare-fun b!1261749 () Bool)

(declare-fun e!718086 () Bool)

(assert (=> b!1261749 (= e!718086 tp_is_empty!32275)))

(declare-fun b!1261755 () Bool)

(assert (=> b!1261755 (= e!718090 (not e!718088))))

(declare-fun res!840533 () Bool)

(assert (=> b!1261755 (=> res!840533 e!718088)))

(assert (=> b!1261755 (= res!840533 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1261755 (= lt!571614 lt!571607)))

(declare-fun lt!571608 () Unit!42024)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1165 (array!82219 array!82221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48399 V!48399 V!48399 V!48399 (_ BitVec 32) Int) Unit!42024)

(assert (=> b!1261755 (= lt!571608 (lemmaNoChangeToArrayThenSameMapNoExtras!1165 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5851 (array!82219 array!82221 (_ BitVec 32) (_ BitVec 32) V!48399 V!48399 (_ BitVec 32) Int) ListLongMap!18857)

(assert (=> b!1261755 (= lt!571607 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261755 (= lt!571614 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261756 () Bool)

(assert (=> b!1261756 (= e!718085 (and e!718086 mapRes!50212))))

(declare-fun condMapEmpty!50212 () Bool)

(declare-fun mapDefault!50212 () ValueCell!15374)

(assert (=> b!1261756 (= condMapEmpty!50212 (= (arr!39660 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15374)) mapDefault!50212)))))

(declare-fun b!1261757 () Bool)

(declare-fun e!718087 () Bool)

(assert (=> b!1261757 (= e!718087 tp_is_empty!32275)))

(declare-fun mapNonEmpty!50212 () Bool)

(declare-fun tp!95647 () Bool)

(assert (=> mapNonEmpty!50212 (= mapRes!50212 (and tp!95647 e!718087))))

(declare-fun mapValue!50212 () ValueCell!15374)

(declare-fun mapKey!50212 () (_ BitVec 32))

(declare-fun mapRest!50212 () (Array (_ BitVec 32) ValueCell!15374))

(assert (=> mapNonEmpty!50212 (= (arr!39660 _values!914) (store mapRest!50212 mapKey!50212 mapValue!50212))))

(assert (= (and start!106034 res!840535) b!1261753))

(assert (= (and b!1261753 res!840534) b!1261752))

(assert (= (and b!1261752 res!840536) b!1261751))

(assert (= (and b!1261751 res!840537) b!1261755))

(assert (= (and b!1261755 (not res!840533)) b!1261750))

(assert (= (and b!1261750 res!840532) b!1261754))

(assert (= (and b!1261756 condMapEmpty!50212) mapIsEmpty!50212))

(assert (= (and b!1261756 (not condMapEmpty!50212)) mapNonEmpty!50212))

(get-info :version)

(assert (= (and mapNonEmpty!50212 ((_ is ValueCellFull!15374) mapValue!50212)) b!1261757))

(assert (= (and b!1261756 ((_ is ValueCellFull!15374) mapDefault!50212)) b!1261749))

(assert (= start!106034 b!1261756))

(declare-fun m!1162763 () Bool)

(assert (=> b!1261751 m!1162763))

(declare-fun m!1162765 () Bool)

(assert (=> b!1261752 m!1162765))

(declare-fun m!1162767 () Bool)

(assert (=> start!106034 m!1162767))

(declare-fun m!1162769 () Bool)

(assert (=> start!106034 m!1162769))

(declare-fun m!1162771 () Bool)

(assert (=> start!106034 m!1162771))

(declare-fun m!1162773 () Bool)

(assert (=> b!1261750 m!1162773))

(declare-fun m!1162775 () Bool)

(assert (=> b!1261750 m!1162775))

(declare-fun m!1162777 () Bool)

(assert (=> b!1261750 m!1162777))

(declare-fun m!1162779 () Bool)

(assert (=> b!1261750 m!1162779))

(declare-fun m!1162781 () Bool)

(assert (=> b!1261750 m!1162781))

(declare-fun m!1162783 () Bool)

(assert (=> b!1261750 m!1162783))

(declare-fun m!1162785 () Bool)

(assert (=> b!1261750 m!1162785))

(declare-fun m!1162787 () Bool)

(assert (=> b!1261754 m!1162787))

(declare-fun m!1162789 () Bool)

(assert (=> mapNonEmpty!50212 m!1162789))

(declare-fun m!1162791 () Bool)

(assert (=> b!1261755 m!1162791))

(declare-fun m!1162793 () Bool)

(assert (=> b!1261755 m!1162793))

(declare-fun m!1162795 () Bool)

(assert (=> b!1261755 m!1162795))

(check-sat tp_is_empty!32275 (not b!1261752) (not start!106034) b_and!45271 (not b!1261750) (not b_next!27373) (not b!1261751) (not mapNonEmpty!50212) (not b!1261754) (not b!1261755))
(check-sat b_and!45271 (not b_next!27373))
