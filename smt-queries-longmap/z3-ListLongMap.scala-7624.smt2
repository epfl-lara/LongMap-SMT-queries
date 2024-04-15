; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96058 () Bool)

(assert start!96058)

(declare-fun b_free!22717 () Bool)

(declare-fun b_next!22717 () Bool)

(assert (=> start!96058 (= b_free!22717 (not b_next!22717))))

(declare-fun tp!79999 () Bool)

(declare-fun b_and!36083 () Bool)

(assert (=> start!96058 (= tp!79999 b_and!36083)))

(declare-fun b!1089361 () Bool)

(declare-fun res!726690 () Bool)

(declare-fun e!622199 () Bool)

(assert (=> b!1089361 (=> (not res!726690) (not e!622199))))

(declare-datatypes ((array!70282 0))(
  ( (array!70283 (arr!33815 (Array (_ BitVec 32) (_ BitVec 64))) (size!34353 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70282)

(declare-datatypes ((List!23665 0))(
  ( (Nil!23662) (Cons!23661 (h!24870 (_ BitVec 64)) (t!33431 List!23665)) )
))
(declare-fun arrayNoDuplicates!0 (array!70282 (_ BitVec 32) List!23665) Bool)

(assert (=> b!1089361 (= res!726690 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23662))))

(declare-fun b!1089362 () Bool)

(declare-fun e!622205 () Bool)

(declare-fun tp_is_empty!26719 () Bool)

(assert (=> b!1089362 (= e!622205 tp_is_empty!26719)))

(declare-fun res!726689 () Bool)

(assert (=> start!96058 (=> (not res!726689) (not e!622199))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96058 (= res!726689 (validMask!0 mask!1414))))

(assert (=> start!96058 e!622199))

(assert (=> start!96058 tp!79999))

(assert (=> start!96058 true))

(assert (=> start!96058 tp_is_empty!26719))

(declare-fun array_inv!26120 (array!70282) Bool)

(assert (=> start!96058 (array_inv!26120 _keys!1070)))

(declare-datatypes ((V!40753 0))(
  ( (V!40754 (val!13416 Int)) )
))
(declare-datatypes ((ValueCell!12650 0))(
  ( (ValueCellFull!12650 (v!16036 V!40753)) (EmptyCell!12650) )
))
(declare-datatypes ((array!70284 0))(
  ( (array!70285 (arr!33816 (Array (_ BitVec 32) ValueCell!12650)) (size!34354 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70284)

(declare-fun e!622201 () Bool)

(declare-fun array_inv!26121 (array!70284) Bool)

(assert (=> start!96058 (and (array_inv!26121 _values!874) e!622201)))

(declare-fun b!1089363 () Bool)

(declare-fun e!622198 () Bool)

(assert (=> b!1089363 (= e!622198 tp_is_empty!26719)))

(declare-fun b!1089364 () Bool)

(declare-fun res!726691 () Bool)

(assert (=> b!1089364 (=> (not res!726691) (not e!622199))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089364 (= res!726691 (and (= (size!34354 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34353 _keys!1070) (size!34354 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089365 () Bool)

(declare-fun mapRes!41833 () Bool)

(assert (=> b!1089365 (= e!622201 (and e!622198 mapRes!41833))))

(declare-fun condMapEmpty!41833 () Bool)

(declare-fun mapDefault!41833 () ValueCell!12650)

(assert (=> b!1089365 (= condMapEmpty!41833 (= (arr!33816 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12650)) mapDefault!41833)))))

(declare-fun b!1089366 () Bool)

(declare-fun res!726692 () Bool)

(assert (=> b!1089366 (=> (not res!726692) (not e!622199))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089366 (= res!726692 (= (select (arr!33815 _keys!1070) i!650) k0!904))))

(declare-fun b!1089367 () Bool)

(declare-fun e!622203 () Bool)

(assert (=> b!1089367 (= e!622203 true)))

(declare-datatypes ((tuple2!17096 0))(
  ( (tuple2!17097 (_1!8559 (_ BitVec 64)) (_2!8559 V!40753)) )
))
(declare-datatypes ((List!23666 0))(
  ( (Nil!23663) (Cons!23662 (h!24871 tuple2!17096) (t!33432 List!23666)) )
))
(declare-datatypes ((ListLongMap!15065 0))(
  ( (ListLongMap!15066 (toList!7548 List!23666)) )
))
(declare-fun lt!485553 () ListLongMap!15065)

(declare-fun lt!485550 () ListLongMap!15065)

(declare-fun -!824 (ListLongMap!15065 (_ BitVec 64)) ListLongMap!15065)

(assert (=> b!1089367 (= (-!824 lt!485553 k0!904) lt!485550)))

(declare-fun lt!485558 () ListLongMap!15065)

(declare-datatypes ((Unit!35683 0))(
  ( (Unit!35684) )
))
(declare-fun lt!485559 () Unit!35683)

(declare-fun zeroValue!831 () V!40753)

(declare-fun addRemoveCommutativeForDiffKeys!74 (ListLongMap!15065 (_ BitVec 64) V!40753 (_ BitVec 64)) Unit!35683)

(assert (=> b!1089367 (= lt!485559 (addRemoveCommutativeForDiffKeys!74 lt!485558 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun mapIsEmpty!41833 () Bool)

(assert (=> mapIsEmpty!41833 mapRes!41833))

(declare-fun b!1089368 () Bool)

(declare-fun res!726695 () Bool)

(assert (=> b!1089368 (=> (not res!726695) (not e!622199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70282 (_ BitVec 32)) Bool)

(assert (=> b!1089368 (= res!726695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089369 () Bool)

(declare-fun res!726686 () Bool)

(declare-fun e!622204 () Bool)

(assert (=> b!1089369 (=> (not res!726686) (not e!622204))))

(declare-fun lt!485552 () array!70282)

(assert (=> b!1089369 (= res!726686 (arrayNoDuplicates!0 lt!485552 #b00000000000000000000000000000000 Nil!23662))))

(declare-fun b!1089370 () Bool)

(declare-fun res!726694 () Bool)

(assert (=> b!1089370 (=> (not res!726694) (not e!622199))))

(assert (=> b!1089370 (= res!726694 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34353 _keys!1070))))))

(declare-fun mapNonEmpty!41833 () Bool)

(declare-fun tp!80000 () Bool)

(assert (=> mapNonEmpty!41833 (= mapRes!41833 (and tp!80000 e!622205))))

(declare-fun mapRest!41833 () (Array (_ BitVec 32) ValueCell!12650))

(declare-fun mapValue!41833 () ValueCell!12650)

(declare-fun mapKey!41833 () (_ BitVec 32))

(assert (=> mapNonEmpty!41833 (= (arr!33816 _values!874) (store mapRest!41833 mapKey!41833 mapValue!41833))))

(declare-fun b!1089371 () Bool)

(declare-fun res!726693 () Bool)

(assert (=> b!1089371 (=> (not res!726693) (not e!622199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089371 (= res!726693 (validKeyInArray!0 k0!904))))

(declare-fun b!1089372 () Bool)

(declare-fun e!622202 () Bool)

(assert (=> b!1089372 (= e!622202 e!622203)))

(declare-fun res!726688 () Bool)

(assert (=> b!1089372 (=> res!726688 e!622203)))

(assert (=> b!1089372 (= res!726688 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485561 () ListLongMap!15065)

(assert (=> b!1089372 (= lt!485561 lt!485550)))

(declare-fun lt!485557 () ListLongMap!15065)

(declare-fun lt!485556 () tuple2!17096)

(declare-fun +!3348 (ListLongMap!15065 tuple2!17096) ListLongMap!15065)

(assert (=> b!1089372 (= lt!485550 (+!3348 lt!485557 lt!485556))))

(declare-fun lt!485551 () ListLongMap!15065)

(assert (=> b!1089372 (= lt!485551 lt!485553)))

(assert (=> b!1089372 (= lt!485553 (+!3348 lt!485558 lt!485556))))

(declare-fun lt!485554 () ListLongMap!15065)

(assert (=> b!1089372 (= lt!485561 (+!3348 lt!485554 lt!485556))))

(assert (=> b!1089372 (= lt!485556 (tuple2!17097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089373 () Bool)

(assert (=> b!1089373 (= e!622204 (not e!622202))))

(declare-fun res!726696 () Bool)

(assert (=> b!1089373 (=> res!726696 e!622202)))

(assert (=> b!1089373 (= res!726696 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40753)

(declare-fun getCurrentListMap!4225 (array!70282 array!70284 (_ BitVec 32) (_ BitVec 32) V!40753 V!40753 (_ BitVec 32) Int) ListLongMap!15065)

(assert (=> b!1089373 (= lt!485551 (getCurrentListMap!4225 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485555 () array!70284)

(assert (=> b!1089373 (= lt!485561 (getCurrentListMap!4225 lt!485552 lt!485555 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089373 (and (= lt!485554 lt!485557) (= lt!485557 lt!485554))))

(assert (=> b!1089373 (= lt!485557 (-!824 lt!485558 k0!904))))

(declare-fun lt!485560 () Unit!35683)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!109 (array!70282 array!70284 (_ BitVec 32) (_ BitVec 32) V!40753 V!40753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35683)

(assert (=> b!1089373 (= lt!485560 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!109 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4095 (array!70282 array!70284 (_ BitVec 32) (_ BitVec 32) V!40753 V!40753 (_ BitVec 32) Int) ListLongMap!15065)

(assert (=> b!1089373 (= lt!485554 (getCurrentListMapNoExtraKeys!4095 lt!485552 lt!485555 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2166 (Int (_ BitVec 64)) V!40753)

(assert (=> b!1089373 (= lt!485555 (array!70285 (store (arr!33816 _values!874) i!650 (ValueCellFull!12650 (dynLambda!2166 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34354 _values!874)))))

(assert (=> b!1089373 (= lt!485558 (getCurrentListMapNoExtraKeys!4095 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089373 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485549 () Unit!35683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70282 (_ BitVec 64) (_ BitVec 32)) Unit!35683)

(assert (=> b!1089373 (= lt!485549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089374 () Bool)

(assert (=> b!1089374 (= e!622199 e!622204)))

(declare-fun res!726687 () Bool)

(assert (=> b!1089374 (=> (not res!726687) (not e!622204))))

(assert (=> b!1089374 (= res!726687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485552 mask!1414))))

(assert (=> b!1089374 (= lt!485552 (array!70283 (store (arr!33815 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34353 _keys!1070)))))

(assert (= (and start!96058 res!726689) b!1089364))

(assert (= (and b!1089364 res!726691) b!1089368))

(assert (= (and b!1089368 res!726695) b!1089361))

(assert (= (and b!1089361 res!726690) b!1089370))

(assert (= (and b!1089370 res!726694) b!1089371))

(assert (= (and b!1089371 res!726693) b!1089366))

(assert (= (and b!1089366 res!726692) b!1089374))

(assert (= (and b!1089374 res!726687) b!1089369))

(assert (= (and b!1089369 res!726686) b!1089373))

(assert (= (and b!1089373 (not res!726696)) b!1089372))

(assert (= (and b!1089372 (not res!726688)) b!1089367))

(assert (= (and b!1089365 condMapEmpty!41833) mapIsEmpty!41833))

(assert (= (and b!1089365 (not condMapEmpty!41833)) mapNonEmpty!41833))

(get-info :version)

(assert (= (and mapNonEmpty!41833 ((_ is ValueCellFull!12650) mapValue!41833)) b!1089362))

(assert (= (and b!1089365 ((_ is ValueCellFull!12650) mapDefault!41833)) b!1089363))

(assert (= start!96058 b!1089365))

(declare-fun b_lambda!17365 () Bool)

(assert (=> (not b_lambda!17365) (not b!1089373)))

(declare-fun t!33430 () Bool)

(declare-fun tb!7587 () Bool)

(assert (=> (and start!96058 (= defaultEntry!882 defaultEntry!882) t!33430) tb!7587))

(declare-fun result!15701 () Bool)

(assert (=> tb!7587 (= result!15701 tp_is_empty!26719)))

(assert (=> b!1089373 t!33430))

(declare-fun b_and!36085 () Bool)

(assert (= b_and!36083 (and (=> t!33430 result!15701) b_and!36085)))

(declare-fun m!1008149 () Bool)

(assert (=> b!1089367 m!1008149))

(declare-fun m!1008151 () Bool)

(assert (=> b!1089367 m!1008151))

(declare-fun m!1008153 () Bool)

(assert (=> start!96058 m!1008153))

(declare-fun m!1008155 () Bool)

(assert (=> start!96058 m!1008155))

(declare-fun m!1008157 () Bool)

(assert (=> start!96058 m!1008157))

(declare-fun m!1008159 () Bool)

(assert (=> b!1089369 m!1008159))

(declare-fun m!1008161 () Bool)

(assert (=> b!1089366 m!1008161))

(declare-fun m!1008163 () Bool)

(assert (=> b!1089373 m!1008163))

(declare-fun m!1008165 () Bool)

(assert (=> b!1089373 m!1008165))

(declare-fun m!1008167 () Bool)

(assert (=> b!1089373 m!1008167))

(declare-fun m!1008169 () Bool)

(assert (=> b!1089373 m!1008169))

(declare-fun m!1008171 () Bool)

(assert (=> b!1089373 m!1008171))

(declare-fun m!1008173 () Bool)

(assert (=> b!1089373 m!1008173))

(declare-fun m!1008175 () Bool)

(assert (=> b!1089373 m!1008175))

(declare-fun m!1008177 () Bool)

(assert (=> b!1089373 m!1008177))

(declare-fun m!1008179 () Bool)

(assert (=> b!1089373 m!1008179))

(declare-fun m!1008181 () Bool)

(assert (=> b!1089373 m!1008181))

(declare-fun m!1008183 () Bool)

(assert (=> b!1089371 m!1008183))

(declare-fun m!1008185 () Bool)

(assert (=> b!1089374 m!1008185))

(declare-fun m!1008187 () Bool)

(assert (=> b!1089374 m!1008187))

(declare-fun m!1008189 () Bool)

(assert (=> b!1089372 m!1008189))

(declare-fun m!1008191 () Bool)

(assert (=> b!1089372 m!1008191))

(declare-fun m!1008193 () Bool)

(assert (=> b!1089372 m!1008193))

(declare-fun m!1008195 () Bool)

(assert (=> b!1089361 m!1008195))

(declare-fun m!1008197 () Bool)

(assert (=> mapNonEmpty!41833 m!1008197))

(declare-fun m!1008199 () Bool)

(assert (=> b!1089368 m!1008199))

(check-sat (not b_lambda!17365) (not b!1089371) (not b!1089372) (not start!96058) (not b!1089373) (not b_next!22717) b_and!36085 tp_is_empty!26719 (not mapNonEmpty!41833) (not b!1089361) (not b!1089367) (not b!1089369) (not b!1089368) (not b!1089374))
(check-sat b_and!36085 (not b_next!22717))
