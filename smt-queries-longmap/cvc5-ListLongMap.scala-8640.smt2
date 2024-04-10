; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105142 () Bool)

(assert start!105142)

(declare-fun b_free!26875 () Bool)

(declare-fun b_next!26875 () Bool)

(assert (=> start!105142 (= b_free!26875 (not b_next!26875))))

(declare-fun tp!94126 () Bool)

(declare-fun b_and!44679 () Bool)

(assert (=> start!105142 (= tp!94126 b_and!44679)))

(declare-fun mapIsEmpty!49438 () Bool)

(declare-fun mapRes!49438 () Bool)

(assert (=> mapIsEmpty!49438 mapRes!49438))

(declare-fun b!1252968 () Bool)

(declare-fun e!711740 () Bool)

(declare-fun e!711736 () Bool)

(assert (=> b!1252968 (= e!711740 (not e!711736))))

(declare-fun res!835565 () Bool)

(assert (=> b!1252968 (=> res!835565 e!711736)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252968 (= res!835565 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47735 0))(
  ( (V!47736 (val!15951 Int)) )
))
(declare-datatypes ((tuple2!20580 0))(
  ( (tuple2!20581 (_1!10301 (_ BitVec 64)) (_2!10301 V!47735)) )
))
(declare-datatypes ((List!27812 0))(
  ( (Nil!27809) (Cons!27808 (h!29017 tuple2!20580) (t!41291 List!27812)) )
))
(declare-datatypes ((ListLongMap!18453 0))(
  ( (ListLongMap!18454 (toList!9242 List!27812)) )
))
(declare-fun lt!565597 () ListLongMap!18453)

(declare-fun lt!565595 () ListLongMap!18453)

(assert (=> b!1252968 (= lt!565597 lt!565595)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81214 0))(
  ( (array!81215 (arr!39170 (Array (_ BitVec 32) (_ BitVec 64))) (size!39706 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81214)

(declare-datatypes ((ValueCell!15125 0))(
  ( (ValueCellFull!15125 (v!18649 V!47735)) (EmptyCell!15125) )
))
(declare-datatypes ((array!81216 0))(
  ( (array!81217 (arr!39171 (Array (_ BitVec 32) ValueCell!15125)) (size!39707 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81216)

(declare-fun minValueBefore!43 () V!47735)

(declare-fun minValueAfter!43 () V!47735)

(declare-datatypes ((Unit!41669 0))(
  ( (Unit!41670) )
))
(declare-fun lt!565596 () Unit!41669)

(declare-fun zeroValue!871 () V!47735)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1000 (array!81214 array!81216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 V!47735 V!47735 (_ BitVec 32) Int) Unit!41669)

(assert (=> b!1252968 (= lt!565596 (lemmaNoChangeToArrayThenSameMapNoExtras!1000 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5636 (array!81214 array!81216 (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 (_ BitVec 32) Int) ListLongMap!18453)

(assert (=> b!1252968 (= lt!565595 (getCurrentListMapNoExtraKeys!5636 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252968 (= lt!565597 (getCurrentListMapNoExtraKeys!5636 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49438 () Bool)

(declare-fun tp!94127 () Bool)

(declare-fun e!711739 () Bool)

(assert (=> mapNonEmpty!49438 (= mapRes!49438 (and tp!94127 e!711739))))

(declare-fun mapValue!49438 () ValueCell!15125)

(declare-fun mapRest!49438 () (Array (_ BitVec 32) ValueCell!15125))

(declare-fun mapKey!49438 () (_ BitVec 32))

(assert (=> mapNonEmpty!49438 (= (arr!39171 _values!914) (store mapRest!49438 mapKey!49438 mapValue!49438))))

(declare-fun b!1252969 () Bool)

(declare-fun tp_is_empty!31777 () Bool)

(assert (=> b!1252969 (= e!711739 tp_is_empty!31777)))

(declare-fun b!1252970 () Bool)

(declare-fun res!835563 () Bool)

(assert (=> b!1252970 (=> (not res!835563) (not e!711740))))

(assert (=> b!1252970 (= res!835563 (and (= (size!39707 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39706 _keys!1118) (size!39707 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252971 () Bool)

(declare-fun res!835564 () Bool)

(assert (=> b!1252971 (=> (not res!835564) (not e!711740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81214 (_ BitVec 32)) Bool)

(assert (=> b!1252971 (= res!835564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!835566 () Bool)

(assert (=> start!105142 (=> (not res!835566) (not e!711740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105142 (= res!835566 (validMask!0 mask!1466))))

(assert (=> start!105142 e!711740))

(assert (=> start!105142 true))

(assert (=> start!105142 tp!94126))

(assert (=> start!105142 tp_is_empty!31777))

(declare-fun array_inv!29869 (array!81214) Bool)

(assert (=> start!105142 (array_inv!29869 _keys!1118)))

(declare-fun e!711735 () Bool)

(declare-fun array_inv!29870 (array!81216) Bool)

(assert (=> start!105142 (and (array_inv!29870 _values!914) e!711735)))

(declare-fun b!1252972 () Bool)

(declare-fun res!835567 () Bool)

(assert (=> b!1252972 (=> (not res!835567) (not e!711740))))

(declare-datatypes ((List!27813 0))(
  ( (Nil!27810) (Cons!27809 (h!29018 (_ BitVec 64)) (t!41292 List!27813)) )
))
(declare-fun arrayNoDuplicates!0 (array!81214 (_ BitVec 32) List!27813) Bool)

(assert (=> b!1252972 (= res!835567 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27810))))

(declare-fun b!1252973 () Bool)

(declare-fun e!711738 () Bool)

(assert (=> b!1252973 (= e!711735 (and e!711738 mapRes!49438))))

(declare-fun condMapEmpty!49438 () Bool)

(declare-fun mapDefault!49438 () ValueCell!15125)

