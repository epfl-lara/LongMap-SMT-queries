; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96754 () Bool)

(assert start!96754)

(declare-fun b_free!23155 () Bool)

(declare-fun b_next!23155 () Bool)

(assert (=> start!96754 (= b_free!23155 (not b_next!23155))))

(declare-fun tp!81413 () Bool)

(declare-fun b_and!37045 () Bool)

(assert (=> start!96754 (= tp!81413 b_and!37045)))

(declare-fun b!1100535 () Bool)

(declare-fun e!628142 () Bool)

(declare-fun e!628145 () Bool)

(assert (=> b!1100535 (= e!628142 (not e!628145))))

(declare-fun res!734432 () Bool)

(assert (=> b!1100535 (=> res!734432 e!628145)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100535 (= res!734432 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41401 0))(
  ( (V!41402 (val!13659 Int)) )
))
(declare-fun minValue!831 () V!41401)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!71234 0))(
  ( (array!71235 (arr!34282 (Array (_ BitVec 32) (_ BitVec 64))) (size!34820 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71234)

(declare-datatypes ((ValueCell!12893 0))(
  ( (ValueCellFull!12893 (v!16286 V!41401)) (EmptyCell!12893) )
))
(declare-datatypes ((array!71236 0))(
  ( (array!71237 (arr!34283 (Array (_ BitVec 32) ValueCell!12893)) (size!34821 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71236)

(declare-fun zeroValue!831 () V!41401)

(declare-datatypes ((tuple2!17426 0))(
  ( (tuple2!17427 (_1!8724 (_ BitVec 64)) (_2!8724 V!41401)) )
))
(declare-datatypes ((List!24017 0))(
  ( (Nil!24014) (Cons!24013 (h!25222 tuple2!17426) (t!34209 List!24017)) )
))
(declare-datatypes ((ListLongMap!15395 0))(
  ( (ListLongMap!15396 (toList!7713 List!24017)) )
))
(declare-fun lt!493073 () ListLongMap!15395)

(declare-fun getCurrentListMap!4330 (array!71234 array!71236 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) Int) ListLongMap!15395)

(assert (=> b!1100535 (= lt!493073 (getCurrentListMap!4330 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493078 () ListLongMap!15395)

(declare-fun lt!493076 () array!71234)

(declare-fun lt!493075 () array!71236)

(assert (=> b!1100535 (= lt!493078 (getCurrentListMap!4330 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493077 () ListLongMap!15395)

(declare-fun lt!493072 () ListLongMap!15395)

(assert (=> b!1100535 (and (= lt!493077 lt!493072) (= lt!493072 lt!493077))))

(declare-fun lt!493074 () ListLongMap!15395)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!945 (ListLongMap!15395 (_ BitVec 64)) ListLongMap!15395)

(assert (=> b!1100535 (= lt!493072 (-!945 lt!493074 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36011 0))(
  ( (Unit!36012) )
))
(declare-fun lt!493071 () Unit!36011)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 (array!71234 array!71236 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36011)

(assert (=> b!1100535 (= lt!493071 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4237 (array!71234 array!71236 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) Int) ListLongMap!15395)

(assert (=> b!1100535 (= lt!493077 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2306 (Int (_ BitVec 64)) V!41401)

(assert (=> b!1100535 (= lt!493075 (array!71237 (store (arr!34283 _values!874) i!650 (ValueCellFull!12893 (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34821 _values!874)))))

(assert (=> b!1100535 (= lt!493074 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100535 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493070 () Unit!36011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71234 (_ BitVec 64) (_ BitVec 32)) Unit!36011)

(assert (=> b!1100535 (= lt!493070 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42589 () Bool)

(declare-fun mapRes!42589 () Bool)

(assert (=> mapIsEmpty!42589 mapRes!42589))

(declare-fun b!1100537 () Bool)

(declare-fun res!734430 () Bool)

(declare-fun e!628144 () Bool)

(assert (=> b!1100537 (=> (not res!734430) (not e!628144))))

(assert (=> b!1100537 (= res!734430 (= (select (arr!34282 _keys!1070) i!650) k0!904))))

(declare-fun b!1100538 () Bool)

(declare-fun +!3423 (ListLongMap!15395 tuple2!17426) ListLongMap!15395)

(assert (=> b!1100538 (= e!628145 (= lt!493078 (+!3423 lt!493077 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100539 () Bool)

(declare-fun res!734429 () Bool)

(assert (=> b!1100539 (=> (not res!734429) (not e!628144))))

(assert (=> b!1100539 (= res!734429 (and (= (size!34821 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34820 _keys!1070) (size!34821 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100540 () Bool)

(declare-fun res!734438 () Bool)

(assert (=> b!1100540 (=> (not res!734438) (not e!628144))))

(assert (=> b!1100540 (= res!734438 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34820 _keys!1070))))))

(declare-fun b!1100536 () Bool)

(assert (=> b!1100536 (= e!628144 e!628142)))

(declare-fun res!734437 () Bool)

(assert (=> b!1100536 (=> (not res!734437) (not e!628142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71234 (_ BitVec 32)) Bool)

(assert (=> b!1100536 (= res!734437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493076 mask!1414))))

(assert (=> b!1100536 (= lt!493076 (array!71235 (store (arr!34282 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34820 _keys!1070)))))

(declare-fun res!734436 () Bool)

(assert (=> start!96754 (=> (not res!734436) (not e!628144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96754 (= res!734436 (validMask!0 mask!1414))))

(assert (=> start!96754 e!628144))

(assert (=> start!96754 tp!81413))

(assert (=> start!96754 true))

(declare-fun tp_is_empty!27205 () Bool)

(assert (=> start!96754 tp_is_empty!27205))

(declare-fun array_inv!26438 (array!71234) Bool)

(assert (=> start!96754 (array_inv!26438 _keys!1070)))

(declare-fun e!628143 () Bool)

(declare-fun array_inv!26439 (array!71236) Bool)

(assert (=> start!96754 (and (array_inv!26439 _values!874) e!628143)))

(declare-fun b!1100541 () Bool)

(declare-fun res!734431 () Bool)

(assert (=> b!1100541 (=> (not res!734431) (not e!628144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100541 (= res!734431 (validKeyInArray!0 k0!904))))

(declare-fun b!1100542 () Bool)

(declare-fun e!628140 () Bool)

(assert (=> b!1100542 (= e!628143 (and e!628140 mapRes!42589))))

(declare-fun condMapEmpty!42589 () Bool)

(declare-fun mapDefault!42589 () ValueCell!12893)

(assert (=> b!1100542 (= condMapEmpty!42589 (= (arr!34283 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12893)) mapDefault!42589)))))

(declare-fun b!1100543 () Bool)

(declare-fun res!734435 () Bool)

(assert (=> b!1100543 (=> (not res!734435) (not e!628144))))

(declare-datatypes ((List!24018 0))(
  ( (Nil!24015) (Cons!24014 (h!25223 (_ BitVec 64)) (t!34210 List!24018)) )
))
(declare-fun arrayNoDuplicates!0 (array!71234 (_ BitVec 32) List!24018) Bool)

(assert (=> b!1100543 (= res!734435 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24015))))

(declare-fun mapNonEmpty!42589 () Bool)

(declare-fun tp!81412 () Bool)

(declare-fun e!628146 () Bool)

(assert (=> mapNonEmpty!42589 (= mapRes!42589 (and tp!81412 e!628146))))

(declare-fun mapValue!42589 () ValueCell!12893)

(declare-fun mapKey!42589 () (_ BitVec 32))

(declare-fun mapRest!42589 () (Array (_ BitVec 32) ValueCell!12893))

(assert (=> mapNonEmpty!42589 (= (arr!34283 _values!874) (store mapRest!42589 mapKey!42589 mapValue!42589))))

(declare-fun b!1100544 () Bool)

(declare-fun res!734434 () Bool)

(assert (=> b!1100544 (=> (not res!734434) (not e!628142))))

(assert (=> b!1100544 (= res!734434 (arrayNoDuplicates!0 lt!493076 #b00000000000000000000000000000000 Nil!24015))))

(declare-fun b!1100545 () Bool)

(declare-fun res!734433 () Bool)

(assert (=> b!1100545 (=> (not res!734433) (not e!628144))))

(assert (=> b!1100545 (= res!734433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100546 () Bool)

(assert (=> b!1100546 (= e!628140 tp_is_empty!27205)))

(declare-fun b!1100547 () Bool)

(assert (=> b!1100547 (= e!628146 tp_is_empty!27205)))

(assert (= (and start!96754 res!734436) b!1100539))

(assert (= (and b!1100539 res!734429) b!1100545))

(assert (= (and b!1100545 res!734433) b!1100543))

(assert (= (and b!1100543 res!734435) b!1100540))

(assert (= (and b!1100540 res!734438) b!1100541))

(assert (= (and b!1100541 res!734431) b!1100537))

(assert (= (and b!1100537 res!734430) b!1100536))

(assert (= (and b!1100536 res!734437) b!1100544))

(assert (= (and b!1100544 res!734434) b!1100535))

(assert (= (and b!1100535 (not res!734432)) b!1100538))

(assert (= (and b!1100542 condMapEmpty!42589) mapIsEmpty!42589))

(assert (= (and b!1100542 (not condMapEmpty!42589)) mapNonEmpty!42589))

(get-info :version)

(assert (= (and mapNonEmpty!42589 ((_ is ValueCellFull!12893) mapValue!42589)) b!1100547))

(assert (= (and b!1100542 ((_ is ValueCellFull!12893) mapDefault!42589)) b!1100546))

(assert (= start!96754 b!1100542))

(declare-fun b_lambda!18001 () Bool)

(assert (=> (not b_lambda!18001) (not b!1100535)))

(declare-fun t!34208 () Bool)

(declare-fun tb!8013 () Bool)

(assert (=> (and start!96754 (= defaultEntry!882 defaultEntry!882) t!34208) tb!8013))

(declare-fun result!16571 () Bool)

(assert (=> tb!8013 (= result!16571 tp_is_empty!27205)))

(assert (=> b!1100535 t!34208))

(declare-fun b_and!37047 () Bool)

(assert (= b_and!37045 (and (=> t!34208 result!16571) b_and!37047)))

(declare-fun m!1020185 () Bool)

(assert (=> b!1100536 m!1020185))

(declare-fun m!1020187 () Bool)

(assert (=> b!1100536 m!1020187))

(declare-fun m!1020189 () Bool)

(assert (=> b!1100543 m!1020189))

(declare-fun m!1020191 () Bool)

(assert (=> b!1100537 m!1020191))

(declare-fun m!1020193 () Bool)

(assert (=> mapNonEmpty!42589 m!1020193))

(declare-fun m!1020195 () Bool)

(assert (=> start!96754 m!1020195))

(declare-fun m!1020197 () Bool)

(assert (=> start!96754 m!1020197))

(declare-fun m!1020199 () Bool)

(assert (=> start!96754 m!1020199))

(declare-fun m!1020201 () Bool)

(assert (=> b!1100545 m!1020201))

(declare-fun m!1020203 () Bool)

(assert (=> b!1100538 m!1020203))

(declare-fun m!1020205 () Bool)

(assert (=> b!1100544 m!1020205))

(declare-fun m!1020207 () Bool)

(assert (=> b!1100541 m!1020207))

(declare-fun m!1020209 () Bool)

(assert (=> b!1100535 m!1020209))

(declare-fun m!1020211 () Bool)

(assert (=> b!1100535 m!1020211))

(declare-fun m!1020213 () Bool)

(assert (=> b!1100535 m!1020213))

(declare-fun m!1020215 () Bool)

(assert (=> b!1100535 m!1020215))

(declare-fun m!1020217 () Bool)

(assert (=> b!1100535 m!1020217))

(declare-fun m!1020219 () Bool)

(assert (=> b!1100535 m!1020219))

(declare-fun m!1020221 () Bool)

(assert (=> b!1100535 m!1020221))

(declare-fun m!1020223 () Bool)

(assert (=> b!1100535 m!1020223))

(declare-fun m!1020225 () Bool)

(assert (=> b!1100535 m!1020225))

(declare-fun m!1020227 () Bool)

(assert (=> b!1100535 m!1020227))

(check-sat (not b!1100544) (not mapNonEmpty!42589) (not b!1100541) b_and!37047 (not b_next!23155) (not b!1100543) (not b_lambda!18001) tp_is_empty!27205 (not b!1100545) (not b!1100536) (not start!96754) (not b!1100538) (not b!1100535))
(check-sat b_and!37047 (not b_next!23155))
(get-model)

(declare-fun b_lambda!18007 () Bool)

(assert (= b_lambda!18001 (or (and start!96754 b_free!23155) b_lambda!18007)))

(check-sat (not b!1100544) (not mapNonEmpty!42589) (not b!1100541) (not b_next!23155) (not b!1100543) tp_is_empty!27205 (not b!1100545) b_and!37047 (not b_lambda!18007) (not b!1100536) (not start!96754) (not b!1100538) (not b!1100535))
(check-sat b_and!37047 (not b_next!23155))
(get-model)

(declare-fun b!1100640 () Bool)

(declare-fun e!628197 () Bool)

(declare-fun e!628195 () Bool)

(assert (=> b!1100640 (= e!628197 e!628195)))

(declare-fun lt!493140 () (_ BitVec 64))

(assert (=> b!1100640 (= lt!493140 (select (arr!34282 lt!493076) #b00000000000000000000000000000000))))

(declare-fun lt!493141 () Unit!36011)

(assert (=> b!1100640 (= lt!493141 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493076 lt!493140 #b00000000000000000000000000000000))))

(assert (=> b!1100640 (arrayContainsKey!0 lt!493076 lt!493140 #b00000000000000000000000000000000)))

(declare-fun lt!493139 () Unit!36011)

(assert (=> b!1100640 (= lt!493139 lt!493141)))

(declare-fun res!734503 () Bool)

(declare-datatypes ((SeekEntryResult!9912 0))(
  ( (MissingZero!9912 (index!42019 (_ BitVec 32))) (Found!9912 (index!42020 (_ BitVec 32))) (Intermediate!9912 (undefined!10724 Bool) (index!42021 (_ BitVec 32)) (x!99000 (_ BitVec 32))) (Undefined!9912) (MissingVacant!9912 (index!42022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71234 (_ BitVec 32)) SeekEntryResult!9912)

(assert (=> b!1100640 (= res!734503 (= (seekEntryOrOpen!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000) lt!493076 mask!1414) (Found!9912 #b00000000000000000000000000000000)))))

(assert (=> b!1100640 (=> (not res!734503) (not e!628195))))

(declare-fun b!1100641 () Bool)

(declare-fun call!46066 () Bool)

(assert (=> b!1100641 (= e!628197 call!46066)))

(declare-fun b!1100642 () Bool)

(assert (=> b!1100642 (= e!628195 call!46066)))

(declare-fun d!130443 () Bool)

(declare-fun res!734504 () Bool)

(declare-fun e!628196 () Bool)

(assert (=> d!130443 (=> res!734504 e!628196)))

(assert (=> d!130443 (= res!734504 (bvsge #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(assert (=> d!130443 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493076 mask!1414) e!628196)))

(declare-fun bm!46063 () Bool)

(assert (=> bm!46063 (= call!46066 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493076 mask!1414))))

(declare-fun b!1100643 () Bool)

(assert (=> b!1100643 (= e!628196 e!628197)))

(declare-fun c!108679 () Bool)

(assert (=> b!1100643 (= c!108679 (validKeyInArray!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(assert (= (and d!130443 (not res!734504)) b!1100643))

(assert (= (and b!1100643 c!108679) b!1100640))

(assert (= (and b!1100643 (not c!108679)) b!1100641))

(assert (= (and b!1100640 res!734503) b!1100642))

(assert (= (or b!1100642 b!1100641) bm!46063))

(declare-fun m!1020317 () Bool)

(assert (=> b!1100640 m!1020317))

(declare-fun m!1020319 () Bool)

(assert (=> b!1100640 m!1020319))

(declare-fun m!1020321 () Bool)

(assert (=> b!1100640 m!1020321))

(assert (=> b!1100640 m!1020317))

(declare-fun m!1020323 () Bool)

(assert (=> b!1100640 m!1020323))

(declare-fun m!1020325 () Bool)

(assert (=> bm!46063 m!1020325))

(assert (=> b!1100643 m!1020317))

(assert (=> b!1100643 m!1020317))

(declare-fun m!1020327 () Bool)

(assert (=> b!1100643 m!1020327))

(assert (=> b!1100536 d!130443))

(declare-fun b!1100644 () Bool)

(declare-fun e!628200 () Bool)

(declare-fun e!628198 () Bool)

(assert (=> b!1100644 (= e!628200 e!628198)))

(declare-fun lt!493143 () (_ BitVec 64))

(assert (=> b!1100644 (= lt!493143 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493144 () Unit!36011)

(assert (=> b!1100644 (= lt!493144 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493143 #b00000000000000000000000000000000))))

(assert (=> b!1100644 (arrayContainsKey!0 _keys!1070 lt!493143 #b00000000000000000000000000000000)))

(declare-fun lt!493142 () Unit!36011)

(assert (=> b!1100644 (= lt!493142 lt!493144)))

(declare-fun res!734505 () Bool)

(assert (=> b!1100644 (= res!734505 (= (seekEntryOrOpen!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9912 #b00000000000000000000000000000000)))))

(assert (=> b!1100644 (=> (not res!734505) (not e!628198))))

(declare-fun b!1100645 () Bool)

(declare-fun call!46067 () Bool)

(assert (=> b!1100645 (= e!628200 call!46067)))

(declare-fun b!1100646 () Bool)

(assert (=> b!1100646 (= e!628198 call!46067)))

(declare-fun d!130445 () Bool)

(declare-fun res!734506 () Bool)

(declare-fun e!628199 () Bool)

(assert (=> d!130445 (=> res!734506 e!628199)))

(assert (=> d!130445 (= res!734506 (bvsge #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(assert (=> d!130445 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628199)))

(declare-fun bm!46064 () Bool)

(assert (=> bm!46064 (= call!46067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1100647 () Bool)

(assert (=> b!1100647 (= e!628199 e!628200)))

(declare-fun c!108680 () Bool)

(assert (=> b!1100647 (= c!108680 (validKeyInArray!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130445 (not res!734506)) b!1100647))

(assert (= (and b!1100647 c!108680) b!1100644))

(assert (= (and b!1100647 (not c!108680)) b!1100645))

(assert (= (and b!1100644 res!734505) b!1100646))

(assert (= (or b!1100646 b!1100645) bm!46064))

(declare-fun m!1020329 () Bool)

(assert (=> b!1100644 m!1020329))

(declare-fun m!1020331 () Bool)

(assert (=> b!1100644 m!1020331))

(declare-fun m!1020333 () Bool)

(assert (=> b!1100644 m!1020333))

(assert (=> b!1100644 m!1020329))

(declare-fun m!1020335 () Bool)

(assert (=> b!1100644 m!1020335))

(declare-fun m!1020337 () Bool)

(assert (=> bm!46064 m!1020337))

(assert (=> b!1100647 m!1020329))

(assert (=> b!1100647 m!1020329))

(declare-fun m!1020339 () Bool)

(assert (=> b!1100647 m!1020339))

(assert (=> b!1100545 d!130445))

(declare-fun d!130447 () Bool)

(assert (=> d!130447 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100541 d!130447))

(declare-fun d!130449 () Bool)

(declare-fun res!734511 () Bool)

(declare-fun e!628205 () Bool)

(assert (=> d!130449 (=> res!734511 e!628205)))

(assert (=> d!130449 (= res!734511 (= (select (arr!34282 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130449 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628205)))

(declare-fun b!1100652 () Bool)

(declare-fun e!628206 () Bool)

(assert (=> b!1100652 (= e!628205 e!628206)))

(declare-fun res!734512 () Bool)

(assert (=> b!1100652 (=> (not res!734512) (not e!628206))))

(assert (=> b!1100652 (= res!734512 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34820 _keys!1070)))))

(declare-fun b!1100653 () Bool)

(assert (=> b!1100653 (= e!628206 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130449 (not res!734511)) b!1100652))

(assert (= (and b!1100652 res!734512) b!1100653))

(assert (=> d!130449 m!1020329))

(declare-fun m!1020341 () Bool)

(assert (=> b!1100653 m!1020341))

(assert (=> b!1100535 d!130449))

(declare-fun b!1100696 () Bool)

(declare-fun e!628243 () Bool)

(declare-fun e!628234 () Bool)

(assert (=> b!1100696 (= e!628243 e!628234)))

(declare-fun res!734537 () Bool)

(declare-fun call!46086 () Bool)

(assert (=> b!1100696 (= res!734537 call!46086)))

(assert (=> b!1100696 (=> (not res!734537) (not e!628234))))

(declare-fun bm!46079 () Bool)

(declare-fun call!46087 () ListLongMap!15395)

(assert (=> bm!46079 (= call!46087 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100697 () Bool)

(declare-fun e!628233 () Unit!36011)

(declare-fun lt!493201 () Unit!36011)

(assert (=> b!1100697 (= e!628233 lt!493201)))

(declare-fun lt!493199 () ListLongMap!15395)

(assert (=> b!1100697 (= lt!493199 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493193 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493191 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493191 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493209 () Unit!36011)

(declare-fun addStillContains!656 (ListLongMap!15395 (_ BitVec 64) V!41401 (_ BitVec 64)) Unit!36011)

(assert (=> b!1100697 (= lt!493209 (addStillContains!656 lt!493199 lt!493193 zeroValue!831 lt!493191))))

(declare-fun contains!6368 (ListLongMap!15395 (_ BitVec 64)) Bool)

(assert (=> b!1100697 (contains!6368 (+!3423 lt!493199 (tuple2!17427 lt!493193 zeroValue!831)) lt!493191)))

(declare-fun lt!493195 () Unit!36011)

(assert (=> b!1100697 (= lt!493195 lt!493209)))

(declare-fun lt!493205 () ListLongMap!15395)

(assert (=> b!1100697 (= lt!493205 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493210 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493210 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493202 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493202 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493194 () Unit!36011)

(declare-fun addApplyDifferent!512 (ListLongMap!15395 (_ BitVec 64) V!41401 (_ BitVec 64)) Unit!36011)

(assert (=> b!1100697 (= lt!493194 (addApplyDifferent!512 lt!493205 lt!493210 minValue!831 lt!493202))))

(declare-fun apply!943 (ListLongMap!15395 (_ BitVec 64)) V!41401)

(assert (=> b!1100697 (= (apply!943 (+!3423 lt!493205 (tuple2!17427 lt!493210 minValue!831)) lt!493202) (apply!943 lt!493205 lt!493202))))

(declare-fun lt!493203 () Unit!36011)

(assert (=> b!1100697 (= lt!493203 lt!493194)))

(declare-fun lt!493206 () ListLongMap!15395)

(assert (=> b!1100697 (= lt!493206 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493196 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493196 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493204 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493204 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493200 () Unit!36011)

(assert (=> b!1100697 (= lt!493200 (addApplyDifferent!512 lt!493206 lt!493196 zeroValue!831 lt!493204))))

(assert (=> b!1100697 (= (apply!943 (+!3423 lt!493206 (tuple2!17427 lt!493196 zeroValue!831)) lt!493204) (apply!943 lt!493206 lt!493204))))

(declare-fun lt!493198 () Unit!36011)

(assert (=> b!1100697 (= lt!493198 lt!493200)))

(declare-fun lt!493192 () ListLongMap!15395)

(assert (=> b!1100697 (= lt!493192 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493190 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493208 () (_ BitVec 64))

(assert (=> b!1100697 (= lt!493208 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100697 (= lt!493201 (addApplyDifferent!512 lt!493192 lt!493190 minValue!831 lt!493208))))

(assert (=> b!1100697 (= (apply!943 (+!3423 lt!493192 (tuple2!17427 lt!493190 minValue!831)) lt!493208) (apply!943 lt!493192 lt!493208))))

(declare-fun b!1100698 () Bool)

(declare-fun e!628245 () Bool)

(assert (=> b!1100698 (= e!628245 (validKeyInArray!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100699 () Bool)

(declare-fun lt!493207 () ListLongMap!15395)

(assert (=> b!1100699 (= e!628234 (= (apply!943 lt!493207 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46080 () Bool)

(declare-fun call!46085 () ListLongMap!15395)

(assert (=> bm!46080 (= call!46085 call!46087)))

(declare-fun b!1100700 () Bool)

(declare-fun e!628242 () Bool)

(declare-fun call!46088 () Bool)

(assert (=> b!1100700 (= e!628242 (not call!46088))))

(declare-fun bm!46081 () Bool)

(declare-fun c!108698 () Bool)

(declare-fun call!46084 () ListLongMap!15395)

(declare-fun c!108695 () Bool)

(declare-fun call!46083 () ListLongMap!15395)

(assert (=> bm!46081 (= call!46083 (+!3423 (ite c!108698 call!46087 (ite c!108695 call!46085 call!46084)) (ite (or c!108698 c!108695) (tuple2!17427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun d!130451 () Bool)

(declare-fun e!628237 () Bool)

(assert (=> d!130451 e!628237))

(declare-fun res!734532 () Bool)

(assert (=> d!130451 (=> (not res!734532) (not e!628237))))

(assert (=> d!130451 (= res!734532 (or (bvsge #b00000000000000000000000000000000 (size!34820 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))))

(declare-fun lt!493189 () ListLongMap!15395)

(assert (=> d!130451 (= lt!493207 lt!493189)))

(declare-fun lt!493197 () Unit!36011)

(assert (=> d!130451 (= lt!493197 e!628233)))

(declare-fun c!108694 () Bool)

(assert (=> d!130451 (= c!108694 e!628245)))

(declare-fun res!734538 () Bool)

(assert (=> d!130451 (=> (not res!734538) (not e!628245))))

(assert (=> d!130451 (= res!734538 (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(declare-fun e!628238 () ListLongMap!15395)

(assert (=> d!130451 (= lt!493189 e!628238)))

(assert (=> d!130451 (= c!108698 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130451 (validMask!0 mask!1414)))

(assert (=> d!130451 (= (getCurrentListMap!4330 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493207)))

(declare-fun b!1100701 () Bool)

(declare-fun e!628236 () Bool)

(declare-fun e!628244 () Bool)

(assert (=> b!1100701 (= e!628236 e!628244)))

(declare-fun res!734536 () Bool)

(assert (=> b!1100701 (=> (not res!734536) (not e!628244))))

(assert (=> b!1100701 (= res!734536 (contains!6368 lt!493207 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100701 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(declare-fun bm!46082 () Bool)

(assert (=> bm!46082 (= call!46088 (contains!6368 lt!493207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100702 () Bool)

(declare-fun e!628239 () ListLongMap!15395)

(assert (=> b!1100702 (= e!628239 call!46084)))

(declare-fun b!1100703 () Bool)

(declare-fun res!734535 () Bool)

(assert (=> b!1100703 (=> (not res!734535) (not e!628237))))

(assert (=> b!1100703 (= res!734535 e!628242)))

(declare-fun c!108693 () Bool)

(assert (=> b!1100703 (= c!108693 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1100704 () Bool)

(assert (=> b!1100704 (= e!628237 e!628243)))

(declare-fun c!108697 () Bool)

(assert (=> b!1100704 (= c!108697 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100705 () Bool)

(assert (=> b!1100705 (= e!628243 (not call!46086))))

(declare-fun bm!46083 () Bool)

(assert (=> bm!46083 (= call!46086 (contains!6368 lt!493207 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100706 () Bool)

(declare-fun e!628241 () ListLongMap!15395)

(declare-fun call!46082 () ListLongMap!15395)

(assert (=> b!1100706 (= e!628241 call!46082)))

(declare-fun bm!46084 () Bool)

(assert (=> bm!46084 (= call!46084 call!46085)))

(declare-fun b!1100707 () Bool)

(declare-fun e!628240 () Bool)

(assert (=> b!1100707 (= e!628240 (validKeyInArray!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100708 () Bool)

(declare-fun e!628235 () Bool)

(assert (=> b!1100708 (= e!628235 (= (apply!943 lt!493207 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100709 () Bool)

(assert (=> b!1100709 (= e!628239 call!46082)))

(declare-fun bm!46085 () Bool)

(assert (=> bm!46085 (= call!46082 call!46083)))

(declare-fun b!1100710 () Bool)

(declare-fun c!108696 () Bool)

(assert (=> b!1100710 (= c!108696 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100710 (= e!628241 e!628239)))

(declare-fun b!1100711 () Bool)

(assert (=> b!1100711 (= e!628238 (+!3423 call!46083 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1100712 () Bool)

(declare-fun res!734539 () Bool)

(assert (=> b!1100712 (=> (not res!734539) (not e!628237))))

(assert (=> b!1100712 (= res!734539 e!628236)))

(declare-fun res!734534 () Bool)

(assert (=> b!1100712 (=> res!734534 e!628236)))

(assert (=> b!1100712 (= res!734534 (not e!628240))))

(declare-fun res!734531 () Bool)

(assert (=> b!1100712 (=> (not res!734531) (not e!628240))))

(assert (=> b!1100712 (= res!734531 (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(declare-fun b!1100713 () Bool)

(declare-fun get!17643 (ValueCell!12893 V!41401) V!41401)

(assert (=> b!1100713 (= e!628244 (= (apply!943 lt!493207 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)) (get!17643 (select (arr!34283 _values!874) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34821 _values!874)))))

(assert (=> b!1100713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(declare-fun b!1100714 () Bool)

(assert (=> b!1100714 (= e!628238 e!628241)))

(assert (=> b!1100714 (= c!108695 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100715 () Bool)

(declare-fun Unit!36015 () Unit!36011)

(assert (=> b!1100715 (= e!628233 Unit!36015)))

(declare-fun b!1100716 () Bool)

(assert (=> b!1100716 (= e!628242 e!628235)))

(declare-fun res!734533 () Bool)

(assert (=> b!1100716 (= res!734533 call!46088)))

(assert (=> b!1100716 (=> (not res!734533) (not e!628235))))

(assert (= (and d!130451 c!108698) b!1100711))

(assert (= (and d!130451 (not c!108698)) b!1100714))

(assert (= (and b!1100714 c!108695) b!1100706))

(assert (= (and b!1100714 (not c!108695)) b!1100710))

(assert (= (and b!1100710 c!108696) b!1100709))

(assert (= (and b!1100710 (not c!108696)) b!1100702))

(assert (= (or b!1100709 b!1100702) bm!46084))

(assert (= (or b!1100706 bm!46084) bm!46080))

(assert (= (or b!1100706 b!1100709) bm!46085))

(assert (= (or b!1100711 bm!46080) bm!46079))

(assert (= (or b!1100711 bm!46085) bm!46081))

(assert (= (and d!130451 res!734538) b!1100698))

(assert (= (and d!130451 c!108694) b!1100697))

(assert (= (and d!130451 (not c!108694)) b!1100715))

(assert (= (and d!130451 res!734532) b!1100712))

(assert (= (and b!1100712 res!734531) b!1100707))

(assert (= (and b!1100712 (not res!734534)) b!1100701))

(assert (= (and b!1100701 res!734536) b!1100713))

(assert (= (and b!1100712 res!734539) b!1100703))

(assert (= (and b!1100703 c!108693) b!1100716))

(assert (= (and b!1100703 (not c!108693)) b!1100700))

(assert (= (and b!1100716 res!734533) b!1100708))

(assert (= (or b!1100716 b!1100700) bm!46082))

(assert (= (and b!1100703 res!734535) b!1100704))

(assert (= (and b!1100704 c!108697) b!1100696))

(assert (= (and b!1100704 (not c!108697)) b!1100705))

(assert (= (and b!1100696 res!734537) b!1100699))

(assert (= (or b!1100696 b!1100705) bm!46083))

(declare-fun b_lambda!18009 () Bool)

(assert (=> (not b_lambda!18009) (not b!1100713)))

(assert (=> b!1100713 t!34208))

(declare-fun b_and!37057 () Bool)

(assert (= b_and!37047 (and (=> t!34208 result!16571) b_and!37057)))

(declare-fun m!1020343 () Bool)

(assert (=> b!1100711 m!1020343))

(declare-fun m!1020345 () Bool)

(assert (=> bm!46082 m!1020345))

(assert (=> b!1100701 m!1020329))

(assert (=> b!1100701 m!1020329))

(declare-fun m!1020347 () Bool)

(assert (=> b!1100701 m!1020347))

(assert (=> d!130451 m!1020195))

(declare-fun m!1020349 () Bool)

(assert (=> bm!46081 m!1020349))

(declare-fun m!1020351 () Bool)

(assert (=> b!1100699 m!1020351))

(assert (=> bm!46079 m!1020223))

(assert (=> b!1100697 m!1020329))

(declare-fun m!1020353 () Bool)

(assert (=> b!1100697 m!1020353))

(declare-fun m!1020355 () Bool)

(assert (=> b!1100697 m!1020355))

(declare-fun m!1020357 () Bool)

(assert (=> b!1100697 m!1020357))

(declare-fun m!1020359 () Bool)

(assert (=> b!1100697 m!1020359))

(declare-fun m!1020361 () Bool)

(assert (=> b!1100697 m!1020361))

(declare-fun m!1020363 () Bool)

(assert (=> b!1100697 m!1020363))

(assert (=> b!1100697 m!1020359))

(declare-fun m!1020365 () Bool)

(assert (=> b!1100697 m!1020365))

(declare-fun m!1020367 () Bool)

(assert (=> b!1100697 m!1020367))

(declare-fun m!1020369 () Bool)

(assert (=> b!1100697 m!1020369))

(declare-fun m!1020371 () Bool)

(assert (=> b!1100697 m!1020371))

(assert (=> b!1100697 m!1020353))

(declare-fun m!1020373 () Bool)

(assert (=> b!1100697 m!1020373))

(declare-fun m!1020375 () Bool)

(assert (=> b!1100697 m!1020375))

(declare-fun m!1020377 () Bool)

(assert (=> b!1100697 m!1020377))

(assert (=> b!1100697 m!1020369))

(declare-fun m!1020379 () Bool)

(assert (=> b!1100697 m!1020379))

(assert (=> b!1100697 m!1020363))

(declare-fun m!1020381 () Bool)

(assert (=> b!1100697 m!1020381))

(assert (=> b!1100697 m!1020223))

(declare-fun m!1020383 () Bool)

(assert (=> b!1100708 m!1020383))

(assert (=> b!1100698 m!1020329))

(assert (=> b!1100698 m!1020329))

(assert (=> b!1100698 m!1020339))

(assert (=> b!1100713 m!1020329))

(declare-fun m!1020385 () Bool)

(assert (=> b!1100713 m!1020385))

(assert (=> b!1100713 m!1020209))

(declare-fun m!1020387 () Bool)

(assert (=> b!1100713 m!1020387))

(assert (=> b!1100713 m!1020209))

(assert (=> b!1100713 m!1020329))

(declare-fun m!1020389 () Bool)

(assert (=> b!1100713 m!1020389))

(assert (=> b!1100713 m!1020385))

(declare-fun m!1020391 () Bool)

(assert (=> bm!46083 m!1020391))

(assert (=> b!1100707 m!1020329))

(assert (=> b!1100707 m!1020329))

(assert (=> b!1100707 m!1020339))

(assert (=> b!1100535 d!130451))

(declare-fun b!1100717 () Bool)

(declare-fun e!628256 () Bool)

(declare-fun e!628247 () Bool)

(assert (=> b!1100717 (= e!628256 e!628247)))

(declare-fun res!734546 () Bool)

(declare-fun call!46093 () Bool)

(assert (=> b!1100717 (= res!734546 call!46093)))

(assert (=> b!1100717 (=> (not res!734546) (not e!628247))))

(declare-fun call!46094 () ListLongMap!15395)

(declare-fun bm!46086 () Bool)

(assert (=> bm!46086 (= call!46094 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100718 () Bool)

(declare-fun e!628246 () Unit!36011)

(declare-fun lt!493223 () Unit!36011)

(assert (=> b!1100718 (= e!628246 lt!493223)))

(declare-fun lt!493221 () ListLongMap!15395)

(assert (=> b!1100718 (= lt!493221 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493215 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493213 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493213 (select (arr!34282 lt!493076) #b00000000000000000000000000000000))))

(declare-fun lt!493231 () Unit!36011)

(assert (=> b!1100718 (= lt!493231 (addStillContains!656 lt!493221 lt!493215 zeroValue!831 lt!493213))))

(assert (=> b!1100718 (contains!6368 (+!3423 lt!493221 (tuple2!17427 lt!493215 zeroValue!831)) lt!493213)))

(declare-fun lt!493217 () Unit!36011)

(assert (=> b!1100718 (= lt!493217 lt!493231)))

(declare-fun lt!493227 () ListLongMap!15395)

(assert (=> b!1100718 (= lt!493227 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493232 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493224 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493224 (select (arr!34282 lt!493076) #b00000000000000000000000000000000))))

(declare-fun lt!493216 () Unit!36011)

(assert (=> b!1100718 (= lt!493216 (addApplyDifferent!512 lt!493227 lt!493232 minValue!831 lt!493224))))

(assert (=> b!1100718 (= (apply!943 (+!3423 lt!493227 (tuple2!17427 lt!493232 minValue!831)) lt!493224) (apply!943 lt!493227 lt!493224))))

(declare-fun lt!493225 () Unit!36011)

(assert (=> b!1100718 (= lt!493225 lt!493216)))

(declare-fun lt!493228 () ListLongMap!15395)

(assert (=> b!1100718 (= lt!493228 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493218 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493218 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493226 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493226 (select (arr!34282 lt!493076) #b00000000000000000000000000000000))))

(declare-fun lt!493222 () Unit!36011)

(assert (=> b!1100718 (= lt!493222 (addApplyDifferent!512 lt!493228 lt!493218 zeroValue!831 lt!493226))))

(assert (=> b!1100718 (= (apply!943 (+!3423 lt!493228 (tuple2!17427 lt!493218 zeroValue!831)) lt!493226) (apply!943 lt!493228 lt!493226))))

(declare-fun lt!493220 () Unit!36011)

(assert (=> b!1100718 (= lt!493220 lt!493222)))

(declare-fun lt!493214 () ListLongMap!15395)

(assert (=> b!1100718 (= lt!493214 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493212 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493212 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493230 () (_ BitVec 64))

(assert (=> b!1100718 (= lt!493230 (select (arr!34282 lt!493076) #b00000000000000000000000000000000))))

(assert (=> b!1100718 (= lt!493223 (addApplyDifferent!512 lt!493214 lt!493212 minValue!831 lt!493230))))

(assert (=> b!1100718 (= (apply!943 (+!3423 lt!493214 (tuple2!17427 lt!493212 minValue!831)) lt!493230) (apply!943 lt!493214 lt!493230))))

(declare-fun b!1100719 () Bool)

(declare-fun e!628258 () Bool)

(assert (=> b!1100719 (= e!628258 (validKeyInArray!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(declare-fun b!1100720 () Bool)

(declare-fun lt!493229 () ListLongMap!15395)

(assert (=> b!1100720 (= e!628247 (= (apply!943 lt!493229 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46087 () Bool)

(declare-fun call!46092 () ListLongMap!15395)

(assert (=> bm!46087 (= call!46092 call!46094)))

(declare-fun b!1100721 () Bool)

(declare-fun e!628255 () Bool)

(declare-fun call!46095 () Bool)

(assert (=> b!1100721 (= e!628255 (not call!46095))))

(declare-fun call!46091 () ListLongMap!15395)

(declare-fun call!46090 () ListLongMap!15395)

(declare-fun bm!46088 () Bool)

(declare-fun c!108701 () Bool)

(declare-fun c!108704 () Bool)

(assert (=> bm!46088 (= call!46090 (+!3423 (ite c!108704 call!46094 (ite c!108701 call!46092 call!46091)) (ite (or c!108704 c!108701) (tuple2!17427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun d!130453 () Bool)

(declare-fun e!628250 () Bool)

(assert (=> d!130453 e!628250))

(declare-fun res!734541 () Bool)

(assert (=> d!130453 (=> (not res!734541) (not e!628250))))

(assert (=> d!130453 (= res!734541 (or (bvsge #b00000000000000000000000000000000 (size!34820 lt!493076)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))))

(declare-fun lt!493211 () ListLongMap!15395)

(assert (=> d!130453 (= lt!493229 lt!493211)))

(declare-fun lt!493219 () Unit!36011)

(assert (=> d!130453 (= lt!493219 e!628246)))

(declare-fun c!108700 () Bool)

(assert (=> d!130453 (= c!108700 e!628258)))

(declare-fun res!734547 () Bool)

(assert (=> d!130453 (=> (not res!734547) (not e!628258))))

(assert (=> d!130453 (= res!734547 (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(declare-fun e!628251 () ListLongMap!15395)

(assert (=> d!130453 (= lt!493211 e!628251)))

(assert (=> d!130453 (= c!108704 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130453 (validMask!0 mask!1414)))

(assert (=> d!130453 (= (getCurrentListMap!4330 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493229)))

(declare-fun b!1100722 () Bool)

(declare-fun e!628249 () Bool)

(declare-fun e!628257 () Bool)

(assert (=> b!1100722 (= e!628249 e!628257)))

(declare-fun res!734545 () Bool)

(assert (=> b!1100722 (=> (not res!734545) (not e!628257))))

(assert (=> b!1100722 (= res!734545 (contains!6368 lt!493229 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(assert (=> b!1100722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(declare-fun bm!46089 () Bool)

(assert (=> bm!46089 (= call!46095 (contains!6368 lt!493229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100723 () Bool)

(declare-fun e!628252 () ListLongMap!15395)

(assert (=> b!1100723 (= e!628252 call!46091)))

(declare-fun b!1100724 () Bool)

(declare-fun res!734544 () Bool)

(assert (=> b!1100724 (=> (not res!734544) (not e!628250))))

(assert (=> b!1100724 (= res!734544 e!628255)))

(declare-fun c!108699 () Bool)

(assert (=> b!1100724 (= c!108699 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1100725 () Bool)

(assert (=> b!1100725 (= e!628250 e!628256)))

(declare-fun c!108703 () Bool)

(assert (=> b!1100725 (= c!108703 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100726 () Bool)

(assert (=> b!1100726 (= e!628256 (not call!46093))))

(declare-fun bm!46090 () Bool)

(assert (=> bm!46090 (= call!46093 (contains!6368 lt!493229 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100727 () Bool)

(declare-fun e!628254 () ListLongMap!15395)

(declare-fun call!46089 () ListLongMap!15395)

(assert (=> b!1100727 (= e!628254 call!46089)))

(declare-fun bm!46091 () Bool)

(assert (=> bm!46091 (= call!46091 call!46092)))

(declare-fun b!1100728 () Bool)

(declare-fun e!628253 () Bool)

(assert (=> b!1100728 (= e!628253 (validKeyInArray!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(declare-fun b!1100729 () Bool)

(declare-fun e!628248 () Bool)

(assert (=> b!1100729 (= e!628248 (= (apply!943 lt!493229 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100730 () Bool)

(assert (=> b!1100730 (= e!628252 call!46089)))

(declare-fun bm!46092 () Bool)

(assert (=> bm!46092 (= call!46089 call!46090)))

(declare-fun b!1100731 () Bool)

(declare-fun c!108702 () Bool)

(assert (=> b!1100731 (= c!108702 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100731 (= e!628254 e!628252)))

(declare-fun b!1100732 () Bool)

(assert (=> b!1100732 (= e!628251 (+!3423 call!46090 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1100733 () Bool)

(declare-fun res!734548 () Bool)

(assert (=> b!1100733 (=> (not res!734548) (not e!628250))))

(assert (=> b!1100733 (= res!734548 e!628249)))

(declare-fun res!734543 () Bool)

(assert (=> b!1100733 (=> res!734543 e!628249)))

(assert (=> b!1100733 (= res!734543 (not e!628253))))

(declare-fun res!734540 () Bool)

(assert (=> b!1100733 (=> (not res!734540) (not e!628253))))

(assert (=> b!1100733 (= res!734540 (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(declare-fun b!1100734 () Bool)

(assert (=> b!1100734 (= e!628257 (= (apply!943 lt!493229 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)) (get!17643 (select (arr!34283 lt!493075) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34821 lt!493075)))))

(assert (=> b!1100734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(declare-fun b!1100735 () Bool)

(assert (=> b!1100735 (= e!628251 e!628254)))

(assert (=> b!1100735 (= c!108701 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100736 () Bool)

(declare-fun Unit!36016 () Unit!36011)

(assert (=> b!1100736 (= e!628246 Unit!36016)))

(declare-fun b!1100737 () Bool)

(assert (=> b!1100737 (= e!628255 e!628248)))

(declare-fun res!734542 () Bool)

(assert (=> b!1100737 (= res!734542 call!46095)))

(assert (=> b!1100737 (=> (not res!734542) (not e!628248))))

(assert (= (and d!130453 c!108704) b!1100732))

(assert (= (and d!130453 (not c!108704)) b!1100735))

(assert (= (and b!1100735 c!108701) b!1100727))

(assert (= (and b!1100735 (not c!108701)) b!1100731))

(assert (= (and b!1100731 c!108702) b!1100730))

(assert (= (and b!1100731 (not c!108702)) b!1100723))

(assert (= (or b!1100730 b!1100723) bm!46091))

(assert (= (or b!1100727 bm!46091) bm!46087))

(assert (= (or b!1100727 b!1100730) bm!46092))

(assert (= (or b!1100732 bm!46087) bm!46086))

(assert (= (or b!1100732 bm!46092) bm!46088))

(assert (= (and d!130453 res!734547) b!1100719))

(assert (= (and d!130453 c!108700) b!1100718))

(assert (= (and d!130453 (not c!108700)) b!1100736))

(assert (= (and d!130453 res!734541) b!1100733))

(assert (= (and b!1100733 res!734540) b!1100728))

(assert (= (and b!1100733 (not res!734543)) b!1100722))

(assert (= (and b!1100722 res!734545) b!1100734))

(assert (= (and b!1100733 res!734548) b!1100724))

(assert (= (and b!1100724 c!108699) b!1100737))

(assert (= (and b!1100724 (not c!108699)) b!1100721))

(assert (= (and b!1100737 res!734542) b!1100729))

(assert (= (or b!1100737 b!1100721) bm!46089))

(assert (= (and b!1100724 res!734544) b!1100725))

(assert (= (and b!1100725 c!108703) b!1100717))

(assert (= (and b!1100725 (not c!108703)) b!1100726))

(assert (= (and b!1100717 res!734546) b!1100720))

(assert (= (or b!1100717 b!1100726) bm!46090))

(declare-fun b_lambda!18011 () Bool)

(assert (=> (not b_lambda!18011) (not b!1100734)))

(assert (=> b!1100734 t!34208))

(declare-fun b_and!37059 () Bool)

(assert (= b_and!37057 (and (=> t!34208 result!16571) b_and!37059)))

(declare-fun m!1020393 () Bool)

(assert (=> b!1100732 m!1020393))

(declare-fun m!1020395 () Bool)

(assert (=> bm!46089 m!1020395))

(assert (=> b!1100722 m!1020317))

(assert (=> b!1100722 m!1020317))

(declare-fun m!1020397 () Bool)

(assert (=> b!1100722 m!1020397))

(assert (=> d!130453 m!1020195))

(declare-fun m!1020399 () Bool)

(assert (=> bm!46088 m!1020399))

(declare-fun m!1020401 () Bool)

(assert (=> b!1100720 m!1020401))

(assert (=> bm!46086 m!1020219))

(assert (=> b!1100718 m!1020317))

(declare-fun m!1020403 () Bool)

(assert (=> b!1100718 m!1020403))

(declare-fun m!1020405 () Bool)

(assert (=> b!1100718 m!1020405))

(declare-fun m!1020407 () Bool)

(assert (=> b!1100718 m!1020407))

(declare-fun m!1020409 () Bool)

(assert (=> b!1100718 m!1020409))

(declare-fun m!1020411 () Bool)

(assert (=> b!1100718 m!1020411))

(declare-fun m!1020413 () Bool)

(assert (=> b!1100718 m!1020413))

(assert (=> b!1100718 m!1020409))

(declare-fun m!1020415 () Bool)

(assert (=> b!1100718 m!1020415))

(declare-fun m!1020417 () Bool)

(assert (=> b!1100718 m!1020417))

(declare-fun m!1020419 () Bool)

(assert (=> b!1100718 m!1020419))

(declare-fun m!1020421 () Bool)

(assert (=> b!1100718 m!1020421))

(assert (=> b!1100718 m!1020403))

(declare-fun m!1020423 () Bool)

(assert (=> b!1100718 m!1020423))

(declare-fun m!1020425 () Bool)

(assert (=> b!1100718 m!1020425))

(declare-fun m!1020427 () Bool)

(assert (=> b!1100718 m!1020427))

(assert (=> b!1100718 m!1020419))

(declare-fun m!1020429 () Bool)

(assert (=> b!1100718 m!1020429))

(assert (=> b!1100718 m!1020413))

(declare-fun m!1020431 () Bool)

(assert (=> b!1100718 m!1020431))

(assert (=> b!1100718 m!1020219))

(declare-fun m!1020433 () Bool)

(assert (=> b!1100729 m!1020433))

(assert (=> b!1100719 m!1020317))

(assert (=> b!1100719 m!1020317))

(assert (=> b!1100719 m!1020327))

(assert (=> b!1100734 m!1020317))

(declare-fun m!1020435 () Bool)

(assert (=> b!1100734 m!1020435))

(assert (=> b!1100734 m!1020209))

(declare-fun m!1020437 () Bool)

(assert (=> b!1100734 m!1020437))

(assert (=> b!1100734 m!1020209))

(assert (=> b!1100734 m!1020317))

(declare-fun m!1020439 () Bool)

(assert (=> b!1100734 m!1020439))

(assert (=> b!1100734 m!1020435))

(declare-fun m!1020441 () Bool)

(assert (=> bm!46090 m!1020441))

(assert (=> b!1100728 m!1020317))

(assert (=> b!1100728 m!1020317))

(assert (=> b!1100728 m!1020327))

(assert (=> b!1100535 d!130453))

(declare-fun b!1100762 () Bool)

(declare-fun e!628273 () ListLongMap!15395)

(assert (=> b!1100762 (= e!628273 (ListLongMap!15396 Nil!24014))))

(declare-fun b!1100763 () Bool)

(declare-fun e!628278 () Bool)

(declare-fun lt!493248 () ListLongMap!15395)

(declare-fun isEmpty!973 (ListLongMap!15395) Bool)

(assert (=> b!1100763 (= e!628278 (isEmpty!973 lt!493248))))

(declare-fun b!1100764 () Bool)

(declare-fun lt!493251 () Unit!36011)

(declare-fun lt!493249 () Unit!36011)

(assert (=> b!1100764 (= lt!493251 lt!493249)))

(declare-fun lt!493250 () (_ BitVec 64))

(declare-fun lt!493247 () V!41401)

(declare-fun lt!493253 () (_ BitVec 64))

(declare-fun lt!493252 () ListLongMap!15395)

(assert (=> b!1100764 (not (contains!6368 (+!3423 lt!493252 (tuple2!17427 lt!493250 lt!493247)) lt!493253))))

(declare-fun addStillNotContains!279 (ListLongMap!15395 (_ BitVec 64) V!41401 (_ BitVec 64)) Unit!36011)

(assert (=> b!1100764 (= lt!493249 (addStillNotContains!279 lt!493252 lt!493250 lt!493247 lt!493253))))

(assert (=> b!1100764 (= lt!493253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100764 (= lt!493247 (get!17643 (select (arr!34283 lt!493075) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100764 (= lt!493250 (select (arr!34282 lt!493076) #b00000000000000000000000000000000))))

(declare-fun call!46098 () ListLongMap!15395)

(assert (=> b!1100764 (= lt!493252 call!46098)))

(declare-fun e!628279 () ListLongMap!15395)

(assert (=> b!1100764 (= e!628279 (+!3423 call!46098 (tuple2!17427 (select (arr!34282 lt!493076) #b00000000000000000000000000000000) (get!17643 (select (arr!34283 lt!493075) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100765 () Bool)

(declare-fun e!628274 () Bool)

(assert (=> b!1100765 (= e!628274 e!628278)))

(declare-fun c!108715 () Bool)

(assert (=> b!1100765 (= c!108715 (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(declare-fun d!130455 () Bool)

(declare-fun e!628275 () Bool)

(assert (=> d!130455 e!628275))

(declare-fun res!734558 () Bool)

(assert (=> d!130455 (=> (not res!734558) (not e!628275))))

(assert (=> d!130455 (= res!734558 (not (contains!6368 lt!493248 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130455 (= lt!493248 e!628273)))

(declare-fun c!108714 () Bool)

(assert (=> d!130455 (= c!108714 (bvsge #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(assert (=> d!130455 (validMask!0 mask!1414)))

(assert (=> d!130455 (= (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493248)))

(declare-fun b!1100766 () Bool)

(declare-fun res!734560 () Bool)

(assert (=> b!1100766 (=> (not res!734560) (not e!628275))))

(assert (=> b!1100766 (= res!734560 (not (contains!6368 lt!493248 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100767 () Bool)

(assert (=> b!1100767 (= e!628275 e!628274)))

(declare-fun c!108713 () Bool)

(declare-fun e!628276 () Bool)

(assert (=> b!1100767 (= c!108713 e!628276)))

(declare-fun res!734557 () Bool)

(assert (=> b!1100767 (=> (not res!734557) (not e!628276))))

(assert (=> b!1100767 (= res!734557 (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(declare-fun b!1100768 () Bool)

(declare-fun e!628277 () Bool)

(assert (=> b!1100768 (= e!628274 e!628277)))

(assert (=> b!1100768 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(declare-fun res!734559 () Bool)

(assert (=> b!1100768 (= res!734559 (contains!6368 lt!493248 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(assert (=> b!1100768 (=> (not res!734559) (not e!628277))))

(declare-fun bm!46095 () Bool)

(assert (=> bm!46095 (= call!46098 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100769 () Bool)

(assert (=> b!1100769 (= e!628273 e!628279)))

(declare-fun c!108716 () Bool)

(assert (=> b!1100769 (= c!108716 (validKeyInArray!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(declare-fun b!1100770 () Bool)

(assert (=> b!1100770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(assert (=> b!1100770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34821 lt!493075)))))

(assert (=> b!1100770 (= e!628277 (= (apply!943 lt!493248 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)) (get!17643 (select (arr!34283 lt!493075) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1100771 () Bool)

(assert (=> b!1100771 (= e!628276 (validKeyInArray!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(assert (=> b!1100771 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1100772 () Bool)

(assert (=> b!1100772 (= e!628279 call!46098)))

(declare-fun b!1100773 () Bool)

(assert (=> b!1100773 (= e!628278 (= lt!493248 (getCurrentListMapNoExtraKeys!4237 lt!493076 lt!493075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(assert (= (and d!130455 c!108714) b!1100762))

(assert (= (and d!130455 (not c!108714)) b!1100769))

(assert (= (and b!1100769 c!108716) b!1100764))

(assert (= (and b!1100769 (not c!108716)) b!1100772))

(assert (= (or b!1100764 b!1100772) bm!46095))

(assert (= (and d!130455 res!734558) b!1100766))

(assert (= (and b!1100766 res!734560) b!1100767))

(assert (= (and b!1100767 res!734557) b!1100771))

(assert (= (and b!1100767 c!108713) b!1100768))

(assert (= (and b!1100767 (not c!108713)) b!1100765))

(assert (= (and b!1100768 res!734559) b!1100770))

(assert (= (and b!1100765 c!108715) b!1100773))

(assert (= (and b!1100765 (not c!108715)) b!1100763))

(declare-fun b_lambda!18013 () Bool)

(assert (=> (not b_lambda!18013) (not b!1100764)))

(assert (=> b!1100764 t!34208))

(declare-fun b_and!37061 () Bool)

(assert (= b_and!37059 (and (=> t!34208 result!16571) b_and!37061)))

(declare-fun b_lambda!18015 () Bool)

(assert (=> (not b_lambda!18015) (not b!1100770)))

(assert (=> b!1100770 t!34208))

(declare-fun b_and!37063 () Bool)

(assert (= b_and!37061 (and (=> t!34208 result!16571) b_and!37063)))

(declare-fun m!1020443 () Bool)

(assert (=> b!1100773 m!1020443))

(declare-fun m!1020445 () Bool)

(assert (=> d!130455 m!1020445))

(assert (=> d!130455 m!1020195))

(assert (=> bm!46095 m!1020443))

(assert (=> b!1100768 m!1020317))

(assert (=> b!1100768 m!1020317))

(declare-fun m!1020447 () Bool)

(assert (=> b!1100768 m!1020447))

(assert (=> b!1100770 m!1020435))

(assert (=> b!1100770 m!1020317))

(declare-fun m!1020449 () Bool)

(assert (=> b!1100770 m!1020449))

(assert (=> b!1100770 m!1020209))

(assert (=> b!1100770 m!1020317))

(assert (=> b!1100770 m!1020435))

(assert (=> b!1100770 m!1020209))

(assert (=> b!1100770 m!1020437))

(declare-fun m!1020451 () Bool)

(assert (=> b!1100766 m!1020451))

(assert (=> b!1100769 m!1020317))

(assert (=> b!1100769 m!1020317))

(assert (=> b!1100769 m!1020327))

(declare-fun m!1020453 () Bool)

(assert (=> b!1100763 m!1020453))

(assert (=> b!1100771 m!1020317))

(assert (=> b!1100771 m!1020317))

(assert (=> b!1100771 m!1020327))

(declare-fun m!1020455 () Bool)

(assert (=> b!1100764 m!1020455))

(declare-fun m!1020457 () Bool)

(assert (=> b!1100764 m!1020457))

(assert (=> b!1100764 m!1020209))

(assert (=> b!1100764 m!1020455))

(assert (=> b!1100764 m!1020317))

(declare-fun m!1020459 () Bool)

(assert (=> b!1100764 m!1020459))

(assert (=> b!1100764 m!1020435))

(assert (=> b!1100764 m!1020209))

(assert (=> b!1100764 m!1020437))

(assert (=> b!1100764 m!1020435))

(declare-fun m!1020461 () Bool)

(assert (=> b!1100764 m!1020461))

(assert (=> b!1100535 d!130455))

(declare-fun call!46103 () ListLongMap!15395)

(declare-fun bm!46100 () Bool)

(assert (=> bm!46100 (= call!46103 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun call!46104 () ListLongMap!15395)

(declare-fun b!1100780 () Bool)

(declare-fun e!628285 () Bool)

(assert (=> b!1100780 (= e!628285 (= call!46104 (-!945 call!46103 k0!904)))))

(assert (=> b!1100780 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34821 _values!874)))))

(declare-fun bm!46101 () Bool)

(assert (=> bm!46101 (= call!46104 (getCurrentListMapNoExtraKeys!4237 (array!71235 (store (arr!34282 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34820 _keys!1070)) (array!71237 (store (arr!34283 _values!874) i!650 (ValueCellFull!12893 (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34821 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100781 () Bool)

(declare-fun e!628284 () Bool)

(assert (=> b!1100781 (= e!628284 e!628285)))

(declare-fun c!108719 () Bool)

(assert (=> b!1100781 (= c!108719 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun d!130457 () Bool)

(assert (=> d!130457 e!628284))

(declare-fun res!734563 () Bool)

(assert (=> d!130457 (=> (not res!734563) (not e!628284))))

(assert (=> d!130457 (= res!734563 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34820 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34820 _keys!1070))))))))

(declare-fun lt!493256 () Unit!36011)

(declare-fun choose!1777 (array!71234 array!71236 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36011)

(assert (=> d!130457 (= lt!493256 (choose!1777 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(assert (=> d!130457 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!493256)))

(declare-fun b!1100782 () Bool)

(assert (=> b!1100782 (= e!628285 (= call!46104 call!46103))))

(assert (=> b!1100782 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34821 _values!874)))))

(assert (= (and d!130457 res!734563) b!1100781))

(assert (= (and b!1100781 c!108719) b!1100780))

(assert (= (and b!1100781 (not c!108719)) b!1100782))

(assert (= (or b!1100780 b!1100782) bm!46100))

(assert (= (or b!1100780 b!1100782) bm!46101))

(declare-fun b_lambda!18017 () Bool)

(assert (=> (not b_lambda!18017) (not bm!46101)))

(assert (=> bm!46101 t!34208))

(declare-fun b_and!37065 () Bool)

(assert (= b_and!37063 (and (=> t!34208 result!16571) b_and!37065)))

(assert (=> bm!46100 m!1020223))

(declare-fun m!1020463 () Bool)

(assert (=> b!1100780 m!1020463))

(assert (=> bm!46101 m!1020187))

(assert (=> bm!46101 m!1020209))

(assert (=> bm!46101 m!1020213))

(declare-fun m!1020465 () Bool)

(assert (=> bm!46101 m!1020465))

(declare-fun m!1020467 () Bool)

(assert (=> d!130457 m!1020467))

(assert (=> b!1100535 d!130457))

(declare-fun b!1100783 () Bool)

(declare-fun e!628286 () ListLongMap!15395)

(assert (=> b!1100783 (= e!628286 (ListLongMap!15396 Nil!24014))))

(declare-fun b!1100784 () Bool)

(declare-fun e!628291 () Bool)

(declare-fun lt!493258 () ListLongMap!15395)

(assert (=> b!1100784 (= e!628291 (isEmpty!973 lt!493258))))

(declare-fun b!1100785 () Bool)

(declare-fun lt!493261 () Unit!36011)

(declare-fun lt!493259 () Unit!36011)

(assert (=> b!1100785 (= lt!493261 lt!493259)))

(declare-fun lt!493257 () V!41401)

(declare-fun lt!493260 () (_ BitVec 64))

(declare-fun lt!493263 () (_ BitVec 64))

(declare-fun lt!493262 () ListLongMap!15395)

(assert (=> b!1100785 (not (contains!6368 (+!3423 lt!493262 (tuple2!17427 lt!493260 lt!493257)) lt!493263))))

(assert (=> b!1100785 (= lt!493259 (addStillNotContains!279 lt!493262 lt!493260 lt!493257 lt!493263))))

(assert (=> b!1100785 (= lt!493263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100785 (= lt!493257 (get!17643 (select (arr!34283 _values!874) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100785 (= lt!493260 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!46105 () ListLongMap!15395)

(assert (=> b!1100785 (= lt!493262 call!46105)))

(declare-fun e!628292 () ListLongMap!15395)

(assert (=> b!1100785 (= e!628292 (+!3423 call!46105 (tuple2!17427 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000) (get!17643 (select (arr!34283 _values!874) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100786 () Bool)

(declare-fun e!628287 () Bool)

(assert (=> b!1100786 (= e!628287 e!628291)))

(declare-fun c!108722 () Bool)

(assert (=> b!1100786 (= c!108722 (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(declare-fun d!130459 () Bool)

(declare-fun e!628288 () Bool)

(assert (=> d!130459 e!628288))

(declare-fun res!734565 () Bool)

(assert (=> d!130459 (=> (not res!734565) (not e!628288))))

(assert (=> d!130459 (= res!734565 (not (contains!6368 lt!493258 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130459 (= lt!493258 e!628286)))

(declare-fun c!108721 () Bool)

(assert (=> d!130459 (= c!108721 (bvsge #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(assert (=> d!130459 (validMask!0 mask!1414)))

(assert (=> d!130459 (= (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493258)))

(declare-fun b!1100787 () Bool)

(declare-fun res!734567 () Bool)

(assert (=> b!1100787 (=> (not res!734567) (not e!628288))))

(assert (=> b!1100787 (= res!734567 (not (contains!6368 lt!493258 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100788 () Bool)

(assert (=> b!1100788 (= e!628288 e!628287)))

(declare-fun c!108720 () Bool)

(declare-fun e!628289 () Bool)

(assert (=> b!1100788 (= c!108720 e!628289)))

(declare-fun res!734564 () Bool)

(assert (=> b!1100788 (=> (not res!734564) (not e!628289))))

(assert (=> b!1100788 (= res!734564 (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(declare-fun b!1100789 () Bool)

(declare-fun e!628290 () Bool)

(assert (=> b!1100789 (= e!628287 e!628290)))

(assert (=> b!1100789 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(declare-fun res!734566 () Bool)

(assert (=> b!1100789 (= res!734566 (contains!6368 lt!493258 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100789 (=> (not res!734566) (not e!628290))))

(declare-fun bm!46102 () Bool)

(assert (=> bm!46102 (= call!46105 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100790 () Bool)

(assert (=> b!1100790 (= e!628286 e!628292)))

(declare-fun c!108723 () Bool)

(assert (=> b!1100790 (= c!108723 (validKeyInArray!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100791 () Bool)

(assert (=> b!1100791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(assert (=> b!1100791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34821 _values!874)))))

(assert (=> b!1100791 (= e!628290 (= (apply!943 lt!493258 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)) (get!17643 (select (arr!34283 _values!874) #b00000000000000000000000000000000) (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1100792 () Bool)

(assert (=> b!1100792 (= e!628289 (validKeyInArray!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100792 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1100793 () Bool)

(assert (=> b!1100793 (= e!628292 call!46105)))

(declare-fun b!1100794 () Bool)

(assert (=> b!1100794 (= e!628291 (= lt!493258 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(assert (= (and d!130459 c!108721) b!1100783))

(assert (= (and d!130459 (not c!108721)) b!1100790))

(assert (= (and b!1100790 c!108723) b!1100785))

(assert (= (and b!1100790 (not c!108723)) b!1100793))

(assert (= (or b!1100785 b!1100793) bm!46102))

(assert (= (and d!130459 res!734565) b!1100787))

(assert (= (and b!1100787 res!734567) b!1100788))

(assert (= (and b!1100788 res!734564) b!1100792))

(assert (= (and b!1100788 c!108720) b!1100789))

(assert (= (and b!1100788 (not c!108720)) b!1100786))

(assert (= (and b!1100789 res!734566) b!1100791))

(assert (= (and b!1100786 c!108722) b!1100794))

(assert (= (and b!1100786 (not c!108722)) b!1100784))

(declare-fun b_lambda!18019 () Bool)

(assert (=> (not b_lambda!18019) (not b!1100785)))

(assert (=> b!1100785 t!34208))

(declare-fun b_and!37067 () Bool)

(assert (= b_and!37065 (and (=> t!34208 result!16571) b_and!37067)))

(declare-fun b_lambda!18021 () Bool)

(assert (=> (not b_lambda!18021) (not b!1100791)))

(assert (=> b!1100791 t!34208))

(declare-fun b_and!37069 () Bool)

(assert (= b_and!37067 (and (=> t!34208 result!16571) b_and!37069)))

(declare-fun m!1020469 () Bool)

(assert (=> b!1100794 m!1020469))

(declare-fun m!1020471 () Bool)

(assert (=> d!130459 m!1020471))

(assert (=> d!130459 m!1020195))

(assert (=> bm!46102 m!1020469))

(assert (=> b!1100789 m!1020329))

(assert (=> b!1100789 m!1020329))

(declare-fun m!1020473 () Bool)

(assert (=> b!1100789 m!1020473))

(assert (=> b!1100791 m!1020385))

(assert (=> b!1100791 m!1020329))

(declare-fun m!1020475 () Bool)

(assert (=> b!1100791 m!1020475))

(assert (=> b!1100791 m!1020209))

(assert (=> b!1100791 m!1020329))

(assert (=> b!1100791 m!1020385))

(assert (=> b!1100791 m!1020209))

(assert (=> b!1100791 m!1020387))

(declare-fun m!1020477 () Bool)

(assert (=> b!1100787 m!1020477))

(assert (=> b!1100790 m!1020329))

(assert (=> b!1100790 m!1020329))

(assert (=> b!1100790 m!1020339))

(declare-fun m!1020479 () Bool)

(assert (=> b!1100784 m!1020479))

(assert (=> b!1100792 m!1020329))

(assert (=> b!1100792 m!1020329))

(assert (=> b!1100792 m!1020339))

(declare-fun m!1020481 () Bool)

(assert (=> b!1100785 m!1020481))

(declare-fun m!1020483 () Bool)

(assert (=> b!1100785 m!1020483))

(assert (=> b!1100785 m!1020209))

(assert (=> b!1100785 m!1020481))

(assert (=> b!1100785 m!1020329))

(declare-fun m!1020485 () Bool)

(assert (=> b!1100785 m!1020485))

(assert (=> b!1100785 m!1020385))

(assert (=> b!1100785 m!1020209))

(assert (=> b!1100785 m!1020387))

(assert (=> b!1100785 m!1020385))

(declare-fun m!1020487 () Bool)

(assert (=> b!1100785 m!1020487))

(assert (=> b!1100535 d!130459))

(declare-fun d!130461 () Bool)

(declare-fun lt!493266 () ListLongMap!15395)

(assert (=> d!130461 (not (contains!6368 lt!493266 k0!904))))

(declare-fun removeStrictlySorted!84 (List!24017 (_ BitVec 64)) List!24017)

(assert (=> d!130461 (= lt!493266 (ListLongMap!15396 (removeStrictlySorted!84 (toList!7713 lt!493074) k0!904)))))

(assert (=> d!130461 (= (-!945 lt!493074 k0!904) lt!493266)))

(declare-fun bs!32286 () Bool)

(assert (= bs!32286 d!130461))

(declare-fun m!1020489 () Bool)

(assert (=> bs!32286 m!1020489))

(declare-fun m!1020491 () Bool)

(assert (=> bs!32286 m!1020491))

(assert (=> b!1100535 d!130461))

(declare-fun d!130463 () Bool)

(assert (=> d!130463 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493269 () Unit!36011)

(declare-fun choose!13 (array!71234 (_ BitVec 64) (_ BitVec 32)) Unit!36011)

(assert (=> d!130463 (= lt!493269 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130463 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130463 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493269)))

(declare-fun bs!32287 () Bool)

(assert (= bs!32287 d!130463))

(assert (=> bs!32287 m!1020215))

(declare-fun m!1020493 () Bool)

(assert (=> bs!32287 m!1020493))

(assert (=> b!1100535 d!130463))

(declare-fun bm!46105 () Bool)

(declare-fun call!46108 () Bool)

(declare-fun c!108726 () Bool)

(assert (=> bm!46105 (= call!46108 (arrayNoDuplicates!0 lt!493076 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108726 (Cons!24014 (select (arr!34282 lt!493076) #b00000000000000000000000000000000) Nil!24015) Nil!24015)))))

(declare-fun b!1100805 () Bool)

(declare-fun e!628303 () Bool)

(assert (=> b!1100805 (= e!628303 call!46108)))

(declare-fun b!1100806 () Bool)

(declare-fun e!628304 () Bool)

(declare-fun e!628302 () Bool)

(assert (=> b!1100806 (= e!628304 e!628302)))

(declare-fun res!734576 () Bool)

(assert (=> b!1100806 (=> (not res!734576) (not e!628302))))

(declare-fun e!628301 () Bool)

(assert (=> b!1100806 (= res!734576 (not e!628301))))

(declare-fun res!734574 () Bool)

(assert (=> b!1100806 (=> (not res!734574) (not e!628301))))

(assert (=> b!1100806 (= res!734574 (validKeyInArray!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(declare-fun b!1100807 () Bool)

(assert (=> b!1100807 (= e!628302 e!628303)))

(assert (=> b!1100807 (= c!108726 (validKeyInArray!0 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(declare-fun b!1100808 () Bool)

(assert (=> b!1100808 (= e!628303 call!46108)))

(declare-fun d!130465 () Bool)

(declare-fun res!734575 () Bool)

(assert (=> d!130465 (=> res!734575 e!628304)))

(assert (=> d!130465 (= res!734575 (bvsge #b00000000000000000000000000000000 (size!34820 lt!493076)))))

(assert (=> d!130465 (= (arrayNoDuplicates!0 lt!493076 #b00000000000000000000000000000000 Nil!24015) e!628304)))

(declare-fun b!1100809 () Bool)

(declare-fun contains!6369 (List!24018 (_ BitVec 64)) Bool)

(assert (=> b!1100809 (= e!628301 (contains!6369 Nil!24015 (select (arr!34282 lt!493076) #b00000000000000000000000000000000)))))

(assert (= (and d!130465 (not res!734575)) b!1100806))

(assert (= (and b!1100806 res!734574) b!1100809))

(assert (= (and b!1100806 res!734576) b!1100807))

(assert (= (and b!1100807 c!108726) b!1100808))

(assert (= (and b!1100807 (not c!108726)) b!1100805))

(assert (= (or b!1100808 b!1100805) bm!46105))

(assert (=> bm!46105 m!1020317))

(declare-fun m!1020495 () Bool)

(assert (=> bm!46105 m!1020495))

(assert (=> b!1100806 m!1020317))

(assert (=> b!1100806 m!1020317))

(assert (=> b!1100806 m!1020327))

(assert (=> b!1100807 m!1020317))

(assert (=> b!1100807 m!1020317))

(assert (=> b!1100807 m!1020327))

(assert (=> b!1100809 m!1020317))

(assert (=> b!1100809 m!1020317))

(declare-fun m!1020497 () Bool)

(assert (=> b!1100809 m!1020497))

(assert (=> b!1100544 d!130465))

(declare-fun d!130467 () Bool)

(declare-fun e!628307 () Bool)

(assert (=> d!130467 e!628307))

(declare-fun res!734581 () Bool)

(assert (=> d!130467 (=> (not res!734581) (not e!628307))))

(declare-fun lt!493281 () ListLongMap!15395)

(assert (=> d!130467 (= res!734581 (contains!6368 lt!493281 (_1!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lt!493279 () List!24017)

(assert (=> d!130467 (= lt!493281 (ListLongMap!15396 lt!493279))))

(declare-fun lt!493278 () Unit!36011)

(declare-fun lt!493280 () Unit!36011)

(assert (=> d!130467 (= lt!493278 lt!493280)))

(declare-datatypes ((Option!678 0))(
  ( (Some!677 (v!16289 V!41401)) (None!676) )
))
(declare-fun getValueByKey!627 (List!24017 (_ BitVec 64)) Option!678)

(assert (=> d!130467 (= (getValueByKey!627 lt!493279 (_1!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!677 (_2!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!303 (List!24017 (_ BitVec 64) V!41401) Unit!36011)

(assert (=> d!130467 (= lt!493280 (lemmaContainsTupThenGetReturnValue!303 lt!493279 (_1!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun insertStrictlySorted!396 (List!24017 (_ BitVec 64) V!41401) List!24017)

(assert (=> d!130467 (= lt!493279 (insertStrictlySorted!396 (toList!7713 lt!493077) (_1!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (=> d!130467 (= (+!3423 lt!493077 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) lt!493281)))

(declare-fun b!1100814 () Bool)

(declare-fun res!734582 () Bool)

(assert (=> b!1100814 (=> (not res!734582) (not e!628307))))

(assert (=> b!1100814 (= res!734582 (= (getValueByKey!627 (toList!7713 lt!493281) (_1!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!677 (_2!8724 (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))))

(declare-fun b!1100815 () Bool)

(declare-fun contains!6370 (List!24017 tuple2!17426) Bool)

(assert (=> b!1100815 (= e!628307 (contains!6370 (toList!7713 lt!493281) (tuple2!17427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(assert (= (and d!130467 res!734581) b!1100814))

(assert (= (and b!1100814 res!734582) b!1100815))

(declare-fun m!1020499 () Bool)

(assert (=> d!130467 m!1020499))

(declare-fun m!1020501 () Bool)

(assert (=> d!130467 m!1020501))

(declare-fun m!1020503 () Bool)

(assert (=> d!130467 m!1020503))

(declare-fun m!1020505 () Bool)

(assert (=> d!130467 m!1020505))

(declare-fun m!1020507 () Bool)

(assert (=> b!1100814 m!1020507))

(declare-fun m!1020509 () Bool)

(assert (=> b!1100815 m!1020509))

(assert (=> b!1100538 d!130467))

(declare-fun d!130469 () Bool)

(assert (=> d!130469 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96754 d!130469))

(declare-fun d!130471 () Bool)

(assert (=> d!130471 (= (array_inv!26438 _keys!1070) (bvsge (size!34820 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96754 d!130471))

(declare-fun d!130473 () Bool)

(assert (=> d!130473 (= (array_inv!26439 _values!874) (bvsge (size!34821 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96754 d!130473))

(declare-fun bm!46106 () Bool)

(declare-fun call!46109 () Bool)

(declare-fun c!108727 () Bool)

(assert (=> bm!46106 (= call!46109 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108727 (Cons!24014 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000) Nil!24015) Nil!24015)))))

(declare-fun b!1100816 () Bool)

(declare-fun e!628310 () Bool)

(assert (=> b!1100816 (= e!628310 call!46109)))

(declare-fun b!1100817 () Bool)

(declare-fun e!628311 () Bool)

(declare-fun e!628309 () Bool)

(assert (=> b!1100817 (= e!628311 e!628309)))

(declare-fun res!734585 () Bool)

(assert (=> b!1100817 (=> (not res!734585) (not e!628309))))

(declare-fun e!628308 () Bool)

(assert (=> b!1100817 (= res!734585 (not e!628308))))

(declare-fun res!734583 () Bool)

(assert (=> b!1100817 (=> (not res!734583) (not e!628308))))

(assert (=> b!1100817 (= res!734583 (validKeyInArray!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100818 () Bool)

(assert (=> b!1100818 (= e!628309 e!628310)))

(assert (=> b!1100818 (= c!108727 (validKeyInArray!0 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100819 () Bool)

(assert (=> b!1100819 (= e!628310 call!46109)))

(declare-fun d!130475 () Bool)

(declare-fun res!734584 () Bool)

(assert (=> d!130475 (=> res!734584 e!628311)))

(assert (=> d!130475 (= res!734584 (bvsge #b00000000000000000000000000000000 (size!34820 _keys!1070)))))

(assert (=> d!130475 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24015) e!628311)))

(declare-fun b!1100820 () Bool)

(assert (=> b!1100820 (= e!628308 (contains!6369 Nil!24015 (select (arr!34282 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130475 (not res!734584)) b!1100817))

(assert (= (and b!1100817 res!734583) b!1100820))

(assert (= (and b!1100817 res!734585) b!1100818))

(assert (= (and b!1100818 c!108727) b!1100819))

(assert (= (and b!1100818 (not c!108727)) b!1100816))

(assert (= (or b!1100819 b!1100816) bm!46106))

(assert (=> bm!46106 m!1020329))

(declare-fun m!1020511 () Bool)

(assert (=> bm!46106 m!1020511))

(assert (=> b!1100817 m!1020329))

(assert (=> b!1100817 m!1020329))

(assert (=> b!1100817 m!1020339))

(assert (=> b!1100818 m!1020329))

(assert (=> b!1100818 m!1020329))

(assert (=> b!1100818 m!1020339))

(assert (=> b!1100820 m!1020329))

(assert (=> b!1100820 m!1020329))

(declare-fun m!1020513 () Bool)

(assert (=> b!1100820 m!1020513))

(assert (=> b!1100543 d!130475))

(declare-fun b!1100828 () Bool)

(declare-fun e!628316 () Bool)

(assert (=> b!1100828 (= e!628316 tp_is_empty!27205)))

(declare-fun mapIsEmpty!42598 () Bool)

(declare-fun mapRes!42598 () Bool)

(assert (=> mapIsEmpty!42598 mapRes!42598))

(declare-fun mapNonEmpty!42598 () Bool)

(declare-fun tp!81428 () Bool)

(declare-fun e!628317 () Bool)

(assert (=> mapNonEmpty!42598 (= mapRes!42598 (and tp!81428 e!628317))))

(declare-fun mapValue!42598 () ValueCell!12893)

(declare-fun mapKey!42598 () (_ BitVec 32))

(declare-fun mapRest!42598 () (Array (_ BitVec 32) ValueCell!12893))

(assert (=> mapNonEmpty!42598 (= mapRest!42589 (store mapRest!42598 mapKey!42598 mapValue!42598))))

(declare-fun condMapEmpty!42598 () Bool)

(declare-fun mapDefault!42598 () ValueCell!12893)

(assert (=> mapNonEmpty!42589 (= condMapEmpty!42598 (= mapRest!42589 ((as const (Array (_ BitVec 32) ValueCell!12893)) mapDefault!42598)))))

(assert (=> mapNonEmpty!42589 (= tp!81412 (and e!628316 mapRes!42598))))

(declare-fun b!1100827 () Bool)

(assert (=> b!1100827 (= e!628317 tp_is_empty!27205)))

(assert (= (and mapNonEmpty!42589 condMapEmpty!42598) mapIsEmpty!42598))

(assert (= (and mapNonEmpty!42589 (not condMapEmpty!42598)) mapNonEmpty!42598))

(assert (= (and mapNonEmpty!42598 ((_ is ValueCellFull!12893) mapValue!42598)) b!1100827))

(assert (= (and mapNonEmpty!42589 ((_ is ValueCellFull!12893) mapDefault!42598)) b!1100828))

(declare-fun m!1020515 () Bool)

(assert (=> mapNonEmpty!42598 m!1020515))

(declare-fun b_lambda!18023 () Bool)

(assert (= b_lambda!18015 (or (and start!96754 b_free!23155) b_lambda!18023)))

(declare-fun b_lambda!18025 () Bool)

(assert (= b_lambda!18017 (or (and start!96754 b_free!23155) b_lambda!18025)))

(declare-fun b_lambda!18027 () Bool)

(assert (= b_lambda!18013 (or (and start!96754 b_free!23155) b_lambda!18027)))

(declare-fun b_lambda!18029 () Bool)

(assert (= b_lambda!18011 (or (and start!96754 b_free!23155) b_lambda!18029)))

(declare-fun b_lambda!18031 () Bool)

(assert (= b_lambda!18021 (or (and start!96754 b_free!23155) b_lambda!18031)))

(declare-fun b_lambda!18033 () Bool)

(assert (= b_lambda!18009 (or (and start!96754 b_free!23155) b_lambda!18033)))

(declare-fun b_lambda!18035 () Bool)

(assert (= b_lambda!18019 (or (and start!96754 b_free!23155) b_lambda!18035)))

(check-sat (not b!1100718) (not b!1100699) (not b!1100790) (not b!1100771) (not b!1100698) (not b!1100763) (not b!1100697) (not b!1100722) (not b!1100791) (not b!1100728) (not bm!46102) (not bm!46082) (not b_lambda!18029) (not b!1100807) (not b!1100647) (not bm!46106) (not b!1100768) tp_is_empty!27205 (not b!1100770) (not b!1100644) (not mapNonEmpty!42598) (not b!1100817) (not b!1100769) (not bm!46079) (not b!1100815) (not b!1100701) (not b_lambda!18023) (not bm!46088) (not b!1100785) (not b!1100773) (not d!130467) (not bm!46095) (not b_lambda!18025) (not bm!46105) (not b!1100818) (not d!130451) (not b!1100734) (not b!1100720) (not b!1100729) (not d!130453) (not b!1100732) (not bm!46101) (not b!1100766) (not d!130457) (not b!1100792) (not b_lambda!18007) (not b!1100764) (not b!1100789) (not b_next!23155) (not b!1100711) (not bm!46089) (not bm!46100) (not b!1100820) (not b!1100713) (not d!130455) (not b!1100708) (not b!1100809) (not b!1100806) (not bm!46083) (not b_lambda!18031) (not b!1100784) (not bm!46086) (not bm!46064) (not b_lambda!18035) (not d!130463) (not b_lambda!18027) (not bm!46063) (not d!130459) (not b!1100707) (not b!1100794) (not b!1100719) (not b_lambda!18033) (not b!1100640) (not b!1100643) (not bm!46081) (not bm!46090) (not d!130461) (not b!1100653) (not b!1100814) (not b!1100780) (not b!1100787) b_and!37069)
(check-sat b_and!37069 (not b_next!23155))
