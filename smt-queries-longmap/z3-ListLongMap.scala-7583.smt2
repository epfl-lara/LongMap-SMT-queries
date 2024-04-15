; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95812 () Bool)

(assert start!95812)

(declare-fun b_free!22471 () Bool)

(declare-fun b_next!22471 () Bool)

(assert (=> start!95812 (= b_free!22471 (not b_next!22471))))

(declare-fun tp!79262 () Bool)

(declare-fun b_and!35591 () Bool)

(assert (=> start!95812 (= tp!79262 b_and!35591)))

(declare-fun res!722688 () Bool)

(declare-fun e!619324 () Bool)

(assert (=> start!95812 (=> (not res!722688) (not e!619324))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95812 (= res!722688 (validMask!0 mask!1414))))

(assert (=> start!95812 e!619324))

(assert (=> start!95812 tp!79262))

(assert (=> start!95812 true))

(declare-fun tp_is_empty!26473 () Bool)

(assert (=> start!95812 tp_is_empty!26473))

(declare-datatypes ((array!69810 0))(
  ( (array!69811 (arr!33579 (Array (_ BitVec 32) (_ BitVec 64))) (size!34117 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69810)

(declare-fun array_inv!25956 (array!69810) Bool)

(assert (=> start!95812 (array_inv!25956 _keys!1070)))

(declare-datatypes ((V!40425 0))(
  ( (V!40426 (val!13293 Int)) )
))
(declare-datatypes ((ValueCell!12527 0))(
  ( (ValueCellFull!12527 (v!15913 V!40425)) (EmptyCell!12527) )
))
(declare-datatypes ((array!69812 0))(
  ( (array!69813 (arr!33580 (Array (_ BitVec 32) ValueCell!12527)) (size!34118 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69812)

(declare-fun e!619328 () Bool)

(declare-fun array_inv!25957 (array!69812) Bool)

(assert (=> start!95812 (and (array_inv!25957 _values!874) e!619328)))

(declare-fun mapNonEmpty!41464 () Bool)

(declare-fun mapRes!41464 () Bool)

(declare-fun tp!79261 () Bool)

(declare-fun e!619327 () Bool)

(assert (=> mapNonEmpty!41464 (= mapRes!41464 (and tp!79261 e!619327))))

(declare-fun mapRest!41464 () (Array (_ BitVec 32) ValueCell!12527))

(declare-fun mapKey!41464 () (_ BitVec 32))

(declare-fun mapValue!41464 () ValueCell!12527)

(assert (=> mapNonEmpty!41464 (= (arr!33580 _values!874) (store mapRest!41464 mapKey!41464 mapValue!41464))))

(declare-fun b!1084008 () Bool)

(declare-fun res!722689 () Bool)

(assert (=> b!1084008 (=> (not res!722689) (not e!619324))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084008 (= res!722689 (validKeyInArray!0 k0!904))))

(declare-fun b!1084009 () Bool)

(declare-fun res!722687 () Bool)

(declare-fun e!619326 () Bool)

(assert (=> b!1084009 (=> (not res!722687) (not e!619326))))

(declare-fun lt!480314 () array!69810)

(declare-datatypes ((List!23478 0))(
  ( (Nil!23475) (Cons!23474 (h!24683 (_ BitVec 64)) (t!32998 List!23478)) )
))
(declare-fun arrayNoDuplicates!0 (array!69810 (_ BitVec 32) List!23478) Bool)

(assert (=> b!1084009 (= res!722687 (arrayNoDuplicates!0 lt!480314 #b00000000000000000000000000000000 Nil!23475))))

(declare-fun b!1084010 () Bool)

(declare-fun e!619325 () Bool)

(assert (=> b!1084010 (= e!619328 (and e!619325 mapRes!41464))))

(declare-fun condMapEmpty!41464 () Bool)

(declare-fun mapDefault!41464 () ValueCell!12527)

(assert (=> b!1084010 (= condMapEmpty!41464 (= (arr!33580 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12527)) mapDefault!41464)))))

(declare-fun b!1084011 () Bool)

(declare-fun res!722693 () Bool)

(assert (=> b!1084011 (=> (not res!722693) (not e!619324))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084011 (= res!722693 (= (select (arr!33579 _keys!1070) i!650) k0!904))))

(declare-fun b!1084012 () Bool)

(declare-fun res!722690 () Bool)

(assert (=> b!1084012 (=> (not res!722690) (not e!619324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69810 (_ BitVec 32)) Bool)

(assert (=> b!1084012 (= res!722690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084013 () Bool)

(assert (=> b!1084013 (= e!619325 tp_is_empty!26473)))

(declare-fun b!1084014 () Bool)

(assert (=> b!1084014 (= e!619326 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16908 0))(
  ( (tuple2!16909 (_1!8465 (_ BitVec 64)) (_2!8465 V!40425)) )
))
(declare-datatypes ((List!23479 0))(
  ( (Nil!23476) (Cons!23475 (h!24684 tuple2!16908) (t!32999 List!23479)) )
))
(declare-datatypes ((ListLongMap!14877 0))(
  ( (ListLongMap!14878 (toList!7454 List!23479)) )
))
(declare-fun lt!480313 () ListLongMap!14877)

(declare-fun lt!480315 () array!69812)

(declare-fun zeroValue!831 () V!40425)

(declare-fun minValue!831 () V!40425)

(declare-fun getCurrentListMap!4147 (array!69810 array!69812 (_ BitVec 32) (_ BitVec 32) V!40425 V!40425 (_ BitVec 32) Int) ListLongMap!14877)

(assert (=> b!1084014 (= lt!480313 (getCurrentListMap!4147 lt!480314 lt!480315 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480310 () ListLongMap!14877)

(declare-fun lt!480311 () ListLongMap!14877)

(assert (=> b!1084014 (and (= lt!480310 lt!480311) (= lt!480311 lt!480310))))

(declare-fun lt!480312 () ListLongMap!14877)

(declare-fun -!733 (ListLongMap!14877 (_ BitVec 64)) ListLongMap!14877)

(assert (=> b!1084014 (= lt!480311 (-!733 lt!480312 k0!904))))

(declare-datatypes ((Unit!35501 0))(
  ( (Unit!35502) )
))
(declare-fun lt!480316 () Unit!35501)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!31 (array!69810 array!69812 (_ BitVec 32) (_ BitVec 32) V!40425 V!40425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35501)

(assert (=> b!1084014 (= lt!480316 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!31 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4017 (array!69810 array!69812 (_ BitVec 32) (_ BitVec 32) V!40425 V!40425 (_ BitVec 32) Int) ListLongMap!14877)

(assert (=> b!1084014 (= lt!480310 (getCurrentListMapNoExtraKeys!4017 lt!480314 lt!480315 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2088 (Int (_ BitVec 64)) V!40425)

(assert (=> b!1084014 (= lt!480315 (array!69813 (store (arr!33580 _values!874) i!650 (ValueCellFull!12527 (dynLambda!2088 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34118 _values!874)))))

(assert (=> b!1084014 (= lt!480312 (getCurrentListMapNoExtraKeys!4017 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084014 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480317 () Unit!35501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69810 (_ BitVec 64) (_ BitVec 32)) Unit!35501)

(assert (=> b!1084014 (= lt!480317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084015 () Bool)

(declare-fun res!722691 () Bool)

(assert (=> b!1084015 (=> (not res!722691) (not e!619324))))

(assert (=> b!1084015 (= res!722691 (and (= (size!34118 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34117 _keys!1070) (size!34118 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084016 () Bool)

(declare-fun res!722694 () Bool)

(assert (=> b!1084016 (=> (not res!722694) (not e!619324))))

(assert (=> b!1084016 (= res!722694 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34117 _keys!1070))))))

(declare-fun mapIsEmpty!41464 () Bool)

(assert (=> mapIsEmpty!41464 mapRes!41464))

(declare-fun b!1084017 () Bool)

(assert (=> b!1084017 (= e!619324 e!619326)))

(declare-fun res!722692 () Bool)

(assert (=> b!1084017 (=> (not res!722692) (not e!619326))))

(assert (=> b!1084017 (= res!722692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480314 mask!1414))))

(assert (=> b!1084017 (= lt!480314 (array!69811 (store (arr!33579 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34117 _keys!1070)))))

(declare-fun b!1084018 () Bool)

(assert (=> b!1084018 (= e!619327 tp_is_empty!26473)))

(declare-fun b!1084019 () Bool)

(declare-fun res!722686 () Bool)

(assert (=> b!1084019 (=> (not res!722686) (not e!619324))))

(assert (=> b!1084019 (= res!722686 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23475))))

(assert (= (and start!95812 res!722688) b!1084015))

(assert (= (and b!1084015 res!722691) b!1084012))

(assert (= (and b!1084012 res!722690) b!1084019))

(assert (= (and b!1084019 res!722686) b!1084016))

(assert (= (and b!1084016 res!722694) b!1084008))

(assert (= (and b!1084008 res!722689) b!1084011))

(assert (= (and b!1084011 res!722693) b!1084017))

(assert (= (and b!1084017 res!722692) b!1084009))

(assert (= (and b!1084009 res!722687) b!1084014))

(assert (= (and b!1084010 condMapEmpty!41464) mapIsEmpty!41464))

(assert (= (and b!1084010 (not condMapEmpty!41464)) mapNonEmpty!41464))

(get-info :version)

(assert (= (and mapNonEmpty!41464 ((_ is ValueCellFull!12527) mapValue!41464)) b!1084018))

(assert (= (and b!1084010 ((_ is ValueCellFull!12527) mapDefault!41464)) b!1084013))

(assert (= start!95812 b!1084010))

(declare-fun b_lambda!17119 () Bool)

(assert (=> (not b_lambda!17119) (not b!1084014)))

(declare-fun t!32997 () Bool)

(declare-fun tb!7341 () Bool)

(assert (=> (and start!95812 (= defaultEntry!882 defaultEntry!882) t!32997) tb!7341))

(declare-fun result!15209 () Bool)

(assert (=> tb!7341 (= result!15209 tp_is_empty!26473)))

(assert (=> b!1084014 t!32997))

(declare-fun b_and!35593 () Bool)

(assert (= b_and!35591 (and (=> t!32997 result!15209) b_and!35593)))

(declare-fun m!1001237 () Bool)

(assert (=> mapNonEmpty!41464 m!1001237))

(declare-fun m!1001239 () Bool)

(assert (=> b!1084011 m!1001239))

(declare-fun m!1001241 () Bool)

(assert (=> b!1084009 m!1001241))

(declare-fun m!1001243 () Bool)

(assert (=> b!1084019 m!1001243))

(declare-fun m!1001245 () Bool)

(assert (=> b!1084012 m!1001245))

(declare-fun m!1001247 () Bool)

(assert (=> b!1084017 m!1001247))

(declare-fun m!1001249 () Bool)

(assert (=> b!1084017 m!1001249))

(declare-fun m!1001251 () Bool)

(assert (=> b!1084008 m!1001251))

(declare-fun m!1001253 () Bool)

(assert (=> start!95812 m!1001253))

(declare-fun m!1001255 () Bool)

(assert (=> start!95812 m!1001255))

(declare-fun m!1001257 () Bool)

(assert (=> start!95812 m!1001257))

(declare-fun m!1001259 () Bool)

(assert (=> b!1084014 m!1001259))

(declare-fun m!1001261 () Bool)

(assert (=> b!1084014 m!1001261))

(declare-fun m!1001263 () Bool)

(assert (=> b!1084014 m!1001263))

(declare-fun m!1001265 () Bool)

(assert (=> b!1084014 m!1001265))

(declare-fun m!1001267 () Bool)

(assert (=> b!1084014 m!1001267))

(declare-fun m!1001269 () Bool)

(assert (=> b!1084014 m!1001269))

(declare-fun m!1001271 () Bool)

(assert (=> b!1084014 m!1001271))

(declare-fun m!1001273 () Bool)

(assert (=> b!1084014 m!1001273))

(declare-fun m!1001275 () Bool)

(assert (=> b!1084014 m!1001275))

(check-sat (not b!1084008) (not b!1084009) (not b_lambda!17119) (not b!1084014) (not b!1084019) tp_is_empty!26473 b_and!35593 (not start!95812) (not mapNonEmpty!41464) (not b!1084012) (not b!1084017) (not b_next!22471))
(check-sat b_and!35593 (not b_next!22471))
