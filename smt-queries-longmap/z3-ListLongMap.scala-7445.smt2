; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94536 () Bool)

(assert start!94536)

(declare-fun b_free!21847 () Bool)

(declare-fun b_next!21847 () Bool)

(assert (=> start!94536 (= b_free!21847 (not b_next!21847))))

(declare-fun tp!76991 () Bool)

(declare-fun b_and!34623 () Bool)

(assert (=> start!94536 (= tp!76991 b_and!34623)))

(declare-fun b!1068939 () Bool)

(declare-fun res!713299 () Bool)

(declare-fun e!609984 () Bool)

(assert (=> b!1068939 (=> (not res!713299) (not e!609984))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39345 0))(
  ( (V!39346 (val!12879 Int)) )
))
(declare-datatypes ((ValueCell!12125 0))(
  ( (ValueCellFull!12125 (v!15493 V!39345)) (EmptyCell!12125) )
))
(declare-datatypes ((array!68234 0))(
  ( (array!68235 (arr!32816 (Array (_ BitVec 32) ValueCell!12125)) (size!33354 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68234)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68236 0))(
  ( (array!68237 (arr!32817 (Array (_ BitVec 32) (_ BitVec 64))) (size!33355 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68236)

(assert (=> b!1068939 (= res!713299 (and (= (size!33354 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33355 _keys!1163) (size!33354 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40183 () Bool)

(declare-fun mapRes!40183 () Bool)

(assert (=> mapIsEmpty!40183 mapRes!40183))

(declare-fun b!1068940 () Bool)

(declare-fun res!713302 () Bool)

(assert (=> b!1068940 (=> (not res!713302) (not e!609984))))

(declare-datatypes ((List!22955 0))(
  ( (Nil!22952) (Cons!22951 (h!24160 (_ BitVec 64)) (t!32273 List!22955)) )
))
(declare-fun arrayNoDuplicates!0 (array!68236 (_ BitVec 32) List!22955) Bool)

(assert (=> b!1068940 (= res!713302 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22952))))

(declare-fun b!1068941 () Bool)

(declare-fun e!609987 () Bool)

(declare-fun e!609983 () Bool)

(assert (=> b!1068941 (= e!609987 (and e!609983 mapRes!40183))))

(declare-fun condMapEmpty!40183 () Bool)

(declare-fun mapDefault!40183 () ValueCell!12125)

(assert (=> b!1068941 (= condMapEmpty!40183 (= (arr!32816 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12125)) mapDefault!40183)))))

(declare-fun b!1068942 () Bool)

(declare-fun res!713298 () Bool)

(assert (=> b!1068942 (=> (not res!713298) (not e!609984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68236 (_ BitVec 32)) Bool)

(assert (=> b!1068942 (= res!713298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!713300 () Bool)

(assert (=> start!94536 (=> (not res!713300) (not e!609984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94536 (= res!713300 (validMask!0 mask!1515))))

(assert (=> start!94536 e!609984))

(assert (=> start!94536 true))

(declare-fun tp_is_empty!25657 () Bool)

(assert (=> start!94536 tp_is_empty!25657))

(declare-fun array_inv!25400 (array!68234) Bool)

(assert (=> start!94536 (and (array_inv!25400 _values!955) e!609987)))

(assert (=> start!94536 tp!76991))

(declare-fun array_inv!25401 (array!68236) Bool)

(assert (=> start!94536 (array_inv!25401 _keys!1163)))

(declare-fun mapNonEmpty!40183 () Bool)

(declare-fun tp!76990 () Bool)

(declare-fun e!609985 () Bool)

(assert (=> mapNonEmpty!40183 (= mapRes!40183 (and tp!76990 e!609985))))

(declare-fun mapKey!40183 () (_ BitVec 32))

(declare-fun mapValue!40183 () ValueCell!12125)

(declare-fun mapRest!40183 () (Array (_ BitVec 32) ValueCell!12125))

(assert (=> mapNonEmpty!40183 (= (arr!32816 _values!955) (store mapRest!40183 mapKey!40183 mapValue!40183))))

(declare-fun b!1068943 () Bool)

(assert (=> b!1068943 (= e!609985 tp_is_empty!25657)))

(declare-fun b!1068944 () Bool)

(declare-fun e!609986 () Bool)

(declare-fun e!609989 () Bool)

(assert (=> b!1068944 (= e!609986 e!609989)))

(declare-fun res!713297 () Bool)

(assert (=> b!1068944 (=> res!713297 e!609989)))

(declare-datatypes ((tuple2!16420 0))(
  ( (tuple2!16421 (_1!8221 (_ BitVec 64)) (_2!8221 V!39345)) )
))
(declare-datatypes ((List!22956 0))(
  ( (Nil!22953) (Cons!22952 (h!24161 tuple2!16420) (t!32274 List!22956)) )
))
(declare-datatypes ((ListLongMap!14389 0))(
  ( (ListLongMap!14390 (toList!7210 List!22956)) )
))
(declare-fun lt!472191 () ListLongMap!14389)

(declare-fun contains!6280 (ListLongMap!14389 (_ BitVec 64)) Bool)

(assert (=> b!1068944 (= res!713297 (contains!6280 lt!472191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39345)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39345)

(declare-fun getCurrentListMap!4048 (array!68236 array!68234 (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 (_ BitVec 32) Int) ListLongMap!14389)

(assert (=> b!1068944 (= lt!472191 (getCurrentListMap!4048 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068945 () Bool)

(assert (=> b!1068945 (= e!609984 (not e!609986))))

(declare-fun res!713301 () Bool)

(assert (=> b!1068945 (=> res!713301 e!609986)))

(assert (=> b!1068945 (= res!713301 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472189 () ListLongMap!14389)

(declare-fun lt!472190 () ListLongMap!14389)

(assert (=> b!1068945 (= lt!472189 lt!472190)))

(declare-datatypes ((Unit!35008 0))(
  ( (Unit!35009) )
))
(declare-fun lt!472187 () Unit!35008)

(declare-fun zeroValueAfter!47 () V!39345)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!794 (array!68236 array!68234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 V!39345 V!39345 (_ BitVec 32) Int) Unit!35008)

(assert (=> b!1068945 (= lt!472187 (lemmaNoChangeToArrayThenSameMapNoExtras!794 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3800 (array!68236 array!68234 (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 (_ BitVec 32) Int) ListLongMap!14389)

(assert (=> b!1068945 (= lt!472190 (getCurrentListMapNoExtraKeys!3800 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068945 (= lt!472189 (getCurrentListMapNoExtraKeys!3800 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068946 () Bool)

(assert (=> b!1068946 (= e!609983 tp_is_empty!25657)))

(declare-fun b!1068947 () Bool)

(assert (=> b!1068947 (= e!609989 true)))

(declare-fun -!651 (ListLongMap!14389 (_ BitVec 64)) ListLongMap!14389)

(assert (=> b!1068947 (= (-!651 lt!472191 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472191)))

(declare-fun lt!472188 () Unit!35008)

(declare-fun removeNotPresentStillSame!68 (ListLongMap!14389 (_ BitVec 64)) Unit!35008)

(assert (=> b!1068947 (= lt!472188 (removeNotPresentStillSame!68 lt!472191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94536 res!713300) b!1068939))

(assert (= (and b!1068939 res!713299) b!1068942))

(assert (= (and b!1068942 res!713298) b!1068940))

(assert (= (and b!1068940 res!713302) b!1068945))

(assert (= (and b!1068945 (not res!713301)) b!1068944))

(assert (= (and b!1068944 (not res!713297)) b!1068947))

(assert (= (and b!1068941 condMapEmpty!40183) mapIsEmpty!40183))

(assert (= (and b!1068941 (not condMapEmpty!40183)) mapNonEmpty!40183))

(get-info :version)

(assert (= (and mapNonEmpty!40183 ((_ is ValueCellFull!12125) mapValue!40183)) b!1068943))

(assert (= (and b!1068941 ((_ is ValueCellFull!12125) mapDefault!40183)) b!1068946))

(assert (= start!94536 b!1068941))

(declare-fun m!987013 () Bool)

(assert (=> b!1068947 m!987013))

(declare-fun m!987015 () Bool)

(assert (=> b!1068947 m!987015))

(declare-fun m!987017 () Bool)

(assert (=> b!1068945 m!987017))

(declare-fun m!987019 () Bool)

(assert (=> b!1068945 m!987019))

(declare-fun m!987021 () Bool)

(assert (=> b!1068945 m!987021))

(declare-fun m!987023 () Bool)

(assert (=> b!1068942 m!987023))

(declare-fun m!987025 () Bool)

(assert (=> b!1068944 m!987025))

(declare-fun m!987027 () Bool)

(assert (=> b!1068944 m!987027))

(declare-fun m!987029 () Bool)

(assert (=> mapNonEmpty!40183 m!987029))

(declare-fun m!987031 () Bool)

(assert (=> start!94536 m!987031))

(declare-fun m!987033 () Bool)

(assert (=> start!94536 m!987033))

(declare-fun m!987035 () Bool)

(assert (=> start!94536 m!987035))

(declare-fun m!987037 () Bool)

(assert (=> b!1068940 m!987037))

(check-sat (not start!94536) (not b!1068942) (not b!1068945) tp_is_empty!25657 (not b!1068940) b_and!34623 (not b_next!21847) (not b!1068947) (not b!1068944) (not mapNonEmpty!40183))
(check-sat b_and!34623 (not b_next!21847))
