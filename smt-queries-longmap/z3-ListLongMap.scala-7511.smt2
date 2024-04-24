; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95478 () Bool)

(assert start!95478)

(declare-fun b_free!22243 () Bool)

(declare-fun b_next!22243 () Bool)

(assert (=> start!95478 (= b_free!22243 (not b_next!22243))))

(declare-fun tp!78227 () Bool)

(declare-fun b_and!35231 () Bool)

(assert (=> start!95478 (= tp!78227 b_and!35231)))

(declare-fun b!1077879 () Bool)

(declare-fun res!718040 () Bool)

(declare-fun e!616248 () Bool)

(assert (=> b!1077879 (=> (not res!718040) (not e!616248))))

(declare-datatypes ((array!69121 0))(
  ( (array!69122 (arr!33237 (Array (_ BitVec 32) (_ BitVec 64))) (size!33774 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69121)

(declare-datatypes ((List!23204 0))(
  ( (Nil!23201) (Cons!23200 (h!24418 (_ BitVec 64)) (t!32555 List!23204)) )
))
(declare-fun arrayNoDuplicates!0 (array!69121 (_ BitVec 32) List!23204) Bool)

(assert (=> b!1077879 (= res!718040 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23201))))

(declare-fun mapIsEmpty!40825 () Bool)

(declare-fun mapRes!40825 () Bool)

(assert (=> mapIsEmpty!40825 mapRes!40825))

(declare-fun res!718036 () Bool)

(assert (=> start!95478 (=> (not res!718036) (not e!616248))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95478 (= res!718036 (validMask!0 mask!1515))))

(assert (=> start!95478 e!616248))

(assert (=> start!95478 true))

(declare-fun tp_is_empty!26053 () Bool)

(assert (=> start!95478 tp_is_empty!26053))

(declare-datatypes ((V!39873 0))(
  ( (V!39874 (val!13077 Int)) )
))
(declare-datatypes ((ValueCell!12323 0))(
  ( (ValueCellFull!12323 (v!15701 V!39873)) (EmptyCell!12323) )
))
(declare-datatypes ((array!69123 0))(
  ( (array!69124 (arr!33238 (Array (_ BitVec 32) ValueCell!12323)) (size!33775 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69123)

(declare-fun e!616252 () Bool)

(declare-fun array_inv!25722 (array!69123) Bool)

(assert (=> start!95478 (and (array_inv!25722 _values!955) e!616252)))

(assert (=> start!95478 tp!78227))

(declare-fun array_inv!25723 (array!69121) Bool)

(assert (=> start!95478 (array_inv!25723 _keys!1163)))

(declare-fun mapNonEmpty!40825 () Bool)

(declare-fun tp!78226 () Bool)

(declare-fun e!616254 () Bool)

(assert (=> mapNonEmpty!40825 (= mapRes!40825 (and tp!78226 e!616254))))

(declare-fun mapRest!40825 () (Array (_ BitVec 32) ValueCell!12323))

(declare-fun mapKey!40825 () (_ BitVec 32))

(declare-fun mapValue!40825 () ValueCell!12323)

(assert (=> mapNonEmpty!40825 (= (arr!33238 _values!955) (store mapRest!40825 mapKey!40825 mapValue!40825))))

(declare-fun b!1077880 () Bool)

(declare-fun res!718039 () Bool)

(assert (=> b!1077880 (=> (not res!718039) (not e!616248))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1077880 (= res!718039 (and (= (size!33775 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33774 _keys!1163) (size!33775 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077881 () Bool)

(declare-fun res!718041 () Bool)

(assert (=> b!1077881 (=> (not res!718041) (not e!616248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69121 (_ BitVec 32)) Bool)

(assert (=> b!1077881 (= res!718041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1077882 () Bool)

(declare-fun e!616251 () Bool)

(assert (=> b!1077882 (= e!616251 true)))

(declare-datatypes ((tuple2!16656 0))(
  ( (tuple2!16657 (_1!8339 (_ BitVec 64)) (_2!8339 V!39873)) )
))
(declare-datatypes ((List!23205 0))(
  ( (Nil!23202) (Cons!23201 (h!24419 tuple2!16656) (t!32556 List!23205)) )
))
(declare-datatypes ((ListLongMap!14633 0))(
  ( (ListLongMap!14634 (toList!7332 List!23205)) )
))
(declare-fun lt!478800 () ListLongMap!14633)

(declare-fun lt!478802 () ListLongMap!14633)

(declare-fun -!709 (ListLongMap!14633 (_ BitVec 64)) ListLongMap!14633)

(assert (=> b!1077882 (= lt!478800 (-!709 lt!478802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!478799 () ListLongMap!14633)

(declare-fun lt!478801 () ListLongMap!14633)

(assert (=> b!1077882 (= lt!478799 lt!478801)))

(declare-fun lt!478809 () ListLongMap!14633)

(declare-fun zeroValueBefore!47 () V!39873)

(declare-fun minValue!907 () V!39873)

(declare-datatypes ((Unit!35413 0))(
  ( (Unit!35414) )
))
(declare-fun lt!478810 () Unit!35413)

(declare-fun addCommutativeForDiffKeys!758 (ListLongMap!14633 (_ BitVec 64) V!39873 (_ BitVec 64) V!39873) Unit!35413)

(assert (=> b!1077882 (= lt!478810 (addCommutativeForDiffKeys!758 lt!478809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!478803 () ListLongMap!14633)

(assert (=> b!1077882 (= (-!709 lt!478801 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478803)))

(declare-fun lt!478807 () tuple2!16656)

(declare-fun +!3259 (ListLongMap!14633 tuple2!16656) ListLongMap!14633)

(assert (=> b!1077882 (= lt!478801 (+!3259 lt!478803 lt!478807))))

(declare-fun lt!478806 () Unit!35413)

(declare-fun addThenRemoveForNewKeyIsSame!81 (ListLongMap!14633 (_ BitVec 64) V!39873) Unit!35413)

(assert (=> b!1077882 (= lt!478806 (addThenRemoveForNewKeyIsSame!81 lt!478803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478805 () tuple2!16656)

(assert (=> b!1077882 (= lt!478803 (+!3259 lt!478809 lt!478805))))

(declare-fun e!616249 () Bool)

(assert (=> b!1077882 e!616249))

(declare-fun res!718038 () Bool)

(assert (=> b!1077882 (=> (not res!718038) (not e!616249))))

(assert (=> b!1077882 (= res!718038 (= lt!478802 lt!478799))))

(assert (=> b!1077882 (= lt!478799 (+!3259 (+!3259 lt!478809 lt!478807) lt!478805))))

(assert (=> b!1077882 (= lt!478805 (tuple2!16657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1077882 (= lt!478807 (tuple2!16657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478804 () ListLongMap!14633)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39873)

(declare-fun getCurrentListMap!4188 (array!69121 array!69123 (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 (_ BitVec 32) Int) ListLongMap!14633)

(assert (=> b!1077882 (= lt!478804 (getCurrentListMap!4188 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1077882 (= lt!478802 (getCurrentListMap!4188 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077883 () Bool)

(declare-fun e!616253 () Bool)

(assert (=> b!1077883 (= e!616253 tp_is_empty!26053)))

(declare-fun b!1077884 () Bool)

(declare-fun lt!478798 () ListLongMap!14633)

(assert (=> b!1077884 (= e!616249 (= lt!478804 (+!3259 lt!478798 lt!478805)))))

(declare-fun b!1077885 () Bool)

(assert (=> b!1077885 (= e!616254 tp_is_empty!26053)))

(declare-fun b!1077886 () Bool)

(assert (=> b!1077886 (= e!616248 (not e!616251))))

(declare-fun res!718037 () Bool)

(assert (=> b!1077886 (=> res!718037 e!616251)))

(assert (=> b!1077886 (= res!718037 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1077886 (= lt!478809 lt!478798)))

(declare-fun lt!478808 () Unit!35413)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!902 (array!69121 array!69123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 V!39873 V!39873 (_ BitVec 32) Int) Unit!35413)

(assert (=> b!1077886 (= lt!478808 (lemmaNoChangeToArrayThenSameMapNoExtras!902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3922 (array!69121 array!69123 (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 (_ BitVec 32) Int) ListLongMap!14633)

(assert (=> b!1077886 (= lt!478798 (getCurrentListMapNoExtraKeys!3922 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1077886 (= lt!478809 (getCurrentListMapNoExtraKeys!3922 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077887 () Bool)

(assert (=> b!1077887 (= e!616252 (and e!616253 mapRes!40825))))

(declare-fun condMapEmpty!40825 () Bool)

(declare-fun mapDefault!40825 () ValueCell!12323)

(assert (=> b!1077887 (= condMapEmpty!40825 (= (arr!33238 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12323)) mapDefault!40825)))))

(assert (= (and start!95478 res!718036) b!1077880))

(assert (= (and b!1077880 res!718039) b!1077881))

(assert (= (and b!1077881 res!718041) b!1077879))

(assert (= (and b!1077879 res!718040) b!1077886))

(assert (= (and b!1077886 (not res!718037)) b!1077882))

(assert (= (and b!1077882 res!718038) b!1077884))

(assert (= (and b!1077887 condMapEmpty!40825) mapIsEmpty!40825))

(assert (= (and b!1077887 (not condMapEmpty!40825)) mapNonEmpty!40825))

(get-info :version)

(assert (= (and mapNonEmpty!40825 ((_ is ValueCellFull!12323) mapValue!40825)) b!1077885))

(assert (= (and b!1077887 ((_ is ValueCellFull!12323) mapDefault!40825)) b!1077883))

(assert (= start!95478 b!1077887))

(declare-fun m!997175 () Bool)

(assert (=> b!1077882 m!997175))

(declare-fun m!997177 () Bool)

(assert (=> b!1077882 m!997177))

(declare-fun m!997179 () Bool)

(assert (=> b!1077882 m!997179))

(declare-fun m!997181 () Bool)

(assert (=> b!1077882 m!997181))

(declare-fun m!997183 () Bool)

(assert (=> b!1077882 m!997183))

(declare-fun m!997185 () Bool)

(assert (=> b!1077882 m!997185))

(declare-fun m!997187 () Bool)

(assert (=> b!1077882 m!997187))

(declare-fun m!997189 () Bool)

(assert (=> b!1077882 m!997189))

(declare-fun m!997191 () Bool)

(assert (=> b!1077882 m!997191))

(assert (=> b!1077882 m!997185))

(declare-fun m!997193 () Bool)

(assert (=> b!1077882 m!997193))

(declare-fun m!997195 () Bool)

(assert (=> start!95478 m!997195))

(declare-fun m!997197 () Bool)

(assert (=> start!95478 m!997197))

(declare-fun m!997199 () Bool)

(assert (=> start!95478 m!997199))

(declare-fun m!997201 () Bool)

(assert (=> mapNonEmpty!40825 m!997201))

(declare-fun m!997203 () Bool)

(assert (=> b!1077881 m!997203))

(declare-fun m!997205 () Bool)

(assert (=> b!1077879 m!997205))

(declare-fun m!997207 () Bool)

(assert (=> b!1077884 m!997207))

(declare-fun m!997209 () Bool)

(assert (=> b!1077886 m!997209))

(declare-fun m!997211 () Bool)

(assert (=> b!1077886 m!997211))

(declare-fun m!997213 () Bool)

(assert (=> b!1077886 m!997213))

(check-sat (not b!1077882) (not b!1077886) (not mapNonEmpty!40825) (not b!1077884) (not b_next!22243) (not b!1077881) tp_is_empty!26053 (not start!95478) b_and!35231 (not b!1077879))
(check-sat b_and!35231 (not b_next!22243))
