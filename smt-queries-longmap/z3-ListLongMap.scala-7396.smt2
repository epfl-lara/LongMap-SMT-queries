; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94388 () Bool)

(assert start!94388)

(declare-fun b_free!21553 () Bool)

(declare-fun b_next!21553 () Bool)

(assert (=> start!94388 (= b_free!21553 (not b_next!21553))))

(declare-fun tp!76094 () Bool)

(declare-fun b_and!34313 () Bool)

(assert (=> start!94388 (= tp!76094 b_and!34313)))

(declare-fun b!1066059 () Bool)

(declare-fun e!607726 () Bool)

(declare-fun e!607727 () Bool)

(assert (=> b!1066059 (= e!607726 (not e!607727))))

(declare-fun res!711296 () Bool)

(assert (=> b!1066059 (=> res!711296 e!607727)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066059 (= res!711296 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38953 0))(
  ( (V!38954 (val!12732 Int)) )
))
(declare-datatypes ((tuple2!16118 0))(
  ( (tuple2!16119 (_1!8070 (_ BitVec 64)) (_2!8070 V!38953)) )
))
(declare-datatypes ((List!22692 0))(
  ( (Nil!22689) (Cons!22688 (h!23906 tuple2!16118) (t!32001 List!22692)) )
))
(declare-datatypes ((ListLongMap!14095 0))(
  ( (ListLongMap!14096 (toList!7063 List!22692)) )
))
(declare-fun lt!469864 () ListLongMap!14095)

(declare-fun lt!469861 () ListLongMap!14095)

(assert (=> b!1066059 (= lt!469864 lt!469861)))

(declare-fun zeroValueBefore!47 () V!38953)

(declare-datatypes ((ValueCell!11978 0))(
  ( (ValueCellFull!11978 (v!15340 V!38953)) (EmptyCell!11978) )
))
(declare-datatypes ((array!67769 0))(
  ( (array!67770 (arr!32582 (Array (_ BitVec 32) ValueCell!11978)) (size!33119 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67769)

(declare-fun minValue!907 () V!38953)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!34921 0))(
  ( (Unit!34922) )
))
(declare-fun lt!469862 () Unit!34921)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38953)

(declare-datatypes ((array!67771 0))(
  ( (array!67772 (arr!32583 (Array (_ BitVec 32) (_ BitVec 64))) (size!33120 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67771)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!696 (array!67771 array!67769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38953 V!38953 V!38953 V!38953 (_ BitVec 32) Int) Unit!34921)

(assert (=> b!1066059 (= lt!469862 (lemmaNoChangeToArrayThenSameMapNoExtras!696 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3693 (array!67771 array!67769 (_ BitVec 32) (_ BitVec 32) V!38953 V!38953 (_ BitVec 32) Int) ListLongMap!14095)

(assert (=> b!1066059 (= lt!469861 (getCurrentListMapNoExtraKeys!3693 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066059 (= lt!469864 (getCurrentListMapNoExtraKeys!3693 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066060 () Bool)

(declare-fun e!607729 () Bool)

(declare-fun e!607724 () Bool)

(declare-fun mapRes!39727 () Bool)

(assert (=> b!1066060 (= e!607729 (and e!607724 mapRes!39727))))

(declare-fun condMapEmpty!39727 () Bool)

(declare-fun mapDefault!39727 () ValueCell!11978)

(assert (=> b!1066060 (= condMapEmpty!39727 (= (arr!32582 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11978)) mapDefault!39727)))))

(declare-fun b!1066061 () Bool)

(assert (=> b!1066061 (= e!607727 true)))

(declare-fun lt!469863 () ListLongMap!14095)

(declare-fun getCurrentListMap!4017 (array!67771 array!67769 (_ BitVec 32) (_ BitVec 32) V!38953 V!38953 (_ BitVec 32) Int) ListLongMap!14095)

(assert (=> b!1066061 (= lt!469863 (getCurrentListMap!4017 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066062 () Bool)

(declare-fun e!607728 () Bool)

(declare-fun tp_is_empty!25363 () Bool)

(assert (=> b!1066062 (= e!607728 tp_is_empty!25363)))

(declare-fun b!1066063 () Bool)

(declare-fun res!711297 () Bool)

(assert (=> b!1066063 (=> (not res!711297) (not e!607726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67771 (_ BitVec 32)) Bool)

(assert (=> b!1066063 (= res!711297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066064 () Bool)

(declare-fun res!711298 () Bool)

(assert (=> b!1066064 (=> (not res!711298) (not e!607726))))

(declare-datatypes ((List!22693 0))(
  ( (Nil!22690) (Cons!22689 (h!23907 (_ BitVec 64)) (t!32002 List!22693)) )
))
(declare-fun arrayNoDuplicates!0 (array!67771 (_ BitVec 32) List!22693) Bool)

(assert (=> b!1066064 (= res!711298 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22690))))

(declare-fun b!1066065 () Bool)

(declare-fun res!711299 () Bool)

(assert (=> b!1066065 (=> (not res!711299) (not e!607726))))

(assert (=> b!1066065 (= res!711299 (and (= (size!33119 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33120 _keys!1163) (size!33119 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39727 () Bool)

(declare-fun tp!76093 () Bool)

(assert (=> mapNonEmpty!39727 (= mapRes!39727 (and tp!76093 e!607728))))

(declare-fun mapValue!39727 () ValueCell!11978)

(declare-fun mapRest!39727 () (Array (_ BitVec 32) ValueCell!11978))

(declare-fun mapKey!39727 () (_ BitVec 32))

(assert (=> mapNonEmpty!39727 (= (arr!32582 _values!955) (store mapRest!39727 mapKey!39727 mapValue!39727))))

(declare-fun res!711295 () Bool)

(assert (=> start!94388 (=> (not res!711295) (not e!607726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94388 (= res!711295 (validMask!0 mask!1515))))

(assert (=> start!94388 e!607726))

(assert (=> start!94388 true))

(assert (=> start!94388 tp_is_empty!25363))

(declare-fun array_inv!25254 (array!67769) Bool)

(assert (=> start!94388 (and (array_inv!25254 _values!955) e!607729)))

(assert (=> start!94388 tp!76094))

(declare-fun array_inv!25255 (array!67771) Bool)

(assert (=> start!94388 (array_inv!25255 _keys!1163)))

(declare-fun mapIsEmpty!39727 () Bool)

(assert (=> mapIsEmpty!39727 mapRes!39727))

(declare-fun b!1066066 () Bool)

(assert (=> b!1066066 (= e!607724 tp_is_empty!25363)))

(assert (= (and start!94388 res!711295) b!1066065))

(assert (= (and b!1066065 res!711299) b!1066063))

(assert (= (and b!1066063 res!711297) b!1066064))

(assert (= (and b!1066064 res!711298) b!1066059))

(assert (= (and b!1066059 (not res!711296)) b!1066061))

(assert (= (and b!1066060 condMapEmpty!39727) mapIsEmpty!39727))

(assert (= (and b!1066060 (not condMapEmpty!39727)) mapNonEmpty!39727))

(get-info :version)

(assert (= (and mapNonEmpty!39727 ((_ is ValueCellFull!11978) mapValue!39727)) b!1066062))

(assert (= (and b!1066060 ((_ is ValueCellFull!11978) mapDefault!39727)) b!1066066))

(assert (= start!94388 b!1066060))

(declare-fun m!984901 () Bool)

(assert (=> b!1066064 m!984901))

(declare-fun m!984903 () Bool)

(assert (=> b!1066063 m!984903))

(declare-fun m!984905 () Bool)

(assert (=> b!1066059 m!984905))

(declare-fun m!984907 () Bool)

(assert (=> b!1066059 m!984907))

(declare-fun m!984909 () Bool)

(assert (=> b!1066059 m!984909))

(declare-fun m!984911 () Bool)

(assert (=> start!94388 m!984911))

(declare-fun m!984913 () Bool)

(assert (=> start!94388 m!984913))

(declare-fun m!984915 () Bool)

(assert (=> start!94388 m!984915))

(declare-fun m!984917 () Bool)

(assert (=> mapNonEmpty!39727 m!984917))

(declare-fun m!984919 () Bool)

(assert (=> b!1066061 m!984919))

(check-sat tp_is_empty!25363 (not b!1066064) (not mapNonEmpty!39727) (not b_next!21553) (not b!1066059) (not start!94388) (not b!1066061) (not b!1066063) b_and!34313)
(check-sat b_and!34313 (not b_next!21553))
