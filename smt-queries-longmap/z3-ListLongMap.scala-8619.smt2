; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104976 () Bool)

(assert start!104976)

(declare-fun b_free!26749 () Bool)

(declare-fun b_next!26749 () Bool)

(assert (=> start!104976 (= b_free!26749 (not b_next!26749))))

(declare-fun tp!93742 () Bool)

(declare-fun b_and!44517 () Bool)

(assert (=> start!104976 (= tp!93742 b_and!44517)))

(declare-fun b!1251179 () Bool)

(declare-fun res!834534 () Bool)

(declare-fun e!710449 () Bool)

(assert (=> b!1251179 (=> (not res!834534) (not e!710449))))

(declare-datatypes ((array!80887 0))(
  ( (array!80888 (arr!39009 (Array (_ BitVec 32) (_ BitVec 64))) (size!39547 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80887)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80887 (_ BitVec 32)) Bool)

(assert (=> b!1251179 (= res!834534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251180 () Bool)

(declare-fun e!710450 () Bool)

(declare-fun e!710453 () Bool)

(assert (=> b!1251180 (= e!710450 e!710453)))

(declare-fun res!834538 () Bool)

(assert (=> b!1251180 (=> res!834538 e!710453)))

(declare-datatypes ((V!47567 0))(
  ( (V!47568 (val!15888 Int)) )
))
(declare-datatypes ((tuple2!20566 0))(
  ( (tuple2!20567 (_1!10294 (_ BitVec 64)) (_2!10294 V!47567)) )
))
(declare-datatypes ((List!27784 0))(
  ( (Nil!27781) (Cons!27780 (h!28989 tuple2!20566) (t!41250 List!27784)) )
))
(declare-datatypes ((ListLongMap!18439 0))(
  ( (ListLongMap!18440 (toList!9235 List!27784)) )
))
(declare-fun lt!564545 () ListLongMap!18439)

(declare-fun contains!7478 (ListLongMap!18439 (_ BitVec 64)) Bool)

(assert (=> b!1251180 (= res!834538 (contains!7478 lt!564545 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47567)

(declare-datatypes ((ValueCell!15062 0))(
  ( (ValueCellFull!15062 (v!18584 V!47567)) (EmptyCell!15062) )
))
(declare-datatypes ((array!80889 0))(
  ( (array!80890 (arr!39010 (Array (_ BitVec 32) ValueCell!15062)) (size!39548 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80889)

(declare-fun minValueBefore!43 () V!47567)

(declare-fun getCurrentListMap!4404 (array!80887 array!80889 (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 (_ BitVec 32) Int) ListLongMap!18439)

(assert (=> b!1251180 (= lt!564545 (getCurrentListMap!4404 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49243 () Bool)

(declare-fun mapRes!49243 () Bool)

(assert (=> mapIsEmpty!49243 mapRes!49243))

(declare-fun b!1251181 () Bool)

(assert (=> b!1251181 (= e!710449 (not e!710450))))

(declare-fun res!834535 () Bool)

(assert (=> b!1251181 (=> res!834535 e!710450)))

(assert (=> b!1251181 (= res!834535 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564544 () ListLongMap!18439)

(declare-fun lt!564543 () ListLongMap!18439)

(assert (=> b!1251181 (= lt!564544 lt!564543)))

(declare-datatypes ((Unit!41436 0))(
  ( (Unit!41437) )
))
(declare-fun lt!564547 () Unit!41436)

(declare-fun minValueAfter!43 () V!47567)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!964 (array!80887 array!80889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 V!47567 V!47567 (_ BitVec 32) Int) Unit!41436)

(assert (=> b!1251181 (= lt!564547 (lemmaNoChangeToArrayThenSameMapNoExtras!964 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5642 (array!80887 array!80889 (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 (_ BitVec 32) Int) ListLongMap!18439)

(assert (=> b!1251181 (= lt!564543 (getCurrentListMapNoExtraKeys!5642 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251181 (= lt!564544 (getCurrentListMapNoExtraKeys!5642 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251182 () Bool)

(declare-fun e!710448 () Bool)

(declare-fun e!710452 () Bool)

(assert (=> b!1251182 (= e!710448 (and e!710452 mapRes!49243))))

(declare-fun condMapEmpty!49243 () Bool)

(declare-fun mapDefault!49243 () ValueCell!15062)

(assert (=> b!1251182 (= condMapEmpty!49243 (= (arr!39010 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15062)) mapDefault!49243)))))

(declare-fun res!834537 () Bool)

(assert (=> start!104976 (=> (not res!834537) (not e!710449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104976 (= res!834537 (validMask!0 mask!1466))))

(assert (=> start!104976 e!710449))

(assert (=> start!104976 true))

(assert (=> start!104976 tp!93742))

(declare-fun tp_is_empty!31651 () Bool)

(assert (=> start!104976 tp_is_empty!31651))

(declare-fun array_inv!29885 (array!80887) Bool)

(assert (=> start!104976 (array_inv!29885 _keys!1118)))

(declare-fun array_inv!29886 (array!80889) Bool)

(assert (=> start!104976 (and (array_inv!29886 _values!914) e!710448)))

(declare-fun b!1251183 () Bool)

(declare-fun res!834533 () Bool)

(assert (=> b!1251183 (=> (not res!834533) (not e!710449))))

(assert (=> b!1251183 (= res!834533 (and (= (size!39548 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39547 _keys!1118) (size!39548 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251184 () Bool)

(declare-fun e!710451 () Bool)

(assert (=> b!1251184 (= e!710451 tp_is_empty!31651)))

(declare-fun mapNonEmpty!49243 () Bool)

(declare-fun tp!93743 () Bool)

(assert (=> mapNonEmpty!49243 (= mapRes!49243 (and tp!93743 e!710451))))

(declare-fun mapValue!49243 () ValueCell!15062)

(declare-fun mapRest!49243 () (Array (_ BitVec 32) ValueCell!15062))

(declare-fun mapKey!49243 () (_ BitVec 32))

(assert (=> mapNonEmpty!49243 (= (arr!39010 _values!914) (store mapRest!49243 mapKey!49243 mapValue!49243))))

(declare-fun b!1251185 () Bool)

(assert (=> b!1251185 (= e!710453 true)))

(declare-fun -!1980 (ListLongMap!18439 (_ BitVec 64)) ListLongMap!18439)

(assert (=> b!1251185 (= (-!1980 lt!564545 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564545)))

(declare-fun lt!564546 () Unit!41436)

(declare-fun removeNotPresentStillSame!108 (ListLongMap!18439 (_ BitVec 64)) Unit!41436)

(assert (=> b!1251185 (= lt!564546 (removeNotPresentStillSame!108 lt!564545 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251186 () Bool)

(declare-fun res!834536 () Bool)

(assert (=> b!1251186 (=> (not res!834536) (not e!710449))))

(declare-datatypes ((List!27785 0))(
  ( (Nil!27782) (Cons!27781 (h!28990 (_ BitVec 64)) (t!41251 List!27785)) )
))
(declare-fun arrayNoDuplicates!0 (array!80887 (_ BitVec 32) List!27785) Bool)

(assert (=> b!1251186 (= res!834536 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27782))))

(declare-fun b!1251187 () Bool)

(assert (=> b!1251187 (= e!710452 tp_is_empty!31651)))

(assert (= (and start!104976 res!834537) b!1251183))

(assert (= (and b!1251183 res!834533) b!1251179))

(assert (= (and b!1251179 res!834534) b!1251186))

(assert (= (and b!1251186 res!834536) b!1251181))

(assert (= (and b!1251181 (not res!834535)) b!1251180))

(assert (= (and b!1251180 (not res!834538)) b!1251185))

(assert (= (and b!1251182 condMapEmpty!49243) mapIsEmpty!49243))

(assert (= (and b!1251182 (not condMapEmpty!49243)) mapNonEmpty!49243))

(get-info :version)

(assert (= (and mapNonEmpty!49243 ((_ is ValueCellFull!15062) mapValue!49243)) b!1251184))

(assert (= (and b!1251182 ((_ is ValueCellFull!15062) mapDefault!49243)) b!1251187))

(assert (= start!104976 b!1251182))

(declare-fun m!1151515 () Bool)

(assert (=> b!1251181 m!1151515))

(declare-fun m!1151517 () Bool)

(assert (=> b!1251181 m!1151517))

(declare-fun m!1151519 () Bool)

(assert (=> b!1251181 m!1151519))

(declare-fun m!1151521 () Bool)

(assert (=> b!1251185 m!1151521))

(declare-fun m!1151523 () Bool)

(assert (=> b!1251185 m!1151523))

(declare-fun m!1151525 () Bool)

(assert (=> mapNonEmpty!49243 m!1151525))

(declare-fun m!1151527 () Bool)

(assert (=> b!1251180 m!1151527))

(declare-fun m!1151529 () Bool)

(assert (=> b!1251180 m!1151529))

(declare-fun m!1151531 () Bool)

(assert (=> b!1251186 m!1151531))

(declare-fun m!1151533 () Bool)

(assert (=> start!104976 m!1151533))

(declare-fun m!1151535 () Bool)

(assert (=> start!104976 m!1151535))

(declare-fun m!1151537 () Bool)

(assert (=> start!104976 m!1151537))

(declare-fun m!1151539 () Bool)

(assert (=> b!1251179 m!1151539))

(check-sat b_and!44517 (not mapNonEmpty!49243) tp_is_empty!31651 (not b!1251185) (not b!1251180) (not start!104976) (not b!1251179) (not b!1251181) (not b_next!26749) (not b!1251186))
(check-sat b_and!44517 (not b_next!26749))
