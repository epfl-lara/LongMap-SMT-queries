; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94818 () Bool)

(assert start!94818)

(declare-fun b_free!22047 () Bool)

(declare-fun b_next!22047 () Bool)

(assert (=> start!94818 (= b_free!22047 (not b_next!22047))))

(declare-fun tp!77603 () Bool)

(declare-fun b_and!34889 () Bool)

(assert (=> start!94818 (= tp!77603 b_and!34889)))

(declare-fun b!1072131 () Bool)

(declare-fun e!612305 () Bool)

(declare-fun tp_is_empty!25857 () Bool)

(assert (=> b!1072131 (= e!612305 tp_is_empty!25857)))

(declare-fun b!1072132 () Bool)

(declare-fun e!612307 () Bool)

(assert (=> b!1072132 (= e!612307 true)))

(declare-datatypes ((V!39611 0))(
  ( (V!39612 (val!12979 Int)) )
))
(declare-datatypes ((tuple2!16528 0))(
  ( (tuple2!16529 (_1!8275 (_ BitVec 64)) (_2!8275 V!39611)) )
))
(declare-datatypes ((List!23062 0))(
  ( (Nil!23059) (Cons!23058 (h!24267 tuple2!16528) (t!32397 List!23062)) )
))
(declare-datatypes ((ListLongMap!14497 0))(
  ( (ListLongMap!14498 (toList!7264 List!23062)) )
))
(declare-fun lt!474964 () ListLongMap!14497)

(declare-fun lt!474959 () ListLongMap!14497)

(declare-fun -!694 (ListLongMap!14497 (_ BitVec 64)) ListLongMap!14497)

(assert (=> b!1072132 (= lt!474964 (-!694 lt!474959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474963 () ListLongMap!14497)

(declare-fun lt!474962 () ListLongMap!14497)

(assert (=> b!1072132 (= lt!474963 lt!474962)))

(declare-fun zeroValueBefore!47 () V!39611)

(declare-datatypes ((Unit!35324 0))(
  ( (Unit!35325) )
))
(declare-fun lt!474969 () Unit!35324)

(declare-fun minValue!907 () V!39611)

(declare-fun lt!474961 () ListLongMap!14497)

(declare-fun addCommutativeForDiffKeys!739 (ListLongMap!14497 (_ BitVec 64) V!39611 (_ BitVec 64) V!39611) Unit!35324)

(assert (=> b!1072132 (= lt!474969 (addCommutativeForDiffKeys!739 lt!474961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474957 () ListLongMap!14497)

(assert (=> b!1072132 (= (-!694 lt!474962 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474957)))

(declare-fun lt!474965 () tuple2!16528)

(declare-fun +!3198 (ListLongMap!14497 tuple2!16528) ListLongMap!14497)

(assert (=> b!1072132 (= lt!474962 (+!3198 lt!474957 lt!474965))))

(declare-fun lt!474967 () Unit!35324)

(declare-fun addThenRemoveForNewKeyIsSame!64 (ListLongMap!14497 (_ BitVec 64) V!39611) Unit!35324)

(assert (=> b!1072132 (= lt!474967 (addThenRemoveForNewKeyIsSame!64 lt!474957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474966 () tuple2!16528)

(assert (=> b!1072132 (= lt!474957 (+!3198 lt!474961 lt!474966))))

(declare-fun e!612310 () Bool)

(assert (=> b!1072132 e!612310))

(declare-fun res!715167 () Bool)

(assert (=> b!1072132 (=> (not res!715167) (not e!612310))))

(assert (=> b!1072132 (= res!715167 (= lt!474959 lt!474963))))

(assert (=> b!1072132 (= lt!474963 (+!3198 (+!3198 lt!474961 lt!474965) lt!474966))))

(assert (=> b!1072132 (= lt!474966 (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072132 (= lt!474965 (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12225 0))(
  ( (ValueCellFull!12225 (v!15596 V!39611)) (EmptyCell!12225) )
))
(declare-datatypes ((array!68685 0))(
  ( (array!68686 (arr!33037 (Array (_ BitVec 32) ValueCell!12225)) (size!33573 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68685)

(declare-datatypes ((array!68687 0))(
  ( (array!68688 (arr!33038 (Array (_ BitVec 32) (_ BitVec 64))) (size!33574 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68687)

(declare-fun lt!474968 () ListLongMap!14497)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39611)

(declare-fun getCurrentListMap!4160 (array!68687 array!68685 (_ BitVec 32) (_ BitVec 32) V!39611 V!39611 (_ BitVec 32) Int) ListLongMap!14497)

(assert (=> b!1072132 (= lt!474968 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072132 (= lt!474959 (getCurrentListMap!4160 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072133 () Bool)

(declare-fun res!715165 () Bool)

(declare-fun e!612308 () Bool)

(assert (=> b!1072133 (=> (not res!715165) (not e!612308))))

(assert (=> b!1072133 (= res!715165 (and (= (size!33573 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33574 _keys!1163) (size!33573 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072134 () Bool)

(declare-fun e!612311 () Bool)

(assert (=> b!1072134 (= e!612311 tp_is_empty!25857)))

(declare-fun b!1072135 () Bool)

(declare-fun lt!474958 () ListLongMap!14497)

(assert (=> b!1072135 (= e!612310 (= lt!474968 (+!3198 lt!474958 lt!474966)))))

(declare-fun b!1072136 () Bool)

(declare-fun e!612306 () Bool)

(declare-fun mapRes!40495 () Bool)

(assert (=> b!1072136 (= e!612306 (and e!612305 mapRes!40495))))

(declare-fun condMapEmpty!40495 () Bool)

(declare-fun mapDefault!40495 () ValueCell!12225)

(assert (=> b!1072136 (= condMapEmpty!40495 (= (arr!33037 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12225)) mapDefault!40495)))))

(declare-fun b!1072137 () Bool)

(declare-fun res!715168 () Bool)

(assert (=> b!1072137 (=> (not res!715168) (not e!612308))))

(declare-datatypes ((List!23063 0))(
  ( (Nil!23060) (Cons!23059 (h!24268 (_ BitVec 64)) (t!32398 List!23063)) )
))
(declare-fun arrayNoDuplicates!0 (array!68687 (_ BitVec 32) List!23063) Bool)

(assert (=> b!1072137 (= res!715168 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23060))))

(declare-fun b!1072138 () Bool)

(declare-fun res!715163 () Bool)

(assert (=> b!1072138 (=> (not res!715163) (not e!612308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68687 (_ BitVec 32)) Bool)

(assert (=> b!1072138 (= res!715163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715166 () Bool)

(assert (=> start!94818 (=> (not res!715166) (not e!612308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94818 (= res!715166 (validMask!0 mask!1515))))

(assert (=> start!94818 e!612308))

(assert (=> start!94818 true))

(assert (=> start!94818 tp_is_empty!25857))

(declare-fun array_inv!25542 (array!68685) Bool)

(assert (=> start!94818 (and (array_inv!25542 _values!955) e!612306)))

(assert (=> start!94818 tp!77603))

(declare-fun array_inv!25543 (array!68687) Bool)

(assert (=> start!94818 (array_inv!25543 _keys!1163)))

(declare-fun b!1072139 () Bool)

(assert (=> b!1072139 (= e!612308 (not e!612307))))

(declare-fun res!715164 () Bool)

(assert (=> b!1072139 (=> res!715164 e!612307)))

(assert (=> b!1072139 (= res!715164 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072139 (= lt!474961 lt!474958)))

(declare-fun lt!474960 () Unit!35324)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!866 (array!68687 array!68685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39611 V!39611 V!39611 V!39611 (_ BitVec 32) Int) Unit!35324)

(assert (=> b!1072139 (= lt!474960 (lemmaNoChangeToArrayThenSameMapNoExtras!866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3829 (array!68687 array!68685 (_ BitVec 32) (_ BitVec 32) V!39611 V!39611 (_ BitVec 32) Int) ListLongMap!14497)

(assert (=> b!1072139 (= lt!474958 (getCurrentListMapNoExtraKeys!3829 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072139 (= lt!474961 (getCurrentListMapNoExtraKeys!3829 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40495 () Bool)

(assert (=> mapIsEmpty!40495 mapRes!40495))

(declare-fun mapNonEmpty!40495 () Bool)

(declare-fun tp!77602 () Bool)

(assert (=> mapNonEmpty!40495 (= mapRes!40495 (and tp!77602 e!612311))))

(declare-fun mapRest!40495 () (Array (_ BitVec 32) ValueCell!12225))

(declare-fun mapKey!40495 () (_ BitVec 32))

(declare-fun mapValue!40495 () ValueCell!12225)

(assert (=> mapNonEmpty!40495 (= (arr!33037 _values!955) (store mapRest!40495 mapKey!40495 mapValue!40495))))

(assert (= (and start!94818 res!715166) b!1072133))

(assert (= (and b!1072133 res!715165) b!1072138))

(assert (= (and b!1072138 res!715163) b!1072137))

(assert (= (and b!1072137 res!715168) b!1072139))

(assert (= (and b!1072139 (not res!715164)) b!1072132))

(assert (= (and b!1072132 res!715167) b!1072135))

(assert (= (and b!1072136 condMapEmpty!40495) mapIsEmpty!40495))

(assert (= (and b!1072136 (not condMapEmpty!40495)) mapNonEmpty!40495))

(get-info :version)

(assert (= (and mapNonEmpty!40495 ((_ is ValueCellFull!12225) mapValue!40495)) b!1072134))

(assert (= (and b!1072136 ((_ is ValueCellFull!12225) mapDefault!40495)) b!1072131))

(assert (= start!94818 b!1072136))

(declare-fun m!990933 () Bool)

(assert (=> mapNonEmpty!40495 m!990933))

(declare-fun m!990935 () Bool)

(assert (=> b!1072137 m!990935))

(declare-fun m!990937 () Bool)

(assert (=> b!1072139 m!990937))

(declare-fun m!990939 () Bool)

(assert (=> b!1072139 m!990939))

(declare-fun m!990941 () Bool)

(assert (=> b!1072139 m!990941))

(declare-fun m!990943 () Bool)

(assert (=> b!1072135 m!990943))

(declare-fun m!990945 () Bool)

(assert (=> b!1072138 m!990945))

(declare-fun m!990947 () Bool)

(assert (=> start!94818 m!990947))

(declare-fun m!990949 () Bool)

(assert (=> start!94818 m!990949))

(declare-fun m!990951 () Bool)

(assert (=> start!94818 m!990951))

(declare-fun m!990953 () Bool)

(assert (=> b!1072132 m!990953))

(declare-fun m!990955 () Bool)

(assert (=> b!1072132 m!990955))

(declare-fun m!990957 () Bool)

(assert (=> b!1072132 m!990957))

(declare-fun m!990959 () Bool)

(assert (=> b!1072132 m!990959))

(declare-fun m!990961 () Bool)

(assert (=> b!1072132 m!990961))

(declare-fun m!990963 () Bool)

(assert (=> b!1072132 m!990963))

(declare-fun m!990965 () Bool)

(assert (=> b!1072132 m!990965))

(assert (=> b!1072132 m!990955))

(declare-fun m!990967 () Bool)

(assert (=> b!1072132 m!990967))

(declare-fun m!990969 () Bool)

(assert (=> b!1072132 m!990969))

(declare-fun m!990971 () Bool)

(assert (=> b!1072132 m!990971))

(check-sat tp_is_empty!25857 (not b!1072135) (not b!1072139) (not start!94818) (not b!1072132) (not b!1072137) (not mapNonEmpty!40495) (not b_next!22047) b_and!34889 (not b!1072138))
(check-sat b_and!34889 (not b_next!22047))
