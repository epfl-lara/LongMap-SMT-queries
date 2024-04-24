; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94784 () Bool)

(assert start!94784)

(declare-fun b_free!21853 () Bool)

(declare-fun b_next!21853 () Bool)

(assert (=> start!94784 (= b_free!21853 (not b_next!21853))))

(declare-fun tp!77008 () Bool)

(declare-fun b_and!34665 () Bool)

(assert (=> start!94784 (= tp!77008 b_and!34665)))

(declare-fun b!1070500 () Bool)

(declare-fun res!713943 () Bool)

(declare-fun e!610996 () Bool)

(assert (=> b!1070500 (=> (not res!713943) (not e!610996))))

(declare-datatypes ((array!68345 0))(
  ( (array!68346 (arr!32865 (Array (_ BitVec 32) (_ BitVec 64))) (size!33402 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68345)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68345 (_ BitVec 32)) Bool)

(assert (=> b!1070500 (= res!713943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070501 () Bool)

(declare-fun e!610995 () Bool)

(declare-fun tp_is_empty!25663 () Bool)

(assert (=> b!1070501 (= e!610995 tp_is_empty!25663)))

(declare-fun b!1070502 () Bool)

(declare-fun res!713945 () Bool)

(assert (=> b!1070502 (=> (not res!713945) (not e!610996))))

(declare-datatypes ((List!22914 0))(
  ( (Nil!22911) (Cons!22910 (h!24128 (_ BitVec 64)) (t!32233 List!22914)) )
))
(declare-fun arrayNoDuplicates!0 (array!68345 (_ BitVec 32) List!22914) Bool)

(assert (=> b!1070502 (= res!713945 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22911))))

(declare-fun b!1070504 () Bool)

(declare-fun e!610999 () Bool)

(declare-fun e!610997 () Bool)

(declare-fun mapRes!40192 () Bool)

(assert (=> b!1070504 (= e!610999 (and e!610997 mapRes!40192))))

(declare-fun condMapEmpty!40192 () Bool)

(declare-datatypes ((V!39353 0))(
  ( (V!39354 (val!12882 Int)) )
))
(declare-datatypes ((ValueCell!12128 0))(
  ( (ValueCellFull!12128 (v!15493 V!39353)) (EmptyCell!12128) )
))
(declare-datatypes ((array!68347 0))(
  ( (array!68348 (arr!32866 (Array (_ BitVec 32) ValueCell!12128)) (size!33403 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68347)

(declare-fun mapDefault!40192 () ValueCell!12128)

(assert (=> b!1070504 (= condMapEmpty!40192 (= (arr!32866 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12128)) mapDefault!40192)))))

(declare-fun b!1070505 () Bool)

(declare-fun e!610998 () Bool)

(declare-fun e!611000 () Bool)

(assert (=> b!1070505 (= e!610998 e!611000)))

(declare-fun res!713944 () Bool)

(assert (=> b!1070505 (=> res!713944 e!611000)))

(declare-datatypes ((tuple2!16348 0))(
  ( (tuple2!16349 (_1!8185 (_ BitVec 64)) (_2!8185 V!39353)) )
))
(declare-datatypes ((List!22915 0))(
  ( (Nil!22912) (Cons!22911 (h!24129 tuple2!16348) (t!32234 List!22915)) )
))
(declare-datatypes ((ListLongMap!14325 0))(
  ( (ListLongMap!14326 (toList!7178 List!22915)) )
))
(declare-fun lt!472948 () ListLongMap!14325)

(declare-fun contains!6337 (ListLongMap!14325 (_ BitVec 64)) Bool)

(assert (=> b!1070505 (= res!713944 (contains!6337 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39353)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39353)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4099 (array!68345 array!68347 (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 (_ BitVec 32) Int) ListLongMap!14325)

(assert (=> b!1070505 (= lt!472948 (getCurrentListMap!4099 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070506 () Bool)

(assert (=> b!1070506 (= e!611000 (bvsle #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun -!659 (ListLongMap!14325 (_ BitVec 64)) ListLongMap!14325)

(assert (=> b!1070506 (= (-!659 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472948)))

(declare-datatypes ((Unit!35148 0))(
  ( (Unit!35149) )
))
(declare-fun lt!472950 () Unit!35148)

(declare-fun removeNotPresentStillSame!76 (ListLongMap!14325 (_ BitVec 64)) Unit!35148)

(assert (=> b!1070506 (= lt!472950 (removeNotPresentStillSame!76 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070507 () Bool)

(assert (=> b!1070507 (= e!610996 (not e!610998))))

(declare-fun res!713946 () Bool)

(assert (=> b!1070507 (=> res!713946 e!610998)))

(assert (=> b!1070507 (= res!713946 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472947 () ListLongMap!14325)

(declare-fun lt!472949 () ListLongMap!14325)

(assert (=> b!1070507 (= lt!472947 lt!472949)))

(declare-fun lt!472951 () Unit!35148)

(declare-fun zeroValueAfter!47 () V!39353)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!793 (array!68345 array!68347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 V!39353 V!39353 (_ BitVec 32) Int) Unit!35148)

(assert (=> b!1070507 (= lt!472951 (lemmaNoChangeToArrayThenSameMapNoExtras!793 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3790 (array!68345 array!68347 (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 (_ BitVec 32) Int) ListLongMap!14325)

(assert (=> b!1070507 (= lt!472949 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070507 (= lt!472947 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40192 () Bool)

(assert (=> mapIsEmpty!40192 mapRes!40192))

(declare-fun b!1070508 () Bool)

(declare-fun res!713947 () Bool)

(assert (=> b!1070508 (=> (not res!713947) (not e!610996))))

(assert (=> b!1070508 (= res!713947 (and (= (size!33403 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33402 _keys!1163) (size!33403 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40192 () Bool)

(declare-fun tp!77009 () Bool)

(assert (=> mapNonEmpty!40192 (= mapRes!40192 (and tp!77009 e!610995))))

(declare-fun mapRest!40192 () (Array (_ BitVec 32) ValueCell!12128))

(declare-fun mapKey!40192 () (_ BitVec 32))

(declare-fun mapValue!40192 () ValueCell!12128)

(assert (=> mapNonEmpty!40192 (= (arr!32866 _values!955) (store mapRest!40192 mapKey!40192 mapValue!40192))))

(declare-fun b!1070503 () Bool)

(assert (=> b!1070503 (= e!610997 tp_is_empty!25663)))

(declare-fun res!713942 () Bool)

(assert (=> start!94784 (=> (not res!713942) (not e!610996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94784 (= res!713942 (validMask!0 mask!1515))))

(assert (=> start!94784 e!610996))

(assert (=> start!94784 true))

(assert (=> start!94784 tp_is_empty!25663))

(declare-fun array_inv!25458 (array!68347) Bool)

(assert (=> start!94784 (and (array_inv!25458 _values!955) e!610999)))

(assert (=> start!94784 tp!77008))

(declare-fun array_inv!25459 (array!68345) Bool)

(assert (=> start!94784 (array_inv!25459 _keys!1163)))

(assert (= (and start!94784 res!713942) b!1070508))

(assert (= (and b!1070508 res!713947) b!1070500))

(assert (= (and b!1070500 res!713943) b!1070502))

(assert (= (and b!1070502 res!713945) b!1070507))

(assert (= (and b!1070507 (not res!713946)) b!1070505))

(assert (= (and b!1070505 (not res!713944)) b!1070506))

(assert (= (and b!1070504 condMapEmpty!40192) mapIsEmpty!40192))

(assert (= (and b!1070504 (not condMapEmpty!40192)) mapNonEmpty!40192))

(get-info :version)

(assert (= (and mapNonEmpty!40192 ((_ is ValueCellFull!12128) mapValue!40192)) b!1070501))

(assert (= (and b!1070504 ((_ is ValueCellFull!12128) mapDefault!40192)) b!1070503))

(assert (= start!94784 b!1070504))

(declare-fun m!989389 () Bool)

(assert (=> b!1070505 m!989389))

(declare-fun m!989391 () Bool)

(assert (=> b!1070505 m!989391))

(declare-fun m!989393 () Bool)

(assert (=> b!1070502 m!989393))

(declare-fun m!989395 () Bool)

(assert (=> start!94784 m!989395))

(declare-fun m!989397 () Bool)

(assert (=> start!94784 m!989397))

(declare-fun m!989399 () Bool)

(assert (=> start!94784 m!989399))

(declare-fun m!989401 () Bool)

(assert (=> mapNonEmpty!40192 m!989401))

(declare-fun m!989403 () Bool)

(assert (=> b!1070500 m!989403))

(declare-fun m!989405 () Bool)

(assert (=> b!1070507 m!989405))

(declare-fun m!989407 () Bool)

(assert (=> b!1070507 m!989407))

(declare-fun m!989409 () Bool)

(assert (=> b!1070507 m!989409))

(declare-fun m!989411 () Bool)

(assert (=> b!1070506 m!989411))

(declare-fun m!989413 () Bool)

(assert (=> b!1070506 m!989413))

(check-sat (not b!1070500) (not start!94784) tp_is_empty!25663 (not b!1070506) (not b!1070507) (not b!1070502) (not b!1070505) (not mapNonEmpty!40192) (not b_next!21853) b_and!34665)
(check-sat b_and!34665 (not b_next!21853))
(get-model)

(declare-fun d!129653 () Bool)

(assert (=> d!129653 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94784 d!129653))

(declare-fun d!129655 () Bool)

(assert (=> d!129655 (= (array_inv!25458 _values!955) (bvsge (size!33403 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94784 d!129655))

(declare-fun d!129657 () Bool)

(assert (=> d!129657 (= (array_inv!25459 _keys!1163) (bvsge (size!33402 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94784 d!129657))

(declare-fun d!129659 () Bool)

(assert (=> d!129659 (= (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472984 () Unit!35148)

(declare-fun choose!1741 (array!68345 array!68347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 V!39353 V!39353 (_ BitVec 32) Int) Unit!35148)

(assert (=> d!129659 (= lt!472984 (choose!1741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129659 (validMask!0 mask!1515)))

(assert (=> d!129659 (= (lemmaNoChangeToArrayThenSameMapNoExtras!793 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472984)))

(declare-fun bs!31503 () Bool)

(assert (= bs!31503 d!129659))

(assert (=> bs!31503 m!989409))

(assert (=> bs!31503 m!989407))

(declare-fun m!989467 () Bool)

(assert (=> bs!31503 m!989467))

(assert (=> bs!31503 m!989395))

(assert (=> b!1070507 d!129659))

(declare-fun b!1070587 () Bool)

(declare-fun e!611061 () Bool)

(declare-fun e!611063 () Bool)

(assert (=> b!1070587 (= e!611061 e!611063)))

(assert (=> b!1070587 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun res!713993 () Bool)

(declare-fun lt!473001 () ListLongMap!14325)

(assert (=> b!1070587 (= res!713993 (contains!6337 lt!473001 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070587 (=> (not res!713993) (not e!611063))))

(declare-fun b!1070588 () Bool)

(declare-fun e!611058 () Bool)

(declare-fun isEmpty!949 (ListLongMap!14325) Bool)

(assert (=> b!1070588 (= e!611058 (isEmpty!949 lt!473001))))

(declare-fun b!1070589 () Bool)

(declare-fun e!611060 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1070589 (= e!611060 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070589 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45196 () Bool)

(declare-fun call!45199 () ListLongMap!14325)

(assert (=> bm!45196 (= call!45199 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1070590 () Bool)

(assert (=> b!1070590 (= e!611058 (= lt!473001 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1070591 () Bool)

(assert (=> b!1070591 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (=> b!1070591 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33403 _values!955)))))

(declare-fun apply!936 (ListLongMap!14325 (_ BitVec 64)) V!39353)

(declare-fun get!17136 (ValueCell!12128 V!39353) V!39353)

(declare-fun dynLambda!2051 (Int (_ BitVec 64)) V!39353)

(assert (=> b!1070591 (= e!611063 (= (apply!936 lt!473001 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)) (get!17136 (select (arr!32866 _values!955) #b00000000000000000000000000000000) (dynLambda!2051 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!129661 () Bool)

(declare-fun e!611062 () Bool)

(assert (=> d!129661 e!611062))

(declare-fun res!713994 () Bool)

(assert (=> d!129661 (=> (not res!713994) (not e!611062))))

(assert (=> d!129661 (= res!713994 (not (contains!6337 lt!473001 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!611057 () ListLongMap!14325)

(assert (=> d!129661 (= lt!473001 e!611057)))

(declare-fun c!107963 () Bool)

(assert (=> d!129661 (= c!107963 (bvsge #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (=> d!129661 (validMask!0 mask!1515)))

(assert (=> d!129661 (= (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473001)))

(declare-fun b!1070592 () Bool)

(assert (=> b!1070592 (= e!611057 (ListLongMap!14326 Nil!22912))))

(declare-fun b!1070593 () Bool)

(declare-fun e!611059 () ListLongMap!14325)

(assert (=> b!1070593 (= e!611059 call!45199)))

(declare-fun b!1070594 () Bool)

(assert (=> b!1070594 (= e!611062 e!611061)))

(declare-fun c!107964 () Bool)

(assert (=> b!1070594 (= c!107964 e!611060)))

(declare-fun res!713995 () Bool)

(assert (=> b!1070594 (=> (not res!713995) (not e!611060))))

(assert (=> b!1070594 (= res!713995 (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun b!1070595 () Bool)

(assert (=> b!1070595 (= e!611057 e!611059)))

(declare-fun c!107966 () Bool)

(assert (=> b!1070595 (= c!107966 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070596 () Bool)

(declare-fun lt!473000 () Unit!35148)

(declare-fun lt!473003 () Unit!35148)

(assert (=> b!1070596 (= lt!473000 lt!473003)))

(declare-fun lt!472999 () (_ BitVec 64))

(declare-fun lt!473005 () (_ BitVec 64))

(declare-fun lt!473004 () V!39353)

(declare-fun lt!473002 () ListLongMap!14325)

(declare-fun +!3180 (ListLongMap!14325 tuple2!16348) ListLongMap!14325)

(assert (=> b!1070596 (not (contains!6337 (+!3180 lt!473002 (tuple2!16349 lt!472999 lt!473004)) lt!473005))))

(declare-fun addStillNotContains!257 (ListLongMap!14325 (_ BitVec 64) V!39353 (_ BitVec 64)) Unit!35148)

(assert (=> b!1070596 (= lt!473003 (addStillNotContains!257 lt!473002 lt!472999 lt!473004 lt!473005))))

(assert (=> b!1070596 (= lt!473005 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1070596 (= lt!473004 (get!17136 (select (arr!32866 _values!955) #b00000000000000000000000000000000) (dynLambda!2051 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1070596 (= lt!472999 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070596 (= lt!473002 call!45199)))

(assert (=> b!1070596 (= e!611059 (+!3180 call!45199 (tuple2!16349 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000) (get!17136 (select (arr!32866 _values!955) #b00000000000000000000000000000000) (dynLambda!2051 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1070597 () Bool)

(declare-fun res!713992 () Bool)

(assert (=> b!1070597 (=> (not res!713992) (not e!611062))))

(assert (=> b!1070597 (= res!713992 (not (contains!6337 lt!473001 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1070598 () Bool)

(assert (=> b!1070598 (= e!611061 e!611058)))

(declare-fun c!107965 () Bool)

(assert (=> b!1070598 (= c!107965 (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (= (and d!129661 c!107963) b!1070592))

(assert (= (and d!129661 (not c!107963)) b!1070595))

(assert (= (and b!1070595 c!107966) b!1070596))

(assert (= (and b!1070595 (not c!107966)) b!1070593))

(assert (= (or b!1070596 b!1070593) bm!45196))

(assert (= (and d!129661 res!713994) b!1070597))

(assert (= (and b!1070597 res!713992) b!1070594))

(assert (= (and b!1070594 res!713995) b!1070589))

(assert (= (and b!1070594 c!107964) b!1070587))

(assert (= (and b!1070594 (not c!107964)) b!1070598))

(assert (= (and b!1070587 res!713993) b!1070591))

(assert (= (and b!1070598 c!107965) b!1070590))

(assert (= (and b!1070598 (not c!107965)) b!1070588))

(declare-fun b_lambda!16631 () Bool)

(assert (=> (not b_lambda!16631) (not b!1070591)))

(declare-fun t!32236 () Bool)

(declare-fun tb!7141 () Bool)

(assert (=> (and start!94784 (= defaultEntry!963 defaultEntry!963) t!32236) tb!7141))

(declare-fun result!14747 () Bool)

(assert (=> tb!7141 (= result!14747 tp_is_empty!25663)))

(assert (=> b!1070591 t!32236))

(declare-fun b_and!34671 () Bool)

(assert (= b_and!34665 (and (=> t!32236 result!14747) b_and!34671)))

(declare-fun b_lambda!16633 () Bool)

(assert (=> (not b_lambda!16633) (not b!1070596)))

(assert (=> b!1070596 t!32236))

(declare-fun b_and!34673 () Bool)

(assert (= b_and!34671 (and (=> t!32236 result!14747) b_and!34673)))

(declare-fun m!989469 () Bool)

(assert (=> b!1070590 m!989469))

(declare-fun m!989471 () Bool)

(assert (=> b!1070595 m!989471))

(assert (=> b!1070595 m!989471))

(declare-fun m!989473 () Bool)

(assert (=> b!1070595 m!989473))

(declare-fun m!989475 () Bool)

(assert (=> b!1070597 m!989475))

(declare-fun m!989477 () Bool)

(assert (=> b!1070596 m!989477))

(declare-fun m!989479 () Bool)

(assert (=> b!1070596 m!989479))

(declare-fun m!989481 () Bool)

(assert (=> b!1070596 m!989481))

(declare-fun m!989483 () Bool)

(assert (=> b!1070596 m!989483))

(assert (=> b!1070596 m!989479))

(assert (=> b!1070596 m!989481))

(declare-fun m!989485 () Bool)

(assert (=> b!1070596 m!989485))

(declare-fun m!989487 () Bool)

(assert (=> b!1070596 m!989487))

(assert (=> b!1070596 m!989485))

(declare-fun m!989489 () Bool)

(assert (=> b!1070596 m!989489))

(assert (=> b!1070596 m!989471))

(assert (=> bm!45196 m!989469))

(assert (=> b!1070587 m!989471))

(assert (=> b!1070587 m!989471))

(declare-fun m!989491 () Bool)

(assert (=> b!1070587 m!989491))

(assert (=> b!1070589 m!989471))

(assert (=> b!1070589 m!989471))

(assert (=> b!1070589 m!989473))

(declare-fun m!989493 () Bool)

(assert (=> d!129661 m!989493))

(assert (=> d!129661 m!989395))

(declare-fun m!989495 () Bool)

(assert (=> b!1070588 m!989495))

(assert (=> b!1070591 m!989471))

(declare-fun m!989497 () Bool)

(assert (=> b!1070591 m!989497))

(assert (=> b!1070591 m!989479))

(assert (=> b!1070591 m!989481))

(assert (=> b!1070591 m!989483))

(assert (=> b!1070591 m!989479))

(assert (=> b!1070591 m!989481))

(assert (=> b!1070591 m!989471))

(assert (=> b!1070507 d!129661))

(declare-fun b!1070601 () Bool)

(declare-fun e!611068 () Bool)

(declare-fun e!611070 () Bool)

(assert (=> b!1070601 (= e!611068 e!611070)))

(assert (=> b!1070601 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun res!713997 () Bool)

(declare-fun lt!473008 () ListLongMap!14325)

(assert (=> b!1070601 (= res!713997 (contains!6337 lt!473008 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070601 (=> (not res!713997) (not e!611070))))

(declare-fun b!1070602 () Bool)

(declare-fun e!611065 () Bool)

(assert (=> b!1070602 (= e!611065 (isEmpty!949 lt!473008))))

(declare-fun b!1070603 () Bool)

(declare-fun e!611067 () Bool)

(assert (=> b!1070603 (= e!611067 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070603 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!45200 () ListLongMap!14325)

(declare-fun bm!45197 () Bool)

(assert (=> bm!45197 (= call!45200 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1070604 () Bool)

(assert (=> b!1070604 (= e!611065 (= lt!473008 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1070605 () Bool)

(assert (=> b!1070605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (=> b!1070605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33403 _values!955)))))

(assert (=> b!1070605 (= e!611070 (= (apply!936 lt!473008 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)) (get!17136 (select (arr!32866 _values!955) #b00000000000000000000000000000000) (dynLambda!2051 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!129663 () Bool)

(declare-fun e!611069 () Bool)

(assert (=> d!129663 e!611069))

(declare-fun res!713998 () Bool)

(assert (=> d!129663 (=> (not res!713998) (not e!611069))))

(assert (=> d!129663 (= res!713998 (not (contains!6337 lt!473008 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!611064 () ListLongMap!14325)

(assert (=> d!129663 (= lt!473008 e!611064)))

(declare-fun c!107967 () Bool)

(assert (=> d!129663 (= c!107967 (bvsge #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (=> d!129663 (validMask!0 mask!1515)))

(assert (=> d!129663 (= (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473008)))

(declare-fun b!1070606 () Bool)

(assert (=> b!1070606 (= e!611064 (ListLongMap!14326 Nil!22912))))

(declare-fun b!1070607 () Bool)

(declare-fun e!611066 () ListLongMap!14325)

(assert (=> b!1070607 (= e!611066 call!45200)))

(declare-fun b!1070608 () Bool)

(assert (=> b!1070608 (= e!611069 e!611068)))

(declare-fun c!107968 () Bool)

(assert (=> b!1070608 (= c!107968 e!611067)))

(declare-fun res!713999 () Bool)

(assert (=> b!1070608 (=> (not res!713999) (not e!611067))))

(assert (=> b!1070608 (= res!713999 (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun b!1070609 () Bool)

(assert (=> b!1070609 (= e!611064 e!611066)))

(declare-fun c!107970 () Bool)

(assert (=> b!1070609 (= c!107970 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070610 () Bool)

(declare-fun lt!473007 () Unit!35148)

(declare-fun lt!473010 () Unit!35148)

(assert (=> b!1070610 (= lt!473007 lt!473010)))

(declare-fun lt!473011 () V!39353)

(declare-fun lt!473009 () ListLongMap!14325)

(declare-fun lt!473012 () (_ BitVec 64))

(declare-fun lt!473006 () (_ BitVec 64))

(assert (=> b!1070610 (not (contains!6337 (+!3180 lt!473009 (tuple2!16349 lt!473006 lt!473011)) lt!473012))))

(assert (=> b!1070610 (= lt!473010 (addStillNotContains!257 lt!473009 lt!473006 lt!473011 lt!473012))))

(assert (=> b!1070610 (= lt!473012 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1070610 (= lt!473011 (get!17136 (select (arr!32866 _values!955) #b00000000000000000000000000000000) (dynLambda!2051 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1070610 (= lt!473006 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070610 (= lt!473009 call!45200)))

(assert (=> b!1070610 (= e!611066 (+!3180 call!45200 (tuple2!16349 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000) (get!17136 (select (arr!32866 _values!955) #b00000000000000000000000000000000) (dynLambda!2051 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1070611 () Bool)

(declare-fun res!713996 () Bool)

(assert (=> b!1070611 (=> (not res!713996) (not e!611069))))

(assert (=> b!1070611 (= res!713996 (not (contains!6337 lt!473008 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1070612 () Bool)

(assert (=> b!1070612 (= e!611068 e!611065)))

(declare-fun c!107969 () Bool)

(assert (=> b!1070612 (= c!107969 (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (= (and d!129663 c!107967) b!1070606))

(assert (= (and d!129663 (not c!107967)) b!1070609))

(assert (= (and b!1070609 c!107970) b!1070610))

(assert (= (and b!1070609 (not c!107970)) b!1070607))

(assert (= (or b!1070610 b!1070607) bm!45197))

(assert (= (and d!129663 res!713998) b!1070611))

(assert (= (and b!1070611 res!713996) b!1070608))

(assert (= (and b!1070608 res!713999) b!1070603))

(assert (= (and b!1070608 c!107968) b!1070601))

(assert (= (and b!1070608 (not c!107968)) b!1070612))

(assert (= (and b!1070601 res!713997) b!1070605))

(assert (= (and b!1070612 c!107969) b!1070604))

(assert (= (and b!1070612 (not c!107969)) b!1070602))

(declare-fun b_lambda!16635 () Bool)

(assert (=> (not b_lambda!16635) (not b!1070605)))

(assert (=> b!1070605 t!32236))

(declare-fun b_and!34675 () Bool)

(assert (= b_and!34673 (and (=> t!32236 result!14747) b_and!34675)))

(declare-fun b_lambda!16637 () Bool)

(assert (=> (not b_lambda!16637) (not b!1070610)))

(assert (=> b!1070610 t!32236))

(declare-fun b_and!34677 () Bool)

(assert (= b_and!34675 (and (=> t!32236 result!14747) b_and!34677)))

(declare-fun m!989499 () Bool)

(assert (=> b!1070604 m!989499))

(assert (=> b!1070609 m!989471))

(assert (=> b!1070609 m!989471))

(assert (=> b!1070609 m!989473))

(declare-fun m!989501 () Bool)

(assert (=> b!1070611 m!989501))

(declare-fun m!989503 () Bool)

(assert (=> b!1070610 m!989503))

(assert (=> b!1070610 m!989479))

(assert (=> b!1070610 m!989481))

(assert (=> b!1070610 m!989483))

(assert (=> b!1070610 m!989479))

(assert (=> b!1070610 m!989481))

(declare-fun m!989505 () Bool)

(assert (=> b!1070610 m!989505))

(declare-fun m!989507 () Bool)

(assert (=> b!1070610 m!989507))

(assert (=> b!1070610 m!989505))

(declare-fun m!989509 () Bool)

(assert (=> b!1070610 m!989509))

(assert (=> b!1070610 m!989471))

(assert (=> bm!45197 m!989499))

(assert (=> b!1070601 m!989471))

(assert (=> b!1070601 m!989471))

(declare-fun m!989511 () Bool)

(assert (=> b!1070601 m!989511))

(assert (=> b!1070603 m!989471))

(assert (=> b!1070603 m!989471))

(assert (=> b!1070603 m!989473))

(declare-fun m!989513 () Bool)

(assert (=> d!129663 m!989513))

(assert (=> d!129663 m!989395))

(declare-fun m!989515 () Bool)

(assert (=> b!1070602 m!989515))

(assert (=> b!1070605 m!989471))

(declare-fun m!989517 () Bool)

(assert (=> b!1070605 m!989517))

(assert (=> b!1070605 m!989479))

(assert (=> b!1070605 m!989481))

(assert (=> b!1070605 m!989483))

(assert (=> b!1070605 m!989479))

(assert (=> b!1070605 m!989481))

(assert (=> b!1070605 m!989471))

(assert (=> b!1070507 d!129663))

(declare-fun bm!45200 () Bool)

(declare-fun call!45203 () Bool)

(declare-fun c!107973 () Bool)

(assert (=> bm!45200 (= call!45203 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107973 (Cons!22910 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000) Nil!22911) Nil!22911)))))

(declare-fun b!1070623 () Bool)

(declare-fun e!611079 () Bool)

(declare-fun e!611080 () Bool)

(assert (=> b!1070623 (= e!611079 e!611080)))

(declare-fun res!714006 () Bool)

(assert (=> b!1070623 (=> (not res!714006) (not e!611080))))

(declare-fun e!611081 () Bool)

(assert (=> b!1070623 (= res!714006 (not e!611081))))

(declare-fun res!714007 () Bool)

(assert (=> b!1070623 (=> (not res!714007) (not e!611081))))

(assert (=> b!1070623 (= res!714007 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070624 () Bool)

(declare-fun e!611082 () Bool)

(assert (=> b!1070624 (= e!611082 call!45203)))

(declare-fun b!1070625 () Bool)

(assert (=> b!1070625 (= e!611082 call!45203)))

(declare-fun d!129665 () Bool)

(declare-fun res!714008 () Bool)

(assert (=> d!129665 (=> res!714008 e!611079)))

(assert (=> d!129665 (= res!714008 (bvsge #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (=> d!129665 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22911) e!611079)))

(declare-fun b!1070626 () Bool)

(assert (=> b!1070626 (= e!611080 e!611082)))

(assert (=> b!1070626 (= c!107973 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070627 () Bool)

(declare-fun contains!6338 (List!22914 (_ BitVec 64)) Bool)

(assert (=> b!1070627 (= e!611081 (contains!6338 Nil!22911 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129665 (not res!714008)) b!1070623))

(assert (= (and b!1070623 res!714007) b!1070627))

(assert (= (and b!1070623 res!714006) b!1070626))

(assert (= (and b!1070626 c!107973) b!1070625))

(assert (= (and b!1070626 (not c!107973)) b!1070624))

(assert (= (or b!1070625 b!1070624) bm!45200))

(assert (=> bm!45200 m!989471))

(declare-fun m!989519 () Bool)

(assert (=> bm!45200 m!989519))

(assert (=> b!1070623 m!989471))

(assert (=> b!1070623 m!989471))

(assert (=> b!1070623 m!989473))

(assert (=> b!1070626 m!989471))

(assert (=> b!1070626 m!989471))

(assert (=> b!1070626 m!989473))

(assert (=> b!1070627 m!989471))

(assert (=> b!1070627 m!989471))

(declare-fun m!989521 () Bool)

(assert (=> b!1070627 m!989521))

(assert (=> b!1070502 d!129665))

(declare-fun d!129667 () Bool)

(declare-fun lt!473015 () ListLongMap!14325)

(assert (=> d!129667 (not (contains!6337 lt!473015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!71 (List!22915 (_ BitVec 64)) List!22915)

(assert (=> d!129667 (= lt!473015 (ListLongMap!14326 (removeStrictlySorted!71 (toList!7178 lt!472948) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129667 (= (-!659 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473015)))

(declare-fun bs!31504 () Bool)

(assert (= bs!31504 d!129667))

(declare-fun m!989523 () Bool)

(assert (=> bs!31504 m!989523))

(declare-fun m!989525 () Bool)

(assert (=> bs!31504 m!989525))

(assert (=> b!1070506 d!129667))

(declare-fun d!129669 () Bool)

(assert (=> d!129669 (= (-!659 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472948)))

(declare-fun lt!473018 () Unit!35148)

(declare-fun choose!1742 (ListLongMap!14325 (_ BitVec 64)) Unit!35148)

(assert (=> d!129669 (= lt!473018 (choose!1742 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129669 (not (contains!6337 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129669 (= (removeNotPresentStillSame!76 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473018)))

(declare-fun bs!31505 () Bool)

(assert (= bs!31505 d!129669))

(assert (=> bs!31505 m!989411))

(declare-fun m!989527 () Bool)

(assert (=> bs!31505 m!989527))

(assert (=> bs!31505 m!989389))

(assert (=> b!1070506 d!129669))

(declare-fun d!129671 () Bool)

(declare-fun e!611087 () Bool)

(assert (=> d!129671 e!611087))

(declare-fun res!714011 () Bool)

(assert (=> d!129671 (=> res!714011 e!611087)))

(declare-fun lt!473030 () Bool)

(assert (=> d!129671 (= res!714011 (not lt!473030))))

(declare-fun lt!473029 () Bool)

(assert (=> d!129671 (= lt!473030 lt!473029)))

(declare-fun lt!473027 () Unit!35148)

(declare-fun e!611088 () Unit!35148)

(assert (=> d!129671 (= lt!473027 e!611088)))

(declare-fun c!107976 () Bool)

(assert (=> d!129671 (= c!107976 lt!473029)))

(declare-fun containsKey!577 (List!22915 (_ BitVec 64)) Bool)

(assert (=> d!129671 (= lt!473029 (containsKey!577 (toList!7178 lt!472948) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129671 (= (contains!6337 lt!472948 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473030)))

(declare-fun b!1070634 () Bool)

(declare-fun lt!473028 () Unit!35148)

(assert (=> b!1070634 (= e!611088 lt!473028)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!408 (List!22915 (_ BitVec 64)) Unit!35148)

(assert (=> b!1070634 (= lt!473028 (lemmaContainsKeyImpliesGetValueByKeyDefined!408 (toList!7178 lt!472948) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!649 0))(
  ( (Some!648 (v!15496 V!39353)) (None!647) )
))
(declare-fun isDefined!446 (Option!649) Bool)

(declare-fun getValueByKey!598 (List!22915 (_ BitVec 64)) Option!649)

(assert (=> b!1070634 (isDefined!446 (getValueByKey!598 (toList!7178 lt!472948) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070635 () Bool)

(declare-fun Unit!35150 () Unit!35148)

(assert (=> b!1070635 (= e!611088 Unit!35150)))

(declare-fun b!1070636 () Bool)

(assert (=> b!1070636 (= e!611087 (isDefined!446 (getValueByKey!598 (toList!7178 lt!472948) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129671 c!107976) b!1070634))

(assert (= (and d!129671 (not c!107976)) b!1070635))

(assert (= (and d!129671 (not res!714011)) b!1070636))

(declare-fun m!989529 () Bool)

(assert (=> d!129671 m!989529))

(declare-fun m!989531 () Bool)

(assert (=> b!1070634 m!989531))

(declare-fun m!989533 () Bool)

(assert (=> b!1070634 m!989533))

(assert (=> b!1070634 m!989533))

(declare-fun m!989535 () Bool)

(assert (=> b!1070634 m!989535))

(assert (=> b!1070636 m!989533))

(assert (=> b!1070636 m!989533))

(assert (=> b!1070636 m!989535))

(assert (=> b!1070505 d!129671))

(declare-fun b!1070679 () Bool)

(declare-fun e!611123 () ListLongMap!14325)

(declare-fun call!45223 () ListLongMap!14325)

(assert (=> b!1070679 (= e!611123 call!45223)))

(declare-fun c!107990 () Bool)

(declare-fun call!45222 () ListLongMap!14325)

(declare-fun bm!45215 () Bool)

(declare-fun call!45221 () ListLongMap!14325)

(declare-fun call!45218 () ListLongMap!14325)

(declare-fun c!107989 () Bool)

(declare-fun call!45220 () ListLongMap!14325)

(assert (=> bm!45215 (= call!45220 (+!3180 (ite c!107990 call!45222 (ite c!107989 call!45218 call!45221)) (ite (or c!107990 c!107989) (tuple2!16349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45216 () Bool)

(declare-fun call!45224 () Bool)

(declare-fun lt!473089 () ListLongMap!14325)

(assert (=> bm!45216 (= call!45224 (contains!6337 lt!473089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070680 () Bool)

(declare-fun e!611125 () Bool)

(declare-fun e!611124 () Bool)

(assert (=> b!1070680 (= e!611125 e!611124)))

(declare-fun res!714038 () Bool)

(assert (=> b!1070680 (=> (not res!714038) (not e!611124))))

(assert (=> b!1070680 (= res!714038 (contains!6337 lt!473089 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070680 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun b!1070681 () Bool)

(declare-fun e!611122 () Bool)

(declare-fun e!611119 () Bool)

(assert (=> b!1070681 (= e!611122 e!611119)))

(declare-fun res!714035 () Bool)

(assert (=> b!1070681 (= res!714035 call!45224)))

(assert (=> b!1070681 (=> (not res!714035) (not e!611119))))

(declare-fun b!1070682 () Bool)

(declare-fun e!611117 () Bool)

(declare-fun e!611121 () Bool)

(assert (=> b!1070682 (= e!611117 e!611121)))

(declare-fun res!714034 () Bool)

(declare-fun call!45219 () Bool)

(assert (=> b!1070682 (= res!714034 call!45219)))

(assert (=> b!1070682 (=> (not res!714034) (not e!611121))))

(declare-fun bm!45217 () Bool)

(assert (=> bm!45217 (= call!45219 (contains!6337 lt!473089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070683 () Bool)

(declare-fun e!611118 () Unit!35148)

(declare-fun Unit!35151 () Unit!35148)

(assert (=> b!1070683 (= e!611118 Unit!35151)))

(declare-fun b!1070684 () Bool)

(declare-fun res!714030 () Bool)

(declare-fun e!611127 () Bool)

(assert (=> b!1070684 (=> (not res!714030) (not e!611127))))

(assert (=> b!1070684 (= res!714030 e!611125)))

(declare-fun res!714032 () Bool)

(assert (=> b!1070684 (=> res!714032 e!611125)))

(declare-fun e!611120 () Bool)

(assert (=> b!1070684 (= res!714032 (not e!611120))))

(declare-fun res!714031 () Bool)

(assert (=> b!1070684 (=> (not res!714031) (not e!611120))))

(assert (=> b!1070684 (= res!714031 (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun b!1070685 () Bool)

(assert (=> b!1070685 (= e!611120 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070686 () Bool)

(assert (=> b!1070686 (= e!611121 (= (apply!936 lt!473089 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1070687 () Bool)

(declare-fun res!714036 () Bool)

(assert (=> b!1070687 (=> (not res!714036) (not e!611127))))

(assert (=> b!1070687 (= res!714036 e!611122)))

(declare-fun c!107991 () Bool)

(assert (=> b!1070687 (= c!107991 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070688 () Bool)

(assert (=> b!1070688 (= e!611127 e!611117)))

(declare-fun c!107993 () Bool)

(assert (=> b!1070688 (= c!107993 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1070689 () Bool)

(assert (=> b!1070689 (= e!611124 (= (apply!936 lt!473089 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)) (get!17136 (select (arr!32866 _values!955) #b00000000000000000000000000000000) (dynLambda!2051 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1070689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33403 _values!955)))))

(assert (=> b!1070689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun b!1070690 () Bool)

(declare-fun e!611126 () ListLongMap!14325)

(assert (=> b!1070690 (= e!611126 call!45223)))

(declare-fun b!1070691 () Bool)

(declare-fun c!107994 () Bool)

(assert (=> b!1070691 (= c!107994 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1070691 (= e!611126 e!611123)))

(declare-fun bm!45218 () Bool)

(assert (=> bm!45218 (= call!45223 call!45220)))

(declare-fun d!129673 () Bool)

(assert (=> d!129673 e!611127))

(declare-fun res!714033 () Bool)

(assert (=> d!129673 (=> (not res!714033) (not e!611127))))

(assert (=> d!129673 (= res!714033 (or (bvsge #b00000000000000000000000000000000 (size!33402 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))))

(declare-fun lt!473091 () ListLongMap!14325)

(assert (=> d!129673 (= lt!473089 lt!473091)))

(declare-fun lt!473094 () Unit!35148)

(assert (=> d!129673 (= lt!473094 e!611118)))

(declare-fun c!107992 () Bool)

(declare-fun e!611115 () Bool)

(assert (=> d!129673 (= c!107992 e!611115)))

(declare-fun res!714037 () Bool)

(assert (=> d!129673 (=> (not res!714037) (not e!611115))))

(assert (=> d!129673 (= res!714037 (bvslt #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(declare-fun e!611116 () ListLongMap!14325)

(assert (=> d!129673 (= lt!473091 e!611116)))

(assert (=> d!129673 (= c!107990 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129673 (validMask!0 mask!1515)))

(assert (=> d!129673 (= (getCurrentListMap!4099 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473089)))

(declare-fun bm!45219 () Bool)

(assert (=> bm!45219 (= call!45221 call!45218)))

(declare-fun b!1070692 () Bool)

(declare-fun lt!473085 () Unit!35148)

(assert (=> b!1070692 (= e!611118 lt!473085)))

(declare-fun lt!473092 () ListLongMap!14325)

(assert (=> b!1070692 (= lt!473092 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473078 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473078 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473081 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473081 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473093 () Unit!35148)

(declare-fun addStillContains!642 (ListLongMap!14325 (_ BitVec 64) V!39353 (_ BitVec 64)) Unit!35148)

(assert (=> b!1070692 (= lt!473093 (addStillContains!642 lt!473092 lt!473078 zeroValueBefore!47 lt!473081))))

(assert (=> b!1070692 (contains!6337 (+!3180 lt!473092 (tuple2!16349 lt!473078 zeroValueBefore!47)) lt!473081)))

(declare-fun lt!473077 () Unit!35148)

(assert (=> b!1070692 (= lt!473077 lt!473093)))

(declare-fun lt!473082 () ListLongMap!14325)

(assert (=> b!1070692 (= lt!473082 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473088 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473088 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473095 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473095 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473079 () Unit!35148)

(declare-fun addApplyDifferent!498 (ListLongMap!14325 (_ BitVec 64) V!39353 (_ BitVec 64)) Unit!35148)

(assert (=> b!1070692 (= lt!473079 (addApplyDifferent!498 lt!473082 lt!473088 minValue!907 lt!473095))))

(assert (=> b!1070692 (= (apply!936 (+!3180 lt!473082 (tuple2!16349 lt!473088 minValue!907)) lt!473095) (apply!936 lt!473082 lt!473095))))

(declare-fun lt!473086 () Unit!35148)

(assert (=> b!1070692 (= lt!473086 lt!473079)))

(declare-fun lt!473075 () ListLongMap!14325)

(assert (=> b!1070692 (= lt!473075 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473080 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473090 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473090 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473084 () Unit!35148)

(assert (=> b!1070692 (= lt!473084 (addApplyDifferent!498 lt!473075 lt!473080 zeroValueBefore!47 lt!473090))))

(assert (=> b!1070692 (= (apply!936 (+!3180 lt!473075 (tuple2!16349 lt!473080 zeroValueBefore!47)) lt!473090) (apply!936 lt!473075 lt!473090))))

(declare-fun lt!473083 () Unit!35148)

(assert (=> b!1070692 (= lt!473083 lt!473084)))

(declare-fun lt!473096 () ListLongMap!14325)

(assert (=> b!1070692 (= lt!473096 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473087 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473087 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473076 () (_ BitVec 64))

(assert (=> b!1070692 (= lt!473076 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070692 (= lt!473085 (addApplyDifferent!498 lt!473096 lt!473087 minValue!907 lt!473076))))

(assert (=> b!1070692 (= (apply!936 (+!3180 lt!473096 (tuple2!16349 lt!473087 minValue!907)) lt!473076) (apply!936 lt!473096 lt!473076))))

(declare-fun b!1070693 () Bool)

(assert (=> b!1070693 (= e!611117 (not call!45219))))

(declare-fun b!1070694 () Bool)

(assert (=> b!1070694 (= e!611116 (+!3180 call!45220 (tuple2!16349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45220 () Bool)

(assert (=> bm!45220 (= call!45222 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070695 () Bool)

(assert (=> b!1070695 (= e!611122 (not call!45224))))

(declare-fun bm!45221 () Bool)

(assert (=> bm!45221 (= call!45218 call!45222)))

(declare-fun b!1070696 () Bool)

(assert (=> b!1070696 (= e!611119 (= (apply!936 lt!473089 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1070697 () Bool)

(assert (=> b!1070697 (= e!611115 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070698 () Bool)

(assert (=> b!1070698 (= e!611116 e!611126)))

(assert (=> b!1070698 (= c!107989 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1070699 () Bool)

(assert (=> b!1070699 (= e!611123 call!45221)))

(assert (= (and d!129673 c!107990) b!1070694))

(assert (= (and d!129673 (not c!107990)) b!1070698))

(assert (= (and b!1070698 c!107989) b!1070690))

(assert (= (and b!1070698 (not c!107989)) b!1070691))

(assert (= (and b!1070691 c!107994) b!1070679))

(assert (= (and b!1070691 (not c!107994)) b!1070699))

(assert (= (or b!1070679 b!1070699) bm!45219))

(assert (= (or b!1070690 bm!45219) bm!45221))

(assert (= (or b!1070690 b!1070679) bm!45218))

(assert (= (or b!1070694 bm!45221) bm!45220))

(assert (= (or b!1070694 bm!45218) bm!45215))

(assert (= (and d!129673 res!714037) b!1070697))

(assert (= (and d!129673 c!107992) b!1070692))

(assert (= (and d!129673 (not c!107992)) b!1070683))

(assert (= (and d!129673 res!714033) b!1070684))

(assert (= (and b!1070684 res!714031) b!1070685))

(assert (= (and b!1070684 (not res!714032)) b!1070680))

(assert (= (and b!1070680 res!714038) b!1070689))

(assert (= (and b!1070684 res!714030) b!1070687))

(assert (= (and b!1070687 c!107991) b!1070681))

(assert (= (and b!1070687 (not c!107991)) b!1070695))

(assert (= (and b!1070681 res!714035) b!1070696))

(assert (= (or b!1070681 b!1070695) bm!45216))

(assert (= (and b!1070687 res!714036) b!1070688))

(assert (= (and b!1070688 c!107993) b!1070682))

(assert (= (and b!1070688 (not c!107993)) b!1070693))

(assert (= (and b!1070682 res!714034) b!1070686))

(assert (= (or b!1070682 b!1070693) bm!45217))

(declare-fun b_lambda!16639 () Bool)

(assert (=> (not b_lambda!16639) (not b!1070689)))

(assert (=> b!1070689 t!32236))

(declare-fun b_and!34679 () Bool)

(assert (= b_and!34677 (and (=> t!32236 result!14747) b_and!34679)))

(declare-fun m!989537 () Bool)

(assert (=> b!1070686 m!989537))

(assert (=> b!1070697 m!989471))

(assert (=> b!1070697 m!989471))

(assert (=> b!1070697 m!989473))

(declare-fun m!989539 () Bool)

(assert (=> bm!45215 m!989539))

(assert (=> b!1070689 m!989471))

(assert (=> b!1070689 m!989481))

(assert (=> b!1070689 m!989479))

(assert (=> b!1070689 m!989479))

(assert (=> b!1070689 m!989481))

(assert (=> b!1070689 m!989483))

(assert (=> b!1070689 m!989471))

(declare-fun m!989541 () Bool)

(assert (=> b!1070689 m!989541))

(assert (=> d!129673 m!989395))

(declare-fun m!989543 () Bool)

(assert (=> bm!45216 m!989543))

(assert (=> b!1070680 m!989471))

(assert (=> b!1070680 m!989471))

(declare-fun m!989545 () Bool)

(assert (=> b!1070680 m!989545))

(declare-fun m!989547 () Bool)

(assert (=> b!1070696 m!989547))

(assert (=> b!1070685 m!989471))

(assert (=> b!1070685 m!989471))

(assert (=> b!1070685 m!989473))

(assert (=> bm!45220 m!989409))

(declare-fun m!989549 () Bool)

(assert (=> b!1070692 m!989549))

(declare-fun m!989551 () Bool)

(assert (=> b!1070692 m!989551))

(assert (=> b!1070692 m!989551))

(declare-fun m!989553 () Bool)

(assert (=> b!1070692 m!989553))

(assert (=> b!1070692 m!989409))

(declare-fun m!989555 () Bool)

(assert (=> b!1070692 m!989555))

(declare-fun m!989557 () Bool)

(assert (=> b!1070692 m!989557))

(declare-fun m!989559 () Bool)

(assert (=> b!1070692 m!989559))

(declare-fun m!989561 () Bool)

(assert (=> b!1070692 m!989561))

(declare-fun m!989563 () Bool)

(assert (=> b!1070692 m!989563))

(declare-fun m!989565 () Bool)

(assert (=> b!1070692 m!989565))

(declare-fun m!989567 () Bool)

(assert (=> b!1070692 m!989567))

(declare-fun m!989569 () Bool)

(assert (=> b!1070692 m!989569))

(assert (=> b!1070692 m!989555))

(declare-fun m!989571 () Bool)

(assert (=> b!1070692 m!989571))

(assert (=> b!1070692 m!989567))

(declare-fun m!989573 () Bool)

(assert (=> b!1070692 m!989573))

(declare-fun m!989575 () Bool)

(assert (=> b!1070692 m!989575))

(assert (=> b!1070692 m!989471))

(assert (=> b!1070692 m!989563))

(declare-fun m!989577 () Bool)

(assert (=> b!1070692 m!989577))

(declare-fun m!989579 () Bool)

(assert (=> b!1070694 m!989579))

(declare-fun m!989581 () Bool)

(assert (=> bm!45217 m!989581))

(assert (=> b!1070505 d!129673))

(declare-fun b!1070708 () Bool)

(declare-fun e!611134 () Bool)

(declare-fun call!45227 () Bool)

(assert (=> b!1070708 (= e!611134 call!45227)))

(declare-fun b!1070710 () Bool)

(declare-fun e!611136 () Bool)

(declare-fun e!611135 () Bool)

(assert (=> b!1070710 (= e!611136 e!611135)))

(declare-fun c!107997 () Bool)

(assert (=> b!1070710 (= c!107997 (validKeyInArray!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45224 () Bool)

(assert (=> bm!45224 (= call!45227 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1070711 () Bool)

(assert (=> b!1070711 (= e!611135 e!611134)))

(declare-fun lt!473103 () (_ BitVec 64))

(assert (=> b!1070711 (= lt!473103 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473105 () Unit!35148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68345 (_ BitVec 64) (_ BitVec 32)) Unit!35148)

(assert (=> b!1070711 (= lt!473105 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!473103 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1070711 (arrayContainsKey!0 _keys!1163 lt!473103 #b00000000000000000000000000000000)))

(declare-fun lt!473104 () Unit!35148)

(assert (=> b!1070711 (= lt!473104 lt!473105)))

(declare-fun res!714044 () Bool)

(declare-datatypes ((SeekEntryResult!9836 0))(
  ( (MissingZero!9836 (index!41715 (_ BitVec 32))) (Found!9836 (index!41716 (_ BitVec 32))) (Intermediate!9836 (undefined!10648 Bool) (index!41717 (_ BitVec 32)) (x!95744 (_ BitVec 32))) (Undefined!9836) (MissingVacant!9836 (index!41718 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68345 (_ BitVec 32)) SeekEntryResult!9836)

(assert (=> b!1070711 (= res!714044 (= (seekEntryOrOpen!0 (select (arr!32865 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9836 #b00000000000000000000000000000000)))))

(assert (=> b!1070711 (=> (not res!714044) (not e!611134))))

(declare-fun b!1070709 () Bool)

(assert (=> b!1070709 (= e!611135 call!45227)))

(declare-fun d!129675 () Bool)

(declare-fun res!714043 () Bool)

(assert (=> d!129675 (=> res!714043 e!611136)))

(assert (=> d!129675 (= res!714043 (bvsge #b00000000000000000000000000000000 (size!33402 _keys!1163)))))

(assert (=> d!129675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!611136)))

(assert (= (and d!129675 (not res!714043)) b!1070710))

(assert (= (and b!1070710 c!107997) b!1070711))

(assert (= (and b!1070710 (not c!107997)) b!1070709))

(assert (= (and b!1070711 res!714044) b!1070708))

(assert (= (or b!1070708 b!1070709) bm!45224))

(assert (=> b!1070710 m!989471))

(assert (=> b!1070710 m!989471))

(assert (=> b!1070710 m!989473))

(declare-fun m!989583 () Bool)

(assert (=> bm!45224 m!989583))

(assert (=> b!1070711 m!989471))

(declare-fun m!989585 () Bool)

(assert (=> b!1070711 m!989585))

(declare-fun m!989587 () Bool)

(assert (=> b!1070711 m!989587))

(assert (=> b!1070711 m!989471))

(declare-fun m!989589 () Bool)

(assert (=> b!1070711 m!989589))

(assert (=> b!1070500 d!129675))

(declare-fun b!1070719 () Bool)

(declare-fun e!611142 () Bool)

(assert (=> b!1070719 (= e!611142 tp_is_empty!25663)))

(declare-fun b!1070718 () Bool)

(declare-fun e!611141 () Bool)

(assert (=> b!1070718 (= e!611141 tp_is_empty!25663)))

(declare-fun mapIsEmpty!40201 () Bool)

(declare-fun mapRes!40201 () Bool)

(assert (=> mapIsEmpty!40201 mapRes!40201))

(declare-fun mapNonEmpty!40201 () Bool)

(declare-fun tp!77024 () Bool)

(assert (=> mapNonEmpty!40201 (= mapRes!40201 (and tp!77024 e!611141))))

(declare-fun mapRest!40201 () (Array (_ BitVec 32) ValueCell!12128))

(declare-fun mapValue!40201 () ValueCell!12128)

(declare-fun mapKey!40201 () (_ BitVec 32))

(assert (=> mapNonEmpty!40201 (= mapRest!40192 (store mapRest!40201 mapKey!40201 mapValue!40201))))

(declare-fun condMapEmpty!40201 () Bool)

(declare-fun mapDefault!40201 () ValueCell!12128)

(assert (=> mapNonEmpty!40192 (= condMapEmpty!40201 (= mapRest!40192 ((as const (Array (_ BitVec 32) ValueCell!12128)) mapDefault!40201)))))

(assert (=> mapNonEmpty!40192 (= tp!77009 (and e!611142 mapRes!40201))))

(assert (= (and mapNonEmpty!40192 condMapEmpty!40201) mapIsEmpty!40201))

(assert (= (and mapNonEmpty!40192 (not condMapEmpty!40201)) mapNonEmpty!40201))

(assert (= (and mapNonEmpty!40201 ((_ is ValueCellFull!12128) mapValue!40201)) b!1070718))

(assert (= (and mapNonEmpty!40192 ((_ is ValueCellFull!12128) mapDefault!40201)) b!1070719))

(declare-fun m!989591 () Bool)

(assert (=> mapNonEmpty!40201 m!989591))

(declare-fun b_lambda!16641 () Bool)

(assert (= b_lambda!16633 (or (and start!94784 b_free!21853) b_lambda!16641)))

(declare-fun b_lambda!16643 () Bool)

(assert (= b_lambda!16637 (or (and start!94784 b_free!21853) b_lambda!16643)))

(declare-fun b_lambda!16645 () Bool)

(assert (= b_lambda!16635 (or (and start!94784 b_free!21853) b_lambda!16645)))

(declare-fun b_lambda!16647 () Bool)

(assert (= b_lambda!16631 (or (and start!94784 b_free!21853) b_lambda!16647)))

(declare-fun b_lambda!16649 () Bool)

(assert (= b_lambda!16639 (or (and start!94784 b_free!21853) b_lambda!16649)))

(check-sat (not d!129667) (not b!1070627) (not b!1070711) (not b!1070597) (not b!1070697) (not b!1070694) (not d!129669) (not b!1070588) (not b!1070692) (not d!129661) (not bm!45200) (not b!1070601) (not b_lambda!16647) (not b!1070686) (not bm!45224) (not b!1070609) (not b!1070602) (not bm!45196) (not b!1070680) b_and!34679 (not d!129671) (not b!1070604) (not bm!45220) (not b!1070696) (not b_lambda!16649) (not b!1070587) (not mapNonEmpty!40201) (not b!1070605) (not b!1070603) (not b_lambda!16645) tp_is_empty!25663 (not bm!45215) (not b_lambda!16643) (not b!1070590) (not b!1070591) (not b!1070595) (not b!1070636) (not b!1070685) (not d!129673) (not b!1070596) (not b_lambda!16641) (not b!1070634) (not d!129663) (not b!1070611) (not b!1070710) (not bm!45217) (not b!1070610) (not b!1070626) (not b_next!21853) (not b!1070689) (not b!1070589) (not b!1070623) (not bm!45216) (not d!129659) (not bm!45197))
(check-sat b_and!34679 (not b_next!21853))
