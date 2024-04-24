; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95082 () Bool)

(assert start!95082)

(declare-fun b_free!22075 () Bool)

(declare-fun b_next!22075 () Bool)

(assert (=> start!95082 (= b_free!22075 (not b_next!22075))))

(declare-fun tp!77686 () Bool)

(declare-fun b_and!34927 () Bool)

(assert (=> start!95082 (= tp!77686 b_and!34927)))

(declare-fun b!1073836 () Bool)

(declare-fun e!613454 () Bool)

(declare-fun tp_is_empty!25885 () Bool)

(assert (=> b!1073836 (= e!613454 tp_is_empty!25885)))

(declare-fun b!1073837 () Bool)

(declare-fun e!613459 () Bool)

(assert (=> b!1073837 (= e!613459 true)))

(declare-datatypes ((V!39649 0))(
  ( (V!39650 (val!12993 Int)) )
))
(declare-datatypes ((tuple2!16522 0))(
  ( (tuple2!16523 (_1!8272 (_ BitVec 64)) (_2!8272 V!39649)) )
))
(declare-datatypes ((List!23080 0))(
  ( (Nil!23077) (Cons!23076 (h!24294 tuple2!16522) (t!32407 List!23080)) )
))
(declare-datatypes ((ListLongMap!14499 0))(
  ( (ListLongMap!14500 (toList!7265 List!23080)) )
))
(declare-fun lt!476019 () ListLongMap!14499)

(declare-fun lt!476028 () ListLongMap!14499)

(declare-fun -!694 (ListLongMap!14499 (_ BitVec 64)) ListLongMap!14499)

(assert (=> b!1073837 (= lt!476019 (-!694 lt!476028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!476030 () ListLongMap!14499)

(declare-fun lt!476018 () ListLongMap!14499)

(assert (=> b!1073837 (= lt!476030 lt!476018)))

(declare-fun zeroValueBefore!47 () V!39649)

(declare-fun lt!476029 () ListLongMap!14499)

(declare-datatypes ((Unit!35309 0))(
  ( (Unit!35310) )
))
(declare-fun lt!476022 () Unit!35309)

(declare-fun minValue!907 () V!39649)

(declare-fun addCommutativeForDiffKeys!751 (ListLongMap!14499 (_ BitVec 64) V!39649 (_ BitVec 64) V!39649) Unit!35309)

(assert (=> b!1073837 (= lt!476022 (addCommutativeForDiffKeys!751 lt!476029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!476023 () ListLongMap!14499)

(assert (=> b!1073837 (= (-!694 lt!476018 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476023)))

(declare-fun lt!476025 () tuple2!16522)

(declare-fun +!3228 (ListLongMap!14499 tuple2!16522) ListLongMap!14499)

(assert (=> b!1073837 (= lt!476018 (+!3228 lt!476023 lt!476025))))

(declare-fun lt!476021 () Unit!35309)

(declare-fun addThenRemoveForNewKeyIsSame!69 (ListLongMap!14499 (_ BitVec 64) V!39649) Unit!35309)

(assert (=> b!1073837 (= lt!476021 (addThenRemoveForNewKeyIsSame!69 lt!476023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!476020 () tuple2!16522)

(assert (=> b!1073837 (= lt!476023 (+!3228 lt!476029 lt!476020))))

(declare-fun e!613457 () Bool)

(assert (=> b!1073837 e!613457))

(declare-fun res!715938 () Bool)

(assert (=> b!1073837 (=> (not res!715938) (not e!613457))))

(assert (=> b!1073837 (= res!715938 (= lt!476028 lt!476030))))

(assert (=> b!1073837 (= lt!476030 (+!3228 (+!3228 lt!476029 lt!476025) lt!476020))))

(assert (=> b!1073837 (= lt!476020 (tuple2!16523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073837 (= lt!476025 (tuple2!16523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!476027 () ListLongMap!14499)

(declare-datatypes ((ValueCell!12239 0))(
  ( (ValueCellFull!12239 (v!15606 V!39649)) (EmptyCell!12239) )
))
(declare-datatypes ((array!68779 0))(
  ( (array!68780 (arr!33078 (Array (_ BitVec 32) ValueCell!12239)) (size!33615 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68779)

(declare-datatypes ((array!68781 0))(
  ( (array!68782 (arr!33079 (Array (_ BitVec 32) (_ BitVec 64))) (size!33616 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68781)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39649)

(declare-fun getCurrentListMap!4155 (array!68781 array!68779 (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 (_ BitVec 32) Int) ListLongMap!14499)

(assert (=> b!1073837 (= lt!476027 (getCurrentListMap!4155 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073837 (= lt!476028 (getCurrentListMap!4155 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073838 () Bool)

(declare-fun e!613455 () Bool)

(declare-fun mapRes!40537 () Bool)

(assert (=> b!1073838 (= e!613455 (and e!613454 mapRes!40537))))

(declare-fun condMapEmpty!40537 () Bool)

(declare-fun mapDefault!40537 () ValueCell!12239)

(assert (=> b!1073838 (= condMapEmpty!40537 (= (arr!33078 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12239)) mapDefault!40537)))))

(declare-fun b!1073839 () Bool)

(declare-fun e!613460 () Bool)

(assert (=> b!1073839 (= e!613460 tp_is_empty!25885)))

(declare-fun b!1073840 () Bool)

(declare-fun e!613456 () Bool)

(assert (=> b!1073840 (= e!613456 (not e!613459))))

(declare-fun res!715940 () Bool)

(assert (=> b!1073840 (=> res!715940 e!613459)))

(assert (=> b!1073840 (= res!715940 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!476024 () ListLongMap!14499)

(assert (=> b!1073840 (= lt!476029 lt!476024)))

(declare-fun lt!476026 () Unit!35309)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!867 (array!68781 array!68779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 V!39649 V!39649 (_ BitVec 32) Int) Unit!35309)

(assert (=> b!1073840 (= lt!476026 (lemmaNoChangeToArrayThenSameMapNoExtras!867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3864 (array!68781 array!68779 (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 (_ BitVec 32) Int) ListLongMap!14499)

(assert (=> b!1073840 (= lt!476024 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073840 (= lt!476029 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073841 () Bool)

(declare-fun res!715939 () Bool)

(assert (=> b!1073841 (=> (not res!715939) (not e!613456))))

(assert (=> b!1073841 (= res!715939 (and (= (size!33615 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33616 _keys!1163) (size!33615 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40537 () Bool)

(assert (=> mapIsEmpty!40537 mapRes!40537))

(declare-fun b!1073842 () Bool)

(declare-fun res!715942 () Bool)

(assert (=> b!1073842 (=> (not res!715942) (not e!613456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68781 (_ BitVec 32)) Bool)

(assert (=> b!1073842 (= res!715942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715941 () Bool)

(assert (=> start!95082 (=> (not res!715941) (not e!613456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95082 (= res!715941 (validMask!0 mask!1515))))

(assert (=> start!95082 e!613456))

(assert (=> start!95082 true))

(assert (=> start!95082 tp_is_empty!25885))

(declare-fun array_inv!25602 (array!68779) Bool)

(assert (=> start!95082 (and (array_inv!25602 _values!955) e!613455)))

(assert (=> start!95082 tp!77686))

(declare-fun array_inv!25603 (array!68781) Bool)

(assert (=> start!95082 (array_inv!25603 _keys!1163)))

(declare-fun mapNonEmpty!40537 () Bool)

(declare-fun tp!77687 () Bool)

(assert (=> mapNonEmpty!40537 (= mapRes!40537 (and tp!77687 e!613460))))

(declare-fun mapKey!40537 () (_ BitVec 32))

(declare-fun mapRest!40537 () (Array (_ BitVec 32) ValueCell!12239))

(declare-fun mapValue!40537 () ValueCell!12239)

(assert (=> mapNonEmpty!40537 (= (arr!33078 _values!955) (store mapRest!40537 mapKey!40537 mapValue!40537))))

(declare-fun b!1073843 () Bool)

(declare-fun res!715937 () Bool)

(assert (=> b!1073843 (=> (not res!715937) (not e!613456))))

(declare-datatypes ((List!23081 0))(
  ( (Nil!23078) (Cons!23077 (h!24295 (_ BitVec 64)) (t!32408 List!23081)) )
))
(declare-fun arrayNoDuplicates!0 (array!68781 (_ BitVec 32) List!23081) Bool)

(assert (=> b!1073843 (= res!715937 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23078))))

(declare-fun b!1073844 () Bool)

(assert (=> b!1073844 (= e!613457 (= lt!476027 (+!3228 lt!476024 lt!476020)))))

(assert (= (and start!95082 res!715941) b!1073841))

(assert (= (and b!1073841 res!715939) b!1073842))

(assert (= (and b!1073842 res!715942) b!1073843))

(assert (= (and b!1073843 res!715937) b!1073840))

(assert (= (and b!1073840 (not res!715940)) b!1073837))

(assert (= (and b!1073837 res!715938) b!1073844))

(assert (= (and b!1073838 condMapEmpty!40537) mapIsEmpty!40537))

(assert (= (and b!1073838 (not condMapEmpty!40537)) mapNonEmpty!40537))

(get-info :version)

(assert (= (and mapNonEmpty!40537 ((_ is ValueCellFull!12239) mapValue!40537)) b!1073839))

(assert (= (and b!1073838 ((_ is ValueCellFull!12239) mapDefault!40537)) b!1073836))

(assert (= start!95082 b!1073838))

(declare-fun m!993165 () Bool)

(assert (=> b!1073837 m!993165))

(declare-fun m!993167 () Bool)

(assert (=> b!1073837 m!993167))

(declare-fun m!993169 () Bool)

(assert (=> b!1073837 m!993169))

(declare-fun m!993171 () Bool)

(assert (=> b!1073837 m!993171))

(declare-fun m!993173 () Bool)

(assert (=> b!1073837 m!993173))

(declare-fun m!993175 () Bool)

(assert (=> b!1073837 m!993175))

(declare-fun m!993177 () Bool)

(assert (=> b!1073837 m!993177))

(declare-fun m!993179 () Bool)

(assert (=> b!1073837 m!993179))

(assert (=> b!1073837 m!993173))

(declare-fun m!993181 () Bool)

(assert (=> b!1073837 m!993181))

(declare-fun m!993183 () Bool)

(assert (=> b!1073837 m!993183))

(declare-fun m!993185 () Bool)

(assert (=> start!95082 m!993185))

(declare-fun m!993187 () Bool)

(assert (=> start!95082 m!993187))

(declare-fun m!993189 () Bool)

(assert (=> start!95082 m!993189))

(declare-fun m!993191 () Bool)

(assert (=> b!1073842 m!993191))

(declare-fun m!993193 () Bool)

(assert (=> b!1073840 m!993193))

(declare-fun m!993195 () Bool)

(assert (=> b!1073840 m!993195))

(declare-fun m!993197 () Bool)

(assert (=> b!1073840 m!993197))

(declare-fun m!993199 () Bool)

(assert (=> b!1073844 m!993199))

(declare-fun m!993201 () Bool)

(assert (=> b!1073843 m!993201))

(declare-fun m!993203 () Bool)

(assert (=> mapNonEmpty!40537 m!993203))

(check-sat tp_is_empty!25885 b_and!34927 (not b!1073840) (not mapNonEmpty!40537) (not b!1073844) (not b!1073843) (not b_next!22075) (not start!95082) (not b!1073837) (not b!1073842))
(check-sat b_and!34927 (not b_next!22075))
