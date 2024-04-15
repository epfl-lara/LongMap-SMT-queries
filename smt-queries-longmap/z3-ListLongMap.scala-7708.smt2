; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96824 () Bool)

(assert start!96824)

(declare-fun b_free!23173 () Bool)

(declare-fun b_next!23173 () Bool)

(assert (=> start!96824 (= b_free!23173 (not b_next!23173))))

(declare-fun tp!81473 () Bool)

(declare-fun b_and!37109 () Bool)

(assert (=> start!96824 (= tp!81473 b_and!37109)))

(declare-fun b!1101315 () Bool)

(declare-fun e!628607 () Bool)

(declare-fun tp_is_empty!27223 () Bool)

(assert (=> b!1101315 (= e!628607 tp_is_empty!27223)))

(declare-fun res!734895 () Bool)

(declare-fun e!628606 () Bool)

(assert (=> start!96824 (=> (not res!734895) (not e!628606))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96824 (= res!734895 (validMask!0 mask!1414))))

(assert (=> start!96824 e!628606))

(assert (=> start!96824 tp!81473))

(assert (=> start!96824 true))

(assert (=> start!96824 tp_is_empty!27223))

(declare-datatypes ((array!71272 0))(
  ( (array!71273 (arr!34299 (Array (_ BitVec 32) (_ BitVec 64))) (size!34837 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71272)

(declare-fun array_inv!26450 (array!71272) Bool)

(assert (=> start!96824 (array_inv!26450 _keys!1070)))

(declare-datatypes ((V!41425 0))(
  ( (V!41426 (val!13668 Int)) )
))
(declare-datatypes ((ValueCell!12902 0))(
  ( (ValueCellFull!12902 (v!16297 V!41425)) (EmptyCell!12902) )
))
(declare-datatypes ((array!71274 0))(
  ( (array!71275 (arr!34300 (Array (_ BitVec 32) ValueCell!12902)) (size!34838 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71274)

(declare-fun e!628601 () Bool)

(declare-fun array_inv!26451 (array!71274) Bool)

(assert (=> start!96824 (and (array_inv!26451 _values!874) e!628601)))

(declare-fun b!1101316 () Bool)

(declare-fun res!734893 () Bool)

(declare-fun e!628602 () Bool)

(assert (=> b!1101316 (=> (not res!734893) (not e!628602))))

(declare-datatypes ((tuple2!17444 0))(
  ( (tuple2!17445 (_1!8733 (_ BitVec 64)) (_2!8733 V!41425)) )
))
(declare-fun lt!493640 () tuple2!17444)

(declare-datatypes ((List!24032 0))(
  ( (Nil!24029) (Cons!24028 (h!25237 tuple2!17444) (t!34242 List!24032)) )
))
(declare-datatypes ((ListLongMap!15413 0))(
  ( (ListLongMap!15414 (toList!7722 List!24032)) )
))
(declare-fun lt!493647 () ListLongMap!15413)

(declare-fun lt!493642 () ListLongMap!15413)

(declare-fun +!3432 (ListLongMap!15413 tuple2!17444) ListLongMap!15413)

(assert (=> b!1101316 (= res!734893 (= lt!493642 (+!3432 lt!493647 lt!493640)))))

(declare-fun b!1101317 () Bool)

(declare-fun res!734891 () Bool)

(assert (=> b!1101317 (=> (not res!734891) (not e!628606))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101317 (= res!734891 (and (= (size!34838 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34837 _keys!1070) (size!34838 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101318 () Bool)

(declare-fun res!734898 () Bool)

(assert (=> b!1101318 (=> (not res!734898) (not e!628606))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101318 (= res!734898 (validKeyInArray!0 k0!904))))

(declare-fun b!1101319 () Bool)

(declare-fun mapRes!42622 () Bool)

(assert (=> b!1101319 (= e!628601 (and e!628607 mapRes!42622))))

(declare-fun condMapEmpty!42622 () Bool)

(declare-fun mapDefault!42622 () ValueCell!12902)

(assert (=> b!1101319 (= condMapEmpty!42622 (= (arr!34300 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12902)) mapDefault!42622)))))

(declare-fun b!1101320 () Bool)

(declare-fun res!734901 () Bool)

(declare-fun e!628600 () Bool)

(assert (=> b!1101320 (=> (not res!734901) (not e!628600))))

(declare-fun lt!493639 () array!71272)

(declare-datatypes ((List!24033 0))(
  ( (Nil!24030) (Cons!24029 (h!25238 (_ BitVec 64)) (t!34243 List!24033)) )
))
(declare-fun arrayNoDuplicates!0 (array!71272 (_ BitVec 32) List!24033) Bool)

(assert (=> b!1101320 (= res!734901 (arrayNoDuplicates!0 lt!493639 #b00000000000000000000000000000000 Nil!24030))))

(declare-fun b!1101321 () Bool)

(declare-fun res!734899 () Bool)

(assert (=> b!1101321 (=> (not res!734899) (not e!628606))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101321 (= res!734899 (= (select (arr!34299 _keys!1070) i!650) k0!904))))

(declare-fun b!1101322 () Bool)

(declare-fun res!734890 () Bool)

(assert (=> b!1101322 (=> (not res!734890) (not e!628606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71272 (_ BitVec 32)) Bool)

(assert (=> b!1101322 (= res!734890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101323 () Bool)

(declare-fun lt!493646 () ListLongMap!15413)

(declare-fun lt!493643 () ListLongMap!15413)

(assert (=> b!1101323 (= e!628602 (= lt!493646 (+!3432 lt!493643 lt!493640)))))

(declare-fun mapIsEmpty!42622 () Bool)

(assert (=> mapIsEmpty!42622 mapRes!42622))

(declare-fun b!1101324 () Bool)

(declare-fun e!628604 () Bool)

(assert (=> b!1101324 (= e!628604 tp_is_empty!27223)))

(declare-fun b!1101325 () Bool)

(assert (=> b!1101325 (= e!628606 e!628600)))

(declare-fun res!734894 () Bool)

(assert (=> b!1101325 (=> (not res!734894) (not e!628600))))

(assert (=> b!1101325 (= res!734894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493639 mask!1414))))

(assert (=> b!1101325 (= lt!493639 (array!71273 (store (arr!34299 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34837 _keys!1070)))))

(declare-fun mapNonEmpty!42622 () Bool)

(declare-fun tp!81472 () Bool)

(assert (=> mapNonEmpty!42622 (= mapRes!42622 (and tp!81472 e!628604))))

(declare-fun mapRest!42622 () (Array (_ BitVec 32) ValueCell!12902))

(declare-fun mapKey!42622 () (_ BitVec 32))

(declare-fun mapValue!42622 () ValueCell!12902)

(assert (=> mapNonEmpty!42622 (= (arr!34300 _values!874) (store mapRest!42622 mapKey!42622 mapValue!42622))))

(declare-fun b!1101326 () Bool)

(declare-fun res!734892 () Bool)

(assert (=> b!1101326 (=> (not res!734892) (not e!628606))))

(assert (=> b!1101326 (= res!734892 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34837 _keys!1070))))))

(declare-fun b!1101327 () Bool)

(declare-fun e!628605 () Bool)

(assert (=> b!1101327 (= e!628600 (not e!628605))))

(declare-fun res!734900 () Bool)

(assert (=> b!1101327 (=> res!734900 e!628605)))

(assert (=> b!1101327 (= res!734900 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41425)

(declare-fun zeroValue!831 () V!41425)

(declare-fun getCurrentListMap!4336 (array!71272 array!71274 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) Int) ListLongMap!15413)

(assert (=> b!1101327 (= lt!493646 (getCurrentListMap!4336 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493648 () array!71274)

(assert (=> b!1101327 (= lt!493642 (getCurrentListMap!4336 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493645 () ListLongMap!15413)

(assert (=> b!1101327 (and (= lt!493645 lt!493647) (= lt!493647 lt!493645))))

(declare-fun -!951 (ListLongMap!15413 (_ BitVec 64)) ListLongMap!15413)

(assert (=> b!1101327 (= lt!493647 (-!951 lt!493643 k0!904))))

(declare-datatypes ((Unit!36027 0))(
  ( (Unit!36028) )
))
(declare-fun lt!493641 () Unit!36027)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!225 (array!71272 array!71274 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36027)

(assert (=> b!1101327 (= lt!493641 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!225 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4243 (array!71272 array!71274 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) Int) ListLongMap!15413)

(assert (=> b!1101327 (= lt!493645 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2312 (Int (_ BitVec 64)) V!41425)

(assert (=> b!1101327 (= lt!493648 (array!71275 (store (arr!34300 _values!874) i!650 (ValueCellFull!12902 (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34838 _values!874)))))

(assert (=> b!1101327 (= lt!493643 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101327 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493644 () Unit!36027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71272 (_ BitVec 64) (_ BitVec 32)) Unit!36027)

(assert (=> b!1101327 (= lt!493644 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101328 () Bool)

(assert (=> b!1101328 (= e!628605 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(assert (=> b!1101328 e!628602))

(declare-fun res!734897 () Bool)

(assert (=> b!1101328 (=> (not res!734897) (not e!628602))))

(assert (=> b!1101328 (= res!734897 (= lt!493642 (+!3432 lt!493645 lt!493640)))))

(assert (=> b!1101328 (= lt!493640 (tuple2!17445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101329 () Bool)

(declare-fun res!734896 () Bool)

(assert (=> b!1101329 (=> (not res!734896) (not e!628606))))

(assert (=> b!1101329 (= res!734896 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24030))))

(assert (= (and start!96824 res!734895) b!1101317))

(assert (= (and b!1101317 res!734891) b!1101322))

(assert (= (and b!1101322 res!734890) b!1101329))

(assert (= (and b!1101329 res!734896) b!1101326))

(assert (= (and b!1101326 res!734892) b!1101318))

(assert (= (and b!1101318 res!734898) b!1101321))

(assert (= (and b!1101321 res!734899) b!1101325))

(assert (= (and b!1101325 res!734894) b!1101320))

(assert (= (and b!1101320 res!734901) b!1101327))

(assert (= (and b!1101327 (not res!734900)) b!1101328))

(assert (= (and b!1101328 res!734897) b!1101316))

(assert (= (and b!1101316 res!734893) b!1101323))

(assert (= (and b!1101319 condMapEmpty!42622) mapIsEmpty!42622))

(assert (= (and b!1101319 (not condMapEmpty!42622)) mapNonEmpty!42622))

(get-info :version)

(assert (= (and mapNonEmpty!42622 ((_ is ValueCellFull!12902) mapValue!42622)) b!1101324))

(assert (= (and b!1101319 ((_ is ValueCellFull!12902) mapDefault!42622)) b!1101315))

(assert (= start!96824 b!1101319))

(declare-fun b_lambda!18079 () Bool)

(assert (=> (not b_lambda!18079) (not b!1101327)))

(declare-fun t!34241 () Bool)

(declare-fun tb!8031 () Bool)

(assert (=> (and start!96824 (= defaultEntry!882 defaultEntry!882) t!34241) tb!8031))

(declare-fun result!16611 () Bool)

(assert (=> tb!8031 (= result!16611 tp_is_empty!27223)))

(assert (=> b!1101327 t!34241))

(declare-fun b_and!37111 () Bool)

(assert (= b_and!37109 (and (=> t!34241 result!16611) b_and!37111)))

(declare-fun m!1021023 () Bool)

(assert (=> start!96824 m!1021023))

(declare-fun m!1021025 () Bool)

(assert (=> start!96824 m!1021025))

(declare-fun m!1021027 () Bool)

(assert (=> start!96824 m!1021027))

(declare-fun m!1021029 () Bool)

(assert (=> b!1101328 m!1021029))

(declare-fun m!1021031 () Bool)

(assert (=> b!1101318 m!1021031))

(declare-fun m!1021033 () Bool)

(assert (=> b!1101321 m!1021033))

(declare-fun m!1021035 () Bool)

(assert (=> b!1101329 m!1021035))

(declare-fun m!1021037 () Bool)

(assert (=> b!1101325 m!1021037))

(declare-fun m!1021039 () Bool)

(assert (=> b!1101325 m!1021039))

(declare-fun m!1021041 () Bool)

(assert (=> b!1101327 m!1021041))

(declare-fun m!1021043 () Bool)

(assert (=> b!1101327 m!1021043))

(declare-fun m!1021045 () Bool)

(assert (=> b!1101327 m!1021045))

(declare-fun m!1021047 () Bool)

(assert (=> b!1101327 m!1021047))

(declare-fun m!1021049 () Bool)

(assert (=> b!1101327 m!1021049))

(declare-fun m!1021051 () Bool)

(assert (=> b!1101327 m!1021051))

(declare-fun m!1021053 () Bool)

(assert (=> b!1101327 m!1021053))

(declare-fun m!1021055 () Bool)

(assert (=> b!1101327 m!1021055))

(declare-fun m!1021057 () Bool)

(assert (=> b!1101327 m!1021057))

(declare-fun m!1021059 () Bool)

(assert (=> b!1101327 m!1021059))

(declare-fun m!1021061 () Bool)

(assert (=> b!1101320 m!1021061))

(declare-fun m!1021063 () Bool)

(assert (=> mapNonEmpty!42622 m!1021063))

(declare-fun m!1021065 () Bool)

(assert (=> b!1101316 m!1021065))

(declare-fun m!1021067 () Bool)

(assert (=> b!1101323 m!1021067))

(declare-fun m!1021069 () Bool)

(assert (=> b!1101322 m!1021069))

(check-sat (not b!1101327) (not b!1101328) tp_is_empty!27223 (not mapNonEmpty!42622) (not b_next!23173) (not b!1101320) (not b!1101325) (not b!1101329) (not b_lambda!18079) (not b!1101318) (not b!1101322) (not start!96824) b_and!37111 (not b!1101323) (not b!1101316))
(check-sat b_and!37111 (not b_next!23173))
(get-model)

(declare-fun b_lambda!18085 () Bool)

(assert (= b_lambda!18079 (or (and start!96824 b_free!23173) b_lambda!18085)))

(check-sat (not b_lambda!18085) (not b!1101327) (not b!1101328) tp_is_empty!27223 (not mapNonEmpty!42622) (not b_next!23173) (not b!1101320) (not b!1101325) (not b!1101329) (not b!1101318) (not b!1101322) (not start!96824) b_and!37111 (not b!1101323) (not b!1101316))
(check-sat b_and!37111 (not b_next!23173))
(get-model)

(declare-fun d!130521 () Bool)

(declare-fun e!628658 () Bool)

(assert (=> d!130521 e!628658))

(declare-fun res!734978 () Bool)

(assert (=> d!130521 (=> (not res!734978) (not e!628658))))

(declare-fun lt!493718 () ListLongMap!15413)

(declare-fun contains!6374 (ListLongMap!15413 (_ BitVec 64)) Bool)

(assert (=> d!130521 (= res!734978 (contains!6374 lt!493718 (_1!8733 lt!493640)))))

(declare-fun lt!493719 () List!24032)

(assert (=> d!130521 (= lt!493718 (ListLongMap!15414 lt!493719))))

(declare-fun lt!493717 () Unit!36027)

(declare-fun lt!493720 () Unit!36027)

(assert (=> d!130521 (= lt!493717 lt!493720)))

(declare-datatypes ((Option!680 0))(
  ( (Some!679 (v!16300 V!41425)) (None!678) )
))
(declare-fun getValueByKey!629 (List!24032 (_ BitVec 64)) Option!680)

(assert (=> d!130521 (= (getValueByKey!629 lt!493719 (_1!8733 lt!493640)) (Some!679 (_2!8733 lt!493640)))))

(declare-fun lemmaContainsTupThenGetReturnValue!305 (List!24032 (_ BitVec 64) V!41425) Unit!36027)

(assert (=> d!130521 (= lt!493720 (lemmaContainsTupThenGetReturnValue!305 lt!493719 (_1!8733 lt!493640) (_2!8733 lt!493640)))))

(declare-fun insertStrictlySorted!398 (List!24032 (_ BitVec 64) V!41425) List!24032)

(assert (=> d!130521 (= lt!493719 (insertStrictlySorted!398 (toList!7722 lt!493647) (_1!8733 lt!493640) (_2!8733 lt!493640)))))

(assert (=> d!130521 (= (+!3432 lt!493647 lt!493640) lt!493718)))

(declare-fun b!1101430 () Bool)

(declare-fun res!734979 () Bool)

(assert (=> b!1101430 (=> (not res!734979) (not e!628658))))

(assert (=> b!1101430 (= res!734979 (= (getValueByKey!629 (toList!7722 lt!493718) (_1!8733 lt!493640)) (Some!679 (_2!8733 lt!493640))))))

(declare-fun b!1101431 () Bool)

(declare-fun contains!6375 (List!24032 tuple2!17444) Bool)

(assert (=> b!1101431 (= e!628658 (contains!6375 (toList!7722 lt!493718) lt!493640))))

(assert (= (and d!130521 res!734978) b!1101430))

(assert (= (and b!1101430 res!734979) b!1101431))

(declare-fun m!1021167 () Bool)

(assert (=> d!130521 m!1021167))

(declare-fun m!1021169 () Bool)

(assert (=> d!130521 m!1021169))

(declare-fun m!1021171 () Bool)

(assert (=> d!130521 m!1021171))

(declare-fun m!1021173 () Bool)

(assert (=> d!130521 m!1021173))

(declare-fun m!1021175 () Bool)

(assert (=> b!1101430 m!1021175))

(declare-fun m!1021177 () Bool)

(assert (=> b!1101431 m!1021177))

(assert (=> b!1101316 d!130521))

(declare-fun b!1101440 () Bool)

(declare-fun e!628666 () Bool)

(declare-fun e!628667 () Bool)

(assert (=> b!1101440 (= e!628666 e!628667)))

(declare-fun c!108781 () Bool)

(assert (=> b!1101440 (= c!108781 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101441 () Bool)

(declare-fun e!628665 () Bool)

(assert (=> b!1101441 (= e!628667 e!628665)))

(declare-fun lt!493727 () (_ BitVec 64))

(assert (=> b!1101441 (= lt!493727 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493728 () Unit!36027)

(assert (=> b!1101441 (= lt!493728 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493727 #b00000000000000000000000000000000))))

(assert (=> b!1101441 (arrayContainsKey!0 _keys!1070 lt!493727 #b00000000000000000000000000000000)))

(declare-fun lt!493729 () Unit!36027)

(assert (=> b!1101441 (= lt!493729 lt!493728)))

(declare-fun res!734984 () Bool)

(declare-datatypes ((SeekEntryResult!9914 0))(
  ( (MissingZero!9914 (index!42027 (_ BitVec 32))) (Found!9914 (index!42028 (_ BitVec 32))) (Intermediate!9914 (undefined!10726 Bool) (index!42029 (_ BitVec 32)) (x!99066 (_ BitVec 32))) (Undefined!9914) (MissingVacant!9914 (index!42030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71272 (_ BitVec 32)) SeekEntryResult!9914)

(assert (=> b!1101441 (= res!734984 (= (seekEntryOrOpen!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9914 #b00000000000000000000000000000000)))))

(assert (=> b!1101441 (=> (not res!734984) (not e!628665))))

(declare-fun b!1101442 () Bool)

(declare-fun call!46158 () Bool)

(assert (=> b!1101442 (= e!628667 call!46158)))

(declare-fun d!130523 () Bool)

(declare-fun res!734985 () Bool)

(assert (=> d!130523 (=> res!734985 e!628666)))

(assert (=> d!130523 (= res!734985 (bvsge #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(assert (=> d!130523 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628666)))

(declare-fun b!1101443 () Bool)

(assert (=> b!1101443 (= e!628665 call!46158)))

(declare-fun bm!46155 () Bool)

(assert (=> bm!46155 (= call!46158 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!130523 (not res!734985)) b!1101440))

(assert (= (and b!1101440 c!108781) b!1101441))

(assert (= (and b!1101440 (not c!108781)) b!1101442))

(assert (= (and b!1101441 res!734984) b!1101443))

(assert (= (or b!1101443 b!1101442) bm!46155))

(declare-fun m!1021179 () Bool)

(assert (=> b!1101440 m!1021179))

(assert (=> b!1101440 m!1021179))

(declare-fun m!1021181 () Bool)

(assert (=> b!1101440 m!1021181))

(assert (=> b!1101441 m!1021179))

(declare-fun m!1021183 () Bool)

(assert (=> b!1101441 m!1021183))

(declare-fun m!1021185 () Bool)

(assert (=> b!1101441 m!1021185))

(assert (=> b!1101441 m!1021179))

(declare-fun m!1021187 () Bool)

(assert (=> b!1101441 m!1021187))

(declare-fun m!1021189 () Bool)

(assert (=> bm!46155 m!1021189))

(assert (=> b!1101322 d!130523))

(declare-fun d!130525 () Bool)

(assert (=> d!130525 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101318 d!130525))

(declare-fun d!130527 () Bool)

(declare-fun e!628668 () Bool)

(assert (=> d!130527 e!628668))

(declare-fun res!734986 () Bool)

(assert (=> d!130527 (=> (not res!734986) (not e!628668))))

(declare-fun lt!493731 () ListLongMap!15413)

(assert (=> d!130527 (= res!734986 (contains!6374 lt!493731 (_1!8733 lt!493640)))))

(declare-fun lt!493732 () List!24032)

(assert (=> d!130527 (= lt!493731 (ListLongMap!15414 lt!493732))))

(declare-fun lt!493730 () Unit!36027)

(declare-fun lt!493733 () Unit!36027)

(assert (=> d!130527 (= lt!493730 lt!493733)))

(assert (=> d!130527 (= (getValueByKey!629 lt!493732 (_1!8733 lt!493640)) (Some!679 (_2!8733 lt!493640)))))

(assert (=> d!130527 (= lt!493733 (lemmaContainsTupThenGetReturnValue!305 lt!493732 (_1!8733 lt!493640) (_2!8733 lt!493640)))))

(assert (=> d!130527 (= lt!493732 (insertStrictlySorted!398 (toList!7722 lt!493643) (_1!8733 lt!493640) (_2!8733 lt!493640)))))

(assert (=> d!130527 (= (+!3432 lt!493643 lt!493640) lt!493731)))

(declare-fun b!1101444 () Bool)

(declare-fun res!734987 () Bool)

(assert (=> b!1101444 (=> (not res!734987) (not e!628668))))

(assert (=> b!1101444 (= res!734987 (= (getValueByKey!629 (toList!7722 lt!493731) (_1!8733 lt!493640)) (Some!679 (_2!8733 lt!493640))))))

(declare-fun b!1101445 () Bool)

(assert (=> b!1101445 (= e!628668 (contains!6375 (toList!7722 lt!493731) lt!493640))))

(assert (= (and d!130527 res!734986) b!1101444))

(assert (= (and b!1101444 res!734987) b!1101445))

(declare-fun m!1021191 () Bool)

(assert (=> d!130527 m!1021191))

(declare-fun m!1021193 () Bool)

(assert (=> d!130527 m!1021193))

(declare-fun m!1021195 () Bool)

(assert (=> d!130527 m!1021195))

(declare-fun m!1021197 () Bool)

(assert (=> d!130527 m!1021197))

(declare-fun m!1021199 () Bool)

(assert (=> b!1101444 m!1021199))

(declare-fun m!1021201 () Bool)

(assert (=> b!1101445 m!1021201))

(assert (=> b!1101323 d!130527))

(declare-fun d!130529 () Bool)

(assert (=> d!130529 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96824 d!130529))

(declare-fun d!130531 () Bool)

(assert (=> d!130531 (= (array_inv!26450 _keys!1070) (bvsge (size!34837 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96824 d!130531))

(declare-fun d!130533 () Bool)

(assert (=> d!130533 (= (array_inv!26451 _values!874) (bvsge (size!34838 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96824 d!130533))

(declare-fun d!130535 () Bool)

(declare-fun res!734992 () Bool)

(declare-fun e!628673 () Bool)

(assert (=> d!130535 (=> res!734992 e!628673)))

(assert (=> d!130535 (= res!734992 (= (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130535 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628673)))

(declare-fun b!1101450 () Bool)

(declare-fun e!628674 () Bool)

(assert (=> b!1101450 (= e!628673 e!628674)))

(declare-fun res!734993 () Bool)

(assert (=> b!1101450 (=> (not res!734993) (not e!628674))))

(assert (=> b!1101450 (= res!734993 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34837 _keys!1070)))))

(declare-fun b!1101451 () Bool)

(assert (=> b!1101451 (= e!628674 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130535 (not res!734992)) b!1101450))

(assert (= (and b!1101450 res!734993) b!1101451))

(assert (=> d!130535 m!1021179))

(declare-fun m!1021203 () Bool)

(assert (=> b!1101451 m!1021203))

(assert (=> b!1101327 d!130535))

(declare-fun bm!46170 () Bool)

(declare-fun call!46178 () ListLongMap!15413)

(declare-fun call!46176 () ListLongMap!15413)

(assert (=> bm!46170 (= call!46178 call!46176)))

(declare-fun b!1101494 () Bool)

(declare-fun e!628710 () Bool)

(assert (=> b!1101494 (= e!628710 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101495 () Bool)

(declare-fun e!628706 () Bool)

(declare-fun call!46175 () Bool)

(assert (=> b!1101495 (= e!628706 (not call!46175))))

(declare-fun b!1101496 () Bool)

(declare-fun c!108794 () Bool)

(assert (=> b!1101496 (= c!108794 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628702 () ListLongMap!15413)

(declare-fun e!628711 () ListLongMap!15413)

(assert (=> b!1101496 (= e!628702 e!628711)))

(declare-fun d!130537 () Bool)

(declare-fun e!628712 () Bool)

(assert (=> d!130537 e!628712))

(declare-fun res!735019 () Bool)

(assert (=> d!130537 (=> (not res!735019) (not e!628712))))

(assert (=> d!130537 (= res!735019 (or (bvsge #b00000000000000000000000000000000 (size!34837 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))))

(declare-fun lt!493782 () ListLongMap!15413)

(declare-fun lt!493791 () ListLongMap!15413)

(assert (=> d!130537 (= lt!493782 lt!493791)))

(declare-fun lt!493781 () Unit!36027)

(declare-fun e!628701 () Unit!36027)

(assert (=> d!130537 (= lt!493781 e!628701)))

(declare-fun c!108797 () Bool)

(assert (=> d!130537 (= c!108797 e!628710)))

(declare-fun res!735017 () Bool)

(assert (=> d!130537 (=> (not res!735017) (not e!628710))))

(assert (=> d!130537 (= res!735017 (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(declare-fun e!628709 () ListLongMap!15413)

(assert (=> d!130537 (= lt!493791 e!628709)))

(declare-fun c!108795 () Bool)

(assert (=> d!130537 (= c!108795 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130537 (validMask!0 mask!1414)))

(assert (=> d!130537 (= (getCurrentListMap!4336 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493782)))

(declare-fun b!1101497 () Bool)

(declare-fun e!628704 () Bool)

(declare-fun call!46177 () Bool)

(assert (=> b!1101497 (= e!628704 (not call!46177))))

(declare-fun b!1101498 () Bool)

(declare-fun res!735015 () Bool)

(assert (=> b!1101498 (=> (not res!735015) (not e!628712))))

(assert (=> b!1101498 (= res!735015 e!628706)))

(declare-fun c!108798 () Bool)

(assert (=> b!1101498 (= c!108798 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101499 () Bool)

(assert (=> b!1101499 (= e!628711 call!46178)))

(declare-fun b!1101500 () Bool)

(assert (=> b!1101500 (= e!628709 (+!3432 call!46176 (tuple2!17445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101501 () Bool)

(declare-fun Unit!36031 () Unit!36027)

(assert (=> b!1101501 (= e!628701 Unit!36031)))

(declare-fun e!628708 () Bool)

(declare-fun b!1101502 () Bool)

(declare-fun apply!945 (ListLongMap!15413 (_ BitVec 64)) V!41425)

(declare-fun get!17651 (ValueCell!12902 V!41425) V!41425)

(assert (=> b!1101502 (= e!628708 (= (apply!945 lt!493782 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)) (get!17651 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101502 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34838 _values!874)))))

(assert (=> b!1101502 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(declare-fun b!1101503 () Bool)

(declare-fun e!628705 () Bool)

(assert (=> b!1101503 (= e!628705 (= (apply!945 lt!493782 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1101504 () Bool)

(declare-fun lt!493798 () Unit!36027)

(assert (=> b!1101504 (= e!628701 lt!493798)))

(declare-fun lt!493797 () ListLongMap!15413)

(assert (=> b!1101504 (= lt!493797 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493778 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493780 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493780 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493786 () Unit!36027)

(declare-fun addStillContains!658 (ListLongMap!15413 (_ BitVec 64) V!41425 (_ BitVec 64)) Unit!36027)

(assert (=> b!1101504 (= lt!493786 (addStillContains!658 lt!493797 lt!493778 zeroValue!831 lt!493780))))

(assert (=> b!1101504 (contains!6374 (+!3432 lt!493797 (tuple2!17445 lt!493778 zeroValue!831)) lt!493780)))

(declare-fun lt!493790 () Unit!36027)

(assert (=> b!1101504 (= lt!493790 lt!493786)))

(declare-fun lt!493788 () ListLongMap!15413)

(assert (=> b!1101504 (= lt!493788 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493792 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493792 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493793 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493793 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493787 () Unit!36027)

(declare-fun addApplyDifferent!514 (ListLongMap!15413 (_ BitVec 64) V!41425 (_ BitVec 64)) Unit!36027)

(assert (=> b!1101504 (= lt!493787 (addApplyDifferent!514 lt!493788 lt!493792 minValue!831 lt!493793))))

(assert (=> b!1101504 (= (apply!945 (+!3432 lt!493788 (tuple2!17445 lt!493792 minValue!831)) lt!493793) (apply!945 lt!493788 lt!493793))))

(declare-fun lt!493795 () Unit!36027)

(assert (=> b!1101504 (= lt!493795 lt!493787)))

(declare-fun lt!493785 () ListLongMap!15413)

(assert (=> b!1101504 (= lt!493785 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493783 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493799 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493799 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493789 () Unit!36027)

(assert (=> b!1101504 (= lt!493789 (addApplyDifferent!514 lt!493785 lt!493783 zeroValue!831 lt!493799))))

(assert (=> b!1101504 (= (apply!945 (+!3432 lt!493785 (tuple2!17445 lt!493783 zeroValue!831)) lt!493799) (apply!945 lt!493785 lt!493799))))

(declare-fun lt!493779 () Unit!36027)

(assert (=> b!1101504 (= lt!493779 lt!493789)))

(declare-fun lt!493796 () ListLongMap!15413)

(assert (=> b!1101504 (= lt!493796 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493794 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493794 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493784 () (_ BitVec 64))

(assert (=> b!1101504 (= lt!493784 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101504 (= lt!493798 (addApplyDifferent!514 lt!493796 lt!493794 minValue!831 lt!493784))))

(assert (=> b!1101504 (= (apply!945 (+!3432 lt!493796 (tuple2!17445 lt!493794 minValue!831)) lt!493784) (apply!945 lt!493796 lt!493784))))

(declare-fun b!1101505 () Bool)

(declare-fun e!628703 () Bool)

(assert (=> b!1101505 (= e!628704 e!628703)))

(declare-fun res!735014 () Bool)

(assert (=> b!1101505 (= res!735014 call!46177)))

(assert (=> b!1101505 (=> (not res!735014) (not e!628703))))

(declare-fun bm!46171 () Bool)

(declare-fun call!46174 () ListLongMap!15413)

(declare-fun call!46173 () ListLongMap!15413)

(assert (=> bm!46171 (= call!46174 call!46173)))

(declare-fun b!1101506 () Bool)

(assert (=> b!1101506 (= e!628702 call!46178)))

(declare-fun b!1101507 () Bool)

(assert (=> b!1101507 (= e!628711 call!46174)))

(declare-fun b!1101508 () Bool)

(assert (=> b!1101508 (= e!628706 e!628705)))

(declare-fun res!735018 () Bool)

(assert (=> b!1101508 (= res!735018 call!46175)))

(assert (=> b!1101508 (=> (not res!735018) (not e!628705))))

(declare-fun bm!46172 () Bool)

(assert (=> bm!46172 (= call!46177 (contains!6374 lt!493782 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101509 () Bool)

(assert (=> b!1101509 (= e!628703 (= (apply!945 lt!493782 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46173 () Bool)

(declare-fun call!46179 () ListLongMap!15413)

(assert (=> bm!46173 (= call!46179 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun c!108799 () Bool)

(declare-fun bm!46174 () Bool)

(assert (=> bm!46174 (= call!46176 (+!3432 (ite c!108795 call!46179 (ite c!108799 call!46173 call!46174)) (ite (or c!108795 c!108799) (tuple2!17445 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1101510 () Bool)

(assert (=> b!1101510 (= e!628709 e!628702)))

(assert (=> b!1101510 (= c!108799 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101511 () Bool)

(declare-fun res!735020 () Bool)

(assert (=> b!1101511 (=> (not res!735020) (not e!628712))))

(declare-fun e!628707 () Bool)

(assert (=> b!1101511 (= res!735020 e!628707)))

(declare-fun res!735012 () Bool)

(assert (=> b!1101511 (=> res!735012 e!628707)))

(declare-fun e!628713 () Bool)

(assert (=> b!1101511 (= res!735012 (not e!628713))))

(declare-fun res!735016 () Bool)

(assert (=> b!1101511 (=> (not res!735016) (not e!628713))))

(assert (=> b!1101511 (= res!735016 (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(declare-fun b!1101512 () Bool)

(assert (=> b!1101512 (= e!628713 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101513 () Bool)

(assert (=> b!1101513 (= e!628707 e!628708)))

(declare-fun res!735013 () Bool)

(assert (=> b!1101513 (=> (not res!735013) (not e!628708))))

(assert (=> b!1101513 (= res!735013 (contains!6374 lt!493782 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(declare-fun bm!46175 () Bool)

(assert (=> bm!46175 (= call!46173 call!46179)))

(declare-fun bm!46176 () Bool)

(assert (=> bm!46176 (= call!46175 (contains!6374 lt!493782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101514 () Bool)

(assert (=> b!1101514 (= e!628712 e!628704)))

(declare-fun c!108796 () Bool)

(assert (=> b!1101514 (= c!108796 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130537 c!108795) b!1101500))

(assert (= (and d!130537 (not c!108795)) b!1101510))

(assert (= (and b!1101510 c!108799) b!1101506))

(assert (= (and b!1101510 (not c!108799)) b!1101496))

(assert (= (and b!1101496 c!108794) b!1101499))

(assert (= (and b!1101496 (not c!108794)) b!1101507))

(assert (= (or b!1101499 b!1101507) bm!46171))

(assert (= (or b!1101506 bm!46171) bm!46175))

(assert (= (or b!1101506 b!1101499) bm!46170))

(assert (= (or b!1101500 bm!46175) bm!46173))

(assert (= (or b!1101500 bm!46170) bm!46174))

(assert (= (and d!130537 res!735017) b!1101494))

(assert (= (and d!130537 c!108797) b!1101504))

(assert (= (and d!130537 (not c!108797)) b!1101501))

(assert (= (and d!130537 res!735019) b!1101511))

(assert (= (and b!1101511 res!735016) b!1101512))

(assert (= (and b!1101511 (not res!735012)) b!1101513))

(assert (= (and b!1101513 res!735013) b!1101502))

(assert (= (and b!1101511 res!735020) b!1101498))

(assert (= (and b!1101498 c!108798) b!1101508))

(assert (= (and b!1101498 (not c!108798)) b!1101495))

(assert (= (and b!1101508 res!735018) b!1101503))

(assert (= (or b!1101508 b!1101495) bm!46176))

(assert (= (and b!1101498 res!735015) b!1101514))

(assert (= (and b!1101514 c!108796) b!1101505))

(assert (= (and b!1101514 (not c!108796)) b!1101497))

(assert (= (and b!1101505 res!735014) b!1101509))

(assert (= (or b!1101505 b!1101497) bm!46172))

(declare-fun b_lambda!18087 () Bool)

(assert (=> (not b_lambda!18087) (not b!1101502)))

(assert (=> b!1101502 t!34241))

(declare-fun b_and!37121 () Bool)

(assert (= b_and!37111 (and (=> t!34241 result!16611) b_and!37121)))

(declare-fun m!1021205 () Bool)

(assert (=> bm!46172 m!1021205))

(declare-fun m!1021207 () Bool)

(assert (=> b!1101503 m!1021207))

(declare-fun m!1021209 () Bool)

(assert (=> b!1101504 m!1021209))

(declare-fun m!1021211 () Bool)

(assert (=> b!1101504 m!1021211))

(assert (=> b!1101504 m!1021211))

(declare-fun m!1021213 () Bool)

(assert (=> b!1101504 m!1021213))

(assert (=> b!1101504 m!1021055))

(declare-fun m!1021215 () Bool)

(assert (=> b!1101504 m!1021215))

(declare-fun m!1021217 () Bool)

(assert (=> b!1101504 m!1021217))

(declare-fun m!1021219 () Bool)

(assert (=> b!1101504 m!1021219))

(declare-fun m!1021221 () Bool)

(assert (=> b!1101504 m!1021221))

(assert (=> b!1101504 m!1021209))

(declare-fun m!1021223 () Bool)

(assert (=> b!1101504 m!1021223))

(declare-fun m!1021225 () Bool)

(assert (=> b!1101504 m!1021225))

(declare-fun m!1021227 () Bool)

(assert (=> b!1101504 m!1021227))

(declare-fun m!1021229 () Bool)

(assert (=> b!1101504 m!1021229))

(declare-fun m!1021231 () Bool)

(assert (=> b!1101504 m!1021231))

(declare-fun m!1021233 () Bool)

(assert (=> b!1101504 m!1021233))

(assert (=> b!1101504 m!1021219))

(declare-fun m!1021235 () Bool)

(assert (=> b!1101504 m!1021235))

(assert (=> b!1101504 m!1021179))

(declare-fun m!1021237 () Bool)

(assert (=> b!1101504 m!1021237))

(assert (=> b!1101504 m!1021215))

(declare-fun m!1021239 () Bool)

(assert (=> b!1101502 m!1021239))

(assert (=> b!1101502 m!1021041))

(assert (=> b!1101502 m!1021179))

(assert (=> b!1101502 m!1021179))

(declare-fun m!1021241 () Bool)

(assert (=> b!1101502 m!1021241))

(assert (=> b!1101502 m!1021239))

(assert (=> b!1101502 m!1021041))

(declare-fun m!1021243 () Bool)

(assert (=> b!1101502 m!1021243))

(assert (=> b!1101512 m!1021179))

(assert (=> b!1101512 m!1021179))

(assert (=> b!1101512 m!1021181))

(declare-fun m!1021245 () Bool)

(assert (=> bm!46176 m!1021245))

(assert (=> b!1101513 m!1021179))

(assert (=> b!1101513 m!1021179))

(declare-fun m!1021247 () Bool)

(assert (=> b!1101513 m!1021247))

(declare-fun m!1021249 () Bool)

(assert (=> b!1101500 m!1021249))

(declare-fun m!1021251 () Bool)

(assert (=> bm!46174 m!1021251))

(assert (=> b!1101494 m!1021179))

(assert (=> b!1101494 m!1021179))

(assert (=> b!1101494 m!1021181))

(assert (=> d!130537 m!1021023))

(assert (=> bm!46173 m!1021055))

(declare-fun m!1021253 () Bool)

(assert (=> b!1101509 m!1021253))

(assert (=> b!1101327 d!130537))

(declare-fun d!130539 () Bool)

(declare-fun lt!493802 () ListLongMap!15413)

(assert (=> d!130539 (not (contains!6374 lt!493802 k0!904))))

(declare-fun removeStrictlySorted!86 (List!24032 (_ BitVec 64)) List!24032)

(assert (=> d!130539 (= lt!493802 (ListLongMap!15414 (removeStrictlySorted!86 (toList!7722 lt!493643) k0!904)))))

(assert (=> d!130539 (= (-!951 lt!493643 k0!904) lt!493802)))

(declare-fun bs!32299 () Bool)

(assert (= bs!32299 d!130539))

(declare-fun m!1021255 () Bool)

(assert (=> bs!32299 m!1021255))

(declare-fun m!1021257 () Bool)

(assert (=> bs!32299 m!1021257))

(assert (=> b!1101327 d!130539))

(declare-fun bm!46177 () Bool)

(declare-fun call!46185 () ListLongMap!15413)

(declare-fun call!46183 () ListLongMap!15413)

(assert (=> bm!46177 (= call!46185 call!46183)))

(declare-fun b!1101515 () Bool)

(declare-fun e!628723 () Bool)

(assert (=> b!1101515 (= e!628723 (validKeyInArray!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(declare-fun b!1101516 () Bool)

(declare-fun e!628719 () Bool)

(declare-fun call!46182 () Bool)

(assert (=> b!1101516 (= e!628719 (not call!46182))))

(declare-fun b!1101517 () Bool)

(declare-fun c!108800 () Bool)

(assert (=> b!1101517 (= c!108800 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628715 () ListLongMap!15413)

(declare-fun e!628724 () ListLongMap!15413)

(assert (=> b!1101517 (= e!628715 e!628724)))

(declare-fun d!130541 () Bool)

(declare-fun e!628725 () Bool)

(assert (=> d!130541 e!628725))

(declare-fun res!735028 () Bool)

(assert (=> d!130541 (=> (not res!735028) (not e!628725))))

(assert (=> d!130541 (= res!735028 (or (bvsge #b00000000000000000000000000000000 (size!34837 lt!493639)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))))

(declare-fun lt!493807 () ListLongMap!15413)

(declare-fun lt!493816 () ListLongMap!15413)

(assert (=> d!130541 (= lt!493807 lt!493816)))

(declare-fun lt!493806 () Unit!36027)

(declare-fun e!628714 () Unit!36027)

(assert (=> d!130541 (= lt!493806 e!628714)))

(declare-fun c!108803 () Bool)

(assert (=> d!130541 (= c!108803 e!628723)))

(declare-fun res!735026 () Bool)

(assert (=> d!130541 (=> (not res!735026) (not e!628723))))

(assert (=> d!130541 (= res!735026 (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(declare-fun e!628722 () ListLongMap!15413)

(assert (=> d!130541 (= lt!493816 e!628722)))

(declare-fun c!108801 () Bool)

(assert (=> d!130541 (= c!108801 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130541 (validMask!0 mask!1414)))

(assert (=> d!130541 (= (getCurrentListMap!4336 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493807)))

(declare-fun b!1101518 () Bool)

(declare-fun e!628717 () Bool)

(declare-fun call!46184 () Bool)

(assert (=> b!1101518 (= e!628717 (not call!46184))))

(declare-fun b!1101519 () Bool)

(declare-fun res!735024 () Bool)

(assert (=> b!1101519 (=> (not res!735024) (not e!628725))))

(assert (=> b!1101519 (= res!735024 e!628719)))

(declare-fun c!108804 () Bool)

(assert (=> b!1101519 (= c!108804 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1101520 () Bool)

(assert (=> b!1101520 (= e!628724 call!46185)))

(declare-fun b!1101521 () Bool)

(assert (=> b!1101521 (= e!628722 (+!3432 call!46183 (tuple2!17445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101522 () Bool)

(declare-fun Unit!36032 () Unit!36027)

(assert (=> b!1101522 (= e!628714 Unit!36032)))

(declare-fun e!628721 () Bool)

(declare-fun b!1101523 () Bool)

(assert (=> b!1101523 (= e!628721 (= (apply!945 lt!493807 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)) (get!17651 (select (arr!34300 lt!493648) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34838 lt!493648)))))

(assert (=> b!1101523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(declare-fun b!1101524 () Bool)

(declare-fun e!628718 () Bool)

(assert (=> b!1101524 (= e!628718 (= (apply!945 lt!493807 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1101525 () Bool)

(declare-fun lt!493823 () Unit!36027)

(assert (=> b!1101525 (= e!628714 lt!493823)))

(declare-fun lt!493822 () ListLongMap!15413)

(assert (=> b!1101525 (= lt!493822 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493803 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493805 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493805 (select (arr!34299 lt!493639) #b00000000000000000000000000000000))))

(declare-fun lt!493811 () Unit!36027)

(assert (=> b!1101525 (= lt!493811 (addStillContains!658 lt!493822 lt!493803 zeroValue!831 lt!493805))))

(assert (=> b!1101525 (contains!6374 (+!3432 lt!493822 (tuple2!17445 lt!493803 zeroValue!831)) lt!493805)))

(declare-fun lt!493815 () Unit!36027)

(assert (=> b!1101525 (= lt!493815 lt!493811)))

(declare-fun lt!493813 () ListLongMap!15413)

(assert (=> b!1101525 (= lt!493813 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493817 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493817 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493818 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493818 (select (arr!34299 lt!493639) #b00000000000000000000000000000000))))

(declare-fun lt!493812 () Unit!36027)

(assert (=> b!1101525 (= lt!493812 (addApplyDifferent!514 lt!493813 lt!493817 minValue!831 lt!493818))))

(assert (=> b!1101525 (= (apply!945 (+!3432 lt!493813 (tuple2!17445 lt!493817 minValue!831)) lt!493818) (apply!945 lt!493813 lt!493818))))

(declare-fun lt!493820 () Unit!36027)

(assert (=> b!1101525 (= lt!493820 lt!493812)))

(declare-fun lt!493810 () ListLongMap!15413)

(assert (=> b!1101525 (= lt!493810 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493808 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493824 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493824 (select (arr!34299 lt!493639) #b00000000000000000000000000000000))))

(declare-fun lt!493814 () Unit!36027)

(assert (=> b!1101525 (= lt!493814 (addApplyDifferent!514 lt!493810 lt!493808 zeroValue!831 lt!493824))))

(assert (=> b!1101525 (= (apply!945 (+!3432 lt!493810 (tuple2!17445 lt!493808 zeroValue!831)) lt!493824) (apply!945 lt!493810 lt!493824))))

(declare-fun lt!493804 () Unit!36027)

(assert (=> b!1101525 (= lt!493804 lt!493814)))

(declare-fun lt!493821 () ListLongMap!15413)

(assert (=> b!1101525 (= lt!493821 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493819 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493819 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493809 () (_ BitVec 64))

(assert (=> b!1101525 (= lt!493809 (select (arr!34299 lt!493639) #b00000000000000000000000000000000))))

(assert (=> b!1101525 (= lt!493823 (addApplyDifferent!514 lt!493821 lt!493819 minValue!831 lt!493809))))

(assert (=> b!1101525 (= (apply!945 (+!3432 lt!493821 (tuple2!17445 lt!493819 minValue!831)) lt!493809) (apply!945 lt!493821 lt!493809))))

(declare-fun b!1101526 () Bool)

(declare-fun e!628716 () Bool)

(assert (=> b!1101526 (= e!628717 e!628716)))

(declare-fun res!735023 () Bool)

(assert (=> b!1101526 (= res!735023 call!46184)))

(assert (=> b!1101526 (=> (not res!735023) (not e!628716))))

(declare-fun bm!46178 () Bool)

(declare-fun call!46181 () ListLongMap!15413)

(declare-fun call!46180 () ListLongMap!15413)

(assert (=> bm!46178 (= call!46181 call!46180)))

(declare-fun b!1101527 () Bool)

(assert (=> b!1101527 (= e!628715 call!46185)))

(declare-fun b!1101528 () Bool)

(assert (=> b!1101528 (= e!628724 call!46181)))

(declare-fun b!1101529 () Bool)

(assert (=> b!1101529 (= e!628719 e!628718)))

(declare-fun res!735027 () Bool)

(assert (=> b!1101529 (= res!735027 call!46182)))

(assert (=> b!1101529 (=> (not res!735027) (not e!628718))))

(declare-fun bm!46179 () Bool)

(assert (=> bm!46179 (= call!46184 (contains!6374 lt!493807 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101530 () Bool)

(assert (=> b!1101530 (= e!628716 (= (apply!945 lt!493807 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46180 () Bool)

(declare-fun call!46186 () ListLongMap!15413)

(assert (=> bm!46180 (= call!46186 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46181 () Bool)

(declare-fun c!108805 () Bool)

(assert (=> bm!46181 (= call!46183 (+!3432 (ite c!108801 call!46186 (ite c!108805 call!46180 call!46181)) (ite (or c!108801 c!108805) (tuple2!17445 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1101531 () Bool)

(assert (=> b!1101531 (= e!628722 e!628715)))

(assert (=> b!1101531 (= c!108805 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1101532 () Bool)

(declare-fun res!735029 () Bool)

(assert (=> b!1101532 (=> (not res!735029) (not e!628725))))

(declare-fun e!628720 () Bool)

(assert (=> b!1101532 (= res!735029 e!628720)))

(declare-fun res!735021 () Bool)

(assert (=> b!1101532 (=> res!735021 e!628720)))

(declare-fun e!628726 () Bool)

(assert (=> b!1101532 (= res!735021 (not e!628726))))

(declare-fun res!735025 () Bool)

(assert (=> b!1101532 (=> (not res!735025) (not e!628726))))

(assert (=> b!1101532 (= res!735025 (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(declare-fun b!1101533 () Bool)

(assert (=> b!1101533 (= e!628726 (validKeyInArray!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(declare-fun b!1101534 () Bool)

(assert (=> b!1101534 (= e!628720 e!628721)))

(declare-fun res!735022 () Bool)

(assert (=> b!1101534 (=> (not res!735022) (not e!628721))))

(assert (=> b!1101534 (= res!735022 (contains!6374 lt!493807 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(assert (=> b!1101534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(declare-fun bm!46182 () Bool)

(assert (=> bm!46182 (= call!46180 call!46186)))

(declare-fun bm!46183 () Bool)

(assert (=> bm!46183 (= call!46182 (contains!6374 lt!493807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101535 () Bool)

(assert (=> b!1101535 (= e!628725 e!628717)))

(declare-fun c!108802 () Bool)

(assert (=> b!1101535 (= c!108802 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130541 c!108801) b!1101521))

(assert (= (and d!130541 (not c!108801)) b!1101531))

(assert (= (and b!1101531 c!108805) b!1101527))

(assert (= (and b!1101531 (not c!108805)) b!1101517))

(assert (= (and b!1101517 c!108800) b!1101520))

(assert (= (and b!1101517 (not c!108800)) b!1101528))

(assert (= (or b!1101520 b!1101528) bm!46178))

(assert (= (or b!1101527 bm!46178) bm!46182))

(assert (= (or b!1101527 b!1101520) bm!46177))

(assert (= (or b!1101521 bm!46182) bm!46180))

(assert (= (or b!1101521 bm!46177) bm!46181))

(assert (= (and d!130541 res!735026) b!1101515))

(assert (= (and d!130541 c!108803) b!1101525))

(assert (= (and d!130541 (not c!108803)) b!1101522))

(assert (= (and d!130541 res!735028) b!1101532))

(assert (= (and b!1101532 res!735025) b!1101533))

(assert (= (and b!1101532 (not res!735021)) b!1101534))

(assert (= (and b!1101534 res!735022) b!1101523))

(assert (= (and b!1101532 res!735029) b!1101519))

(assert (= (and b!1101519 c!108804) b!1101529))

(assert (= (and b!1101519 (not c!108804)) b!1101516))

(assert (= (and b!1101529 res!735027) b!1101524))

(assert (= (or b!1101529 b!1101516) bm!46183))

(assert (= (and b!1101519 res!735024) b!1101535))

(assert (= (and b!1101535 c!108802) b!1101526))

(assert (= (and b!1101535 (not c!108802)) b!1101518))

(assert (= (and b!1101526 res!735023) b!1101530))

(assert (= (or b!1101526 b!1101518) bm!46179))

(declare-fun b_lambda!18089 () Bool)

(assert (=> (not b_lambda!18089) (not b!1101523)))

(assert (=> b!1101523 t!34241))

(declare-fun b_and!37123 () Bool)

(assert (= b_and!37121 (and (=> t!34241 result!16611) b_and!37123)))

(declare-fun m!1021259 () Bool)

(assert (=> bm!46179 m!1021259))

(declare-fun m!1021261 () Bool)

(assert (=> b!1101524 m!1021261))

(declare-fun m!1021263 () Bool)

(assert (=> b!1101525 m!1021263))

(declare-fun m!1021265 () Bool)

(assert (=> b!1101525 m!1021265))

(assert (=> b!1101525 m!1021265))

(declare-fun m!1021267 () Bool)

(assert (=> b!1101525 m!1021267))

(assert (=> b!1101525 m!1021045))

(declare-fun m!1021269 () Bool)

(assert (=> b!1101525 m!1021269))

(declare-fun m!1021271 () Bool)

(assert (=> b!1101525 m!1021271))

(declare-fun m!1021273 () Bool)

(assert (=> b!1101525 m!1021273))

(declare-fun m!1021275 () Bool)

(assert (=> b!1101525 m!1021275))

(assert (=> b!1101525 m!1021263))

(declare-fun m!1021277 () Bool)

(assert (=> b!1101525 m!1021277))

(declare-fun m!1021279 () Bool)

(assert (=> b!1101525 m!1021279))

(declare-fun m!1021281 () Bool)

(assert (=> b!1101525 m!1021281))

(declare-fun m!1021283 () Bool)

(assert (=> b!1101525 m!1021283))

(declare-fun m!1021285 () Bool)

(assert (=> b!1101525 m!1021285))

(declare-fun m!1021287 () Bool)

(assert (=> b!1101525 m!1021287))

(assert (=> b!1101525 m!1021273))

(declare-fun m!1021289 () Bool)

(assert (=> b!1101525 m!1021289))

(declare-fun m!1021291 () Bool)

(assert (=> b!1101525 m!1021291))

(declare-fun m!1021293 () Bool)

(assert (=> b!1101525 m!1021293))

(assert (=> b!1101525 m!1021269))

(declare-fun m!1021295 () Bool)

(assert (=> b!1101523 m!1021295))

(assert (=> b!1101523 m!1021041))

(assert (=> b!1101523 m!1021291))

(assert (=> b!1101523 m!1021291))

(declare-fun m!1021297 () Bool)

(assert (=> b!1101523 m!1021297))

(assert (=> b!1101523 m!1021295))

(assert (=> b!1101523 m!1021041))

(declare-fun m!1021299 () Bool)

(assert (=> b!1101523 m!1021299))

(assert (=> b!1101533 m!1021291))

(assert (=> b!1101533 m!1021291))

(declare-fun m!1021301 () Bool)

(assert (=> b!1101533 m!1021301))

(declare-fun m!1021303 () Bool)

(assert (=> bm!46183 m!1021303))

(assert (=> b!1101534 m!1021291))

(assert (=> b!1101534 m!1021291))

(declare-fun m!1021305 () Bool)

(assert (=> b!1101534 m!1021305))

(declare-fun m!1021307 () Bool)

(assert (=> b!1101521 m!1021307))

(declare-fun m!1021309 () Bool)

(assert (=> bm!46181 m!1021309))

(assert (=> b!1101515 m!1021291))

(assert (=> b!1101515 m!1021291))

(assert (=> b!1101515 m!1021301))

(assert (=> d!130541 m!1021023))

(assert (=> bm!46180 m!1021045))

(declare-fun m!1021311 () Bool)

(assert (=> b!1101530 m!1021311))

(assert (=> b!1101327 d!130541))

(declare-fun b!1101542 () Bool)

(declare-fun e!628731 () Bool)

(declare-fun call!46192 () ListLongMap!15413)

(declare-fun call!46191 () ListLongMap!15413)

(assert (=> b!1101542 (= e!628731 (= call!46192 call!46191))))

(assert (=> b!1101542 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34838 _values!874)))))

(declare-fun bm!46188 () Bool)

(assert (=> bm!46188 (= call!46192 (getCurrentListMapNoExtraKeys!4243 (array!71273 (store (arr!34299 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34837 _keys!1070)) (array!71275 (store (arr!34300 _values!874) i!650 (ValueCellFull!12902 (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34838 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46189 () Bool)

(assert (=> bm!46189 (= call!46191 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101543 () Bool)

(assert (=> b!1101543 (= e!628731 (= call!46192 (-!951 call!46191 k0!904)))))

(assert (=> b!1101543 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34838 _values!874)))))

(declare-fun d!130543 () Bool)

(declare-fun e!628732 () Bool)

(assert (=> d!130543 e!628732))

(declare-fun res!735032 () Bool)

(assert (=> d!130543 (=> (not res!735032) (not e!628732))))

(assert (=> d!130543 (= res!735032 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34837 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34837 _keys!1070))))))))

(declare-fun lt!493827 () Unit!36027)

(declare-fun choose!1779 (array!71272 array!71274 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36027)

(assert (=> d!130543 (= lt!493827 (choose!1779 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(assert (=> d!130543 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!225 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!493827)))

(declare-fun b!1101544 () Bool)

(assert (=> b!1101544 (= e!628732 e!628731)))

(declare-fun c!108808 () Bool)

(assert (=> b!1101544 (= c!108808 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!130543 res!735032) b!1101544))

(assert (= (and b!1101544 c!108808) b!1101543))

(assert (= (and b!1101544 (not c!108808)) b!1101542))

(assert (= (or b!1101543 b!1101542) bm!46189))

(assert (= (or b!1101543 b!1101542) bm!46188))

(declare-fun b_lambda!18091 () Bool)

(assert (=> (not b_lambda!18091) (not bm!46188)))

(assert (=> bm!46188 t!34241))

(declare-fun b_and!37125 () Bool)

(assert (= b_and!37123 (and (=> t!34241 result!16611) b_and!37125)))

(assert (=> bm!46188 m!1021039))

(assert (=> bm!46188 m!1021041))

(assert (=> bm!46188 m!1021047))

(declare-fun m!1021313 () Bool)

(assert (=> bm!46188 m!1021313))

(assert (=> bm!46189 m!1021055))

(declare-fun m!1021315 () Bool)

(assert (=> b!1101543 m!1021315))

(declare-fun m!1021317 () Bool)

(assert (=> d!130543 m!1021317))

(assert (=> b!1101327 d!130543))

(declare-fun b!1101569 () Bool)

(declare-fun e!628751 () Bool)

(declare-fun e!628749 () Bool)

(assert (=> b!1101569 (= e!628751 e!628749)))

(declare-fun c!108818 () Bool)

(assert (=> b!1101569 (= c!108818 (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(declare-fun d!130545 () Bool)

(declare-fun e!628753 () Bool)

(assert (=> d!130545 e!628753))

(declare-fun res!735043 () Bool)

(assert (=> d!130545 (=> (not res!735043) (not e!628753))))

(declare-fun lt!493843 () ListLongMap!15413)

(assert (=> d!130545 (= res!735043 (not (contains!6374 lt!493843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!628747 () ListLongMap!15413)

(assert (=> d!130545 (= lt!493843 e!628747)))

(declare-fun c!108820 () Bool)

(assert (=> d!130545 (= c!108820 (bvsge #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(assert (=> d!130545 (validMask!0 mask!1414)))

(assert (=> d!130545 (= (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493843)))

(declare-fun call!46195 () ListLongMap!15413)

(declare-fun bm!46192 () Bool)

(assert (=> bm!46192 (= call!46195 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101570 () Bool)

(declare-fun e!628752 () Bool)

(assert (=> b!1101570 (= e!628751 e!628752)))

(assert (=> b!1101570 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(declare-fun res!735042 () Bool)

(assert (=> b!1101570 (= res!735042 (contains!6374 lt!493843 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(assert (=> b!1101570 (=> (not res!735042) (not e!628752))))

(declare-fun b!1101571 () Bool)

(declare-fun e!628748 () ListLongMap!15413)

(assert (=> b!1101571 (= e!628748 call!46195)))

(declare-fun b!1101572 () Bool)

(declare-fun isEmpty!975 (ListLongMap!15413) Bool)

(assert (=> b!1101572 (= e!628749 (isEmpty!975 lt!493843))))

(declare-fun b!1101573 () Bool)

(declare-fun res!735044 () Bool)

(assert (=> b!1101573 (=> (not res!735044) (not e!628753))))

(assert (=> b!1101573 (= res!735044 (not (contains!6374 lt!493843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101574 () Bool)

(assert (=> b!1101574 (= e!628747 (ListLongMap!15414 Nil!24029))))

(declare-fun b!1101575 () Bool)

(assert (=> b!1101575 (= e!628753 e!628751)))

(declare-fun c!108819 () Bool)

(declare-fun e!628750 () Bool)

(assert (=> b!1101575 (= c!108819 e!628750)))

(declare-fun res!735041 () Bool)

(assert (=> b!1101575 (=> (not res!735041) (not e!628750))))

(assert (=> b!1101575 (= res!735041 (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(declare-fun b!1101576 () Bool)

(assert (=> b!1101576 (= e!628749 (= lt!493843 (getCurrentListMapNoExtraKeys!4243 lt!493639 lt!493648 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101577 () Bool)

(assert (=> b!1101577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(assert (=> b!1101577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34838 lt!493648)))))

(assert (=> b!1101577 (= e!628752 (= (apply!945 lt!493843 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)) (get!17651 (select (arr!34300 lt!493648) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101578 () Bool)

(assert (=> b!1101578 (= e!628747 e!628748)))

(declare-fun c!108817 () Bool)

(assert (=> b!1101578 (= c!108817 (validKeyInArray!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(declare-fun b!1101579 () Bool)

(assert (=> b!1101579 (= e!628750 (validKeyInArray!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(assert (=> b!1101579 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101580 () Bool)

(declare-fun lt!493848 () Unit!36027)

(declare-fun lt!493844 () Unit!36027)

(assert (=> b!1101580 (= lt!493848 lt!493844)))

(declare-fun lt!493847 () (_ BitVec 64))

(declare-fun lt!493842 () (_ BitVec 64))

(declare-fun lt!493846 () ListLongMap!15413)

(declare-fun lt!493845 () V!41425)

(assert (=> b!1101580 (not (contains!6374 (+!3432 lt!493846 (tuple2!17445 lt!493842 lt!493845)) lt!493847))))

(declare-fun addStillNotContains!281 (ListLongMap!15413 (_ BitVec 64) V!41425 (_ BitVec 64)) Unit!36027)

(assert (=> b!1101580 (= lt!493844 (addStillNotContains!281 lt!493846 lt!493842 lt!493845 lt!493847))))

(assert (=> b!1101580 (= lt!493847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101580 (= lt!493845 (get!17651 (select (arr!34300 lt!493648) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101580 (= lt!493842 (select (arr!34299 lt!493639) #b00000000000000000000000000000000))))

(assert (=> b!1101580 (= lt!493846 call!46195)))

(assert (=> b!1101580 (= e!628748 (+!3432 call!46195 (tuple2!17445 (select (arr!34299 lt!493639) #b00000000000000000000000000000000) (get!17651 (select (arr!34300 lt!493648) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!130545 c!108820) b!1101574))

(assert (= (and d!130545 (not c!108820)) b!1101578))

(assert (= (and b!1101578 c!108817) b!1101580))

(assert (= (and b!1101578 (not c!108817)) b!1101571))

(assert (= (or b!1101580 b!1101571) bm!46192))

(assert (= (and d!130545 res!735043) b!1101573))

(assert (= (and b!1101573 res!735044) b!1101575))

(assert (= (and b!1101575 res!735041) b!1101579))

(assert (= (and b!1101575 c!108819) b!1101570))

(assert (= (and b!1101575 (not c!108819)) b!1101569))

(assert (= (and b!1101570 res!735042) b!1101577))

(assert (= (and b!1101569 c!108818) b!1101576))

(assert (= (and b!1101569 (not c!108818)) b!1101572))

(declare-fun b_lambda!18093 () Bool)

(assert (=> (not b_lambda!18093) (not b!1101577)))

(assert (=> b!1101577 t!34241))

(declare-fun b_and!37127 () Bool)

(assert (= b_and!37125 (and (=> t!34241 result!16611) b_and!37127)))

(declare-fun b_lambda!18095 () Bool)

(assert (=> (not b_lambda!18095) (not b!1101580)))

(assert (=> b!1101580 t!34241))

(declare-fun b_and!37129 () Bool)

(assert (= b_and!37127 (and (=> t!34241 result!16611) b_and!37129)))

(assert (=> b!1101577 m!1021295))

(assert (=> b!1101577 m!1021291))

(declare-fun m!1021319 () Bool)

(assert (=> b!1101577 m!1021319))

(assert (=> b!1101577 m!1021041))

(assert (=> b!1101577 m!1021291))

(assert (=> b!1101577 m!1021295))

(assert (=> b!1101577 m!1021041))

(assert (=> b!1101577 m!1021299))

(declare-fun m!1021321 () Bool)

(assert (=> b!1101576 m!1021321))

(declare-fun m!1021323 () Bool)

(assert (=> b!1101572 m!1021323))

(assert (=> b!1101570 m!1021291))

(assert (=> b!1101570 m!1021291))

(declare-fun m!1021325 () Bool)

(assert (=> b!1101570 m!1021325))

(assert (=> bm!46192 m!1021321))

(assert (=> b!1101578 m!1021291))

(assert (=> b!1101578 m!1021291))

(assert (=> b!1101578 m!1021301))

(assert (=> b!1101579 m!1021291))

(assert (=> b!1101579 m!1021291))

(assert (=> b!1101579 m!1021301))

(assert (=> b!1101580 m!1021295))

(declare-fun m!1021327 () Bool)

(assert (=> b!1101580 m!1021327))

(declare-fun m!1021329 () Bool)

(assert (=> b!1101580 m!1021329))

(declare-fun m!1021331 () Bool)

(assert (=> b!1101580 m!1021331))

(assert (=> b!1101580 m!1021329))

(assert (=> b!1101580 m!1021041))

(assert (=> b!1101580 m!1021291))

(declare-fun m!1021333 () Bool)

(assert (=> b!1101580 m!1021333))

(assert (=> b!1101580 m!1021295))

(assert (=> b!1101580 m!1021041))

(assert (=> b!1101580 m!1021299))

(declare-fun m!1021335 () Bool)

(assert (=> b!1101573 m!1021335))

(declare-fun m!1021337 () Bool)

(assert (=> d!130545 m!1021337))

(assert (=> d!130545 m!1021023))

(assert (=> b!1101327 d!130545))

(declare-fun b!1101581 () Bool)

(declare-fun e!628758 () Bool)

(declare-fun e!628756 () Bool)

(assert (=> b!1101581 (= e!628758 e!628756)))

(declare-fun c!108822 () Bool)

(assert (=> b!1101581 (= c!108822 (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(declare-fun d!130547 () Bool)

(declare-fun e!628760 () Bool)

(assert (=> d!130547 e!628760))

(declare-fun res!735047 () Bool)

(assert (=> d!130547 (=> (not res!735047) (not e!628760))))

(declare-fun lt!493850 () ListLongMap!15413)

(assert (=> d!130547 (= res!735047 (not (contains!6374 lt!493850 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!628754 () ListLongMap!15413)

(assert (=> d!130547 (= lt!493850 e!628754)))

(declare-fun c!108824 () Bool)

(assert (=> d!130547 (= c!108824 (bvsge #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(assert (=> d!130547 (validMask!0 mask!1414)))

(assert (=> d!130547 (= (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493850)))

(declare-fun bm!46193 () Bool)

(declare-fun call!46196 () ListLongMap!15413)

(assert (=> bm!46193 (= call!46196 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1101582 () Bool)

(declare-fun e!628759 () Bool)

(assert (=> b!1101582 (= e!628758 e!628759)))

(assert (=> b!1101582 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(declare-fun res!735046 () Bool)

(assert (=> b!1101582 (= res!735046 (contains!6374 lt!493850 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101582 (=> (not res!735046) (not e!628759))))

(declare-fun b!1101583 () Bool)

(declare-fun e!628755 () ListLongMap!15413)

(assert (=> b!1101583 (= e!628755 call!46196)))

(declare-fun b!1101584 () Bool)

(assert (=> b!1101584 (= e!628756 (isEmpty!975 lt!493850))))

(declare-fun b!1101585 () Bool)

(declare-fun res!735048 () Bool)

(assert (=> b!1101585 (=> (not res!735048) (not e!628760))))

(assert (=> b!1101585 (= res!735048 (not (contains!6374 lt!493850 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1101586 () Bool)

(assert (=> b!1101586 (= e!628754 (ListLongMap!15414 Nil!24029))))

(declare-fun b!1101587 () Bool)

(assert (=> b!1101587 (= e!628760 e!628758)))

(declare-fun c!108823 () Bool)

(declare-fun e!628757 () Bool)

(assert (=> b!1101587 (= c!108823 e!628757)))

(declare-fun res!735045 () Bool)

(assert (=> b!1101587 (=> (not res!735045) (not e!628757))))

(assert (=> b!1101587 (= res!735045 (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(declare-fun b!1101588 () Bool)

(assert (=> b!1101588 (= e!628756 (= lt!493850 (getCurrentListMapNoExtraKeys!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101589 () Bool)

(assert (=> b!1101589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(assert (=> b!1101589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34838 _values!874)))))

(assert (=> b!1101589 (= e!628759 (= (apply!945 lt!493850 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)) (get!17651 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101590 () Bool)

(assert (=> b!1101590 (= e!628754 e!628755)))

(declare-fun c!108821 () Bool)

(assert (=> b!1101590 (= c!108821 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101591 () Bool)

(assert (=> b!1101591 (= e!628757 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101591 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101592 () Bool)

(declare-fun lt!493855 () Unit!36027)

(declare-fun lt!493851 () Unit!36027)

(assert (=> b!1101592 (= lt!493855 lt!493851)))

(declare-fun lt!493853 () ListLongMap!15413)

(declare-fun lt!493854 () (_ BitVec 64))

(declare-fun lt!493852 () V!41425)

(declare-fun lt!493849 () (_ BitVec 64))

(assert (=> b!1101592 (not (contains!6374 (+!3432 lt!493853 (tuple2!17445 lt!493849 lt!493852)) lt!493854))))

(assert (=> b!1101592 (= lt!493851 (addStillNotContains!281 lt!493853 lt!493849 lt!493852 lt!493854))))

(assert (=> b!1101592 (= lt!493854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101592 (= lt!493852 (get!17651 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101592 (= lt!493849 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101592 (= lt!493853 call!46196)))

(assert (=> b!1101592 (= e!628755 (+!3432 call!46196 (tuple2!17445 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) (get!17651 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!130547 c!108824) b!1101586))

(assert (= (and d!130547 (not c!108824)) b!1101590))

(assert (= (and b!1101590 c!108821) b!1101592))

(assert (= (and b!1101590 (not c!108821)) b!1101583))

(assert (= (or b!1101592 b!1101583) bm!46193))

(assert (= (and d!130547 res!735047) b!1101585))

(assert (= (and b!1101585 res!735048) b!1101587))

(assert (= (and b!1101587 res!735045) b!1101591))

(assert (= (and b!1101587 c!108823) b!1101582))

(assert (= (and b!1101587 (not c!108823)) b!1101581))

(assert (= (and b!1101582 res!735046) b!1101589))

(assert (= (and b!1101581 c!108822) b!1101588))

(assert (= (and b!1101581 (not c!108822)) b!1101584))

(declare-fun b_lambda!18097 () Bool)

(assert (=> (not b_lambda!18097) (not b!1101589)))

(assert (=> b!1101589 t!34241))

(declare-fun b_and!37131 () Bool)

(assert (= b_and!37129 (and (=> t!34241 result!16611) b_and!37131)))

(declare-fun b_lambda!18099 () Bool)

(assert (=> (not b_lambda!18099) (not b!1101592)))

(assert (=> b!1101592 t!34241))

(declare-fun b_and!37133 () Bool)

(assert (= b_and!37131 (and (=> t!34241 result!16611) b_and!37133)))

(assert (=> b!1101589 m!1021239))

(assert (=> b!1101589 m!1021179))

(declare-fun m!1021339 () Bool)

(assert (=> b!1101589 m!1021339))

(assert (=> b!1101589 m!1021041))

(assert (=> b!1101589 m!1021179))

(assert (=> b!1101589 m!1021239))

(assert (=> b!1101589 m!1021041))

(assert (=> b!1101589 m!1021243))

(declare-fun m!1021341 () Bool)

(assert (=> b!1101588 m!1021341))

(declare-fun m!1021343 () Bool)

(assert (=> b!1101584 m!1021343))

(assert (=> b!1101582 m!1021179))

(assert (=> b!1101582 m!1021179))

(declare-fun m!1021345 () Bool)

(assert (=> b!1101582 m!1021345))

(assert (=> bm!46193 m!1021341))

(assert (=> b!1101590 m!1021179))

(assert (=> b!1101590 m!1021179))

(assert (=> b!1101590 m!1021181))

(assert (=> b!1101591 m!1021179))

(assert (=> b!1101591 m!1021179))

(assert (=> b!1101591 m!1021181))

(assert (=> b!1101592 m!1021239))

(declare-fun m!1021347 () Bool)

(assert (=> b!1101592 m!1021347))

(declare-fun m!1021349 () Bool)

(assert (=> b!1101592 m!1021349))

(declare-fun m!1021351 () Bool)

(assert (=> b!1101592 m!1021351))

(assert (=> b!1101592 m!1021349))

(assert (=> b!1101592 m!1021041))

(assert (=> b!1101592 m!1021179))

(declare-fun m!1021353 () Bool)

(assert (=> b!1101592 m!1021353))

(assert (=> b!1101592 m!1021239))

(assert (=> b!1101592 m!1021041))

(assert (=> b!1101592 m!1021243))

(declare-fun m!1021355 () Bool)

(assert (=> b!1101585 m!1021355))

(declare-fun m!1021357 () Bool)

(assert (=> d!130547 m!1021357))

(assert (=> d!130547 m!1021023))

(assert (=> b!1101327 d!130547))

(declare-fun d!130549 () Bool)

(assert (=> d!130549 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493858 () Unit!36027)

(declare-fun choose!13 (array!71272 (_ BitVec 64) (_ BitVec 32)) Unit!36027)

(assert (=> d!130549 (= lt!493858 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130549 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130549 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493858)))

(declare-fun bs!32300 () Bool)

(assert (= bs!32300 d!130549))

(assert (=> bs!32300 m!1021049))

(declare-fun m!1021359 () Bool)

(assert (=> bs!32300 m!1021359))

(assert (=> b!1101327 d!130549))

(declare-fun d!130551 () Bool)

(declare-fun e!628761 () Bool)

(assert (=> d!130551 e!628761))

(declare-fun res!735049 () Bool)

(assert (=> d!130551 (=> (not res!735049) (not e!628761))))

(declare-fun lt!493860 () ListLongMap!15413)

(assert (=> d!130551 (= res!735049 (contains!6374 lt!493860 (_1!8733 lt!493640)))))

(declare-fun lt!493861 () List!24032)

(assert (=> d!130551 (= lt!493860 (ListLongMap!15414 lt!493861))))

(declare-fun lt!493859 () Unit!36027)

(declare-fun lt!493862 () Unit!36027)

(assert (=> d!130551 (= lt!493859 lt!493862)))

(assert (=> d!130551 (= (getValueByKey!629 lt!493861 (_1!8733 lt!493640)) (Some!679 (_2!8733 lt!493640)))))

(assert (=> d!130551 (= lt!493862 (lemmaContainsTupThenGetReturnValue!305 lt!493861 (_1!8733 lt!493640) (_2!8733 lt!493640)))))

(assert (=> d!130551 (= lt!493861 (insertStrictlySorted!398 (toList!7722 lt!493645) (_1!8733 lt!493640) (_2!8733 lt!493640)))))

(assert (=> d!130551 (= (+!3432 lt!493645 lt!493640) lt!493860)))

(declare-fun b!1101593 () Bool)

(declare-fun res!735050 () Bool)

(assert (=> b!1101593 (=> (not res!735050) (not e!628761))))

(assert (=> b!1101593 (= res!735050 (= (getValueByKey!629 (toList!7722 lt!493860) (_1!8733 lt!493640)) (Some!679 (_2!8733 lt!493640))))))

(declare-fun b!1101594 () Bool)

(assert (=> b!1101594 (= e!628761 (contains!6375 (toList!7722 lt!493860) lt!493640))))

(assert (= (and d!130551 res!735049) b!1101593))

(assert (= (and b!1101593 res!735050) b!1101594))

(declare-fun m!1021361 () Bool)

(assert (=> d!130551 m!1021361))

(declare-fun m!1021363 () Bool)

(assert (=> d!130551 m!1021363))

(declare-fun m!1021365 () Bool)

(assert (=> d!130551 m!1021365))

(declare-fun m!1021367 () Bool)

(assert (=> d!130551 m!1021367))

(declare-fun m!1021369 () Bool)

(assert (=> b!1101593 m!1021369))

(declare-fun m!1021371 () Bool)

(assert (=> b!1101594 m!1021371))

(assert (=> b!1101328 d!130551))

(declare-fun d!130553 () Bool)

(declare-fun res!735059 () Bool)

(declare-fun e!628772 () Bool)

(assert (=> d!130553 (=> res!735059 e!628772)))

(assert (=> d!130553 (= res!735059 (bvsge #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(assert (=> d!130553 (= (arrayNoDuplicates!0 lt!493639 #b00000000000000000000000000000000 Nil!24030) e!628772)))

(declare-fun b!1101605 () Bool)

(declare-fun e!628770 () Bool)

(declare-fun call!46199 () Bool)

(assert (=> b!1101605 (= e!628770 call!46199)))

(declare-fun b!1101606 () Bool)

(assert (=> b!1101606 (= e!628770 call!46199)))

(declare-fun b!1101607 () Bool)

(declare-fun e!628773 () Bool)

(assert (=> b!1101607 (= e!628773 e!628770)))

(declare-fun c!108827 () Bool)

(assert (=> b!1101607 (= c!108827 (validKeyInArray!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(declare-fun bm!46196 () Bool)

(assert (=> bm!46196 (= call!46199 (arrayNoDuplicates!0 lt!493639 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108827 (Cons!24029 (select (arr!34299 lt!493639) #b00000000000000000000000000000000) Nil!24030) Nil!24030)))))

(declare-fun b!1101608 () Bool)

(declare-fun e!628771 () Bool)

(declare-fun contains!6376 (List!24033 (_ BitVec 64)) Bool)

(assert (=> b!1101608 (= e!628771 (contains!6376 Nil!24030 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(declare-fun b!1101609 () Bool)

(assert (=> b!1101609 (= e!628772 e!628773)))

(declare-fun res!735058 () Bool)

(assert (=> b!1101609 (=> (not res!735058) (not e!628773))))

(assert (=> b!1101609 (= res!735058 (not e!628771))))

(declare-fun res!735057 () Bool)

(assert (=> b!1101609 (=> (not res!735057) (not e!628771))))

(assert (=> b!1101609 (= res!735057 (validKeyInArray!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(assert (= (and d!130553 (not res!735059)) b!1101609))

(assert (= (and b!1101609 res!735057) b!1101608))

(assert (= (and b!1101609 res!735058) b!1101607))

(assert (= (and b!1101607 c!108827) b!1101605))

(assert (= (and b!1101607 (not c!108827)) b!1101606))

(assert (= (or b!1101605 b!1101606) bm!46196))

(assert (=> b!1101607 m!1021291))

(assert (=> b!1101607 m!1021291))

(assert (=> b!1101607 m!1021301))

(assert (=> bm!46196 m!1021291))

(declare-fun m!1021373 () Bool)

(assert (=> bm!46196 m!1021373))

(assert (=> b!1101608 m!1021291))

(assert (=> b!1101608 m!1021291))

(declare-fun m!1021375 () Bool)

(assert (=> b!1101608 m!1021375))

(assert (=> b!1101609 m!1021291))

(assert (=> b!1101609 m!1021291))

(assert (=> b!1101609 m!1021301))

(assert (=> b!1101320 d!130553))

(declare-fun b!1101610 () Bool)

(declare-fun e!628775 () Bool)

(declare-fun e!628776 () Bool)

(assert (=> b!1101610 (= e!628775 e!628776)))

(declare-fun c!108828 () Bool)

(assert (=> b!1101610 (= c!108828 (validKeyInArray!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000)))))

(declare-fun b!1101611 () Bool)

(declare-fun e!628774 () Bool)

(assert (=> b!1101611 (= e!628776 e!628774)))

(declare-fun lt!493863 () (_ BitVec 64))

(assert (=> b!1101611 (= lt!493863 (select (arr!34299 lt!493639) #b00000000000000000000000000000000))))

(declare-fun lt!493864 () Unit!36027)

(assert (=> b!1101611 (= lt!493864 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493639 lt!493863 #b00000000000000000000000000000000))))

(assert (=> b!1101611 (arrayContainsKey!0 lt!493639 lt!493863 #b00000000000000000000000000000000)))

(declare-fun lt!493865 () Unit!36027)

(assert (=> b!1101611 (= lt!493865 lt!493864)))

(declare-fun res!735060 () Bool)

(assert (=> b!1101611 (= res!735060 (= (seekEntryOrOpen!0 (select (arr!34299 lt!493639) #b00000000000000000000000000000000) lt!493639 mask!1414) (Found!9914 #b00000000000000000000000000000000)))))

(assert (=> b!1101611 (=> (not res!735060) (not e!628774))))

(declare-fun b!1101612 () Bool)

(declare-fun call!46200 () Bool)

(assert (=> b!1101612 (= e!628776 call!46200)))

(declare-fun d!130555 () Bool)

(declare-fun res!735061 () Bool)

(assert (=> d!130555 (=> res!735061 e!628775)))

(assert (=> d!130555 (= res!735061 (bvsge #b00000000000000000000000000000000 (size!34837 lt!493639)))))

(assert (=> d!130555 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493639 mask!1414) e!628775)))

(declare-fun b!1101613 () Bool)

(assert (=> b!1101613 (= e!628774 call!46200)))

(declare-fun bm!46197 () Bool)

(assert (=> bm!46197 (= call!46200 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493639 mask!1414))))

(assert (= (and d!130555 (not res!735061)) b!1101610))

(assert (= (and b!1101610 c!108828) b!1101611))

(assert (= (and b!1101610 (not c!108828)) b!1101612))

(assert (= (and b!1101611 res!735060) b!1101613))

(assert (= (or b!1101613 b!1101612) bm!46197))

(assert (=> b!1101610 m!1021291))

(assert (=> b!1101610 m!1021291))

(assert (=> b!1101610 m!1021301))

(assert (=> b!1101611 m!1021291))

(declare-fun m!1021377 () Bool)

(assert (=> b!1101611 m!1021377))

(declare-fun m!1021379 () Bool)

(assert (=> b!1101611 m!1021379))

(assert (=> b!1101611 m!1021291))

(declare-fun m!1021381 () Bool)

(assert (=> b!1101611 m!1021381))

(declare-fun m!1021383 () Bool)

(assert (=> bm!46197 m!1021383))

(assert (=> b!1101325 d!130555))

(declare-fun d!130557 () Bool)

(declare-fun res!735064 () Bool)

(declare-fun e!628779 () Bool)

(assert (=> d!130557 (=> res!735064 e!628779)))

(assert (=> d!130557 (= res!735064 (bvsge #b00000000000000000000000000000000 (size!34837 _keys!1070)))))

(assert (=> d!130557 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24030) e!628779)))

(declare-fun b!1101614 () Bool)

(declare-fun e!628777 () Bool)

(declare-fun call!46201 () Bool)

(assert (=> b!1101614 (= e!628777 call!46201)))

(declare-fun b!1101615 () Bool)

(assert (=> b!1101615 (= e!628777 call!46201)))

(declare-fun b!1101616 () Bool)

(declare-fun e!628780 () Bool)

(assert (=> b!1101616 (= e!628780 e!628777)))

(declare-fun c!108829 () Bool)

(assert (=> b!1101616 (= c!108829 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46198 () Bool)

(assert (=> bm!46198 (= call!46201 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108829 (Cons!24029 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) Nil!24030) Nil!24030)))))

(declare-fun b!1101617 () Bool)

(declare-fun e!628778 () Bool)

(assert (=> b!1101617 (= e!628778 (contains!6376 Nil!24030 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101618 () Bool)

(assert (=> b!1101618 (= e!628779 e!628780)))

(declare-fun res!735063 () Bool)

(assert (=> b!1101618 (=> (not res!735063) (not e!628780))))

(assert (=> b!1101618 (= res!735063 (not e!628778))))

(declare-fun res!735062 () Bool)

(assert (=> b!1101618 (=> (not res!735062) (not e!628778))))

(assert (=> b!1101618 (= res!735062 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130557 (not res!735064)) b!1101618))

(assert (= (and b!1101618 res!735062) b!1101617))

(assert (= (and b!1101618 res!735063) b!1101616))

(assert (= (and b!1101616 c!108829) b!1101614))

(assert (= (and b!1101616 (not c!108829)) b!1101615))

(assert (= (or b!1101614 b!1101615) bm!46198))

(assert (=> b!1101616 m!1021179))

(assert (=> b!1101616 m!1021179))

(assert (=> b!1101616 m!1021181))

(assert (=> bm!46198 m!1021179))

(declare-fun m!1021385 () Bool)

(assert (=> bm!46198 m!1021385))

(assert (=> b!1101617 m!1021179))

(assert (=> b!1101617 m!1021179))

(declare-fun m!1021387 () Bool)

(assert (=> b!1101617 m!1021387))

(assert (=> b!1101618 m!1021179))

(assert (=> b!1101618 m!1021179))

(assert (=> b!1101618 m!1021181))

(assert (=> b!1101329 d!130557))

(declare-fun b!1101625 () Bool)

(declare-fun e!628785 () Bool)

(assert (=> b!1101625 (= e!628785 tp_is_empty!27223)))

(declare-fun mapNonEmpty!42631 () Bool)

(declare-fun mapRes!42631 () Bool)

(declare-fun tp!81488 () Bool)

(assert (=> mapNonEmpty!42631 (= mapRes!42631 (and tp!81488 e!628785))))

(declare-fun mapValue!42631 () ValueCell!12902)

(declare-fun mapKey!42631 () (_ BitVec 32))

(declare-fun mapRest!42631 () (Array (_ BitVec 32) ValueCell!12902))

(assert (=> mapNonEmpty!42631 (= mapRest!42622 (store mapRest!42631 mapKey!42631 mapValue!42631))))

(declare-fun condMapEmpty!42631 () Bool)

(declare-fun mapDefault!42631 () ValueCell!12902)

(assert (=> mapNonEmpty!42622 (= condMapEmpty!42631 (= mapRest!42622 ((as const (Array (_ BitVec 32) ValueCell!12902)) mapDefault!42631)))))

(declare-fun e!628786 () Bool)

(assert (=> mapNonEmpty!42622 (= tp!81472 (and e!628786 mapRes!42631))))

(declare-fun b!1101626 () Bool)

(assert (=> b!1101626 (= e!628786 tp_is_empty!27223)))

(declare-fun mapIsEmpty!42631 () Bool)

(assert (=> mapIsEmpty!42631 mapRes!42631))

(assert (= (and mapNonEmpty!42622 condMapEmpty!42631) mapIsEmpty!42631))

(assert (= (and mapNonEmpty!42622 (not condMapEmpty!42631)) mapNonEmpty!42631))

(assert (= (and mapNonEmpty!42631 ((_ is ValueCellFull!12902) mapValue!42631)) b!1101625))

(assert (= (and mapNonEmpty!42622 ((_ is ValueCellFull!12902) mapDefault!42631)) b!1101626))

(declare-fun m!1021389 () Bool)

(assert (=> mapNonEmpty!42631 m!1021389))

(declare-fun b_lambda!18101 () Bool)

(assert (= b_lambda!18089 (or (and start!96824 b_free!23173) b_lambda!18101)))

(declare-fun b_lambda!18103 () Bool)

(assert (= b_lambda!18087 (or (and start!96824 b_free!23173) b_lambda!18103)))

(declare-fun b_lambda!18105 () Bool)

(assert (= b_lambda!18099 (or (and start!96824 b_free!23173) b_lambda!18105)))

(declare-fun b_lambda!18107 () Bool)

(assert (= b_lambda!18091 (or (and start!96824 b_free!23173) b_lambda!18107)))

(declare-fun b_lambda!18109 () Bool)

(assert (= b_lambda!18093 (or (and start!96824 b_free!23173) b_lambda!18109)))

(declare-fun b_lambda!18111 () Bool)

(assert (= b_lambda!18097 (or (and start!96824 b_free!23173) b_lambda!18111)))

(declare-fun b_lambda!18113 () Bool)

(assert (= b_lambda!18095 (or (and start!96824 b_free!23173) b_lambda!18113)))

(check-sat (not b!1101504) (not b!1101610) (not b!1101577) (not b!1101523) (not b!1101607) (not b!1101512) (not b_lambda!18085) (not b!1101572) (not bm!46172) (not b!1101431) (not bm!46155) (not b!1101580) (not b!1101590) (not b!1101441) (not mapNonEmpty!42631) tp_is_empty!27223 (not b!1101592) (not bm!46193) (not bm!46173) (not b!1101582) (not b!1101534) (not b!1101611) (not b!1101591) (not b!1101576) (not b!1101578) (not b!1101618) (not b_next!23173) (not b!1101543) (not b!1101530) (not bm!46197) (not b_lambda!18111) (not b!1101440) (not b!1101430) (not bm!46196) (not b!1101594) (not b!1101609) (not b!1101451) (not d!130551) (not bm!46174) (not d!130541) (not bm!46188) (not b!1101589) (not b_lambda!18109) (not b!1101521) b_and!37133 (not b!1101444) (not b!1101617) (not b!1101515) (not bm!46179) (not b!1101525) (not bm!46183) (not d!130543) (not b_lambda!18103) (not b!1101500) (not d!130527) (not b!1101502) (not b!1101570) (not b!1101573) (not b!1101588) (not b!1101608) (not d!130521) (not d!130539) (not b!1101579) (not b!1101494) (not b!1101445) (not bm!46176) (not bm!46181) (not bm!46180) (not b!1101593) (not bm!46189) (not b!1101584) (not b_lambda!18113) (not d!130545) (not bm!46198) (not bm!46192) (not d!130547) (not b_lambda!18107) (not d!130537) (not b_lambda!18105) (not b!1101513) (not b!1101503) (not b_lambda!18101) (not b!1101585) (not b!1101616) (not d!130549) (not b!1101524) (not b!1101533) (not b!1101509))
(check-sat b_and!37133 (not b_next!23173))
