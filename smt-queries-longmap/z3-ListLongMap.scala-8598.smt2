; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104814 () Bool)

(assert start!104814)

(declare-fun b_free!26623 () Bool)

(declare-fun b_next!26623 () Bool)

(assert (=> start!104814 (= b_free!26623 (not b_next!26623))))

(declare-fun tp!93359 () Bool)

(declare-fun b_and!44373 () Bool)

(assert (=> start!104814 (= tp!93359 b_and!44373)))

(declare-fun mapIsEmpty!49048 () Bool)

(declare-fun mapRes!49048 () Bool)

(assert (=> mapIsEmpty!49048 mapRes!49048))

(declare-fun b!1249349 () Bool)

(declare-fun e!709084 () Bool)

(declare-fun tp_is_empty!31525 () Bool)

(assert (=> b!1249349 (= e!709084 tp_is_empty!31525)))

(declare-fun b!1249350 () Bool)

(declare-fun res!833422 () Bool)

(declare-fun e!709085 () Bool)

(assert (=> b!1249350 (=> (not res!833422) (not e!709085))))

(declare-datatypes ((array!80647 0))(
  ( (array!80648 (arr!38891 (Array (_ BitVec 32) (_ BitVec 64))) (size!39429 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80647)

(declare-datatypes ((List!27690 0))(
  ( (Nil!27687) (Cons!27686 (h!28895 (_ BitVec 64)) (t!41152 List!27690)) )
))
(declare-fun arrayNoDuplicates!0 (array!80647 (_ BitVec 32) List!27690) Bool)

(assert (=> b!1249350 (= res!833422 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27687))))

(declare-fun b!1249351 () Bool)

(declare-fun e!709086 () Bool)

(assert (=> b!1249351 (= e!709086 tp_is_empty!31525)))

(declare-fun mapNonEmpty!49048 () Bool)

(declare-fun tp!93358 () Bool)

(assert (=> mapNonEmpty!49048 (= mapRes!49048 (and tp!93358 e!709084))))

(declare-fun mapKey!49048 () (_ BitVec 32))

(declare-datatypes ((V!47399 0))(
  ( (V!47400 (val!15825 Int)) )
))
(declare-datatypes ((ValueCell!14999 0))(
  ( (ValueCellFull!14999 (v!18520 V!47399)) (EmptyCell!14999) )
))
(declare-fun mapRest!49048 () (Array (_ BitVec 32) ValueCell!14999))

(declare-datatypes ((array!80649 0))(
  ( (array!80650 (arr!38892 (Array (_ BitVec 32) ValueCell!14999)) (size!39430 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80649)

(declare-fun mapValue!49048 () ValueCell!14999)

(assert (=> mapNonEmpty!49048 (= (arr!38892 _values!914) (store mapRest!49048 mapKey!49048 mapValue!49048))))

(declare-fun b!1249352 () Bool)

(assert (=> b!1249352 (= e!709085 (not true))))

(declare-datatypes ((tuple2!20462 0))(
  ( (tuple2!20463 (_1!10242 (_ BitVec 64)) (_2!10242 V!47399)) )
))
(declare-datatypes ((List!27691 0))(
  ( (Nil!27688) (Cons!27687 (h!28896 tuple2!20462) (t!41153 List!27691)) )
))
(declare-datatypes ((ListLongMap!18335 0))(
  ( (ListLongMap!18336 (toList!9183 List!27691)) )
))
(declare-fun lt!563548 () ListLongMap!18335)

(declare-fun lt!563547 () ListLongMap!18335)

(assert (=> b!1249352 (= lt!563548 lt!563547)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47399)

(declare-fun minValueBefore!43 () V!47399)

(declare-fun minValueAfter!43 () V!47399)

(declare-datatypes ((Unit!41334 0))(
  ( (Unit!41335) )
))
(declare-fun lt!563549 () Unit!41334)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!922 (array!80647 array!80649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47399 V!47399 V!47399 V!47399 (_ BitVec 32) Int) Unit!41334)

(assert (=> b!1249352 (= lt!563549 (lemmaNoChangeToArrayThenSameMapNoExtras!922 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5600 (array!80647 array!80649 (_ BitVec 32) (_ BitVec 32) V!47399 V!47399 (_ BitVec 32) Int) ListLongMap!18335)

(assert (=> b!1249352 (= lt!563547 (getCurrentListMapNoExtraKeys!5600 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249352 (= lt!563548 (getCurrentListMapNoExtraKeys!5600 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249353 () Bool)

(declare-fun res!833421 () Bool)

(assert (=> b!1249353 (=> (not res!833421) (not e!709085))))

(assert (=> b!1249353 (= res!833421 (and (= (size!39430 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39429 _keys!1118) (size!39430 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833423 () Bool)

(assert (=> start!104814 (=> (not res!833423) (not e!709085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104814 (= res!833423 (validMask!0 mask!1466))))

(assert (=> start!104814 e!709085))

(assert (=> start!104814 true))

(assert (=> start!104814 tp!93359))

(assert (=> start!104814 tp_is_empty!31525))

(declare-fun array_inv!29813 (array!80647) Bool)

(assert (=> start!104814 (array_inv!29813 _keys!1118)))

(declare-fun e!709087 () Bool)

(declare-fun array_inv!29814 (array!80649) Bool)

(assert (=> start!104814 (and (array_inv!29814 _values!914) e!709087)))

(declare-fun b!1249354 () Bool)

(assert (=> b!1249354 (= e!709087 (and e!709086 mapRes!49048))))

(declare-fun condMapEmpty!49048 () Bool)

(declare-fun mapDefault!49048 () ValueCell!14999)

(assert (=> b!1249354 (= condMapEmpty!49048 (= (arr!38892 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14999)) mapDefault!49048)))))

(declare-fun b!1249355 () Bool)

(declare-fun res!833420 () Bool)

(assert (=> b!1249355 (=> (not res!833420) (not e!709085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80647 (_ BitVec 32)) Bool)

(assert (=> b!1249355 (= res!833420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104814 res!833423) b!1249353))

(assert (= (and b!1249353 res!833421) b!1249355))

(assert (= (and b!1249355 res!833420) b!1249350))

(assert (= (and b!1249350 res!833422) b!1249352))

(assert (= (and b!1249354 condMapEmpty!49048) mapIsEmpty!49048))

(assert (= (and b!1249354 (not condMapEmpty!49048)) mapNonEmpty!49048))

(get-info :version)

(assert (= (and mapNonEmpty!49048 ((_ is ValueCellFull!14999) mapValue!49048)) b!1249349))

(assert (= (and b!1249354 ((_ is ValueCellFull!14999) mapDefault!49048)) b!1249351))

(assert (= start!104814 b!1249354))

(declare-fun m!1149841 () Bool)

(assert (=> b!1249355 m!1149841))

(declare-fun m!1149843 () Bool)

(assert (=> b!1249352 m!1149843))

(declare-fun m!1149845 () Bool)

(assert (=> b!1249352 m!1149845))

(declare-fun m!1149847 () Bool)

(assert (=> b!1249352 m!1149847))

(declare-fun m!1149849 () Bool)

(assert (=> b!1249350 m!1149849))

(declare-fun m!1149851 () Bool)

(assert (=> start!104814 m!1149851))

(declare-fun m!1149853 () Bool)

(assert (=> start!104814 m!1149853))

(declare-fun m!1149855 () Bool)

(assert (=> start!104814 m!1149855))

(declare-fun m!1149857 () Bool)

(assert (=> mapNonEmpty!49048 m!1149857))

(check-sat (not start!104814) b_and!44373 (not b!1249355) (not mapNonEmpty!49048) (not b_next!26623) tp_is_empty!31525 (not b!1249352) (not b!1249350))
(check-sat b_and!44373 (not b_next!26623))
