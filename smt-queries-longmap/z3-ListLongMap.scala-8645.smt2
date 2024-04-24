; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105412 () Bool)

(assert start!105412)

(declare-fun b_free!26905 () Bool)

(declare-fun b_next!26905 () Bool)

(assert (=> start!105412 (= b_free!26905 (not b_next!26905))))

(declare-fun tp!94219 () Bool)

(declare-fun b_and!44721 () Bool)

(assert (=> start!105412 (= tp!94219 b_and!44721)))

(declare-fun b!1254790 () Bool)

(declare-fun e!712957 () Bool)

(declare-fun tp_is_empty!31807 () Bool)

(assert (=> b!1254790 (= e!712957 tp_is_empty!31807)))

(declare-fun mapIsEmpty!49486 () Bool)

(declare-fun mapRes!49486 () Bool)

(assert (=> mapIsEmpty!49486 mapRes!49486))

(declare-fun res!836379 () Bool)

(declare-fun e!712959 () Bool)

(assert (=> start!105412 (=> (not res!836379) (not e!712959))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105412 (= res!836379 (validMask!0 mask!1466))))

(assert (=> start!105412 e!712959))

(assert (=> start!105412 true))

(assert (=> start!105412 tp!94219))

(assert (=> start!105412 tp_is_empty!31807))

(declare-datatypes ((array!81315 0))(
  ( (array!81316 (arr!39215 (Array (_ BitVec 32) (_ BitVec 64))) (size!39752 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81315)

(declare-fun array_inv!30011 (array!81315) Bool)

(assert (=> start!105412 (array_inv!30011 _keys!1118)))

(declare-datatypes ((V!47775 0))(
  ( (V!47776 (val!15966 Int)) )
))
(declare-datatypes ((ValueCell!15140 0))(
  ( (ValueCellFull!15140 (v!18660 V!47775)) (EmptyCell!15140) )
))
(declare-datatypes ((array!81317 0))(
  ( (array!81318 (arr!39216 (Array (_ BitVec 32) ValueCell!15140)) (size!39753 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81317)

(declare-fun e!712958 () Bool)

(declare-fun array_inv!30012 (array!81317) Bool)

(assert (=> start!105412 (and (array_inv!30012 _values!914) e!712958)))

(declare-fun b!1254791 () Bool)

(declare-fun e!712956 () Bool)

(assert (=> b!1254791 (= e!712956 true)))

(declare-datatypes ((tuple2!20622 0))(
  ( (tuple2!20623 (_1!10322 (_ BitVec 64)) (_2!10322 V!47775)) )
))
(declare-datatypes ((List!27860 0))(
  ( (Nil!27857) (Cons!27856 (h!29074 tuple2!20622) (t!41333 List!27860)) )
))
(declare-datatypes ((ListLongMap!18503 0))(
  ( (ListLongMap!18504 (toList!9267 List!27860)) )
))
(declare-fun lt!566506 () ListLongMap!18503)

(declare-fun lt!566504 () ListLongMap!18503)

(declare-fun -!2009 (ListLongMap!18503 (_ BitVec 64)) ListLongMap!18503)

(assert (=> b!1254791 (= lt!566506 (-!2009 lt!566504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566499 () ListLongMap!18503)

(declare-fun lt!566501 () ListLongMap!18503)

(assert (=> b!1254791 (= (-!2009 lt!566499 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566501)))

(declare-datatypes ((Unit!41671 0))(
  ( (Unit!41672) )
))
(declare-fun lt!566503 () Unit!41671)

(declare-fun minValueBefore!43 () V!47775)

(declare-fun addThenRemoveForNewKeyIsSame!299 (ListLongMap!18503 (_ BitVec 64) V!47775) Unit!41671)

(assert (=> b!1254791 (= lt!566503 (addThenRemoveForNewKeyIsSame!299 lt!566501 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566505 () ListLongMap!18503)

(declare-fun lt!566500 () ListLongMap!18503)

(assert (=> b!1254791 (and (= lt!566504 lt!566499) (= lt!566500 lt!566505))))

(declare-fun +!4205 (ListLongMap!18503 tuple2!20622) ListLongMap!18503)

(assert (=> b!1254791 (= lt!566499 (+!4205 lt!566501 (tuple2!20623 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47775)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47775)

(declare-fun getCurrentListMap!4502 (array!81315 array!81317 (_ BitVec 32) (_ BitVec 32) V!47775 V!47775 (_ BitVec 32) Int) ListLongMap!18503)

(assert (=> b!1254791 (= lt!566500 (getCurrentListMap!4502 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254791 (= lt!566504 (getCurrentListMap!4502 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254792 () Bool)

(declare-fun res!836377 () Bool)

(assert (=> b!1254792 (=> (not res!836377) (not e!712959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81315 (_ BitVec 32)) Bool)

(assert (=> b!1254792 (= res!836377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254793 () Bool)

(declare-fun e!712955 () Bool)

(assert (=> b!1254793 (= e!712955 tp_is_empty!31807)))

(declare-fun b!1254794 () Bool)

(assert (=> b!1254794 (= e!712958 (and e!712957 mapRes!49486))))

(declare-fun condMapEmpty!49486 () Bool)

(declare-fun mapDefault!49486 () ValueCell!15140)

(assert (=> b!1254794 (= condMapEmpty!49486 (= (arr!39216 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15140)) mapDefault!49486)))))

(declare-fun b!1254795 () Bool)

(assert (=> b!1254795 (= e!712959 (not e!712956))))

(declare-fun res!836378 () Bool)

(assert (=> b!1254795 (=> res!836378 e!712956)))

(assert (=> b!1254795 (= res!836378 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254795 (= lt!566501 lt!566505)))

(declare-fun lt!566502 () Unit!41671)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1006 (array!81315 array!81317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47775 V!47775 V!47775 V!47775 (_ BitVec 32) Int) Unit!41671)

(assert (=> b!1254795 (= lt!566502 (lemmaNoChangeToArrayThenSameMapNoExtras!1006 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5692 (array!81315 array!81317 (_ BitVec 32) (_ BitVec 32) V!47775 V!47775 (_ BitVec 32) Int) ListLongMap!18503)

(assert (=> b!1254795 (= lt!566505 (getCurrentListMapNoExtraKeys!5692 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254795 (= lt!566501 (getCurrentListMapNoExtraKeys!5692 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254796 () Bool)

(declare-fun res!836376 () Bool)

(assert (=> b!1254796 (=> (not res!836376) (not e!712959))))

(assert (=> b!1254796 (= res!836376 (and (= (size!39753 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39752 _keys!1118) (size!39753 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254797 () Bool)

(declare-fun res!836375 () Bool)

(assert (=> b!1254797 (=> (not res!836375) (not e!712959))))

(declare-datatypes ((List!27861 0))(
  ( (Nil!27858) (Cons!27857 (h!29075 (_ BitVec 64)) (t!41334 List!27861)) )
))
(declare-fun arrayNoDuplicates!0 (array!81315 (_ BitVec 32) List!27861) Bool)

(assert (=> b!1254797 (= res!836375 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27858))))

(declare-fun mapNonEmpty!49486 () Bool)

(declare-fun tp!94220 () Bool)

(assert (=> mapNonEmpty!49486 (= mapRes!49486 (and tp!94220 e!712955))))

(declare-fun mapRest!49486 () (Array (_ BitVec 32) ValueCell!15140))

(declare-fun mapKey!49486 () (_ BitVec 32))

(declare-fun mapValue!49486 () ValueCell!15140)

(assert (=> mapNonEmpty!49486 (= (arr!39216 _values!914) (store mapRest!49486 mapKey!49486 mapValue!49486))))

(assert (= (and start!105412 res!836379) b!1254796))

(assert (= (and b!1254796 res!836376) b!1254792))

(assert (= (and b!1254792 res!836377) b!1254797))

(assert (= (and b!1254797 res!836375) b!1254795))

(assert (= (and b!1254795 (not res!836378)) b!1254791))

(assert (= (and b!1254794 condMapEmpty!49486) mapIsEmpty!49486))

(assert (= (and b!1254794 (not condMapEmpty!49486)) mapNonEmpty!49486))

(get-info :version)

(assert (= (and mapNonEmpty!49486 ((_ is ValueCellFull!15140) mapValue!49486)) b!1254793))

(assert (= (and b!1254794 ((_ is ValueCellFull!15140) mapDefault!49486)) b!1254790))

(assert (= start!105412 b!1254794))

(declare-fun m!1155637 () Bool)

(assert (=> b!1254791 m!1155637))

(declare-fun m!1155639 () Bool)

(assert (=> b!1254791 m!1155639))

(declare-fun m!1155641 () Bool)

(assert (=> b!1254791 m!1155641))

(declare-fun m!1155643 () Bool)

(assert (=> b!1254791 m!1155643))

(declare-fun m!1155645 () Bool)

(assert (=> b!1254791 m!1155645))

(declare-fun m!1155647 () Bool)

(assert (=> b!1254791 m!1155647))

(declare-fun m!1155649 () Bool)

(assert (=> mapNonEmpty!49486 m!1155649))

(declare-fun m!1155651 () Bool)

(assert (=> b!1254795 m!1155651))

(declare-fun m!1155653 () Bool)

(assert (=> b!1254795 m!1155653))

(declare-fun m!1155655 () Bool)

(assert (=> b!1254795 m!1155655))

(declare-fun m!1155657 () Bool)

(assert (=> start!105412 m!1155657))

(declare-fun m!1155659 () Bool)

(assert (=> start!105412 m!1155659))

(declare-fun m!1155661 () Bool)

(assert (=> start!105412 m!1155661))

(declare-fun m!1155663 () Bool)

(assert (=> b!1254792 m!1155663))

(declare-fun m!1155665 () Bool)

(assert (=> b!1254797 m!1155665))

(check-sat (not b!1254791) (not b!1254792) (not start!105412) (not mapNonEmpty!49486) (not b!1254795) (not b_next!26905) (not b!1254797) b_and!44721 tp_is_empty!31807)
(check-sat b_and!44721 (not b_next!26905))
