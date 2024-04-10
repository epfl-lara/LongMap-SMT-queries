; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105398 () Bool)

(assert start!105398)

(declare-fun b_free!27057 () Bool)

(declare-fun b_next!27057 () Bool)

(assert (=> start!105398 (= b_free!27057 (not b_next!27057))))

(declare-fun tp!94684 () Bool)

(declare-fun b_and!44903 () Bool)

(assert (=> start!105398 (= tp!94684 b_and!44903)))

(declare-fun res!837117 () Bool)

(declare-fun e!713693 () Bool)

(assert (=> start!105398 (=> (not res!837117) (not e!713693))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105398 (= res!837117 (validMask!0 mask!1466))))

(assert (=> start!105398 e!713693))

(assert (=> start!105398 true))

(assert (=> start!105398 tp!94684))

(declare-fun tp_is_empty!31959 () Bool)

(assert (=> start!105398 tp_is_empty!31959))

(declare-datatypes ((array!81560 0))(
  ( (array!81561 (arr!39339 (Array (_ BitVec 32) (_ BitVec 64))) (size!39875 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81560)

(declare-fun array_inv!29975 (array!81560) Bool)

(assert (=> start!105398 (array_inv!29975 _keys!1118)))

(declare-datatypes ((V!47977 0))(
  ( (V!47978 (val!16042 Int)) )
))
(declare-datatypes ((ValueCell!15216 0))(
  ( (ValueCellFull!15216 (v!18742 V!47977)) (EmptyCell!15216) )
))
(declare-datatypes ((array!81562 0))(
  ( (array!81563 (arr!39340 (Array (_ BitVec 32) ValueCell!15216)) (size!39876 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81562)

(declare-fun e!713696 () Bool)

(declare-fun array_inv!29976 (array!81562) Bool)

(assert (=> start!105398 (and (array_inv!29976 _values!914) e!713696)))

(declare-fun b!1255686 () Bool)

(declare-fun res!837114 () Bool)

(assert (=> b!1255686 (=> (not res!837114) (not e!713693))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255686 (= res!837114 (and (= (size!39876 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39875 _keys!1118) (size!39876 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255687 () Bool)

(declare-fun e!713695 () Bool)

(assert (=> b!1255687 (= e!713695 tp_is_empty!31959)))

(declare-fun b!1255688 () Bool)

(declare-fun e!713697 () Bool)

(declare-fun mapRes!49723 () Bool)

(assert (=> b!1255688 (= e!713696 (and e!713697 mapRes!49723))))

(declare-fun condMapEmpty!49723 () Bool)

(declare-fun mapDefault!49723 () ValueCell!15216)

(assert (=> b!1255688 (= condMapEmpty!49723 (= (arr!39340 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15216)) mapDefault!49723)))))

(declare-fun b!1255689 () Bool)

(declare-fun e!713698 () Bool)

(declare-fun e!713694 () Bool)

(assert (=> b!1255689 (= e!713698 e!713694)))

(declare-fun res!837118 () Bool)

(assert (=> b!1255689 (=> res!837118 e!713694)))

(declare-datatypes ((tuple2!20714 0))(
  ( (tuple2!20715 (_1!10368 (_ BitVec 64)) (_2!10368 V!47977)) )
))
(declare-datatypes ((List!27935 0))(
  ( (Nil!27932) (Cons!27931 (h!29140 tuple2!20714) (t!41422 List!27935)) )
))
(declare-datatypes ((ListLongMap!18587 0))(
  ( (ListLongMap!18588 (toList!9309 List!27935)) )
))
(declare-fun lt!567703 () ListLongMap!18587)

(declare-fun contains!7529 (ListLongMap!18587 (_ BitVec 64)) Bool)

(assert (=> b!1255689 (= res!837118 (contains!7529 lt!567703 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47977)

(declare-fun minValueBefore!43 () V!47977)

(declare-fun getCurrentListMap!4535 (array!81560 array!81562 (_ BitVec 32) (_ BitVec 32) V!47977 V!47977 (_ BitVec 32) Int) ListLongMap!18587)

(assert (=> b!1255689 (= lt!567703 (getCurrentListMap!4535 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49723 () Bool)

(assert (=> mapIsEmpty!49723 mapRes!49723))

(declare-fun b!1255690 () Bool)

(assert (=> b!1255690 (= e!713697 tp_is_empty!31959)))

(declare-fun b!1255691 () Bool)

(declare-fun res!837119 () Bool)

(assert (=> b!1255691 (=> (not res!837119) (not e!713693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81560 (_ BitVec 32)) Bool)

(assert (=> b!1255691 (= res!837119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255692 () Bool)

(assert (=> b!1255692 (= e!713694 true)))

(declare-fun -!2063 (ListLongMap!18587 (_ BitVec 64)) ListLongMap!18587)

(assert (=> b!1255692 (= (-!2063 lt!567703 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567703)))

(declare-datatypes ((Unit!41804 0))(
  ( (Unit!41805) )
))
(declare-fun lt!567700 () Unit!41804)

(declare-fun removeNotPresentStillSame!116 (ListLongMap!18587 (_ BitVec 64)) Unit!41804)

(assert (=> b!1255692 (= lt!567700 (removeNotPresentStillSame!116 lt!567703 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255693 () Bool)

(assert (=> b!1255693 (= e!713693 (not e!713698))))

(declare-fun res!837115 () Bool)

(assert (=> b!1255693 (=> res!837115 e!713698)))

(assert (=> b!1255693 (= res!837115 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567701 () ListLongMap!18587)

(declare-fun lt!567702 () ListLongMap!18587)

(assert (=> b!1255693 (= lt!567701 lt!567702)))

(declare-fun minValueAfter!43 () V!47977)

(declare-fun lt!567699 () Unit!41804)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1058 (array!81560 array!81562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47977 V!47977 V!47977 V!47977 (_ BitVec 32) Int) Unit!41804)

(assert (=> b!1255693 (= lt!567699 (lemmaNoChangeToArrayThenSameMapNoExtras!1058 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5694 (array!81560 array!81562 (_ BitVec 32) (_ BitVec 32) V!47977 V!47977 (_ BitVec 32) Int) ListLongMap!18587)

(assert (=> b!1255693 (= lt!567702 (getCurrentListMapNoExtraKeys!5694 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255693 (= lt!567701 (getCurrentListMapNoExtraKeys!5694 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49723 () Bool)

(declare-fun tp!94685 () Bool)

(assert (=> mapNonEmpty!49723 (= mapRes!49723 (and tp!94685 e!713695))))

(declare-fun mapRest!49723 () (Array (_ BitVec 32) ValueCell!15216))

(declare-fun mapValue!49723 () ValueCell!15216)

(declare-fun mapKey!49723 () (_ BitVec 32))

(assert (=> mapNonEmpty!49723 (= (arr!39340 _values!914) (store mapRest!49723 mapKey!49723 mapValue!49723))))

(declare-fun b!1255694 () Bool)

(declare-fun res!837116 () Bool)

(assert (=> b!1255694 (=> (not res!837116) (not e!713693))))

(declare-datatypes ((List!27936 0))(
  ( (Nil!27933) (Cons!27932 (h!29141 (_ BitVec 64)) (t!41423 List!27936)) )
))
(declare-fun arrayNoDuplicates!0 (array!81560 (_ BitVec 32) List!27936) Bool)

(assert (=> b!1255694 (= res!837116 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27933))))

(assert (= (and start!105398 res!837117) b!1255686))

(assert (= (and b!1255686 res!837114) b!1255691))

(assert (= (and b!1255691 res!837119) b!1255694))

(assert (= (and b!1255694 res!837116) b!1255693))

(assert (= (and b!1255693 (not res!837115)) b!1255689))

(assert (= (and b!1255689 (not res!837118)) b!1255692))

(assert (= (and b!1255688 condMapEmpty!49723) mapIsEmpty!49723))

(assert (= (and b!1255688 (not condMapEmpty!49723)) mapNonEmpty!49723))

(get-info :version)

(assert (= (and mapNonEmpty!49723 ((_ is ValueCellFull!15216) mapValue!49723)) b!1255687))

(assert (= (and b!1255688 ((_ is ValueCellFull!15216) mapDefault!49723)) b!1255690))

(assert (= start!105398 b!1255688))

(declare-fun m!1156387 () Bool)

(assert (=> b!1255693 m!1156387))

(declare-fun m!1156389 () Bool)

(assert (=> b!1255693 m!1156389))

(declare-fun m!1156391 () Bool)

(assert (=> b!1255693 m!1156391))

(declare-fun m!1156393 () Bool)

(assert (=> b!1255692 m!1156393))

(declare-fun m!1156395 () Bool)

(assert (=> b!1255692 m!1156395))

(declare-fun m!1156397 () Bool)

(assert (=> start!105398 m!1156397))

(declare-fun m!1156399 () Bool)

(assert (=> start!105398 m!1156399))

(declare-fun m!1156401 () Bool)

(assert (=> start!105398 m!1156401))

(declare-fun m!1156403 () Bool)

(assert (=> mapNonEmpty!49723 m!1156403))

(declare-fun m!1156405 () Bool)

(assert (=> b!1255691 m!1156405))

(declare-fun m!1156407 () Bool)

(assert (=> b!1255694 m!1156407))

(declare-fun m!1156409 () Bool)

(assert (=> b!1255689 m!1156409))

(declare-fun m!1156411 () Bool)

(assert (=> b!1255689 m!1156411))

(check-sat (not b!1255693) tp_is_empty!31959 (not mapNonEmpty!49723) (not start!105398) b_and!44903 (not b!1255692) (not b!1255694) (not b!1255691) (not b_next!27057) (not b!1255689))
(check-sat b_and!44903 (not b_next!27057))
