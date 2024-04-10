; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96048 () Bool)

(assert start!96048)

(declare-fun b_free!22701 () Bool)

(declare-fun b_next!22701 () Bool)

(assert (=> start!96048 (= b_free!22701 (not b_next!22701))))

(declare-fun tp!79951 () Bool)

(declare-fun b_and!36077 () Bool)

(assert (=> start!96048 (= tp!79951 b_and!36077)))

(declare-fun b!1089162 () Bool)

(declare-fun e!622103 () Bool)

(assert (=> b!1089162 (= e!622103 true)))

(declare-datatypes ((V!40731 0))(
  ( (V!40732 (val!13408 Int)) )
))
(declare-datatypes ((tuple2!17030 0))(
  ( (tuple2!17031 (_1!8526 (_ BitVec 64)) (_2!8526 V!40731)) )
))
(declare-datatypes ((List!23618 0))(
  ( (Nil!23615) (Cons!23614 (h!24823 tuple2!17030) (t!33377 List!23618)) )
))
(declare-datatypes ((ListLongMap!14999 0))(
  ( (ListLongMap!15000 (toList!7515 List!23618)) )
))
(declare-fun lt!485448 () ListLongMap!14999)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!485446 () ListLongMap!14999)

(declare-fun -!840 (ListLongMap!14999 (_ BitVec 64)) ListLongMap!14999)

(assert (=> b!1089162 (= (-!840 lt!485448 k0!904) lt!485446)))

(declare-fun lt!485441 () ListLongMap!14999)

(declare-datatypes ((Unit!35846 0))(
  ( (Unit!35847) )
))
(declare-fun lt!485445 () Unit!35846)

(declare-fun zeroValue!831 () V!40731)

(declare-fun addRemoveCommutativeForDiffKeys!68 (ListLongMap!14999 (_ BitVec 64) V!40731 (_ BitVec 64)) Unit!35846)

(assert (=> b!1089162 (= lt!485445 (addRemoveCommutativeForDiffKeys!68 lt!485441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun res!726499 () Bool)

(declare-fun e!622100 () Bool)

(assert (=> start!96048 (=> (not res!726499) (not e!622100))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96048 (= res!726499 (validMask!0 mask!1414))))

(assert (=> start!96048 e!622100))

(assert (=> start!96048 tp!79951))

(assert (=> start!96048 true))

(declare-fun tp_is_empty!26703 () Bool)

(assert (=> start!96048 tp_is_empty!26703))

(declare-datatypes ((array!70329 0))(
  ( (array!70330 (arr!33838 (Array (_ BitVec 32) (_ BitVec 64))) (size!34374 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70329)

(declare-fun array_inv!26098 (array!70329) Bool)

(assert (=> start!96048 (array_inv!26098 _keys!1070)))

(declare-datatypes ((ValueCell!12642 0))(
  ( (ValueCellFull!12642 (v!16029 V!40731)) (EmptyCell!12642) )
))
(declare-datatypes ((array!70331 0))(
  ( (array!70332 (arr!33839 (Array (_ BitVec 32) ValueCell!12642)) (size!34375 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70331)

(declare-fun e!622106 () Bool)

(declare-fun array_inv!26099 (array!70331) Bool)

(assert (=> start!96048 (and (array_inv!26099 _values!874) e!622106)))

(declare-fun b!1089163 () Bool)

(declare-fun res!726491 () Bool)

(assert (=> b!1089163 (=> (not res!726491) (not e!622100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089163 (= res!726491 (validKeyInArray!0 k0!904))))

(declare-fun b!1089164 () Bool)

(declare-fun e!622101 () Bool)

(declare-fun mapRes!41809 () Bool)

(assert (=> b!1089164 (= e!622106 (and e!622101 mapRes!41809))))

(declare-fun condMapEmpty!41809 () Bool)

(declare-fun mapDefault!41809 () ValueCell!12642)

(assert (=> b!1089164 (= condMapEmpty!41809 (= (arr!33839 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12642)) mapDefault!41809)))))

(declare-fun b!1089165 () Bool)

(declare-fun res!726500 () Bool)

(assert (=> b!1089165 (=> (not res!726500) (not e!622100))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089165 (= res!726500 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34374 _keys!1070))))))

(declare-fun b!1089166 () Bool)

(declare-fun e!622104 () Bool)

(assert (=> b!1089166 (= e!622100 e!622104)))

(declare-fun res!726501 () Bool)

(assert (=> b!1089166 (=> (not res!726501) (not e!622104))))

(declare-fun lt!485438 () array!70329)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70329 (_ BitVec 32)) Bool)

(assert (=> b!1089166 (= res!726501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485438 mask!1414))))

(assert (=> b!1089166 (= lt!485438 (array!70330 (store (arr!33838 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34374 _keys!1070)))))

(declare-fun b!1089167 () Bool)

(assert (=> b!1089167 (= e!622101 tp_is_empty!26703)))

(declare-fun b!1089168 () Bool)

(declare-fun res!726492 () Bool)

(assert (=> b!1089168 (=> (not res!726492) (not e!622100))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089168 (= res!726492 (and (= (size!34375 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34374 _keys!1070) (size!34375 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089169 () Bool)

(declare-fun res!726494 () Bool)

(assert (=> b!1089169 (=> (not res!726494) (not e!622104))))

(declare-datatypes ((List!23619 0))(
  ( (Nil!23616) (Cons!23615 (h!24824 (_ BitVec 64)) (t!33378 List!23619)) )
))
(declare-fun arrayNoDuplicates!0 (array!70329 (_ BitVec 32) List!23619) Bool)

(assert (=> b!1089169 (= res!726494 (arrayNoDuplicates!0 lt!485438 #b00000000000000000000000000000000 Nil!23616))))

(declare-fun b!1089170 () Bool)

(declare-fun e!622099 () Bool)

(assert (=> b!1089170 (= e!622099 tp_is_empty!26703)))

(declare-fun b!1089171 () Bool)

(declare-fun res!726498 () Bool)

(assert (=> b!1089171 (=> (not res!726498) (not e!622100))))

(assert (=> b!1089171 (= res!726498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089172 () Bool)

(declare-fun res!726496 () Bool)

(assert (=> b!1089172 (=> (not res!726496) (not e!622100))))

(assert (=> b!1089172 (= res!726496 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23616))))

(declare-fun mapNonEmpty!41809 () Bool)

(declare-fun tp!79952 () Bool)

(assert (=> mapNonEmpty!41809 (= mapRes!41809 (and tp!79952 e!622099))))

(declare-fun mapRest!41809 () (Array (_ BitVec 32) ValueCell!12642))

(declare-fun mapKey!41809 () (_ BitVec 32))

(declare-fun mapValue!41809 () ValueCell!12642)

(assert (=> mapNonEmpty!41809 (= (arr!33839 _values!874) (store mapRest!41809 mapKey!41809 mapValue!41809))))

(declare-fun b!1089173 () Bool)

(declare-fun res!726493 () Bool)

(assert (=> b!1089173 (=> (not res!726493) (not e!622100))))

(assert (=> b!1089173 (= res!726493 (= (select (arr!33838 _keys!1070) i!650) k0!904))))

(declare-fun b!1089174 () Bool)

(declare-fun e!622105 () Bool)

(assert (=> b!1089174 (= e!622105 e!622103)))

(declare-fun res!726495 () Bool)

(assert (=> b!1089174 (=> res!726495 e!622103)))

(assert (=> b!1089174 (= res!726495 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485442 () ListLongMap!14999)

(assert (=> b!1089174 (= lt!485442 lt!485446)))

(declare-fun lt!485447 () ListLongMap!14999)

(declare-fun lt!485443 () tuple2!17030)

(declare-fun +!3312 (ListLongMap!14999 tuple2!17030) ListLongMap!14999)

(assert (=> b!1089174 (= lt!485446 (+!3312 lt!485447 lt!485443))))

(declare-fun lt!485440 () ListLongMap!14999)

(assert (=> b!1089174 (= lt!485440 lt!485448)))

(assert (=> b!1089174 (= lt!485448 (+!3312 lt!485441 lt!485443))))

(declare-fun lt!485437 () ListLongMap!14999)

(assert (=> b!1089174 (= lt!485442 (+!3312 lt!485437 lt!485443))))

(assert (=> b!1089174 (= lt!485443 (tuple2!17031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!41809 () Bool)

(assert (=> mapIsEmpty!41809 mapRes!41809))

(declare-fun b!1089175 () Bool)

(assert (=> b!1089175 (= e!622104 (not e!622105))))

(declare-fun res!726497 () Bool)

(assert (=> b!1089175 (=> res!726497 e!622105)))

(assert (=> b!1089175 (= res!726497 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40731)

(declare-fun getCurrentListMap!4288 (array!70329 array!70331 (_ BitVec 32) (_ BitVec 32) V!40731 V!40731 (_ BitVec 32) Int) ListLongMap!14999)

(assert (=> b!1089175 (= lt!485440 (getCurrentListMap!4288 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485449 () array!70331)

(assert (=> b!1089175 (= lt!485442 (getCurrentListMap!4288 lt!485438 lt!485449 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089175 (and (= lt!485437 lt!485447) (= lt!485447 lt!485437))))

(assert (=> b!1089175 (= lt!485447 (-!840 lt!485441 k0!904))))

(declare-fun lt!485439 () Unit!35846)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!107 (array!70329 array!70331 (_ BitVec 32) (_ BitVec 32) V!40731 V!40731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35846)

(assert (=> b!1089175 (= lt!485439 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!107 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4048 (array!70329 array!70331 (_ BitVec 32) (_ BitVec 32) V!40731 V!40731 (_ BitVec 32) Int) ListLongMap!14999)

(assert (=> b!1089175 (= lt!485437 (getCurrentListMapNoExtraKeys!4048 lt!485438 lt!485449 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2185 (Int (_ BitVec 64)) V!40731)

(assert (=> b!1089175 (= lt!485449 (array!70332 (store (arr!33839 _values!874) i!650 (ValueCellFull!12642 (dynLambda!2185 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34375 _values!874)))))

(assert (=> b!1089175 (= lt!485441 (getCurrentListMapNoExtraKeys!4048 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089175 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485444 () Unit!35846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70329 (_ BitVec 64) (_ BitVec 32)) Unit!35846)

(assert (=> b!1089175 (= lt!485444 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96048 res!726499) b!1089168))

(assert (= (and b!1089168 res!726492) b!1089171))

(assert (= (and b!1089171 res!726498) b!1089172))

(assert (= (and b!1089172 res!726496) b!1089165))

(assert (= (and b!1089165 res!726500) b!1089163))

(assert (= (and b!1089163 res!726491) b!1089173))

(assert (= (and b!1089173 res!726493) b!1089166))

(assert (= (and b!1089166 res!726501) b!1089169))

(assert (= (and b!1089169 res!726494) b!1089175))

(assert (= (and b!1089175 (not res!726497)) b!1089174))

(assert (= (and b!1089174 (not res!726495)) b!1089162))

(assert (= (and b!1089164 condMapEmpty!41809) mapIsEmpty!41809))

(assert (= (and b!1089164 (not condMapEmpty!41809)) mapNonEmpty!41809))

(get-info :version)

(assert (= (and mapNonEmpty!41809 ((_ is ValueCellFull!12642) mapValue!41809)) b!1089170))

(assert (= (and b!1089164 ((_ is ValueCellFull!12642) mapDefault!41809)) b!1089167))

(assert (= start!96048 b!1089164))

(declare-fun b_lambda!17371 () Bool)

(assert (=> (not b_lambda!17371) (not b!1089175)))

(declare-fun t!33376 () Bool)

(declare-fun tb!7579 () Bool)

(assert (=> (and start!96048 (= defaultEntry!882 defaultEntry!882) t!33376) tb!7579))

(declare-fun result!15677 () Bool)

(assert (=> tb!7579 (= result!15677 tp_is_empty!26703)))

(assert (=> b!1089175 t!33376))

(declare-fun b_and!36079 () Bool)

(assert (= b_and!36077 (and (=> t!33376 result!15677) b_and!36079)))

(declare-fun m!1008359 () Bool)

(assert (=> b!1089175 m!1008359))

(declare-fun m!1008361 () Bool)

(assert (=> b!1089175 m!1008361))

(declare-fun m!1008363 () Bool)

(assert (=> b!1089175 m!1008363))

(declare-fun m!1008365 () Bool)

(assert (=> b!1089175 m!1008365))

(declare-fun m!1008367 () Bool)

(assert (=> b!1089175 m!1008367))

(declare-fun m!1008369 () Bool)

(assert (=> b!1089175 m!1008369))

(declare-fun m!1008371 () Bool)

(assert (=> b!1089175 m!1008371))

(declare-fun m!1008373 () Bool)

(assert (=> b!1089175 m!1008373))

(declare-fun m!1008375 () Bool)

(assert (=> b!1089175 m!1008375))

(declare-fun m!1008377 () Bool)

(assert (=> b!1089175 m!1008377))

(declare-fun m!1008379 () Bool)

(assert (=> b!1089171 m!1008379))

(declare-fun m!1008381 () Bool)

(assert (=> b!1089169 m!1008381))

(declare-fun m!1008383 () Bool)

(assert (=> start!96048 m!1008383))

(declare-fun m!1008385 () Bool)

(assert (=> start!96048 m!1008385))

(declare-fun m!1008387 () Bool)

(assert (=> start!96048 m!1008387))

(declare-fun m!1008389 () Bool)

(assert (=> b!1089162 m!1008389))

(declare-fun m!1008391 () Bool)

(assert (=> b!1089162 m!1008391))

(declare-fun m!1008393 () Bool)

(assert (=> mapNonEmpty!41809 m!1008393))

(declare-fun m!1008395 () Bool)

(assert (=> b!1089166 m!1008395))

(declare-fun m!1008397 () Bool)

(assert (=> b!1089166 m!1008397))

(declare-fun m!1008399 () Bool)

(assert (=> b!1089163 m!1008399))

(declare-fun m!1008401 () Bool)

(assert (=> b!1089174 m!1008401))

(declare-fun m!1008403 () Bool)

(assert (=> b!1089174 m!1008403))

(declare-fun m!1008405 () Bool)

(assert (=> b!1089174 m!1008405))

(declare-fun m!1008407 () Bool)

(assert (=> b!1089172 m!1008407))

(declare-fun m!1008409 () Bool)

(assert (=> b!1089173 m!1008409))

(check-sat (not b!1089163) tp_is_empty!26703 (not mapNonEmpty!41809) (not start!96048) b_and!36079 (not b!1089172) (not b!1089171) (not b!1089175) (not b!1089162) (not b!1089166) (not b!1089174) (not b!1089169) (not b_next!22701) (not b_lambda!17371))
(check-sat b_and!36079 (not b_next!22701))
