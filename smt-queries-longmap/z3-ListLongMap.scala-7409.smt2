; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94482 () Bool)

(assert start!94482)

(declare-fun b_free!21631 () Bool)

(declare-fun b_next!21631 () Bool)

(assert (=> start!94482 (= b_free!21631 (not b_next!21631))))

(declare-fun tp!76330 () Bool)

(declare-fun b_and!34401 () Bool)

(assert (=> start!94482 (= tp!76330 b_and!34401)))

(declare-fun b!1067154 () Bool)

(declare-fun e!608537 () Bool)

(declare-fun tp_is_empty!25441 () Bool)

(assert (=> b!1067154 (= e!608537 tp_is_empty!25441)))

(declare-fun b!1067155 () Bool)

(declare-fun e!608531 () Bool)

(assert (=> b!1067155 (= e!608531 tp_is_empty!25441)))

(declare-fun mapIsEmpty!39847 () Bool)

(declare-fun mapRes!39847 () Bool)

(assert (=> mapIsEmpty!39847 mapRes!39847))

(declare-fun b!1067156 () Bool)

(declare-fun e!608532 () Bool)

(declare-fun e!608535 () Bool)

(assert (=> b!1067156 (= e!608532 e!608535)))

(declare-fun res!711952 () Bool)

(assert (=> b!1067156 (=> res!711952 e!608535)))

(declare-datatypes ((V!39057 0))(
  ( (V!39058 (val!12771 Int)) )
))
(declare-datatypes ((tuple2!16174 0))(
  ( (tuple2!16175 (_1!8098 (_ BitVec 64)) (_2!8098 V!39057)) )
))
(declare-datatypes ((List!22743 0))(
  ( (Nil!22740) (Cons!22739 (h!23957 tuple2!16174) (t!32054 List!22743)) )
))
(declare-datatypes ((ListLongMap!14151 0))(
  ( (ListLongMap!14152 (toList!7091 List!22743)) )
))
(declare-fun lt!470752 () ListLongMap!14151)

(declare-fun lt!470751 () ListLongMap!14151)

(declare-fun -!609 (ListLongMap!14151 (_ BitVec 64)) ListLongMap!14151)

(assert (=> b!1067156 (= res!711952 (not (= (-!609 lt!470752 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470751)))))

(declare-fun lt!470747 () ListLongMap!14151)

(declare-fun lt!470748 () ListLongMap!14151)

(assert (=> b!1067156 (= (-!609 lt!470747 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470748)))

(declare-datatypes ((Unit!34976 0))(
  ( (Unit!34977) )
))
(declare-fun lt!470749 () Unit!34976)

(declare-fun zeroValueBefore!47 () V!39057)

(declare-fun addThenRemoveForNewKeyIsSame!19 (ListLongMap!14151 (_ BitVec 64) V!39057) Unit!34976)

(assert (=> b!1067156 (= lt!470749 (addThenRemoveForNewKeyIsSame!19 lt!470748 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470753 () ListLongMap!14151)

(assert (=> b!1067156 (and (= lt!470752 lt!470747) (= lt!470751 lt!470753))))

(declare-fun +!3162 (ListLongMap!14151 tuple2!16174) ListLongMap!14151)

(assert (=> b!1067156 (= lt!470747 (+!3162 lt!470748 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12017 0))(
  ( (ValueCellFull!12017 (v!15379 V!39057)) (EmptyCell!12017) )
))
(declare-datatypes ((array!67915 0))(
  ( (array!67916 (arr!32654 (Array (_ BitVec 32) ValueCell!12017)) (size!33191 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67915)

(declare-fun minValue!907 () V!39057)

(declare-datatypes ((array!67917 0))(
  ( (array!67918 (arr!32655 (Array (_ BitVec 32) (_ BitVec 64))) (size!33192 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67917)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39057)

(declare-fun getCurrentListMap!4043 (array!67917 array!67915 (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 (_ BitVec 32) Int) ListLongMap!14151)

(assert (=> b!1067156 (= lt!470751 (getCurrentListMap!4043 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067156 (= lt!470752 (getCurrentListMap!4043 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067157 () Bool)

(declare-fun e!608533 () Bool)

(assert (=> b!1067157 (= e!608533 (and e!608531 mapRes!39847))))

(declare-fun condMapEmpty!39847 () Bool)

(declare-fun mapDefault!39847 () ValueCell!12017)

(assert (=> b!1067157 (= condMapEmpty!39847 (= (arr!32654 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12017)) mapDefault!39847)))))

(declare-fun b!1067158 () Bool)

(declare-fun e!608534 () Bool)

(assert (=> b!1067158 (= e!608534 (not e!608532))))

(declare-fun res!711953 () Bool)

(assert (=> b!1067158 (=> res!711953 e!608532)))

(assert (=> b!1067158 (= res!711953 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1067158 (= lt!470748 lt!470753)))

(declare-fun lt!470750 () Unit!34976)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!717 (array!67917 array!67915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 V!39057 V!39057 (_ BitVec 32) Int) Unit!34976)

(assert (=> b!1067158 (= lt!470750 (lemmaNoChangeToArrayThenSameMapNoExtras!717 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3714 (array!67917 array!67915 (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 (_ BitVec 32) Int) ListLongMap!14151)

(assert (=> b!1067158 (= lt!470753 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067158 (= lt!470748 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39847 () Bool)

(declare-fun tp!76331 () Bool)

(assert (=> mapNonEmpty!39847 (= mapRes!39847 (and tp!76331 e!608537))))

(declare-fun mapValue!39847 () ValueCell!12017)

(declare-fun mapRest!39847 () (Array (_ BitVec 32) ValueCell!12017))

(declare-fun mapKey!39847 () (_ BitVec 32))

(assert (=> mapNonEmpty!39847 (= (arr!32654 _values!955) (store mapRest!39847 mapKey!39847 mapValue!39847))))

(declare-fun res!711950 () Bool)

(assert (=> start!94482 (=> (not res!711950) (not e!608534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94482 (= res!711950 (validMask!0 mask!1515))))

(assert (=> start!94482 e!608534))

(assert (=> start!94482 true))

(assert (=> start!94482 tp_is_empty!25441))

(declare-fun array_inv!25306 (array!67915) Bool)

(assert (=> start!94482 (and (array_inv!25306 _values!955) e!608533)))

(assert (=> start!94482 tp!76330))

(declare-fun array_inv!25307 (array!67917) Bool)

(assert (=> start!94482 (array_inv!25307 _keys!1163)))

(declare-fun b!1067159 () Bool)

(declare-fun res!711949 () Bool)

(assert (=> b!1067159 (=> (not res!711949) (not e!608534))))

(declare-datatypes ((List!22744 0))(
  ( (Nil!22741) (Cons!22740 (h!23958 (_ BitVec 64)) (t!32055 List!22744)) )
))
(declare-fun arrayNoDuplicates!0 (array!67917 (_ BitVec 32) List!22744) Bool)

(assert (=> b!1067159 (= res!711949 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22741))))

(declare-fun b!1067160 () Bool)

(declare-fun res!711951 () Bool)

(assert (=> b!1067160 (=> (not res!711951) (not e!608534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67917 (_ BitVec 32)) Bool)

(assert (=> b!1067160 (= res!711951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067161 () Bool)

(declare-fun res!711954 () Bool)

(assert (=> b!1067161 (=> (not res!711954) (not e!608534))))

(assert (=> b!1067161 (= res!711954 (and (= (size!33191 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33192 _keys!1163) (size!33191 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067162 () Bool)

(assert (=> b!1067162 (= e!608535 (bvsle #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (= (and start!94482 res!711950) b!1067161))

(assert (= (and b!1067161 res!711954) b!1067160))

(assert (= (and b!1067160 res!711951) b!1067159))

(assert (= (and b!1067159 res!711949) b!1067158))

(assert (= (and b!1067158 (not res!711953)) b!1067156))

(assert (= (and b!1067156 (not res!711952)) b!1067162))

(assert (= (and b!1067157 condMapEmpty!39847) mapIsEmpty!39847))

(assert (= (and b!1067157 (not condMapEmpty!39847)) mapNonEmpty!39847))

(get-info :version)

(assert (= (and mapNonEmpty!39847 ((_ is ValueCellFull!12017) mapValue!39847)) b!1067154))

(assert (= (and b!1067157 ((_ is ValueCellFull!12017) mapDefault!39847)) b!1067155))

(assert (= start!94482 b!1067157))

(declare-fun m!986051 () Bool)

(assert (=> b!1067158 m!986051))

(declare-fun m!986053 () Bool)

(assert (=> b!1067158 m!986053))

(declare-fun m!986055 () Bool)

(assert (=> b!1067158 m!986055))

(declare-fun m!986057 () Bool)

(assert (=> mapNonEmpty!39847 m!986057))

(declare-fun m!986059 () Bool)

(assert (=> b!1067159 m!986059))

(declare-fun m!986061 () Bool)

(assert (=> b!1067160 m!986061))

(declare-fun m!986063 () Bool)

(assert (=> b!1067156 m!986063))

(declare-fun m!986065 () Bool)

(assert (=> b!1067156 m!986065))

(declare-fun m!986067 () Bool)

(assert (=> b!1067156 m!986067))

(declare-fun m!986069 () Bool)

(assert (=> b!1067156 m!986069))

(declare-fun m!986071 () Bool)

(assert (=> b!1067156 m!986071))

(declare-fun m!986073 () Bool)

(assert (=> b!1067156 m!986073))

(declare-fun m!986075 () Bool)

(assert (=> start!94482 m!986075))

(declare-fun m!986077 () Bool)

(assert (=> start!94482 m!986077))

(declare-fun m!986079 () Bool)

(assert (=> start!94482 m!986079))

(check-sat (not b!1067160) (not b!1067159) tp_is_empty!25441 b_and!34401 (not b!1067156) (not b!1067158) (not b_next!21631) (not start!94482) (not mapNonEmpty!39847))
(check-sat b_and!34401 (not b_next!21631))
(get-model)

(declare-fun d!129483 () Bool)

(declare-fun res!711995 () Bool)

(declare-fun e!608587 () Bool)

(assert (=> d!129483 (=> res!711995 e!608587)))

(assert (=> d!129483 (= res!711995 (bvsge #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> d!129483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!608587)))

(declare-fun b!1067225 () Bool)

(declare-fun e!608586 () Bool)

(declare-fun e!608588 () Bool)

(assert (=> b!1067225 (= e!608586 e!608588)))

(declare-fun lt!470804 () (_ BitVec 64))

(assert (=> b!1067225 (= lt!470804 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470803 () Unit!34976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67917 (_ BitVec 64) (_ BitVec 32)) Unit!34976)

(assert (=> b!1067225 (= lt!470803 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!470804 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1067225 (arrayContainsKey!0 _keys!1163 lt!470804 #b00000000000000000000000000000000)))

(declare-fun lt!470802 () Unit!34976)

(assert (=> b!1067225 (= lt!470802 lt!470803)))

(declare-fun res!711996 () Bool)

(declare-datatypes ((SeekEntryResult!9832 0))(
  ( (MissingZero!9832 (index!41699 (_ BitVec 32))) (Found!9832 (index!41700 (_ BitVec 32))) (Intermediate!9832 (undefined!10644 Bool) (index!41701 (_ BitVec 32)) (x!95400 (_ BitVec 32))) (Undefined!9832) (MissingVacant!9832 (index!41702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67917 (_ BitVec 32)) SeekEntryResult!9832)

(assert (=> b!1067225 (= res!711996 (= (seekEntryOrOpen!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9832 #b00000000000000000000000000000000)))))

(assert (=> b!1067225 (=> (not res!711996) (not e!608588))))

(declare-fun b!1067226 () Bool)

(assert (=> b!1067226 (= e!608587 e!608586)))

(declare-fun c!107800 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1067226 (= c!107800 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067227 () Bool)

(declare-fun call!45082 () Bool)

(assert (=> b!1067227 (= e!608588 call!45082)))

(declare-fun b!1067228 () Bool)

(assert (=> b!1067228 (= e!608586 call!45082)))

(declare-fun bm!45079 () Bool)

(assert (=> bm!45079 (= call!45082 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129483 (not res!711995)) b!1067226))

(assert (= (and b!1067226 c!107800) b!1067225))

(assert (= (and b!1067226 (not c!107800)) b!1067228))

(assert (= (and b!1067225 res!711996) b!1067227))

(assert (= (or b!1067227 b!1067228) bm!45079))

(declare-fun m!986141 () Bool)

(assert (=> b!1067225 m!986141))

(declare-fun m!986143 () Bool)

(assert (=> b!1067225 m!986143))

(declare-fun m!986145 () Bool)

(assert (=> b!1067225 m!986145))

(assert (=> b!1067225 m!986141))

(declare-fun m!986147 () Bool)

(assert (=> b!1067225 m!986147))

(assert (=> b!1067226 m!986141))

(assert (=> b!1067226 m!986141))

(declare-fun m!986149 () Bool)

(assert (=> b!1067226 m!986149))

(declare-fun m!986151 () Bool)

(assert (=> bm!45079 m!986151))

(assert (=> b!1067160 d!129483))

(declare-fun d!129485 () Bool)

(assert (=> d!129485 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94482 d!129485))

(declare-fun d!129487 () Bool)

(assert (=> d!129487 (= (array_inv!25306 _values!955) (bvsge (size!33191 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94482 d!129487))

(declare-fun d!129489 () Bool)

(assert (=> d!129489 (= (array_inv!25307 _keys!1163) (bvsge (size!33192 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94482 d!129489))

(declare-fun d!129491 () Bool)

(declare-fun e!608591 () Bool)

(assert (=> d!129491 e!608591))

(declare-fun res!712001 () Bool)

(assert (=> d!129491 (=> (not res!712001) (not e!608591))))

(declare-fun lt!470816 () ListLongMap!14151)

(declare-fun contains!6288 (ListLongMap!14151 (_ BitVec 64)) Bool)

(assert (=> d!129491 (= res!712001 (contains!6288 lt!470816 (_1!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!470814 () List!22743)

(assert (=> d!129491 (= lt!470816 (ListLongMap!14152 lt!470814))))

(declare-fun lt!470815 () Unit!34976)

(declare-fun lt!470813 () Unit!34976)

(assert (=> d!129491 (= lt!470815 lt!470813)))

(declare-datatypes ((Option!646 0))(
  ( (Some!645 (v!15382 V!39057)) (None!644) )
))
(declare-fun getValueByKey!595 (List!22743 (_ BitVec 64)) Option!646)

(assert (=> d!129491 (= (getValueByKey!595 lt!470814 (_1!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!645 (_2!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!283 (List!22743 (_ BitVec 64) V!39057) Unit!34976)

(assert (=> d!129491 (= lt!470813 (lemmaContainsTupThenGetReturnValue!283 lt!470814 (_1!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!376 (List!22743 (_ BitVec 64) V!39057) List!22743)

(assert (=> d!129491 (= lt!470814 (insertStrictlySorted!376 (toList!7091 lt!470748) (_1!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129491 (= (+!3162 lt!470748 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!470816)))

(declare-fun b!1067233 () Bool)

(declare-fun res!712002 () Bool)

(assert (=> b!1067233 (=> (not res!712002) (not e!608591))))

(assert (=> b!1067233 (= res!712002 (= (getValueByKey!595 (toList!7091 lt!470816) (_1!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!645 (_2!8098 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1067234 () Bool)

(declare-fun contains!6289 (List!22743 tuple2!16174) Bool)

(assert (=> b!1067234 (= e!608591 (contains!6289 (toList!7091 lt!470816) (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129491 res!712001) b!1067233))

(assert (= (and b!1067233 res!712002) b!1067234))

(declare-fun m!986153 () Bool)

(assert (=> d!129491 m!986153))

(declare-fun m!986155 () Bool)

(assert (=> d!129491 m!986155))

(declare-fun m!986157 () Bool)

(assert (=> d!129491 m!986157))

(declare-fun m!986159 () Bool)

(assert (=> d!129491 m!986159))

(declare-fun m!986161 () Bool)

(assert (=> b!1067233 m!986161))

(declare-fun m!986163 () Bool)

(assert (=> b!1067234 m!986163))

(assert (=> b!1067156 d!129491))

(declare-fun d!129493 () Bool)

(declare-fun lt!470819 () ListLongMap!14151)

(assert (=> d!129493 (not (contains!6288 lt!470819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!68 (List!22743 (_ BitVec 64)) List!22743)

(assert (=> d!129493 (= lt!470819 (ListLongMap!14152 (removeStrictlySorted!68 (toList!7091 lt!470747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129493 (= (-!609 lt!470747 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470819)))

(declare-fun bs!31380 () Bool)

(assert (= bs!31380 d!129493))

(declare-fun m!986165 () Bool)

(assert (=> bs!31380 m!986165))

(declare-fun m!986167 () Bool)

(assert (=> bs!31380 m!986167))

(assert (=> b!1067156 d!129493))

(declare-fun b!1067277 () Bool)

(declare-fun e!608625 () Bool)

(declare-fun call!45097 () Bool)

(assert (=> b!1067277 (= e!608625 (not call!45097))))

(declare-fun bm!45094 () Bool)

(declare-fun lt!470881 () ListLongMap!14151)

(assert (=> bm!45094 (= call!45097 (contains!6288 lt!470881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067278 () Bool)

(declare-fun e!608621 () Unit!34976)

(declare-fun lt!470866 () Unit!34976)

(assert (=> b!1067278 (= e!608621 lt!470866)))

(declare-fun lt!470878 () ListLongMap!14151)

(assert (=> b!1067278 (= lt!470878 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470877 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470868 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470868 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470873 () Unit!34976)

(declare-fun addStillContains!639 (ListLongMap!14151 (_ BitVec 64) V!39057 (_ BitVec 64)) Unit!34976)

(assert (=> b!1067278 (= lt!470873 (addStillContains!639 lt!470878 lt!470877 zeroValueAfter!47 lt!470868))))

(assert (=> b!1067278 (contains!6288 (+!3162 lt!470878 (tuple2!16175 lt!470877 zeroValueAfter!47)) lt!470868)))

(declare-fun lt!470882 () Unit!34976)

(assert (=> b!1067278 (= lt!470882 lt!470873)))

(declare-fun lt!470884 () ListLongMap!14151)

(assert (=> b!1067278 (= lt!470884 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470865 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470865 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470885 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470885 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470879 () Unit!34976)

(declare-fun addApplyDifferent!495 (ListLongMap!14151 (_ BitVec 64) V!39057 (_ BitVec 64)) Unit!34976)

(assert (=> b!1067278 (= lt!470879 (addApplyDifferent!495 lt!470884 lt!470865 minValue!907 lt!470885))))

(declare-fun apply!932 (ListLongMap!14151 (_ BitVec 64)) V!39057)

(assert (=> b!1067278 (= (apply!932 (+!3162 lt!470884 (tuple2!16175 lt!470865 minValue!907)) lt!470885) (apply!932 lt!470884 lt!470885))))

(declare-fun lt!470870 () Unit!34976)

(assert (=> b!1067278 (= lt!470870 lt!470879)))

(declare-fun lt!470864 () ListLongMap!14151)

(assert (=> b!1067278 (= lt!470864 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470871 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470883 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470883 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470872 () Unit!34976)

(assert (=> b!1067278 (= lt!470872 (addApplyDifferent!495 lt!470864 lt!470871 zeroValueAfter!47 lt!470883))))

(assert (=> b!1067278 (= (apply!932 (+!3162 lt!470864 (tuple2!16175 lt!470871 zeroValueAfter!47)) lt!470883) (apply!932 lt!470864 lt!470883))))

(declare-fun lt!470876 () Unit!34976)

(assert (=> b!1067278 (= lt!470876 lt!470872)))

(declare-fun lt!470880 () ListLongMap!14151)

(assert (=> b!1067278 (= lt!470880 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470867 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470875 () (_ BitVec 64))

(assert (=> b!1067278 (= lt!470875 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1067278 (= lt!470866 (addApplyDifferent!495 lt!470880 lt!470867 minValue!907 lt!470875))))

(assert (=> b!1067278 (= (apply!932 (+!3162 lt!470880 (tuple2!16175 lt!470867 minValue!907)) lt!470875) (apply!932 lt!470880 lt!470875))))

(declare-fun bm!45095 () Bool)

(declare-fun call!45099 () ListLongMap!14151)

(declare-fun call!45100 () ListLongMap!14151)

(assert (=> bm!45095 (= call!45099 call!45100)))

(declare-fun b!1067279 () Bool)

(declare-fun e!608629 () Bool)

(declare-fun get!17058 (ValueCell!12017 V!39057) V!39057)

(declare-fun dynLambda!2047 (Int (_ BitVec 64)) V!39057)

(assert (=> b!1067279 (= e!608629 (= (apply!932 lt!470881 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)) (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1067279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33191 _values!955)))))

(assert (=> b!1067279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067280 () Bool)

(declare-fun c!107813 () Bool)

(assert (=> b!1067280 (= c!107813 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!608626 () ListLongMap!14151)

(declare-fun e!608627 () ListLongMap!14151)

(assert (=> b!1067280 (= e!608626 e!608627)))

(declare-fun bm!45096 () Bool)

(declare-fun call!45098 () Bool)

(assert (=> bm!45096 (= call!45098 (contains!6288 lt!470881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067281 () Bool)

(assert (=> b!1067281 (= e!608627 call!45099)))

(declare-fun b!1067282 () Bool)

(declare-fun e!608628 () ListLongMap!14151)

(declare-fun call!45102 () ListLongMap!14151)

(assert (=> b!1067282 (= e!608628 (+!3162 call!45102 (tuple2!16175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1067283 () Bool)

(declare-fun e!608618 () Bool)

(assert (=> b!1067283 (= e!608618 (not call!45098))))

(declare-fun b!1067284 () Bool)

(assert (=> b!1067284 (= e!608628 e!608626)))

(declare-fun c!107816 () Bool)

(assert (=> b!1067284 (= c!107816 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1067285 () Bool)

(declare-fun e!608622 () Bool)

(assert (=> b!1067285 (= e!608625 e!608622)))

(declare-fun res!712028 () Bool)

(assert (=> b!1067285 (= res!712028 call!45097)))

(assert (=> b!1067285 (=> (not res!712028) (not e!608622))))

(declare-fun d!129495 () Bool)

(declare-fun e!608620 () Bool)

(assert (=> d!129495 e!608620))

(declare-fun res!712024 () Bool)

(assert (=> d!129495 (=> (not res!712024) (not e!608620))))

(assert (=> d!129495 (= res!712024 (or (bvsge #b00000000000000000000000000000000 (size!33192 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))))

(declare-fun lt!470869 () ListLongMap!14151)

(assert (=> d!129495 (= lt!470881 lt!470869)))

(declare-fun lt!470874 () Unit!34976)

(assert (=> d!129495 (= lt!470874 e!608621)))

(declare-fun c!107818 () Bool)

(declare-fun e!608623 () Bool)

(assert (=> d!129495 (= c!107818 e!608623)))

(declare-fun res!712021 () Bool)

(assert (=> d!129495 (=> (not res!712021) (not e!608623))))

(assert (=> d!129495 (= res!712021 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> d!129495 (= lt!470869 e!608628)))

(declare-fun c!107817 () Bool)

(assert (=> d!129495 (= c!107817 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129495 (validMask!0 mask!1515)))

(assert (=> d!129495 (= (getCurrentListMap!4043 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470881)))

(declare-fun bm!45097 () Bool)

(declare-fun call!45103 () ListLongMap!14151)

(assert (=> bm!45097 (= call!45100 call!45103)))

(declare-fun bm!45098 () Bool)

(assert (=> bm!45098 (= call!45102 (+!3162 (ite c!107817 call!45103 (ite c!107816 call!45100 call!45099)) (ite (or c!107817 c!107816) (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1067286 () Bool)

(assert (=> b!1067286 (= e!608622 (= (apply!932 lt!470881 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1067287 () Bool)

(declare-fun res!712022 () Bool)

(assert (=> b!1067287 (=> (not res!712022) (not e!608620))))

(assert (=> b!1067287 (= res!712022 e!608625)))

(declare-fun c!107815 () Bool)

(assert (=> b!1067287 (= c!107815 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45099 () Bool)

(declare-fun call!45101 () ListLongMap!14151)

(assert (=> bm!45099 (= call!45101 call!45102)))

(declare-fun b!1067288 () Bool)

(assert (=> b!1067288 (= e!608623 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067289 () Bool)

(declare-fun e!608630 () Bool)

(assert (=> b!1067289 (= e!608630 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067290 () Bool)

(declare-fun res!712025 () Bool)

(assert (=> b!1067290 (=> (not res!712025) (not e!608620))))

(declare-fun e!608624 () Bool)

(assert (=> b!1067290 (= res!712025 e!608624)))

(declare-fun res!712029 () Bool)

(assert (=> b!1067290 (=> res!712029 e!608624)))

(assert (=> b!1067290 (= res!712029 (not e!608630))))

(declare-fun res!712023 () Bool)

(assert (=> b!1067290 (=> (not res!712023) (not e!608630))))

(assert (=> b!1067290 (= res!712023 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067291 () Bool)

(declare-fun e!608619 () Bool)

(assert (=> b!1067291 (= e!608619 (= (apply!932 lt!470881 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1067292 () Bool)

(assert (=> b!1067292 (= e!608626 call!45101)))

(declare-fun b!1067293 () Bool)

(declare-fun Unit!34980 () Unit!34976)

(assert (=> b!1067293 (= e!608621 Unit!34980)))

(declare-fun b!1067294 () Bool)

(assert (=> b!1067294 (= e!608627 call!45101)))

(declare-fun b!1067295 () Bool)

(assert (=> b!1067295 (= e!608618 e!608619)))

(declare-fun res!712027 () Bool)

(assert (=> b!1067295 (= res!712027 call!45098)))

(assert (=> b!1067295 (=> (not res!712027) (not e!608619))))

(declare-fun b!1067296 () Bool)

(assert (=> b!1067296 (= e!608620 e!608618)))

(declare-fun c!107814 () Bool)

(assert (=> b!1067296 (= c!107814 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45100 () Bool)

(assert (=> bm!45100 (= call!45103 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067297 () Bool)

(assert (=> b!1067297 (= e!608624 e!608629)))

(declare-fun res!712026 () Bool)

(assert (=> b!1067297 (=> (not res!712026) (not e!608629))))

(assert (=> b!1067297 (= res!712026 (contains!6288 lt!470881 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067297 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (= (and d!129495 c!107817) b!1067282))

(assert (= (and d!129495 (not c!107817)) b!1067284))

(assert (= (and b!1067284 c!107816) b!1067292))

(assert (= (and b!1067284 (not c!107816)) b!1067280))

(assert (= (and b!1067280 c!107813) b!1067294))

(assert (= (and b!1067280 (not c!107813)) b!1067281))

(assert (= (or b!1067294 b!1067281) bm!45095))

(assert (= (or b!1067292 bm!45095) bm!45097))

(assert (= (or b!1067292 b!1067294) bm!45099))

(assert (= (or b!1067282 bm!45097) bm!45100))

(assert (= (or b!1067282 bm!45099) bm!45098))

(assert (= (and d!129495 res!712021) b!1067288))

(assert (= (and d!129495 c!107818) b!1067278))

(assert (= (and d!129495 (not c!107818)) b!1067293))

(assert (= (and d!129495 res!712024) b!1067290))

(assert (= (and b!1067290 res!712023) b!1067289))

(assert (= (and b!1067290 (not res!712029)) b!1067297))

(assert (= (and b!1067297 res!712026) b!1067279))

(assert (= (and b!1067290 res!712025) b!1067287))

(assert (= (and b!1067287 c!107815) b!1067285))

(assert (= (and b!1067287 (not c!107815)) b!1067277))

(assert (= (and b!1067285 res!712028) b!1067286))

(assert (= (or b!1067285 b!1067277) bm!45094))

(assert (= (and b!1067287 res!712022) b!1067296))

(assert (= (and b!1067296 c!107814) b!1067295))

(assert (= (and b!1067296 (not c!107814)) b!1067283))

(assert (= (and b!1067295 res!712027) b!1067291))

(assert (= (or b!1067295 b!1067283) bm!45096))

(declare-fun b_lambda!16547 () Bool)

(assert (=> (not b_lambda!16547) (not b!1067279)))

(declare-fun t!32058 () Bool)

(declare-fun tb!7133 () Bool)

(assert (=> (and start!94482 (= defaultEntry!963 defaultEntry!963) t!32058) tb!7133))

(declare-fun result!14723 () Bool)

(assert (=> tb!7133 (= result!14723 tp_is_empty!25441)))

(assert (=> b!1067279 t!32058))

(declare-fun b_and!34407 () Bool)

(assert (= b_and!34401 (and (=> t!32058 result!14723) b_and!34407)))

(assert (=> d!129495 m!986075))

(assert (=> b!1067279 m!986141))

(declare-fun m!986169 () Bool)

(assert (=> b!1067279 m!986169))

(declare-fun m!986171 () Bool)

(assert (=> b!1067279 m!986171))

(declare-fun m!986173 () Bool)

(assert (=> b!1067279 m!986173))

(declare-fun m!986175 () Bool)

(assert (=> b!1067279 m!986175))

(assert (=> b!1067279 m!986171))

(assert (=> b!1067279 m!986141))

(assert (=> b!1067279 m!986173))

(declare-fun m!986177 () Bool)

(assert (=> b!1067282 m!986177))

(declare-fun m!986179 () Bool)

(assert (=> b!1067278 m!986179))

(declare-fun m!986181 () Bool)

(assert (=> b!1067278 m!986181))

(declare-fun m!986183 () Bool)

(assert (=> b!1067278 m!986183))

(declare-fun m!986185 () Bool)

(assert (=> b!1067278 m!986185))

(declare-fun m!986187 () Bool)

(assert (=> b!1067278 m!986187))

(assert (=> b!1067278 m!986141))

(declare-fun m!986189 () Bool)

(assert (=> b!1067278 m!986189))

(declare-fun m!986191 () Bool)

(assert (=> b!1067278 m!986191))

(declare-fun m!986193 () Bool)

(assert (=> b!1067278 m!986193))

(declare-fun m!986195 () Bool)

(assert (=> b!1067278 m!986195))

(declare-fun m!986197 () Bool)

(assert (=> b!1067278 m!986197))

(declare-fun m!986199 () Bool)

(assert (=> b!1067278 m!986199))

(declare-fun m!986201 () Bool)

(assert (=> b!1067278 m!986201))

(assert (=> b!1067278 m!986053))

(assert (=> b!1067278 m!986197))

(declare-fun m!986203 () Bool)

(assert (=> b!1067278 m!986203))

(declare-fun m!986205 () Bool)

(assert (=> b!1067278 m!986205))

(assert (=> b!1067278 m!986189))

(assert (=> b!1067278 m!986183))

(assert (=> b!1067278 m!986205))

(declare-fun m!986207 () Bool)

(assert (=> b!1067278 m!986207))

(declare-fun m!986209 () Bool)

(assert (=> b!1067286 m!986209))

(assert (=> bm!45100 m!986053))

(assert (=> b!1067297 m!986141))

(assert (=> b!1067297 m!986141))

(declare-fun m!986211 () Bool)

(assert (=> b!1067297 m!986211))

(declare-fun m!986213 () Bool)

(assert (=> bm!45098 m!986213))

(declare-fun m!986215 () Bool)

(assert (=> bm!45096 m!986215))

(assert (=> b!1067288 m!986141))

(assert (=> b!1067288 m!986141))

(assert (=> b!1067288 m!986149))

(declare-fun m!986217 () Bool)

(assert (=> b!1067291 m!986217))

(declare-fun m!986219 () Bool)

(assert (=> bm!45094 m!986219))

(assert (=> b!1067289 m!986141))

(assert (=> b!1067289 m!986141))

(assert (=> b!1067289 m!986149))

(assert (=> b!1067156 d!129495))

(declare-fun d!129497 () Bool)

(declare-fun lt!470886 () ListLongMap!14151)

(assert (=> d!129497 (not (contains!6288 lt!470886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129497 (= lt!470886 (ListLongMap!14152 (removeStrictlySorted!68 (toList!7091 lt!470752) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129497 (= (-!609 lt!470752 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470886)))

(declare-fun bs!31381 () Bool)

(assert (= bs!31381 d!129497))

(declare-fun m!986221 () Bool)

(assert (=> bs!31381 m!986221))

(declare-fun m!986223 () Bool)

(assert (=> bs!31381 m!986223))

(assert (=> b!1067156 d!129497))

(declare-fun d!129499 () Bool)

(assert (=> d!129499 (= (-!609 (+!3162 lt!470748 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!470748)))

(declare-fun lt!470889 () Unit!34976)

(declare-fun choose!1734 (ListLongMap!14151 (_ BitVec 64) V!39057) Unit!34976)

(assert (=> d!129499 (= lt!470889 (choose!1734 lt!470748 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129499 (not (contains!6288 lt!470748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129499 (= (addThenRemoveForNewKeyIsSame!19 lt!470748 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!470889)))

(declare-fun bs!31382 () Bool)

(assert (= bs!31382 d!129499))

(assert (=> bs!31382 m!986073))

(assert (=> bs!31382 m!986073))

(declare-fun m!986225 () Bool)

(assert (=> bs!31382 m!986225))

(declare-fun m!986227 () Bool)

(assert (=> bs!31382 m!986227))

(declare-fun m!986229 () Bool)

(assert (=> bs!31382 m!986229))

(assert (=> b!1067156 d!129499))

(declare-fun b!1067300 () Bool)

(declare-fun e!608638 () Bool)

(declare-fun call!45104 () Bool)

(assert (=> b!1067300 (= e!608638 (not call!45104))))

(declare-fun bm!45101 () Bool)

(declare-fun lt!470907 () ListLongMap!14151)

(assert (=> bm!45101 (= call!45104 (contains!6288 lt!470907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067301 () Bool)

(declare-fun e!608634 () Unit!34976)

(declare-fun lt!470892 () Unit!34976)

(assert (=> b!1067301 (= e!608634 lt!470892)))

(declare-fun lt!470904 () ListLongMap!14151)

(assert (=> b!1067301 (= lt!470904 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470903 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470894 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470894 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470899 () Unit!34976)

(assert (=> b!1067301 (= lt!470899 (addStillContains!639 lt!470904 lt!470903 zeroValueBefore!47 lt!470894))))

(assert (=> b!1067301 (contains!6288 (+!3162 lt!470904 (tuple2!16175 lt!470903 zeroValueBefore!47)) lt!470894)))

(declare-fun lt!470908 () Unit!34976)

(assert (=> b!1067301 (= lt!470908 lt!470899)))

(declare-fun lt!470910 () ListLongMap!14151)

(assert (=> b!1067301 (= lt!470910 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470891 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470891 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470911 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470911 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470905 () Unit!34976)

(assert (=> b!1067301 (= lt!470905 (addApplyDifferent!495 lt!470910 lt!470891 minValue!907 lt!470911))))

(assert (=> b!1067301 (= (apply!932 (+!3162 lt!470910 (tuple2!16175 lt!470891 minValue!907)) lt!470911) (apply!932 lt!470910 lt!470911))))

(declare-fun lt!470896 () Unit!34976)

(assert (=> b!1067301 (= lt!470896 lt!470905)))

(declare-fun lt!470890 () ListLongMap!14151)

(assert (=> b!1067301 (= lt!470890 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470897 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470897 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470909 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470909 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470898 () Unit!34976)

(assert (=> b!1067301 (= lt!470898 (addApplyDifferent!495 lt!470890 lt!470897 zeroValueBefore!47 lt!470909))))

(assert (=> b!1067301 (= (apply!932 (+!3162 lt!470890 (tuple2!16175 lt!470897 zeroValueBefore!47)) lt!470909) (apply!932 lt!470890 lt!470909))))

(declare-fun lt!470902 () Unit!34976)

(assert (=> b!1067301 (= lt!470902 lt!470898)))

(declare-fun lt!470906 () ListLongMap!14151)

(assert (=> b!1067301 (= lt!470906 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470893 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470893 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470901 () (_ BitVec 64))

(assert (=> b!1067301 (= lt!470901 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1067301 (= lt!470892 (addApplyDifferent!495 lt!470906 lt!470893 minValue!907 lt!470901))))

(assert (=> b!1067301 (= (apply!932 (+!3162 lt!470906 (tuple2!16175 lt!470893 minValue!907)) lt!470901) (apply!932 lt!470906 lt!470901))))

(declare-fun bm!45102 () Bool)

(declare-fun call!45106 () ListLongMap!14151)

(declare-fun call!45107 () ListLongMap!14151)

(assert (=> bm!45102 (= call!45106 call!45107)))

(declare-fun b!1067302 () Bool)

(declare-fun e!608642 () Bool)

(assert (=> b!1067302 (= e!608642 (= (apply!932 lt!470907 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)) (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1067302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33191 _values!955)))))

(assert (=> b!1067302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067303 () Bool)

(declare-fun c!107819 () Bool)

(assert (=> b!1067303 (= c!107819 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!608639 () ListLongMap!14151)

(declare-fun e!608640 () ListLongMap!14151)

(assert (=> b!1067303 (= e!608639 e!608640)))

(declare-fun bm!45103 () Bool)

(declare-fun call!45105 () Bool)

(assert (=> bm!45103 (= call!45105 (contains!6288 lt!470907 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067304 () Bool)

(assert (=> b!1067304 (= e!608640 call!45106)))

(declare-fun b!1067305 () Bool)

(declare-fun e!608641 () ListLongMap!14151)

(declare-fun call!45109 () ListLongMap!14151)

(assert (=> b!1067305 (= e!608641 (+!3162 call!45109 (tuple2!16175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1067306 () Bool)

(declare-fun e!608631 () Bool)

(assert (=> b!1067306 (= e!608631 (not call!45105))))

(declare-fun b!1067307 () Bool)

(assert (=> b!1067307 (= e!608641 e!608639)))

(declare-fun c!107822 () Bool)

(assert (=> b!1067307 (= c!107822 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1067308 () Bool)

(declare-fun e!608635 () Bool)

(assert (=> b!1067308 (= e!608638 e!608635)))

(declare-fun res!712037 () Bool)

(assert (=> b!1067308 (= res!712037 call!45104)))

(assert (=> b!1067308 (=> (not res!712037) (not e!608635))))

(declare-fun d!129501 () Bool)

(declare-fun e!608633 () Bool)

(assert (=> d!129501 e!608633))

(declare-fun res!712033 () Bool)

(assert (=> d!129501 (=> (not res!712033) (not e!608633))))

(assert (=> d!129501 (= res!712033 (or (bvsge #b00000000000000000000000000000000 (size!33192 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))))

(declare-fun lt!470895 () ListLongMap!14151)

(assert (=> d!129501 (= lt!470907 lt!470895)))

(declare-fun lt!470900 () Unit!34976)

(assert (=> d!129501 (= lt!470900 e!608634)))

(declare-fun c!107824 () Bool)

(declare-fun e!608636 () Bool)

(assert (=> d!129501 (= c!107824 e!608636)))

(declare-fun res!712030 () Bool)

(assert (=> d!129501 (=> (not res!712030) (not e!608636))))

(assert (=> d!129501 (= res!712030 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> d!129501 (= lt!470895 e!608641)))

(declare-fun c!107823 () Bool)

(assert (=> d!129501 (= c!107823 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129501 (validMask!0 mask!1515)))

(assert (=> d!129501 (= (getCurrentListMap!4043 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470907)))

(declare-fun bm!45104 () Bool)

(declare-fun call!45110 () ListLongMap!14151)

(assert (=> bm!45104 (= call!45107 call!45110)))

(declare-fun bm!45105 () Bool)

(assert (=> bm!45105 (= call!45109 (+!3162 (ite c!107823 call!45110 (ite c!107822 call!45107 call!45106)) (ite (or c!107823 c!107822) (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1067309 () Bool)

(assert (=> b!1067309 (= e!608635 (= (apply!932 lt!470907 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1067310 () Bool)

(declare-fun res!712031 () Bool)

(assert (=> b!1067310 (=> (not res!712031) (not e!608633))))

(assert (=> b!1067310 (= res!712031 e!608638)))

(declare-fun c!107821 () Bool)

(assert (=> b!1067310 (= c!107821 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45106 () Bool)

(declare-fun call!45108 () ListLongMap!14151)

(assert (=> bm!45106 (= call!45108 call!45109)))

(declare-fun b!1067311 () Bool)

(assert (=> b!1067311 (= e!608636 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067312 () Bool)

(declare-fun e!608643 () Bool)

(assert (=> b!1067312 (= e!608643 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067313 () Bool)

(declare-fun res!712034 () Bool)

(assert (=> b!1067313 (=> (not res!712034) (not e!608633))))

(declare-fun e!608637 () Bool)

(assert (=> b!1067313 (= res!712034 e!608637)))

(declare-fun res!712038 () Bool)

(assert (=> b!1067313 (=> res!712038 e!608637)))

(assert (=> b!1067313 (= res!712038 (not e!608643))))

(declare-fun res!712032 () Bool)

(assert (=> b!1067313 (=> (not res!712032) (not e!608643))))

(assert (=> b!1067313 (= res!712032 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067314 () Bool)

(declare-fun e!608632 () Bool)

(assert (=> b!1067314 (= e!608632 (= (apply!932 lt!470907 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1067315 () Bool)

(assert (=> b!1067315 (= e!608639 call!45108)))

(declare-fun b!1067316 () Bool)

(declare-fun Unit!34981 () Unit!34976)

(assert (=> b!1067316 (= e!608634 Unit!34981)))

(declare-fun b!1067317 () Bool)

(assert (=> b!1067317 (= e!608640 call!45108)))

(declare-fun b!1067318 () Bool)

(assert (=> b!1067318 (= e!608631 e!608632)))

(declare-fun res!712036 () Bool)

(assert (=> b!1067318 (= res!712036 call!45105)))

(assert (=> b!1067318 (=> (not res!712036) (not e!608632))))

(declare-fun b!1067319 () Bool)

(assert (=> b!1067319 (= e!608633 e!608631)))

(declare-fun c!107820 () Bool)

(assert (=> b!1067319 (= c!107820 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45107 () Bool)

(assert (=> bm!45107 (= call!45110 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067320 () Bool)

(assert (=> b!1067320 (= e!608637 e!608642)))

(declare-fun res!712035 () Bool)

(assert (=> b!1067320 (=> (not res!712035) (not e!608642))))

(assert (=> b!1067320 (= res!712035 (contains!6288 lt!470907 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (= (and d!129501 c!107823) b!1067305))

(assert (= (and d!129501 (not c!107823)) b!1067307))

(assert (= (and b!1067307 c!107822) b!1067315))

(assert (= (and b!1067307 (not c!107822)) b!1067303))

(assert (= (and b!1067303 c!107819) b!1067317))

(assert (= (and b!1067303 (not c!107819)) b!1067304))

(assert (= (or b!1067317 b!1067304) bm!45102))

(assert (= (or b!1067315 bm!45102) bm!45104))

(assert (= (or b!1067315 b!1067317) bm!45106))

(assert (= (or b!1067305 bm!45104) bm!45107))

(assert (= (or b!1067305 bm!45106) bm!45105))

(assert (= (and d!129501 res!712030) b!1067311))

(assert (= (and d!129501 c!107824) b!1067301))

(assert (= (and d!129501 (not c!107824)) b!1067316))

(assert (= (and d!129501 res!712033) b!1067313))

(assert (= (and b!1067313 res!712032) b!1067312))

(assert (= (and b!1067313 (not res!712038)) b!1067320))

(assert (= (and b!1067320 res!712035) b!1067302))

(assert (= (and b!1067313 res!712034) b!1067310))

(assert (= (and b!1067310 c!107821) b!1067308))

(assert (= (and b!1067310 (not c!107821)) b!1067300))

(assert (= (and b!1067308 res!712037) b!1067309))

(assert (= (or b!1067308 b!1067300) bm!45101))

(assert (= (and b!1067310 res!712031) b!1067319))

(assert (= (and b!1067319 c!107820) b!1067318))

(assert (= (and b!1067319 (not c!107820)) b!1067306))

(assert (= (and b!1067318 res!712036) b!1067314))

(assert (= (or b!1067318 b!1067306) bm!45103))

(declare-fun b_lambda!16549 () Bool)

(assert (=> (not b_lambda!16549) (not b!1067302)))

(assert (=> b!1067302 t!32058))

(declare-fun b_and!34409 () Bool)

(assert (= b_and!34407 (and (=> t!32058 result!14723) b_and!34409)))

(assert (=> d!129501 m!986075))

(assert (=> b!1067302 m!986141))

(declare-fun m!986231 () Bool)

(assert (=> b!1067302 m!986231))

(assert (=> b!1067302 m!986171))

(assert (=> b!1067302 m!986173))

(assert (=> b!1067302 m!986175))

(assert (=> b!1067302 m!986171))

(assert (=> b!1067302 m!986141))

(assert (=> b!1067302 m!986173))

(declare-fun m!986233 () Bool)

(assert (=> b!1067305 m!986233))

(declare-fun m!986235 () Bool)

(assert (=> b!1067301 m!986235))

(declare-fun m!986237 () Bool)

(assert (=> b!1067301 m!986237))

(declare-fun m!986239 () Bool)

(assert (=> b!1067301 m!986239))

(declare-fun m!986241 () Bool)

(assert (=> b!1067301 m!986241))

(declare-fun m!986243 () Bool)

(assert (=> b!1067301 m!986243))

(assert (=> b!1067301 m!986141))

(declare-fun m!986245 () Bool)

(assert (=> b!1067301 m!986245))

(declare-fun m!986247 () Bool)

(assert (=> b!1067301 m!986247))

(declare-fun m!986249 () Bool)

(assert (=> b!1067301 m!986249))

(declare-fun m!986251 () Bool)

(assert (=> b!1067301 m!986251))

(declare-fun m!986253 () Bool)

(assert (=> b!1067301 m!986253))

(declare-fun m!986255 () Bool)

(assert (=> b!1067301 m!986255))

(declare-fun m!986257 () Bool)

(assert (=> b!1067301 m!986257))

(assert (=> b!1067301 m!986055))

(assert (=> b!1067301 m!986253))

(declare-fun m!986259 () Bool)

(assert (=> b!1067301 m!986259))

(declare-fun m!986261 () Bool)

(assert (=> b!1067301 m!986261))

(assert (=> b!1067301 m!986245))

(assert (=> b!1067301 m!986239))

(assert (=> b!1067301 m!986261))

(declare-fun m!986263 () Bool)

(assert (=> b!1067301 m!986263))

(declare-fun m!986265 () Bool)

(assert (=> b!1067309 m!986265))

(assert (=> bm!45107 m!986055))

(assert (=> b!1067320 m!986141))

(assert (=> b!1067320 m!986141))

(declare-fun m!986267 () Bool)

(assert (=> b!1067320 m!986267))

(declare-fun m!986269 () Bool)

(assert (=> bm!45105 m!986269))

(declare-fun m!986271 () Bool)

(assert (=> bm!45103 m!986271))

(assert (=> b!1067311 m!986141))

(assert (=> b!1067311 m!986141))

(assert (=> b!1067311 m!986149))

(declare-fun m!986273 () Bool)

(assert (=> b!1067314 m!986273))

(declare-fun m!986275 () Bool)

(assert (=> bm!45101 m!986275))

(assert (=> b!1067312 m!986141))

(assert (=> b!1067312 m!986141))

(assert (=> b!1067312 m!986149))

(assert (=> b!1067156 d!129501))

(declare-fun d!129503 () Bool)

(assert (=> d!129503 (= (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470914 () Unit!34976)

(declare-fun choose!1735 (array!67917 array!67915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 V!39057 V!39057 (_ BitVec 32) Int) Unit!34976)

(assert (=> d!129503 (= lt!470914 (choose!1735 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129503 (validMask!0 mask!1515)))

(assert (=> d!129503 (= (lemmaNoChangeToArrayThenSameMapNoExtras!717 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470914)))

(declare-fun bs!31383 () Bool)

(assert (= bs!31383 d!129503))

(assert (=> bs!31383 m!986055))

(assert (=> bs!31383 m!986053))

(declare-fun m!986277 () Bool)

(assert (=> bs!31383 m!986277))

(assert (=> bs!31383 m!986075))

(assert (=> b!1067158 d!129503))

(declare-fun b!1067345 () Bool)

(declare-fun lt!470934 () Unit!34976)

(declare-fun lt!470930 () Unit!34976)

(assert (=> b!1067345 (= lt!470934 lt!470930)))

(declare-fun lt!470929 () ListLongMap!14151)

(declare-fun lt!470933 () (_ BitVec 64))

(declare-fun lt!470932 () (_ BitVec 64))

(declare-fun lt!470935 () V!39057)

(assert (=> b!1067345 (not (contains!6288 (+!3162 lt!470929 (tuple2!16175 lt!470933 lt!470935)) lt!470932))))

(declare-fun addStillNotContains!253 (ListLongMap!14151 (_ BitVec 64) V!39057 (_ BitVec 64)) Unit!34976)

(assert (=> b!1067345 (= lt!470930 (addStillNotContains!253 lt!470929 lt!470933 lt!470935 lt!470932))))

(assert (=> b!1067345 (= lt!470932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1067345 (= lt!470935 (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1067345 (= lt!470933 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45113 () ListLongMap!14151)

(assert (=> b!1067345 (= lt!470929 call!45113)))

(declare-fun e!608662 () ListLongMap!14151)

(assert (=> b!1067345 (= e!608662 (+!3162 call!45113 (tuple2!16175 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000) (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1067346 () Bool)

(declare-fun e!608659 () ListLongMap!14151)

(assert (=> b!1067346 (= e!608659 e!608662)))

(declare-fun c!107835 () Bool)

(assert (=> b!1067346 (= c!107835 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067347 () Bool)

(declare-fun e!608660 () Bool)

(declare-fun e!608661 () Bool)

(assert (=> b!1067347 (= e!608660 e!608661)))

(declare-fun c!107836 () Bool)

(assert (=> b!1067347 (= c!107836 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067348 () Bool)

(declare-fun e!608658 () Bool)

(assert (=> b!1067348 (= e!608660 e!608658)))

(assert (=> b!1067348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun res!712050 () Bool)

(declare-fun lt!470931 () ListLongMap!14151)

(assert (=> b!1067348 (= res!712050 (contains!6288 lt!470931 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067348 (=> (not res!712050) (not e!608658))))

(declare-fun b!1067349 () Bool)

(declare-fun res!712049 () Bool)

(declare-fun e!608663 () Bool)

(assert (=> b!1067349 (=> (not res!712049) (not e!608663))))

(assert (=> b!1067349 (= res!712049 (not (contains!6288 lt!470931 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1067350 () Bool)

(declare-fun isEmpty!945 (ListLongMap!14151) Bool)

(assert (=> b!1067350 (= e!608661 (isEmpty!945 lt!470931))))

(declare-fun b!1067351 () Bool)

(assert (=> b!1067351 (= e!608662 call!45113)))

(declare-fun d!129505 () Bool)

(assert (=> d!129505 e!608663))

(declare-fun res!712047 () Bool)

(assert (=> d!129505 (=> (not res!712047) (not e!608663))))

(assert (=> d!129505 (= res!712047 (not (contains!6288 lt!470931 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129505 (= lt!470931 e!608659)))

(declare-fun c!107833 () Bool)

(assert (=> d!129505 (= c!107833 (bvsge #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> d!129505 (validMask!0 mask!1515)))

(assert (=> d!129505 (= (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470931)))

(declare-fun b!1067352 () Bool)

(assert (=> b!1067352 (= e!608663 e!608660)))

(declare-fun c!107834 () Bool)

(declare-fun e!608664 () Bool)

(assert (=> b!1067352 (= c!107834 e!608664)))

(declare-fun res!712048 () Bool)

(assert (=> b!1067352 (=> (not res!712048) (not e!608664))))

(assert (=> b!1067352 (= res!712048 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067353 () Bool)

(assert (=> b!1067353 (= e!608664 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067353 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45110 () Bool)

(assert (=> bm!45110 (= call!45113 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1067354 () Bool)

(assert (=> b!1067354 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> b!1067354 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33191 _values!955)))))

(assert (=> b!1067354 (= e!608658 (= (apply!932 lt!470931 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)) (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1067355 () Bool)

(assert (=> b!1067355 (= e!608661 (= lt!470931 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1067356 () Bool)

(assert (=> b!1067356 (= e!608659 (ListLongMap!14152 Nil!22740))))

(assert (= (and d!129505 c!107833) b!1067356))

(assert (= (and d!129505 (not c!107833)) b!1067346))

(assert (= (and b!1067346 c!107835) b!1067345))

(assert (= (and b!1067346 (not c!107835)) b!1067351))

(assert (= (or b!1067345 b!1067351) bm!45110))

(assert (= (and d!129505 res!712047) b!1067349))

(assert (= (and b!1067349 res!712049) b!1067352))

(assert (= (and b!1067352 res!712048) b!1067353))

(assert (= (and b!1067352 c!107834) b!1067348))

(assert (= (and b!1067352 (not c!107834)) b!1067347))

(assert (= (and b!1067348 res!712050) b!1067354))

(assert (= (and b!1067347 c!107836) b!1067355))

(assert (= (and b!1067347 (not c!107836)) b!1067350))

(declare-fun b_lambda!16551 () Bool)

(assert (=> (not b_lambda!16551) (not b!1067345)))

(assert (=> b!1067345 t!32058))

(declare-fun b_and!34411 () Bool)

(assert (= b_and!34409 (and (=> t!32058 result!14723) b_and!34411)))

(declare-fun b_lambda!16553 () Bool)

(assert (=> (not b_lambda!16553) (not b!1067354)))

(assert (=> b!1067354 t!32058))

(declare-fun b_and!34413 () Bool)

(assert (= b_and!34411 (and (=> t!32058 result!14723) b_and!34413)))

(declare-fun m!986279 () Bool)

(assert (=> bm!45110 m!986279))

(assert (=> b!1067345 m!986141))

(declare-fun m!986281 () Bool)

(assert (=> b!1067345 m!986281))

(assert (=> b!1067345 m!986173))

(declare-fun m!986283 () Bool)

(assert (=> b!1067345 m!986283))

(assert (=> b!1067345 m!986171))

(assert (=> b!1067345 m!986173))

(assert (=> b!1067345 m!986175))

(assert (=> b!1067345 m!986171))

(declare-fun m!986285 () Bool)

(assert (=> b!1067345 m!986285))

(assert (=> b!1067345 m!986283))

(declare-fun m!986287 () Bool)

(assert (=> b!1067345 m!986287))

(assert (=> b!1067348 m!986141))

(assert (=> b!1067348 m!986141))

(declare-fun m!986289 () Bool)

(assert (=> b!1067348 m!986289))

(assert (=> b!1067353 m!986141))

(assert (=> b!1067353 m!986141))

(assert (=> b!1067353 m!986149))

(assert (=> b!1067354 m!986141))

(assert (=> b!1067354 m!986141))

(declare-fun m!986291 () Bool)

(assert (=> b!1067354 m!986291))

(assert (=> b!1067354 m!986173))

(assert (=> b!1067354 m!986171))

(assert (=> b!1067354 m!986173))

(assert (=> b!1067354 m!986175))

(assert (=> b!1067354 m!986171))

(assert (=> b!1067355 m!986279))

(declare-fun m!986293 () Bool)

(assert (=> d!129505 m!986293))

(assert (=> d!129505 m!986075))

(declare-fun m!986295 () Bool)

(assert (=> b!1067350 m!986295))

(assert (=> b!1067346 m!986141))

(assert (=> b!1067346 m!986141))

(assert (=> b!1067346 m!986149))

(declare-fun m!986297 () Bool)

(assert (=> b!1067349 m!986297))

(assert (=> b!1067158 d!129505))

(declare-fun b!1067357 () Bool)

(declare-fun lt!470941 () Unit!34976)

(declare-fun lt!470937 () Unit!34976)

(assert (=> b!1067357 (= lt!470941 lt!470937)))

(declare-fun lt!470936 () ListLongMap!14151)

(declare-fun lt!470939 () (_ BitVec 64))

(declare-fun lt!470942 () V!39057)

(declare-fun lt!470940 () (_ BitVec 64))

(assert (=> b!1067357 (not (contains!6288 (+!3162 lt!470936 (tuple2!16175 lt!470940 lt!470942)) lt!470939))))

(assert (=> b!1067357 (= lt!470937 (addStillNotContains!253 lt!470936 lt!470940 lt!470942 lt!470939))))

(assert (=> b!1067357 (= lt!470939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1067357 (= lt!470942 (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1067357 (= lt!470940 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45114 () ListLongMap!14151)

(assert (=> b!1067357 (= lt!470936 call!45114)))

(declare-fun e!608669 () ListLongMap!14151)

(assert (=> b!1067357 (= e!608669 (+!3162 call!45114 (tuple2!16175 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000) (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1067358 () Bool)

(declare-fun e!608666 () ListLongMap!14151)

(assert (=> b!1067358 (= e!608666 e!608669)))

(declare-fun c!107839 () Bool)

(assert (=> b!1067358 (= c!107839 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067359 () Bool)

(declare-fun e!608667 () Bool)

(declare-fun e!608668 () Bool)

(assert (=> b!1067359 (= e!608667 e!608668)))

(declare-fun c!107840 () Bool)

(assert (=> b!1067359 (= c!107840 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067360 () Bool)

(declare-fun e!608665 () Bool)

(assert (=> b!1067360 (= e!608667 e!608665)))

(assert (=> b!1067360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun res!712054 () Bool)

(declare-fun lt!470938 () ListLongMap!14151)

(assert (=> b!1067360 (= res!712054 (contains!6288 lt!470938 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067360 (=> (not res!712054) (not e!608665))))

(declare-fun b!1067361 () Bool)

(declare-fun res!712053 () Bool)

(declare-fun e!608670 () Bool)

(assert (=> b!1067361 (=> (not res!712053) (not e!608670))))

(assert (=> b!1067361 (= res!712053 (not (contains!6288 lt!470938 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1067362 () Bool)

(assert (=> b!1067362 (= e!608668 (isEmpty!945 lt!470938))))

(declare-fun b!1067363 () Bool)

(assert (=> b!1067363 (= e!608669 call!45114)))

(declare-fun d!129507 () Bool)

(assert (=> d!129507 e!608670))

(declare-fun res!712051 () Bool)

(assert (=> d!129507 (=> (not res!712051) (not e!608670))))

(assert (=> d!129507 (= res!712051 (not (contains!6288 lt!470938 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129507 (= lt!470938 e!608666)))

(declare-fun c!107837 () Bool)

(assert (=> d!129507 (= c!107837 (bvsge #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> d!129507 (validMask!0 mask!1515)))

(assert (=> d!129507 (= (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470938)))

(declare-fun b!1067364 () Bool)

(assert (=> b!1067364 (= e!608670 e!608667)))

(declare-fun c!107838 () Bool)

(declare-fun e!608671 () Bool)

(assert (=> b!1067364 (= c!107838 e!608671)))

(declare-fun res!712052 () Bool)

(assert (=> b!1067364 (=> (not res!712052) (not e!608671))))

(assert (=> b!1067364 (= res!712052 (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(declare-fun b!1067365 () Bool)

(assert (=> b!1067365 (= e!608671 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067365 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45111 () Bool)

(assert (=> bm!45111 (= call!45114 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1067366 () Bool)

(assert (=> b!1067366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> b!1067366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33191 _values!955)))))

(assert (=> b!1067366 (= e!608665 (= (apply!932 lt!470938 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)) (get!17058 (select (arr!32654 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1067367 () Bool)

(assert (=> b!1067367 (= e!608668 (= lt!470938 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1067368 () Bool)

(assert (=> b!1067368 (= e!608666 (ListLongMap!14152 Nil!22740))))

(assert (= (and d!129507 c!107837) b!1067368))

(assert (= (and d!129507 (not c!107837)) b!1067358))

(assert (= (and b!1067358 c!107839) b!1067357))

(assert (= (and b!1067358 (not c!107839)) b!1067363))

(assert (= (or b!1067357 b!1067363) bm!45111))

(assert (= (and d!129507 res!712051) b!1067361))

(assert (= (and b!1067361 res!712053) b!1067364))

(assert (= (and b!1067364 res!712052) b!1067365))

(assert (= (and b!1067364 c!107838) b!1067360))

(assert (= (and b!1067364 (not c!107838)) b!1067359))

(assert (= (and b!1067360 res!712054) b!1067366))

(assert (= (and b!1067359 c!107840) b!1067367))

(assert (= (and b!1067359 (not c!107840)) b!1067362))

(declare-fun b_lambda!16555 () Bool)

(assert (=> (not b_lambda!16555) (not b!1067357)))

(assert (=> b!1067357 t!32058))

(declare-fun b_and!34415 () Bool)

(assert (= b_and!34413 (and (=> t!32058 result!14723) b_and!34415)))

(declare-fun b_lambda!16557 () Bool)

(assert (=> (not b_lambda!16557) (not b!1067366)))

(assert (=> b!1067366 t!32058))

(declare-fun b_and!34417 () Bool)

(assert (= b_and!34415 (and (=> t!32058 result!14723) b_and!34417)))

(declare-fun m!986299 () Bool)

(assert (=> bm!45111 m!986299))

(assert (=> b!1067357 m!986141))

(declare-fun m!986301 () Bool)

(assert (=> b!1067357 m!986301))

(assert (=> b!1067357 m!986173))

(declare-fun m!986303 () Bool)

(assert (=> b!1067357 m!986303))

(assert (=> b!1067357 m!986171))

(assert (=> b!1067357 m!986173))

(assert (=> b!1067357 m!986175))

(assert (=> b!1067357 m!986171))

(declare-fun m!986305 () Bool)

(assert (=> b!1067357 m!986305))

(assert (=> b!1067357 m!986303))

(declare-fun m!986307 () Bool)

(assert (=> b!1067357 m!986307))

(assert (=> b!1067360 m!986141))

(assert (=> b!1067360 m!986141))

(declare-fun m!986309 () Bool)

(assert (=> b!1067360 m!986309))

(assert (=> b!1067365 m!986141))

(assert (=> b!1067365 m!986141))

(assert (=> b!1067365 m!986149))

(assert (=> b!1067366 m!986141))

(assert (=> b!1067366 m!986141))

(declare-fun m!986311 () Bool)

(assert (=> b!1067366 m!986311))

(assert (=> b!1067366 m!986173))

(assert (=> b!1067366 m!986171))

(assert (=> b!1067366 m!986173))

(assert (=> b!1067366 m!986175))

(assert (=> b!1067366 m!986171))

(assert (=> b!1067367 m!986299))

(declare-fun m!986313 () Bool)

(assert (=> d!129507 m!986313))

(assert (=> d!129507 m!986075))

(declare-fun m!986315 () Bool)

(assert (=> b!1067362 m!986315))

(assert (=> b!1067358 m!986141))

(assert (=> b!1067358 m!986141))

(assert (=> b!1067358 m!986149))

(declare-fun m!986317 () Bool)

(assert (=> b!1067361 m!986317))

(assert (=> b!1067158 d!129507))

(declare-fun bm!45114 () Bool)

(declare-fun call!45117 () Bool)

(declare-fun c!107843 () Bool)

(assert (=> bm!45114 (= call!45117 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107843 (Cons!22740 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000) Nil!22741) Nil!22741)))))

(declare-fun b!1067379 () Bool)

(declare-fun e!608683 () Bool)

(declare-fun e!608682 () Bool)

(assert (=> b!1067379 (= e!608683 e!608682)))

(declare-fun res!712062 () Bool)

(assert (=> b!1067379 (=> (not res!712062) (not e!608682))))

(declare-fun e!608681 () Bool)

(assert (=> b!1067379 (= res!712062 (not e!608681))))

(declare-fun res!712063 () Bool)

(assert (=> b!1067379 (=> (not res!712063) (not e!608681))))

(assert (=> b!1067379 (= res!712063 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067380 () Bool)

(declare-fun e!608680 () Bool)

(assert (=> b!1067380 (= e!608680 call!45117)))

(declare-fun b!1067381 () Bool)

(assert (=> b!1067381 (= e!608682 e!608680)))

(assert (=> b!1067381 (= c!107843 (validKeyInArray!0 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129509 () Bool)

(declare-fun res!712061 () Bool)

(assert (=> d!129509 (=> res!712061 e!608683)))

(assert (=> d!129509 (= res!712061 (bvsge #b00000000000000000000000000000000 (size!33192 _keys!1163)))))

(assert (=> d!129509 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22741) e!608683)))

(declare-fun b!1067382 () Bool)

(declare-fun contains!6290 (List!22744 (_ BitVec 64)) Bool)

(assert (=> b!1067382 (= e!608681 (contains!6290 Nil!22741 (select (arr!32655 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067383 () Bool)

(assert (=> b!1067383 (= e!608680 call!45117)))

(assert (= (and d!129509 (not res!712061)) b!1067379))

(assert (= (and b!1067379 res!712063) b!1067382))

(assert (= (and b!1067379 res!712062) b!1067381))

(assert (= (and b!1067381 c!107843) b!1067380))

(assert (= (and b!1067381 (not c!107843)) b!1067383))

(assert (= (or b!1067380 b!1067383) bm!45114))

(assert (=> bm!45114 m!986141))

(declare-fun m!986319 () Bool)

(assert (=> bm!45114 m!986319))

(assert (=> b!1067379 m!986141))

(assert (=> b!1067379 m!986141))

(assert (=> b!1067379 m!986149))

(assert (=> b!1067381 m!986141))

(assert (=> b!1067381 m!986141))

(assert (=> b!1067381 m!986149))

(assert (=> b!1067382 m!986141))

(assert (=> b!1067382 m!986141))

(declare-fun m!986321 () Bool)

(assert (=> b!1067382 m!986321))

(assert (=> b!1067159 d!129509))

(declare-fun b!1067391 () Bool)

(declare-fun e!608689 () Bool)

(assert (=> b!1067391 (= e!608689 tp_is_empty!25441)))

(declare-fun mapIsEmpty!39856 () Bool)

(declare-fun mapRes!39856 () Bool)

(assert (=> mapIsEmpty!39856 mapRes!39856))

(declare-fun condMapEmpty!39856 () Bool)

(declare-fun mapDefault!39856 () ValueCell!12017)

(assert (=> mapNonEmpty!39847 (= condMapEmpty!39856 (= mapRest!39847 ((as const (Array (_ BitVec 32) ValueCell!12017)) mapDefault!39856)))))

(assert (=> mapNonEmpty!39847 (= tp!76331 (and e!608689 mapRes!39856))))

(declare-fun b!1067390 () Bool)

(declare-fun e!608688 () Bool)

(assert (=> b!1067390 (= e!608688 tp_is_empty!25441)))

(declare-fun mapNonEmpty!39856 () Bool)

(declare-fun tp!76346 () Bool)

(assert (=> mapNonEmpty!39856 (= mapRes!39856 (and tp!76346 e!608688))))

(declare-fun mapRest!39856 () (Array (_ BitVec 32) ValueCell!12017))

(declare-fun mapKey!39856 () (_ BitVec 32))

(declare-fun mapValue!39856 () ValueCell!12017)

(assert (=> mapNonEmpty!39856 (= mapRest!39847 (store mapRest!39856 mapKey!39856 mapValue!39856))))

(assert (= (and mapNonEmpty!39847 condMapEmpty!39856) mapIsEmpty!39856))

(assert (= (and mapNonEmpty!39847 (not condMapEmpty!39856)) mapNonEmpty!39856))

(assert (= (and mapNonEmpty!39856 ((_ is ValueCellFull!12017) mapValue!39856)) b!1067390))

(assert (= (and mapNonEmpty!39847 ((_ is ValueCellFull!12017) mapDefault!39856)) b!1067391))

(declare-fun m!986323 () Bool)

(assert (=> mapNonEmpty!39856 m!986323))

(declare-fun b_lambda!16559 () Bool)

(assert (= b_lambda!16547 (or (and start!94482 b_free!21631) b_lambda!16559)))

(declare-fun b_lambda!16561 () Bool)

(assert (= b_lambda!16549 (or (and start!94482 b_free!21631) b_lambda!16561)))

(declare-fun b_lambda!16563 () Bool)

(assert (= b_lambda!16551 (or (and start!94482 b_free!21631) b_lambda!16563)))

(declare-fun b_lambda!16565 () Bool)

(assert (= b_lambda!16553 (or (and start!94482 b_free!21631) b_lambda!16565)))

(declare-fun b_lambda!16567 () Bool)

(assert (= b_lambda!16555 (or (and start!94482 b_free!21631) b_lambda!16567)))

(declare-fun b_lambda!16569 () Bool)

(assert (= b_lambda!16557 (or (and start!94482 b_free!21631) b_lambda!16569)))

(check-sat (not b!1067353) (not b!1067355) (not b!1067381) (not b!1067379) (not mapNonEmpty!39856) (not bm!45100) (not b_lambda!16561) (not bm!45103) (not b!1067350) (not b!1067358) (not bm!45105) (not d!129491) (not b_lambda!16559) (not d!129495) (not b!1067320) (not b!1067278) (not b!1067312) (not b!1067354) (not b!1067311) (not b!1067366) (not b!1067288) (not b!1067361) (not b_lambda!16565) (not bm!45094) (not d!129505) (not d!129493) (not bm!45101) (not b!1067346) (not bm!45098) (not b!1067233) (not b!1067314) (not b!1067349) tp_is_empty!25441 (not b!1067345) (not b!1067225) (not b!1067362) (not d!129501) (not d!129497) (not b!1067348) (not bm!45079) (not b!1067234) (not b!1067297) (not d!129503) (not b!1067360) (not bm!45111) (not b!1067367) (not b!1067289) (not b!1067305) (not b!1067301) (not bm!45114) (not b!1067291) (not b_lambda!16569) (not b!1067226) (not b!1067357) b_and!34417 (not b!1067282) (not b_lambda!16563) (not b_next!21631) (not b!1067286) (not b!1067382) (not b!1067279) (not b!1067365) (not d!129507) (not b!1067309) (not bm!45110) (not bm!45096) (not d!129499) (not bm!45107) (not b_lambda!16567) (not b!1067302))
(check-sat b_and!34417 (not b_next!21631))
