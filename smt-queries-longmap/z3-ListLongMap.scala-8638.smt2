; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105126 () Bool)

(assert start!105126)

(declare-fun b_free!26863 () Bool)

(declare-fun b_next!26863 () Bool)

(assert (=> start!105126 (= b_free!26863 (not b_next!26863))))

(declare-fun tp!94090 () Bool)

(declare-fun b_and!44649 () Bool)

(assert (=> start!105126 (= tp!94090 b_and!44649)))

(declare-fun mapIsEmpty!49420 () Bool)

(declare-fun mapRes!49420 () Bool)

(assert (=> mapIsEmpty!49420 mapRes!49420))

(declare-fun mapNonEmpty!49420 () Bool)

(declare-fun tp!94091 () Bool)

(declare-fun e!711584 () Bool)

(assert (=> mapNonEmpty!49420 (= mapRes!49420 (and tp!94091 e!711584))))

(declare-datatypes ((V!47719 0))(
  ( (V!47720 (val!15945 Int)) )
))
(declare-datatypes ((ValueCell!15119 0))(
  ( (ValueCellFull!15119 (v!18642 V!47719)) (EmptyCell!15119) )
))
(declare-fun mapValue!49420 () ValueCell!15119)

(declare-fun mapRest!49420 () (Array (_ BitVec 32) ValueCell!15119))

(declare-datatypes ((array!81115 0))(
  ( (array!81116 (arr!39121 (Array (_ BitVec 32) ValueCell!15119)) (size!39659 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81115)

(declare-fun mapKey!49420 () (_ BitVec 32))

(assert (=> mapNonEmpty!49420 (= (arr!39121 _values!914) (store mapRest!49420 mapKey!49420 mapValue!49420))))

(declare-fun b!1252742 () Bool)

(declare-fun res!835435 () Bool)

(declare-fun e!711586 () Bool)

(assert (=> b!1252742 (=> (not res!835435) (not e!711586))))

(declare-datatypes ((array!81117 0))(
  ( (array!81118 (arr!39122 (Array (_ BitVec 32) (_ BitVec 64))) (size!39660 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81117)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81117 (_ BitVec 32)) Bool)

(assert (=> b!1252742 (= res!835435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252743 () Bool)

(declare-fun e!711583 () Bool)

(assert (=> b!1252743 (= e!711586 (not e!711583))))

(declare-fun res!835434 () Bool)

(assert (=> b!1252743 (=> res!835434 e!711583)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252743 (= res!835434 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20660 0))(
  ( (tuple2!20661 (_1!10341 (_ BitVec 64)) (_2!10341 V!47719)) )
))
(declare-datatypes ((List!27875 0))(
  ( (Nil!27872) (Cons!27871 (h!29080 tuple2!20660) (t!41345 List!27875)) )
))
(declare-datatypes ((ListLongMap!18533 0))(
  ( (ListLongMap!18534 (toList!9282 List!27875)) )
))
(declare-fun lt!565346 () ListLongMap!18533)

(declare-fun lt!565345 () ListLongMap!18533)

(assert (=> b!1252743 (= lt!565346 lt!565345)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47719)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47719)

(declare-datatypes ((Unit!41528 0))(
  ( (Unit!41529) )
))
(declare-fun lt!565347 () Unit!41528)

(declare-fun minValueBefore!43 () V!47719)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1007 (array!81117 array!81115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47719 V!47719 V!47719 V!47719 (_ BitVec 32) Int) Unit!41528)

(assert (=> b!1252743 (= lt!565347 (lemmaNoChangeToArrayThenSameMapNoExtras!1007 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5685 (array!81117 array!81115 (_ BitVec 32) (_ BitVec 32) V!47719 V!47719 (_ BitVec 32) Int) ListLongMap!18533)

(assert (=> b!1252743 (= lt!565345 (getCurrentListMapNoExtraKeys!5685 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252743 (= lt!565346 (getCurrentListMapNoExtraKeys!5685 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252744 () Bool)

(assert (=> b!1252744 (= e!711583 true)))

(declare-fun lt!565344 () ListLongMap!18533)

(declare-fun getCurrentListMap!4421 (array!81117 array!81115 (_ BitVec 32) (_ BitVec 32) V!47719 V!47719 (_ BitVec 32) Int) ListLongMap!18533)

(assert (=> b!1252744 (= lt!565344 (getCurrentListMap!4421 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835433 () Bool)

(assert (=> start!105126 (=> (not res!835433) (not e!711586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105126 (= res!835433 (validMask!0 mask!1466))))

(assert (=> start!105126 e!711586))

(assert (=> start!105126 true))

(assert (=> start!105126 tp!94090))

(declare-fun tp_is_empty!31765 () Bool)

(assert (=> start!105126 tp_is_empty!31765))

(declare-fun array_inv!29955 (array!81117) Bool)

(assert (=> start!105126 (array_inv!29955 _keys!1118)))

(declare-fun e!711587 () Bool)

(declare-fun array_inv!29956 (array!81115) Bool)

(assert (=> start!105126 (and (array_inv!29956 _values!914) e!711587)))

(declare-fun b!1252745 () Bool)

(declare-fun e!711582 () Bool)

(assert (=> b!1252745 (= e!711582 tp_is_empty!31765)))

(declare-fun b!1252746 () Bool)

(assert (=> b!1252746 (= e!711587 (and e!711582 mapRes!49420))))

(declare-fun condMapEmpty!49420 () Bool)

(declare-fun mapDefault!49420 () ValueCell!15119)

(assert (=> b!1252746 (= condMapEmpty!49420 (= (arr!39121 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15119)) mapDefault!49420)))))

(declare-fun b!1252747 () Bool)

(declare-fun res!835436 () Bool)

(assert (=> b!1252747 (=> (not res!835436) (not e!711586))))

(declare-datatypes ((List!27876 0))(
  ( (Nil!27873) (Cons!27872 (h!29081 (_ BitVec 64)) (t!41346 List!27876)) )
))
(declare-fun arrayNoDuplicates!0 (array!81117 (_ BitVec 32) List!27876) Bool)

(assert (=> b!1252747 (= res!835436 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27873))))

(declare-fun b!1252748 () Bool)

(assert (=> b!1252748 (= e!711584 tp_is_empty!31765)))

(declare-fun b!1252749 () Bool)

(declare-fun res!835437 () Bool)

(assert (=> b!1252749 (=> (not res!835437) (not e!711586))))

(assert (=> b!1252749 (= res!835437 (and (= (size!39659 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39660 _keys!1118) (size!39659 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105126 res!835433) b!1252749))

(assert (= (and b!1252749 res!835437) b!1252742))

(assert (= (and b!1252742 res!835435) b!1252747))

(assert (= (and b!1252747 res!835436) b!1252743))

(assert (= (and b!1252743 (not res!835434)) b!1252744))

(assert (= (and b!1252746 condMapEmpty!49420) mapIsEmpty!49420))

(assert (= (and b!1252746 (not condMapEmpty!49420)) mapNonEmpty!49420))

(get-info :version)

(assert (= (and mapNonEmpty!49420 ((_ is ValueCellFull!15119) mapValue!49420)) b!1252748))

(assert (= (and b!1252746 ((_ is ValueCellFull!15119) mapDefault!49420)) b!1252745))

(assert (= start!105126 b!1252746))

(declare-fun m!1152865 () Bool)

(assert (=> b!1252744 m!1152865))

(declare-fun m!1152867 () Bool)

(assert (=> b!1252743 m!1152867))

(declare-fun m!1152869 () Bool)

(assert (=> b!1252743 m!1152869))

(declare-fun m!1152871 () Bool)

(assert (=> b!1252743 m!1152871))

(declare-fun m!1152873 () Bool)

(assert (=> b!1252742 m!1152873))

(declare-fun m!1152875 () Bool)

(assert (=> mapNonEmpty!49420 m!1152875))

(declare-fun m!1152877 () Bool)

(assert (=> start!105126 m!1152877))

(declare-fun m!1152879 () Bool)

(assert (=> start!105126 m!1152879))

(declare-fun m!1152881 () Bool)

(assert (=> start!105126 m!1152881))

(declare-fun m!1152883 () Bool)

(assert (=> b!1252747 m!1152883))

(check-sat (not b!1252747) (not mapNonEmpty!49420) (not start!105126) (not b!1252742) (not b!1252743) tp_is_empty!31765 b_and!44649 (not b_next!26863) (not b!1252744))
(check-sat b_and!44649 (not b_next!26863))
