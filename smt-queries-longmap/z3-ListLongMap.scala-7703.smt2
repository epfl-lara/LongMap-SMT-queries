; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96742 () Bool)

(assert start!96742)

(declare-fun b_free!23143 () Bool)

(declare-fun b_next!23143 () Bool)

(assert (=> start!96742 (= b_free!23143 (not b_next!23143))))

(declare-fun tp!81377 () Bool)

(declare-fun b_and!37021 () Bool)

(assert (=> start!96742 (= tp!81377 b_and!37021)))

(declare-fun b!1100273 () Bool)

(declare-fun res!734242 () Bool)

(declare-fun e!628002 () Bool)

(assert (=> b!1100273 (=> (not res!734242) (not e!628002))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100273 (= res!734242 (validKeyInArray!0 k0!904))))

(declare-fun b!1100274 () Bool)

(declare-fun e!628001 () Bool)

(declare-fun tp_is_empty!27193 () Bool)

(assert (=> b!1100274 (= e!628001 tp_is_empty!27193)))

(declare-fun mapNonEmpty!42571 () Bool)

(declare-fun mapRes!42571 () Bool)

(declare-fun tp!81376 () Bool)

(declare-fun e!628003 () Bool)

(assert (=> mapNonEmpty!42571 (= mapRes!42571 (and tp!81376 e!628003))))

(declare-datatypes ((V!41385 0))(
  ( (V!41386 (val!13653 Int)) )
))
(declare-datatypes ((ValueCell!12887 0))(
  ( (ValueCellFull!12887 (v!16280 V!41385)) (EmptyCell!12887) )
))
(declare-fun mapRest!42571 () (Array (_ BitVec 32) ValueCell!12887))

(declare-datatypes ((array!71212 0))(
  ( (array!71213 (arr!34271 (Array (_ BitVec 32) ValueCell!12887)) (size!34809 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71212)

(declare-fun mapValue!42571 () ValueCell!12887)

(declare-fun mapKey!42571 () (_ BitVec 32))

(assert (=> mapNonEmpty!42571 (= (arr!34271 _values!874) (store mapRest!42571 mapKey!42571 mapValue!42571))))

(declare-fun b!1100275 () Bool)

(declare-fun res!734234 () Bool)

(assert (=> b!1100275 (=> (not res!734234) (not e!628002))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71214 0))(
  ( (array!71215 (arr!34272 (Array (_ BitVec 32) (_ BitVec 64))) (size!34810 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71214)

(assert (=> b!1100275 (= res!734234 (and (= (size!34809 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34810 _keys!1070) (size!34809 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100276 () Bool)

(assert (=> b!1100276 (= e!628003 tp_is_empty!27193)))

(declare-fun b!1100277 () Bool)

(declare-fun res!734241 () Bool)

(assert (=> b!1100277 (=> (not res!734241) (not e!628002))))

(declare-datatypes ((List!24008 0))(
  ( (Nil!24005) (Cons!24004 (h!25213 (_ BitVec 64)) (t!34188 List!24008)) )
))
(declare-fun arrayNoDuplicates!0 (array!71214 (_ BitVec 32) List!24008) Bool)

(assert (=> b!1100277 (= res!734241 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24005))))

(declare-fun mapIsEmpty!42571 () Bool)

(assert (=> mapIsEmpty!42571 mapRes!42571))

(declare-fun b!1100278 () Bool)

(declare-fun res!734233 () Bool)

(declare-fun e!627998 () Bool)

(assert (=> b!1100278 (=> (not res!734233) (not e!627998))))

(declare-fun lt!492846 () array!71214)

(assert (=> b!1100278 (= res!734233 (arrayNoDuplicates!0 lt!492846 #b00000000000000000000000000000000 Nil!24005))))

(declare-fun b!1100279 () Bool)

(declare-fun res!734239 () Bool)

(assert (=> b!1100279 (=> (not res!734239) (not e!628002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71214 (_ BitVec 32)) Bool)

(assert (=> b!1100279 (= res!734239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100280 () Bool)

(declare-fun e!627999 () Bool)

(declare-fun e!628005 () Bool)

(assert (=> b!1100280 (= e!627999 e!628005)))

(declare-fun res!734240 () Bool)

(assert (=> b!1100280 (=> res!734240 e!628005)))

(assert (=> b!1100280 (= res!734240 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17416 0))(
  ( (tuple2!17417 (_1!8719 (_ BitVec 64)) (_2!8719 V!41385)) )
))
(declare-datatypes ((List!24009 0))(
  ( (Nil!24006) (Cons!24005 (h!25214 tuple2!17416) (t!34189 List!24009)) )
))
(declare-datatypes ((ListLongMap!15385 0))(
  ( (ListLongMap!15386 (toList!7708 List!24009)) )
))
(declare-fun lt!492845 () ListLongMap!15385)

(declare-fun lt!492854 () ListLongMap!15385)

(assert (=> b!1100280 (= lt!492845 lt!492854)))

(declare-fun lt!492853 () ListLongMap!15385)

(declare-fun lt!492852 () tuple2!17416)

(declare-fun +!3419 (ListLongMap!15385 tuple2!17416) ListLongMap!15385)

(assert (=> b!1100280 (= lt!492854 (+!3419 lt!492853 lt!492852))))

(declare-fun lt!492848 () ListLongMap!15385)

(declare-fun lt!492856 () ListLongMap!15385)

(assert (=> b!1100280 (= lt!492848 lt!492856)))

(declare-fun lt!492844 () ListLongMap!15385)

(assert (=> b!1100280 (= lt!492856 (+!3419 lt!492844 lt!492852))))

(declare-fun lt!492855 () ListLongMap!15385)

(assert (=> b!1100280 (= lt!492845 (+!3419 lt!492855 lt!492852))))

(declare-fun zeroValue!831 () V!41385)

(assert (=> b!1100280 (= lt!492852 (tuple2!17417 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!734237 () Bool)

(assert (=> start!96742 (=> (not res!734237) (not e!628002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96742 (= res!734237 (validMask!0 mask!1414))))

(assert (=> start!96742 e!628002))

(assert (=> start!96742 tp!81377))

(assert (=> start!96742 true))

(assert (=> start!96742 tp_is_empty!27193))

(declare-fun array_inv!26430 (array!71214) Bool)

(assert (=> start!96742 (array_inv!26430 _keys!1070)))

(declare-fun e!628004 () Bool)

(declare-fun array_inv!26431 (array!71212) Bool)

(assert (=> start!96742 (and (array_inv!26431 _values!874) e!628004)))

(declare-fun b!1100281 () Bool)

(assert (=> b!1100281 (= e!627998 (not e!627999))))

(declare-fun res!734235 () Bool)

(assert (=> b!1100281 (=> res!734235 e!627999)))

(assert (=> b!1100281 (= res!734235 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41385)

(declare-fun getCurrentListMap!4326 (array!71214 array!71212 (_ BitVec 32) (_ BitVec 32) V!41385 V!41385 (_ BitVec 32) Int) ListLongMap!15385)

(assert (=> b!1100281 (= lt!492848 (getCurrentListMap!4326 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492849 () array!71212)

(assert (=> b!1100281 (= lt!492845 (getCurrentListMap!4326 lt!492846 lt!492849 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1100281 (and (= lt!492855 lt!492853) (= lt!492853 lt!492855))))

(declare-fun -!941 (ListLongMap!15385 (_ BitVec 64)) ListLongMap!15385)

(assert (=> b!1100281 (= lt!492853 (-!941 lt!492844 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36003 0))(
  ( (Unit!36004) )
))
(declare-fun lt!492850 () Unit!36003)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!215 (array!71214 array!71212 (_ BitVec 32) (_ BitVec 32) V!41385 V!41385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36003)

(assert (=> b!1100281 (= lt!492850 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4233 (array!71214 array!71212 (_ BitVec 32) (_ BitVec 32) V!41385 V!41385 (_ BitVec 32) Int) ListLongMap!15385)

(assert (=> b!1100281 (= lt!492855 (getCurrentListMapNoExtraKeys!4233 lt!492846 lt!492849 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2302 (Int (_ BitVec 64)) V!41385)

(assert (=> b!1100281 (= lt!492849 (array!71213 (store (arr!34271 _values!874) i!650 (ValueCellFull!12887 (dynLambda!2302 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34809 _values!874)))))

(assert (=> b!1100281 (= lt!492844 (getCurrentListMapNoExtraKeys!4233 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100281 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492847 () Unit!36003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71214 (_ BitVec 64) (_ BitVec 32)) Unit!36003)

(assert (=> b!1100281 (= lt!492847 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100282 () Bool)

(assert (=> b!1100282 (= e!628005 (bvslt i!650 (size!34809 _values!874)))))

(assert (=> b!1100282 (= (-!941 lt!492856 k0!904) lt!492854)))

(declare-fun lt!492851 () Unit!36003)

(declare-fun addRemoveCommutativeForDiffKeys!128 (ListLongMap!15385 (_ BitVec 64) V!41385 (_ BitVec 64)) Unit!36003)

(assert (=> b!1100282 (= lt!492851 (addRemoveCommutativeForDiffKeys!128 lt!492844 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1100283 () Bool)

(declare-fun res!734236 () Bool)

(assert (=> b!1100283 (=> (not res!734236) (not e!628002))))

(assert (=> b!1100283 (= res!734236 (= (select (arr!34272 _keys!1070) i!650) k0!904))))

(declare-fun b!1100284 () Bool)

(declare-fun res!734238 () Bool)

(assert (=> b!1100284 (=> (not res!734238) (not e!628002))))

(assert (=> b!1100284 (= res!734238 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34810 _keys!1070))))))

(declare-fun b!1100285 () Bool)

(assert (=> b!1100285 (= e!628004 (and e!628001 mapRes!42571))))

(declare-fun condMapEmpty!42571 () Bool)

(declare-fun mapDefault!42571 () ValueCell!12887)

(assert (=> b!1100285 (= condMapEmpty!42571 (= (arr!34271 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12887)) mapDefault!42571)))))

(declare-fun b!1100286 () Bool)

(assert (=> b!1100286 (= e!628002 e!627998)))

(declare-fun res!734243 () Bool)

(assert (=> b!1100286 (=> (not res!734243) (not e!627998))))

(assert (=> b!1100286 (= res!734243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492846 mask!1414))))

(assert (=> b!1100286 (= lt!492846 (array!71215 (store (arr!34272 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34810 _keys!1070)))))

(assert (= (and start!96742 res!734237) b!1100275))

(assert (= (and b!1100275 res!734234) b!1100279))

(assert (= (and b!1100279 res!734239) b!1100277))

(assert (= (and b!1100277 res!734241) b!1100284))

(assert (= (and b!1100284 res!734238) b!1100273))

(assert (= (and b!1100273 res!734242) b!1100283))

(assert (= (and b!1100283 res!734236) b!1100286))

(assert (= (and b!1100286 res!734243) b!1100278))

(assert (= (and b!1100278 res!734233) b!1100281))

(assert (= (and b!1100281 (not res!734235)) b!1100280))

(assert (= (and b!1100280 (not res!734240)) b!1100282))

(assert (= (and b!1100285 condMapEmpty!42571) mapIsEmpty!42571))

(assert (= (and b!1100285 (not condMapEmpty!42571)) mapNonEmpty!42571))

(get-info :version)

(assert (= (and mapNonEmpty!42571 ((_ is ValueCellFull!12887) mapValue!42571)) b!1100276))

(assert (= (and b!1100285 ((_ is ValueCellFull!12887) mapDefault!42571)) b!1100274))

(assert (= start!96742 b!1100285))

(declare-fun b_lambda!17989 () Bool)

(assert (=> (not b_lambda!17989) (not b!1100281)))

(declare-fun t!34187 () Bool)

(declare-fun tb!8001 () Bool)

(assert (=> (and start!96742 (= defaultEntry!882 defaultEntry!882) t!34187) tb!8001))

(declare-fun result!16547 () Bool)

(assert (=> tb!8001 (= result!16547 tp_is_empty!27193)))

(assert (=> b!1100281 t!34187))

(declare-fun b_and!37023 () Bool)

(assert (= b_and!37021 (and (=> t!34187 result!16547) b_and!37023)))

(declare-fun m!1019867 () Bool)

(assert (=> start!96742 m!1019867))

(declare-fun m!1019869 () Bool)

(assert (=> start!96742 m!1019869))

(declare-fun m!1019871 () Bool)

(assert (=> start!96742 m!1019871))

(declare-fun m!1019873 () Bool)

(assert (=> b!1100280 m!1019873))

(declare-fun m!1019875 () Bool)

(assert (=> b!1100280 m!1019875))

(declare-fun m!1019877 () Bool)

(assert (=> b!1100280 m!1019877))

(declare-fun m!1019879 () Bool)

(assert (=> b!1100281 m!1019879))

(declare-fun m!1019881 () Bool)

(assert (=> b!1100281 m!1019881))

(declare-fun m!1019883 () Bool)

(assert (=> b!1100281 m!1019883))

(declare-fun m!1019885 () Bool)

(assert (=> b!1100281 m!1019885))

(declare-fun m!1019887 () Bool)

(assert (=> b!1100281 m!1019887))

(declare-fun m!1019889 () Bool)

(assert (=> b!1100281 m!1019889))

(declare-fun m!1019891 () Bool)

(assert (=> b!1100281 m!1019891))

(declare-fun m!1019893 () Bool)

(assert (=> b!1100281 m!1019893))

(declare-fun m!1019895 () Bool)

(assert (=> b!1100281 m!1019895))

(declare-fun m!1019897 () Bool)

(assert (=> b!1100281 m!1019897))

(declare-fun m!1019899 () Bool)

(assert (=> b!1100282 m!1019899))

(declare-fun m!1019901 () Bool)

(assert (=> b!1100282 m!1019901))

(declare-fun m!1019903 () Bool)

(assert (=> b!1100283 m!1019903))

(declare-fun m!1019905 () Bool)

(assert (=> b!1100277 m!1019905))

(declare-fun m!1019907 () Bool)

(assert (=> b!1100279 m!1019907))

(declare-fun m!1019909 () Bool)

(assert (=> b!1100286 m!1019909))

(declare-fun m!1019911 () Bool)

(assert (=> b!1100286 m!1019911))

(declare-fun m!1019913 () Bool)

(assert (=> mapNonEmpty!42571 m!1019913))

(declare-fun m!1019915 () Bool)

(assert (=> b!1100278 m!1019915))

(declare-fun m!1019917 () Bool)

(assert (=> b!1100273 m!1019917))

(check-sat (not b_lambda!17989) (not b_next!23143) b_and!37023 (not b!1100281) (not start!96742) (not b!1100282) (not b!1100278) (not mapNonEmpty!42571) (not b!1100279) (not b!1100286) (not b!1100273) (not b!1100277) tp_is_empty!27193 (not b!1100280))
(check-sat b_and!37023 (not b_next!23143))
