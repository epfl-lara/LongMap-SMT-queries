; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104838 () Bool)

(assert start!104838)

(declare-fun b_free!26647 () Bool)

(declare-fun b_next!26647 () Bool)

(assert (=> start!104838 (= b_free!26647 (not b_next!26647))))

(declare-fun tp!93430 () Bool)

(declare-fun b_and!44397 () Bool)

(assert (=> start!104838 (= tp!93430 b_and!44397)))

(declare-fun b!1249601 () Bool)

(declare-fun e!709265 () Bool)

(assert (=> b!1249601 (= e!709265 (not true))))

(declare-datatypes ((V!47431 0))(
  ( (V!47432 (val!15837 Int)) )
))
(declare-datatypes ((tuple2!20480 0))(
  ( (tuple2!20481 (_1!10251 (_ BitVec 64)) (_2!10251 V!47431)) )
))
(declare-datatypes ((List!27708 0))(
  ( (Nil!27705) (Cons!27704 (h!28913 tuple2!20480) (t!41170 List!27708)) )
))
(declare-datatypes ((ListLongMap!18353 0))(
  ( (ListLongMap!18354 (toList!9192 List!27708)) )
))
(declare-fun lt!563656 () ListLongMap!18353)

(declare-fun lt!563655 () ListLongMap!18353)

(assert (=> b!1249601 (= lt!563656 lt!563655)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47431)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47431)

(declare-datatypes ((ValueCell!15011 0))(
  ( (ValueCellFull!15011 (v!18532 V!47431)) (EmptyCell!15011) )
))
(declare-datatypes ((array!80691 0))(
  ( (array!80692 (arr!38913 (Array (_ BitVec 32) ValueCell!15011)) (size!39451 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80691)

(declare-fun minValueBefore!43 () V!47431)

(declare-datatypes ((array!80693 0))(
  ( (array!80694 (arr!38914 (Array (_ BitVec 32) (_ BitVec 64))) (size!39452 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80693)

(declare-datatypes ((Unit!41352 0))(
  ( (Unit!41353) )
))
(declare-fun lt!563657 () Unit!41352)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!931 (array!80693 array!80691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47431 V!47431 V!47431 V!47431 (_ BitVec 32) Int) Unit!41352)

(assert (=> b!1249601 (= lt!563657 (lemmaNoChangeToArrayThenSameMapNoExtras!931 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5609 (array!80693 array!80691 (_ BitVec 32) (_ BitVec 32) V!47431 V!47431 (_ BitVec 32) Int) ListLongMap!18353)

(assert (=> b!1249601 (= lt!563655 (getCurrentListMapNoExtraKeys!5609 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249601 (= lt!563656 (getCurrentListMapNoExtraKeys!5609 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249602 () Bool)

(declare-fun res!833566 () Bool)

(assert (=> b!1249602 (=> (not res!833566) (not e!709265))))

(assert (=> b!1249602 (= res!833566 (and (= (size!39451 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39452 _keys!1118) (size!39451 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249603 () Bool)

(declare-fun e!709267 () Bool)

(declare-fun e!709263 () Bool)

(declare-fun mapRes!49084 () Bool)

(assert (=> b!1249603 (= e!709267 (and e!709263 mapRes!49084))))

(declare-fun condMapEmpty!49084 () Bool)

(declare-fun mapDefault!49084 () ValueCell!15011)

(assert (=> b!1249603 (= condMapEmpty!49084 (= (arr!38913 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15011)) mapDefault!49084)))))

(declare-fun res!833564 () Bool)

(assert (=> start!104838 (=> (not res!833564) (not e!709265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104838 (= res!833564 (validMask!0 mask!1466))))

(assert (=> start!104838 e!709265))

(assert (=> start!104838 true))

(assert (=> start!104838 tp!93430))

(declare-fun tp_is_empty!31549 () Bool)

(assert (=> start!104838 tp_is_empty!31549))

(declare-fun array_inv!29827 (array!80693) Bool)

(assert (=> start!104838 (array_inv!29827 _keys!1118)))

(declare-fun array_inv!29828 (array!80691) Bool)

(assert (=> start!104838 (and (array_inv!29828 _values!914) e!709267)))

(declare-fun mapNonEmpty!49084 () Bool)

(declare-fun tp!93431 () Bool)

(declare-fun e!709264 () Bool)

(assert (=> mapNonEmpty!49084 (= mapRes!49084 (and tp!93431 e!709264))))

(declare-fun mapKey!49084 () (_ BitVec 32))

(declare-fun mapRest!49084 () (Array (_ BitVec 32) ValueCell!15011))

(declare-fun mapValue!49084 () ValueCell!15011)

(assert (=> mapNonEmpty!49084 (= (arr!38913 _values!914) (store mapRest!49084 mapKey!49084 mapValue!49084))))

(declare-fun b!1249604 () Bool)

(declare-fun res!833567 () Bool)

(assert (=> b!1249604 (=> (not res!833567) (not e!709265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80693 (_ BitVec 32)) Bool)

(assert (=> b!1249604 (= res!833567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249605 () Bool)

(declare-fun res!833565 () Bool)

(assert (=> b!1249605 (=> (not res!833565) (not e!709265))))

(declare-datatypes ((List!27709 0))(
  ( (Nil!27706) (Cons!27705 (h!28914 (_ BitVec 64)) (t!41171 List!27709)) )
))
(declare-fun arrayNoDuplicates!0 (array!80693 (_ BitVec 32) List!27709) Bool)

(assert (=> b!1249605 (= res!833565 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27706))))

(declare-fun b!1249606 () Bool)

(assert (=> b!1249606 (= e!709263 tp_is_empty!31549)))

(declare-fun mapIsEmpty!49084 () Bool)

(assert (=> mapIsEmpty!49084 mapRes!49084))

(declare-fun b!1249607 () Bool)

(assert (=> b!1249607 (= e!709264 tp_is_empty!31549)))

(assert (= (and start!104838 res!833564) b!1249602))

(assert (= (and b!1249602 res!833566) b!1249604))

(assert (= (and b!1249604 res!833567) b!1249605))

(assert (= (and b!1249605 res!833565) b!1249601))

(assert (= (and b!1249603 condMapEmpty!49084) mapIsEmpty!49084))

(assert (= (and b!1249603 (not condMapEmpty!49084)) mapNonEmpty!49084))

(get-info :version)

(assert (= (and mapNonEmpty!49084 ((_ is ValueCellFull!15011) mapValue!49084)) b!1249607))

(assert (= (and b!1249603 ((_ is ValueCellFull!15011) mapDefault!49084)) b!1249606))

(assert (= start!104838 b!1249603))

(declare-fun m!1150057 () Bool)

(assert (=> b!1249605 m!1150057))

(declare-fun m!1150059 () Bool)

(assert (=> start!104838 m!1150059))

(declare-fun m!1150061 () Bool)

(assert (=> start!104838 m!1150061))

(declare-fun m!1150063 () Bool)

(assert (=> start!104838 m!1150063))

(declare-fun m!1150065 () Bool)

(assert (=> mapNonEmpty!49084 m!1150065))

(declare-fun m!1150067 () Bool)

(assert (=> b!1249601 m!1150067))

(declare-fun m!1150069 () Bool)

(assert (=> b!1249601 m!1150069))

(declare-fun m!1150071 () Bool)

(assert (=> b!1249601 m!1150071))

(declare-fun m!1150073 () Bool)

(assert (=> b!1249604 m!1150073))

(check-sat b_and!44397 (not mapNonEmpty!49084) (not b!1249604) (not b!1249605) (not start!104838) tp_is_empty!31549 (not b!1249601) (not b_next!26647))
(check-sat b_and!44397 (not b_next!26647))
