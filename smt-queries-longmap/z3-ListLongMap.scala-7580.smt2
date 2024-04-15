; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95794 () Bool)

(assert start!95794)

(declare-fun b_free!22453 () Bool)

(declare-fun b_next!22453 () Bool)

(assert (=> start!95794 (= b_free!22453 (not b_next!22453))))

(declare-fun tp!79207 () Bool)

(declare-fun b_and!35555 () Bool)

(assert (=> start!95794 (= tp!79207 b_and!35555)))

(declare-fun b!1083666 () Bool)

(declare-fun e!619162 () Bool)

(declare-fun tp_is_empty!26455 () Bool)

(assert (=> b!1083666 (= e!619162 tp_is_empty!26455)))

(declare-fun b!1083667 () Bool)

(declare-fun res!722446 () Bool)

(declare-fun e!619165 () Bool)

(assert (=> b!1083667 (=> (not res!722446) (not e!619165))))

(declare-datatypes ((array!69778 0))(
  ( (array!69779 (arr!33563 (Array (_ BitVec 32) (_ BitVec 64))) (size!34101 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69778)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69778 (_ BitVec 32)) Bool)

(assert (=> b!1083667 (= res!722446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41437 () Bool)

(declare-fun mapRes!41437 () Bool)

(assert (=> mapIsEmpty!41437 mapRes!41437))

(declare-fun b!1083668 () Bool)

(declare-fun res!722443 () Bool)

(assert (=> b!1083668 (=> (not res!722443) (not e!619165))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083668 (= res!722443 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41437 () Bool)

(declare-fun tp!79208 () Bool)

(assert (=> mapNonEmpty!41437 (= mapRes!41437 (and tp!79208 e!619162))))

(declare-datatypes ((V!40401 0))(
  ( (V!40402 (val!13284 Int)) )
))
(declare-datatypes ((ValueCell!12518 0))(
  ( (ValueCellFull!12518 (v!15904 V!40401)) (EmptyCell!12518) )
))
(declare-datatypes ((array!69780 0))(
  ( (array!69781 (arr!33564 (Array (_ BitVec 32) ValueCell!12518)) (size!34102 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69780)

(declare-fun mapValue!41437 () ValueCell!12518)

(declare-fun mapRest!41437 () (Array (_ BitVec 32) ValueCell!12518))

(declare-fun mapKey!41437 () (_ BitVec 32))

(assert (=> mapNonEmpty!41437 (= (arr!33564 _values!874) (store mapRest!41437 mapKey!41437 mapValue!41437))))

(declare-fun b!1083669 () Bool)

(declare-fun e!619164 () Bool)

(assert (=> b!1083669 (= e!619165 e!619164)))

(declare-fun res!722447 () Bool)

(assert (=> b!1083669 (=> (not res!722447) (not e!619164))))

(declare-fun lt!480098 () array!69778)

(assert (=> b!1083669 (= res!722447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480098 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083669 (= lt!480098 (array!69779 (store (arr!33563 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34101 _keys!1070)))))

(declare-fun b!1083670 () Bool)

(declare-fun res!722451 () Bool)

(assert (=> b!1083670 (=> (not res!722451) (not e!619165))))

(assert (=> b!1083670 (= res!722451 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34101 _keys!1070))))))

(declare-fun b!1083671 () Bool)

(assert (=> b!1083671 (= e!619164 (not true))))

(declare-fun lt!480101 () array!69780)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40401)

(declare-datatypes ((tuple2!16896 0))(
  ( (tuple2!16897 (_1!8459 (_ BitVec 64)) (_2!8459 V!40401)) )
))
(declare-datatypes ((List!23465 0))(
  ( (Nil!23462) (Cons!23461 (h!24670 tuple2!16896) (t!32967 List!23465)) )
))
(declare-datatypes ((ListLongMap!14865 0))(
  ( (ListLongMap!14866 (toList!7448 List!23465)) )
))
(declare-fun lt!480099 () ListLongMap!14865)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40401)

(declare-fun getCurrentListMap!4141 (array!69778 array!69780 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) Int) ListLongMap!14865)

(assert (=> b!1083671 (= lt!480099 (getCurrentListMap!4141 lt!480098 lt!480101 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480094 () ListLongMap!14865)

(declare-fun lt!480097 () ListLongMap!14865)

(assert (=> b!1083671 (and (= lt!480094 lt!480097) (= lt!480097 lt!480094))))

(declare-fun lt!480095 () ListLongMap!14865)

(declare-fun -!727 (ListLongMap!14865 (_ BitVec 64)) ListLongMap!14865)

(assert (=> b!1083671 (= lt!480097 (-!727 lt!480095 k0!904))))

(declare-datatypes ((Unit!35489 0))(
  ( (Unit!35490) )
))
(declare-fun lt!480100 () Unit!35489)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!25 (array!69778 array!69780 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35489)

(assert (=> b!1083671 (= lt!480100 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!25 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4011 (array!69778 array!69780 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) Int) ListLongMap!14865)

(assert (=> b!1083671 (= lt!480094 (getCurrentListMapNoExtraKeys!4011 lt!480098 lt!480101 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2082 (Int (_ BitVec 64)) V!40401)

(assert (=> b!1083671 (= lt!480101 (array!69781 (store (arr!33564 _values!874) i!650 (ValueCellFull!12518 (dynLambda!2082 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34102 _values!874)))))

(assert (=> b!1083671 (= lt!480095 (getCurrentListMapNoExtraKeys!4011 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083671 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480096 () Unit!35489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69778 (_ BitVec 64) (_ BitVec 32)) Unit!35489)

(assert (=> b!1083671 (= lt!480096 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083673 () Bool)

(declare-fun res!722445 () Bool)

(assert (=> b!1083673 (=> (not res!722445) (not e!619165))))

(assert (=> b!1083673 (= res!722445 (and (= (size!34102 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34101 _keys!1070) (size!34102 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083674 () Bool)

(declare-fun e!619163 () Bool)

(assert (=> b!1083674 (= e!619163 tp_is_empty!26455)))

(declare-fun b!1083675 () Bool)

(declare-fun res!722450 () Bool)

(assert (=> b!1083675 (=> (not res!722450) (not e!619165))))

(assert (=> b!1083675 (= res!722450 (= (select (arr!33563 _keys!1070) i!650) k0!904))))

(declare-fun b!1083676 () Bool)

(declare-fun e!619161 () Bool)

(assert (=> b!1083676 (= e!619161 (and e!619163 mapRes!41437))))

(declare-fun condMapEmpty!41437 () Bool)

(declare-fun mapDefault!41437 () ValueCell!12518)

(assert (=> b!1083676 (= condMapEmpty!41437 (= (arr!33564 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12518)) mapDefault!41437)))))

(declare-fun b!1083677 () Bool)

(declare-fun res!722444 () Bool)

(assert (=> b!1083677 (=> (not res!722444) (not e!619164))))

(declare-datatypes ((List!23466 0))(
  ( (Nil!23463) (Cons!23462 (h!24671 (_ BitVec 64)) (t!32968 List!23466)) )
))
(declare-fun arrayNoDuplicates!0 (array!69778 (_ BitVec 32) List!23466) Bool)

(assert (=> b!1083677 (= res!722444 (arrayNoDuplicates!0 lt!480098 #b00000000000000000000000000000000 Nil!23463))))

(declare-fun res!722448 () Bool)

(assert (=> start!95794 (=> (not res!722448) (not e!619165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95794 (= res!722448 (validMask!0 mask!1414))))

(assert (=> start!95794 e!619165))

(assert (=> start!95794 tp!79207))

(assert (=> start!95794 true))

(assert (=> start!95794 tp_is_empty!26455))

(declare-fun array_inv!25944 (array!69778) Bool)

(assert (=> start!95794 (array_inv!25944 _keys!1070)))

(declare-fun array_inv!25945 (array!69780) Bool)

(assert (=> start!95794 (and (array_inv!25945 _values!874) e!619161)))

(declare-fun b!1083672 () Bool)

(declare-fun res!722449 () Bool)

(assert (=> b!1083672 (=> (not res!722449) (not e!619165))))

(assert (=> b!1083672 (= res!722449 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23463))))

(assert (= (and start!95794 res!722448) b!1083673))

(assert (= (and b!1083673 res!722445) b!1083667))

(assert (= (and b!1083667 res!722446) b!1083672))

(assert (= (and b!1083672 res!722449) b!1083670))

(assert (= (and b!1083670 res!722451) b!1083668))

(assert (= (and b!1083668 res!722443) b!1083675))

(assert (= (and b!1083675 res!722450) b!1083669))

(assert (= (and b!1083669 res!722447) b!1083677))

(assert (= (and b!1083677 res!722444) b!1083671))

(assert (= (and b!1083676 condMapEmpty!41437) mapIsEmpty!41437))

(assert (= (and b!1083676 (not condMapEmpty!41437)) mapNonEmpty!41437))

(get-info :version)

(assert (= (and mapNonEmpty!41437 ((_ is ValueCellFull!12518) mapValue!41437)) b!1083666))

(assert (= (and b!1083676 ((_ is ValueCellFull!12518) mapDefault!41437)) b!1083674))

(assert (= start!95794 b!1083676))

(declare-fun b_lambda!17101 () Bool)

(assert (=> (not b_lambda!17101) (not b!1083671)))

(declare-fun t!32966 () Bool)

(declare-fun tb!7323 () Bool)

(assert (=> (and start!95794 (= defaultEntry!882 defaultEntry!882) t!32966) tb!7323))

(declare-fun result!15173 () Bool)

(assert (=> tb!7323 (= result!15173 tp_is_empty!26455)))

(assert (=> b!1083671 t!32966))

(declare-fun b_and!35557 () Bool)

(assert (= b_and!35555 (and (=> t!32966 result!15173) b_and!35557)))

(declare-fun m!1000877 () Bool)

(assert (=> b!1083668 m!1000877))

(declare-fun m!1000879 () Bool)

(assert (=> b!1083671 m!1000879))

(declare-fun m!1000881 () Bool)

(assert (=> b!1083671 m!1000881))

(declare-fun m!1000883 () Bool)

(assert (=> b!1083671 m!1000883))

(declare-fun m!1000885 () Bool)

(assert (=> b!1083671 m!1000885))

(declare-fun m!1000887 () Bool)

(assert (=> b!1083671 m!1000887))

(declare-fun m!1000889 () Bool)

(assert (=> b!1083671 m!1000889))

(declare-fun m!1000891 () Bool)

(assert (=> b!1083671 m!1000891))

(declare-fun m!1000893 () Bool)

(assert (=> b!1083671 m!1000893))

(declare-fun m!1000895 () Bool)

(assert (=> b!1083671 m!1000895))

(declare-fun m!1000897 () Bool)

(assert (=> b!1083672 m!1000897))

(declare-fun m!1000899 () Bool)

(assert (=> mapNonEmpty!41437 m!1000899))

(declare-fun m!1000901 () Bool)

(assert (=> b!1083677 m!1000901))

(declare-fun m!1000903 () Bool)

(assert (=> b!1083669 m!1000903))

(declare-fun m!1000905 () Bool)

(assert (=> b!1083669 m!1000905))

(declare-fun m!1000907 () Bool)

(assert (=> b!1083667 m!1000907))

(declare-fun m!1000909 () Bool)

(assert (=> b!1083675 m!1000909))

(declare-fun m!1000911 () Bool)

(assert (=> start!95794 m!1000911))

(declare-fun m!1000913 () Bool)

(assert (=> start!95794 m!1000913))

(declare-fun m!1000915 () Bool)

(assert (=> start!95794 m!1000915))

(check-sat (not start!95794) b_and!35557 (not mapNonEmpty!41437) (not b_next!22453) (not b!1083677) (not b!1083669) (not b!1083672) (not b!1083668) (not b!1083667) (not b_lambda!17101) tp_is_empty!26455 (not b!1083671))
(check-sat b_and!35557 (not b_next!22453))
