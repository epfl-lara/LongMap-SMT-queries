; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94694 () Bool)

(assert start!94694)

(declare-fun b_free!21963 () Bool)

(declare-fun b_next!21963 () Bool)

(assert (=> start!94694 (= b_free!21963 (not b_next!21963))))

(declare-fun tp!77345 () Bool)

(declare-fun b_and!34783 () Bool)

(assert (=> start!94694 (= tp!77345 b_and!34783)))

(declare-fun b!1070661 () Bool)

(declare-fun e!611215 () Bool)

(declare-datatypes ((array!68521 0))(
  ( (array!68522 (arr!32957 (Array (_ BitVec 32) (_ BitVec 64))) (size!33493 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68521)

(assert (=> b!1070661 (= e!611215 (bvsle #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39499 0))(
  ( (V!39500 (val!12937 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39499)

(declare-datatypes ((tuple2!16456 0))(
  ( (tuple2!16457 (_1!8239 (_ BitVec 64)) (_2!8239 V!39499)) )
))
(declare-datatypes ((List!22999 0))(
  ( (Nil!22996) (Cons!22995 (h!24204 tuple2!16456) (t!32330 List!22999)) )
))
(declare-datatypes ((ListLongMap!14425 0))(
  ( (ListLongMap!14426 (toList!7228 List!22999)) )
))
(declare-fun lt!473183 () ListLongMap!14425)

(declare-datatypes ((ValueCell!12183 0))(
  ( (ValueCellFull!12183 (v!15553 V!39499)) (EmptyCell!12183) )
))
(declare-datatypes ((array!68523 0))(
  ( (array!68524 (arr!32958 (Array (_ BitVec 32) ValueCell!12183)) (size!33494 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68523)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39499)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4131 (array!68521 array!68523 (_ BitVec 32) (_ BitVec 32) V!39499 V!39499 (_ BitVec 32) Int) ListLongMap!14425)

(assert (=> b!1070661 (= lt!473183 (getCurrentListMap!4131 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070663 () Bool)

(declare-fun e!611214 () Bool)

(declare-fun tp_is_empty!25773 () Bool)

(assert (=> b!1070663 (= e!611214 tp_is_empty!25773)))

(declare-fun b!1070664 () Bool)

(declare-fun res!714263 () Bool)

(declare-fun e!611213 () Bool)

(assert (=> b!1070664 (=> (not res!714263) (not e!611213))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070664 (= res!714263 (and (= (size!33494 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33493 _keys!1163) (size!33494 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070665 () Bool)

(declare-fun res!714267 () Bool)

(assert (=> b!1070665 (=> (not res!714267) (not e!611213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68521 (_ BitVec 32)) Bool)

(assert (=> b!1070665 (= res!714267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070666 () Bool)

(assert (=> b!1070666 (= e!611213 (not e!611215))))

(declare-fun res!714266 () Bool)

(assert (=> b!1070666 (=> res!714266 e!611215)))

(assert (=> b!1070666 (= res!714266 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473184 () ListLongMap!14425)

(declare-fun lt!473185 () ListLongMap!14425)

(assert (=> b!1070666 (= lt!473184 lt!473185)))

(declare-datatypes ((Unit!35251 0))(
  ( (Unit!35252) )
))
(declare-fun lt!473182 () Unit!35251)

(declare-fun zeroValueAfter!47 () V!39499)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!839 (array!68521 array!68523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39499 V!39499 V!39499 V!39499 (_ BitVec 32) Int) Unit!35251)

(assert (=> b!1070666 (= lt!473182 (lemmaNoChangeToArrayThenSameMapNoExtras!839 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3802 (array!68521 array!68523 (_ BitVec 32) (_ BitVec 32) V!39499 V!39499 (_ BitVec 32) Int) ListLongMap!14425)

(assert (=> b!1070666 (= lt!473185 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070666 (= lt!473184 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40363 () Bool)

(declare-fun mapRes!40363 () Bool)

(declare-fun tp!77344 () Bool)

(assert (=> mapNonEmpty!40363 (= mapRes!40363 (and tp!77344 e!611214))))

(declare-fun mapKey!40363 () (_ BitVec 32))

(declare-fun mapValue!40363 () ValueCell!12183)

(declare-fun mapRest!40363 () (Array (_ BitVec 32) ValueCell!12183))

(assert (=> mapNonEmpty!40363 (= (arr!32958 _values!955) (store mapRest!40363 mapKey!40363 mapValue!40363))))

(declare-fun mapIsEmpty!40363 () Bool)

(assert (=> mapIsEmpty!40363 mapRes!40363))

(declare-fun b!1070662 () Bool)

(declare-fun res!714265 () Bool)

(assert (=> b!1070662 (=> (not res!714265) (not e!611213))))

(declare-datatypes ((List!23000 0))(
  ( (Nil!22997) (Cons!22996 (h!24205 (_ BitVec 64)) (t!32331 List!23000)) )
))
(declare-fun arrayNoDuplicates!0 (array!68521 (_ BitVec 32) List!23000) Bool)

(assert (=> b!1070662 (= res!714265 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22997))))

(declare-fun res!714264 () Bool)

(assert (=> start!94694 (=> (not res!714264) (not e!611213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94694 (= res!714264 (validMask!0 mask!1515))))

(assert (=> start!94694 e!611213))

(assert (=> start!94694 true))

(assert (=> start!94694 tp_is_empty!25773))

(declare-fun e!611210 () Bool)

(declare-fun array_inv!25490 (array!68523) Bool)

(assert (=> start!94694 (and (array_inv!25490 _values!955) e!611210)))

(assert (=> start!94694 tp!77345))

(declare-fun array_inv!25491 (array!68521) Bool)

(assert (=> start!94694 (array_inv!25491 _keys!1163)))

(declare-fun b!1070667 () Bool)

(declare-fun e!611212 () Bool)

(assert (=> b!1070667 (= e!611210 (and e!611212 mapRes!40363))))

(declare-fun condMapEmpty!40363 () Bool)

(declare-fun mapDefault!40363 () ValueCell!12183)

(assert (=> b!1070667 (= condMapEmpty!40363 (= (arr!32958 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12183)) mapDefault!40363)))))

(declare-fun b!1070668 () Bool)

(assert (=> b!1070668 (= e!611212 tp_is_empty!25773)))

(assert (= (and start!94694 res!714264) b!1070664))

(assert (= (and b!1070664 res!714263) b!1070665))

(assert (= (and b!1070665 res!714267) b!1070662))

(assert (= (and b!1070662 res!714265) b!1070666))

(assert (= (and b!1070666 (not res!714266)) b!1070661))

(assert (= (and b!1070667 condMapEmpty!40363) mapIsEmpty!40363))

(assert (= (and b!1070667 (not condMapEmpty!40363)) mapNonEmpty!40363))

(get-info :version)

(assert (= (and mapNonEmpty!40363 ((_ is ValueCellFull!12183) mapValue!40363)) b!1070663))

(assert (= (and b!1070667 ((_ is ValueCellFull!12183) mapDefault!40363)) b!1070668))

(assert (= start!94694 b!1070667))

(declare-fun m!988973 () Bool)

(assert (=> b!1070665 m!988973))

(declare-fun m!988975 () Bool)

(assert (=> b!1070661 m!988975))

(declare-fun m!988977 () Bool)

(assert (=> mapNonEmpty!40363 m!988977))

(declare-fun m!988979 () Bool)

(assert (=> b!1070666 m!988979))

(declare-fun m!988981 () Bool)

(assert (=> b!1070666 m!988981))

(declare-fun m!988983 () Bool)

(assert (=> b!1070666 m!988983))

(declare-fun m!988985 () Bool)

(assert (=> b!1070662 m!988985))

(declare-fun m!988987 () Bool)

(assert (=> start!94694 m!988987))

(declare-fun m!988989 () Bool)

(assert (=> start!94694 m!988989))

(declare-fun m!988991 () Bool)

(assert (=> start!94694 m!988991))

(check-sat (not b_next!21963) b_and!34783 (not mapNonEmpty!40363) (not b!1070662) (not start!94694) (not b!1070665) (not b!1070666) (not b!1070661) tp_is_empty!25773)
(check-sat b_and!34783 (not b_next!21963))
(get-model)

(declare-fun d!129265 () Bool)

(assert (=> d!129265 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94694 d!129265))

(declare-fun d!129267 () Bool)

(assert (=> d!129267 (= (array_inv!25490 _values!955) (bvsge (size!33494 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94694 d!129267))

(declare-fun d!129269 () Bool)

(assert (=> d!129269 (= (array_inv!25491 _keys!1163) (bvsge (size!33493 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94694 d!129269))

(declare-fun b!1070701 () Bool)

(declare-fun e!611242 () Bool)

(declare-fun call!45173 () Bool)

(assert (=> b!1070701 (= e!611242 call!45173)))

(declare-fun bm!45170 () Bool)

(assert (=> bm!45170 (= call!45173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1070702 () Bool)

(declare-fun e!611240 () Bool)

(declare-fun e!611241 () Bool)

(assert (=> b!1070702 (= e!611240 e!611241)))

(declare-fun c!107612 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1070702 (= c!107612 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129271 () Bool)

(declare-fun res!714288 () Bool)

(assert (=> d!129271 (=> res!714288 e!611240)))

(assert (=> d!129271 (= res!714288 (bvsge #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(assert (=> d!129271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!611240)))

(declare-fun b!1070703 () Bool)

(assert (=> b!1070703 (= e!611241 call!45173)))

(declare-fun b!1070704 () Bool)

(assert (=> b!1070704 (= e!611241 e!611242)))

(declare-fun lt!473204 () (_ BitVec 64))

(assert (=> b!1070704 (= lt!473204 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473206 () Unit!35251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68521 (_ BitVec 64) (_ BitVec 32)) Unit!35251)

(assert (=> b!1070704 (= lt!473206 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!473204 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1070704 (arrayContainsKey!0 _keys!1163 lt!473204 #b00000000000000000000000000000000)))

(declare-fun lt!473205 () Unit!35251)

(assert (=> b!1070704 (= lt!473205 lt!473206)))

(declare-fun res!714287 () Bool)

(declare-datatypes ((SeekEntryResult!9882 0))(
  ( (MissingZero!9882 (index!41899 (_ BitVec 32))) (Found!9882 (index!41900 (_ BitVec 32))) (Intermediate!9882 (undefined!10694 Bool) (index!41901 (_ BitVec 32)) (x!95934 (_ BitVec 32))) (Undefined!9882) (MissingVacant!9882 (index!41902 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68521 (_ BitVec 32)) SeekEntryResult!9882)

(assert (=> b!1070704 (= res!714287 (= (seekEntryOrOpen!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9882 #b00000000000000000000000000000000)))))

(assert (=> b!1070704 (=> (not res!714287) (not e!611242))))

(assert (= (and d!129271 (not res!714288)) b!1070702))

(assert (= (and b!1070702 c!107612) b!1070704))

(assert (= (and b!1070702 (not c!107612)) b!1070703))

(assert (= (and b!1070704 res!714287) b!1070701))

(assert (= (or b!1070701 b!1070703) bm!45170))

(declare-fun m!989013 () Bool)

(assert (=> bm!45170 m!989013))

(declare-fun m!989015 () Bool)

(assert (=> b!1070702 m!989015))

(assert (=> b!1070702 m!989015))

(declare-fun m!989017 () Bool)

(assert (=> b!1070702 m!989017))

(assert (=> b!1070704 m!989015))

(declare-fun m!989019 () Bool)

(assert (=> b!1070704 m!989019))

(declare-fun m!989021 () Bool)

(assert (=> b!1070704 m!989021))

(assert (=> b!1070704 m!989015))

(declare-fun m!989023 () Bool)

(assert (=> b!1070704 m!989023))

(assert (=> b!1070665 d!129271))

(declare-fun d!129273 () Bool)

(assert (=> d!129273 (= (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473209 () Unit!35251)

(declare-fun choose!1740 (array!68521 array!68523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39499 V!39499 V!39499 V!39499 (_ BitVec 32) Int) Unit!35251)

(assert (=> d!129273 (= lt!473209 (choose!1740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129273 (validMask!0 mask!1515)))

(assert (=> d!129273 (= (lemmaNoChangeToArrayThenSameMapNoExtras!839 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473209)))

(declare-fun bs!31541 () Bool)

(assert (= bs!31541 d!129273))

(assert (=> bs!31541 m!988983))

(assert (=> bs!31541 m!988981))

(declare-fun m!989025 () Bool)

(assert (=> bs!31541 m!989025))

(assert (=> bs!31541 m!988987))

(assert (=> b!1070666 d!129273))

(declare-fun b!1070729 () Bool)

(declare-fun res!714298 () Bool)

(declare-fun e!611262 () Bool)

(assert (=> b!1070729 (=> (not res!714298) (not e!611262))))

(declare-fun lt!473228 () ListLongMap!14425)

(declare-fun contains!6319 (ListLongMap!14425 (_ BitVec 64)) Bool)

(assert (=> b!1070729 (= res!714298 (not (contains!6319 lt!473228 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1070730 () Bool)

(declare-fun e!611257 () Bool)

(declare-fun e!611258 () Bool)

(assert (=> b!1070730 (= e!611257 e!611258)))

(declare-fun c!107621 () Bool)

(assert (=> b!1070730 (= c!107621 (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun b!1070731 () Bool)

(assert (=> b!1070731 (= e!611258 (= lt!473228 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45173 () Bool)

(declare-fun call!45176 () ListLongMap!14425)

(assert (=> bm!45173 (= call!45176 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1070732 () Bool)

(declare-fun lt!473230 () Unit!35251)

(declare-fun lt!473225 () Unit!35251)

(assert (=> b!1070732 (= lt!473230 lt!473225)))

(declare-fun lt!473227 () (_ BitVec 64))

(declare-fun lt!473224 () V!39499)

(declare-fun lt!473229 () (_ BitVec 64))

(declare-fun lt!473226 () ListLongMap!14425)

(declare-fun +!3164 (ListLongMap!14425 tuple2!16456) ListLongMap!14425)

(assert (=> b!1070732 (not (contains!6319 (+!3164 lt!473226 (tuple2!16457 lt!473227 lt!473224)) lt!473229))))

(declare-fun addStillNotContains!257 (ListLongMap!14425 (_ BitVec 64) V!39499 (_ BitVec 64)) Unit!35251)

(assert (=> b!1070732 (= lt!473225 (addStillNotContains!257 lt!473226 lt!473227 lt!473224 lt!473229))))

(assert (=> b!1070732 (= lt!473229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17145 (ValueCell!12183 V!39499) V!39499)

(declare-fun dynLambda!2036 (Int (_ BitVec 64)) V!39499)

(assert (=> b!1070732 (= lt!473224 (get!17145 (select (arr!32958 _values!955) #b00000000000000000000000000000000) (dynLambda!2036 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1070732 (= lt!473227 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070732 (= lt!473226 call!45176)))

(declare-fun e!611263 () ListLongMap!14425)

(assert (=> b!1070732 (= e!611263 (+!3164 call!45176 (tuple2!16457 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000) (get!17145 (select (arr!32958 _values!955) #b00000000000000000000000000000000) (dynLambda!2036 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1070733 () Bool)

(declare-fun isEmpty!947 (ListLongMap!14425) Bool)

(assert (=> b!1070733 (= e!611258 (isEmpty!947 lt!473228))))

(declare-fun b!1070734 () Bool)

(assert (=> b!1070734 (= e!611263 call!45176)))

(declare-fun b!1070735 () Bool)

(declare-fun e!611260 () Bool)

(assert (=> b!1070735 (= e!611260 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070735 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1070736 () Bool)

(declare-fun e!611259 () ListLongMap!14425)

(assert (=> b!1070736 (= e!611259 (ListLongMap!14426 Nil!22996))))

(declare-fun b!1070737 () Bool)

(assert (=> b!1070737 (= e!611262 e!611257)))

(declare-fun c!107622 () Bool)

(assert (=> b!1070737 (= c!107622 e!611260)))

(declare-fun res!714297 () Bool)

(assert (=> b!1070737 (=> (not res!714297) (not e!611260))))

(assert (=> b!1070737 (= res!714297 (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun d!129275 () Bool)

(assert (=> d!129275 e!611262))

(declare-fun res!714300 () Bool)

(assert (=> d!129275 (=> (not res!714300) (not e!611262))))

(assert (=> d!129275 (= res!714300 (not (contains!6319 lt!473228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129275 (= lt!473228 e!611259)))

(declare-fun c!107624 () Bool)

(assert (=> d!129275 (= c!107624 (bvsge #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(assert (=> d!129275 (validMask!0 mask!1515)))

(assert (=> d!129275 (= (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473228)))

(declare-fun b!1070738 () Bool)

(assert (=> b!1070738 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(assert (=> b!1070738 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33494 _values!955)))))

(declare-fun e!611261 () Bool)

(declare-fun apply!929 (ListLongMap!14425 (_ BitVec 64)) V!39499)

(assert (=> b!1070738 (= e!611261 (= (apply!929 lt!473228 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)) (get!17145 (select (arr!32958 _values!955) #b00000000000000000000000000000000) (dynLambda!2036 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1070739 () Bool)

(assert (=> b!1070739 (= e!611259 e!611263)))

(declare-fun c!107623 () Bool)

(assert (=> b!1070739 (= c!107623 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070740 () Bool)

(assert (=> b!1070740 (= e!611257 e!611261)))

(assert (=> b!1070740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun res!714299 () Bool)

(assert (=> b!1070740 (= res!714299 (contains!6319 lt!473228 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070740 (=> (not res!714299) (not e!611261))))

(assert (= (and d!129275 c!107624) b!1070736))

(assert (= (and d!129275 (not c!107624)) b!1070739))

(assert (= (and b!1070739 c!107623) b!1070732))

(assert (= (and b!1070739 (not c!107623)) b!1070734))

(assert (= (or b!1070732 b!1070734) bm!45173))

(assert (= (and d!129275 res!714300) b!1070729))

(assert (= (and b!1070729 res!714298) b!1070737))

(assert (= (and b!1070737 res!714297) b!1070735))

(assert (= (and b!1070737 c!107622) b!1070740))

(assert (= (and b!1070737 (not c!107622)) b!1070730))

(assert (= (and b!1070740 res!714299) b!1070738))

(assert (= (and b!1070730 c!107621) b!1070731))

(assert (= (and b!1070730 (not c!107621)) b!1070733))

(declare-fun b_lambda!16657 () Bool)

(assert (=> (not b_lambda!16657) (not b!1070732)))

(declare-fun t!32334 () Bool)

(declare-fun tb!7153 () Bool)

(assert (=> (and start!94694 (= defaultEntry!963 defaultEntry!963) t!32334) tb!7153))

(declare-fun result!14767 () Bool)

(assert (=> tb!7153 (= result!14767 tp_is_empty!25773)))

(assert (=> b!1070732 t!32334))

(declare-fun b_and!34787 () Bool)

(assert (= b_and!34783 (and (=> t!32334 result!14767) b_and!34787)))

(declare-fun b_lambda!16659 () Bool)

(assert (=> (not b_lambda!16659) (not b!1070738)))

(assert (=> b!1070738 t!32334))

(declare-fun b_and!34789 () Bool)

(assert (= b_and!34787 (and (=> t!32334 result!14767) b_and!34789)))

(declare-fun m!989027 () Bool)

(assert (=> b!1070733 m!989027))

(assert (=> b!1070738 m!989015))

(declare-fun m!989029 () Bool)

(assert (=> b!1070738 m!989029))

(assert (=> b!1070738 m!989015))

(declare-fun m!989031 () Bool)

(assert (=> b!1070738 m!989031))

(declare-fun m!989033 () Bool)

(assert (=> b!1070738 m!989033))

(assert (=> b!1070738 m!989029))

(assert (=> b!1070738 m!989033))

(declare-fun m!989035 () Bool)

(assert (=> b!1070738 m!989035))

(declare-fun m!989037 () Bool)

(assert (=> d!129275 m!989037))

(assert (=> d!129275 m!988987))

(assert (=> b!1070739 m!989015))

(assert (=> b!1070739 m!989015))

(assert (=> b!1070739 m!989017))

(declare-fun m!989039 () Bool)

(assert (=> b!1070731 m!989039))

(declare-fun m!989041 () Bool)

(assert (=> b!1070729 m!989041))

(assert (=> b!1070740 m!989015))

(assert (=> b!1070740 m!989015))

(declare-fun m!989043 () Bool)

(assert (=> b!1070740 m!989043))

(assert (=> bm!45173 m!989039))

(assert (=> b!1070735 m!989015))

(assert (=> b!1070735 m!989015))

(assert (=> b!1070735 m!989017))

(declare-fun m!989045 () Bool)

(assert (=> b!1070732 m!989045))

(declare-fun m!989047 () Bool)

(assert (=> b!1070732 m!989047))

(assert (=> b!1070732 m!989015))

(assert (=> b!1070732 m!989045))

(assert (=> b!1070732 m!989029))

(assert (=> b!1070732 m!989033))

(declare-fun m!989049 () Bool)

(assert (=> b!1070732 m!989049))

(declare-fun m!989051 () Bool)

(assert (=> b!1070732 m!989051))

(assert (=> b!1070732 m!989029))

(assert (=> b!1070732 m!989033))

(assert (=> b!1070732 m!989035))

(assert (=> b!1070666 d!129275))

(declare-fun b!1070743 () Bool)

(declare-fun res!714302 () Bool)

(declare-fun e!611269 () Bool)

(assert (=> b!1070743 (=> (not res!714302) (not e!611269))))

(declare-fun lt!473235 () ListLongMap!14425)

(assert (=> b!1070743 (= res!714302 (not (contains!6319 lt!473235 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1070744 () Bool)

(declare-fun e!611264 () Bool)

(declare-fun e!611265 () Bool)

(assert (=> b!1070744 (= e!611264 e!611265)))

(declare-fun c!107625 () Bool)

(assert (=> b!1070744 (= c!107625 (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun b!1070745 () Bool)

(assert (=> b!1070745 (= e!611265 (= lt!473235 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45174 () Bool)

(declare-fun call!45177 () ListLongMap!14425)

(assert (=> bm!45174 (= call!45177 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1070746 () Bool)

(declare-fun lt!473237 () Unit!35251)

(declare-fun lt!473232 () Unit!35251)

(assert (=> b!1070746 (= lt!473237 lt!473232)))

(declare-fun lt!473236 () (_ BitVec 64))

(declare-fun lt!473234 () (_ BitVec 64))

(declare-fun lt!473233 () ListLongMap!14425)

(declare-fun lt!473231 () V!39499)

(assert (=> b!1070746 (not (contains!6319 (+!3164 lt!473233 (tuple2!16457 lt!473234 lt!473231)) lt!473236))))

(assert (=> b!1070746 (= lt!473232 (addStillNotContains!257 lt!473233 lt!473234 lt!473231 lt!473236))))

(assert (=> b!1070746 (= lt!473236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1070746 (= lt!473231 (get!17145 (select (arr!32958 _values!955) #b00000000000000000000000000000000) (dynLambda!2036 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1070746 (= lt!473234 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070746 (= lt!473233 call!45177)))

(declare-fun e!611270 () ListLongMap!14425)

(assert (=> b!1070746 (= e!611270 (+!3164 call!45177 (tuple2!16457 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000) (get!17145 (select (arr!32958 _values!955) #b00000000000000000000000000000000) (dynLambda!2036 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1070747 () Bool)

(assert (=> b!1070747 (= e!611265 (isEmpty!947 lt!473235))))

(declare-fun b!1070748 () Bool)

(assert (=> b!1070748 (= e!611270 call!45177)))

(declare-fun b!1070749 () Bool)

(declare-fun e!611267 () Bool)

(assert (=> b!1070749 (= e!611267 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070749 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1070750 () Bool)

(declare-fun e!611266 () ListLongMap!14425)

(assert (=> b!1070750 (= e!611266 (ListLongMap!14426 Nil!22996))))

(declare-fun b!1070751 () Bool)

(assert (=> b!1070751 (= e!611269 e!611264)))

(declare-fun c!107626 () Bool)

(assert (=> b!1070751 (= c!107626 e!611267)))

(declare-fun res!714301 () Bool)

(assert (=> b!1070751 (=> (not res!714301) (not e!611267))))

(assert (=> b!1070751 (= res!714301 (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun d!129277 () Bool)

(assert (=> d!129277 e!611269))

(declare-fun res!714304 () Bool)

(assert (=> d!129277 (=> (not res!714304) (not e!611269))))

(assert (=> d!129277 (= res!714304 (not (contains!6319 lt!473235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129277 (= lt!473235 e!611266)))

(declare-fun c!107628 () Bool)

(assert (=> d!129277 (= c!107628 (bvsge #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(assert (=> d!129277 (validMask!0 mask!1515)))

(assert (=> d!129277 (= (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473235)))

(declare-fun b!1070752 () Bool)

(assert (=> b!1070752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(assert (=> b!1070752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33494 _values!955)))))

(declare-fun e!611268 () Bool)

(assert (=> b!1070752 (= e!611268 (= (apply!929 lt!473235 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)) (get!17145 (select (arr!32958 _values!955) #b00000000000000000000000000000000) (dynLambda!2036 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1070753 () Bool)

(assert (=> b!1070753 (= e!611266 e!611270)))

(declare-fun c!107627 () Bool)

(assert (=> b!1070753 (= c!107627 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070754 () Bool)

(assert (=> b!1070754 (= e!611264 e!611268)))

(assert (=> b!1070754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun res!714303 () Bool)

(assert (=> b!1070754 (= res!714303 (contains!6319 lt!473235 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070754 (=> (not res!714303) (not e!611268))))

(assert (= (and d!129277 c!107628) b!1070750))

(assert (= (and d!129277 (not c!107628)) b!1070753))

(assert (= (and b!1070753 c!107627) b!1070746))

(assert (= (and b!1070753 (not c!107627)) b!1070748))

(assert (= (or b!1070746 b!1070748) bm!45174))

(assert (= (and d!129277 res!714304) b!1070743))

(assert (= (and b!1070743 res!714302) b!1070751))

(assert (= (and b!1070751 res!714301) b!1070749))

(assert (= (and b!1070751 c!107626) b!1070754))

(assert (= (and b!1070751 (not c!107626)) b!1070744))

(assert (= (and b!1070754 res!714303) b!1070752))

(assert (= (and b!1070744 c!107625) b!1070745))

(assert (= (and b!1070744 (not c!107625)) b!1070747))

(declare-fun b_lambda!16661 () Bool)

(assert (=> (not b_lambda!16661) (not b!1070746)))

(assert (=> b!1070746 t!32334))

(declare-fun b_and!34791 () Bool)

(assert (= b_and!34789 (and (=> t!32334 result!14767) b_and!34791)))

(declare-fun b_lambda!16663 () Bool)

(assert (=> (not b_lambda!16663) (not b!1070752)))

(assert (=> b!1070752 t!32334))

(declare-fun b_and!34793 () Bool)

(assert (= b_and!34791 (and (=> t!32334 result!14767) b_and!34793)))

(declare-fun m!989053 () Bool)

(assert (=> b!1070747 m!989053))

(assert (=> b!1070752 m!989015))

(assert (=> b!1070752 m!989029))

(assert (=> b!1070752 m!989015))

(declare-fun m!989055 () Bool)

(assert (=> b!1070752 m!989055))

(assert (=> b!1070752 m!989033))

(assert (=> b!1070752 m!989029))

(assert (=> b!1070752 m!989033))

(assert (=> b!1070752 m!989035))

(declare-fun m!989057 () Bool)

(assert (=> d!129277 m!989057))

(assert (=> d!129277 m!988987))

(assert (=> b!1070753 m!989015))

(assert (=> b!1070753 m!989015))

(assert (=> b!1070753 m!989017))

(declare-fun m!989059 () Bool)

(assert (=> b!1070745 m!989059))

(declare-fun m!989061 () Bool)

(assert (=> b!1070743 m!989061))

(assert (=> b!1070754 m!989015))

(assert (=> b!1070754 m!989015))

(declare-fun m!989063 () Bool)

(assert (=> b!1070754 m!989063))

(assert (=> bm!45174 m!989059))

(assert (=> b!1070749 m!989015))

(assert (=> b!1070749 m!989015))

(assert (=> b!1070749 m!989017))

(declare-fun m!989065 () Bool)

(assert (=> b!1070746 m!989065))

(declare-fun m!989067 () Bool)

(assert (=> b!1070746 m!989067))

(assert (=> b!1070746 m!989015))

(assert (=> b!1070746 m!989065))

(assert (=> b!1070746 m!989029))

(assert (=> b!1070746 m!989033))

(declare-fun m!989069 () Bool)

(assert (=> b!1070746 m!989069))

(declare-fun m!989071 () Bool)

(assert (=> b!1070746 m!989071))

(assert (=> b!1070746 m!989029))

(assert (=> b!1070746 m!989033))

(assert (=> b!1070746 m!989035))

(assert (=> b!1070666 d!129277))

(declare-fun b!1070797 () Bool)

(declare-fun c!107644 () Bool)

(assert (=> b!1070797 (= c!107644 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!611298 () ListLongMap!14425)

(declare-fun e!611302 () ListLongMap!14425)

(assert (=> b!1070797 (= e!611298 e!611302)))

(declare-fun b!1070798 () Bool)

(declare-fun e!611308 () Bool)

(declare-fun lt!473291 () ListLongMap!14425)

(assert (=> b!1070798 (= e!611308 (= (apply!929 lt!473291 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun e!611304 () Bool)

(declare-fun b!1070799 () Bool)

(assert (=> b!1070799 (= e!611304 (= (apply!929 lt!473291 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)) (get!17145 (select (arr!32958 _values!955) #b00000000000000000000000000000000) (dynLambda!2036 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1070799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33494 _values!955)))))

(assert (=> b!1070799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun b!1070800 () Bool)

(declare-fun e!611305 () ListLongMap!14425)

(assert (=> b!1070800 (= e!611305 e!611298)))

(declare-fun c!107646 () Bool)

(assert (=> b!1070800 (= c!107646 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1070801 () Bool)

(declare-fun res!714330 () Bool)

(declare-fun e!611299 () Bool)

(assert (=> b!1070801 (=> (not res!714330) (not e!611299))))

(declare-fun e!611306 () Bool)

(assert (=> b!1070801 (= res!714330 e!611306)))

(declare-fun c!107645 () Bool)

(assert (=> b!1070801 (= c!107645 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45189 () Bool)

(declare-fun call!45192 () ListLongMap!14425)

(declare-fun call!45197 () ListLongMap!14425)

(assert (=> bm!45189 (= call!45192 call!45197)))

(declare-fun b!1070802 () Bool)

(declare-fun call!45196 () ListLongMap!14425)

(assert (=> b!1070802 (= e!611302 call!45196)))

(declare-fun b!1070803 () Bool)

(declare-fun e!611309 () Bool)

(assert (=> b!1070803 (= e!611306 e!611309)))

(declare-fun res!714325 () Bool)

(declare-fun call!45193 () Bool)

(assert (=> b!1070803 (= res!714325 call!45193)))

(assert (=> b!1070803 (=> (not res!714325) (not e!611309))))

(declare-fun b!1070804 () Bool)

(declare-fun e!611307 () Bool)

(assert (=> b!1070804 (= e!611307 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45190 () Bool)

(declare-fun call!45194 () ListLongMap!14425)

(declare-fun call!45198 () ListLongMap!14425)

(assert (=> bm!45190 (= call!45194 call!45198)))

(declare-fun b!1070805 () Bool)

(declare-fun e!611303 () Bool)

(assert (=> b!1070805 (= e!611299 e!611303)))

(declare-fun c!107641 () Bool)

(assert (=> b!1070805 (= c!107641 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1070806 () Bool)

(assert (=> b!1070806 (= e!611306 (not call!45193))))

(declare-fun bm!45191 () Bool)

(declare-fun call!45195 () Bool)

(assert (=> bm!45191 (= call!45195 (contains!6319 lt!473291 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070807 () Bool)

(declare-fun e!611301 () Bool)

(assert (=> b!1070807 (= e!611301 e!611304)))

(declare-fun res!714326 () Bool)

(assert (=> b!1070807 (=> (not res!714326) (not e!611304))))

(assert (=> b!1070807 (= res!714326 (contains!6319 lt!473291 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun d!129279 () Bool)

(assert (=> d!129279 e!611299))

(declare-fun res!714323 () Bool)

(assert (=> d!129279 (=> (not res!714323) (not e!611299))))

(assert (=> d!129279 (= res!714323 (or (bvsge #b00000000000000000000000000000000 (size!33493 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))))

(declare-fun lt!473297 () ListLongMap!14425)

(assert (=> d!129279 (= lt!473291 lt!473297)))

(declare-fun lt!473290 () Unit!35251)

(declare-fun e!611300 () Unit!35251)

(assert (=> d!129279 (= lt!473290 e!611300)))

(declare-fun c!107642 () Bool)

(assert (=> d!129279 (= c!107642 e!611307)))

(declare-fun res!714331 () Bool)

(assert (=> d!129279 (=> (not res!714331) (not e!611307))))

(assert (=> d!129279 (= res!714331 (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(assert (=> d!129279 (= lt!473297 e!611305)))

(declare-fun c!107643 () Bool)

(assert (=> d!129279 (= c!107643 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129279 (validMask!0 mask!1515)))

(assert (=> d!129279 (= (getCurrentListMap!4131 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473291)))

(declare-fun b!1070808 () Bool)

(declare-fun res!714324 () Bool)

(assert (=> b!1070808 (=> (not res!714324) (not e!611299))))

(assert (=> b!1070808 (= res!714324 e!611301)))

(declare-fun res!714329 () Bool)

(assert (=> b!1070808 (=> res!714329 e!611301)))

(declare-fun e!611297 () Bool)

(assert (=> b!1070808 (= res!714329 (not e!611297))))

(declare-fun res!714327 () Bool)

(assert (=> b!1070808 (=> (not res!714327) (not e!611297))))

(assert (=> b!1070808 (= res!714327 (bvslt #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(declare-fun b!1070809 () Bool)

(assert (=> b!1070809 (= e!611303 e!611308)))

(declare-fun res!714328 () Bool)

(assert (=> b!1070809 (= res!714328 call!45195)))

(assert (=> b!1070809 (=> (not res!714328) (not e!611308))))

(declare-fun bm!45192 () Bool)

(assert (=> bm!45192 (= call!45197 (+!3164 (ite c!107643 call!45198 (ite c!107646 call!45194 call!45196)) (ite (or c!107643 c!107646) (tuple2!16457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1070810 () Bool)

(assert (=> b!1070810 (= e!611302 call!45192)))

(declare-fun b!1070811 () Bool)

(assert (=> b!1070811 (= e!611309 (= (apply!929 lt!473291 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1070812 () Bool)

(assert (=> b!1070812 (= e!611298 call!45192)))

(declare-fun bm!45193 () Bool)

(assert (=> bm!45193 (= call!45198 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070813 () Bool)

(assert (=> b!1070813 (= e!611305 (+!3164 call!45197 (tuple2!16457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1070814 () Bool)

(assert (=> b!1070814 (= e!611303 (not call!45195))))

(declare-fun b!1070815 () Bool)

(assert (=> b!1070815 (= e!611297 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070816 () Bool)

(declare-fun Unit!35255 () Unit!35251)

(assert (=> b!1070816 (= e!611300 Unit!35255)))

(declare-fun bm!45194 () Bool)

(assert (=> bm!45194 (= call!45196 call!45194)))

(declare-fun b!1070817 () Bool)

(declare-fun lt!473287 () Unit!35251)

(assert (=> b!1070817 (= e!611300 lt!473287)))

(declare-fun lt!473282 () ListLongMap!14425)

(assert (=> b!1070817 (= lt!473282 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473284 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473303 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473303 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473294 () Unit!35251)

(declare-fun addStillContains!643 (ListLongMap!14425 (_ BitVec 64) V!39499 (_ BitVec 64)) Unit!35251)

(assert (=> b!1070817 (= lt!473294 (addStillContains!643 lt!473282 lt!473284 zeroValueBefore!47 lt!473303))))

(assert (=> b!1070817 (contains!6319 (+!3164 lt!473282 (tuple2!16457 lt!473284 zeroValueBefore!47)) lt!473303)))

(declare-fun lt!473302 () Unit!35251)

(assert (=> b!1070817 (= lt!473302 lt!473294)))

(declare-fun lt!473288 () ListLongMap!14425)

(assert (=> b!1070817 (= lt!473288 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473295 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473289 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473289 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473292 () Unit!35251)

(declare-fun addApplyDifferent!503 (ListLongMap!14425 (_ BitVec 64) V!39499 (_ BitVec 64)) Unit!35251)

(assert (=> b!1070817 (= lt!473292 (addApplyDifferent!503 lt!473288 lt!473295 minValue!907 lt!473289))))

(assert (=> b!1070817 (= (apply!929 (+!3164 lt!473288 (tuple2!16457 lt!473295 minValue!907)) lt!473289) (apply!929 lt!473288 lt!473289))))

(declare-fun lt!473296 () Unit!35251)

(assert (=> b!1070817 (= lt!473296 lt!473292)))

(declare-fun lt!473293 () ListLongMap!14425)

(assert (=> b!1070817 (= lt!473293 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473285 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473301 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473301 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473286 () Unit!35251)

(assert (=> b!1070817 (= lt!473286 (addApplyDifferent!503 lt!473293 lt!473285 zeroValueBefore!47 lt!473301))))

(assert (=> b!1070817 (= (apply!929 (+!3164 lt!473293 (tuple2!16457 lt!473285 zeroValueBefore!47)) lt!473301) (apply!929 lt!473293 lt!473301))))

(declare-fun lt!473299 () Unit!35251)

(assert (=> b!1070817 (= lt!473299 lt!473286)))

(declare-fun lt!473283 () ListLongMap!14425)

(assert (=> b!1070817 (= lt!473283 (getCurrentListMapNoExtraKeys!3802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473298 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473298 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473300 () (_ BitVec 64))

(assert (=> b!1070817 (= lt!473300 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070817 (= lt!473287 (addApplyDifferent!503 lt!473283 lt!473298 minValue!907 lt!473300))))

(assert (=> b!1070817 (= (apply!929 (+!3164 lt!473283 (tuple2!16457 lt!473298 minValue!907)) lt!473300) (apply!929 lt!473283 lt!473300))))

(declare-fun bm!45195 () Bool)

(assert (=> bm!45195 (= call!45193 (contains!6319 lt!473291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129279 c!107643) b!1070813))

(assert (= (and d!129279 (not c!107643)) b!1070800))

(assert (= (and b!1070800 c!107646) b!1070812))

(assert (= (and b!1070800 (not c!107646)) b!1070797))

(assert (= (and b!1070797 c!107644) b!1070810))

(assert (= (and b!1070797 (not c!107644)) b!1070802))

(assert (= (or b!1070810 b!1070802) bm!45194))

(assert (= (or b!1070812 bm!45194) bm!45190))

(assert (= (or b!1070812 b!1070810) bm!45189))

(assert (= (or b!1070813 bm!45190) bm!45193))

(assert (= (or b!1070813 bm!45189) bm!45192))

(assert (= (and d!129279 res!714331) b!1070804))

(assert (= (and d!129279 c!107642) b!1070817))

(assert (= (and d!129279 (not c!107642)) b!1070816))

(assert (= (and d!129279 res!714323) b!1070808))

(assert (= (and b!1070808 res!714327) b!1070815))

(assert (= (and b!1070808 (not res!714329)) b!1070807))

(assert (= (and b!1070807 res!714326) b!1070799))

(assert (= (and b!1070808 res!714324) b!1070801))

(assert (= (and b!1070801 c!107645) b!1070803))

(assert (= (and b!1070801 (not c!107645)) b!1070806))

(assert (= (and b!1070803 res!714325) b!1070811))

(assert (= (or b!1070803 b!1070806) bm!45195))

(assert (= (and b!1070801 res!714330) b!1070805))

(assert (= (and b!1070805 c!107641) b!1070809))

(assert (= (and b!1070805 (not c!107641)) b!1070814))

(assert (= (and b!1070809 res!714328) b!1070798))

(assert (= (or b!1070809 b!1070814) bm!45191))

(declare-fun b_lambda!16665 () Bool)

(assert (=> (not b_lambda!16665) (not b!1070799)))

(assert (=> b!1070799 t!32334))

(declare-fun b_and!34795 () Bool)

(assert (= b_and!34793 (and (=> t!32334 result!14767) b_and!34795)))

(declare-fun m!989073 () Bool)

(assert (=> b!1070811 m!989073))

(declare-fun m!989075 () Bool)

(assert (=> b!1070817 m!989075))

(declare-fun m!989077 () Bool)

(assert (=> b!1070817 m!989077))

(assert (=> b!1070817 m!989075))

(assert (=> b!1070817 m!988983))

(declare-fun m!989079 () Bool)

(assert (=> b!1070817 m!989079))

(declare-fun m!989081 () Bool)

(assert (=> b!1070817 m!989081))

(assert (=> b!1070817 m!989079))

(declare-fun m!989083 () Bool)

(assert (=> b!1070817 m!989083))

(declare-fun m!989085 () Bool)

(assert (=> b!1070817 m!989085))

(declare-fun m!989087 () Bool)

(assert (=> b!1070817 m!989087))

(declare-fun m!989089 () Bool)

(assert (=> b!1070817 m!989089))

(declare-fun m!989091 () Bool)

(assert (=> b!1070817 m!989091))

(declare-fun m!989093 () Bool)

(assert (=> b!1070817 m!989093))

(assert (=> b!1070817 m!989085))

(declare-fun m!989095 () Bool)

(assert (=> b!1070817 m!989095))

(assert (=> b!1070817 m!989015))

(declare-fun m!989097 () Bool)

(assert (=> b!1070817 m!989097))

(assert (=> b!1070817 m!989091))

(declare-fun m!989099 () Bool)

(assert (=> b!1070817 m!989099))

(declare-fun m!989101 () Bool)

(assert (=> b!1070817 m!989101))

(declare-fun m!989103 () Bool)

(assert (=> b!1070817 m!989103))

(assert (=> b!1070807 m!989015))

(assert (=> b!1070807 m!989015))

(declare-fun m!989105 () Bool)

(assert (=> b!1070807 m!989105))

(assert (=> d!129279 m!988987))

(declare-fun m!989107 () Bool)

(assert (=> b!1070798 m!989107))

(assert (=> b!1070815 m!989015))

(assert (=> b!1070815 m!989015))

(assert (=> b!1070815 m!989017))

(declare-fun m!989109 () Bool)

(assert (=> bm!45192 m!989109))

(declare-fun m!989111 () Bool)

(assert (=> bm!45195 m!989111))

(assert (=> b!1070799 m!989029))

(assert (=> b!1070799 m!989033))

(assert (=> b!1070799 m!989035))

(assert (=> b!1070799 m!989015))

(assert (=> b!1070799 m!989033))

(assert (=> b!1070799 m!989029))

(assert (=> b!1070799 m!989015))

(declare-fun m!989113 () Bool)

(assert (=> b!1070799 m!989113))

(declare-fun m!989115 () Bool)

(assert (=> b!1070813 m!989115))

(assert (=> b!1070804 m!989015))

(assert (=> b!1070804 m!989015))

(assert (=> b!1070804 m!989017))

(assert (=> bm!45193 m!988983))

(declare-fun m!989117 () Bool)

(assert (=> bm!45191 m!989117))

(assert (=> b!1070661 d!129279))

(declare-fun d!129281 () Bool)

(declare-fun res!714338 () Bool)

(declare-fun e!611319 () Bool)

(assert (=> d!129281 (=> res!714338 e!611319)))

(assert (=> d!129281 (= res!714338 (bvsge #b00000000000000000000000000000000 (size!33493 _keys!1163)))))

(assert (=> d!129281 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22997) e!611319)))

(declare-fun b!1070828 () Bool)

(declare-fun e!611321 () Bool)

(assert (=> b!1070828 (= e!611319 e!611321)))

(declare-fun res!714339 () Bool)

(assert (=> b!1070828 (=> (not res!714339) (not e!611321))))

(declare-fun e!611318 () Bool)

(assert (=> b!1070828 (= res!714339 (not e!611318))))

(declare-fun res!714340 () Bool)

(assert (=> b!1070828 (=> (not res!714340) (not e!611318))))

(assert (=> b!1070828 (= res!714340 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070829 () Bool)

(declare-fun e!611320 () Bool)

(assert (=> b!1070829 (= e!611321 e!611320)))

(declare-fun c!107649 () Bool)

(assert (=> b!1070829 (= c!107649 (validKeyInArray!0 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070830 () Bool)

(declare-fun contains!6320 (List!23000 (_ BitVec 64)) Bool)

(assert (=> b!1070830 (= e!611318 (contains!6320 Nil!22997 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070831 () Bool)

(declare-fun call!45201 () Bool)

(assert (=> b!1070831 (= e!611320 call!45201)))

(declare-fun b!1070832 () Bool)

(assert (=> b!1070832 (= e!611320 call!45201)))

(declare-fun bm!45198 () Bool)

(assert (=> bm!45198 (= call!45201 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107649 (Cons!22996 (select (arr!32957 _keys!1163) #b00000000000000000000000000000000) Nil!22997) Nil!22997)))))

(assert (= (and d!129281 (not res!714338)) b!1070828))

(assert (= (and b!1070828 res!714340) b!1070830))

(assert (= (and b!1070828 res!714339) b!1070829))

(assert (= (and b!1070829 c!107649) b!1070831))

(assert (= (and b!1070829 (not c!107649)) b!1070832))

(assert (= (or b!1070831 b!1070832) bm!45198))

(assert (=> b!1070828 m!989015))

(assert (=> b!1070828 m!989015))

(assert (=> b!1070828 m!989017))

(assert (=> b!1070829 m!989015))

(assert (=> b!1070829 m!989015))

(assert (=> b!1070829 m!989017))

(assert (=> b!1070830 m!989015))

(assert (=> b!1070830 m!989015))

(declare-fun m!989119 () Bool)

(assert (=> b!1070830 m!989119))

(assert (=> bm!45198 m!989015))

(declare-fun m!989121 () Bool)

(assert (=> bm!45198 m!989121))

(assert (=> b!1070662 d!129281))

(declare-fun b!1070839 () Bool)

(declare-fun e!611326 () Bool)

(assert (=> b!1070839 (= e!611326 tp_is_empty!25773)))

(declare-fun mapNonEmpty!40369 () Bool)

(declare-fun mapRes!40369 () Bool)

(declare-fun tp!77354 () Bool)

(assert (=> mapNonEmpty!40369 (= mapRes!40369 (and tp!77354 e!611326))))

(declare-fun mapKey!40369 () (_ BitVec 32))

(declare-fun mapValue!40369 () ValueCell!12183)

(declare-fun mapRest!40369 () (Array (_ BitVec 32) ValueCell!12183))

(assert (=> mapNonEmpty!40369 (= mapRest!40363 (store mapRest!40369 mapKey!40369 mapValue!40369))))

(declare-fun mapIsEmpty!40369 () Bool)

(assert (=> mapIsEmpty!40369 mapRes!40369))

(declare-fun condMapEmpty!40369 () Bool)

(declare-fun mapDefault!40369 () ValueCell!12183)

(assert (=> mapNonEmpty!40363 (= condMapEmpty!40369 (= mapRest!40363 ((as const (Array (_ BitVec 32) ValueCell!12183)) mapDefault!40369)))))

(declare-fun e!611327 () Bool)

(assert (=> mapNonEmpty!40363 (= tp!77344 (and e!611327 mapRes!40369))))

(declare-fun b!1070840 () Bool)

(assert (=> b!1070840 (= e!611327 tp_is_empty!25773)))

(assert (= (and mapNonEmpty!40363 condMapEmpty!40369) mapIsEmpty!40369))

(assert (= (and mapNonEmpty!40363 (not condMapEmpty!40369)) mapNonEmpty!40369))

(assert (= (and mapNonEmpty!40369 ((_ is ValueCellFull!12183) mapValue!40369)) b!1070839))

(assert (= (and mapNonEmpty!40363 ((_ is ValueCellFull!12183) mapDefault!40369)) b!1070840))

(declare-fun m!989123 () Bool)

(assert (=> mapNonEmpty!40369 m!989123))

(declare-fun b_lambda!16667 () Bool)

(assert (= b_lambda!16665 (or (and start!94694 b_free!21963) b_lambda!16667)))

(declare-fun b_lambda!16669 () Bool)

(assert (= b_lambda!16661 (or (and start!94694 b_free!21963) b_lambda!16669)))

(declare-fun b_lambda!16671 () Bool)

(assert (= b_lambda!16657 (or (and start!94694 b_free!21963) b_lambda!16671)))

(declare-fun b_lambda!16673 () Bool)

(assert (= b_lambda!16659 (or (and start!94694 b_free!21963) b_lambda!16673)))

(declare-fun b_lambda!16675 () Bool)

(assert (= b_lambda!16663 (or (and start!94694 b_free!21963) b_lambda!16675)))

(check-sat (not b!1070807) b_and!34795 (not bm!45174) (not b!1070745) (not b!1070704) (not b!1070747) (not d!129279) (not b!1070746) (not b!1070753) (not b!1070828) (not b!1070798) (not b!1070830) (not b!1070817) (not b_next!21963) (not b_lambda!16675) (not bm!45170) (not b_lambda!16673) (not bm!45191) (not b!1070735) (not b!1070738) (not b!1070804) (not b!1070743) (not b!1070702) (not b_lambda!16671) (not bm!45195) (not bm!45193) (not b!1070731) (not b!1070754) (not b!1070733) (not b!1070732) (not bm!45192) (not b!1070749) (not b!1070815) (not d!129277) (not b!1070799) (not b!1070739) (not b!1070752) tp_is_empty!25773 (not d!129273) (not mapNonEmpty!40369) (not b_lambda!16669) (not bm!45198) (not b!1070829) (not b!1070813) (not b_lambda!16667) (not b!1070729) (not d!129275) (not b!1070740) (not b!1070811) (not bm!45173))
(check-sat b_and!34795 (not b_next!21963))
