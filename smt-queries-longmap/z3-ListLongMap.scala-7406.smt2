; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94230 () Bool)

(assert start!94230)

(declare-fun b_free!21615 () Bool)

(declare-fun b_next!21615 () Bool)

(assert (=> start!94230 (= b_free!21615 (not b_next!21615))))

(declare-fun tp!76282 () Bool)

(declare-fun b_and!34375 () Bool)

(assert (=> start!94230 (= tp!76282 b_and!34375)))

(declare-fun b!1065633 () Bool)

(declare-fun e!607534 () Bool)

(assert (=> b!1065633 (= e!607534 true)))

(declare-datatypes ((V!39035 0))(
  ( (V!39036 (val!12763 Int)) )
))
(declare-datatypes ((tuple2!16180 0))(
  ( (tuple2!16181 (_1!8101 (_ BitVec 64)) (_2!8101 V!39035)) )
))
(declare-datatypes ((List!22746 0))(
  ( (Nil!22743) (Cons!22742 (h!23951 tuple2!16180) (t!32065 List!22746)) )
))
(declare-datatypes ((ListLongMap!14149 0))(
  ( (ListLongMap!14150 (toList!7090 List!22746)) )
))
(declare-fun lt!470046 () ListLongMap!14149)

(declare-fun lt!470049 () ListLongMap!14149)

(declare-fun -!605 (ListLongMap!14149 (_ BitVec 64)) ListLongMap!14149)

(assert (=> b!1065633 (= lt!470046 (-!605 lt!470049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470044 () ListLongMap!14149)

(declare-fun lt!470047 () ListLongMap!14149)

(assert (=> b!1065633 (= (-!605 lt!470044 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470047)))

(declare-datatypes ((Unit!34973 0))(
  ( (Unit!34974) )
))
(declare-fun lt!470048 () Unit!34973)

(declare-fun zeroValueBefore!47 () V!39035)

(declare-fun addThenRemoveForNewKeyIsSame!14 (ListLongMap!14149 (_ BitVec 64) V!39035) Unit!34973)

(assert (=> b!1065633 (= lt!470048 (addThenRemoveForNewKeyIsSame!14 lt!470047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470045 () ListLongMap!14149)

(declare-fun lt!470042 () ListLongMap!14149)

(assert (=> b!1065633 (and (= lt!470049 lt!470044) (= lt!470045 lt!470042))))

(declare-fun +!3136 (ListLongMap!14149 tuple2!16180) ListLongMap!14149)

(assert (=> b!1065633 (= lt!470044 (+!3136 lt!470047 (tuple2!16181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12009 0))(
  ( (ValueCellFull!12009 (v!15375 V!39035)) (EmptyCell!12009) )
))
(declare-datatypes ((array!67837 0))(
  ( (array!67838 (arr!32621 (Array (_ BitVec 32) ValueCell!12009)) (size!33157 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67837)

(declare-fun minValue!907 () V!39035)

(declare-datatypes ((array!67839 0))(
  ( (array!67840 (arr!32622 (Array (_ BitVec 32) (_ BitVec 64))) (size!33158 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67839)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39035)

(declare-fun getCurrentListMap!4049 (array!67839 array!67837 (_ BitVec 32) (_ BitVec 32) V!39035 V!39035 (_ BitVec 32) Int) ListLongMap!14149)

(assert (=> b!1065633 (= lt!470045 (getCurrentListMap!4049 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065633 (= lt!470049 (getCurrentListMap!4049 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065635 () Bool)

(declare-fun res!711309 () Bool)

(declare-fun e!607532 () Bool)

(assert (=> b!1065635 (=> (not res!711309) (not e!607532))))

(declare-datatypes ((List!22747 0))(
  ( (Nil!22744) (Cons!22743 (h!23952 (_ BitVec 64)) (t!32066 List!22747)) )
))
(declare-fun arrayNoDuplicates!0 (array!67839 (_ BitVec 32) List!22747) Bool)

(assert (=> b!1065635 (= res!711309 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22744))))

(declare-fun b!1065636 () Bool)

(declare-fun e!607535 () Bool)

(declare-fun tp_is_empty!25425 () Bool)

(assert (=> b!1065636 (= e!607535 tp_is_empty!25425)))

(declare-fun mapNonEmpty!39823 () Bool)

(declare-fun mapRes!39823 () Bool)

(declare-fun tp!76283 () Bool)

(declare-fun e!607530 () Bool)

(assert (=> mapNonEmpty!39823 (= mapRes!39823 (and tp!76283 e!607530))))

(declare-fun mapKey!39823 () (_ BitVec 32))

(declare-fun mapValue!39823 () ValueCell!12009)

(declare-fun mapRest!39823 () (Array (_ BitVec 32) ValueCell!12009))

(assert (=> mapNonEmpty!39823 (= (arr!32621 _values!955) (store mapRest!39823 mapKey!39823 mapValue!39823))))

(declare-fun b!1065637 () Bool)

(declare-fun e!607531 () Bool)

(assert (=> b!1065637 (= e!607531 (and e!607535 mapRes!39823))))

(declare-fun condMapEmpty!39823 () Bool)

(declare-fun mapDefault!39823 () ValueCell!12009)

(assert (=> b!1065637 (= condMapEmpty!39823 (= (arr!32621 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12009)) mapDefault!39823)))))

(declare-fun mapIsEmpty!39823 () Bool)

(assert (=> mapIsEmpty!39823 mapRes!39823))

(declare-fun b!1065638 () Bool)

(declare-fun res!711306 () Bool)

(assert (=> b!1065638 (=> (not res!711306) (not e!607532))))

(assert (=> b!1065638 (= res!711306 (and (= (size!33157 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33158 _keys!1163) (size!33157 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065639 () Bool)

(assert (=> b!1065639 (= e!607530 tp_is_empty!25425)))

(declare-fun b!1065640 () Bool)

(assert (=> b!1065640 (= e!607532 (not e!607534))))

(declare-fun res!711308 () Bool)

(assert (=> b!1065640 (=> res!711308 e!607534)))

(assert (=> b!1065640 (= res!711308 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065640 (= lt!470047 lt!470042)))

(declare-fun lt!470043 () Unit!34973)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!713 (array!67839 array!67837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39035 V!39035 V!39035 V!39035 (_ BitVec 32) Int) Unit!34973)

(assert (=> b!1065640 (= lt!470043 (lemmaNoChangeToArrayThenSameMapNoExtras!713 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3676 (array!67839 array!67837 (_ BitVec 32) (_ BitVec 32) V!39035 V!39035 (_ BitVec 32) Int) ListLongMap!14149)

(assert (=> b!1065640 (= lt!470042 (getCurrentListMapNoExtraKeys!3676 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065640 (= lt!470047 (getCurrentListMapNoExtraKeys!3676 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711305 () Bool)

(assert (=> start!94230 (=> (not res!711305) (not e!607532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94230 (= res!711305 (validMask!0 mask!1515))))

(assert (=> start!94230 e!607532))

(assert (=> start!94230 true))

(assert (=> start!94230 tp_is_empty!25425))

(declare-fun array_inv!25260 (array!67837) Bool)

(assert (=> start!94230 (and (array_inv!25260 _values!955) e!607531)))

(assert (=> start!94230 tp!76282))

(declare-fun array_inv!25261 (array!67839) Bool)

(assert (=> start!94230 (array_inv!25261 _keys!1163)))

(declare-fun b!1065634 () Bool)

(declare-fun res!711307 () Bool)

(assert (=> b!1065634 (=> (not res!711307) (not e!607532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67839 (_ BitVec 32)) Bool)

(assert (=> b!1065634 (= res!711307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94230 res!711305) b!1065638))

(assert (= (and b!1065638 res!711306) b!1065634))

(assert (= (and b!1065634 res!711307) b!1065635))

(assert (= (and b!1065635 res!711309) b!1065640))

(assert (= (and b!1065640 (not res!711308)) b!1065633))

(assert (= (and b!1065637 condMapEmpty!39823) mapIsEmpty!39823))

(assert (= (and b!1065637 (not condMapEmpty!39823)) mapNonEmpty!39823))

(get-info :version)

(assert (= (and mapNonEmpty!39823 ((_ is ValueCellFull!12009) mapValue!39823)) b!1065639))

(assert (= (and b!1065637 ((_ is ValueCellFull!12009) mapDefault!39823)) b!1065636))

(assert (= start!94230 b!1065637))

(declare-fun m!984139 () Bool)

(assert (=> b!1065634 m!984139))

(declare-fun m!984141 () Bool)

(assert (=> start!94230 m!984141))

(declare-fun m!984143 () Bool)

(assert (=> start!94230 m!984143))

(declare-fun m!984145 () Bool)

(assert (=> start!94230 m!984145))

(declare-fun m!984147 () Bool)

(assert (=> b!1065635 m!984147))

(declare-fun m!984149 () Bool)

(assert (=> b!1065633 m!984149))

(declare-fun m!984151 () Bool)

(assert (=> b!1065633 m!984151))

(declare-fun m!984153 () Bool)

(assert (=> b!1065633 m!984153))

(declare-fun m!984155 () Bool)

(assert (=> b!1065633 m!984155))

(declare-fun m!984157 () Bool)

(assert (=> b!1065633 m!984157))

(declare-fun m!984159 () Bool)

(assert (=> b!1065633 m!984159))

(declare-fun m!984161 () Bool)

(assert (=> mapNonEmpty!39823 m!984161))

(declare-fun m!984163 () Bool)

(assert (=> b!1065640 m!984163))

(declare-fun m!984165 () Bool)

(assert (=> b!1065640 m!984165))

(declare-fun m!984167 () Bool)

(assert (=> b!1065640 m!984167))

(check-sat (not b!1065633) (not start!94230) (not b!1065635) (not b!1065640) (not mapNonEmpty!39823) tp_is_empty!25425 (not b!1065634) b_and!34375 (not b_next!21615))
(check-sat b_and!34375 (not b_next!21615))
