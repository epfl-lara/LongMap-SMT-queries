; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94558 () Bool)

(assert start!94558)

(declare-fun b_free!21685 () Bool)

(declare-fun b_next!21685 () Bool)

(assert (=> start!94558 (= b_free!21685 (not b_next!21685))))

(declare-fun tp!76496 () Bool)

(declare-fun b_and!34467 () Bool)

(assert (=> start!94558 (= tp!76496 b_and!34467)))

(declare-fun b!1067986 () Bool)

(declare-fun res!712437 () Bool)

(declare-fun e!609139 () Bool)

(assert (=> b!1067986 (=> (not res!712437) (not e!609139))))

(declare-datatypes ((array!68017 0))(
  ( (array!68018 (arr!32704 (Array (_ BitVec 32) (_ BitVec 64))) (size!33241 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68017)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68017 (_ BitVec 32)) Bool)

(assert (=> b!1067986 (= res!712437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067987 () Bool)

(declare-fun e!609136 () Bool)

(declare-fun e!609140 () Bool)

(assert (=> b!1067987 (= e!609136 e!609140)))

(declare-fun res!712441 () Bool)

(assert (=> b!1067987 (=> res!712441 e!609140)))

(declare-datatypes ((V!39129 0))(
  ( (V!39130 (val!12798 Int)) )
))
(declare-datatypes ((tuple2!16212 0))(
  ( (tuple2!16213 (_1!8117 (_ BitVec 64)) (_2!8117 V!39129)) )
))
(declare-datatypes ((List!22780 0))(
  ( (Nil!22777) (Cons!22776 (h!23994 tuple2!16212) (t!32093 List!22780)) )
))
(declare-datatypes ((ListLongMap!14189 0))(
  ( (ListLongMap!14190 (toList!7110 List!22780)) )
))
(declare-fun lt!471537 () ListLongMap!14189)

(declare-fun lt!471536 () ListLongMap!14189)

(declare-fun -!623 (ListLongMap!14189 (_ BitVec 64)) ListLongMap!14189)

(assert (=> b!1067987 (= res!712441 (not (= (-!623 lt!471537 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471536)))))

(declare-fun lt!471538 () ListLongMap!14189)

(declare-fun lt!471539 () ListLongMap!14189)

(assert (=> b!1067987 (= (-!623 lt!471538 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471539)))

(declare-datatypes ((Unit!35016 0))(
  ( (Unit!35017) )
))
(declare-fun lt!471535 () Unit!35016)

(declare-fun zeroValueBefore!47 () V!39129)

(declare-fun addThenRemoveForNewKeyIsSame!33 (ListLongMap!14189 (_ BitVec 64) V!39129) Unit!35016)

(assert (=> b!1067987 (= lt!471535 (addThenRemoveForNewKeyIsSame!33 lt!471539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471534 () ListLongMap!14189)

(assert (=> b!1067987 (and (= lt!471537 lt!471538) (= lt!471536 lt!471534))))

(declare-fun +!3176 (ListLongMap!14189 tuple2!16212) ListLongMap!14189)

(assert (=> b!1067987 (= lt!471538 (+!3176 lt!471539 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-datatypes ((ValueCell!12044 0))(
  ( (ValueCellFull!12044 (v!15407 V!39129)) (EmptyCell!12044) )
))
(declare-datatypes ((array!68019 0))(
  ( (array!68020 (arr!32705 (Array (_ BitVec 32) ValueCell!12044)) (size!33242 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68019)

(declare-fun minValue!907 () V!39129)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39129)

(declare-fun getCurrentListMap!4057 (array!68017 array!68019 (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 (_ BitVec 32) Int) ListLongMap!14189)

(assert (=> b!1067987 (= lt!471536 (getCurrentListMap!4057 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067987 (= lt!471537 (getCurrentListMap!4057 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067988 () Bool)

(declare-fun res!712436 () Bool)

(assert (=> b!1067988 (=> (not res!712436) (not e!609139))))

(assert (=> b!1067988 (= res!712436 (and (= (size!33242 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33241 _keys!1163) (size!33242 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067989 () Bool)

(declare-fun e!609141 () Bool)

(declare-fun tp_is_empty!25495 () Bool)

(assert (=> b!1067989 (= e!609141 tp_is_empty!25495)))

(declare-fun mapIsEmpty!39931 () Bool)

(declare-fun mapRes!39931 () Bool)

(assert (=> mapIsEmpty!39931 mapRes!39931))

(declare-fun res!712440 () Bool)

(assert (=> start!94558 (=> (not res!712440) (not e!609139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94558 (= res!712440 (validMask!0 mask!1515))))

(assert (=> start!94558 e!609139))

(assert (=> start!94558 true))

(assert (=> start!94558 tp_is_empty!25495))

(declare-fun e!609137 () Bool)

(declare-fun array_inv!25342 (array!68019) Bool)

(assert (=> start!94558 (and (array_inv!25342 _values!955) e!609137)))

(assert (=> start!94558 tp!76496))

(declare-fun array_inv!25343 (array!68017) Bool)

(assert (=> start!94558 (array_inv!25343 _keys!1163)))

(declare-fun b!1067990 () Bool)

(declare-fun res!712439 () Bool)

(assert (=> b!1067990 (=> (not res!712439) (not e!609139))))

(declare-datatypes ((List!22781 0))(
  ( (Nil!22778) (Cons!22777 (h!23995 (_ BitVec 64)) (t!32094 List!22781)) )
))
(declare-fun arrayNoDuplicates!0 (array!68017 (_ BitVec 32) List!22781) Bool)

(assert (=> b!1067990 (= res!712439 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22778))))

(declare-fun b!1067991 () Bool)

(assert (=> b!1067991 (= e!609139 (not e!609136))))

(declare-fun res!712438 () Bool)

(assert (=> b!1067991 (=> res!712438 e!609136)))

(assert (=> b!1067991 (= res!712438 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1067991 (= lt!471539 lt!471534)))

(declare-fun lt!471533 () Unit!35016)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!733 (array!68017 array!68019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 V!39129 V!39129 (_ BitVec 32) Int) Unit!35016)

(assert (=> b!1067991 (= lt!471533 (lemmaNoChangeToArrayThenSameMapNoExtras!733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3730 (array!68017 array!68019 (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 (_ BitVec 32) Int) ListLongMap!14189)

(assert (=> b!1067991 (= lt!471534 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067991 (= lt!471539 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067992 () Bool)

(declare-fun e!609138 () Bool)

(assert (=> b!1067992 (= e!609137 (and e!609138 mapRes!39931))))

(declare-fun condMapEmpty!39931 () Bool)

(declare-fun mapDefault!39931 () ValueCell!12044)

(assert (=> b!1067992 (= condMapEmpty!39931 (= (arr!32705 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12044)) mapDefault!39931)))))

(declare-fun b!1067993 () Bool)

(assert (=> b!1067993 (= e!609138 tp_is_empty!25495)))

(declare-fun b!1067994 () Bool)

(assert (=> b!1067994 (= e!609140 (bvsle #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun mapNonEmpty!39931 () Bool)

(declare-fun tp!76495 () Bool)

(assert (=> mapNonEmpty!39931 (= mapRes!39931 (and tp!76495 e!609141))))

(declare-fun mapRest!39931 () (Array (_ BitVec 32) ValueCell!12044))

(declare-fun mapValue!39931 () ValueCell!12044)

(declare-fun mapKey!39931 () (_ BitVec 32))

(assert (=> mapNonEmpty!39931 (= (arr!32705 _values!955) (store mapRest!39931 mapKey!39931 mapValue!39931))))

(assert (= (and start!94558 res!712440) b!1067988))

(assert (= (and b!1067988 res!712436) b!1067986))

(assert (= (and b!1067986 res!712437) b!1067990))

(assert (= (and b!1067990 res!712439) b!1067991))

(assert (= (and b!1067991 (not res!712438)) b!1067987))

(assert (= (and b!1067987 (not res!712441)) b!1067994))

(assert (= (and b!1067992 condMapEmpty!39931) mapIsEmpty!39931))

(assert (= (and b!1067992 (not condMapEmpty!39931)) mapNonEmpty!39931))

(get-info :version)

(assert (= (and mapNonEmpty!39931 ((_ is ValueCellFull!12044) mapValue!39931)) b!1067989))

(assert (= (and b!1067992 ((_ is ValueCellFull!12044) mapDefault!39931)) b!1067993))

(assert (= start!94558 b!1067992))

(declare-fun m!987045 () Bool)

(assert (=> b!1067991 m!987045))

(declare-fun m!987047 () Bool)

(assert (=> b!1067991 m!987047))

(declare-fun m!987049 () Bool)

(assert (=> b!1067991 m!987049))

(declare-fun m!987051 () Bool)

(assert (=> b!1067987 m!987051))

(declare-fun m!987053 () Bool)

(assert (=> b!1067987 m!987053))

(declare-fun m!987055 () Bool)

(assert (=> b!1067987 m!987055))

(declare-fun m!987057 () Bool)

(assert (=> b!1067987 m!987057))

(declare-fun m!987059 () Bool)

(assert (=> b!1067987 m!987059))

(declare-fun m!987061 () Bool)

(assert (=> b!1067987 m!987061))

(declare-fun m!987063 () Bool)

(assert (=> start!94558 m!987063))

(declare-fun m!987065 () Bool)

(assert (=> start!94558 m!987065))

(declare-fun m!987067 () Bool)

(assert (=> start!94558 m!987067))

(declare-fun m!987069 () Bool)

(assert (=> b!1067990 m!987069))

(declare-fun m!987071 () Bool)

(assert (=> b!1067986 m!987071))

(declare-fun m!987073 () Bool)

(assert (=> mapNonEmpty!39931 m!987073))

(check-sat (not mapNonEmpty!39931) b_and!34467 (not b!1067991) tp_is_empty!25495 (not b!1067990) (not start!94558) (not b_next!21685) (not b!1067986) (not b!1067987))
(check-sat b_and!34467 (not b_next!21685))
(get-model)

(declare-fun d!129529 () Bool)

(assert (=> d!129529 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94558 d!129529))

(declare-fun d!129531 () Bool)

(assert (=> d!129531 (= (array_inv!25342 _values!955) (bvsge (size!33242 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94558 d!129531))

(declare-fun d!129533 () Bool)

(assert (=> d!129533 (= (array_inv!25343 _keys!1163) (bvsge (size!33241 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94558 d!129533))

(declare-fun bm!45117 () Bool)

(declare-fun call!45120 () Bool)

(assert (=> bm!45117 (= call!45120 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1068057 () Bool)

(declare-fun e!609192 () Bool)

(declare-fun e!609191 () Bool)

(assert (=> b!1068057 (= e!609192 e!609191)))

(declare-fun lt!471589 () (_ BitVec 64))

(assert (=> b!1068057 (= lt!471589 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471588 () Unit!35016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68017 (_ BitVec 64) (_ BitVec 32)) Unit!35016)

(assert (=> b!1068057 (= lt!471588 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!471589 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1068057 (arrayContainsKey!0 _keys!1163 lt!471589 #b00000000000000000000000000000000)))

(declare-fun lt!471590 () Unit!35016)

(assert (=> b!1068057 (= lt!471590 lt!471588)))

(declare-fun res!712483 () Bool)

(declare-datatypes ((SeekEntryResult!9833 0))(
  ( (MissingZero!9833 (index!41703 (_ BitVec 32))) (Found!9833 (index!41704 (_ BitVec 32))) (Intermediate!9833 (undefined!10645 Bool) (index!41705 (_ BitVec 32)) (x!95484 (_ BitVec 32))) (Undefined!9833) (MissingVacant!9833 (index!41706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68017 (_ BitVec 32)) SeekEntryResult!9833)

(assert (=> b!1068057 (= res!712483 (= (seekEntryOrOpen!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9833 #b00000000000000000000000000000000)))))

(assert (=> b!1068057 (=> (not res!712483) (not e!609191))))

(declare-fun b!1068058 () Bool)

(declare-fun e!609193 () Bool)

(assert (=> b!1068058 (= e!609193 e!609192)))

(declare-fun c!107846 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1068058 (= c!107846 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068059 () Bool)

(assert (=> b!1068059 (= e!609191 call!45120)))

(declare-fun d!129535 () Bool)

(declare-fun res!712482 () Bool)

(assert (=> d!129535 (=> res!712482 e!609193)))

(assert (=> d!129535 (= res!712482 (bvsge #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> d!129535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!609193)))

(declare-fun b!1068060 () Bool)

(assert (=> b!1068060 (= e!609192 call!45120)))

(assert (= (and d!129535 (not res!712482)) b!1068058))

(assert (= (and b!1068058 c!107846) b!1068057))

(assert (= (and b!1068058 (not c!107846)) b!1068060))

(assert (= (and b!1068057 res!712483) b!1068059))

(assert (= (or b!1068059 b!1068060) bm!45117))

(declare-fun m!987135 () Bool)

(assert (=> bm!45117 m!987135))

(declare-fun m!987137 () Bool)

(assert (=> b!1068057 m!987137))

(declare-fun m!987139 () Bool)

(assert (=> b!1068057 m!987139))

(declare-fun m!987141 () Bool)

(assert (=> b!1068057 m!987141))

(assert (=> b!1068057 m!987137))

(declare-fun m!987143 () Bool)

(assert (=> b!1068057 m!987143))

(assert (=> b!1068058 m!987137))

(assert (=> b!1068058 m!987137))

(declare-fun m!987145 () Bool)

(assert (=> b!1068058 m!987145))

(assert (=> b!1067986 d!129535))

(declare-fun d!129537 () Bool)

(declare-fun res!712491 () Bool)

(declare-fun e!609202 () Bool)

(assert (=> d!129537 (=> res!712491 e!609202)))

(assert (=> d!129537 (= res!712491 (bvsge #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> d!129537 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22778) e!609202)))

(declare-fun b!1068071 () Bool)

(declare-fun e!609205 () Bool)

(declare-fun call!45123 () Bool)

(assert (=> b!1068071 (= e!609205 call!45123)))

(declare-fun b!1068072 () Bool)

(declare-fun e!609203 () Bool)

(declare-fun contains!6291 (List!22781 (_ BitVec 64)) Bool)

(assert (=> b!1068072 (= e!609203 (contains!6291 Nil!22778 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45120 () Bool)

(declare-fun c!107849 () Bool)

(assert (=> bm!45120 (= call!45123 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107849 (Cons!22777 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000) Nil!22778) Nil!22778)))))

(declare-fun b!1068073 () Bool)

(declare-fun e!609204 () Bool)

(assert (=> b!1068073 (= e!609204 e!609205)))

(assert (=> b!1068073 (= c!107849 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068074 () Bool)

(assert (=> b!1068074 (= e!609205 call!45123)))

(declare-fun b!1068075 () Bool)

(assert (=> b!1068075 (= e!609202 e!609204)))

(declare-fun res!712490 () Bool)

(assert (=> b!1068075 (=> (not res!712490) (not e!609204))))

(assert (=> b!1068075 (= res!712490 (not e!609203))))

(declare-fun res!712492 () Bool)

(assert (=> b!1068075 (=> (not res!712492) (not e!609203))))

(assert (=> b!1068075 (= res!712492 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129537 (not res!712491)) b!1068075))

(assert (= (and b!1068075 res!712492) b!1068072))

(assert (= (and b!1068075 res!712490) b!1068073))

(assert (= (and b!1068073 c!107849) b!1068074))

(assert (= (and b!1068073 (not c!107849)) b!1068071))

(assert (= (or b!1068074 b!1068071) bm!45120))

(assert (=> b!1068072 m!987137))

(assert (=> b!1068072 m!987137))

(declare-fun m!987147 () Bool)

(assert (=> b!1068072 m!987147))

(assert (=> bm!45120 m!987137))

(declare-fun m!987149 () Bool)

(assert (=> bm!45120 m!987149))

(assert (=> b!1068073 m!987137))

(assert (=> b!1068073 m!987137))

(assert (=> b!1068073 m!987145))

(assert (=> b!1068075 m!987137))

(assert (=> b!1068075 m!987137))

(assert (=> b!1068075 m!987145))

(assert (=> b!1067990 d!129537))

(declare-fun d!129539 () Bool)

(assert (=> d!129539 (= (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471593 () Unit!35016)

(declare-fun choose!1736 (array!68017 array!68019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 V!39129 V!39129 (_ BitVec 32) Int) Unit!35016)

(assert (=> d!129539 (= lt!471593 (choose!1736 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129539 (validMask!0 mask!1515)))

(assert (=> d!129539 (= (lemmaNoChangeToArrayThenSameMapNoExtras!733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471593)))

(declare-fun bs!31411 () Bool)

(assert (= bs!31411 d!129539))

(assert (=> bs!31411 m!987049))

(assert (=> bs!31411 m!987047))

(declare-fun m!987151 () Bool)

(assert (=> bs!31411 m!987151))

(assert (=> bs!31411 m!987063))

(assert (=> b!1067991 d!129539))

(declare-fun b!1068100 () Bool)

(assert (=> b!1068100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> b!1068100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33242 _values!955)))))

(declare-fun e!609222 () Bool)

(declare-fun lt!471612 () ListLongMap!14189)

(declare-fun apply!933 (ListLongMap!14189 (_ BitVec 64)) V!39129)

(declare-fun get!17077 (ValueCell!12044 V!39129) V!39129)

(declare-fun dynLambda!2048 (Int (_ BitVec 64)) V!39129)

(assert (=> b!1068100 (= e!609222 (= (apply!933 lt!471612 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)) (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!609221 () Bool)

(declare-fun b!1068101 () Bool)

(assert (=> b!1068101 (= e!609221 (= lt!471612 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068102 () Bool)

(declare-fun e!609224 () ListLongMap!14189)

(declare-fun call!45126 () ListLongMap!14189)

(assert (=> b!1068102 (= e!609224 call!45126)))

(declare-fun b!1068103 () Bool)

(declare-fun e!609226 () Bool)

(assert (=> b!1068103 (= e!609226 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068103 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068104 () Bool)

(declare-fun e!609220 () ListLongMap!14189)

(assert (=> b!1068104 (= e!609220 (ListLongMap!14190 Nil!22777))))

(declare-fun b!1068105 () Bool)

(declare-fun lt!471608 () Unit!35016)

(declare-fun lt!471611 () Unit!35016)

(assert (=> b!1068105 (= lt!471608 lt!471611)))

(declare-fun lt!471614 () ListLongMap!14189)

(declare-fun lt!471609 () (_ BitVec 64))

(declare-fun lt!471613 () (_ BitVec 64))

(declare-fun lt!471610 () V!39129)

(declare-fun contains!6292 (ListLongMap!14189 (_ BitVec 64)) Bool)

(assert (=> b!1068105 (not (contains!6292 (+!3176 lt!471614 (tuple2!16213 lt!471613 lt!471610)) lt!471609))))

(declare-fun addStillNotContains!254 (ListLongMap!14189 (_ BitVec 64) V!39129 (_ BitVec 64)) Unit!35016)

(assert (=> b!1068105 (= lt!471611 (addStillNotContains!254 lt!471614 lt!471613 lt!471610 lt!471609))))

(assert (=> b!1068105 (= lt!471609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1068105 (= lt!471610 (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068105 (= lt!471613 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068105 (= lt!471614 call!45126)))

(assert (=> b!1068105 (= e!609224 (+!3176 call!45126 (tuple2!16213 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000) (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45123 () Bool)

(assert (=> bm!45123 (= call!45126 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068107 () Bool)

(declare-fun e!609225 () Bool)

(assert (=> b!1068107 (= e!609225 e!609221)))

(declare-fun c!107861 () Bool)

(assert (=> b!1068107 (= c!107861 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068108 () Bool)

(declare-fun res!712503 () Bool)

(declare-fun e!609223 () Bool)

(assert (=> b!1068108 (=> (not res!712503) (not e!609223))))

(assert (=> b!1068108 (= res!712503 (not (contains!6292 lt!471612 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1068109 () Bool)

(assert (=> b!1068109 (= e!609223 e!609225)))

(declare-fun c!107858 () Bool)

(assert (=> b!1068109 (= c!107858 e!609226)))

(declare-fun res!712501 () Bool)

(assert (=> b!1068109 (=> (not res!712501) (not e!609226))))

(assert (=> b!1068109 (= res!712501 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068110 () Bool)

(assert (=> b!1068110 (= e!609225 e!609222)))

(assert (=> b!1068110 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun res!712502 () Bool)

(assert (=> b!1068110 (= res!712502 (contains!6292 lt!471612 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068110 (=> (not res!712502) (not e!609222))))

(declare-fun b!1068111 () Bool)

(declare-fun isEmpty!946 (ListLongMap!14189) Bool)

(assert (=> b!1068111 (= e!609221 (isEmpty!946 lt!471612))))

(declare-fun d!129541 () Bool)

(assert (=> d!129541 e!609223))

(declare-fun res!712504 () Bool)

(assert (=> d!129541 (=> (not res!712504) (not e!609223))))

(assert (=> d!129541 (= res!712504 (not (contains!6292 lt!471612 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129541 (= lt!471612 e!609220)))

(declare-fun c!107860 () Bool)

(assert (=> d!129541 (= c!107860 (bvsge #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> d!129541 (validMask!0 mask!1515)))

(assert (=> d!129541 (= (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471612)))

(declare-fun b!1068106 () Bool)

(assert (=> b!1068106 (= e!609220 e!609224)))

(declare-fun c!107859 () Bool)

(assert (=> b!1068106 (= c!107859 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129541 c!107860) b!1068104))

(assert (= (and d!129541 (not c!107860)) b!1068106))

(assert (= (and b!1068106 c!107859) b!1068105))

(assert (= (and b!1068106 (not c!107859)) b!1068102))

(assert (= (or b!1068105 b!1068102) bm!45123))

(assert (= (and d!129541 res!712504) b!1068108))

(assert (= (and b!1068108 res!712503) b!1068109))

(assert (= (and b!1068109 res!712501) b!1068103))

(assert (= (and b!1068109 c!107858) b!1068110))

(assert (= (and b!1068109 (not c!107858)) b!1068107))

(assert (= (and b!1068110 res!712502) b!1068100))

(assert (= (and b!1068107 c!107861) b!1068101))

(assert (= (and b!1068107 (not c!107861)) b!1068111))

(declare-fun b_lambda!16571 () Bool)

(assert (=> (not b_lambda!16571) (not b!1068100)))

(declare-fun t!32099 () Bool)

(declare-fun tb!7135 () Bool)

(assert (=> (and start!94558 (= defaultEntry!963 defaultEntry!963) t!32099) tb!7135))

(declare-fun result!14729 () Bool)

(assert (=> tb!7135 (= result!14729 tp_is_empty!25495)))

(assert (=> b!1068100 t!32099))

(declare-fun b_and!34473 () Bool)

(assert (= b_and!34467 (and (=> t!32099 result!14729) b_and!34473)))

(declare-fun b_lambda!16573 () Bool)

(assert (=> (not b_lambda!16573) (not b!1068105)))

(assert (=> b!1068105 t!32099))

(declare-fun b_and!34475 () Bool)

(assert (= b_and!34473 (and (=> t!32099 result!14729) b_and!34475)))

(declare-fun m!987153 () Bool)

(assert (=> bm!45123 m!987153))

(declare-fun m!987155 () Bool)

(assert (=> b!1068105 m!987155))

(assert (=> b!1068105 m!987155))

(declare-fun m!987157 () Bool)

(assert (=> b!1068105 m!987157))

(declare-fun m!987159 () Bool)

(assert (=> b!1068105 m!987159))

(declare-fun m!987161 () Bool)

(assert (=> b!1068105 m!987161))

(declare-fun m!987163 () Bool)

(assert (=> b!1068105 m!987163))

(declare-fun m!987165 () Bool)

(assert (=> b!1068105 m!987165))

(assert (=> b!1068105 m!987163))

(declare-fun m!987167 () Bool)

(assert (=> b!1068105 m!987167))

(assert (=> b!1068105 m!987137))

(assert (=> b!1068105 m!987165))

(assert (=> b!1068101 m!987153))

(declare-fun m!987169 () Bool)

(assert (=> b!1068111 m!987169))

(assert (=> b!1068100 m!987137))

(declare-fun m!987171 () Bool)

(assert (=> b!1068100 m!987171))

(assert (=> b!1068100 m!987163))

(assert (=> b!1068100 m!987165))

(assert (=> b!1068100 m!987163))

(assert (=> b!1068100 m!987167))

(assert (=> b!1068100 m!987137))

(assert (=> b!1068100 m!987165))

(assert (=> b!1068103 m!987137))

(assert (=> b!1068103 m!987137))

(assert (=> b!1068103 m!987145))

(declare-fun m!987173 () Bool)

(assert (=> b!1068108 m!987173))

(assert (=> b!1068110 m!987137))

(assert (=> b!1068110 m!987137))

(declare-fun m!987175 () Bool)

(assert (=> b!1068110 m!987175))

(assert (=> b!1068106 m!987137))

(assert (=> b!1068106 m!987137))

(assert (=> b!1068106 m!987145))

(declare-fun m!987177 () Bool)

(assert (=> d!129541 m!987177))

(assert (=> d!129541 m!987063))

(assert (=> b!1067991 d!129541))

(declare-fun b!1068114 () Bool)

(assert (=> b!1068114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> b!1068114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33242 _values!955)))))

(declare-fun e!609229 () Bool)

(declare-fun lt!471619 () ListLongMap!14189)

(assert (=> b!1068114 (= e!609229 (= (apply!933 lt!471619 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)) (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1068115 () Bool)

(declare-fun e!609228 () Bool)

(assert (=> b!1068115 (= e!609228 (= lt!471619 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068116 () Bool)

(declare-fun e!609231 () ListLongMap!14189)

(declare-fun call!45127 () ListLongMap!14189)

(assert (=> b!1068116 (= e!609231 call!45127)))

(declare-fun b!1068117 () Bool)

(declare-fun e!609233 () Bool)

(assert (=> b!1068117 (= e!609233 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068117 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068118 () Bool)

(declare-fun e!609227 () ListLongMap!14189)

(assert (=> b!1068118 (= e!609227 (ListLongMap!14190 Nil!22777))))

(declare-fun b!1068119 () Bool)

(declare-fun lt!471615 () Unit!35016)

(declare-fun lt!471618 () Unit!35016)

(assert (=> b!1068119 (= lt!471615 lt!471618)))

(declare-fun lt!471617 () V!39129)

(declare-fun lt!471620 () (_ BitVec 64))

(declare-fun lt!471621 () ListLongMap!14189)

(declare-fun lt!471616 () (_ BitVec 64))

(assert (=> b!1068119 (not (contains!6292 (+!3176 lt!471621 (tuple2!16213 lt!471620 lt!471617)) lt!471616))))

(assert (=> b!1068119 (= lt!471618 (addStillNotContains!254 lt!471621 lt!471620 lt!471617 lt!471616))))

(assert (=> b!1068119 (= lt!471616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1068119 (= lt!471617 (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068119 (= lt!471620 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068119 (= lt!471621 call!45127)))

(assert (=> b!1068119 (= e!609231 (+!3176 call!45127 (tuple2!16213 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000) (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45124 () Bool)

(assert (=> bm!45124 (= call!45127 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068121 () Bool)

(declare-fun e!609232 () Bool)

(assert (=> b!1068121 (= e!609232 e!609228)))

(declare-fun c!107865 () Bool)

(assert (=> b!1068121 (= c!107865 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068122 () Bool)

(declare-fun res!712507 () Bool)

(declare-fun e!609230 () Bool)

(assert (=> b!1068122 (=> (not res!712507) (not e!609230))))

(assert (=> b!1068122 (= res!712507 (not (contains!6292 lt!471619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1068123 () Bool)

(assert (=> b!1068123 (= e!609230 e!609232)))

(declare-fun c!107862 () Bool)

(assert (=> b!1068123 (= c!107862 e!609233)))

(declare-fun res!712505 () Bool)

(assert (=> b!1068123 (=> (not res!712505) (not e!609233))))

(assert (=> b!1068123 (= res!712505 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068124 () Bool)

(assert (=> b!1068124 (= e!609232 e!609229)))

(assert (=> b!1068124 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun res!712506 () Bool)

(assert (=> b!1068124 (= res!712506 (contains!6292 lt!471619 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068124 (=> (not res!712506) (not e!609229))))

(declare-fun b!1068125 () Bool)

(assert (=> b!1068125 (= e!609228 (isEmpty!946 lt!471619))))

(declare-fun d!129543 () Bool)

(assert (=> d!129543 e!609230))

(declare-fun res!712508 () Bool)

(assert (=> d!129543 (=> (not res!712508) (not e!609230))))

(assert (=> d!129543 (= res!712508 (not (contains!6292 lt!471619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129543 (= lt!471619 e!609227)))

(declare-fun c!107864 () Bool)

(assert (=> d!129543 (= c!107864 (bvsge #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> d!129543 (validMask!0 mask!1515)))

(assert (=> d!129543 (= (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471619)))

(declare-fun b!1068120 () Bool)

(assert (=> b!1068120 (= e!609227 e!609231)))

(declare-fun c!107863 () Bool)

(assert (=> b!1068120 (= c!107863 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129543 c!107864) b!1068118))

(assert (= (and d!129543 (not c!107864)) b!1068120))

(assert (= (and b!1068120 c!107863) b!1068119))

(assert (= (and b!1068120 (not c!107863)) b!1068116))

(assert (= (or b!1068119 b!1068116) bm!45124))

(assert (= (and d!129543 res!712508) b!1068122))

(assert (= (and b!1068122 res!712507) b!1068123))

(assert (= (and b!1068123 res!712505) b!1068117))

(assert (= (and b!1068123 c!107862) b!1068124))

(assert (= (and b!1068123 (not c!107862)) b!1068121))

(assert (= (and b!1068124 res!712506) b!1068114))

(assert (= (and b!1068121 c!107865) b!1068115))

(assert (= (and b!1068121 (not c!107865)) b!1068125))

(declare-fun b_lambda!16575 () Bool)

(assert (=> (not b_lambda!16575) (not b!1068114)))

(assert (=> b!1068114 t!32099))

(declare-fun b_and!34477 () Bool)

(assert (= b_and!34475 (and (=> t!32099 result!14729) b_and!34477)))

(declare-fun b_lambda!16577 () Bool)

(assert (=> (not b_lambda!16577) (not b!1068119)))

(assert (=> b!1068119 t!32099))

(declare-fun b_and!34479 () Bool)

(assert (= b_and!34477 (and (=> t!32099 result!14729) b_and!34479)))

(declare-fun m!987179 () Bool)

(assert (=> bm!45124 m!987179))

(declare-fun m!987181 () Bool)

(assert (=> b!1068119 m!987181))

(assert (=> b!1068119 m!987181))

(declare-fun m!987183 () Bool)

(assert (=> b!1068119 m!987183))

(declare-fun m!987185 () Bool)

(assert (=> b!1068119 m!987185))

(declare-fun m!987187 () Bool)

(assert (=> b!1068119 m!987187))

(assert (=> b!1068119 m!987163))

(assert (=> b!1068119 m!987165))

(assert (=> b!1068119 m!987163))

(assert (=> b!1068119 m!987167))

(assert (=> b!1068119 m!987137))

(assert (=> b!1068119 m!987165))

(assert (=> b!1068115 m!987179))

(declare-fun m!987189 () Bool)

(assert (=> b!1068125 m!987189))

(assert (=> b!1068114 m!987137))

(declare-fun m!987191 () Bool)

(assert (=> b!1068114 m!987191))

(assert (=> b!1068114 m!987163))

(assert (=> b!1068114 m!987165))

(assert (=> b!1068114 m!987163))

(assert (=> b!1068114 m!987167))

(assert (=> b!1068114 m!987137))

(assert (=> b!1068114 m!987165))

(assert (=> b!1068117 m!987137))

(assert (=> b!1068117 m!987137))

(assert (=> b!1068117 m!987145))

(declare-fun m!987193 () Bool)

(assert (=> b!1068122 m!987193))

(assert (=> b!1068124 m!987137))

(assert (=> b!1068124 m!987137))

(declare-fun m!987195 () Bool)

(assert (=> b!1068124 m!987195))

(assert (=> b!1068120 m!987137))

(assert (=> b!1068120 m!987137))

(assert (=> b!1068120 m!987145))

(declare-fun m!987197 () Bool)

(assert (=> d!129543 m!987197))

(assert (=> d!129543 m!987063))

(assert (=> b!1067991 d!129543))

(declare-fun d!129545 () Bool)

(declare-fun lt!471624 () ListLongMap!14189)

(assert (=> d!129545 (not (contains!6292 lt!471624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!69 (List!22780 (_ BitVec 64)) List!22780)

(assert (=> d!129545 (= lt!471624 (ListLongMap!14190 (removeStrictlySorted!69 (toList!7110 lt!471538) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129545 (= (-!623 lt!471538 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471624)))

(declare-fun bs!31412 () Bool)

(assert (= bs!31412 d!129545))

(declare-fun m!987199 () Bool)

(assert (=> bs!31412 m!987199))

(declare-fun m!987201 () Bool)

(assert (=> bs!31412 m!987201))

(assert (=> b!1067987 d!129545))

(declare-fun d!129547 () Bool)

(declare-fun lt!471625 () ListLongMap!14189)

(assert (=> d!129547 (not (contains!6292 lt!471625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129547 (= lt!471625 (ListLongMap!14190 (removeStrictlySorted!69 (toList!7110 lt!471537) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129547 (= (-!623 lt!471537 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471625)))

(declare-fun bs!31413 () Bool)

(assert (= bs!31413 d!129547))

(declare-fun m!987203 () Bool)

(assert (=> bs!31413 m!987203))

(declare-fun m!987205 () Bool)

(assert (=> bs!31413 m!987205))

(assert (=> b!1067987 d!129547))

(declare-fun b!1068168 () Bool)

(declare-fun e!609269 () Unit!35016)

(declare-fun lt!471682 () Unit!35016)

(assert (=> b!1068168 (= e!609269 lt!471682)))

(declare-fun lt!471670 () ListLongMap!14189)

(assert (=> b!1068168 (= lt!471670 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471673 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471689 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471689 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471671 () Unit!35016)

(declare-fun addStillContains!640 (ListLongMap!14189 (_ BitVec 64) V!39129 (_ BitVec 64)) Unit!35016)

(assert (=> b!1068168 (= lt!471671 (addStillContains!640 lt!471670 lt!471673 zeroValueAfter!47 lt!471689))))

(assert (=> b!1068168 (contains!6292 (+!3176 lt!471670 (tuple2!16213 lt!471673 zeroValueAfter!47)) lt!471689)))

(declare-fun lt!471684 () Unit!35016)

(assert (=> b!1068168 (= lt!471684 lt!471671)))

(declare-fun lt!471686 () ListLongMap!14189)

(assert (=> b!1068168 (= lt!471686 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471687 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471678 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471678 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471677 () Unit!35016)

(declare-fun addApplyDifferent!496 (ListLongMap!14189 (_ BitVec 64) V!39129 (_ BitVec 64)) Unit!35016)

(assert (=> b!1068168 (= lt!471677 (addApplyDifferent!496 lt!471686 lt!471687 minValue!907 lt!471678))))

(assert (=> b!1068168 (= (apply!933 (+!3176 lt!471686 (tuple2!16213 lt!471687 minValue!907)) lt!471678) (apply!933 lt!471686 lt!471678))))

(declare-fun lt!471672 () Unit!35016)

(assert (=> b!1068168 (= lt!471672 lt!471677)))

(declare-fun lt!471685 () ListLongMap!14189)

(assert (=> b!1068168 (= lt!471685 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471680 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471691 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471691 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471690 () Unit!35016)

(assert (=> b!1068168 (= lt!471690 (addApplyDifferent!496 lt!471685 lt!471680 zeroValueAfter!47 lt!471691))))

(assert (=> b!1068168 (= (apply!933 (+!3176 lt!471685 (tuple2!16213 lt!471680 zeroValueAfter!47)) lt!471691) (apply!933 lt!471685 lt!471691))))

(declare-fun lt!471688 () Unit!35016)

(assert (=> b!1068168 (= lt!471688 lt!471690)))

(declare-fun lt!471683 () ListLongMap!14189)

(assert (=> b!1068168 (= lt!471683 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471681 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471681 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471674 () (_ BitVec 64))

(assert (=> b!1068168 (= lt!471674 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068168 (= lt!471682 (addApplyDifferent!496 lt!471683 lt!471681 minValue!907 lt!471674))))

(assert (=> b!1068168 (= (apply!933 (+!3176 lt!471683 (tuple2!16213 lt!471681 minValue!907)) lt!471674) (apply!933 lt!471683 lt!471674))))

(declare-fun bm!45139 () Bool)

(declare-fun call!45143 () ListLongMap!14189)

(declare-fun call!45146 () ListLongMap!14189)

(assert (=> bm!45139 (= call!45143 call!45146)))

(declare-fun bm!45140 () Bool)

(declare-fun call!45147 () ListLongMap!14189)

(assert (=> bm!45140 (= call!45147 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45141 () Bool)

(declare-fun call!45145 () Bool)

(declare-fun lt!471679 () ListLongMap!14189)

(assert (=> bm!45141 (= call!45145 (contains!6292 lt!471679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!609265 () Bool)

(declare-fun b!1068169 () Bool)

(assert (=> b!1068169 (= e!609265 (= (apply!933 lt!471679 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)) (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1068169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33242 _values!955)))))

(assert (=> b!1068169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068171 () Bool)

(declare-fun e!609260 () Bool)

(assert (=> b!1068171 (= e!609260 (not call!45145))))

(declare-fun b!1068172 () Bool)

(declare-fun Unit!35020 () Unit!35016)

(assert (=> b!1068172 (= e!609269 Unit!35020)))

(declare-fun b!1068173 () Bool)

(declare-fun e!609270 () Bool)

(assert (=> b!1068173 (= e!609270 e!609265)))

(declare-fun res!712529 () Bool)

(assert (=> b!1068173 (=> (not res!712529) (not e!609265))))

(assert (=> b!1068173 (= res!712529 (contains!6292 lt!471679 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068174 () Bool)

(declare-fun e!609267 () ListLongMap!14189)

(declare-fun call!45148 () ListLongMap!14189)

(assert (=> b!1068174 (= e!609267 call!45148)))

(declare-fun b!1068175 () Bool)

(declare-fun e!609266 () ListLongMap!14189)

(declare-fun e!609271 () ListLongMap!14189)

(assert (=> b!1068175 (= e!609266 e!609271)))

(declare-fun c!107881 () Bool)

(assert (=> b!1068175 (= c!107881 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1068176 () Bool)

(assert (=> b!1068176 (= e!609267 call!45143)))

(declare-fun call!45144 () ListLongMap!14189)

(declare-fun bm!45142 () Bool)

(declare-fun c!107883 () Bool)

(assert (=> bm!45142 (= call!45144 (+!3176 (ite c!107883 call!45147 (ite c!107881 call!45146 call!45143)) (ite (or c!107883 c!107881) (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45143 () Bool)

(assert (=> bm!45143 (= call!45146 call!45147)))

(declare-fun b!1068177 () Bool)

(declare-fun res!712530 () Bool)

(declare-fun e!609261 () Bool)

(assert (=> b!1068177 (=> (not res!712530) (not e!609261))))

(assert (=> b!1068177 (= res!712530 e!609270)))

(declare-fun res!712531 () Bool)

(assert (=> b!1068177 (=> res!712531 e!609270)))

(declare-fun e!609268 () Bool)

(assert (=> b!1068177 (= res!712531 (not e!609268))))

(declare-fun res!712533 () Bool)

(assert (=> b!1068177 (=> (not res!712533) (not e!609268))))

(assert (=> b!1068177 (= res!712533 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068178 () Bool)

(declare-fun e!609272 () Bool)

(assert (=> b!1068178 (= e!609272 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068179 () Bool)

(declare-fun res!712528 () Bool)

(assert (=> b!1068179 (=> (not res!712528) (not e!609261))))

(assert (=> b!1068179 (= res!712528 e!609260)))

(declare-fun c!107880 () Bool)

(assert (=> b!1068179 (= c!107880 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068180 () Bool)

(declare-fun c!107882 () Bool)

(assert (=> b!1068180 (= c!107882 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1068180 (= e!609271 e!609267)))

(declare-fun bm!45144 () Bool)

(declare-fun call!45142 () Bool)

(assert (=> bm!45144 (= call!45142 (contains!6292 lt!471679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068181 () Bool)

(assert (=> b!1068181 (= e!609271 call!45148)))

(declare-fun b!1068182 () Bool)

(assert (=> b!1068182 (= e!609266 (+!3176 call!45144 (tuple2!16213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45145 () Bool)

(assert (=> bm!45145 (= call!45148 call!45144)))

(declare-fun b!1068170 () Bool)

(declare-fun e!609264 () Bool)

(assert (=> b!1068170 (= e!609260 e!609264)))

(declare-fun res!712535 () Bool)

(assert (=> b!1068170 (= res!712535 call!45145)))

(assert (=> b!1068170 (=> (not res!712535) (not e!609264))))

(declare-fun d!129549 () Bool)

(assert (=> d!129549 e!609261))

(declare-fun res!712527 () Bool)

(assert (=> d!129549 (=> (not res!712527) (not e!609261))))

(assert (=> d!129549 (= res!712527 (or (bvsge #b00000000000000000000000000000000 (size!33241 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))))

(declare-fun lt!471675 () ListLongMap!14189)

(assert (=> d!129549 (= lt!471679 lt!471675)))

(declare-fun lt!471676 () Unit!35016)

(assert (=> d!129549 (= lt!471676 e!609269)))

(declare-fun c!107879 () Bool)

(assert (=> d!129549 (= c!107879 e!609272)))

(declare-fun res!712532 () Bool)

(assert (=> d!129549 (=> (not res!712532) (not e!609272))))

(assert (=> d!129549 (= res!712532 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> d!129549 (= lt!471675 e!609266)))

(assert (=> d!129549 (= c!107883 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129549 (validMask!0 mask!1515)))

(assert (=> d!129549 (= (getCurrentListMap!4057 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471679)))

(declare-fun b!1068183 () Bool)

(declare-fun e!609263 () Bool)

(assert (=> b!1068183 (= e!609263 (not call!45142))))

(declare-fun b!1068184 () Bool)

(assert (=> b!1068184 (= e!609268 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068185 () Bool)

(declare-fun e!609262 () Bool)

(assert (=> b!1068185 (= e!609262 (= (apply!933 lt!471679 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1068186 () Bool)

(assert (=> b!1068186 (= e!609264 (= (apply!933 lt!471679 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1068187 () Bool)

(assert (=> b!1068187 (= e!609261 e!609263)))

(declare-fun c!107878 () Bool)

(assert (=> b!1068187 (= c!107878 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1068188 () Bool)

(assert (=> b!1068188 (= e!609263 e!609262)))

(declare-fun res!712534 () Bool)

(assert (=> b!1068188 (= res!712534 call!45142)))

(assert (=> b!1068188 (=> (not res!712534) (not e!609262))))

(assert (= (and d!129549 c!107883) b!1068182))

(assert (= (and d!129549 (not c!107883)) b!1068175))

(assert (= (and b!1068175 c!107881) b!1068181))

(assert (= (and b!1068175 (not c!107881)) b!1068180))

(assert (= (and b!1068180 c!107882) b!1068174))

(assert (= (and b!1068180 (not c!107882)) b!1068176))

(assert (= (or b!1068174 b!1068176) bm!45139))

(assert (= (or b!1068181 bm!45139) bm!45143))

(assert (= (or b!1068181 b!1068174) bm!45145))

(assert (= (or b!1068182 bm!45143) bm!45140))

(assert (= (or b!1068182 bm!45145) bm!45142))

(assert (= (and d!129549 res!712532) b!1068178))

(assert (= (and d!129549 c!107879) b!1068168))

(assert (= (and d!129549 (not c!107879)) b!1068172))

(assert (= (and d!129549 res!712527) b!1068177))

(assert (= (and b!1068177 res!712533) b!1068184))

(assert (= (and b!1068177 (not res!712531)) b!1068173))

(assert (= (and b!1068173 res!712529) b!1068169))

(assert (= (and b!1068177 res!712530) b!1068179))

(assert (= (and b!1068179 c!107880) b!1068170))

(assert (= (and b!1068179 (not c!107880)) b!1068171))

(assert (= (and b!1068170 res!712535) b!1068186))

(assert (= (or b!1068170 b!1068171) bm!45141))

(assert (= (and b!1068179 res!712528) b!1068187))

(assert (= (and b!1068187 c!107878) b!1068188))

(assert (= (and b!1068187 (not c!107878)) b!1068183))

(assert (= (and b!1068188 res!712534) b!1068185))

(assert (= (or b!1068188 b!1068183) bm!45144))

(declare-fun b_lambda!16579 () Bool)

(assert (=> (not b_lambda!16579) (not b!1068169)))

(assert (=> b!1068169 t!32099))

(declare-fun b_and!34481 () Bool)

(assert (= b_and!34479 (and (=> t!32099 result!14729) b_and!34481)))

(assert (=> d!129549 m!987063))

(assert (=> b!1068178 m!987137))

(assert (=> b!1068178 m!987137))

(assert (=> b!1068178 m!987145))

(declare-fun m!987207 () Bool)

(assert (=> bm!45144 m!987207))

(declare-fun m!987209 () Bool)

(assert (=> b!1068168 m!987209))

(declare-fun m!987211 () Bool)

(assert (=> b!1068168 m!987211))

(assert (=> b!1068168 m!987047))

(declare-fun m!987213 () Bool)

(assert (=> b!1068168 m!987213))

(declare-fun m!987215 () Bool)

(assert (=> b!1068168 m!987215))

(declare-fun m!987217 () Bool)

(assert (=> b!1068168 m!987217))

(declare-fun m!987219 () Bool)

(assert (=> b!1068168 m!987219))

(declare-fun m!987221 () Bool)

(assert (=> b!1068168 m!987221))

(assert (=> b!1068168 m!987209))

(declare-fun m!987223 () Bool)

(assert (=> b!1068168 m!987223))

(assert (=> b!1068168 m!987213))

(assert (=> b!1068168 m!987217))

(declare-fun m!987225 () Bool)

(assert (=> b!1068168 m!987225))

(declare-fun m!987227 () Bool)

(assert (=> b!1068168 m!987227))

(declare-fun m!987229 () Bool)

(assert (=> b!1068168 m!987229))

(declare-fun m!987231 () Bool)

(assert (=> b!1068168 m!987231))

(assert (=> b!1068168 m!987229))

(declare-fun m!987233 () Bool)

(assert (=> b!1068168 m!987233))

(declare-fun m!987235 () Bool)

(assert (=> b!1068168 m!987235))

(declare-fun m!987237 () Bool)

(assert (=> b!1068168 m!987237))

(assert (=> b!1068168 m!987137))

(declare-fun m!987239 () Bool)

(assert (=> bm!45141 m!987239))

(declare-fun m!987241 () Bool)

(assert (=> b!1068182 m!987241))

(assert (=> b!1068169 m!987165))

(assert (=> b!1068169 m!987165))

(assert (=> b!1068169 m!987163))

(assert (=> b!1068169 m!987167))

(assert (=> b!1068169 m!987137))

(declare-fun m!987243 () Bool)

(assert (=> b!1068169 m!987243))

(assert (=> b!1068169 m!987163))

(assert (=> b!1068169 m!987137))

(declare-fun m!987245 () Bool)

(assert (=> bm!45142 m!987245))

(assert (=> b!1068184 m!987137))

(assert (=> b!1068184 m!987137))

(assert (=> b!1068184 m!987145))

(assert (=> b!1068173 m!987137))

(assert (=> b!1068173 m!987137))

(declare-fun m!987247 () Bool)

(assert (=> b!1068173 m!987247))

(declare-fun m!987249 () Bool)

(assert (=> b!1068186 m!987249))

(assert (=> bm!45140 m!987047))

(declare-fun m!987251 () Bool)

(assert (=> b!1068185 m!987251))

(assert (=> b!1067987 d!129549))

(declare-fun b!1068189 () Bool)

(declare-fun e!609282 () Unit!35016)

(declare-fun lt!471704 () Unit!35016)

(assert (=> b!1068189 (= e!609282 lt!471704)))

(declare-fun lt!471692 () ListLongMap!14189)

(assert (=> b!1068189 (= lt!471692 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471695 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471711 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471711 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471693 () Unit!35016)

(assert (=> b!1068189 (= lt!471693 (addStillContains!640 lt!471692 lt!471695 zeroValueBefore!47 lt!471711))))

(assert (=> b!1068189 (contains!6292 (+!3176 lt!471692 (tuple2!16213 lt!471695 zeroValueBefore!47)) lt!471711)))

(declare-fun lt!471706 () Unit!35016)

(assert (=> b!1068189 (= lt!471706 lt!471693)))

(declare-fun lt!471708 () ListLongMap!14189)

(assert (=> b!1068189 (= lt!471708 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471709 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471709 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471700 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471700 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471699 () Unit!35016)

(assert (=> b!1068189 (= lt!471699 (addApplyDifferent!496 lt!471708 lt!471709 minValue!907 lt!471700))))

(assert (=> b!1068189 (= (apply!933 (+!3176 lt!471708 (tuple2!16213 lt!471709 minValue!907)) lt!471700) (apply!933 lt!471708 lt!471700))))

(declare-fun lt!471694 () Unit!35016)

(assert (=> b!1068189 (= lt!471694 lt!471699)))

(declare-fun lt!471707 () ListLongMap!14189)

(assert (=> b!1068189 (= lt!471707 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471702 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471713 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471713 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471712 () Unit!35016)

(assert (=> b!1068189 (= lt!471712 (addApplyDifferent!496 lt!471707 lt!471702 zeroValueBefore!47 lt!471713))))

(assert (=> b!1068189 (= (apply!933 (+!3176 lt!471707 (tuple2!16213 lt!471702 zeroValueBefore!47)) lt!471713) (apply!933 lt!471707 lt!471713))))

(declare-fun lt!471710 () Unit!35016)

(assert (=> b!1068189 (= lt!471710 lt!471712)))

(declare-fun lt!471705 () ListLongMap!14189)

(assert (=> b!1068189 (= lt!471705 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471703 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471703 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!471696 () (_ BitVec 64))

(assert (=> b!1068189 (= lt!471696 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068189 (= lt!471704 (addApplyDifferent!496 lt!471705 lt!471703 minValue!907 lt!471696))))

(assert (=> b!1068189 (= (apply!933 (+!3176 lt!471705 (tuple2!16213 lt!471703 minValue!907)) lt!471696) (apply!933 lt!471705 lt!471696))))

(declare-fun bm!45146 () Bool)

(declare-fun call!45150 () ListLongMap!14189)

(declare-fun call!45153 () ListLongMap!14189)

(assert (=> bm!45146 (= call!45150 call!45153)))

(declare-fun bm!45147 () Bool)

(declare-fun call!45154 () ListLongMap!14189)

(assert (=> bm!45147 (= call!45154 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45148 () Bool)

(declare-fun call!45152 () Bool)

(declare-fun lt!471701 () ListLongMap!14189)

(assert (=> bm!45148 (= call!45152 (contains!6292 lt!471701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!609278 () Bool)

(declare-fun b!1068190 () Bool)

(assert (=> b!1068190 (= e!609278 (= (apply!933 lt!471701 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)) (get!17077 (select (arr!32705 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1068190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33242 _values!955)))))

(assert (=> b!1068190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068192 () Bool)

(declare-fun e!609273 () Bool)

(assert (=> b!1068192 (= e!609273 (not call!45152))))

(declare-fun b!1068193 () Bool)

(declare-fun Unit!35021 () Unit!35016)

(assert (=> b!1068193 (= e!609282 Unit!35021)))

(declare-fun b!1068194 () Bool)

(declare-fun e!609283 () Bool)

(assert (=> b!1068194 (= e!609283 e!609278)))

(declare-fun res!712538 () Bool)

(assert (=> b!1068194 (=> (not res!712538) (not e!609278))))

(assert (=> b!1068194 (= res!712538 (contains!6292 lt!471701 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068195 () Bool)

(declare-fun e!609280 () ListLongMap!14189)

(declare-fun call!45155 () ListLongMap!14189)

(assert (=> b!1068195 (= e!609280 call!45155)))

(declare-fun b!1068196 () Bool)

(declare-fun e!609279 () ListLongMap!14189)

(declare-fun e!609284 () ListLongMap!14189)

(assert (=> b!1068196 (= e!609279 e!609284)))

(declare-fun c!107887 () Bool)

(assert (=> b!1068196 (= c!107887 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1068197 () Bool)

(assert (=> b!1068197 (= e!609280 call!45150)))

(declare-fun call!45151 () ListLongMap!14189)

(declare-fun bm!45149 () Bool)

(declare-fun c!107889 () Bool)

(assert (=> bm!45149 (= call!45151 (+!3176 (ite c!107889 call!45154 (ite c!107887 call!45153 call!45150)) (ite (or c!107889 c!107887) (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45150 () Bool)

(assert (=> bm!45150 (= call!45153 call!45154)))

(declare-fun b!1068198 () Bool)

(declare-fun res!712539 () Bool)

(declare-fun e!609274 () Bool)

(assert (=> b!1068198 (=> (not res!712539) (not e!609274))))

(assert (=> b!1068198 (= res!712539 e!609283)))

(declare-fun res!712540 () Bool)

(assert (=> b!1068198 (=> res!712540 e!609283)))

(declare-fun e!609281 () Bool)

(assert (=> b!1068198 (= res!712540 (not e!609281))))

(declare-fun res!712542 () Bool)

(assert (=> b!1068198 (=> (not res!712542) (not e!609281))))

(assert (=> b!1068198 (= res!712542 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(declare-fun b!1068199 () Bool)

(declare-fun e!609285 () Bool)

(assert (=> b!1068199 (= e!609285 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068200 () Bool)

(declare-fun res!712537 () Bool)

(assert (=> b!1068200 (=> (not res!712537) (not e!609274))))

(assert (=> b!1068200 (= res!712537 e!609273)))

(declare-fun c!107886 () Bool)

(assert (=> b!1068200 (= c!107886 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068201 () Bool)

(declare-fun c!107888 () Bool)

(assert (=> b!1068201 (= c!107888 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1068201 (= e!609284 e!609280)))

(declare-fun bm!45151 () Bool)

(declare-fun call!45149 () Bool)

(assert (=> bm!45151 (= call!45149 (contains!6292 lt!471701 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068202 () Bool)

(assert (=> b!1068202 (= e!609284 call!45155)))

(declare-fun b!1068203 () Bool)

(assert (=> b!1068203 (= e!609279 (+!3176 call!45151 (tuple2!16213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45152 () Bool)

(assert (=> bm!45152 (= call!45155 call!45151)))

(declare-fun b!1068191 () Bool)

(declare-fun e!609277 () Bool)

(assert (=> b!1068191 (= e!609273 e!609277)))

(declare-fun res!712544 () Bool)

(assert (=> b!1068191 (= res!712544 call!45152)))

(assert (=> b!1068191 (=> (not res!712544) (not e!609277))))

(declare-fun d!129551 () Bool)

(assert (=> d!129551 e!609274))

(declare-fun res!712536 () Bool)

(assert (=> d!129551 (=> (not res!712536) (not e!609274))))

(assert (=> d!129551 (= res!712536 (or (bvsge #b00000000000000000000000000000000 (size!33241 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))))

(declare-fun lt!471697 () ListLongMap!14189)

(assert (=> d!129551 (= lt!471701 lt!471697)))

(declare-fun lt!471698 () Unit!35016)

(assert (=> d!129551 (= lt!471698 e!609282)))

(declare-fun c!107885 () Bool)

(assert (=> d!129551 (= c!107885 e!609285)))

(declare-fun res!712541 () Bool)

(assert (=> d!129551 (=> (not res!712541) (not e!609285))))

(assert (=> d!129551 (= res!712541 (bvslt #b00000000000000000000000000000000 (size!33241 _keys!1163)))))

(assert (=> d!129551 (= lt!471697 e!609279)))

(assert (=> d!129551 (= c!107889 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129551 (validMask!0 mask!1515)))

(assert (=> d!129551 (= (getCurrentListMap!4057 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471701)))

(declare-fun b!1068204 () Bool)

(declare-fun e!609276 () Bool)

(assert (=> b!1068204 (= e!609276 (not call!45149))))

(declare-fun b!1068205 () Bool)

(assert (=> b!1068205 (= e!609281 (validKeyInArray!0 (select (arr!32704 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068206 () Bool)

(declare-fun e!609275 () Bool)

(assert (=> b!1068206 (= e!609275 (= (apply!933 lt!471701 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1068207 () Bool)

(assert (=> b!1068207 (= e!609277 (= (apply!933 lt!471701 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1068208 () Bool)

(assert (=> b!1068208 (= e!609274 e!609276)))

(declare-fun c!107884 () Bool)

(assert (=> b!1068208 (= c!107884 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1068209 () Bool)

(assert (=> b!1068209 (= e!609276 e!609275)))

(declare-fun res!712543 () Bool)

(assert (=> b!1068209 (= res!712543 call!45149)))

(assert (=> b!1068209 (=> (not res!712543) (not e!609275))))

(assert (= (and d!129551 c!107889) b!1068203))

(assert (= (and d!129551 (not c!107889)) b!1068196))

(assert (= (and b!1068196 c!107887) b!1068202))

(assert (= (and b!1068196 (not c!107887)) b!1068201))

(assert (= (and b!1068201 c!107888) b!1068195))

(assert (= (and b!1068201 (not c!107888)) b!1068197))

(assert (= (or b!1068195 b!1068197) bm!45146))

(assert (= (or b!1068202 bm!45146) bm!45150))

(assert (= (or b!1068202 b!1068195) bm!45152))

(assert (= (or b!1068203 bm!45150) bm!45147))

(assert (= (or b!1068203 bm!45152) bm!45149))

(assert (= (and d!129551 res!712541) b!1068199))

(assert (= (and d!129551 c!107885) b!1068189))

(assert (= (and d!129551 (not c!107885)) b!1068193))

(assert (= (and d!129551 res!712536) b!1068198))

(assert (= (and b!1068198 res!712542) b!1068205))

(assert (= (and b!1068198 (not res!712540)) b!1068194))

(assert (= (and b!1068194 res!712538) b!1068190))

(assert (= (and b!1068198 res!712539) b!1068200))

(assert (= (and b!1068200 c!107886) b!1068191))

(assert (= (and b!1068200 (not c!107886)) b!1068192))

(assert (= (and b!1068191 res!712544) b!1068207))

(assert (= (or b!1068191 b!1068192) bm!45148))

(assert (= (and b!1068200 res!712537) b!1068208))

(assert (= (and b!1068208 c!107884) b!1068209))

(assert (= (and b!1068208 (not c!107884)) b!1068204))

(assert (= (and b!1068209 res!712543) b!1068206))

(assert (= (or b!1068209 b!1068204) bm!45151))

(declare-fun b_lambda!16581 () Bool)

(assert (=> (not b_lambda!16581) (not b!1068190)))

(assert (=> b!1068190 t!32099))

(declare-fun b_and!34483 () Bool)

(assert (= b_and!34481 (and (=> t!32099 result!14729) b_and!34483)))

(assert (=> d!129551 m!987063))

(assert (=> b!1068199 m!987137))

(assert (=> b!1068199 m!987137))

(assert (=> b!1068199 m!987145))

(declare-fun m!987253 () Bool)

(assert (=> bm!45151 m!987253))

(declare-fun m!987255 () Bool)

(assert (=> b!1068189 m!987255))

(declare-fun m!987257 () Bool)

(assert (=> b!1068189 m!987257))

(assert (=> b!1068189 m!987049))

(declare-fun m!987259 () Bool)

(assert (=> b!1068189 m!987259))

(declare-fun m!987261 () Bool)

(assert (=> b!1068189 m!987261))

(declare-fun m!987263 () Bool)

(assert (=> b!1068189 m!987263))

(declare-fun m!987265 () Bool)

(assert (=> b!1068189 m!987265))

(declare-fun m!987267 () Bool)

(assert (=> b!1068189 m!987267))

(assert (=> b!1068189 m!987255))

(declare-fun m!987269 () Bool)

(assert (=> b!1068189 m!987269))

(assert (=> b!1068189 m!987259))

(assert (=> b!1068189 m!987263))

(declare-fun m!987271 () Bool)

(assert (=> b!1068189 m!987271))

(declare-fun m!987273 () Bool)

(assert (=> b!1068189 m!987273))

(declare-fun m!987275 () Bool)

(assert (=> b!1068189 m!987275))

(declare-fun m!987277 () Bool)

(assert (=> b!1068189 m!987277))

(assert (=> b!1068189 m!987275))

(declare-fun m!987279 () Bool)

(assert (=> b!1068189 m!987279))

(declare-fun m!987281 () Bool)

(assert (=> b!1068189 m!987281))

(declare-fun m!987283 () Bool)

(assert (=> b!1068189 m!987283))

(assert (=> b!1068189 m!987137))

(declare-fun m!987285 () Bool)

(assert (=> bm!45148 m!987285))

(declare-fun m!987287 () Bool)

(assert (=> b!1068203 m!987287))

(assert (=> b!1068190 m!987165))

(assert (=> b!1068190 m!987165))

(assert (=> b!1068190 m!987163))

(assert (=> b!1068190 m!987167))

(assert (=> b!1068190 m!987137))

(declare-fun m!987289 () Bool)

(assert (=> b!1068190 m!987289))

(assert (=> b!1068190 m!987163))

(assert (=> b!1068190 m!987137))

(declare-fun m!987291 () Bool)

(assert (=> bm!45149 m!987291))

(assert (=> b!1068205 m!987137))

(assert (=> b!1068205 m!987137))

(assert (=> b!1068205 m!987145))

(assert (=> b!1068194 m!987137))

(assert (=> b!1068194 m!987137))

(declare-fun m!987293 () Bool)

(assert (=> b!1068194 m!987293))

(declare-fun m!987295 () Bool)

(assert (=> b!1068207 m!987295))

(assert (=> bm!45147 m!987049))

(declare-fun m!987297 () Bool)

(assert (=> b!1068206 m!987297))

(assert (=> b!1067987 d!129551))

(declare-fun d!129553 () Bool)

(declare-fun e!609288 () Bool)

(assert (=> d!129553 e!609288))

(declare-fun res!712550 () Bool)

(assert (=> d!129553 (=> (not res!712550) (not e!609288))))

(declare-fun lt!471722 () ListLongMap!14189)

(assert (=> d!129553 (= res!712550 (contains!6292 lt!471722 (_1!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!471723 () List!22780)

(assert (=> d!129553 (= lt!471722 (ListLongMap!14190 lt!471723))))

(declare-fun lt!471725 () Unit!35016)

(declare-fun lt!471724 () Unit!35016)

(assert (=> d!129553 (= lt!471725 lt!471724)))

(declare-datatypes ((Option!647 0))(
  ( (Some!646 (v!15410 V!39129)) (None!645) )
))
(declare-fun getValueByKey!596 (List!22780 (_ BitVec 64)) Option!647)

(assert (=> d!129553 (= (getValueByKey!596 lt!471723 (_1!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!646 (_2!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!284 (List!22780 (_ BitVec 64) V!39129) Unit!35016)

(assert (=> d!129553 (= lt!471724 (lemmaContainsTupThenGetReturnValue!284 lt!471723 (_1!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!377 (List!22780 (_ BitVec 64) V!39129) List!22780)

(assert (=> d!129553 (= lt!471723 (insertStrictlySorted!377 (toList!7110 lt!471539) (_1!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129553 (= (+!3176 lt!471539 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!471722)))

(declare-fun b!1068214 () Bool)

(declare-fun res!712549 () Bool)

(assert (=> b!1068214 (=> (not res!712549) (not e!609288))))

(assert (=> b!1068214 (= res!712549 (= (getValueByKey!596 (toList!7110 lt!471722) (_1!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!646 (_2!8117 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1068215 () Bool)

(declare-fun contains!6293 (List!22780 tuple2!16212) Bool)

(assert (=> b!1068215 (= e!609288 (contains!6293 (toList!7110 lt!471722) (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129553 res!712550) b!1068214))

(assert (= (and b!1068214 res!712549) b!1068215))

(declare-fun m!987299 () Bool)

(assert (=> d!129553 m!987299))

(declare-fun m!987301 () Bool)

(assert (=> d!129553 m!987301))

(declare-fun m!987303 () Bool)

(assert (=> d!129553 m!987303))

(declare-fun m!987305 () Bool)

(assert (=> d!129553 m!987305))

(declare-fun m!987307 () Bool)

(assert (=> b!1068214 m!987307))

(declare-fun m!987309 () Bool)

(assert (=> b!1068215 m!987309))

(assert (=> b!1067987 d!129553))

(declare-fun d!129555 () Bool)

(assert (=> d!129555 (= (-!623 (+!3176 lt!471539 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!471539)))

(declare-fun lt!471728 () Unit!35016)

(declare-fun choose!1737 (ListLongMap!14189 (_ BitVec 64) V!39129) Unit!35016)

(assert (=> d!129555 (= lt!471728 (choose!1737 lt!471539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129555 (not (contains!6292 lt!471539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129555 (= (addThenRemoveForNewKeyIsSame!33 lt!471539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!471728)))

(declare-fun bs!31414 () Bool)

(assert (= bs!31414 d!129555))

(assert (=> bs!31414 m!987051))

(assert (=> bs!31414 m!987051))

(declare-fun m!987311 () Bool)

(assert (=> bs!31414 m!987311))

(declare-fun m!987313 () Bool)

(assert (=> bs!31414 m!987313))

(declare-fun m!987315 () Bool)

(assert (=> bs!31414 m!987315))

(assert (=> b!1067987 d!129555))

(declare-fun b!1068222 () Bool)

(declare-fun e!609294 () Bool)

(assert (=> b!1068222 (= e!609294 tp_is_empty!25495)))

(declare-fun mapNonEmpty!39940 () Bool)

(declare-fun mapRes!39940 () Bool)

(declare-fun tp!76511 () Bool)

(assert (=> mapNonEmpty!39940 (= mapRes!39940 (and tp!76511 e!609294))))

(declare-fun mapKey!39940 () (_ BitVec 32))

(declare-fun mapValue!39940 () ValueCell!12044)

(declare-fun mapRest!39940 () (Array (_ BitVec 32) ValueCell!12044))

(assert (=> mapNonEmpty!39940 (= mapRest!39931 (store mapRest!39940 mapKey!39940 mapValue!39940))))

(declare-fun condMapEmpty!39940 () Bool)

(declare-fun mapDefault!39940 () ValueCell!12044)

(assert (=> mapNonEmpty!39931 (= condMapEmpty!39940 (= mapRest!39931 ((as const (Array (_ BitVec 32) ValueCell!12044)) mapDefault!39940)))))

(declare-fun e!609293 () Bool)

(assert (=> mapNonEmpty!39931 (= tp!76495 (and e!609293 mapRes!39940))))

(declare-fun mapIsEmpty!39940 () Bool)

(assert (=> mapIsEmpty!39940 mapRes!39940))

(declare-fun b!1068223 () Bool)

(assert (=> b!1068223 (= e!609293 tp_is_empty!25495)))

(assert (= (and mapNonEmpty!39931 condMapEmpty!39940) mapIsEmpty!39940))

(assert (= (and mapNonEmpty!39931 (not condMapEmpty!39940)) mapNonEmpty!39940))

(assert (= (and mapNonEmpty!39940 ((_ is ValueCellFull!12044) mapValue!39940)) b!1068222))

(assert (= (and mapNonEmpty!39931 ((_ is ValueCellFull!12044) mapDefault!39940)) b!1068223))

(declare-fun m!987317 () Bool)

(assert (=> mapNonEmpty!39940 m!987317))

(declare-fun b_lambda!16583 () Bool)

(assert (= b_lambda!16573 (or (and start!94558 b_free!21685) b_lambda!16583)))

(declare-fun b_lambda!16585 () Bool)

(assert (= b_lambda!16579 (or (and start!94558 b_free!21685) b_lambda!16585)))

(declare-fun b_lambda!16587 () Bool)

(assert (= b_lambda!16577 (or (and start!94558 b_free!21685) b_lambda!16587)))

(declare-fun b_lambda!16589 () Bool)

(assert (= b_lambda!16575 (or (and start!94558 b_free!21685) b_lambda!16589)))

(declare-fun b_lambda!16591 () Bool)

(assert (= b_lambda!16571 (or (and start!94558 b_free!21685) b_lambda!16591)))

(declare-fun b_lambda!16593 () Bool)

(assert (= b_lambda!16581 (or (and start!94558 b_free!21685) b_lambda!16593)))

(check-sat (not b_lambda!16591) (not b!1068073) (not bm!45148) (not b!1068072) (not b!1068120) b_and!34483 (not b!1068110) (not b!1068203) (not b_lambda!16589) (not b!1068124) (not bm!45140) (not bm!45124) (not b!1068125) (not b_lambda!16585) (not b!1068111) (not bm!45151) (not bm!45141) (not d!129549) (not d!129553) (not b!1068106) (not bm!45149) (not b!1068103) (not b!1068194) (not b!1068185) (not b!1068214) (not b!1068182) (not b!1068169) (not bm!45123) (not b!1068199) (not b!1068075) (not mapNonEmpty!39940) (not d!129543) (not b_lambda!16583) (not bm!45117) (not d!129545) (not b!1068119) tp_is_empty!25495 (not b_lambda!16593) (not d!129541) (not d!129551) (not b!1068178) (not b!1068189) (not bm!45142) (not b!1068186) (not b!1068058) (not b_next!21685) (not b!1068057) (not b!1068184) (not b!1068168) (not d!129539) (not d!129555) (not b!1068114) (not b!1068101) (not b!1068117) (not b!1068190) (not b!1068115) (not b!1068205) (not b!1068108) (not b!1068100) (not b!1068105) (not d!129547) (not b!1068122) (not b!1068206) (not bm!45144) (not b!1068207) (not b!1068215) (not bm!45147) (not b!1068173) (not b_lambda!16587) (not bm!45120))
(check-sat b_and!34483 (not b_next!21685))
