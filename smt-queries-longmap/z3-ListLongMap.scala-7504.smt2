; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95098 () Bool)

(assert start!95098)

(declare-fun b_free!22201 () Bool)

(declare-fun b_next!22201 () Bool)

(assert (=> start!95098 (= b_free!22201 (not b_next!22201))))

(declare-fun tp!78085 () Bool)

(declare-fun b_and!35095 () Bool)

(assert (=> start!95098 (= tp!78085 b_and!35095)))

(declare-fun b!1074958 () Bool)

(declare-fun res!716713 () Bool)

(declare-fun e!614313 () Bool)

(assert (=> b!1074958 (=> (not res!716713) (not e!614313))))

(declare-datatypes ((array!68922 0))(
  ( (array!68923 (arr!33149 (Array (_ BitVec 32) (_ BitVec 64))) (size!33687 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68922)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68922 (_ BitVec 32)) Bool)

(assert (=> b!1074958 (= res!716713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074959 () Bool)

(declare-fun res!716710 () Bool)

(assert (=> b!1074959 (=> (not res!716710) (not e!614313))))

(declare-datatypes ((List!23219 0))(
  ( (Nil!23216) (Cons!23215 (h!24424 (_ BitVec 64)) (t!32559 List!23219)) )
))
(declare-fun arrayNoDuplicates!0 (array!68922 (_ BitVec 32) List!23219) Bool)

(assert (=> b!1074959 (= res!716710 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23216))))

(declare-fun mapNonEmpty!40747 () Bool)

(declare-fun mapRes!40747 () Bool)

(declare-fun tp!78086 () Bool)

(declare-fun e!614315 () Bool)

(assert (=> mapNonEmpty!40747 (= mapRes!40747 (and tp!78086 e!614315))))

(declare-datatypes ((V!39817 0))(
  ( (V!39818 (val!13056 Int)) )
))
(declare-datatypes ((ValueCell!12302 0))(
  ( (ValueCellFull!12302 (v!15678 V!39817)) (EmptyCell!12302) )
))
(declare-fun mapRest!40747 () (Array (_ BitVec 32) ValueCell!12302))

(declare-fun mapValue!40747 () ValueCell!12302)

(declare-datatypes ((array!68924 0))(
  ( (array!68925 (arr!33150 (Array (_ BitVec 32) ValueCell!12302)) (size!33688 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68924)

(declare-fun mapKey!40747 () (_ BitVec 32))

(assert (=> mapNonEmpty!40747 (= (arr!33150 _values!955) (store mapRest!40747 mapKey!40747 mapValue!40747))))

(declare-fun b!1074960 () Bool)

(declare-fun e!614314 () Bool)

(declare-fun tp_is_empty!26011 () Bool)

(assert (=> b!1074960 (= e!614314 tp_is_empty!26011)))

(declare-fun b!1074961 () Bool)

(declare-fun e!614312 () Bool)

(assert (=> b!1074961 (= e!614312 (and e!614314 mapRes!40747))))

(declare-fun condMapEmpty!40747 () Bool)

(declare-fun mapDefault!40747 () ValueCell!12302)

(assert (=> b!1074961 (= condMapEmpty!40747 (= (arr!33150 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12302)) mapDefault!40747)))))

(declare-fun res!716712 () Bool)

(assert (=> start!95098 (=> (not res!716712) (not e!614313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95098 (= res!716712 (validMask!0 mask!1515))))

(assert (=> start!95098 e!614313))

(assert (=> start!95098 true))

(assert (=> start!95098 tp_is_empty!26011))

(declare-fun array_inv!25646 (array!68924) Bool)

(assert (=> start!95098 (and (array_inv!25646 _values!955) e!614312)))

(assert (=> start!95098 tp!78085))

(declare-fun array_inv!25647 (array!68922) Bool)

(assert (=> start!95098 (array_inv!25647 _keys!1163)))

(declare-fun b!1074962 () Bool)

(declare-fun e!614311 () Bool)

(assert (=> b!1074962 (= e!614313 (not e!614311))))

(declare-fun res!716709 () Bool)

(assert (=> b!1074962 (=> res!716709 e!614311)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074962 (= res!716709 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16698 0))(
  ( (tuple2!16699 (_1!8360 (_ BitVec 64)) (_2!8360 V!39817)) )
))
(declare-datatypes ((List!23220 0))(
  ( (Nil!23217) (Cons!23216 (h!24425 tuple2!16698) (t!32560 List!23220)) )
))
(declare-datatypes ((ListLongMap!14667 0))(
  ( (ListLongMap!14668 (toList!7349 List!23220)) )
))
(declare-fun lt!476957 () ListLongMap!14667)

(declare-fun lt!476956 () ListLongMap!14667)

(assert (=> b!1074962 (= lt!476957 lt!476956)))

(declare-fun zeroValueBefore!47 () V!39817)

(declare-datatypes ((Unit!35243 0))(
  ( (Unit!35244) )
))
(declare-fun lt!476958 () Unit!35243)

(declare-fun minValue!907 () V!39817)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39817)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!900 (array!68922 array!68924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 V!39817 V!39817 (_ BitVec 32) Int) Unit!35243)

(assert (=> b!1074962 (= lt!476958 (lemmaNoChangeToArrayThenSameMapNoExtras!900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3928 (array!68922 array!68924 (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 (_ BitVec 32) Int) ListLongMap!14667)

(assert (=> b!1074962 (= lt!476956 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074962 (= lt!476957 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074963 () Bool)

(assert (=> b!1074963 (= e!614315 tp_is_empty!26011)))

(declare-fun b!1074964 () Bool)

(declare-fun contains!6313 (ListLongMap!14667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4117 (array!68922 array!68924 (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 (_ BitVec 32) Int) ListLongMap!14667)

(assert (=> b!1074964 (= e!614311 (not (contains!6313 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074965 () Bool)

(declare-fun res!716711 () Bool)

(assert (=> b!1074965 (=> (not res!716711) (not e!614313))))

(assert (=> b!1074965 (= res!716711 (and (= (size!33688 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33687 _keys!1163) (size!33688 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40747 () Bool)

(assert (=> mapIsEmpty!40747 mapRes!40747))

(assert (= (and start!95098 res!716712) b!1074965))

(assert (= (and b!1074965 res!716711) b!1074958))

(assert (= (and b!1074958 res!716713) b!1074959))

(assert (= (and b!1074959 res!716710) b!1074962))

(assert (= (and b!1074962 (not res!716709)) b!1074964))

(assert (= (and b!1074961 condMapEmpty!40747) mapIsEmpty!40747))

(assert (= (and b!1074961 (not condMapEmpty!40747)) mapNonEmpty!40747))

(get-info :version)

(assert (= (and mapNonEmpty!40747 ((_ is ValueCellFull!12302) mapValue!40747)) b!1074963))

(assert (= (and b!1074961 ((_ is ValueCellFull!12302) mapDefault!40747)) b!1074960))

(assert (= start!95098 b!1074961))

(declare-fun m!993359 () Bool)

(assert (=> start!95098 m!993359))

(declare-fun m!993361 () Bool)

(assert (=> start!95098 m!993361))

(declare-fun m!993363 () Bool)

(assert (=> start!95098 m!993363))

(declare-fun m!993365 () Bool)

(assert (=> mapNonEmpty!40747 m!993365))

(declare-fun m!993367 () Bool)

(assert (=> b!1074959 m!993367))

(declare-fun m!993369 () Bool)

(assert (=> b!1074964 m!993369))

(assert (=> b!1074964 m!993369))

(declare-fun m!993371 () Bool)

(assert (=> b!1074964 m!993371))

(declare-fun m!993373 () Bool)

(assert (=> b!1074958 m!993373))

(declare-fun m!993375 () Bool)

(assert (=> b!1074962 m!993375))

(declare-fun m!993377 () Bool)

(assert (=> b!1074962 m!993377))

(declare-fun m!993379 () Bool)

(assert (=> b!1074962 m!993379))

(check-sat (not start!95098) (not b!1074959) (not mapNonEmpty!40747) (not b_next!22201) (not b!1074964) tp_is_empty!26011 (not b!1074962) (not b!1074958) b_and!35095)
(check-sat b_and!35095 (not b_next!22201))
(get-model)

(declare-fun d!129411 () Bool)

(assert (=> d!129411 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95098 d!129411))

(declare-fun d!129413 () Bool)

(assert (=> d!129413 (= (array_inv!25646 _values!955) (bvsge (size!33688 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95098 d!129413))

(declare-fun d!129415 () Bool)

(assert (=> d!129415 (= (array_inv!25647 _keys!1163) (bvsge (size!33687 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95098 d!129415))

(declare-fun d!129417 () Bool)

(declare-fun e!614357 () Bool)

(assert (=> d!129417 e!614357))

(declare-fun res!716746 () Bool)

(assert (=> d!129417 (=> res!716746 e!614357)))

(declare-fun lt!476988 () Bool)

(assert (=> d!129417 (= res!716746 (not lt!476988))))

(declare-fun lt!476986 () Bool)

(assert (=> d!129417 (= lt!476988 lt!476986)))

(declare-fun lt!476985 () Unit!35243)

(declare-fun e!614358 () Unit!35243)

(assert (=> d!129417 (= lt!476985 e!614358)))

(declare-fun c!107960 () Bool)

(assert (=> d!129417 (= c!107960 lt!476986)))

(declare-fun containsKey!579 (List!23220 (_ BitVec 64)) Bool)

(assert (=> d!129417 (= lt!476986 (containsKey!579 (toList!7349 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129417 (= (contains!6313 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000) lt!476988)))

(declare-fun b!1075020 () Bool)

(declare-fun lt!476987 () Unit!35243)

(assert (=> b!1075020 (= e!614358 lt!476987)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!411 (List!23220 (_ BitVec 64)) Unit!35243)

(assert (=> b!1075020 (= lt!476987 (lemmaContainsKeyImpliesGetValueByKeyDefined!411 (toList!7349 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!663 0))(
  ( (Some!662 (v!15681 V!39817)) (None!661) )
))
(declare-fun isDefined!454 (Option!663) Bool)

(declare-fun getValueByKey!612 (List!23220 (_ BitVec 64)) Option!663)

(assert (=> b!1075020 (isDefined!454 (getValueByKey!612 (toList!7349 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075021 () Bool)

(declare-fun Unit!35245 () Unit!35243)

(assert (=> b!1075021 (= e!614358 Unit!35245)))

(declare-fun b!1075022 () Bool)

(assert (=> b!1075022 (= e!614357 (isDefined!454 (getValueByKey!612 (toList!7349 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129417 c!107960) b!1075020))

(assert (= (and d!129417 (not c!107960)) b!1075021))

(assert (= (and d!129417 (not res!716746)) b!1075022))

(declare-fun m!993425 () Bool)

(assert (=> d!129417 m!993425))

(declare-fun m!993427 () Bool)

(assert (=> b!1075020 m!993427))

(declare-fun m!993429 () Bool)

(assert (=> b!1075020 m!993429))

(assert (=> b!1075020 m!993429))

(declare-fun m!993431 () Bool)

(assert (=> b!1075020 m!993431))

(assert (=> b!1075022 m!993429))

(assert (=> b!1075022 m!993429))

(assert (=> b!1075022 m!993431))

(assert (=> b!1074964 d!129417))

(declare-fun b!1075065 () Bool)

(declare-fun e!614390 () Bool)

(declare-fun e!614391 () Bool)

(assert (=> b!1075065 (= e!614390 e!614391)))

(declare-fun c!107974 () Bool)

(assert (=> b!1075065 (= c!107974 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!477049 () ListLongMap!14667)

(declare-fun b!1075066 () Bool)

(declare-fun e!614388 () Bool)

(declare-fun apply!931 (ListLongMap!14667 (_ BitVec 64)) V!39817)

(declare-fun get!17229 (ValueCell!12302 V!39817) V!39817)

(declare-fun dynLambda!2030 (Int (_ BitVec 64)) V!39817)

(assert (=> b!1075066 (= e!614388 (= (apply!931 lt!477049 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)) (get!17229 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33688 _values!955)))))

(assert (=> b!1075066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1075067 () Bool)

(declare-fun e!614395 () ListLongMap!14667)

(declare-fun call!45463 () ListLongMap!14667)

(assert (=> b!1075067 (= e!614395 call!45463)))

(declare-fun b!1075068 () Bool)

(declare-fun call!45468 () ListLongMap!14667)

(assert (=> b!1075068 (= e!614395 call!45468)))

(declare-fun b!1075069 () Bool)

(declare-fun e!614393 () Bool)

(assert (=> b!1075069 (= e!614393 (= (apply!931 lt!477049 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075070 () Bool)

(declare-fun e!614392 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075070 (= e!614392 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075071 () Bool)

(declare-fun res!716765 () Bool)

(assert (=> b!1075071 (=> (not res!716765) (not e!614390))))

(declare-fun e!614396 () Bool)

(assert (=> b!1075071 (= res!716765 e!614396)))

(declare-fun c!107973 () Bool)

(assert (=> b!1075071 (= c!107973 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45459 () Bool)

(declare-fun call!45465 () ListLongMap!14667)

(assert (=> bm!45459 (= call!45468 call!45465)))

(declare-fun b!1075072 () Bool)

(declare-fun e!614387 () ListLongMap!14667)

(declare-fun call!45464 () ListLongMap!14667)

(declare-fun +!3250 (ListLongMap!14667 tuple2!16698) ListLongMap!14667)

(assert (=> b!1075072 (= e!614387 (+!3250 call!45464 (tuple2!16699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075073 () Bool)

(declare-fun res!716772 () Bool)

(assert (=> b!1075073 (=> (not res!716772) (not e!614390))))

(declare-fun e!614394 () Bool)

(assert (=> b!1075073 (= res!716772 e!614394)))

(declare-fun res!716771 () Bool)

(assert (=> b!1075073 (=> res!716771 e!614394)))

(declare-fun e!614386 () Bool)

(assert (=> b!1075073 (= res!716771 (not e!614386))))

(declare-fun res!716770 () Bool)

(assert (=> b!1075073 (=> (not res!716770) (not e!614386))))

(assert (=> b!1075073 (= res!716770 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1075074 () Bool)

(declare-fun e!614397 () Bool)

(assert (=> b!1075074 (= e!614396 e!614397)))

(declare-fun res!716773 () Bool)

(declare-fun call!45462 () Bool)

(assert (=> b!1075074 (= res!716773 call!45462)))

(assert (=> b!1075074 (=> (not res!716773) (not e!614397))))

(declare-fun b!1075075 () Bool)

(assert (=> b!1075075 (= e!614396 (not call!45462))))

(declare-fun bm!45461 () Bool)

(assert (=> bm!45461 (= call!45463 call!45464)))

(declare-fun b!1075076 () Bool)

(declare-fun c!107976 () Bool)

(assert (=> b!1075076 (= c!107976 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614389 () ListLongMap!14667)

(assert (=> b!1075076 (= e!614389 e!614395)))

(declare-fun b!1075077 () Bool)

(assert (=> b!1075077 (= e!614397 (= (apply!931 lt!477049 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075078 () Bool)

(assert (=> b!1075078 (= e!614387 e!614389)))

(declare-fun c!107978 () Bool)

(assert (=> b!1075078 (= c!107978 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075079 () Bool)

(assert (=> b!1075079 (= e!614386 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075080 () Bool)

(assert (=> b!1075080 (= e!614389 call!45463)))

(declare-fun b!1075081 () Bool)

(assert (=> b!1075081 (= e!614391 e!614393)))

(declare-fun res!716766 () Bool)

(declare-fun call!45467 () Bool)

(assert (=> b!1075081 (= res!716766 call!45467)))

(assert (=> b!1075081 (=> (not res!716766) (not e!614393))))

(declare-fun b!1075082 () Bool)

(declare-fun e!614385 () Unit!35243)

(declare-fun lt!477048 () Unit!35243)

(assert (=> b!1075082 (= e!614385 lt!477048)))

(declare-fun lt!477050 () ListLongMap!14667)

(assert (=> b!1075082 (= lt!477050 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477040 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477046 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477046 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477047 () Unit!35243)

(declare-fun addStillContains!644 (ListLongMap!14667 (_ BitVec 64) V!39817 (_ BitVec 64)) Unit!35243)

(assert (=> b!1075082 (= lt!477047 (addStillContains!644 lt!477050 lt!477040 zeroValueBefore!47 lt!477046))))

(assert (=> b!1075082 (contains!6313 (+!3250 lt!477050 (tuple2!16699 lt!477040 zeroValueBefore!47)) lt!477046)))

(declare-fun lt!477042 () Unit!35243)

(assert (=> b!1075082 (= lt!477042 lt!477047)))

(declare-fun lt!477033 () ListLongMap!14667)

(assert (=> b!1075082 (= lt!477033 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477041 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477041 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477039 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477039 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477044 () Unit!35243)

(declare-fun addApplyDifferent!500 (ListLongMap!14667 (_ BitVec 64) V!39817 (_ BitVec 64)) Unit!35243)

(assert (=> b!1075082 (= lt!477044 (addApplyDifferent!500 lt!477033 lt!477041 minValue!907 lt!477039))))

(assert (=> b!1075082 (= (apply!931 (+!3250 lt!477033 (tuple2!16699 lt!477041 minValue!907)) lt!477039) (apply!931 lt!477033 lt!477039))))

(declare-fun lt!477045 () Unit!35243)

(assert (=> b!1075082 (= lt!477045 lt!477044)))

(declare-fun lt!477054 () ListLongMap!14667)

(assert (=> b!1075082 (= lt!477054 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477038 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477035 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477035 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477036 () Unit!35243)

(assert (=> b!1075082 (= lt!477036 (addApplyDifferent!500 lt!477054 lt!477038 zeroValueBefore!47 lt!477035))))

(assert (=> b!1075082 (= (apply!931 (+!3250 lt!477054 (tuple2!16699 lt!477038 zeroValueBefore!47)) lt!477035) (apply!931 lt!477054 lt!477035))))

(declare-fun lt!477043 () Unit!35243)

(assert (=> b!1075082 (= lt!477043 lt!477036)))

(declare-fun lt!477053 () ListLongMap!14667)

(assert (=> b!1075082 (= lt!477053 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477052 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477051 () (_ BitVec 64))

(assert (=> b!1075082 (= lt!477051 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075082 (= lt!477048 (addApplyDifferent!500 lt!477053 lt!477052 minValue!907 lt!477051))))

(assert (=> b!1075082 (= (apply!931 (+!3250 lt!477053 (tuple2!16699 lt!477052 minValue!907)) lt!477051) (apply!931 lt!477053 lt!477051))))

(declare-fun b!1075083 () Bool)

(declare-fun Unit!35246 () Unit!35243)

(assert (=> b!1075083 (= e!614385 Unit!35246)))

(declare-fun b!1075084 () Bool)

(assert (=> b!1075084 (= e!614391 (not call!45467))))

(declare-fun bm!45462 () Bool)

(assert (=> bm!45462 (= call!45467 (contains!6313 lt!477049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!129419 () Bool)

(assert (=> d!129419 e!614390))

(declare-fun res!716767 () Bool)

(assert (=> d!129419 (=> (not res!716767) (not e!614390))))

(assert (=> d!129419 (= res!716767 (or (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))))

(declare-fun lt!477034 () ListLongMap!14667)

(assert (=> d!129419 (= lt!477049 lt!477034)))

(declare-fun lt!477037 () Unit!35243)

(assert (=> d!129419 (= lt!477037 e!614385)))

(declare-fun c!107975 () Bool)

(assert (=> d!129419 (= c!107975 e!614392)))

(declare-fun res!716769 () Bool)

(assert (=> d!129419 (=> (not res!716769) (not e!614392))))

(assert (=> d!129419 (= res!716769 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129419 (= lt!477034 e!614387)))

(declare-fun c!107977 () Bool)

(assert (=> d!129419 (= c!107977 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129419 (validMask!0 mask!1515)))

(assert (=> d!129419 (= (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477049)))

(declare-fun bm!45460 () Bool)

(declare-fun call!45466 () ListLongMap!14667)

(assert (=> bm!45460 (= call!45465 call!45466)))

(declare-fun bm!45463 () Bool)

(assert (=> bm!45463 (= call!45462 (contains!6313 lt!477049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45464 () Bool)

(assert (=> bm!45464 (= call!45464 (+!3250 (ite c!107977 call!45466 (ite c!107978 call!45465 call!45468)) (ite (or c!107977 c!107978) (tuple2!16699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45465 () Bool)

(assert (=> bm!45465 (= call!45466 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075085 () Bool)

(assert (=> b!1075085 (= e!614394 e!614388)))

(declare-fun res!716768 () Bool)

(assert (=> b!1075085 (=> (not res!716768) (not e!614388))))

(assert (=> b!1075085 (= res!716768 (contains!6313 lt!477049 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075085 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (= (and d!129419 c!107977) b!1075072))

(assert (= (and d!129419 (not c!107977)) b!1075078))

(assert (= (and b!1075078 c!107978) b!1075080))

(assert (= (and b!1075078 (not c!107978)) b!1075076))

(assert (= (and b!1075076 c!107976) b!1075067))

(assert (= (and b!1075076 (not c!107976)) b!1075068))

(assert (= (or b!1075067 b!1075068) bm!45459))

(assert (= (or b!1075080 bm!45459) bm!45460))

(assert (= (or b!1075080 b!1075067) bm!45461))

(assert (= (or b!1075072 bm!45460) bm!45465))

(assert (= (or b!1075072 bm!45461) bm!45464))

(assert (= (and d!129419 res!716769) b!1075070))

(assert (= (and d!129419 c!107975) b!1075082))

(assert (= (and d!129419 (not c!107975)) b!1075083))

(assert (= (and d!129419 res!716767) b!1075073))

(assert (= (and b!1075073 res!716770) b!1075079))

(assert (= (and b!1075073 (not res!716771)) b!1075085))

(assert (= (and b!1075085 res!716768) b!1075066))

(assert (= (and b!1075073 res!716772) b!1075071))

(assert (= (and b!1075071 c!107973) b!1075074))

(assert (= (and b!1075071 (not c!107973)) b!1075075))

(assert (= (and b!1075074 res!716773) b!1075077))

(assert (= (or b!1075074 b!1075075) bm!45463))

(assert (= (and b!1075071 res!716765) b!1075065))

(assert (= (and b!1075065 c!107974) b!1075081))

(assert (= (and b!1075065 (not c!107974)) b!1075084))

(assert (= (and b!1075081 res!716766) b!1075069))

(assert (= (or b!1075081 b!1075084) bm!45462))

(declare-fun b_lambda!16835 () Bool)

(assert (=> (not b_lambda!16835) (not b!1075066)))

(declare-fun t!32564 () Bool)

(declare-fun tb!7163 () Bool)

(assert (=> (and start!95098 (= defaultEntry!963 defaultEntry!963) t!32564) tb!7163))

(declare-fun result!14813 () Bool)

(assert (=> tb!7163 (= result!14813 tp_is_empty!26011)))

(assert (=> b!1075066 t!32564))

(declare-fun b_and!35101 () Bool)

(assert (= b_and!35095 (and (=> t!32564 result!14813) b_and!35101)))

(declare-fun m!993433 () Bool)

(assert (=> bm!45463 m!993433))

(declare-fun m!993435 () Bool)

(assert (=> b!1075082 m!993435))

(declare-fun m!993437 () Bool)

(assert (=> b!1075082 m!993437))

(declare-fun m!993439 () Bool)

(assert (=> b!1075082 m!993439))

(declare-fun m!993441 () Bool)

(assert (=> b!1075082 m!993441))

(declare-fun m!993443 () Bool)

(assert (=> b!1075082 m!993443))

(declare-fun m!993445 () Bool)

(assert (=> b!1075082 m!993445))

(declare-fun m!993447 () Bool)

(assert (=> b!1075082 m!993447))

(assert (=> b!1075082 m!993439))

(declare-fun m!993449 () Bool)

(assert (=> b!1075082 m!993449))

(declare-fun m!993451 () Bool)

(assert (=> b!1075082 m!993451))

(declare-fun m!993453 () Bool)

(assert (=> b!1075082 m!993453))

(declare-fun m!993455 () Bool)

(assert (=> b!1075082 m!993455))

(declare-fun m!993457 () Bool)

(assert (=> b!1075082 m!993457))

(assert (=> b!1075082 m!993445))

(assert (=> b!1075082 m!993451))

(declare-fun m!993459 () Bool)

(assert (=> b!1075082 m!993459))

(declare-fun m!993461 () Bool)

(assert (=> b!1075082 m!993461))

(declare-fun m!993463 () Bool)

(assert (=> b!1075082 m!993463))

(assert (=> b!1075082 m!993461))

(assert (=> b!1075082 m!993379))

(declare-fun m!993465 () Bool)

(assert (=> b!1075082 m!993465))

(declare-fun m!993467 () Bool)

(assert (=> bm!45462 m!993467))

(assert (=> d!129419 m!993359))

(declare-fun m!993469 () Bool)

(assert (=> b!1075069 m!993469))

(declare-fun m!993471 () Bool)

(assert (=> b!1075077 m!993471))

(assert (=> b!1075085 m!993435))

(assert (=> b!1075085 m!993435))

(declare-fun m!993473 () Bool)

(assert (=> b!1075085 m!993473))

(declare-fun m!993475 () Bool)

(assert (=> b!1075072 m!993475))

(assert (=> b!1075066 m!993435))

(assert (=> b!1075066 m!993435))

(declare-fun m!993477 () Bool)

(assert (=> b!1075066 m!993477))

(declare-fun m!993479 () Bool)

(assert (=> b!1075066 m!993479))

(declare-fun m!993481 () Bool)

(assert (=> b!1075066 m!993481))

(declare-fun m!993483 () Bool)

(assert (=> b!1075066 m!993483))

(assert (=> b!1075066 m!993481))

(assert (=> b!1075066 m!993479))

(assert (=> b!1075070 m!993435))

(assert (=> b!1075070 m!993435))

(declare-fun m!993485 () Bool)

(assert (=> b!1075070 m!993485))

(assert (=> b!1075079 m!993435))

(assert (=> b!1075079 m!993435))

(assert (=> b!1075079 m!993485))

(assert (=> bm!45465 m!993379))

(declare-fun m!993487 () Bool)

(assert (=> bm!45464 m!993487))

(assert (=> b!1074964 d!129419))

(declare-fun b!1075098 () Bool)

(declare-fun e!614409 () Bool)

(declare-fun contains!6315 (List!23219 (_ BitVec 64)) Bool)

(assert (=> b!1075098 (= e!614409 (contains!6315 Nil!23216 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075099 () Bool)

(declare-fun e!614407 () Bool)

(declare-fun call!45471 () Bool)

(assert (=> b!1075099 (= e!614407 call!45471)))

(declare-fun b!1075100 () Bool)

(declare-fun e!614406 () Bool)

(declare-fun e!614408 () Bool)

(assert (=> b!1075100 (= e!614406 e!614408)))

(declare-fun res!716782 () Bool)

(assert (=> b!1075100 (=> (not res!716782) (not e!614408))))

(assert (=> b!1075100 (= res!716782 (not e!614409))))

(declare-fun res!716781 () Bool)

(assert (=> b!1075100 (=> (not res!716781) (not e!614409))))

(assert (=> b!1075100 (= res!716781 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075101 () Bool)

(assert (=> b!1075101 (= e!614407 call!45471)))

(declare-fun bm!45468 () Bool)

(declare-fun c!107981 () Bool)

(assert (=> bm!45468 (= call!45471 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107981 (Cons!23215 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000) Nil!23216) Nil!23216)))))

(declare-fun b!1075102 () Bool)

(assert (=> b!1075102 (= e!614408 e!614407)))

(assert (=> b!1075102 (= c!107981 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129421 () Bool)

(declare-fun res!716780 () Bool)

(assert (=> d!129421 (=> res!716780 e!614406)))

(assert (=> d!129421 (= res!716780 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129421 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23216) e!614406)))

(assert (= (and d!129421 (not res!716780)) b!1075100))

(assert (= (and b!1075100 res!716781) b!1075098))

(assert (= (and b!1075100 res!716782) b!1075102))

(assert (= (and b!1075102 c!107981) b!1075101))

(assert (= (and b!1075102 (not c!107981)) b!1075099))

(assert (= (or b!1075101 b!1075099) bm!45468))

(assert (=> b!1075098 m!993435))

(assert (=> b!1075098 m!993435))

(declare-fun m!993489 () Bool)

(assert (=> b!1075098 m!993489))

(assert (=> b!1075100 m!993435))

(assert (=> b!1075100 m!993435))

(assert (=> b!1075100 m!993485))

(assert (=> bm!45468 m!993435))

(declare-fun m!993491 () Bool)

(assert (=> bm!45468 m!993491))

(assert (=> b!1075102 m!993435))

(assert (=> b!1075102 m!993435))

(assert (=> b!1075102 m!993485))

(assert (=> b!1074959 d!129421))

(declare-fun b!1075111 () Bool)

(declare-fun e!614417 () Bool)

(declare-fun call!45474 () Bool)

(assert (=> b!1075111 (= e!614417 call!45474)))

(declare-fun b!1075113 () Bool)

(declare-fun e!614418 () Bool)

(assert (=> b!1075113 (= e!614418 e!614417)))

(declare-fun c!107984 () Bool)

(assert (=> b!1075113 (= c!107984 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075114 () Bool)

(declare-fun e!614416 () Bool)

(assert (=> b!1075114 (= e!614416 call!45474)))

(declare-fun bm!45471 () Bool)

(assert (=> bm!45471 (= call!45474 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075112 () Bool)

(assert (=> b!1075112 (= e!614417 e!614416)))

(declare-fun lt!477062 () (_ BitVec 64))

(assert (=> b!1075112 (= lt!477062 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477061 () Unit!35243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68922 (_ BitVec 64) (_ BitVec 32)) Unit!35243)

(assert (=> b!1075112 (= lt!477061 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477062 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075112 (arrayContainsKey!0 _keys!1163 lt!477062 #b00000000000000000000000000000000)))

(declare-fun lt!477063 () Unit!35243)

(assert (=> b!1075112 (= lt!477063 lt!477061)))

(declare-fun res!716788 () Bool)

(declare-datatypes ((SeekEntryResult!9890 0))(
  ( (MissingZero!9890 (index!41931 (_ BitVec 32))) (Found!9890 (index!41932 (_ BitVec 32))) (Intermediate!9890 (undefined!10702 Bool) (index!41933 (_ BitVec 32)) (x!96358 (_ BitVec 32))) (Undefined!9890) (MissingVacant!9890 (index!41934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68922 (_ BitVec 32)) SeekEntryResult!9890)

(assert (=> b!1075112 (= res!716788 (= (seekEntryOrOpen!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9890 #b00000000000000000000000000000000)))))

(assert (=> b!1075112 (=> (not res!716788) (not e!614416))))

(declare-fun d!129423 () Bool)

(declare-fun res!716787 () Bool)

(assert (=> d!129423 (=> res!716787 e!614418)))

(assert (=> d!129423 (= res!716787 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614418)))

(assert (= (and d!129423 (not res!716787)) b!1075113))

(assert (= (and b!1075113 c!107984) b!1075112))

(assert (= (and b!1075113 (not c!107984)) b!1075111))

(assert (= (and b!1075112 res!716788) b!1075114))

(assert (= (or b!1075114 b!1075111) bm!45471))

(assert (=> b!1075113 m!993435))

(assert (=> b!1075113 m!993435))

(assert (=> b!1075113 m!993485))

(declare-fun m!993493 () Bool)

(assert (=> bm!45471 m!993493))

(assert (=> b!1075112 m!993435))

(declare-fun m!993495 () Bool)

(assert (=> b!1075112 m!993495))

(declare-fun m!993497 () Bool)

(assert (=> b!1075112 m!993497))

(assert (=> b!1075112 m!993435))

(declare-fun m!993499 () Bool)

(assert (=> b!1075112 m!993499))

(assert (=> b!1074958 d!129423))

(declare-fun d!129425 () Bool)

(assert (=> d!129425 (= (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477066 () Unit!35243)

(declare-fun choose!1760 (array!68922 array!68924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 V!39817 V!39817 (_ BitVec 32) Int) Unit!35243)

(assert (=> d!129425 (= lt!477066 (choose!1760 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129425 (validMask!0 mask!1515)))

(assert (=> d!129425 (= (lemmaNoChangeToArrayThenSameMapNoExtras!900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477066)))

(declare-fun bs!31650 () Bool)

(assert (= bs!31650 d!129425))

(assert (=> bs!31650 m!993379))

(assert (=> bs!31650 m!993377))

(declare-fun m!993501 () Bool)

(assert (=> bs!31650 m!993501))

(assert (=> bs!31650 m!993359))

(assert (=> b!1074962 d!129425))

(declare-fun b!1075139 () Bool)

(declare-fun lt!477081 () Unit!35243)

(declare-fun lt!477084 () Unit!35243)

(assert (=> b!1075139 (= lt!477081 lt!477084)))

(declare-fun lt!477086 () ListLongMap!14667)

(declare-fun lt!477085 () (_ BitVec 64))

(declare-fun lt!477087 () (_ BitVec 64))

(declare-fun lt!477083 () V!39817)

(assert (=> b!1075139 (not (contains!6313 (+!3250 lt!477086 (tuple2!16699 lt!477087 lt!477083)) lt!477085))))

(declare-fun addStillNotContains!267 (ListLongMap!14667 (_ BitVec 64) V!39817 (_ BitVec 64)) Unit!35243)

(assert (=> b!1075139 (= lt!477084 (addStillNotContains!267 lt!477086 lt!477087 lt!477083 lt!477085))))

(assert (=> b!1075139 (= lt!477085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075139 (= lt!477083 (get!17229 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075139 (= lt!477087 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45477 () ListLongMap!14667)

(assert (=> b!1075139 (= lt!477086 call!45477)))

(declare-fun e!614437 () ListLongMap!14667)

(assert (=> b!1075139 (= e!614437 (+!3250 call!45477 (tuple2!16699 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000) (get!17229 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075140 () Bool)

(assert (=> b!1075140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> b!1075140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33688 _values!955)))))

(declare-fun lt!477082 () ListLongMap!14667)

(declare-fun e!614434 () Bool)

(assert (=> b!1075140 (= e!614434 (= (apply!931 lt!477082 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)) (get!17229 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075142 () Bool)

(declare-fun e!614435 () Bool)

(declare-fun e!614436 () Bool)

(assert (=> b!1075142 (= e!614435 e!614436)))

(declare-fun c!107995 () Bool)

(declare-fun e!614433 () Bool)

(assert (=> b!1075142 (= c!107995 e!614433)))

(declare-fun res!716799 () Bool)

(assert (=> b!1075142 (=> (not res!716799) (not e!614433))))

(assert (=> b!1075142 (= res!716799 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1075143 () Bool)

(assert (=> b!1075143 (= e!614436 e!614434)))

(assert (=> b!1075143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun res!716797 () Bool)

(assert (=> b!1075143 (= res!716797 (contains!6313 lt!477082 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075143 (=> (not res!716797) (not e!614434))))

(declare-fun e!614439 () Bool)

(declare-fun b!1075144 () Bool)

(assert (=> b!1075144 (= e!614439 (= lt!477082 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075145 () Bool)

(declare-fun isEmpty!961 (ListLongMap!14667) Bool)

(assert (=> b!1075145 (= e!614439 (isEmpty!961 lt!477082))))

(declare-fun b!1075146 () Bool)

(declare-fun e!614438 () ListLongMap!14667)

(assert (=> b!1075146 (= e!614438 (ListLongMap!14668 Nil!23217))))

(declare-fun b!1075147 () Bool)

(assert (=> b!1075147 (= e!614433 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075147 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075148 () Bool)

(assert (=> b!1075148 (= e!614436 e!614439)))

(declare-fun c!107994 () Bool)

(assert (=> b!1075148 (= c!107994 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1075149 () Bool)

(declare-fun res!716798 () Bool)

(assert (=> b!1075149 (=> (not res!716798) (not e!614435))))

(assert (=> b!1075149 (= res!716798 (not (contains!6313 lt!477082 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075141 () Bool)

(assert (=> b!1075141 (= e!614437 call!45477)))

(declare-fun d!129427 () Bool)

(assert (=> d!129427 e!614435))

(declare-fun res!716800 () Bool)

(assert (=> d!129427 (=> (not res!716800) (not e!614435))))

(assert (=> d!129427 (= res!716800 (not (contains!6313 lt!477082 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129427 (= lt!477082 e!614438)))

(declare-fun c!107996 () Bool)

(assert (=> d!129427 (= c!107996 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129427 (validMask!0 mask!1515)))

(assert (=> d!129427 (= (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477082)))

(declare-fun b!1075150 () Bool)

(assert (=> b!1075150 (= e!614438 e!614437)))

(declare-fun c!107993 () Bool)

(assert (=> b!1075150 (= c!107993 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45474 () Bool)

(assert (=> bm!45474 (= call!45477 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129427 c!107996) b!1075146))

(assert (= (and d!129427 (not c!107996)) b!1075150))

(assert (= (and b!1075150 c!107993) b!1075139))

(assert (= (and b!1075150 (not c!107993)) b!1075141))

(assert (= (or b!1075139 b!1075141) bm!45474))

(assert (= (and d!129427 res!716800) b!1075149))

(assert (= (and b!1075149 res!716798) b!1075142))

(assert (= (and b!1075142 res!716799) b!1075147))

(assert (= (and b!1075142 c!107995) b!1075143))

(assert (= (and b!1075142 (not c!107995)) b!1075148))

(assert (= (and b!1075143 res!716797) b!1075140))

(assert (= (and b!1075148 c!107994) b!1075144))

(assert (= (and b!1075148 (not c!107994)) b!1075145))

(declare-fun b_lambda!16837 () Bool)

(assert (=> (not b_lambda!16837) (not b!1075139)))

(assert (=> b!1075139 t!32564))

(declare-fun b_and!35103 () Bool)

(assert (= b_and!35101 (and (=> t!32564 result!14813) b_and!35103)))

(declare-fun b_lambda!16839 () Bool)

(assert (=> (not b_lambda!16839) (not b!1075140)))

(assert (=> b!1075140 t!32564))

(declare-fun b_and!35105 () Bool)

(assert (= b_and!35103 (and (=> t!32564 result!14813) b_and!35105)))

(declare-fun m!993503 () Bool)

(assert (=> b!1075144 m!993503))

(assert (=> b!1075139 m!993435))

(assert (=> b!1075139 m!993479))

(declare-fun m!993505 () Bool)

(assert (=> b!1075139 m!993505))

(declare-fun m!993507 () Bool)

(assert (=> b!1075139 m!993507))

(declare-fun m!993509 () Bool)

(assert (=> b!1075139 m!993509))

(declare-fun m!993511 () Bool)

(assert (=> b!1075139 m!993511))

(assert (=> b!1075139 m!993505))

(assert (=> b!1075139 m!993479))

(assert (=> b!1075139 m!993481))

(assert (=> b!1075139 m!993483))

(assert (=> b!1075139 m!993481))

(assert (=> b!1075140 m!993435))

(declare-fun m!993513 () Bool)

(assert (=> b!1075140 m!993513))

(assert (=> b!1075140 m!993435))

(assert (=> b!1075140 m!993479))

(assert (=> b!1075140 m!993479))

(assert (=> b!1075140 m!993481))

(assert (=> b!1075140 m!993483))

(assert (=> b!1075140 m!993481))

(declare-fun m!993515 () Bool)

(assert (=> b!1075149 m!993515))

(assert (=> b!1075150 m!993435))

(assert (=> b!1075150 m!993435))

(assert (=> b!1075150 m!993485))

(declare-fun m!993517 () Bool)

(assert (=> b!1075145 m!993517))

(assert (=> b!1075143 m!993435))

(assert (=> b!1075143 m!993435))

(declare-fun m!993519 () Bool)

(assert (=> b!1075143 m!993519))

(assert (=> bm!45474 m!993503))

(assert (=> b!1075147 m!993435))

(assert (=> b!1075147 m!993435))

(assert (=> b!1075147 m!993485))

(declare-fun m!993521 () Bool)

(assert (=> d!129427 m!993521))

(assert (=> d!129427 m!993359))

(assert (=> b!1074962 d!129427))

(declare-fun b!1075151 () Bool)

(declare-fun lt!477088 () Unit!35243)

(declare-fun lt!477091 () Unit!35243)

(assert (=> b!1075151 (= lt!477088 lt!477091)))

(declare-fun lt!477090 () V!39817)

(declare-fun lt!477094 () (_ BitVec 64))

(declare-fun lt!477093 () ListLongMap!14667)

(declare-fun lt!477092 () (_ BitVec 64))

(assert (=> b!1075151 (not (contains!6313 (+!3250 lt!477093 (tuple2!16699 lt!477094 lt!477090)) lt!477092))))

(assert (=> b!1075151 (= lt!477091 (addStillNotContains!267 lt!477093 lt!477094 lt!477090 lt!477092))))

(assert (=> b!1075151 (= lt!477092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075151 (= lt!477090 (get!17229 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075151 (= lt!477094 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45478 () ListLongMap!14667)

(assert (=> b!1075151 (= lt!477093 call!45478)))

(declare-fun e!614444 () ListLongMap!14667)

(assert (=> b!1075151 (= e!614444 (+!3250 call!45478 (tuple2!16699 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000) (get!17229 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075152 () Bool)

(assert (=> b!1075152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> b!1075152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33688 _values!955)))))

(declare-fun e!614441 () Bool)

(declare-fun lt!477089 () ListLongMap!14667)

(assert (=> b!1075152 (= e!614441 (= (apply!931 lt!477089 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)) (get!17229 (select (arr!33150 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075154 () Bool)

(declare-fun e!614442 () Bool)

(declare-fun e!614443 () Bool)

(assert (=> b!1075154 (= e!614442 e!614443)))

(declare-fun c!107999 () Bool)

(declare-fun e!614440 () Bool)

(assert (=> b!1075154 (= c!107999 e!614440)))

(declare-fun res!716803 () Bool)

(assert (=> b!1075154 (=> (not res!716803) (not e!614440))))

(assert (=> b!1075154 (= res!716803 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1075155 () Bool)

(assert (=> b!1075155 (= e!614443 e!614441)))

(assert (=> b!1075155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun res!716801 () Bool)

(assert (=> b!1075155 (= res!716801 (contains!6313 lt!477089 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075155 (=> (not res!716801) (not e!614441))))

(declare-fun e!614446 () Bool)

(declare-fun b!1075156 () Bool)

(assert (=> b!1075156 (= e!614446 (= lt!477089 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075157 () Bool)

(assert (=> b!1075157 (= e!614446 (isEmpty!961 lt!477089))))

(declare-fun b!1075158 () Bool)

(declare-fun e!614445 () ListLongMap!14667)

(assert (=> b!1075158 (= e!614445 (ListLongMap!14668 Nil!23217))))

(declare-fun b!1075159 () Bool)

(assert (=> b!1075159 (= e!614440 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075159 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075160 () Bool)

(assert (=> b!1075160 (= e!614443 e!614446)))

(declare-fun c!107998 () Bool)

(assert (=> b!1075160 (= c!107998 (bvslt #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(declare-fun b!1075161 () Bool)

(declare-fun res!716802 () Bool)

(assert (=> b!1075161 (=> (not res!716802) (not e!614442))))

(assert (=> b!1075161 (= res!716802 (not (contains!6313 lt!477089 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075153 () Bool)

(assert (=> b!1075153 (= e!614444 call!45478)))

(declare-fun d!129429 () Bool)

(assert (=> d!129429 e!614442))

(declare-fun res!716804 () Bool)

(assert (=> d!129429 (=> (not res!716804) (not e!614442))))

(assert (=> d!129429 (= res!716804 (not (contains!6313 lt!477089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129429 (= lt!477089 e!614445)))

(declare-fun c!108000 () Bool)

(assert (=> d!129429 (= c!108000 (bvsge #b00000000000000000000000000000000 (size!33687 _keys!1163)))))

(assert (=> d!129429 (validMask!0 mask!1515)))

(assert (=> d!129429 (= (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477089)))

(declare-fun b!1075162 () Bool)

(assert (=> b!1075162 (= e!614445 e!614444)))

(declare-fun c!107997 () Bool)

(assert (=> b!1075162 (= c!107997 (validKeyInArray!0 (select (arr!33149 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45475 () Bool)

(assert (=> bm!45475 (= call!45478 (getCurrentListMapNoExtraKeys!3928 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129429 c!108000) b!1075158))

(assert (= (and d!129429 (not c!108000)) b!1075162))

(assert (= (and b!1075162 c!107997) b!1075151))

(assert (= (and b!1075162 (not c!107997)) b!1075153))

(assert (= (or b!1075151 b!1075153) bm!45475))

(assert (= (and d!129429 res!716804) b!1075161))

(assert (= (and b!1075161 res!716802) b!1075154))

(assert (= (and b!1075154 res!716803) b!1075159))

(assert (= (and b!1075154 c!107999) b!1075155))

(assert (= (and b!1075154 (not c!107999)) b!1075160))

(assert (= (and b!1075155 res!716801) b!1075152))

(assert (= (and b!1075160 c!107998) b!1075156))

(assert (= (and b!1075160 (not c!107998)) b!1075157))

(declare-fun b_lambda!16841 () Bool)

(assert (=> (not b_lambda!16841) (not b!1075151)))

(assert (=> b!1075151 t!32564))

(declare-fun b_and!35107 () Bool)

(assert (= b_and!35105 (and (=> t!32564 result!14813) b_and!35107)))

(declare-fun b_lambda!16843 () Bool)

(assert (=> (not b_lambda!16843) (not b!1075152)))

(assert (=> b!1075152 t!32564))

(declare-fun b_and!35109 () Bool)

(assert (= b_and!35107 (and (=> t!32564 result!14813) b_and!35109)))

(declare-fun m!993523 () Bool)

(assert (=> b!1075156 m!993523))

(assert (=> b!1075151 m!993435))

(assert (=> b!1075151 m!993479))

(declare-fun m!993525 () Bool)

(assert (=> b!1075151 m!993525))

(declare-fun m!993527 () Bool)

(assert (=> b!1075151 m!993527))

(declare-fun m!993529 () Bool)

(assert (=> b!1075151 m!993529))

(declare-fun m!993531 () Bool)

(assert (=> b!1075151 m!993531))

(assert (=> b!1075151 m!993525))

(assert (=> b!1075151 m!993479))

(assert (=> b!1075151 m!993481))

(assert (=> b!1075151 m!993483))

(assert (=> b!1075151 m!993481))

(assert (=> b!1075152 m!993435))

(declare-fun m!993533 () Bool)

(assert (=> b!1075152 m!993533))

(assert (=> b!1075152 m!993435))

(assert (=> b!1075152 m!993479))

(assert (=> b!1075152 m!993479))

(assert (=> b!1075152 m!993481))

(assert (=> b!1075152 m!993483))

(assert (=> b!1075152 m!993481))

(declare-fun m!993535 () Bool)

(assert (=> b!1075161 m!993535))

(assert (=> b!1075162 m!993435))

(assert (=> b!1075162 m!993435))

(assert (=> b!1075162 m!993485))

(declare-fun m!993537 () Bool)

(assert (=> b!1075157 m!993537))

(assert (=> b!1075155 m!993435))

(assert (=> b!1075155 m!993435))

(declare-fun m!993539 () Bool)

(assert (=> b!1075155 m!993539))

(assert (=> bm!45475 m!993523))

(assert (=> b!1075159 m!993435))

(assert (=> b!1075159 m!993435))

(assert (=> b!1075159 m!993485))

(declare-fun m!993541 () Bool)

(assert (=> d!129429 m!993541))

(assert (=> d!129429 m!993359))

(assert (=> b!1074962 d!129429))

(declare-fun condMapEmpty!40756 () Bool)

(declare-fun mapDefault!40756 () ValueCell!12302)

(assert (=> mapNonEmpty!40747 (= condMapEmpty!40756 (= mapRest!40747 ((as const (Array (_ BitVec 32) ValueCell!12302)) mapDefault!40756)))))

(declare-fun e!614452 () Bool)

(declare-fun mapRes!40756 () Bool)

(assert (=> mapNonEmpty!40747 (= tp!78086 (and e!614452 mapRes!40756))))

(declare-fun b!1075169 () Bool)

(declare-fun e!614451 () Bool)

(assert (=> b!1075169 (= e!614451 tp_is_empty!26011)))

(declare-fun mapIsEmpty!40756 () Bool)

(assert (=> mapIsEmpty!40756 mapRes!40756))

(declare-fun mapNonEmpty!40756 () Bool)

(declare-fun tp!78101 () Bool)

(assert (=> mapNonEmpty!40756 (= mapRes!40756 (and tp!78101 e!614451))))

(declare-fun mapKey!40756 () (_ BitVec 32))

(declare-fun mapRest!40756 () (Array (_ BitVec 32) ValueCell!12302))

(declare-fun mapValue!40756 () ValueCell!12302)

(assert (=> mapNonEmpty!40756 (= mapRest!40747 (store mapRest!40756 mapKey!40756 mapValue!40756))))

(declare-fun b!1075170 () Bool)

(assert (=> b!1075170 (= e!614452 tp_is_empty!26011)))

(assert (= (and mapNonEmpty!40747 condMapEmpty!40756) mapIsEmpty!40756))

(assert (= (and mapNonEmpty!40747 (not condMapEmpty!40756)) mapNonEmpty!40756))

(assert (= (and mapNonEmpty!40756 ((_ is ValueCellFull!12302) mapValue!40756)) b!1075169))

(assert (= (and mapNonEmpty!40747 ((_ is ValueCellFull!12302) mapDefault!40756)) b!1075170))

(declare-fun m!993543 () Bool)

(assert (=> mapNonEmpty!40756 m!993543))

(declare-fun b_lambda!16845 () Bool)

(assert (= b_lambda!16841 (or (and start!95098 b_free!22201) b_lambda!16845)))

(declare-fun b_lambda!16847 () Bool)

(assert (= b_lambda!16843 (or (and start!95098 b_free!22201) b_lambda!16847)))

(declare-fun b_lambda!16849 () Bool)

(assert (= b_lambda!16839 (or (and start!95098 b_free!22201) b_lambda!16849)))

(declare-fun b_lambda!16851 () Bool)

(assert (= b_lambda!16835 (or (and start!95098 b_free!22201) b_lambda!16851)))

(declare-fun b_lambda!16853 () Bool)

(assert (= b_lambda!16837 (or (and start!95098 b_free!22201) b_lambda!16853)))

(check-sat (not b!1075098) b_and!35109 (not bm!45464) (not b!1075145) (not bm!45468) (not b!1075085) (not b!1075149) (not bm!45465) (not b!1075150) (not b_lambda!16845) (not b!1075070) (not b!1075152) (not b!1075102) (not b!1075066) (not b!1075151) (not bm!45463) (not mapNonEmpty!40756) (not b!1075077) (not b!1075082) (not b!1075022) (not b!1075113) (not b_lambda!16847) (not b!1075155) (not b_next!22201) (not b!1075157) (not b!1075139) (not b!1075020) (not b!1075079) (not b!1075156) (not b!1075159) (not b_lambda!16849) (not bm!45475) (not b_lambda!16853) tp_is_empty!26011 (not b!1075162) (not b!1075140) (not b!1075072) (not b!1075161) (not d!129425) (not b!1075143) (not b!1075069) (not b_lambda!16851) (not d!129429) (not b!1075112) (not d!129419) (not d!129427) (not b!1075144) (not b!1075147) (not bm!45462) (not d!129417) (not bm!45471) (not bm!45474) (not b!1075100))
(check-sat b_and!35109 (not b_next!22201))
