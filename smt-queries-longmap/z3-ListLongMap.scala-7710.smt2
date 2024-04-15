; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96862 () Bool)

(assert start!96862)

(declare-fun b_free!23185 () Bool)

(declare-fun b_next!23185 () Bool)

(assert (=> start!96862 (= b_free!23185 (not b_next!23185))))

(declare-fun tp!81511 () Bool)

(declare-fun b_and!37147 () Bool)

(assert (=> start!96862 (= tp!81511 b_and!37147)))

(declare-fun b!1101787 () Bool)

(declare-fun res!735192 () Bool)

(declare-fun e!628878 () Bool)

(assert (=> b!1101787 (=> (not res!735192) (not e!628878))))

(declare-datatypes ((array!71298 0))(
  ( (array!71299 (arr!34311 (Array (_ BitVec 32) (_ BitVec 64))) (size!34849 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71298)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71298 (_ BitVec 32)) Bool)

(assert (=> b!1101787 (= res!735192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101788 () Bool)

(declare-fun e!628875 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((V!41441 0))(
  ( (V!41442 (val!13674 Int)) )
))
(declare-datatypes ((ValueCell!12908 0))(
  ( (ValueCellFull!12908 (v!16304 V!41441)) (EmptyCell!12908) )
))
(declare-datatypes ((array!71300 0))(
  ( (array!71301 (arr!34312 (Array (_ BitVec 32) ValueCell!12908)) (size!34850 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71300)

(assert (=> b!1101788 (= e!628875 (bvslt i!650 (size!34850 _values!874)))))

(declare-datatypes ((tuple2!17454 0))(
  ( (tuple2!17455 (_1!8738 (_ BitVec 64)) (_2!8738 V!41441)) )
))
(declare-datatypes ((List!24042 0))(
  ( (Nil!24039) (Cons!24038 (h!25247 tuple2!17454) (t!34264 List!24042)) )
))
(declare-datatypes ((ListLongMap!15423 0))(
  ( (ListLongMap!15424 (toList!7727 List!24042)) )
))
(declare-fun lt!494009 () ListLongMap!15423)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!494017 () ListLongMap!15423)

(declare-fun -!954 (ListLongMap!15423 (_ BitVec 64)) ListLongMap!15423)

(assert (=> b!1101788 (= (-!954 lt!494009 k0!904) lt!494017)))

(declare-fun lt!494012 () ListLongMap!15423)

(declare-fun minValue!831 () V!41441)

(declare-datatypes ((Unit!36035 0))(
  ( (Unit!36036) )
))
(declare-fun lt!494010 () Unit!36035)

(declare-fun addRemoveCommutativeForDiffKeys!132 (ListLongMap!15423 (_ BitVec 64) V!41441 (_ BitVec 64)) Unit!36035)

(assert (=> b!1101788 (= lt!494010 (addRemoveCommutativeForDiffKeys!132 lt!494012 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!42643 () Bool)

(declare-fun mapRes!42643 () Bool)

(assert (=> mapIsEmpty!42643 mapRes!42643))

(declare-fun b!1101789 () Bool)

(declare-fun e!628876 () Bool)

(declare-fun e!628882 () Bool)

(assert (=> b!1101789 (= e!628876 (and e!628882 mapRes!42643))))

(declare-fun condMapEmpty!42643 () Bool)

(declare-fun mapDefault!42643 () ValueCell!12908)

(assert (=> b!1101789 (= condMapEmpty!42643 (= (arr!34312 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12908)) mapDefault!42643)))))

(declare-fun b!1101790 () Bool)

(declare-fun res!735196 () Bool)

(declare-fun e!628879 () Bool)

(assert (=> b!1101790 (=> (not res!735196) (not e!628879))))

(declare-fun lt!494016 () array!71298)

(declare-datatypes ((List!24043 0))(
  ( (Nil!24040) (Cons!24039 (h!25248 (_ BitVec 64)) (t!34265 List!24043)) )
))
(declare-fun arrayNoDuplicates!0 (array!71298 (_ BitVec 32) List!24043) Bool)

(assert (=> b!1101790 (= res!735196 (arrayNoDuplicates!0 lt!494016 #b00000000000000000000000000000000 Nil!24040))))

(declare-fun b!1101791 () Bool)

(declare-fun res!735189 () Bool)

(assert (=> b!1101791 (=> (not res!735189) (not e!628878))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101791 (= res!735189 (and (= (size!34850 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34849 _keys!1070) (size!34850 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101792 () Bool)

(declare-fun res!735191 () Bool)

(assert (=> b!1101792 (=> (not res!735191) (not e!628878))))

(assert (=> b!1101792 (= res!735191 (= (select (arr!34311 _keys!1070) i!650) k0!904))))

(declare-fun res!735193 () Bool)

(assert (=> start!96862 (=> (not res!735193) (not e!628878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96862 (= res!735193 (validMask!0 mask!1414))))

(assert (=> start!96862 e!628878))

(assert (=> start!96862 tp!81511))

(assert (=> start!96862 true))

(declare-fun tp_is_empty!27235 () Bool)

(assert (=> start!96862 tp_is_empty!27235))

(declare-fun array_inv!26460 (array!71298) Bool)

(assert (=> start!96862 (array_inv!26460 _keys!1070)))

(declare-fun array_inv!26461 (array!71300) Bool)

(assert (=> start!96862 (and (array_inv!26461 _values!874) e!628876)))

(declare-fun b!1101793 () Bool)

(declare-fun res!735187 () Bool)

(assert (=> b!1101793 (=> (not res!735187) (not e!628878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101793 (= res!735187 (validKeyInArray!0 k0!904))))

(declare-fun b!1101794 () Bool)

(declare-fun res!735190 () Bool)

(assert (=> b!1101794 (=> (not res!735190) (not e!628878))))

(assert (=> b!1101794 (= res!735190 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34849 _keys!1070))))))

(declare-fun b!1101795 () Bool)

(assert (=> b!1101795 (= e!628878 e!628879)))

(declare-fun res!735188 () Bool)

(assert (=> b!1101795 (=> (not res!735188) (not e!628879))))

(assert (=> b!1101795 (= res!735188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494016 mask!1414))))

(assert (=> b!1101795 (= lt!494016 (array!71299 (store (arr!34311 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34849 _keys!1070)))))

(declare-fun b!1101796 () Bool)

(declare-fun e!628877 () Bool)

(assert (=> b!1101796 (= e!628877 tp_is_empty!27235)))

(declare-fun b!1101797 () Bool)

(assert (=> b!1101797 (= e!628882 tp_is_empty!27235)))

(declare-fun b!1101798 () Bool)

(declare-fun e!628880 () Bool)

(assert (=> b!1101798 (= e!628880 e!628875)))

(declare-fun res!735186 () Bool)

(assert (=> b!1101798 (=> res!735186 e!628875)))

(assert (=> b!1101798 (= res!735186 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!494019 () ListLongMap!15423)

(assert (=> b!1101798 (= lt!494019 lt!494009)))

(declare-fun lt!494018 () tuple2!17454)

(declare-fun +!3437 (ListLongMap!15423 tuple2!17454) ListLongMap!15423)

(assert (=> b!1101798 (= lt!494009 (+!3437 lt!494012 lt!494018))))

(declare-fun lt!494014 () ListLongMap!15423)

(assert (=> b!1101798 (= lt!494014 lt!494017)))

(declare-fun lt!494015 () ListLongMap!15423)

(assert (=> b!1101798 (= lt!494017 (+!3437 lt!494015 lt!494018))))

(declare-fun lt!494011 () ListLongMap!15423)

(assert (=> b!1101798 (= lt!494014 (+!3437 lt!494011 lt!494018))))

(assert (=> b!1101798 (= lt!494018 (tuple2!17455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapNonEmpty!42643 () Bool)

(declare-fun tp!81512 () Bool)

(assert (=> mapNonEmpty!42643 (= mapRes!42643 (and tp!81512 e!628877))))

(declare-fun mapRest!42643 () (Array (_ BitVec 32) ValueCell!12908))

(declare-fun mapKey!42643 () (_ BitVec 32))

(declare-fun mapValue!42643 () ValueCell!12908)

(assert (=> mapNonEmpty!42643 (= (arr!34312 _values!874) (store mapRest!42643 mapKey!42643 mapValue!42643))))

(declare-fun b!1101799 () Bool)

(declare-fun res!735195 () Bool)

(assert (=> b!1101799 (=> (not res!735195) (not e!628878))))

(assert (=> b!1101799 (= res!735195 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24040))))

(declare-fun b!1101800 () Bool)

(assert (=> b!1101800 (= e!628879 (not e!628880))))

(declare-fun res!735194 () Bool)

(assert (=> b!1101800 (=> res!735194 e!628880)))

(assert (=> b!1101800 (= res!735194 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41441)

(declare-fun getCurrentListMap!4339 (array!71298 array!71300 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) Int) ListLongMap!15423)

(assert (=> b!1101800 (= lt!494019 (getCurrentListMap!4339 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494020 () array!71300)

(assert (=> b!1101800 (= lt!494014 (getCurrentListMap!4339 lt!494016 lt!494020 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101800 (and (= lt!494011 lt!494015) (= lt!494015 lt!494011))))

(assert (=> b!1101800 (= lt!494015 (-!954 lt!494012 k0!904))))

(declare-fun lt!494021 () Unit!36035)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!228 (array!71298 array!71300 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36035)

(assert (=> b!1101800 (= lt!494021 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!228 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4246 (array!71298 array!71300 (_ BitVec 32) (_ BitVec 32) V!41441 V!41441 (_ BitVec 32) Int) ListLongMap!15423)

(assert (=> b!1101800 (= lt!494011 (getCurrentListMapNoExtraKeys!4246 lt!494016 lt!494020 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2315 (Int (_ BitVec 64)) V!41441)

(assert (=> b!1101800 (= lt!494020 (array!71301 (store (arr!34312 _values!874) i!650 (ValueCellFull!12908 (dynLambda!2315 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34850 _values!874)))))

(assert (=> b!1101800 (= lt!494012 (getCurrentListMapNoExtraKeys!4246 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101800 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494013 () Unit!36035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71298 (_ BitVec 64) (_ BitVec 32)) Unit!36035)

(assert (=> b!1101800 (= lt!494013 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96862 res!735193) b!1101791))

(assert (= (and b!1101791 res!735189) b!1101787))

(assert (= (and b!1101787 res!735192) b!1101799))

(assert (= (and b!1101799 res!735195) b!1101794))

(assert (= (and b!1101794 res!735190) b!1101793))

(assert (= (and b!1101793 res!735187) b!1101792))

(assert (= (and b!1101792 res!735191) b!1101795))

(assert (= (and b!1101795 res!735188) b!1101790))

(assert (= (and b!1101790 res!735196) b!1101800))

(assert (= (and b!1101800 (not res!735194)) b!1101798))

(assert (= (and b!1101798 (not res!735186)) b!1101788))

(assert (= (and b!1101789 condMapEmpty!42643) mapIsEmpty!42643))

(assert (= (and b!1101789 (not condMapEmpty!42643)) mapNonEmpty!42643))

(get-info :version)

(assert (= (and mapNonEmpty!42643 ((_ is ValueCellFull!12908) mapValue!42643)) b!1101796))

(assert (= (and b!1101789 ((_ is ValueCellFull!12908) mapDefault!42643)) b!1101797))

(assert (= start!96862 b!1101789))

(declare-fun b_lambda!18121 () Bool)

(assert (=> (not b_lambda!18121) (not b!1101800)))

(declare-fun t!34263 () Bool)

(declare-fun tb!8043 () Bool)

(assert (=> (and start!96862 (= defaultEntry!882 defaultEntry!882) t!34263) tb!8043))

(declare-fun result!16637 () Bool)

(assert (=> tb!8043 (= result!16637 tp_is_empty!27235)))

(assert (=> b!1101800 t!34263))

(declare-fun b_and!37149 () Bool)

(assert (= b_and!37147 (and (=> t!34263 result!16637) b_and!37149)))

(declare-fun m!1021547 () Bool)

(assert (=> b!1101792 m!1021547))

(declare-fun m!1021549 () Bool)

(assert (=> b!1101799 m!1021549))

(declare-fun m!1021551 () Bool)

(assert (=> b!1101790 m!1021551))

(declare-fun m!1021553 () Bool)

(assert (=> start!96862 m!1021553))

(declare-fun m!1021555 () Bool)

(assert (=> start!96862 m!1021555))

(declare-fun m!1021557 () Bool)

(assert (=> start!96862 m!1021557))

(declare-fun m!1021559 () Bool)

(assert (=> mapNonEmpty!42643 m!1021559))

(declare-fun m!1021561 () Bool)

(assert (=> b!1101788 m!1021561))

(declare-fun m!1021563 () Bool)

(assert (=> b!1101788 m!1021563))

(declare-fun m!1021565 () Bool)

(assert (=> b!1101793 m!1021565))

(declare-fun m!1021567 () Bool)

(assert (=> b!1101795 m!1021567))

(declare-fun m!1021569 () Bool)

(assert (=> b!1101795 m!1021569))

(declare-fun m!1021571 () Bool)

(assert (=> b!1101798 m!1021571))

(declare-fun m!1021573 () Bool)

(assert (=> b!1101798 m!1021573))

(declare-fun m!1021575 () Bool)

(assert (=> b!1101798 m!1021575))

(declare-fun m!1021577 () Bool)

(assert (=> b!1101787 m!1021577))

(declare-fun m!1021579 () Bool)

(assert (=> b!1101800 m!1021579))

(declare-fun m!1021581 () Bool)

(assert (=> b!1101800 m!1021581))

(declare-fun m!1021583 () Bool)

(assert (=> b!1101800 m!1021583))

(declare-fun m!1021585 () Bool)

(assert (=> b!1101800 m!1021585))

(declare-fun m!1021587 () Bool)

(assert (=> b!1101800 m!1021587))

(declare-fun m!1021589 () Bool)

(assert (=> b!1101800 m!1021589))

(declare-fun m!1021591 () Bool)

(assert (=> b!1101800 m!1021591))

(declare-fun m!1021593 () Bool)

(assert (=> b!1101800 m!1021593))

(declare-fun m!1021595 () Bool)

(assert (=> b!1101800 m!1021595))

(declare-fun m!1021597 () Bool)

(assert (=> b!1101800 m!1021597))

(check-sat (not b_next!23185) (not start!96862) (not b!1101799) (not b!1101790) (not b!1101793) (not b_lambda!18121) (not b!1101787) (not mapNonEmpty!42643) (not b!1101788) tp_is_empty!27235 b_and!37149 (not b!1101795) (not b!1101798) (not b!1101800))
(check-sat b_and!37149 (not b_next!23185))
