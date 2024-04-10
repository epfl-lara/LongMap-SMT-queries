; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94550 () Bool)

(assert start!94550)

(declare-fun b_free!21855 () Bool)

(declare-fun b_next!21855 () Bool)

(assert (=> start!94550 (= b_free!21855 (not b_next!21855))))

(declare-fun tp!77015 () Bool)

(declare-fun b_and!34657 () Bool)

(assert (=> start!94550 (= tp!77015 b_and!34657)))

(declare-fun b!1069200 () Bool)

(declare-fun e!610166 () Bool)

(declare-fun e!610163 () Bool)

(assert (=> b!1069200 (= e!610166 (not e!610163))))

(declare-fun res!713439 () Bool)

(assert (=> b!1069200 (=> res!713439 e!610163)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069200 (= res!713439 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39355 0))(
  ( (V!39356 (val!12883 Int)) )
))
(declare-datatypes ((tuple2!16374 0))(
  ( (tuple2!16375 (_1!8198 (_ BitVec 64)) (_2!8198 V!39355)) )
))
(declare-datatypes ((List!22919 0))(
  ( (Nil!22916) (Cons!22915 (h!24124 tuple2!16374) (t!32246 List!22919)) )
))
(declare-datatypes ((ListLongMap!14343 0))(
  ( (ListLongMap!14344 (toList!7187 List!22919)) )
))
(declare-fun lt!472447 () ListLongMap!14343)

(declare-fun lt!472449 () ListLongMap!14343)

(assert (=> b!1069200 (= lt!472447 lt!472449)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39355)

(declare-datatypes ((Unit!35171 0))(
  ( (Unit!35172) )
))
(declare-fun lt!472451 () Unit!35171)

(declare-datatypes ((ValueCell!12129 0))(
  ( (ValueCellFull!12129 (v!15498 V!39355)) (EmptyCell!12129) )
))
(declare-datatypes ((array!68307 0))(
  ( (array!68308 (arr!32852 (Array (_ BitVec 32) ValueCell!12129)) (size!33388 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68307)

(declare-fun minValue!907 () V!39355)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39355)

(declare-datatypes ((array!68309 0))(
  ( (array!68310 (arr!32853 (Array (_ BitVec 32) (_ BitVec 64))) (size!33389 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68309)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!800 (array!68309 array!68307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39355 V!39355 V!39355 V!39355 (_ BitVec 32) Int) Unit!35171)

(assert (=> b!1069200 (= lt!472451 (lemmaNoChangeToArrayThenSameMapNoExtras!800 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3763 (array!68309 array!68307 (_ BitVec 32) (_ BitVec 32) V!39355 V!39355 (_ BitVec 32) Int) ListLongMap!14343)

(assert (=> b!1069200 (= lt!472449 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069200 (= lt!472447 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069201 () Bool)

(declare-fun res!713442 () Bool)

(assert (=> b!1069201 (=> (not res!713442) (not e!610166))))

(assert (=> b!1069201 (= res!713442 (and (= (size!33388 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33389 _keys!1163) (size!33388 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069202 () Bool)

(declare-fun e!610162 () Bool)

(assert (=> b!1069202 (= e!610163 e!610162)))

(declare-fun res!713443 () Bool)

(assert (=> b!1069202 (=> res!713443 e!610162)))

(declare-fun lt!472450 () ListLongMap!14343)

(declare-fun contains!6314 (ListLongMap!14343 (_ BitVec 64)) Bool)

(assert (=> b!1069202 (= res!713443 (contains!6314 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4110 (array!68309 array!68307 (_ BitVec 32) (_ BitVec 32) V!39355 V!39355 (_ BitVec 32) Int) ListLongMap!14343)

(assert (=> b!1069202 (= lt!472450 (getCurrentListMap!4110 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069203 () Bool)

(declare-fun e!610160 () Bool)

(declare-fun tp_is_empty!25665 () Bool)

(assert (=> b!1069203 (= e!610160 tp_is_empty!25665)))

(declare-fun b!1069204 () Bool)

(assert (=> b!1069204 (= e!610162 (bvsle #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun -!666 (ListLongMap!14343 (_ BitVec 64)) ListLongMap!14343)

(assert (=> b!1069204 (= (-!666 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472450)))

(declare-fun lt!472448 () Unit!35171)

(declare-fun removeNotPresentStillSame!76 (ListLongMap!14343 (_ BitVec 64)) Unit!35171)

(assert (=> b!1069204 (= lt!472448 (removeNotPresentStillSame!76 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069205 () Bool)

(declare-fun res!713440 () Bool)

(assert (=> b!1069205 (=> (not res!713440) (not e!610166))))

(declare-datatypes ((List!22920 0))(
  ( (Nil!22917) (Cons!22916 (h!24125 (_ BitVec 64)) (t!32247 List!22920)) )
))
(declare-fun arrayNoDuplicates!0 (array!68309 (_ BitVec 32) List!22920) Bool)

(assert (=> b!1069205 (= res!713440 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22917))))

(declare-fun mapNonEmpty!40195 () Bool)

(declare-fun mapRes!40195 () Bool)

(declare-fun tp!77014 () Bool)

(assert (=> mapNonEmpty!40195 (= mapRes!40195 (and tp!77014 e!610160))))

(declare-fun mapRest!40195 () (Array (_ BitVec 32) ValueCell!12129))

(declare-fun mapValue!40195 () ValueCell!12129)

(declare-fun mapKey!40195 () (_ BitVec 32))

(assert (=> mapNonEmpty!40195 (= (arr!32852 _values!955) (store mapRest!40195 mapKey!40195 mapValue!40195))))

(declare-fun mapIsEmpty!40195 () Bool)

(assert (=> mapIsEmpty!40195 mapRes!40195))

(declare-fun res!713441 () Bool)

(assert (=> start!94550 (=> (not res!713441) (not e!610166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94550 (= res!713441 (validMask!0 mask!1515))))

(assert (=> start!94550 e!610166))

(assert (=> start!94550 true))

(assert (=> start!94550 tp_is_empty!25665))

(declare-fun e!610161 () Bool)

(declare-fun array_inv!25426 (array!68307) Bool)

(assert (=> start!94550 (and (array_inv!25426 _values!955) e!610161)))

(assert (=> start!94550 tp!77015))

(declare-fun array_inv!25427 (array!68309) Bool)

(assert (=> start!94550 (array_inv!25427 _keys!1163)))

(declare-fun b!1069206 () Bool)

(declare-fun res!713438 () Bool)

(assert (=> b!1069206 (=> (not res!713438) (not e!610166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68309 (_ BitVec 32)) Bool)

(assert (=> b!1069206 (= res!713438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069207 () Bool)

(declare-fun e!610164 () Bool)

(assert (=> b!1069207 (= e!610164 tp_is_empty!25665)))

(declare-fun b!1069208 () Bool)

(assert (=> b!1069208 (= e!610161 (and e!610164 mapRes!40195))))

(declare-fun condMapEmpty!40195 () Bool)

(declare-fun mapDefault!40195 () ValueCell!12129)

(assert (=> b!1069208 (= condMapEmpty!40195 (= (arr!32852 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12129)) mapDefault!40195)))))

(assert (= (and start!94550 res!713441) b!1069201))

(assert (= (and b!1069201 res!713442) b!1069206))

(assert (= (and b!1069206 res!713438) b!1069205))

(assert (= (and b!1069205 res!713440) b!1069200))

(assert (= (and b!1069200 (not res!713439)) b!1069202))

(assert (= (and b!1069202 (not res!713443)) b!1069204))

(assert (= (and b!1069208 condMapEmpty!40195) mapIsEmpty!40195))

(assert (= (and b!1069208 (not condMapEmpty!40195)) mapNonEmpty!40195))

(get-info :version)

(assert (= (and mapNonEmpty!40195 ((_ is ValueCellFull!12129) mapValue!40195)) b!1069203))

(assert (= (and b!1069208 ((_ is ValueCellFull!12129) mapDefault!40195)) b!1069207))

(assert (= start!94550 b!1069208))

(declare-fun m!987743 () Bool)

(assert (=> b!1069204 m!987743))

(declare-fun m!987745 () Bool)

(assert (=> b!1069204 m!987745))

(declare-fun m!987747 () Bool)

(assert (=> b!1069200 m!987747))

(declare-fun m!987749 () Bool)

(assert (=> b!1069200 m!987749))

(declare-fun m!987751 () Bool)

(assert (=> b!1069200 m!987751))

(declare-fun m!987753 () Bool)

(assert (=> start!94550 m!987753))

(declare-fun m!987755 () Bool)

(assert (=> start!94550 m!987755))

(declare-fun m!987757 () Bool)

(assert (=> start!94550 m!987757))

(declare-fun m!987759 () Bool)

(assert (=> mapNonEmpty!40195 m!987759))

(declare-fun m!987761 () Bool)

(assert (=> b!1069205 m!987761))

(declare-fun m!987763 () Bool)

(assert (=> b!1069202 m!987763))

(declare-fun m!987765 () Bool)

(assert (=> b!1069202 m!987765))

(declare-fun m!987767 () Bool)

(assert (=> b!1069206 m!987767))

(check-sat (not b!1069200) (not mapNonEmpty!40195) (not b!1069202) (not b!1069204) b_and!34657 (not b_next!21855) (not b!1069205) tp_is_empty!25665 (not start!94550) (not b!1069206))
(check-sat b_and!34657 (not b_next!21855))
(get-model)

(declare-fun d!129189 () Bool)

(declare-fun lt!472469 () ListLongMap!14343)

(assert (=> d!129189 (not (contains!6314 lt!472469 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!72 (List!22919 (_ BitVec 64)) List!22919)

(assert (=> d!129189 (= lt!472469 (ListLongMap!14344 (removeStrictlySorted!72 (toList!7187 lt!472450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129189 (= (-!666 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472469)))

(declare-fun bs!31483 () Bool)

(assert (= bs!31483 d!129189))

(declare-fun m!987795 () Bool)

(assert (=> bs!31483 m!987795))

(declare-fun m!987797 () Bool)

(assert (=> bs!31483 m!987797))

(assert (=> b!1069204 d!129189))

(declare-fun d!129191 () Bool)

(assert (=> d!129191 (= (-!666 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472450)))

(declare-fun lt!472472 () Unit!35171)

(declare-fun choose!1737 (ListLongMap!14343 (_ BitVec 64)) Unit!35171)

(assert (=> d!129191 (= lt!472472 (choose!1737 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129191 (not (contains!6314 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129191 (= (removeNotPresentStillSame!76 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472472)))

(declare-fun bs!31484 () Bool)

(assert (= bs!31484 d!129191))

(assert (=> bs!31484 m!987743))

(declare-fun m!987799 () Bool)

(assert (=> bs!31484 m!987799))

(assert (=> bs!31484 m!987763))

(assert (=> b!1069204 d!129191))

(declare-fun d!129193 () Bool)

(assert (=> d!129193 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94550 d!129193))

(declare-fun d!129195 () Bool)

(assert (=> d!129195 (= (array_inv!25426 _values!955) (bvsge (size!33388 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94550 d!129195))

(declare-fun d!129197 () Bool)

(assert (=> d!129197 (= (array_inv!25427 _keys!1163) (bvsge (size!33389 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94550 d!129197))

(declare-fun d!129199 () Bool)

(assert (=> d!129199 (= (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472475 () Unit!35171)

(declare-fun choose!1738 (array!68309 array!68307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39355 V!39355 V!39355 V!39355 (_ BitVec 32) Int) Unit!35171)

(assert (=> d!129199 (= lt!472475 (choose!1738 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129199 (validMask!0 mask!1515)))

(assert (=> d!129199 (= (lemmaNoChangeToArrayThenSameMapNoExtras!800 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472475)))

(declare-fun bs!31485 () Bool)

(assert (= bs!31485 d!129199))

(assert (=> bs!31485 m!987751))

(assert (=> bs!31485 m!987749))

(declare-fun m!987801 () Bool)

(assert (=> bs!31485 m!987801))

(assert (=> bs!31485 m!987753))

(assert (=> b!1069200 d!129199))

(declare-fun b!1069260 () Bool)

(declare-fun lt!472496 () ListLongMap!14343)

(declare-fun e!610208 () Bool)

(assert (=> b!1069260 (= e!610208 (= lt!472496 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129201 () Bool)

(declare-fun e!610205 () Bool)

(assert (=> d!129201 e!610205))

(declare-fun res!713472 () Bool)

(assert (=> d!129201 (=> (not res!713472) (not e!610205))))

(assert (=> d!129201 (= res!713472 (not (contains!6314 lt!472496 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!610202 () ListLongMap!14343)

(assert (=> d!129201 (= lt!472496 e!610202)))

(declare-fun c!107554 () Bool)

(assert (=> d!129201 (= c!107554 (bvsge #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(assert (=> d!129201 (validMask!0 mask!1515)))

(assert (=> d!129201 (= (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472496)))

(declare-fun b!1069261 () Bool)

(declare-fun e!610204 () Bool)

(assert (=> b!1069261 (= e!610204 e!610208)))

(declare-fun c!107553 () Bool)

(assert (=> b!1069261 (= c!107553 (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun b!1069262 () Bool)

(assert (=> b!1069262 (= e!610205 e!610204)))

(declare-fun c!107555 () Bool)

(declare-fun e!610203 () Bool)

(assert (=> b!1069262 (= c!107555 e!610203)))

(declare-fun res!713470 () Bool)

(assert (=> b!1069262 (=> (not res!713470) (not e!610203))))

(assert (=> b!1069262 (= res!713470 (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun b!1069263 () Bool)

(assert (=> b!1069263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(assert (=> b!1069263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33388 _values!955)))))

(declare-fun e!610207 () Bool)

(declare-fun apply!927 (ListLongMap!14343 (_ BitVec 64)) V!39355)

(declare-fun get!17107 (ValueCell!12129 V!39355) V!39355)

(declare-fun dynLambda!2034 (Int (_ BitVec 64)) V!39355)

(assert (=> b!1069263 (= e!610207 (= (apply!927 lt!472496 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)) (get!17107 (select (arr!32852 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069264 () Bool)

(declare-fun e!610206 () ListLongMap!14343)

(declare-fun call!45132 () ListLongMap!14343)

(assert (=> b!1069264 (= e!610206 call!45132)))

(declare-fun b!1069265 () Bool)

(declare-fun lt!472491 () Unit!35171)

(declare-fun lt!472495 () Unit!35171)

(assert (=> b!1069265 (= lt!472491 lt!472495)))

(declare-fun lt!472494 () (_ BitVec 64))

(declare-fun lt!472493 () (_ BitVec 64))

(declare-fun lt!472492 () V!39355)

(declare-fun lt!472490 () ListLongMap!14343)

(declare-fun +!3162 (ListLongMap!14343 tuple2!16374) ListLongMap!14343)

(assert (=> b!1069265 (not (contains!6314 (+!3162 lt!472490 (tuple2!16375 lt!472494 lt!472492)) lt!472493))))

(declare-fun addStillNotContains!255 (ListLongMap!14343 (_ BitVec 64) V!39355 (_ BitVec 64)) Unit!35171)

(assert (=> b!1069265 (= lt!472495 (addStillNotContains!255 lt!472490 lt!472494 lt!472492 lt!472493))))

(assert (=> b!1069265 (= lt!472493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1069265 (= lt!472492 (get!17107 (select (arr!32852 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069265 (= lt!472494 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069265 (= lt!472490 call!45132)))

(assert (=> b!1069265 (= e!610206 (+!3162 call!45132 (tuple2!16375 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000) (get!17107 (select (arr!32852 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1069266 () Bool)

(assert (=> b!1069266 (= e!610202 e!610206)))

(declare-fun c!107556 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1069266 (= c!107556 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069267 () Bool)

(declare-fun res!713473 () Bool)

(assert (=> b!1069267 (=> (not res!713473) (not e!610205))))

(assert (=> b!1069267 (= res!713473 (not (contains!6314 lt!472496 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1069268 () Bool)

(assert (=> b!1069268 (= e!610204 e!610207)))

(assert (=> b!1069268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun res!713471 () Bool)

(assert (=> b!1069268 (= res!713471 (contains!6314 lt!472496 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069268 (=> (not res!713471) (not e!610207))))

(declare-fun b!1069269 () Bool)

(declare-fun isEmpty!945 (ListLongMap!14343) Bool)

(assert (=> b!1069269 (= e!610208 (isEmpty!945 lt!472496))))

(declare-fun b!1069270 () Bool)

(assert (=> b!1069270 (= e!610203 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069270 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45129 () Bool)

(assert (=> bm!45129 (= call!45132 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1069271 () Bool)

(assert (=> b!1069271 (= e!610202 (ListLongMap!14344 Nil!22916))))

(assert (= (and d!129201 c!107554) b!1069271))

(assert (= (and d!129201 (not c!107554)) b!1069266))

(assert (= (and b!1069266 c!107556) b!1069265))

(assert (= (and b!1069266 (not c!107556)) b!1069264))

(assert (= (or b!1069265 b!1069264) bm!45129))

(assert (= (and d!129201 res!713472) b!1069267))

(assert (= (and b!1069267 res!713473) b!1069262))

(assert (= (and b!1069262 res!713470) b!1069270))

(assert (= (and b!1069262 c!107555) b!1069268))

(assert (= (and b!1069262 (not c!107555)) b!1069261))

(assert (= (and b!1069268 res!713471) b!1069263))

(assert (= (and b!1069261 c!107553) b!1069260))

(assert (= (and b!1069261 (not c!107553)) b!1069269))

(declare-fun b_lambda!16621 () Bool)

(assert (=> (not b_lambda!16621) (not b!1069263)))

(declare-fun t!32251 () Bool)

(declare-fun tb!7149 () Bool)

(assert (=> (and start!94550 (= defaultEntry!963 defaultEntry!963) t!32251) tb!7149))

(declare-fun result!14755 () Bool)

(assert (=> tb!7149 (= result!14755 tp_is_empty!25665)))

(assert (=> b!1069263 t!32251))

(declare-fun b_and!34661 () Bool)

(assert (= b_and!34657 (and (=> t!32251 result!14755) b_and!34661)))

(declare-fun b_lambda!16623 () Bool)

(assert (=> (not b_lambda!16623) (not b!1069265)))

(assert (=> b!1069265 t!32251))

(declare-fun b_and!34663 () Bool)

(assert (= b_and!34661 (and (=> t!32251 result!14755) b_and!34663)))

(declare-fun m!987803 () Bool)

(assert (=> b!1069267 m!987803))

(declare-fun m!987805 () Bool)

(assert (=> b!1069269 m!987805))

(declare-fun m!987807 () Bool)

(assert (=> b!1069265 m!987807))

(declare-fun m!987809 () Bool)

(assert (=> b!1069265 m!987809))

(declare-fun m!987811 () Bool)

(assert (=> b!1069265 m!987811))

(declare-fun m!987813 () Bool)

(assert (=> b!1069265 m!987813))

(declare-fun m!987815 () Bool)

(assert (=> b!1069265 m!987815))

(declare-fun m!987817 () Bool)

(assert (=> b!1069265 m!987817))

(declare-fun m!987819 () Bool)

(assert (=> b!1069265 m!987819))

(assert (=> b!1069265 m!987815))

(assert (=> b!1069265 m!987807))

(declare-fun m!987821 () Bool)

(assert (=> b!1069265 m!987821))

(assert (=> b!1069265 m!987813))

(declare-fun m!987823 () Bool)

(assert (=> b!1069260 m!987823))

(assert (=> bm!45129 m!987823))

(declare-fun m!987825 () Bool)

(assert (=> d!129201 m!987825))

(assert (=> d!129201 m!987753))

(assert (=> b!1069270 m!987819))

(assert (=> b!1069270 m!987819))

(declare-fun m!987827 () Bool)

(assert (=> b!1069270 m!987827))

(assert (=> b!1069263 m!987819))

(declare-fun m!987829 () Bool)

(assert (=> b!1069263 m!987829))

(assert (=> b!1069263 m!987813))

(assert (=> b!1069263 m!987813))

(assert (=> b!1069263 m!987815))

(assert (=> b!1069263 m!987817))

(assert (=> b!1069263 m!987819))

(assert (=> b!1069263 m!987815))

(assert (=> b!1069268 m!987819))

(assert (=> b!1069268 m!987819))

(declare-fun m!987831 () Bool)

(assert (=> b!1069268 m!987831))

(assert (=> b!1069266 m!987819))

(assert (=> b!1069266 m!987819))

(assert (=> b!1069266 m!987827))

(assert (=> b!1069200 d!129201))

(declare-fun lt!472503 () ListLongMap!14343)

(declare-fun e!610215 () Bool)

(declare-fun b!1069274 () Bool)

(assert (=> b!1069274 (= e!610215 (= lt!472503 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129203 () Bool)

(declare-fun e!610212 () Bool)

(assert (=> d!129203 e!610212))

(declare-fun res!713476 () Bool)

(assert (=> d!129203 (=> (not res!713476) (not e!610212))))

(assert (=> d!129203 (= res!713476 (not (contains!6314 lt!472503 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!610209 () ListLongMap!14343)

(assert (=> d!129203 (= lt!472503 e!610209)))

(declare-fun c!107558 () Bool)

(assert (=> d!129203 (= c!107558 (bvsge #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(assert (=> d!129203 (validMask!0 mask!1515)))

(assert (=> d!129203 (= (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472503)))

(declare-fun b!1069275 () Bool)

(declare-fun e!610211 () Bool)

(assert (=> b!1069275 (= e!610211 e!610215)))

(declare-fun c!107557 () Bool)

(assert (=> b!1069275 (= c!107557 (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun b!1069276 () Bool)

(assert (=> b!1069276 (= e!610212 e!610211)))

(declare-fun c!107559 () Bool)

(declare-fun e!610210 () Bool)

(assert (=> b!1069276 (= c!107559 e!610210)))

(declare-fun res!713474 () Bool)

(assert (=> b!1069276 (=> (not res!713474) (not e!610210))))

(assert (=> b!1069276 (= res!713474 (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun b!1069277 () Bool)

(assert (=> b!1069277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(assert (=> b!1069277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33388 _values!955)))))

(declare-fun e!610214 () Bool)

(assert (=> b!1069277 (= e!610214 (= (apply!927 lt!472503 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)) (get!17107 (select (arr!32852 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069278 () Bool)

(declare-fun e!610213 () ListLongMap!14343)

(declare-fun call!45133 () ListLongMap!14343)

(assert (=> b!1069278 (= e!610213 call!45133)))

(declare-fun b!1069279 () Bool)

(declare-fun lt!472498 () Unit!35171)

(declare-fun lt!472502 () Unit!35171)

(assert (=> b!1069279 (= lt!472498 lt!472502)))

(declare-fun lt!472500 () (_ BitVec 64))

(declare-fun lt!472501 () (_ BitVec 64))

(declare-fun lt!472497 () ListLongMap!14343)

(declare-fun lt!472499 () V!39355)

(assert (=> b!1069279 (not (contains!6314 (+!3162 lt!472497 (tuple2!16375 lt!472501 lt!472499)) lt!472500))))

(assert (=> b!1069279 (= lt!472502 (addStillNotContains!255 lt!472497 lt!472501 lt!472499 lt!472500))))

(assert (=> b!1069279 (= lt!472500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1069279 (= lt!472499 (get!17107 (select (arr!32852 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069279 (= lt!472501 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069279 (= lt!472497 call!45133)))

(assert (=> b!1069279 (= e!610213 (+!3162 call!45133 (tuple2!16375 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000) (get!17107 (select (arr!32852 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1069280 () Bool)

(assert (=> b!1069280 (= e!610209 e!610213)))

(declare-fun c!107560 () Bool)

(assert (=> b!1069280 (= c!107560 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069281 () Bool)

(declare-fun res!713477 () Bool)

(assert (=> b!1069281 (=> (not res!713477) (not e!610212))))

(assert (=> b!1069281 (= res!713477 (not (contains!6314 lt!472503 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1069282 () Bool)

(assert (=> b!1069282 (= e!610211 e!610214)))

(assert (=> b!1069282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun res!713475 () Bool)

(assert (=> b!1069282 (= res!713475 (contains!6314 lt!472503 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069282 (=> (not res!713475) (not e!610214))))

(declare-fun b!1069283 () Bool)

(assert (=> b!1069283 (= e!610215 (isEmpty!945 lt!472503))))

(declare-fun b!1069284 () Bool)

(assert (=> b!1069284 (= e!610210 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069284 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45130 () Bool)

(assert (=> bm!45130 (= call!45133 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1069285 () Bool)

(assert (=> b!1069285 (= e!610209 (ListLongMap!14344 Nil!22916))))

(assert (= (and d!129203 c!107558) b!1069285))

(assert (= (and d!129203 (not c!107558)) b!1069280))

(assert (= (and b!1069280 c!107560) b!1069279))

(assert (= (and b!1069280 (not c!107560)) b!1069278))

(assert (= (or b!1069279 b!1069278) bm!45130))

(assert (= (and d!129203 res!713476) b!1069281))

(assert (= (and b!1069281 res!713477) b!1069276))

(assert (= (and b!1069276 res!713474) b!1069284))

(assert (= (and b!1069276 c!107559) b!1069282))

(assert (= (and b!1069276 (not c!107559)) b!1069275))

(assert (= (and b!1069282 res!713475) b!1069277))

(assert (= (and b!1069275 c!107557) b!1069274))

(assert (= (and b!1069275 (not c!107557)) b!1069283))

(declare-fun b_lambda!16625 () Bool)

(assert (=> (not b_lambda!16625) (not b!1069277)))

(assert (=> b!1069277 t!32251))

(declare-fun b_and!34665 () Bool)

(assert (= b_and!34663 (and (=> t!32251 result!14755) b_and!34665)))

(declare-fun b_lambda!16627 () Bool)

(assert (=> (not b_lambda!16627) (not b!1069279)))

(assert (=> b!1069279 t!32251))

(declare-fun b_and!34667 () Bool)

(assert (= b_and!34665 (and (=> t!32251 result!14755) b_and!34667)))

(declare-fun m!987833 () Bool)

(assert (=> b!1069281 m!987833))

(declare-fun m!987835 () Bool)

(assert (=> b!1069283 m!987835))

(declare-fun m!987837 () Bool)

(assert (=> b!1069279 m!987837))

(declare-fun m!987839 () Bool)

(assert (=> b!1069279 m!987839))

(declare-fun m!987841 () Bool)

(assert (=> b!1069279 m!987841))

(assert (=> b!1069279 m!987813))

(assert (=> b!1069279 m!987815))

(assert (=> b!1069279 m!987817))

(assert (=> b!1069279 m!987819))

(assert (=> b!1069279 m!987815))

(assert (=> b!1069279 m!987837))

(declare-fun m!987843 () Bool)

(assert (=> b!1069279 m!987843))

(assert (=> b!1069279 m!987813))

(declare-fun m!987845 () Bool)

(assert (=> b!1069274 m!987845))

(assert (=> bm!45130 m!987845))

(declare-fun m!987847 () Bool)

(assert (=> d!129203 m!987847))

(assert (=> d!129203 m!987753))

(assert (=> b!1069284 m!987819))

(assert (=> b!1069284 m!987819))

(assert (=> b!1069284 m!987827))

(assert (=> b!1069277 m!987819))

(declare-fun m!987849 () Bool)

(assert (=> b!1069277 m!987849))

(assert (=> b!1069277 m!987813))

(assert (=> b!1069277 m!987813))

(assert (=> b!1069277 m!987815))

(assert (=> b!1069277 m!987817))

(assert (=> b!1069277 m!987819))

(assert (=> b!1069277 m!987815))

(assert (=> b!1069282 m!987819))

(assert (=> b!1069282 m!987819))

(declare-fun m!987851 () Bool)

(assert (=> b!1069282 m!987851))

(assert (=> b!1069280 m!987819))

(assert (=> b!1069280 m!987819))

(assert (=> b!1069280 m!987827))

(assert (=> b!1069200 d!129203))

(declare-fun b!1069296 () Bool)

(declare-fun e!610227 () Bool)

(declare-fun call!45136 () Bool)

(assert (=> b!1069296 (= e!610227 call!45136)))

(declare-fun b!1069297 () Bool)

(declare-fun e!610225 () Bool)

(declare-fun e!610226 () Bool)

(assert (=> b!1069297 (= e!610225 e!610226)))

(declare-fun res!713485 () Bool)

(assert (=> b!1069297 (=> (not res!713485) (not e!610226))))

(declare-fun e!610224 () Bool)

(assert (=> b!1069297 (= res!713485 (not e!610224))))

(declare-fun res!713484 () Bool)

(assert (=> b!1069297 (=> (not res!713484) (not e!610224))))

(assert (=> b!1069297 (= res!713484 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129205 () Bool)

(declare-fun res!713486 () Bool)

(assert (=> d!129205 (=> res!713486 e!610225)))

(assert (=> d!129205 (= res!713486 (bvsge #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(assert (=> d!129205 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22917) e!610225)))

(declare-fun b!1069298 () Bool)

(assert (=> b!1069298 (= e!610226 e!610227)))

(declare-fun c!107563 () Bool)

(assert (=> b!1069298 (= c!107563 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069299 () Bool)

(declare-fun contains!6316 (List!22920 (_ BitVec 64)) Bool)

(assert (=> b!1069299 (= e!610224 (contains!6316 Nil!22917 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069300 () Bool)

(assert (=> b!1069300 (= e!610227 call!45136)))

(declare-fun bm!45133 () Bool)

(assert (=> bm!45133 (= call!45136 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107563 (Cons!22916 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000) Nil!22917) Nil!22917)))))

(assert (= (and d!129205 (not res!713486)) b!1069297))

(assert (= (and b!1069297 res!713484) b!1069299))

(assert (= (and b!1069297 res!713485) b!1069298))

(assert (= (and b!1069298 c!107563) b!1069296))

(assert (= (and b!1069298 (not c!107563)) b!1069300))

(assert (= (or b!1069296 b!1069300) bm!45133))

(assert (=> b!1069297 m!987819))

(assert (=> b!1069297 m!987819))

(assert (=> b!1069297 m!987827))

(assert (=> b!1069298 m!987819))

(assert (=> b!1069298 m!987819))

(assert (=> b!1069298 m!987827))

(assert (=> b!1069299 m!987819))

(assert (=> b!1069299 m!987819))

(declare-fun m!987853 () Bool)

(assert (=> b!1069299 m!987853))

(assert (=> bm!45133 m!987819))

(declare-fun m!987855 () Bool)

(assert (=> bm!45133 m!987855))

(assert (=> b!1069205 d!129205))

(declare-fun b!1069309 () Bool)

(declare-fun e!610236 () Bool)

(declare-fun call!45139 () Bool)

(assert (=> b!1069309 (= e!610236 call!45139)))

(declare-fun bm!45136 () Bool)

(assert (=> bm!45136 (= call!45139 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1069310 () Bool)

(declare-fun e!610235 () Bool)

(assert (=> b!1069310 (= e!610235 e!610236)))

(declare-fun lt!472511 () (_ BitVec 64))

(assert (=> b!1069310 (= lt!472511 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472512 () Unit!35171)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68309 (_ BitVec 64) (_ BitVec 32)) Unit!35171)

(assert (=> b!1069310 (= lt!472512 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!472511 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1069310 (arrayContainsKey!0 _keys!1163 lt!472511 #b00000000000000000000000000000000)))

(declare-fun lt!472510 () Unit!35171)

(assert (=> b!1069310 (= lt!472510 lt!472512)))

(declare-fun res!713491 () Bool)

(declare-datatypes ((SeekEntryResult!9880 0))(
  ( (MissingZero!9880 (index!41891 (_ BitVec 32))) (Found!9880 (index!41892 (_ BitVec 32))) (Intermediate!9880 (undefined!10692 Bool) (index!41893 (_ BitVec 32)) (x!95766 (_ BitVec 32))) (Undefined!9880) (MissingVacant!9880 (index!41894 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68309 (_ BitVec 32)) SeekEntryResult!9880)

(assert (=> b!1069310 (= res!713491 (= (seekEntryOrOpen!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9880 #b00000000000000000000000000000000)))))

(assert (=> b!1069310 (=> (not res!713491) (not e!610236))))

(declare-fun b!1069311 () Bool)

(assert (=> b!1069311 (= e!610235 call!45139)))

(declare-fun b!1069312 () Bool)

(declare-fun e!610234 () Bool)

(assert (=> b!1069312 (= e!610234 e!610235)))

(declare-fun c!107566 () Bool)

(assert (=> b!1069312 (= c!107566 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129207 () Bool)

(declare-fun res!713492 () Bool)

(assert (=> d!129207 (=> res!713492 e!610234)))

(assert (=> d!129207 (= res!713492 (bvsge #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(assert (=> d!129207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!610234)))

(assert (= (and d!129207 (not res!713492)) b!1069312))

(assert (= (and b!1069312 c!107566) b!1069310))

(assert (= (and b!1069312 (not c!107566)) b!1069311))

(assert (= (and b!1069310 res!713491) b!1069309))

(assert (= (or b!1069309 b!1069311) bm!45136))

(declare-fun m!987857 () Bool)

(assert (=> bm!45136 m!987857))

(assert (=> b!1069310 m!987819))

(declare-fun m!987859 () Bool)

(assert (=> b!1069310 m!987859))

(declare-fun m!987861 () Bool)

(assert (=> b!1069310 m!987861))

(assert (=> b!1069310 m!987819))

(declare-fun m!987863 () Bool)

(assert (=> b!1069310 m!987863))

(assert (=> b!1069312 m!987819))

(assert (=> b!1069312 m!987819))

(assert (=> b!1069312 m!987827))

(assert (=> b!1069206 d!129207))

(declare-fun d!129209 () Bool)

(declare-fun e!610242 () Bool)

(assert (=> d!129209 e!610242))

(declare-fun res!713495 () Bool)

(assert (=> d!129209 (=> res!713495 e!610242)))

(declare-fun lt!472522 () Bool)

(assert (=> d!129209 (= res!713495 (not lt!472522))))

(declare-fun lt!472521 () Bool)

(assert (=> d!129209 (= lt!472522 lt!472521)))

(declare-fun lt!472524 () Unit!35171)

(declare-fun e!610241 () Unit!35171)

(assert (=> d!129209 (= lt!472524 e!610241)))

(declare-fun c!107569 () Bool)

(assert (=> d!129209 (= c!107569 lt!472521)))

(declare-fun containsKey!575 (List!22919 (_ BitVec 64)) Bool)

(assert (=> d!129209 (= lt!472521 (containsKey!575 (toList!7187 lt!472450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129209 (= (contains!6314 lt!472450 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472522)))

(declare-fun b!1069319 () Bool)

(declare-fun lt!472523 () Unit!35171)

(assert (=> b!1069319 (= e!610241 lt!472523)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!408 (List!22919 (_ BitVec 64)) Unit!35171)

(assert (=> b!1069319 (= lt!472523 (lemmaContainsKeyImpliesGetValueByKeyDefined!408 (toList!7187 lt!472450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!653 0))(
  ( (Some!652 (v!15500 V!39355)) (None!651) )
))
(declare-fun isDefined!447 (Option!653) Bool)

(declare-fun getValueByKey!602 (List!22919 (_ BitVec 64)) Option!653)

(assert (=> b!1069319 (isDefined!447 (getValueByKey!602 (toList!7187 lt!472450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069320 () Bool)

(declare-fun Unit!35175 () Unit!35171)

(assert (=> b!1069320 (= e!610241 Unit!35175)))

(declare-fun b!1069321 () Bool)

(assert (=> b!1069321 (= e!610242 (isDefined!447 (getValueByKey!602 (toList!7187 lt!472450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129209 c!107569) b!1069319))

(assert (= (and d!129209 (not c!107569)) b!1069320))

(assert (= (and d!129209 (not res!713495)) b!1069321))

(declare-fun m!987865 () Bool)

(assert (=> d!129209 m!987865))

(declare-fun m!987867 () Bool)

(assert (=> b!1069319 m!987867))

(declare-fun m!987869 () Bool)

(assert (=> b!1069319 m!987869))

(assert (=> b!1069319 m!987869))

(declare-fun m!987871 () Bool)

(assert (=> b!1069319 m!987871))

(assert (=> b!1069321 m!987869))

(assert (=> b!1069321 m!987869))

(assert (=> b!1069321 m!987871))

(assert (=> b!1069202 d!129209))

(declare-fun bm!45151 () Bool)

(declare-fun call!45158 () ListLongMap!14343)

(declare-fun call!45159 () ListLongMap!14343)

(assert (=> bm!45151 (= call!45158 call!45159)))

(declare-fun b!1069364 () Bool)

(declare-fun e!610278 () Bool)

(declare-fun lt!472587 () ListLongMap!14343)

(assert (=> b!1069364 (= e!610278 (= (apply!927 lt!472587 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun call!45157 () ListLongMap!14343)

(declare-fun bm!45152 () Bool)

(assert (=> bm!45152 (= call!45157 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069365 () Bool)

(declare-fun e!610271 () ListLongMap!14343)

(assert (=> b!1069365 (= e!610271 call!45158)))

(declare-fun bm!45153 () Bool)

(declare-fun call!45155 () Bool)

(assert (=> bm!45153 (= call!45155 (contains!6314 lt!472587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069366 () Bool)

(declare-fun e!610273 () Bool)

(assert (=> b!1069366 (= e!610273 (= (apply!927 lt!472587 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1069367 () Bool)

(declare-fun e!610276 () ListLongMap!14343)

(assert (=> b!1069367 (= e!610276 (+!3162 call!45159 (tuple2!16375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1069368 () Bool)

(declare-fun e!610272 () ListLongMap!14343)

(assert (=> b!1069368 (= e!610272 call!45158)))

(declare-fun b!1069369 () Bool)

(declare-fun e!610277 () Unit!35171)

(declare-fun Unit!35176 () Unit!35171)

(assert (=> b!1069369 (= e!610277 Unit!35176)))

(declare-fun b!1069370 () Bool)

(declare-fun c!107583 () Bool)

(assert (=> b!1069370 (= c!107583 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1069370 (= e!610271 e!610272)))

(declare-fun b!1069371 () Bool)

(declare-fun e!610281 () Bool)

(assert (=> b!1069371 (= e!610281 e!610278)))

(declare-fun res!713517 () Bool)

(declare-fun call!45156 () Bool)

(assert (=> b!1069371 (= res!713517 call!45156)))

(assert (=> b!1069371 (=> (not res!713517) (not e!610278))))

(declare-fun bm!45154 () Bool)

(declare-fun call!45154 () ListLongMap!14343)

(assert (=> bm!45154 (= call!45154 call!45157)))

(declare-fun bm!45155 () Bool)

(declare-fun call!45160 () ListLongMap!14343)

(assert (=> bm!45155 (= call!45160 call!45154)))

(declare-fun bm!45156 () Bool)

(assert (=> bm!45156 (= call!45156 (contains!6314 lt!472587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069372 () Bool)

(declare-fun e!610275 () Bool)

(assert (=> b!1069372 (= e!610275 (not call!45155))))

(declare-fun b!1069373 () Bool)

(declare-fun res!713514 () Bool)

(declare-fun e!610279 () Bool)

(assert (=> b!1069373 (=> (not res!713514) (not e!610279))))

(assert (=> b!1069373 (= res!713514 e!610275)))

(declare-fun c!107587 () Bool)

(assert (=> b!1069373 (= c!107587 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069375 () Bool)

(assert (=> b!1069375 (= e!610281 (not call!45156))))

(declare-fun b!1069374 () Bool)

(declare-fun lt!472569 () Unit!35171)

(assert (=> b!1069374 (= e!610277 lt!472569)))

(declare-fun lt!472584 () ListLongMap!14343)

(assert (=> b!1069374 (= lt!472584 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472570 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472571 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472571 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472588 () Unit!35171)

(declare-fun addStillContains!642 (ListLongMap!14343 (_ BitVec 64) V!39355 (_ BitVec 64)) Unit!35171)

(assert (=> b!1069374 (= lt!472588 (addStillContains!642 lt!472584 lt!472570 zeroValueBefore!47 lt!472571))))

(assert (=> b!1069374 (contains!6314 (+!3162 lt!472584 (tuple2!16375 lt!472570 zeroValueBefore!47)) lt!472571)))

(declare-fun lt!472589 () Unit!35171)

(assert (=> b!1069374 (= lt!472589 lt!472588)))

(declare-fun lt!472581 () ListLongMap!14343)

(assert (=> b!1069374 (= lt!472581 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472579 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472579 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472575 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472575 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472573 () Unit!35171)

(declare-fun addApplyDifferent!502 (ListLongMap!14343 (_ BitVec 64) V!39355 (_ BitVec 64)) Unit!35171)

(assert (=> b!1069374 (= lt!472573 (addApplyDifferent!502 lt!472581 lt!472579 minValue!907 lt!472575))))

(assert (=> b!1069374 (= (apply!927 (+!3162 lt!472581 (tuple2!16375 lt!472579 minValue!907)) lt!472575) (apply!927 lt!472581 lt!472575))))

(declare-fun lt!472577 () Unit!35171)

(assert (=> b!1069374 (= lt!472577 lt!472573)))

(declare-fun lt!472574 () ListLongMap!14343)

(assert (=> b!1069374 (= lt!472574 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472586 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472582 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472582 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472585 () Unit!35171)

(assert (=> b!1069374 (= lt!472585 (addApplyDifferent!502 lt!472574 lt!472586 zeroValueBefore!47 lt!472582))))

(assert (=> b!1069374 (= (apply!927 (+!3162 lt!472574 (tuple2!16375 lt!472586 zeroValueBefore!47)) lt!472582) (apply!927 lt!472574 lt!472582))))

(declare-fun lt!472572 () Unit!35171)

(assert (=> b!1069374 (= lt!472572 lt!472585)))

(declare-fun lt!472590 () ListLongMap!14343)

(assert (=> b!1069374 (= lt!472590 (getCurrentListMapNoExtraKeys!3763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472583 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472583 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472580 () (_ BitVec 64))

(assert (=> b!1069374 (= lt!472580 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069374 (= lt!472569 (addApplyDifferent!502 lt!472590 lt!472583 minValue!907 lt!472580))))

(assert (=> b!1069374 (= (apply!927 (+!3162 lt!472590 (tuple2!16375 lt!472583 minValue!907)) lt!472580) (apply!927 lt!472590 lt!472580))))

(declare-fun d!129211 () Bool)

(assert (=> d!129211 e!610279))

(declare-fun res!713521 () Bool)

(assert (=> d!129211 (=> (not res!713521) (not e!610279))))

(assert (=> d!129211 (= res!713521 (or (bvsge #b00000000000000000000000000000000 (size!33389 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))))

(declare-fun lt!472578 () ListLongMap!14343)

(assert (=> d!129211 (= lt!472587 lt!472578)))

(declare-fun lt!472576 () Unit!35171)

(assert (=> d!129211 (= lt!472576 e!610277)))

(declare-fun c!107585 () Bool)

(declare-fun e!610274 () Bool)

(assert (=> d!129211 (= c!107585 e!610274)))

(declare-fun res!713519 () Bool)

(assert (=> d!129211 (=> (not res!713519) (not e!610274))))

(assert (=> d!129211 (= res!713519 (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(assert (=> d!129211 (= lt!472578 e!610276)))

(declare-fun c!107582 () Bool)

(assert (=> d!129211 (= c!107582 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129211 (validMask!0 mask!1515)))

(assert (=> d!129211 (= (getCurrentListMap!4110 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472587)))

(declare-fun b!1069376 () Bool)

(assert (=> b!1069376 (= e!610272 call!45160)))

(declare-fun b!1069377 () Bool)

(declare-fun e!610269 () Bool)

(assert (=> b!1069377 (= e!610269 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069378 () Bool)

(assert (=> b!1069378 (= e!610276 e!610271)))

(declare-fun c!107586 () Bool)

(assert (=> b!1069378 (= c!107586 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1069379 () Bool)

(assert (=> b!1069379 (= e!610275 e!610273)))

(declare-fun res!713515 () Bool)

(assert (=> b!1069379 (= res!713515 call!45155)))

(assert (=> b!1069379 (=> (not res!713515) (not e!610273))))

(declare-fun b!1069380 () Bool)

(declare-fun e!610270 () Bool)

(declare-fun e!610280 () Bool)

(assert (=> b!1069380 (= e!610270 e!610280)))

(declare-fun res!713518 () Bool)

(assert (=> b!1069380 (=> (not res!713518) (not e!610280))))

(assert (=> b!1069380 (= res!713518 (contains!6314 lt!472587 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069380 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun b!1069381 () Bool)

(assert (=> b!1069381 (= e!610274 (validKeyInArray!0 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45157 () Bool)

(assert (=> bm!45157 (= call!45159 (+!3162 (ite c!107582 call!45157 (ite c!107586 call!45154 call!45160)) (ite (or c!107582 c!107586) (tuple2!16375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1069382 () Bool)

(declare-fun res!713522 () Bool)

(assert (=> b!1069382 (=> (not res!713522) (not e!610279))))

(assert (=> b!1069382 (= res!713522 e!610270)))

(declare-fun res!713520 () Bool)

(assert (=> b!1069382 (=> res!713520 e!610270)))

(assert (=> b!1069382 (= res!713520 (not e!610269))))

(declare-fun res!713516 () Bool)

(assert (=> b!1069382 (=> (not res!713516) (not e!610269))))

(assert (=> b!1069382 (= res!713516 (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun b!1069383 () Bool)

(assert (=> b!1069383 (= e!610280 (= (apply!927 lt!472587 (select (arr!32853 _keys!1163) #b00000000000000000000000000000000)) (get!17107 (select (arr!32852 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1069383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33388 _values!955)))))

(assert (=> b!1069383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33389 _keys!1163)))))

(declare-fun b!1069384 () Bool)

(assert (=> b!1069384 (= e!610279 e!610281)))

(declare-fun c!107584 () Bool)

(assert (=> b!1069384 (= c!107584 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!129211 c!107582) b!1069367))

(assert (= (and d!129211 (not c!107582)) b!1069378))

(assert (= (and b!1069378 c!107586) b!1069365))

(assert (= (and b!1069378 (not c!107586)) b!1069370))

(assert (= (and b!1069370 c!107583) b!1069368))

(assert (= (and b!1069370 (not c!107583)) b!1069376))

(assert (= (or b!1069368 b!1069376) bm!45155))

(assert (= (or b!1069365 bm!45155) bm!45154))

(assert (= (or b!1069365 b!1069368) bm!45151))

(assert (= (or b!1069367 bm!45154) bm!45152))

(assert (= (or b!1069367 bm!45151) bm!45157))

(assert (= (and d!129211 res!713519) b!1069381))

(assert (= (and d!129211 c!107585) b!1069374))

(assert (= (and d!129211 (not c!107585)) b!1069369))

(assert (= (and d!129211 res!713521) b!1069382))

(assert (= (and b!1069382 res!713516) b!1069377))

(assert (= (and b!1069382 (not res!713520)) b!1069380))

(assert (= (and b!1069380 res!713518) b!1069383))

(assert (= (and b!1069382 res!713522) b!1069373))

(assert (= (and b!1069373 c!107587) b!1069379))

(assert (= (and b!1069373 (not c!107587)) b!1069372))

(assert (= (and b!1069379 res!713515) b!1069366))

(assert (= (or b!1069379 b!1069372) bm!45153))

(assert (= (and b!1069373 res!713514) b!1069384))

(assert (= (and b!1069384 c!107584) b!1069371))

(assert (= (and b!1069384 (not c!107584)) b!1069375))

(assert (= (and b!1069371 res!713517) b!1069364))

(assert (= (or b!1069371 b!1069375) bm!45156))

(declare-fun b_lambda!16629 () Bool)

(assert (=> (not b_lambda!16629) (not b!1069383)))

(assert (=> b!1069383 t!32251))

(declare-fun b_and!34669 () Bool)

(assert (= b_and!34667 (and (=> t!32251 result!14755) b_and!34669)))

(assert (=> b!1069377 m!987819))

(assert (=> b!1069377 m!987819))

(assert (=> b!1069377 m!987827))

(assert (=> d!129211 m!987753))

(declare-fun m!987873 () Bool)

(assert (=> bm!45153 m!987873))

(assert (=> b!1069381 m!987819))

(assert (=> b!1069381 m!987819))

(assert (=> b!1069381 m!987827))

(assert (=> b!1069383 m!987819))

(declare-fun m!987875 () Bool)

(assert (=> b!1069383 m!987875))

(assert (=> b!1069383 m!987815))

(assert (=> b!1069383 m!987813))

(assert (=> b!1069383 m!987815))

(assert (=> b!1069383 m!987817))

(assert (=> b!1069383 m!987813))

(assert (=> b!1069383 m!987819))

(declare-fun m!987877 () Bool)

(assert (=> b!1069366 m!987877))

(declare-fun m!987879 () Bool)

(assert (=> bm!45157 m!987879))

(declare-fun m!987881 () Bool)

(assert (=> b!1069364 m!987881))

(declare-fun m!987883 () Bool)

(assert (=> b!1069374 m!987883))

(declare-fun m!987885 () Bool)

(assert (=> b!1069374 m!987885))

(declare-fun m!987887 () Bool)

(assert (=> b!1069374 m!987887))

(declare-fun m!987889 () Bool)

(assert (=> b!1069374 m!987889))

(declare-fun m!987891 () Bool)

(assert (=> b!1069374 m!987891))

(declare-fun m!987893 () Bool)

(assert (=> b!1069374 m!987893))

(declare-fun m!987895 () Bool)

(assert (=> b!1069374 m!987895))

(declare-fun m!987897 () Bool)

(assert (=> b!1069374 m!987897))

(declare-fun m!987899 () Bool)

(assert (=> b!1069374 m!987899))

(assert (=> b!1069374 m!987897))

(assert (=> b!1069374 m!987751))

(assert (=> b!1069374 m!987819))

(declare-fun m!987901 () Bool)

(assert (=> b!1069374 m!987901))

(declare-fun m!987903 () Bool)

(assert (=> b!1069374 m!987903))

(assert (=> b!1069374 m!987901))

(declare-fun m!987905 () Bool)

(assert (=> b!1069374 m!987905))

(declare-fun m!987907 () Bool)

(assert (=> b!1069374 m!987907))

(assert (=> b!1069374 m!987891))

(declare-fun m!987909 () Bool)

(assert (=> b!1069374 m!987909))

(assert (=> b!1069374 m!987907))

(declare-fun m!987911 () Bool)

(assert (=> b!1069374 m!987911))

(assert (=> bm!45152 m!987751))

(assert (=> b!1069380 m!987819))

(assert (=> b!1069380 m!987819))

(declare-fun m!987913 () Bool)

(assert (=> b!1069380 m!987913))

(declare-fun m!987915 () Bool)

(assert (=> bm!45156 m!987915))

(declare-fun m!987917 () Bool)

(assert (=> b!1069367 m!987917))

(assert (=> b!1069202 d!129211))

(declare-fun condMapEmpty!40201 () Bool)

(declare-fun mapDefault!40201 () ValueCell!12129)

(assert (=> mapNonEmpty!40195 (= condMapEmpty!40201 (= mapRest!40195 ((as const (Array (_ BitVec 32) ValueCell!12129)) mapDefault!40201)))))

(declare-fun e!610287 () Bool)

(declare-fun mapRes!40201 () Bool)

(assert (=> mapNonEmpty!40195 (= tp!77014 (and e!610287 mapRes!40201))))

(declare-fun b!1069392 () Bool)

(assert (=> b!1069392 (= e!610287 tp_is_empty!25665)))

(declare-fun b!1069391 () Bool)

(declare-fun e!610286 () Bool)

(assert (=> b!1069391 (= e!610286 tp_is_empty!25665)))

(declare-fun mapIsEmpty!40201 () Bool)

(assert (=> mapIsEmpty!40201 mapRes!40201))

(declare-fun mapNonEmpty!40201 () Bool)

(declare-fun tp!77024 () Bool)

(assert (=> mapNonEmpty!40201 (= mapRes!40201 (and tp!77024 e!610286))))

(declare-fun mapValue!40201 () ValueCell!12129)

(declare-fun mapKey!40201 () (_ BitVec 32))

(declare-fun mapRest!40201 () (Array (_ BitVec 32) ValueCell!12129))

(assert (=> mapNonEmpty!40201 (= mapRest!40195 (store mapRest!40201 mapKey!40201 mapValue!40201))))

(assert (= (and mapNonEmpty!40195 condMapEmpty!40201) mapIsEmpty!40201))

(assert (= (and mapNonEmpty!40195 (not condMapEmpty!40201)) mapNonEmpty!40201))

(assert (= (and mapNonEmpty!40201 ((_ is ValueCellFull!12129) mapValue!40201)) b!1069391))

(assert (= (and mapNonEmpty!40195 ((_ is ValueCellFull!12129) mapDefault!40201)) b!1069392))

(declare-fun m!987919 () Bool)

(assert (=> mapNonEmpty!40201 m!987919))

(declare-fun b_lambda!16631 () Bool)

(assert (= b_lambda!16629 (or (and start!94550 b_free!21855) b_lambda!16631)))

(declare-fun b_lambda!16633 () Bool)

(assert (= b_lambda!16621 (or (and start!94550 b_free!21855) b_lambda!16633)))

(declare-fun b_lambda!16635 () Bool)

(assert (= b_lambda!16625 (or (and start!94550 b_free!21855) b_lambda!16635)))

(declare-fun b_lambda!16637 () Bool)

(assert (= b_lambda!16627 (or (and start!94550 b_free!21855) b_lambda!16637)))

(declare-fun b_lambda!16639 () Bool)

(assert (= b_lambda!16623 (or (and start!94550 b_free!21855) b_lambda!16639)))

(check-sat (not mapNonEmpty!40201) (not b!1069321) (not d!129203) (not d!129209) (not b!1069374) (not d!129211) (not b!1069280) (not b!1069299) (not d!129199) (not b!1069274) (not b_lambda!16631) (not b!1069297) (not b!1069282) (not b!1069380) (not b_lambda!16635) (not b_lambda!16639) (not b!1069367) (not b!1069279) (not bm!45129) (not b!1069319) (not bm!45157) (not b_lambda!16637) (not bm!45153) (not b!1069269) (not bm!45156) (not bm!45136) (not bm!45133) (not b!1069364) (not b!1069298) (not b!1069381) (not b!1069260) (not d!129201) (not b!1069377) (not b!1069268) (not b!1069267) (not b!1069366) (not b!1069283) (not b!1069270) (not b!1069383) (not b!1069312) (not b_lambda!16633) (not bm!45152) (not b!1069310) (not b_next!21855) (not d!129191) (not b!1069263) (not bm!45130) (not d!129189) (not b!1069266) (not b!1069284) (not b!1069281) (not b!1069277) b_and!34669 (not b!1069265) tp_is_empty!25665)
(check-sat b_and!34669 (not b_next!21855))
