; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94428 () Bool)

(assert start!94428)

(declare-fun b_free!21577 () Bool)

(declare-fun b_next!21577 () Bool)

(assert (=> start!94428 (= b_free!21577 (not b_next!21577))))

(declare-fun tp!76168 () Bool)

(declare-fun b_and!34347 () Bool)

(assert (=> start!94428 (= tp!76168 b_and!34347)))

(declare-fun b!1066497 () Bool)

(declare-fun e!608036 () Bool)

(assert (=> b!1066497 (= e!608036 true)))

(declare-fun lt!470120 () Bool)

(declare-datatypes ((V!38985 0))(
  ( (V!38986 (val!12744 Int)) )
))
(declare-datatypes ((tuple2!16132 0))(
  ( (tuple2!16133 (_1!8077 (_ BitVec 64)) (_2!8077 V!38985)) )
))
(declare-datatypes ((List!22705 0))(
  ( (Nil!22702) (Cons!22701 (h!23919 tuple2!16132) (t!32016 List!22705)) )
))
(declare-datatypes ((ListLongMap!14109 0))(
  ( (ListLongMap!14110 (toList!7070 List!22705)) )
))
(declare-fun lt!470117 () ListLongMap!14109)

(declare-fun contains!6287 (ListLongMap!14109 (_ BitVec 64)) Bool)

(assert (=> b!1066497 (= lt!470120 (contains!6287 lt!470117 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!608038 () Bool)

(assert (=> b!1066497 e!608038))

(declare-fun res!711535 () Bool)

(assert (=> b!1066497 (=> (not res!711535) (not e!608038))))

(declare-fun zeroValueBefore!47 () V!38985)

(declare-fun lt!470119 () ListLongMap!14109)

(declare-fun +!3143 (ListLongMap!14109 tuple2!16132) ListLongMap!14109)

(assert (=> b!1066497 (= res!711535 (= lt!470119 (+!3143 lt!470117 (tuple2!16133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11990 0))(
  ( (ValueCellFull!11990 (v!15352 V!38985)) (EmptyCell!11990) )
))
(declare-datatypes ((array!67813 0))(
  ( (array!67814 (arr!32603 (Array (_ BitVec 32) ValueCell!11990)) (size!33140 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67813)

(declare-fun minValue!907 () V!38985)

(declare-datatypes ((array!67815 0))(
  ( (array!67816 (arr!32604 (Array (_ BitVec 32) (_ BitVec 64))) (size!33141 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67815)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38985)

(declare-fun lt!470115 () ListLongMap!14109)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun getCurrentListMap!4024 (array!67815 array!67813 (_ BitVec 32) (_ BitVec 32) V!38985 V!38985 (_ BitVec 32) Int) ListLongMap!14109)

(assert (=> b!1066497 (= lt!470115 (getCurrentListMap!4024 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066497 (= lt!470119 (getCurrentListMap!4024 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39766 () Bool)

(declare-fun mapRes!39766 () Bool)

(declare-fun tp!76169 () Bool)

(declare-fun e!608042 () Bool)

(assert (=> mapNonEmpty!39766 (= mapRes!39766 (and tp!76169 e!608042))))

(declare-fun mapValue!39766 () ValueCell!11990)

(declare-fun mapKey!39766 () (_ BitVec 32))

(declare-fun mapRest!39766 () (Array (_ BitVec 32) ValueCell!11990))

(assert (=> mapNonEmpty!39766 (= (arr!32603 _values!955) (store mapRest!39766 mapKey!39766 mapValue!39766))))

(declare-fun b!1066498 () Bool)

(declare-fun tp_is_empty!25387 () Bool)

(assert (=> b!1066498 (= e!608042 tp_is_empty!25387)))

(declare-fun b!1066499 () Bool)

(declare-fun res!711536 () Bool)

(declare-fun e!608037 () Bool)

(assert (=> b!1066499 (=> (not res!711536) (not e!608037))))

(assert (=> b!1066499 (= res!711536 (and (= (size!33140 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33141 _keys!1163) (size!33140 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711537 () Bool)

(assert (=> start!94428 (=> (not res!711537) (not e!608037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94428 (= res!711537 (validMask!0 mask!1515))))

(assert (=> start!94428 e!608037))

(assert (=> start!94428 true))

(assert (=> start!94428 tp_is_empty!25387))

(declare-fun e!608040 () Bool)

(declare-fun array_inv!25270 (array!67813) Bool)

(assert (=> start!94428 (and (array_inv!25270 _values!955) e!608040)))

(assert (=> start!94428 tp!76168))

(declare-fun array_inv!25271 (array!67815) Bool)

(assert (=> start!94428 (array_inv!25271 _keys!1163)))

(declare-fun b!1066500 () Bool)

(declare-fun res!711538 () Bool)

(assert (=> b!1066500 (=> (not res!711538) (not e!608037))))

(declare-datatypes ((List!22706 0))(
  ( (Nil!22703) (Cons!22702 (h!23920 (_ BitVec 64)) (t!32017 List!22706)) )
))
(declare-fun arrayNoDuplicates!0 (array!67815 (_ BitVec 32) List!22706) Bool)

(assert (=> b!1066500 (= res!711538 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22703))))

(declare-fun b!1066501 () Bool)

(assert (=> b!1066501 (= e!608037 (not e!608036))))

(declare-fun res!711540 () Bool)

(assert (=> b!1066501 (=> res!711540 e!608036)))

(assert (=> b!1066501 (= res!711540 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!470118 () ListLongMap!14109)

(assert (=> b!1066501 (= lt!470117 lt!470118)))

(declare-datatypes ((Unit!34934 0))(
  ( (Unit!34935) )
))
(declare-fun lt!470116 () Unit!34934)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!702 (array!67815 array!67813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38985 V!38985 V!38985 V!38985 (_ BitVec 32) Int) Unit!34934)

(assert (=> b!1066501 (= lt!470116 (lemmaNoChangeToArrayThenSameMapNoExtras!702 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3699 (array!67815 array!67813 (_ BitVec 32) (_ BitVec 32) V!38985 V!38985 (_ BitVec 32) Int) ListLongMap!14109)

(assert (=> b!1066501 (= lt!470118 (getCurrentListMapNoExtraKeys!3699 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066501 (= lt!470117 (getCurrentListMapNoExtraKeys!3699 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066502 () Bool)

(declare-fun e!608039 () Bool)

(assert (=> b!1066502 (= e!608040 (and e!608039 mapRes!39766))))

(declare-fun condMapEmpty!39766 () Bool)

(declare-fun mapDefault!39766 () ValueCell!11990)

(assert (=> b!1066502 (= condMapEmpty!39766 (= (arr!32603 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11990)) mapDefault!39766)))))

(declare-fun mapIsEmpty!39766 () Bool)

(assert (=> mapIsEmpty!39766 mapRes!39766))

(declare-fun b!1066503 () Bool)

(assert (=> b!1066503 (= e!608039 tp_is_empty!25387)))

(declare-fun b!1066504 () Bool)

(declare-fun res!711539 () Bool)

(assert (=> b!1066504 (=> (not res!711539) (not e!608037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67815 (_ BitVec 32)) Bool)

(assert (=> b!1066504 (= res!711539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066505 () Bool)

(assert (=> b!1066505 (= e!608038 (= lt!470115 lt!470118))))

(assert (= (and start!94428 res!711537) b!1066499))

(assert (= (and b!1066499 res!711536) b!1066504))

(assert (= (and b!1066504 res!711539) b!1066500))

(assert (= (and b!1066500 res!711538) b!1066501))

(assert (= (and b!1066501 (not res!711540)) b!1066497))

(assert (= (and b!1066497 res!711535) b!1066505))

(assert (= (and b!1066502 condMapEmpty!39766) mapIsEmpty!39766))

(assert (= (and b!1066502 (not condMapEmpty!39766)) mapNonEmpty!39766))

(get-info :version)

(assert (= (and mapNonEmpty!39766 ((_ is ValueCellFull!11990) mapValue!39766)) b!1066498))

(assert (= (and b!1066502 ((_ is ValueCellFull!11990) mapDefault!39766)) b!1066503))

(assert (= start!94428 b!1066502))

(declare-fun m!985253 () Bool)

(assert (=> b!1066500 m!985253))

(declare-fun m!985255 () Bool)

(assert (=> b!1066497 m!985255))

(declare-fun m!985257 () Bool)

(assert (=> b!1066497 m!985257))

(declare-fun m!985259 () Bool)

(assert (=> b!1066497 m!985259))

(declare-fun m!985261 () Bool)

(assert (=> b!1066497 m!985261))

(declare-fun m!985263 () Bool)

(assert (=> mapNonEmpty!39766 m!985263))

(declare-fun m!985265 () Bool)

(assert (=> start!94428 m!985265))

(declare-fun m!985267 () Bool)

(assert (=> start!94428 m!985267))

(declare-fun m!985269 () Bool)

(assert (=> start!94428 m!985269))

(declare-fun m!985271 () Bool)

(assert (=> b!1066501 m!985271))

(declare-fun m!985273 () Bool)

(assert (=> b!1066501 m!985273))

(declare-fun m!985275 () Bool)

(assert (=> b!1066501 m!985275))

(declare-fun m!985277 () Bool)

(assert (=> b!1066504 m!985277))

(check-sat tp_is_empty!25387 (not b!1066500) (not b!1066504) (not b_next!21577) (not b!1066497) b_and!34347 (not mapNonEmpty!39766) (not start!94428) (not b!1066501))
(check-sat b_and!34347 (not b_next!21577))
