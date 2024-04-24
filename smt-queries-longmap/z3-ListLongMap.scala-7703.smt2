; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96984 () Bool)

(assert start!96984)

(declare-fun b_free!23143 () Bool)

(declare-fun b_next!23143 () Bool)

(assert (=> start!96984 (= b_free!23143 (not b_next!23143))))

(declare-fun tp!81377 () Bool)

(declare-fun b_and!37057 () Bool)

(assert (=> start!96984 (= tp!81377 b_and!37057)))

(declare-fun b!1101753 () Bool)

(declare-fun e!628951 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((V!41385 0))(
  ( (V!41386 (val!13653 Int)) )
))
(declare-datatypes ((ValueCell!12887 0))(
  ( (ValueCellFull!12887 (v!16277 V!41385)) (EmptyCell!12887) )
))
(declare-datatypes ((array!71339 0))(
  ( (array!71340 (arr!34328 (Array (_ BitVec 32) ValueCell!12887)) (size!34865 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71339)

(assert (=> b!1101753 (= e!628951 (bvslt i!650 (size!34865 _values!874)))))

(declare-datatypes ((tuple2!17370 0))(
  ( (tuple2!17371 (_1!8696 (_ BitVec 64)) (_2!8696 V!41385)) )
))
(declare-datatypes ((List!23989 0))(
  ( (Nil!23986) (Cons!23985 (h!25203 tuple2!17370) (t!34170 List!23989)) )
))
(declare-datatypes ((ListLongMap!15347 0))(
  ( (ListLongMap!15348 (toList!7689 List!23989)) )
))
(declare-fun lt!493569 () ListLongMap!15347)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!493559 () ListLongMap!15347)

(declare-fun -!957 (ListLongMap!15347 (_ BitVec 64)) ListLongMap!15347)

(assert (=> b!1101753 (= (-!957 lt!493569 k0!904) lt!493559)))

(declare-fun lt!493567 () ListLongMap!15347)

(declare-datatypes ((Unit!36167 0))(
  ( (Unit!36168) )
))
(declare-fun lt!493560 () Unit!36167)

(declare-fun zeroValue!831 () V!41385)

(declare-fun addRemoveCommutativeForDiffKeys!127 (ListLongMap!15347 (_ BitVec 64) V!41385 (_ BitVec 64)) Unit!36167)

(assert (=> b!1101753 (= lt!493560 (addRemoveCommutativeForDiffKeys!127 lt!493567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1101754 () Bool)

(declare-fun res!734833 () Bool)

(declare-fun e!628949 () Bool)

(assert (=> b!1101754 (=> (not res!734833) (not e!628949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101754 (= res!734833 (validKeyInArray!0 k0!904))))

(declare-fun b!1101755 () Bool)

(declare-fun res!734830 () Bool)

(assert (=> b!1101755 (=> (not res!734830) (not e!628949))))

(declare-datatypes ((array!71341 0))(
  ( (array!71342 (arr!34329 (Array (_ BitVec 32) (_ BitVec 64))) (size!34866 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71341)

(declare-datatypes ((List!23990 0))(
  ( (Nil!23987) (Cons!23986 (h!25204 (_ BitVec 64)) (t!34171 List!23990)) )
))
(declare-fun arrayNoDuplicates!0 (array!71341 (_ BitVec 32) List!23990) Bool)

(assert (=> b!1101755 (= res!734830 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23987))))

(declare-fun b!1101756 () Bool)

(declare-fun res!734832 () Bool)

(declare-fun e!628953 () Bool)

(assert (=> b!1101756 (=> (not res!734832) (not e!628953))))

(declare-fun lt!493568 () array!71341)

(assert (=> b!1101756 (= res!734832 (arrayNoDuplicates!0 lt!493568 #b00000000000000000000000000000000 Nil!23987))))

(declare-fun b!1101757 () Bool)

(declare-fun e!628948 () Bool)

(declare-fun tp_is_empty!27193 () Bool)

(assert (=> b!1101757 (= e!628948 tp_is_empty!27193)))

(declare-fun b!1101758 () Bool)

(declare-fun e!628946 () Bool)

(assert (=> b!1101758 (= e!628946 e!628951)))

(declare-fun res!734825 () Bool)

(assert (=> b!1101758 (=> res!734825 e!628951)))

(assert (=> b!1101758 (= res!734825 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!493571 () ListLongMap!15347)

(assert (=> b!1101758 (= lt!493571 lt!493559)))

(declare-fun lt!493566 () ListLongMap!15347)

(declare-fun lt!493562 () tuple2!17370)

(declare-fun +!3420 (ListLongMap!15347 tuple2!17370) ListLongMap!15347)

(assert (=> b!1101758 (= lt!493559 (+!3420 lt!493566 lt!493562))))

(declare-fun lt!493570 () ListLongMap!15347)

(assert (=> b!1101758 (= lt!493570 lt!493569)))

(assert (=> b!1101758 (= lt!493569 (+!3420 lt!493567 lt!493562))))

(declare-fun lt!493565 () ListLongMap!15347)

(assert (=> b!1101758 (= lt!493571 (+!3420 lt!493565 lt!493562))))

(assert (=> b!1101758 (= lt!493562 (tuple2!17371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1101759 () Bool)

(declare-fun e!628952 () Bool)

(assert (=> b!1101759 (= e!628952 tp_is_empty!27193)))

(declare-fun b!1101760 () Bool)

(declare-fun res!734834 () Bool)

(assert (=> b!1101760 (=> (not res!734834) (not e!628949))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101760 (= res!734834 (and (= (size!34865 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34866 _keys!1070) (size!34865 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101761 () Bool)

(declare-fun res!734824 () Bool)

(assert (=> b!1101761 (=> (not res!734824) (not e!628949))))

(assert (=> b!1101761 (= res!734824 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34866 _keys!1070))))))

(declare-fun mapIsEmpty!42571 () Bool)

(declare-fun mapRes!42571 () Bool)

(assert (=> mapIsEmpty!42571 mapRes!42571))

(declare-fun mapNonEmpty!42571 () Bool)

(declare-fun tp!81376 () Bool)

(assert (=> mapNonEmpty!42571 (= mapRes!42571 (and tp!81376 e!628952))))

(declare-fun mapRest!42571 () (Array (_ BitVec 32) ValueCell!12887))

(declare-fun mapValue!42571 () ValueCell!12887)

(declare-fun mapKey!42571 () (_ BitVec 32))

(assert (=> mapNonEmpty!42571 (= (arr!34328 _values!874) (store mapRest!42571 mapKey!42571 mapValue!42571))))

(declare-fun b!1101762 () Bool)

(declare-fun e!628950 () Bool)

(assert (=> b!1101762 (= e!628950 (and e!628948 mapRes!42571))))

(declare-fun condMapEmpty!42571 () Bool)

(declare-fun mapDefault!42571 () ValueCell!12887)

(assert (=> b!1101762 (= condMapEmpty!42571 (= (arr!34328 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12887)) mapDefault!42571)))))

(declare-fun b!1101763 () Bool)

(declare-fun res!734826 () Bool)

(assert (=> b!1101763 (=> (not res!734826) (not e!628949))))

(assert (=> b!1101763 (= res!734826 (= (select (arr!34329 _keys!1070) i!650) k0!904))))

(declare-fun b!1101764 () Bool)

(assert (=> b!1101764 (= e!628953 (not e!628946))))

(declare-fun res!734828 () Bool)

(assert (=> b!1101764 (=> res!734828 e!628946)))

(assert (=> b!1101764 (= res!734828 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41385)

(declare-fun getCurrentListMap!4393 (array!71341 array!71339 (_ BitVec 32) (_ BitVec 32) V!41385 V!41385 (_ BitVec 32) Int) ListLongMap!15347)

(assert (=> b!1101764 (= lt!493570 (getCurrentListMap!4393 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493561 () array!71339)

(assert (=> b!1101764 (= lt!493571 (getCurrentListMap!4393 lt!493568 lt!493561 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101764 (and (= lt!493565 lt!493566) (= lt!493566 lt!493565))))

(assert (=> b!1101764 (= lt!493566 (-!957 lt!493567 k0!904))))

(declare-fun lt!493564 () Unit!36167)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!227 (array!71341 array!71339 (_ BitVec 32) (_ BitVec 32) V!41385 V!41385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36167)

(assert (=> b!1101764 (= lt!493564 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!227 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4234 (array!71341 array!71339 (_ BitVec 32) (_ BitVec 32) V!41385 V!41385 (_ BitVec 32) Int) ListLongMap!15347)

(assert (=> b!1101764 (= lt!493565 (getCurrentListMapNoExtraKeys!4234 lt!493568 lt!493561 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2352 (Int (_ BitVec 64)) V!41385)

(assert (=> b!1101764 (= lt!493561 (array!71340 (store (arr!34328 _values!874) i!650 (ValueCellFull!12887 (dynLambda!2352 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34865 _values!874)))))

(assert (=> b!1101764 (= lt!493567 (getCurrentListMapNoExtraKeys!4234 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101764 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493563 () Unit!36167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71341 (_ BitVec 64) (_ BitVec 32)) Unit!36167)

(assert (=> b!1101764 (= lt!493563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!734831 () Bool)

(assert (=> start!96984 (=> (not res!734831) (not e!628949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96984 (= res!734831 (validMask!0 mask!1414))))

(assert (=> start!96984 e!628949))

(assert (=> start!96984 tp!81377))

(assert (=> start!96984 true))

(assert (=> start!96984 tp_is_empty!27193))

(declare-fun array_inv!26466 (array!71341) Bool)

(assert (=> start!96984 (array_inv!26466 _keys!1070)))

(declare-fun array_inv!26467 (array!71339) Bool)

(assert (=> start!96984 (and (array_inv!26467 _values!874) e!628950)))

(declare-fun b!1101765 () Bool)

(assert (=> b!1101765 (= e!628949 e!628953)))

(declare-fun res!734827 () Bool)

(assert (=> b!1101765 (=> (not res!734827) (not e!628953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71341 (_ BitVec 32)) Bool)

(assert (=> b!1101765 (= res!734827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493568 mask!1414))))

(assert (=> b!1101765 (= lt!493568 (array!71342 (store (arr!34329 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34866 _keys!1070)))))

(declare-fun b!1101766 () Bool)

(declare-fun res!734829 () Bool)

(assert (=> b!1101766 (=> (not res!734829) (not e!628949))))

(assert (=> b!1101766 (= res!734829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96984 res!734831) b!1101760))

(assert (= (and b!1101760 res!734834) b!1101766))

(assert (= (and b!1101766 res!734829) b!1101755))

(assert (= (and b!1101755 res!734830) b!1101761))

(assert (= (and b!1101761 res!734824) b!1101754))

(assert (= (and b!1101754 res!734833) b!1101763))

(assert (= (and b!1101763 res!734826) b!1101765))

(assert (= (and b!1101765 res!734827) b!1101756))

(assert (= (and b!1101756 res!734832) b!1101764))

(assert (= (and b!1101764 (not res!734828)) b!1101758))

(assert (= (and b!1101758 (not res!734825)) b!1101753))

(assert (= (and b!1101762 condMapEmpty!42571) mapIsEmpty!42571))

(assert (= (and b!1101762 (not condMapEmpty!42571)) mapNonEmpty!42571))

(get-info :version)

(assert (= (and mapNonEmpty!42571 ((_ is ValueCellFull!12887) mapValue!42571)) b!1101759))

(assert (= (and b!1101762 ((_ is ValueCellFull!12887) mapDefault!42571)) b!1101757))

(assert (= start!96984 b!1101762))

(declare-fun b_lambda!18021 () Bool)

(assert (=> (not b_lambda!18021) (not b!1101764)))

(declare-fun t!34169 () Bool)

(declare-fun tb!8001 () Bool)

(assert (=> (and start!96984 (= defaultEntry!882 defaultEntry!882) t!34169) tb!8001))

(declare-fun result!16547 () Bool)

(assert (=> tb!8001 (= result!16547 tp_is_empty!27193)))

(assert (=> b!1101764 t!34169))

(declare-fun b_and!37059 () Bool)

(assert (= b_and!37057 (and (=> t!34169 result!16547) b_and!37059)))

(declare-fun m!1022165 () Bool)

(assert (=> b!1101758 m!1022165))

(declare-fun m!1022167 () Bool)

(assert (=> b!1101758 m!1022167))

(declare-fun m!1022169 () Bool)

(assert (=> b!1101758 m!1022169))

(declare-fun m!1022171 () Bool)

(assert (=> b!1101764 m!1022171))

(declare-fun m!1022173 () Bool)

(assert (=> b!1101764 m!1022173))

(declare-fun m!1022175 () Bool)

(assert (=> b!1101764 m!1022175))

(declare-fun m!1022177 () Bool)

(assert (=> b!1101764 m!1022177))

(declare-fun m!1022179 () Bool)

(assert (=> b!1101764 m!1022179))

(declare-fun m!1022181 () Bool)

(assert (=> b!1101764 m!1022181))

(declare-fun m!1022183 () Bool)

(assert (=> b!1101764 m!1022183))

(declare-fun m!1022185 () Bool)

(assert (=> b!1101764 m!1022185))

(declare-fun m!1022187 () Bool)

(assert (=> b!1101764 m!1022187))

(declare-fun m!1022189 () Bool)

(assert (=> b!1101764 m!1022189))

(declare-fun m!1022191 () Bool)

(assert (=> b!1101756 m!1022191))

(declare-fun m!1022193 () Bool)

(assert (=> b!1101766 m!1022193))

(declare-fun m!1022195 () Bool)

(assert (=> b!1101754 m!1022195))

(declare-fun m!1022197 () Bool)

(assert (=> b!1101763 m!1022197))

(declare-fun m!1022199 () Bool)

(assert (=> mapNonEmpty!42571 m!1022199))

(declare-fun m!1022201 () Bool)

(assert (=> b!1101765 m!1022201))

(declare-fun m!1022203 () Bool)

(assert (=> b!1101765 m!1022203))

(declare-fun m!1022205 () Bool)

(assert (=> b!1101755 m!1022205))

(declare-fun m!1022207 () Bool)

(assert (=> start!96984 m!1022207))

(declare-fun m!1022209 () Bool)

(assert (=> start!96984 m!1022209))

(declare-fun m!1022211 () Bool)

(assert (=> start!96984 m!1022211))

(declare-fun m!1022213 () Bool)

(assert (=> b!1101753 m!1022213))

(declare-fun m!1022215 () Bool)

(assert (=> b!1101753 m!1022215))

(check-sat (not b!1101753) (not b_lambda!18021) tp_is_empty!27193 (not b!1101755) (not b!1101766) (not b!1101756) (not b!1101754) (not mapNonEmpty!42571) (not b!1101764) (not b_next!23143) (not start!96984) b_and!37059 (not b!1101765) (not b!1101758))
(check-sat b_and!37059 (not b_next!23143))
