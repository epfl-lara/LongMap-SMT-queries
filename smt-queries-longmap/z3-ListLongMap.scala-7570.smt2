; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95976 () Bool)

(assert start!95976)

(declare-fun b_free!22393 () Bool)

(declare-fun b_next!22393 () Bool)

(assert (=> start!95976 (= b_free!22393 (not b_next!22393))))

(declare-fun tp!79027 () Bool)

(declare-fun b_and!35471 () Bool)

(assert (=> start!95976 (= tp!79027 b_and!35471)))

(declare-fun b!1084006 () Bool)

(declare-fun e!619571 () Bool)

(declare-fun e!619570 () Bool)

(assert (=> b!1084006 (= e!619571 e!619570)))

(declare-fun res!722226 () Bool)

(assert (=> b!1084006 (=> (not res!722226) (not e!619570))))

(declare-datatypes ((array!69773 0))(
  ( (array!69774 (arr!33554 (Array (_ BitVec 32) (_ BitVec 64))) (size!34091 (_ BitVec 32))) )
))
(declare-fun lt!480230 () array!69773)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69773 (_ BitVec 32)) Bool)

(assert (=> b!1084006 (= res!722226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480230 mask!1414))))

(declare-fun _keys!1070 () array!69773)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084006 (= lt!480230 (array!69774 (store (arr!33554 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34091 _keys!1070)))))

(declare-fun b!1084007 () Bool)

(declare-fun e!619572 () Bool)

(declare-fun tp_is_empty!26395 () Bool)

(assert (=> b!1084007 (= e!619572 tp_is_empty!26395)))

(declare-fun mapIsEmpty!41347 () Bool)

(declare-fun mapRes!41347 () Bool)

(assert (=> mapIsEmpty!41347 mapRes!41347))

(declare-fun b!1084009 () Bool)

(declare-fun e!619573 () Bool)

(assert (=> b!1084009 (= e!619573 tp_is_empty!26395)))

(declare-fun b!1084010 () Bool)

(declare-fun res!722229 () Bool)

(assert (=> b!1084010 (=> (not res!722229) (not e!619571))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084010 (= res!722229 (= (select (arr!33554 _keys!1070) i!650) k0!904))))

(declare-fun b!1084011 () Bool)

(declare-fun res!722227 () Bool)

(assert (=> b!1084011 (=> (not res!722227) (not e!619571))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40321 0))(
  ( (V!40322 (val!13254 Int)) )
))
(declare-datatypes ((ValueCell!12488 0))(
  ( (ValueCellFull!12488 (v!15871 V!40321)) (EmptyCell!12488) )
))
(declare-datatypes ((array!69775 0))(
  ( (array!69776 (arr!33555 (Array (_ BitVec 32) ValueCell!12488)) (size!34092 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69775)

(assert (=> b!1084011 (= res!722227 (and (= (size!34092 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34091 _keys!1070) (size!34092 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41347 () Bool)

(declare-fun tp!79028 () Bool)

(assert (=> mapNonEmpty!41347 (= mapRes!41347 (and tp!79028 e!619572))))

(declare-fun mapKey!41347 () (_ BitVec 32))

(declare-fun mapRest!41347 () (Array (_ BitVec 32) ValueCell!12488))

(declare-fun mapValue!41347 () ValueCell!12488)

(assert (=> mapNonEmpty!41347 (= (arr!33555 _values!874) (store mapRest!41347 mapKey!41347 mapValue!41347))))

(declare-fun b!1084012 () Bool)

(declare-fun res!722230 () Bool)

(assert (=> b!1084012 (=> (not res!722230) (not e!619571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084012 (= res!722230 (validKeyInArray!0 k0!904))))

(declare-fun b!1084013 () Bool)

(declare-fun res!722224 () Bool)

(assert (=> b!1084013 (=> (not res!722224) (not e!619570))))

(declare-datatypes ((List!23389 0))(
  ( (Nil!23386) (Cons!23385 (h!24603 (_ BitVec 64)) (t!32832 List!23389)) )
))
(declare-fun arrayNoDuplicates!0 (array!69773 (_ BitVec 32) List!23389) Bool)

(assert (=> b!1084013 (= res!722224 (arrayNoDuplicates!0 lt!480230 #b00000000000000000000000000000000 Nil!23386))))

(declare-fun b!1084014 () Bool)

(declare-fun e!619569 () Bool)

(assert (=> b!1084014 (= e!619569 (and e!619573 mapRes!41347))))

(declare-fun condMapEmpty!41347 () Bool)

(declare-fun mapDefault!41347 () ValueCell!12488)

(assert (=> b!1084014 (= condMapEmpty!41347 (= (arr!33555 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12488)) mapDefault!41347)))))

(declare-fun b!1084015 () Bool)

(declare-fun res!722228 () Bool)

(assert (=> b!1084015 (=> (not res!722228) (not e!619571))))

(assert (=> b!1084015 (= res!722228 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34091 _keys!1070))))))

(declare-fun b!1084016 () Bool)

(declare-fun res!722225 () Bool)

(assert (=> b!1084016 (=> (not res!722225) (not e!619571))))

(assert (=> b!1084016 (= res!722225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084017 () Bool)

(assert (=> b!1084017 (= e!619570 (not true))))

(declare-datatypes ((tuple2!16796 0))(
  ( (tuple2!16797 (_1!8409 (_ BitVec 64)) (_2!8409 V!40321)) )
))
(declare-datatypes ((List!23390 0))(
  ( (Nil!23387) (Cons!23386 (h!24604 tuple2!16796) (t!32833 List!23390)) )
))
(declare-datatypes ((ListLongMap!14773 0))(
  ( (ListLongMap!14774 (toList!7402 List!23390)) )
))
(declare-fun lt!480233 () ListLongMap!14773)

(declare-fun lt!480232 () ListLongMap!14773)

(assert (=> b!1084017 (and (= lt!480233 lt!480232) (= lt!480232 lt!480233))))

(declare-fun lt!480231 () ListLongMap!14773)

(declare-fun -!714 (ListLongMap!14773 (_ BitVec 64)) ListLongMap!14773)

(assert (=> b!1084017 (= lt!480232 (-!714 lt!480231 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40321)

(declare-datatypes ((Unit!35595 0))(
  ( (Unit!35596) )
))
(declare-fun lt!480234 () Unit!35595)

(declare-fun zeroValue!831 () V!40321)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!3 (array!69773 array!69775 (_ BitVec 32) (_ BitVec 32) V!40321 V!40321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35595)

(assert (=> b!1084017 (= lt!480234 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!3 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3979 (array!69773 array!69775 (_ BitVec 32) (_ BitVec 32) V!40321 V!40321 (_ BitVec 32) Int) ListLongMap!14773)

(declare-fun dynLambda!2100 (Int (_ BitVec 64)) V!40321)

(assert (=> b!1084017 (= lt!480233 (getCurrentListMapNoExtraKeys!3979 lt!480230 (array!69776 (store (arr!33555 _values!874) i!650 (ValueCellFull!12488 (dynLambda!2100 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34092 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084017 (= lt!480231 (getCurrentListMapNoExtraKeys!3979 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084017 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480229 () Unit!35595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69773 (_ BitVec 64) (_ BitVec 32)) Unit!35595)

(assert (=> b!1084017 (= lt!480229 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!722231 () Bool)

(assert (=> start!95976 (=> (not res!722231) (not e!619571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95976 (= res!722231 (validMask!0 mask!1414))))

(assert (=> start!95976 e!619571))

(assert (=> start!95976 tp!79027))

(assert (=> start!95976 true))

(assert (=> start!95976 tp_is_empty!26395))

(declare-fun array_inv!25944 (array!69773) Bool)

(assert (=> start!95976 (array_inv!25944 _keys!1070)))

(declare-fun array_inv!25945 (array!69775) Bool)

(assert (=> start!95976 (and (array_inv!25945 _values!874) e!619569)))

(declare-fun b!1084008 () Bool)

(declare-fun res!722232 () Bool)

(assert (=> b!1084008 (=> (not res!722232) (not e!619571))))

(assert (=> b!1084008 (= res!722232 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23386))))

(assert (= (and start!95976 res!722231) b!1084011))

(assert (= (and b!1084011 res!722227) b!1084016))

(assert (= (and b!1084016 res!722225) b!1084008))

(assert (= (and b!1084008 res!722232) b!1084015))

(assert (= (and b!1084015 res!722228) b!1084012))

(assert (= (and b!1084012 res!722230) b!1084010))

(assert (= (and b!1084010 res!722229) b!1084006))

(assert (= (and b!1084006 res!722226) b!1084013))

(assert (= (and b!1084013 res!722224) b!1084017))

(assert (= (and b!1084014 condMapEmpty!41347) mapIsEmpty!41347))

(assert (= (and b!1084014 (not condMapEmpty!41347)) mapNonEmpty!41347))

(get-info :version)

(assert (= (and mapNonEmpty!41347 ((_ is ValueCellFull!12488) mapValue!41347)) b!1084007))

(assert (= (and b!1084014 ((_ is ValueCellFull!12488) mapDefault!41347)) b!1084009))

(assert (= start!95976 b!1084014))

(declare-fun b_lambda!17073 () Bool)

(assert (=> (not b_lambda!17073) (not b!1084017)))

(declare-fun t!32831 () Bool)

(declare-fun tb!7263 () Bool)

(assert (=> (and start!95976 (= defaultEntry!882 defaultEntry!882) t!32831) tb!7263))

(declare-fun result!15053 () Bool)

(assert (=> tb!7263 (= result!15053 tp_is_empty!26395)))

(assert (=> b!1084017 t!32831))

(declare-fun b_and!35473 () Bool)

(assert (= b_and!35471 (and (=> t!32831 result!15053) b_and!35473)))

(declare-fun m!1002023 () Bool)

(assert (=> b!1084016 m!1002023))

(declare-fun m!1002025 () Bool)

(assert (=> b!1084017 m!1002025))

(declare-fun m!1002027 () Bool)

(assert (=> b!1084017 m!1002027))

(declare-fun m!1002029 () Bool)

(assert (=> b!1084017 m!1002029))

(declare-fun m!1002031 () Bool)

(assert (=> b!1084017 m!1002031))

(declare-fun m!1002033 () Bool)

(assert (=> b!1084017 m!1002033))

(declare-fun m!1002035 () Bool)

(assert (=> b!1084017 m!1002035))

(declare-fun m!1002037 () Bool)

(assert (=> b!1084017 m!1002037))

(declare-fun m!1002039 () Bool)

(assert (=> b!1084017 m!1002039))

(declare-fun m!1002041 () Bool)

(assert (=> b!1084013 m!1002041))

(declare-fun m!1002043 () Bool)

(assert (=> start!95976 m!1002043))

(declare-fun m!1002045 () Bool)

(assert (=> start!95976 m!1002045))

(declare-fun m!1002047 () Bool)

(assert (=> start!95976 m!1002047))

(declare-fun m!1002049 () Bool)

(assert (=> mapNonEmpty!41347 m!1002049))

(declare-fun m!1002051 () Bool)

(assert (=> b!1084008 m!1002051))

(declare-fun m!1002053 () Bool)

(assert (=> b!1084006 m!1002053))

(declare-fun m!1002055 () Bool)

(assert (=> b!1084006 m!1002055))

(declare-fun m!1002057 () Bool)

(assert (=> b!1084012 m!1002057))

(declare-fun m!1002059 () Bool)

(assert (=> b!1084010 m!1002059))

(check-sat (not start!95976) (not b_next!22393) (not b!1084006) (not mapNonEmpty!41347) (not b_lambda!17073) b_and!35473 (not b!1084008) tp_is_empty!26395 (not b!1084013) (not b!1084016) (not b!1084012) (not b!1084017))
(check-sat b_and!35473 (not b_next!22393))
