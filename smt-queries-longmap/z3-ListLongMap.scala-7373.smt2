; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94214 () Bool)

(assert start!94214)

(declare-fun b_free!21415 () Bool)

(declare-fun b_next!21415 () Bool)

(assert (=> start!94214 (= b_free!21415 (not b_next!21415))))

(declare-fun tp!75674 () Bool)

(declare-fun b_and!34157 () Bool)

(assert (=> start!94214 (= tp!75674 b_and!34157)))

(declare-fun b!1064163 () Bool)

(declare-fun res!710173 () Bool)

(declare-fun e!606332 () Bool)

(assert (=> b!1064163 (=> (not res!710173) (not e!606332))))

(declare-datatypes ((array!67495 0))(
  ( (array!67496 (arr!32447 (Array (_ BitVec 32) (_ BitVec 64))) (size!32984 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67495)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67495 (_ BitVec 32)) Bool)

(assert (=> b!1064163 (= res!710173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39514 () Bool)

(declare-fun mapRes!39514 () Bool)

(declare-fun tp!75673 () Bool)

(declare-fun e!606330 () Bool)

(assert (=> mapNonEmpty!39514 (= mapRes!39514 (and tp!75673 e!606330))))

(declare-fun mapKey!39514 () (_ BitVec 32))

(declare-datatypes ((V!38769 0))(
  ( (V!38770 (val!12663 Int)) )
))
(declare-datatypes ((ValueCell!11909 0))(
  ( (ValueCellFull!11909 (v!15270 V!38769)) (EmptyCell!11909) )
))
(declare-datatypes ((array!67497 0))(
  ( (array!67498 (arr!32448 (Array (_ BitVec 32) ValueCell!11909)) (size!32985 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67497)

(declare-fun mapRest!39514 () (Array (_ BitVec 32) ValueCell!11909))

(declare-fun mapValue!39514 () ValueCell!11909)

(assert (=> mapNonEmpty!39514 (= (arr!32448 _values!955) (store mapRest!39514 mapKey!39514 mapValue!39514))))

(declare-fun b!1064165 () Bool)

(declare-fun e!606335 () Bool)

(assert (=> b!1064165 (= e!606335 true)))

(declare-datatypes ((tuple2!16006 0))(
  ( (tuple2!16007 (_1!8014 (_ BitVec 64)) (_2!8014 V!38769)) )
))
(declare-datatypes ((List!22586 0))(
  ( (Nil!22583) (Cons!22582 (h!23800 tuple2!16006) (t!31891 List!22586)) )
))
(declare-datatypes ((ListLongMap!13983 0))(
  ( (ListLongMap!13984 (toList!7007 List!22586)) )
))
(declare-fun lt!468871 () ListLongMap!13983)

(declare-fun -!570 (ListLongMap!13983 (_ BitVec 64)) ListLongMap!13983)

(assert (=> b!1064165 (= (-!570 lt!468871 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468871)))

(declare-datatypes ((Unit!34819 0))(
  ( (Unit!34820) )
))
(declare-fun lt!468872 () Unit!34819)

(declare-fun removeNotPresentStillSame!21 (ListLongMap!13983 (_ BitVec 64)) Unit!34819)

(assert (=> b!1064165 (= lt!468872 (removeNotPresentStillSame!21 lt!468871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064166 () Bool)

(declare-fun e!606329 () Bool)

(declare-fun e!606333 () Bool)

(assert (=> b!1064166 (= e!606329 (and e!606333 mapRes!39514))))

(declare-fun condMapEmpty!39514 () Bool)

(declare-fun mapDefault!39514 () ValueCell!11909)

(assert (=> b!1064166 (= condMapEmpty!39514 (= (arr!32448 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11909)) mapDefault!39514)))))

(declare-fun mapIsEmpty!39514 () Bool)

(assert (=> mapIsEmpty!39514 mapRes!39514))

(declare-fun b!1064167 () Bool)

(declare-fun res!710172 () Bool)

(assert (=> b!1064167 (=> (not res!710172) (not e!606332))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064167 (= res!710172 (and (= (size!32985 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32984 _keys!1163) (size!32985 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064168 () Bool)

(declare-fun tp_is_empty!25225 () Bool)

(assert (=> b!1064168 (= e!606333 tp_is_empty!25225)))

(declare-fun b!1064169 () Bool)

(declare-fun e!606334 () Bool)

(assert (=> b!1064169 (= e!606334 e!606335)))

(declare-fun res!710170 () Bool)

(assert (=> b!1064169 (=> res!710170 e!606335)))

(declare-fun contains!6262 (ListLongMap!13983 (_ BitVec 64)) Bool)

(assert (=> b!1064169 (= res!710170 (contains!6262 lt!468871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38769)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38769)

(declare-fun getCurrentListMap!3987 (array!67495 array!67497 (_ BitVec 32) (_ BitVec 32) V!38769 V!38769 (_ BitVec 32) Int) ListLongMap!13983)

(assert (=> b!1064169 (= lt!468871 (getCurrentListMap!3987 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064170 () Bool)

(declare-fun res!710175 () Bool)

(assert (=> b!1064170 (=> (not res!710175) (not e!606332))))

(declare-datatypes ((List!22587 0))(
  ( (Nil!22584) (Cons!22583 (h!23801 (_ BitVec 64)) (t!31892 List!22587)) )
))
(declare-fun arrayNoDuplicates!0 (array!67495 (_ BitVec 32) List!22587) Bool)

(assert (=> b!1064170 (= res!710175 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22584))))

(declare-fun b!1064171 () Bool)

(assert (=> b!1064171 (= e!606330 tp_is_empty!25225)))

(declare-fun res!710174 () Bool)

(assert (=> start!94214 (=> (not res!710174) (not e!606332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94214 (= res!710174 (validMask!0 mask!1515))))

(assert (=> start!94214 e!606332))

(assert (=> start!94214 true))

(assert (=> start!94214 tp_is_empty!25225))

(declare-fun array_inv!25154 (array!67497) Bool)

(assert (=> start!94214 (and (array_inv!25154 _values!955) e!606329)))

(assert (=> start!94214 tp!75674))

(declare-fun array_inv!25155 (array!67495) Bool)

(assert (=> start!94214 (array_inv!25155 _keys!1163)))

(declare-fun b!1064164 () Bool)

(assert (=> b!1064164 (= e!606332 (not e!606334))))

(declare-fun res!710171 () Bool)

(assert (=> b!1064164 (=> res!710171 e!606334)))

(assert (=> b!1064164 (= res!710171 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468875 () ListLongMap!13983)

(declare-fun lt!468874 () ListLongMap!13983)

(assert (=> b!1064164 (= lt!468875 lt!468874)))

(declare-fun lt!468873 () Unit!34819)

(declare-fun zeroValueAfter!47 () V!38769)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!652 (array!67495 array!67497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38769 V!38769 V!38769 V!38769 (_ BitVec 32) Int) Unit!34819)

(assert (=> b!1064164 (= lt!468873 (lemmaNoChangeToArrayThenSameMapNoExtras!652 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3649 (array!67495 array!67497 (_ BitVec 32) (_ BitVec 32) V!38769 V!38769 (_ BitVec 32) Int) ListLongMap!13983)

(assert (=> b!1064164 (= lt!468874 (getCurrentListMapNoExtraKeys!3649 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064164 (= lt!468875 (getCurrentListMapNoExtraKeys!3649 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94214 res!710174) b!1064167))

(assert (= (and b!1064167 res!710172) b!1064163))

(assert (= (and b!1064163 res!710173) b!1064170))

(assert (= (and b!1064170 res!710175) b!1064164))

(assert (= (and b!1064164 (not res!710171)) b!1064169))

(assert (= (and b!1064169 (not res!710170)) b!1064165))

(assert (= (and b!1064166 condMapEmpty!39514) mapIsEmpty!39514))

(assert (= (and b!1064166 (not condMapEmpty!39514)) mapNonEmpty!39514))

(get-info :version)

(assert (= (and mapNonEmpty!39514 ((_ is ValueCellFull!11909) mapValue!39514)) b!1064171))

(assert (= (and b!1064166 ((_ is ValueCellFull!11909) mapDefault!39514)) b!1064168))

(assert (= start!94214 b!1064166))

(declare-fun m!983221 () Bool)

(assert (=> b!1064164 m!983221))

(declare-fun m!983223 () Bool)

(assert (=> b!1064164 m!983223))

(declare-fun m!983225 () Bool)

(assert (=> b!1064164 m!983225))

(declare-fun m!983227 () Bool)

(assert (=> b!1064169 m!983227))

(declare-fun m!983229 () Bool)

(assert (=> b!1064169 m!983229))

(declare-fun m!983231 () Bool)

(assert (=> start!94214 m!983231))

(declare-fun m!983233 () Bool)

(assert (=> start!94214 m!983233))

(declare-fun m!983235 () Bool)

(assert (=> start!94214 m!983235))

(declare-fun m!983237 () Bool)

(assert (=> mapNonEmpty!39514 m!983237))

(declare-fun m!983239 () Bool)

(assert (=> b!1064163 m!983239))

(declare-fun m!983241 () Bool)

(assert (=> b!1064170 m!983241))

(declare-fun m!983243 () Bool)

(assert (=> b!1064165 m!983243))

(declare-fun m!983245 () Bool)

(assert (=> b!1064165 m!983245))

(check-sat b_and!34157 tp_is_empty!25225 (not mapNonEmpty!39514) (not b!1064164) (not b!1064163) (not b!1064170) (not b!1064165) (not b!1064169) (not b_next!21415) (not start!94214))
(check-sat b_and!34157 (not b_next!21415))
