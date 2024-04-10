; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105516 () Bool)

(assert start!105516)

(declare-fun b_free!27153 () Bool)

(declare-fun b_next!27153 () Bool)

(assert (=> start!105516 (= b_free!27153 (not b_next!27153))))

(declare-fun tp!94975 () Bool)

(declare-fun b_and!45009 () Bool)

(assert (=> start!105516 (= tp!94975 b_and!45009)))

(declare-fun mapNonEmpty!49870 () Bool)

(declare-fun mapRes!49870 () Bool)

(declare-fun tp!94976 () Bool)

(declare-fun e!714807 () Bool)

(assert (=> mapNonEmpty!49870 (= mapRes!49870 (and tp!94976 e!714807))))

(declare-datatypes ((V!48105 0))(
  ( (V!48106 (val!16090 Int)) )
))
(declare-datatypes ((ValueCell!15264 0))(
  ( (ValueCellFull!15264 (v!18791 V!48105)) (EmptyCell!15264) )
))
(declare-fun mapValue!49870 () ValueCell!15264)

(declare-fun mapRest!49870 () (Array (_ BitVec 32) ValueCell!15264))

(declare-fun mapKey!49870 () (_ BitVec 32))

(declare-datatypes ((array!81744 0))(
  ( (array!81745 (arr!39430 (Array (_ BitVec 32) ValueCell!15264)) (size!39966 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81744)

(assert (=> mapNonEmpty!49870 (= (arr!39430 _values!914) (store mapRest!49870 mapKey!49870 mapValue!49870))))

(declare-fun b!1257139 () Bool)

(declare-fun tp_is_empty!32055 () Bool)

(assert (=> b!1257139 (= e!714807 tp_is_empty!32055)))

(declare-fun b!1257140 () Bool)

(declare-fun res!838043 () Bool)

(declare-fun e!714801 () Bool)

(assert (=> b!1257140 (=> (not res!838043) (not e!714801))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81746 0))(
  ( (array!81747 (arr!39431 (Array (_ BitVec 32) (_ BitVec 64))) (size!39967 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81746)

(assert (=> b!1257140 (= res!838043 (and (= (size!39966 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39967 _keys!1118) (size!39966 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838041 () Bool)

(assert (=> start!105516 (=> (not res!838041) (not e!714801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105516 (= res!838041 (validMask!0 mask!1466))))

(assert (=> start!105516 e!714801))

(assert (=> start!105516 true))

(assert (=> start!105516 tp!94975))

(assert (=> start!105516 tp_is_empty!32055))

(declare-fun array_inv!30035 (array!81746) Bool)

(assert (=> start!105516 (array_inv!30035 _keys!1118)))

(declare-fun e!714805 () Bool)

(declare-fun array_inv!30036 (array!81744) Bool)

(assert (=> start!105516 (and (array_inv!30036 _values!914) e!714805)))

(declare-fun b!1257141 () Bool)

(declare-fun res!838039 () Bool)

(assert (=> b!1257141 (=> (not res!838039) (not e!714801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81746 (_ BitVec 32)) Bool)

(assert (=> b!1257141 (= res!838039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49870 () Bool)

(assert (=> mapIsEmpty!49870 mapRes!49870))

(declare-fun b!1257142 () Bool)

(declare-fun e!714802 () Bool)

(assert (=> b!1257142 (= e!714801 (not e!714802))))

(declare-fun res!838042 () Bool)

(assert (=> b!1257142 (=> res!838042 e!714802)))

(assert (=> b!1257142 (= res!838042 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20786 0))(
  ( (tuple2!20787 (_1!10404 (_ BitVec 64)) (_2!10404 V!48105)) )
))
(declare-datatypes ((List!28001 0))(
  ( (Nil!27998) (Cons!27997 (h!29206 tuple2!20786) (t!41490 List!28001)) )
))
(declare-datatypes ((ListLongMap!18659 0))(
  ( (ListLongMap!18660 (toList!9345 List!28001)) )
))
(declare-fun lt!568544 () ListLongMap!18659)

(declare-fun lt!568545 () ListLongMap!18659)

(assert (=> b!1257142 (= lt!568544 lt!568545)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41874 0))(
  ( (Unit!41875) )
))
(declare-fun lt!568546 () Unit!41874)

(declare-fun minValueAfter!43 () V!48105)

(declare-fun zeroValue!871 () V!48105)

(declare-fun minValueBefore!43 () V!48105)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1088 (array!81746 array!81744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48105 V!48105 V!48105 V!48105 (_ BitVec 32) Int) Unit!41874)

(assert (=> b!1257142 (= lt!568546 (lemmaNoChangeToArrayThenSameMapNoExtras!1088 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5724 (array!81746 array!81744 (_ BitVec 32) (_ BitVec 32) V!48105 V!48105 (_ BitVec 32) Int) ListLongMap!18659)

(assert (=> b!1257142 (= lt!568545 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257142 (= lt!568544 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257143 () Bool)

(declare-fun e!714806 () Bool)

(assert (=> b!1257143 (= e!714806 true)))

(declare-fun lt!568547 () ListLongMap!18659)

(declare-fun -!2093 (ListLongMap!18659 (_ BitVec 64)) ListLongMap!18659)

(assert (=> b!1257143 (= (-!2093 lt!568547 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568547)))

(declare-fun lt!568543 () Unit!41874)

(declare-fun removeNotPresentStillSame!146 (ListLongMap!18659 (_ BitVec 64)) Unit!41874)

(assert (=> b!1257143 (= lt!568543 (removeNotPresentStillSame!146 lt!568547 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257144 () Bool)

(assert (=> b!1257144 (= e!714802 e!714806)))

(declare-fun res!838040 () Bool)

(assert (=> b!1257144 (=> res!838040 e!714806)))

(declare-fun contains!7561 (ListLongMap!18659 (_ BitVec 64)) Bool)

(assert (=> b!1257144 (= res!838040 (contains!7561 lt!568547 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4566 (array!81746 array!81744 (_ BitVec 32) (_ BitVec 32) V!48105 V!48105 (_ BitVec 32) Int) ListLongMap!18659)

(assert (=> b!1257144 (= lt!568547 (getCurrentListMap!4566 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257145 () Bool)

(declare-fun res!838044 () Bool)

(assert (=> b!1257145 (=> (not res!838044) (not e!714801))))

(declare-datatypes ((List!28002 0))(
  ( (Nil!27999) (Cons!27998 (h!29207 (_ BitVec 64)) (t!41491 List!28002)) )
))
(declare-fun arrayNoDuplicates!0 (array!81746 (_ BitVec 32) List!28002) Bool)

(assert (=> b!1257145 (= res!838044 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27999))))

(declare-fun b!1257146 () Bool)

(declare-fun e!714803 () Bool)

(assert (=> b!1257146 (= e!714805 (and e!714803 mapRes!49870))))

(declare-fun condMapEmpty!49870 () Bool)

(declare-fun mapDefault!49870 () ValueCell!15264)

(assert (=> b!1257146 (= condMapEmpty!49870 (= (arr!39430 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15264)) mapDefault!49870)))))

(declare-fun b!1257147 () Bool)

(assert (=> b!1257147 (= e!714803 tp_is_empty!32055)))

(assert (= (and start!105516 res!838041) b!1257140))

(assert (= (and b!1257140 res!838043) b!1257141))

(assert (= (and b!1257141 res!838039) b!1257145))

(assert (= (and b!1257145 res!838044) b!1257142))

(assert (= (and b!1257142 (not res!838042)) b!1257144))

(assert (= (and b!1257144 (not res!838040)) b!1257143))

(assert (= (and b!1257146 condMapEmpty!49870) mapIsEmpty!49870))

(assert (= (and b!1257146 (not condMapEmpty!49870)) mapNonEmpty!49870))

(get-info :version)

(assert (= (and mapNonEmpty!49870 ((_ is ValueCellFull!15264) mapValue!49870)) b!1257139))

(assert (= (and b!1257146 ((_ is ValueCellFull!15264) mapDefault!49870)) b!1257147))

(assert (= start!105516 b!1257146))

(declare-fun m!1157761 () Bool)

(assert (=> b!1257145 m!1157761))

(declare-fun m!1157763 () Bool)

(assert (=> b!1257142 m!1157763))

(declare-fun m!1157765 () Bool)

(assert (=> b!1257142 m!1157765))

(declare-fun m!1157767 () Bool)

(assert (=> b!1257142 m!1157767))

(declare-fun m!1157769 () Bool)

(assert (=> b!1257141 m!1157769))

(declare-fun m!1157771 () Bool)

(assert (=> b!1257143 m!1157771))

(declare-fun m!1157773 () Bool)

(assert (=> b!1257143 m!1157773))

(declare-fun m!1157775 () Bool)

(assert (=> b!1257144 m!1157775))

(declare-fun m!1157777 () Bool)

(assert (=> b!1257144 m!1157777))

(declare-fun m!1157779 () Bool)

(assert (=> mapNonEmpty!49870 m!1157779))

(declare-fun m!1157781 () Bool)

(assert (=> start!105516 m!1157781))

(declare-fun m!1157783 () Bool)

(assert (=> start!105516 m!1157783))

(declare-fun m!1157785 () Bool)

(assert (=> start!105516 m!1157785))

(check-sat b_and!45009 (not b!1257142) (not mapNonEmpty!49870) (not b_next!27153) tp_is_empty!32055 (not b!1257141) (not b!1257145) (not b!1257143) (not b!1257144) (not start!105516))
(check-sat b_and!45009 (not b_next!27153))
