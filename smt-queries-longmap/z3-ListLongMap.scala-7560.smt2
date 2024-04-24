; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95916 () Bool)

(assert start!95916)

(declare-fun b_free!22333 () Bool)

(declare-fun b_next!22333 () Bool)

(assert (=> start!95916 (= b_free!22333 (not b_next!22333))))

(declare-fun tp!78847 () Bool)

(declare-fun b_and!35351 () Bool)

(assert (=> start!95916 (= tp!78847 b_and!35351)))

(declare-fun b!1082866 () Bool)

(declare-fun e!619030 () Bool)

(declare-fun tp_is_empty!26335 () Bool)

(assert (=> b!1082866 (= e!619030 tp_is_empty!26335)))

(declare-fun b!1082867 () Bool)

(declare-fun res!721417 () Bool)

(declare-fun e!619033 () Bool)

(assert (=> b!1082867 (=> (not res!721417) (not e!619033))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69655 0))(
  ( (array!69656 (arr!33495 (Array (_ BitVec 32) (_ BitVec 64))) (size!34032 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69655)

(assert (=> b!1082867 (= res!721417 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34032 _keys!1070))))))

(declare-fun b!1082868 () Bool)

(declare-fun res!721422 () Bool)

(assert (=> b!1082868 (=> (not res!721422) (not e!619033))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1082868 (= res!721422 (= (select (arr!33495 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41257 () Bool)

(declare-fun mapRes!41257 () Bool)

(declare-fun tp!78848 () Bool)

(assert (=> mapNonEmpty!41257 (= mapRes!41257 (and tp!78848 e!619030))))

(declare-datatypes ((V!40241 0))(
  ( (V!40242 (val!13224 Int)) )
))
(declare-datatypes ((ValueCell!12458 0))(
  ( (ValueCellFull!12458 (v!15841 V!40241)) (EmptyCell!12458) )
))
(declare-datatypes ((array!69657 0))(
  ( (array!69658 (arr!33496 (Array (_ BitVec 32) ValueCell!12458)) (size!34033 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69657)

(declare-fun mapRest!41257 () (Array (_ BitVec 32) ValueCell!12458))

(declare-fun mapValue!41257 () ValueCell!12458)

(declare-fun mapKey!41257 () (_ BitVec 32))

(assert (=> mapNonEmpty!41257 (= (arr!33496 _values!874) (store mapRest!41257 mapKey!41257 mapValue!41257))))

(declare-fun b!1082869 () Bool)

(declare-fun res!721421 () Bool)

(assert (=> b!1082869 (=> (not res!721421) (not e!619033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082869 (= res!721421 (validKeyInArray!0 k0!904))))

(declare-fun b!1082870 () Bool)

(declare-fun e!619031 () Bool)

(assert (=> b!1082870 (= e!619033 e!619031)))

(declare-fun res!721418 () Bool)

(assert (=> b!1082870 (=> (not res!721418) (not e!619031))))

(declare-fun lt!479849 () array!69655)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69655 (_ BitVec 32)) Bool)

(assert (=> b!1082870 (= res!721418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479849 mask!1414))))

(assert (=> b!1082870 (= lt!479849 (array!69656 (store (arr!33495 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34032 _keys!1070)))))

(declare-fun b!1082871 () Bool)

(declare-fun res!721420 () Bool)

(assert (=> b!1082871 (=> (not res!721420) (not e!619033))))

(assert (=> b!1082871 (= res!721420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082872 () Bool)

(declare-fun res!721414 () Bool)

(assert (=> b!1082872 (=> (not res!721414) (not e!619033))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082872 (= res!721414 (and (= (size!34033 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34032 _keys!1070) (size!34033 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082873 () Bool)

(declare-fun res!721416 () Bool)

(assert (=> b!1082873 (=> (not res!721416) (not e!619033))))

(declare-datatypes ((List!23343 0))(
  ( (Nil!23340) (Cons!23339 (h!24557 (_ BitVec 64)) (t!32726 List!23343)) )
))
(declare-fun arrayNoDuplicates!0 (array!69655 (_ BitVec 32) List!23343) Bool)

(assert (=> b!1082873 (= res!721416 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23340))))

(declare-fun mapIsEmpty!41257 () Bool)

(assert (=> mapIsEmpty!41257 mapRes!41257))

(declare-fun res!721419 () Bool)

(assert (=> start!95916 (=> (not res!721419) (not e!619033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95916 (= res!721419 (validMask!0 mask!1414))))

(assert (=> start!95916 e!619033))

(assert (=> start!95916 tp!78847))

(assert (=> start!95916 true))

(assert (=> start!95916 tp_is_empty!26335))

(declare-fun array_inv!25896 (array!69655) Bool)

(assert (=> start!95916 (array_inv!25896 _keys!1070)))

(declare-fun e!619032 () Bool)

(declare-fun array_inv!25897 (array!69657) Bool)

(assert (=> start!95916 (and (array_inv!25897 _values!874) e!619032)))

(declare-fun b!1082874 () Bool)

(assert (=> b!1082874 (= e!619031 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40241)

(declare-datatypes ((tuple2!16754 0))(
  ( (tuple2!16755 (_1!8388 (_ BitVec 64)) (_2!8388 V!40241)) )
))
(declare-datatypes ((List!23344 0))(
  ( (Nil!23341) (Cons!23340 (h!24558 tuple2!16754) (t!32727 List!23344)) )
))
(declare-datatypes ((ListLongMap!14731 0))(
  ( (ListLongMap!14732 (toList!7381 List!23344)) )
))
(declare-fun lt!479847 () ListLongMap!14731)

(declare-fun zeroValue!831 () V!40241)

(declare-fun getCurrentListMapNoExtraKeys!3958 (array!69655 array!69657 (_ BitVec 32) (_ BitVec 32) V!40241 V!40241 (_ BitVec 32) Int) ListLongMap!14731)

(declare-fun dynLambda!2079 (Int (_ BitVec 64)) V!40241)

(assert (=> b!1082874 (= lt!479847 (getCurrentListMapNoExtraKeys!3958 lt!479849 (array!69658 (store (arr!33496 _values!874) i!650 (ValueCellFull!12458 (dynLambda!2079 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34033 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479850 () ListLongMap!14731)

(assert (=> b!1082874 (= lt!479850 (getCurrentListMapNoExtraKeys!3958 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082874 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35553 0))(
  ( (Unit!35554) )
))
(declare-fun lt!479848 () Unit!35553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69655 (_ BitVec 64) (_ BitVec 32)) Unit!35553)

(assert (=> b!1082874 (= lt!479848 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082875 () Bool)

(declare-fun res!721415 () Bool)

(assert (=> b!1082875 (=> (not res!721415) (not e!619031))))

(assert (=> b!1082875 (= res!721415 (arrayNoDuplicates!0 lt!479849 #b00000000000000000000000000000000 Nil!23340))))

(declare-fun b!1082876 () Bool)

(declare-fun e!619029 () Bool)

(assert (=> b!1082876 (= e!619029 tp_is_empty!26335)))

(declare-fun b!1082877 () Bool)

(assert (=> b!1082877 (= e!619032 (and e!619029 mapRes!41257))))

(declare-fun condMapEmpty!41257 () Bool)

(declare-fun mapDefault!41257 () ValueCell!12458)

(assert (=> b!1082877 (= condMapEmpty!41257 (= (arr!33496 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12458)) mapDefault!41257)))))

(assert (= (and start!95916 res!721419) b!1082872))

(assert (= (and b!1082872 res!721414) b!1082871))

(assert (= (and b!1082871 res!721420) b!1082873))

(assert (= (and b!1082873 res!721416) b!1082867))

(assert (= (and b!1082867 res!721417) b!1082869))

(assert (= (and b!1082869 res!721421) b!1082868))

(assert (= (and b!1082868 res!721422) b!1082870))

(assert (= (and b!1082870 res!721418) b!1082875))

(assert (= (and b!1082875 res!721415) b!1082874))

(assert (= (and b!1082877 condMapEmpty!41257) mapIsEmpty!41257))

(assert (= (and b!1082877 (not condMapEmpty!41257)) mapNonEmpty!41257))

(get-info :version)

(assert (= (and mapNonEmpty!41257 ((_ is ValueCellFull!12458) mapValue!41257)) b!1082866))

(assert (= (and b!1082877 ((_ is ValueCellFull!12458) mapDefault!41257)) b!1082876))

(assert (= start!95916 b!1082877))

(declare-fun b_lambda!17013 () Bool)

(assert (=> (not b_lambda!17013) (not b!1082874)))

(declare-fun t!32725 () Bool)

(declare-fun tb!7203 () Bool)

(assert (=> (and start!95916 (= defaultEntry!882 defaultEntry!882) t!32725) tb!7203))

(declare-fun result!14933 () Bool)

(assert (=> tb!7203 (= result!14933 tp_is_empty!26335)))

(assert (=> b!1082874 t!32725))

(declare-fun b_and!35353 () Bool)

(assert (= b_and!35351 (and (=> t!32725 result!14933) b_and!35353)))

(declare-fun m!1000991 () Bool)

(assert (=> start!95916 m!1000991))

(declare-fun m!1000993 () Bool)

(assert (=> start!95916 m!1000993))

(declare-fun m!1000995 () Bool)

(assert (=> start!95916 m!1000995))

(declare-fun m!1000997 () Bool)

(assert (=> b!1082875 m!1000997))

(declare-fun m!1000999 () Bool)

(assert (=> b!1082874 m!1000999))

(declare-fun m!1001001 () Bool)

(assert (=> b!1082874 m!1001001))

(declare-fun m!1001003 () Bool)

(assert (=> b!1082874 m!1001003))

(declare-fun m!1001005 () Bool)

(assert (=> b!1082874 m!1001005))

(declare-fun m!1001007 () Bool)

(assert (=> b!1082874 m!1001007))

(declare-fun m!1001009 () Bool)

(assert (=> b!1082874 m!1001009))

(declare-fun m!1001011 () Bool)

(assert (=> b!1082873 m!1001011))

(declare-fun m!1001013 () Bool)

(assert (=> b!1082870 m!1001013))

(declare-fun m!1001015 () Bool)

(assert (=> b!1082870 m!1001015))

(declare-fun m!1001017 () Bool)

(assert (=> b!1082871 m!1001017))

(declare-fun m!1001019 () Bool)

(assert (=> b!1082869 m!1001019))

(declare-fun m!1001021 () Bool)

(assert (=> mapNonEmpty!41257 m!1001021))

(declare-fun m!1001023 () Bool)

(assert (=> b!1082868 m!1001023))

(check-sat (not start!95916) (not b!1082870) (not b!1082873) (not b!1082871) (not b!1082875) (not mapNonEmpty!41257) (not b_lambda!17013) (not b!1082874) (not b_next!22333) tp_is_empty!26335 b_and!35353 (not b!1082869))
(check-sat b_and!35353 (not b_next!22333))
