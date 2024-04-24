; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105662 () Bool)

(assert start!105662)

(declare-fun b_free!27097 () Bool)

(declare-fun b_next!27097 () Bool)

(assert (=> start!105662 (= b_free!27097 (not b_next!27097))))

(declare-fun tp!94804 () Bool)

(declare-fun b_and!44945 () Bool)

(assert (=> start!105662 (= tp!94804 b_and!44945)))

(declare-fun mapNonEmpty!49783 () Bool)

(declare-fun mapRes!49783 () Bool)

(declare-fun tp!94805 () Bool)

(declare-fun e!714962 () Bool)

(assert (=> mapNonEmpty!49783 (= mapRes!49783 (and tp!94805 e!714962))))

(declare-datatypes ((V!48031 0))(
  ( (V!48032 (val!16062 Int)) )
))
(declare-datatypes ((ValueCell!15236 0))(
  ( (ValueCellFull!15236 (v!18758 V!48031)) (EmptyCell!15236) )
))
(declare-fun mapRest!49783 () (Array (_ BitVec 32) ValueCell!15236))

(declare-fun mapValue!49783 () ValueCell!15236)

(declare-fun mapKey!49783 () (_ BitVec 32))

(declare-datatypes ((array!81687 0))(
  ( (array!81688 (arr!39398 (Array (_ BitVec 32) ValueCell!15236)) (size!39935 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81687)

(assert (=> mapNonEmpty!49783 (= (arr!39398 _values!914) (store mapRest!49783 mapKey!49783 mapValue!49783))))

(declare-fun b!1257531 () Bool)

(declare-fun res!837994 () Bool)

(declare-fun e!714964 () Bool)

(assert (=> b!1257531 (=> (not res!837994) (not e!714964))))

(declare-datatypes ((array!81689 0))(
  ( (array!81690 (arr!39399 (Array (_ BitVec 32) (_ BitVec 64))) (size!39936 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81689)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81689 (_ BitVec 32)) Bool)

(assert (=> b!1257531 (= res!837994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257532 () Bool)

(declare-fun e!714960 () Bool)

(declare-fun e!714965 () Bool)

(assert (=> b!1257532 (= e!714960 e!714965)))

(declare-fun res!837999 () Bool)

(assert (=> b!1257532 (=> res!837999 e!714965)))

(declare-datatypes ((tuple2!20770 0))(
  ( (tuple2!20771 (_1!10396 (_ BitVec 64)) (_2!10396 V!48031)) )
))
(declare-datatypes ((List!28001 0))(
  ( (Nil!27998) (Cons!27997 (h!29215 tuple2!20770) (t!41480 List!28001)) )
))
(declare-datatypes ((ListLongMap!18651 0))(
  ( (ListLongMap!18652 (toList!9341 List!28001)) )
))
(declare-fun lt!568485 () ListLongMap!18651)

(declare-fun contains!7572 (ListLongMap!18651 (_ BitVec 64)) Bool)

(assert (=> b!1257532 (= res!837999 (contains!7572 lt!568485 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueBefore!43 () V!48031)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48031)

(declare-fun getCurrentListMap!4550 (array!81689 array!81687 (_ BitVec 32) (_ BitVec 32) V!48031 V!48031 (_ BitVec 32) Int) ListLongMap!18651)

(assert (=> b!1257532 (= lt!568485 (getCurrentListMap!4550 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837996 () Bool)

(assert (=> start!105662 (=> (not res!837996) (not e!714964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105662 (= res!837996 (validMask!0 mask!1466))))

(assert (=> start!105662 e!714964))

(assert (=> start!105662 true))

(assert (=> start!105662 tp!94804))

(declare-fun tp_is_empty!31999 () Bool)

(assert (=> start!105662 tp_is_empty!31999))

(declare-fun array_inv!30149 (array!81689) Bool)

(assert (=> start!105662 (array_inv!30149 _keys!1118)))

(declare-fun e!714961 () Bool)

(declare-fun array_inv!30150 (array!81687) Bool)

(assert (=> start!105662 (and (array_inv!30150 _values!914) e!714961)))

(declare-fun b!1257533 () Bool)

(declare-fun e!714963 () Bool)

(assert (=> b!1257533 (= e!714963 tp_is_empty!31999)))

(declare-fun b!1257534 () Bool)

(declare-fun res!837998 () Bool)

(assert (=> b!1257534 (=> (not res!837998) (not e!714964))))

(declare-datatypes ((List!28002 0))(
  ( (Nil!27999) (Cons!27998 (h!29216 (_ BitVec 64)) (t!41481 List!28002)) )
))
(declare-fun arrayNoDuplicates!0 (array!81689 (_ BitVec 32) List!28002) Bool)

(assert (=> b!1257534 (= res!837998 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27999))))

(declare-fun b!1257535 () Bool)

(assert (=> b!1257535 (= e!714965 true)))

(declare-fun -!2057 (ListLongMap!18651 (_ BitVec 64)) ListLongMap!18651)

(assert (=> b!1257535 (= (-!2057 lt!568485 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568485)))

(declare-datatypes ((Unit!41823 0))(
  ( (Unit!41824) )
))
(declare-fun lt!568486 () Unit!41823)

(declare-fun removeNotPresentStillSame!129 (ListLongMap!18651 (_ BitVec 64)) Unit!41823)

(assert (=> b!1257535 (= lt!568486 (removeNotPresentStillSame!129 lt!568485 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257536 () Bool)

(declare-fun res!837995 () Bool)

(assert (=> b!1257536 (=> (not res!837995) (not e!714964))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257536 (= res!837995 (and (= (size!39935 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39936 _keys!1118) (size!39935 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257537 () Bool)

(assert (=> b!1257537 (= e!714964 (not e!714960))))

(declare-fun res!837997 () Bool)

(assert (=> b!1257537 (=> res!837997 e!714960)))

(assert (=> b!1257537 (= res!837997 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568484 () ListLongMap!18651)

(declare-fun lt!568483 () ListLongMap!18651)

(assert (=> b!1257537 (= lt!568484 lt!568483)))

(declare-fun minValueAfter!43 () V!48031)

(declare-fun lt!568487 () Unit!41823)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1075 (array!81689 array!81687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48031 V!48031 V!48031 V!48031 (_ BitVec 32) Int) Unit!41823)

(assert (=> b!1257537 (= lt!568487 (lemmaNoChangeToArrayThenSameMapNoExtras!1075 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5761 (array!81689 array!81687 (_ BitVec 32) (_ BitVec 32) V!48031 V!48031 (_ BitVec 32) Int) ListLongMap!18651)

(assert (=> b!1257537 (= lt!568483 (getCurrentListMapNoExtraKeys!5761 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257537 (= lt!568484 (getCurrentListMapNoExtraKeys!5761 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257538 () Bool)

(assert (=> b!1257538 (= e!714961 (and e!714963 mapRes!49783))))

(declare-fun condMapEmpty!49783 () Bool)

(declare-fun mapDefault!49783 () ValueCell!15236)

(assert (=> b!1257538 (= condMapEmpty!49783 (= (arr!39398 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15236)) mapDefault!49783)))))

(declare-fun b!1257539 () Bool)

(assert (=> b!1257539 (= e!714962 tp_is_empty!31999)))

(declare-fun mapIsEmpty!49783 () Bool)

(assert (=> mapIsEmpty!49783 mapRes!49783))

(assert (= (and start!105662 res!837996) b!1257536))

(assert (= (and b!1257536 res!837995) b!1257531))

(assert (= (and b!1257531 res!837994) b!1257534))

(assert (= (and b!1257534 res!837998) b!1257537))

(assert (= (and b!1257537 (not res!837997)) b!1257532))

(assert (= (and b!1257532 (not res!837999)) b!1257535))

(assert (= (and b!1257538 condMapEmpty!49783) mapIsEmpty!49783))

(assert (= (and b!1257538 (not condMapEmpty!49783)) mapNonEmpty!49783))

(get-info :version)

(assert (= (and mapNonEmpty!49783 ((_ is ValueCellFull!15236) mapValue!49783)) b!1257539))

(assert (= (and b!1257538 ((_ is ValueCellFull!15236) mapDefault!49783)) b!1257533))

(assert (= start!105662 b!1257538))

(declare-fun m!1158519 () Bool)

(assert (=> b!1257532 m!1158519))

(declare-fun m!1158521 () Bool)

(assert (=> b!1257532 m!1158521))

(declare-fun m!1158523 () Bool)

(assert (=> b!1257537 m!1158523))

(declare-fun m!1158525 () Bool)

(assert (=> b!1257537 m!1158525))

(declare-fun m!1158527 () Bool)

(assert (=> b!1257537 m!1158527))

(declare-fun m!1158529 () Bool)

(assert (=> start!105662 m!1158529))

(declare-fun m!1158531 () Bool)

(assert (=> start!105662 m!1158531))

(declare-fun m!1158533 () Bool)

(assert (=> start!105662 m!1158533))

(declare-fun m!1158535 () Bool)

(assert (=> b!1257535 m!1158535))

(declare-fun m!1158537 () Bool)

(assert (=> b!1257535 m!1158537))

(declare-fun m!1158539 () Bool)

(assert (=> b!1257531 m!1158539))

(declare-fun m!1158541 () Bool)

(assert (=> mapNonEmpty!49783 m!1158541))

(declare-fun m!1158543 () Bool)

(assert (=> b!1257534 m!1158543))

(check-sat (not mapNonEmpty!49783) (not b!1257532) (not start!105662) (not b!1257531) b_and!44945 (not b!1257535) (not b!1257537) (not b_next!27097) (not b!1257534) tp_is_empty!31999)
(check-sat b_and!44945 (not b_next!27097))
