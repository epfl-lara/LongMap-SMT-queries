; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94514 () Bool)

(assert start!94514)

(declare-fun b_free!21819 () Bool)

(declare-fun b_next!21819 () Bool)

(assert (=> start!94514 (= b_free!21819 (not b_next!21819))))

(declare-fun tp!76906 () Bool)

(declare-fun b_and!34621 () Bool)

(assert (=> start!94514 (= tp!76906 b_and!34621)))

(declare-fun b!1068714 () Bool)

(declare-fun res!713114 () Bool)

(declare-fun e!609785 () Bool)

(assert (=> b!1068714 (=> (not res!713114) (not e!609785))))

(declare-datatypes ((array!68237 0))(
  ( (array!68238 (arr!32817 (Array (_ BitVec 32) (_ BitVec 64))) (size!33353 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68237)

(declare-datatypes ((List!22892 0))(
  ( (Nil!22889) (Cons!22888 (h!24097 (_ BitVec 64)) (t!32219 List!22892)) )
))
(declare-fun arrayNoDuplicates!0 (array!68237 (_ BitVec 32) List!22892) Bool)

(assert (=> b!1068714 (= res!713114 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22889))))

(declare-fun mapIsEmpty!40141 () Bool)

(declare-fun mapRes!40141 () Bool)

(assert (=> mapIsEmpty!40141 mapRes!40141))

(declare-fun res!713117 () Bool)

(assert (=> start!94514 (=> (not res!713117) (not e!609785))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94514 (= res!713117 (validMask!0 mask!1515))))

(assert (=> start!94514 e!609785))

(assert (=> start!94514 true))

(declare-fun tp_is_empty!25629 () Bool)

(assert (=> start!94514 tp_is_empty!25629))

(declare-datatypes ((V!39307 0))(
  ( (V!39308 (val!12865 Int)) )
))
(declare-datatypes ((ValueCell!12111 0))(
  ( (ValueCellFull!12111 (v!15480 V!39307)) (EmptyCell!12111) )
))
(declare-datatypes ((array!68239 0))(
  ( (array!68240 (arr!32818 (Array (_ BitVec 32) ValueCell!12111)) (size!33354 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68239)

(declare-fun e!609782 () Bool)

(declare-fun array_inv!25404 (array!68239) Bool)

(assert (=> start!94514 (and (array_inv!25404 _values!955) e!609782)))

(assert (=> start!94514 tp!76906))

(declare-fun array_inv!25405 (array!68237) Bool)

(assert (=> start!94514 (array_inv!25405 _keys!1163)))

(declare-fun b!1068715 () Bool)

(declare-fun e!609788 () Bool)

(assert (=> b!1068715 (= e!609788 true)))

(declare-datatypes ((tuple2!16344 0))(
  ( (tuple2!16345 (_1!8183 (_ BitVec 64)) (_2!8183 V!39307)) )
))
(declare-datatypes ((List!22893 0))(
  ( (Nil!22890) (Cons!22889 (h!24098 tuple2!16344) (t!32220 List!22893)) )
))
(declare-datatypes ((ListLongMap!14313 0))(
  ( (ListLongMap!14314 (toList!7172 List!22893)) )
))
(declare-fun lt!472179 () ListLongMap!14313)

(declare-fun -!654 (ListLongMap!14313 (_ BitVec 64)) ListLongMap!14313)

(assert (=> b!1068715 (= (-!654 lt!472179 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472179)))

(declare-datatypes ((Unit!35143 0))(
  ( (Unit!35144) )
))
(declare-fun lt!472177 () Unit!35143)

(declare-fun removeNotPresentStillSame!64 (ListLongMap!14313 (_ BitVec 64)) Unit!35143)

(assert (=> b!1068715 (= lt!472177 (removeNotPresentStillSame!64 lt!472179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068716 () Bool)

(declare-fun e!609783 () Bool)

(assert (=> b!1068716 (= e!609783 tp_is_empty!25629)))

(declare-fun b!1068717 () Bool)

(declare-fun res!713118 () Bool)

(assert (=> b!1068717 (=> (not res!713118) (not e!609785))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068717 (= res!713118 (and (= (size!33354 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33353 _keys!1163) (size!33354 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068718 () Bool)

(assert (=> b!1068718 (= e!609782 (and e!609783 mapRes!40141))))

(declare-fun condMapEmpty!40141 () Bool)

(declare-fun mapDefault!40141 () ValueCell!12111)

(assert (=> b!1068718 (= condMapEmpty!40141 (= (arr!32818 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12111)) mapDefault!40141)))))

(declare-fun b!1068719 () Bool)

(declare-fun e!609784 () Bool)

(assert (=> b!1068719 (= e!609784 e!609788)))

(declare-fun res!713116 () Bool)

(assert (=> b!1068719 (=> res!713116 e!609788)))

(declare-fun contains!6302 (ListLongMap!14313 (_ BitVec 64)) Bool)

(assert (=> b!1068719 (= res!713116 (contains!6302 lt!472179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39307)

(declare-fun minValue!907 () V!39307)

(declare-fun defaultEntry!963 () Int)

(declare-fun getCurrentListMap!4098 (array!68237 array!68239 (_ BitVec 32) (_ BitVec 32) V!39307 V!39307 (_ BitVec 32) Int) ListLongMap!14313)

(assert (=> b!1068719 (= lt!472179 (getCurrentListMap!4098 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068720 () Bool)

(assert (=> b!1068720 (= e!609785 (not e!609784))))

(declare-fun res!713115 () Bool)

(assert (=> b!1068720 (=> res!713115 e!609784)))

(assert (=> b!1068720 (= res!713115 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472178 () ListLongMap!14313)

(declare-fun lt!472181 () ListLongMap!14313)

(assert (=> b!1068720 (= lt!472178 lt!472181)))

(declare-fun lt!472180 () Unit!35143)

(declare-fun zeroValueAfter!47 () V!39307)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!788 (array!68237 array!68239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39307 V!39307 V!39307 V!39307 (_ BitVec 32) Int) Unit!35143)

(assert (=> b!1068720 (= lt!472180 (lemmaNoChangeToArrayThenSameMapNoExtras!788 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3751 (array!68237 array!68239 (_ BitVec 32) (_ BitVec 32) V!39307 V!39307 (_ BitVec 32) Int) ListLongMap!14313)

(assert (=> b!1068720 (= lt!472181 (getCurrentListMapNoExtraKeys!3751 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068720 (= lt!472178 (getCurrentListMapNoExtraKeys!3751 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068721 () Bool)

(declare-fun e!609787 () Bool)

(assert (=> b!1068721 (= e!609787 tp_is_empty!25629)))

(declare-fun mapNonEmpty!40141 () Bool)

(declare-fun tp!76907 () Bool)

(assert (=> mapNonEmpty!40141 (= mapRes!40141 (and tp!76907 e!609787))))

(declare-fun mapKey!40141 () (_ BitVec 32))

(declare-fun mapRest!40141 () (Array (_ BitVec 32) ValueCell!12111))

(declare-fun mapValue!40141 () ValueCell!12111)

(assert (=> mapNonEmpty!40141 (= (arr!32818 _values!955) (store mapRest!40141 mapKey!40141 mapValue!40141))))

(declare-fun b!1068722 () Bool)

(declare-fun res!713119 () Bool)

(assert (=> b!1068722 (=> (not res!713119) (not e!609785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68237 (_ BitVec 32)) Bool)

(assert (=> b!1068722 (= res!713119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94514 res!713117) b!1068717))

(assert (= (and b!1068717 res!713118) b!1068722))

(assert (= (and b!1068722 res!713119) b!1068714))

(assert (= (and b!1068714 res!713114) b!1068720))

(assert (= (and b!1068720 (not res!713115)) b!1068719))

(assert (= (and b!1068719 (not res!713116)) b!1068715))

(assert (= (and b!1068718 condMapEmpty!40141) mapIsEmpty!40141))

(assert (= (and b!1068718 (not condMapEmpty!40141)) mapNonEmpty!40141))

(get-info :version)

(assert (= (and mapNonEmpty!40141 ((_ is ValueCellFull!12111) mapValue!40141)) b!1068721))

(assert (= (and b!1068718 ((_ is ValueCellFull!12111) mapDefault!40141)) b!1068716))

(assert (= start!94514 b!1068718))

(declare-fun m!987275 () Bool)

(assert (=> mapNonEmpty!40141 m!987275))

(declare-fun m!987277 () Bool)

(assert (=> b!1068715 m!987277))

(declare-fun m!987279 () Bool)

(assert (=> b!1068715 m!987279))

(declare-fun m!987281 () Bool)

(assert (=> start!94514 m!987281))

(declare-fun m!987283 () Bool)

(assert (=> start!94514 m!987283))

(declare-fun m!987285 () Bool)

(assert (=> start!94514 m!987285))

(declare-fun m!987287 () Bool)

(assert (=> b!1068719 m!987287))

(declare-fun m!987289 () Bool)

(assert (=> b!1068719 m!987289))

(declare-fun m!987291 () Bool)

(assert (=> b!1068720 m!987291))

(declare-fun m!987293 () Bool)

(assert (=> b!1068720 m!987293))

(declare-fun m!987295 () Bool)

(assert (=> b!1068720 m!987295))

(declare-fun m!987297 () Bool)

(assert (=> b!1068722 m!987297))

(declare-fun m!987299 () Bool)

(assert (=> b!1068714 m!987299))

(check-sat (not b!1068715) (not b!1068714) (not b!1068719) (not mapNonEmpty!40141) (not b!1068720) (not b_next!21819) b_and!34621 (not b!1068722) tp_is_empty!25629 (not start!94514))
(check-sat b_and!34621 (not b_next!21819))
