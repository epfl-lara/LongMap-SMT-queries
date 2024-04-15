; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105498 () Bool)

(assert start!105498)

(declare-fun b_free!27139 () Bool)

(declare-fun b_next!27139 () Bool)

(assert (=> start!105498 (= b_free!27139 (not b_next!27139))))

(declare-fun tp!94934 () Bool)

(declare-fun b_and!44977 () Bool)

(assert (=> start!105498 (= tp!94934 b_and!44977)))

(declare-fun b!1256868 () Bool)

(declare-fun res!837877 () Bool)

(declare-fun e!714612 () Bool)

(assert (=> b!1256868 (=> (not res!837877) (not e!714612))))

(declare-datatypes ((array!81647 0))(
  ( (array!81648 (arr!39382 (Array (_ BitVec 32) (_ BitVec 64))) (size!39920 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81647)

(declare-datatypes ((List!28070 0))(
  ( (Nil!28067) (Cons!28066 (h!29275 (_ BitVec 64)) (t!41550 List!28070)) )
))
(declare-fun arrayNoDuplicates!0 (array!81647 (_ BitVec 32) List!28070) Bool)

(assert (=> b!1256868 (= res!837877 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28067))))

(declare-fun res!837873 () Bool)

(assert (=> start!105498 (=> (not res!837873) (not e!714612))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105498 (= res!837873 (validMask!0 mask!1466))))

(assert (=> start!105498 e!714612))

(assert (=> start!105498 true))

(assert (=> start!105498 tp!94934))

(declare-fun tp_is_empty!32041 () Bool)

(assert (=> start!105498 tp_is_empty!32041))

(declare-fun array_inv!30135 (array!81647) Bool)

(assert (=> start!105498 (array_inv!30135 _keys!1118)))

(declare-datatypes ((V!48087 0))(
  ( (V!48088 (val!16083 Int)) )
))
(declare-datatypes ((ValueCell!15257 0))(
  ( (ValueCellFull!15257 (v!18783 V!48087)) (EmptyCell!15257) )
))
(declare-datatypes ((array!81649 0))(
  ( (array!81650 (arr!39383 (Array (_ BitVec 32) ValueCell!15257)) (size!39921 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81649)

(declare-fun e!714615 () Bool)

(declare-fun array_inv!30136 (array!81649) Bool)

(assert (=> start!105498 (and (array_inv!30136 _values!914) e!714615)))

(declare-fun b!1256869 () Bool)

(declare-fun e!714613 () Bool)

(assert (=> b!1256869 (= e!714613 tp_is_empty!32041)))

(declare-fun b!1256870 () Bool)

(declare-fun e!714611 () Bool)

(assert (=> b!1256870 (= e!714612 (not e!714611))))

(declare-fun res!837878 () Bool)

(assert (=> b!1256870 (=> res!837878 e!714611)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256870 (= res!837878 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20862 0))(
  ( (tuple2!20863 (_1!10442 (_ BitVec 64)) (_2!10442 V!48087)) )
))
(declare-datatypes ((List!28071 0))(
  ( (Nil!28068) (Cons!28067 (h!29276 tuple2!20862) (t!41551 List!28071)) )
))
(declare-datatypes ((ListLongMap!18735 0))(
  ( (ListLongMap!18736 (toList!9383 List!28071)) )
))
(declare-fun lt!568259 () ListLongMap!18735)

(declare-fun lt!568261 () ListLongMap!18735)

(assert (=> b!1256870 (= lt!568259 lt!568261)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48087)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48087)

(declare-fun minValueBefore!43 () V!48087)

(declare-datatypes ((Unit!41723 0))(
  ( (Unit!41724) )
))
(declare-fun lt!568263 () Unit!41723)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1090 (array!81647 array!81649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48087 V!48087 V!48087 V!48087 (_ BitVec 32) Int) Unit!41723)

(assert (=> b!1256870 (= lt!568263 (lemmaNoChangeToArrayThenSameMapNoExtras!1090 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5768 (array!81647 array!81649 (_ BitVec 32) (_ BitVec 32) V!48087 V!48087 (_ BitVec 32) Int) ListLongMap!18735)

(assert (=> b!1256870 (= lt!568261 (getCurrentListMapNoExtraKeys!5768 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256870 (= lt!568259 (getCurrentListMapNoExtraKeys!5768 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256871 () Bool)

(declare-fun res!837874 () Bool)

(assert (=> b!1256871 (=> (not res!837874) (not e!714612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81647 (_ BitVec 32)) Bool)

(assert (=> b!1256871 (= res!837874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256872 () Bool)

(declare-fun e!714614 () Bool)

(assert (=> b!1256872 (= e!714614 tp_is_empty!32041)))

(declare-fun b!1256873 () Bool)

(declare-fun e!714609 () Bool)

(assert (=> b!1256873 (= e!714611 e!714609)))

(declare-fun res!837875 () Bool)

(assert (=> b!1256873 (=> res!837875 e!714609)))

(declare-fun lt!568260 () ListLongMap!18735)

(declare-fun contains!7534 (ListLongMap!18735 (_ BitVec 64)) Bool)

(assert (=> b!1256873 (= res!837875 (contains!7534 lt!568260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4493 (array!81647 array!81649 (_ BitVec 32) (_ BitVec 32) V!48087 V!48087 (_ BitVec 32) Int) ListLongMap!18735)

(assert (=> b!1256873 (= lt!568260 (getCurrentListMap!4493 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49849 () Bool)

(declare-fun mapRes!49849 () Bool)

(assert (=> mapIsEmpty!49849 mapRes!49849))

(declare-fun mapNonEmpty!49849 () Bool)

(declare-fun tp!94933 () Bool)

(assert (=> mapNonEmpty!49849 (= mapRes!49849 (and tp!94933 e!714613))))

(declare-fun mapValue!49849 () ValueCell!15257)

(declare-fun mapRest!49849 () (Array (_ BitVec 32) ValueCell!15257))

(declare-fun mapKey!49849 () (_ BitVec 32))

(assert (=> mapNonEmpty!49849 (= (arr!39383 _values!914) (store mapRest!49849 mapKey!49849 mapValue!49849))))

(declare-fun b!1256874 () Bool)

(assert (=> b!1256874 (= e!714609 true)))

(declare-fun -!2046 (ListLongMap!18735 (_ BitVec 64)) ListLongMap!18735)

(assert (=> b!1256874 (= (-!2046 lt!568260 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568260)))

(declare-fun lt!568262 () Unit!41723)

(declare-fun removeNotPresentStillSame!141 (ListLongMap!18735 (_ BitVec 64)) Unit!41723)

(assert (=> b!1256874 (= lt!568262 (removeNotPresentStillSame!141 lt!568260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256875 () Bool)

(assert (=> b!1256875 (= e!714615 (and e!714614 mapRes!49849))))

(declare-fun condMapEmpty!49849 () Bool)

(declare-fun mapDefault!49849 () ValueCell!15257)

(assert (=> b!1256875 (= condMapEmpty!49849 (= (arr!39383 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15257)) mapDefault!49849)))))

(declare-fun b!1256876 () Bool)

(declare-fun res!837876 () Bool)

(assert (=> b!1256876 (=> (not res!837876) (not e!714612))))

(assert (=> b!1256876 (= res!837876 (and (= (size!39921 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39920 _keys!1118) (size!39921 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105498 res!837873) b!1256876))

(assert (= (and b!1256876 res!837876) b!1256871))

(assert (= (and b!1256871 res!837874) b!1256868))

(assert (= (and b!1256868 res!837877) b!1256870))

(assert (= (and b!1256870 (not res!837878)) b!1256873))

(assert (= (and b!1256873 (not res!837875)) b!1256874))

(assert (= (and b!1256875 condMapEmpty!49849) mapIsEmpty!49849))

(assert (= (and b!1256875 (not condMapEmpty!49849)) mapNonEmpty!49849))

(get-info :version)

(assert (= (and mapNonEmpty!49849 ((_ is ValueCellFull!15257) mapValue!49849)) b!1256869))

(assert (= (and b!1256875 ((_ is ValueCellFull!15257) mapDefault!49849)) b!1256872))

(assert (= start!105498 b!1256875))

(declare-fun m!1157059 () Bool)

(assert (=> start!105498 m!1157059))

(declare-fun m!1157061 () Bool)

(assert (=> start!105498 m!1157061))

(declare-fun m!1157063 () Bool)

(assert (=> start!105498 m!1157063))

(declare-fun m!1157065 () Bool)

(assert (=> b!1256873 m!1157065))

(declare-fun m!1157067 () Bool)

(assert (=> b!1256873 m!1157067))

(declare-fun m!1157069 () Bool)

(assert (=> b!1256870 m!1157069))

(declare-fun m!1157071 () Bool)

(assert (=> b!1256870 m!1157071))

(declare-fun m!1157073 () Bool)

(assert (=> b!1256870 m!1157073))

(declare-fun m!1157075 () Bool)

(assert (=> b!1256874 m!1157075))

(declare-fun m!1157077 () Bool)

(assert (=> b!1256874 m!1157077))

(declare-fun m!1157079 () Bool)

(assert (=> mapNonEmpty!49849 m!1157079))

(declare-fun m!1157081 () Bool)

(assert (=> b!1256871 m!1157081))

(declare-fun m!1157083 () Bool)

(assert (=> b!1256868 m!1157083))

(check-sat (not b!1256868) (not b!1256874) (not b_next!27139) tp_is_empty!32041 (not b!1256871) (not b!1256870) (not start!105498) b_and!44977 (not b!1256873) (not mapNonEmpty!49849))
(check-sat b_and!44977 (not b_next!27139))
