; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96756 () Bool)

(assert start!96756)

(declare-fun b_free!23151 () Bool)

(declare-fun b_next!23151 () Bool)

(assert (=> start!96756 (= b_free!23151 (not b_next!23151))))

(declare-fun tp!81401 () Bool)

(declare-fun b_and!37063 () Bool)

(assert (=> start!96756 (= tp!81401 b_and!37063)))

(declare-fun b!1100602 () Bool)

(declare-fun res!734438 () Bool)

(declare-fun e!628191 () Bool)

(assert (=> b!1100602 (=> (not res!734438) (not e!628191))))

(declare-datatypes ((array!71321 0))(
  ( (array!71322 (arr!34325 (Array (_ BitVec 32) (_ BitVec 64))) (size!34861 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71321)

(declare-datatypes ((List!23981 0))(
  ( (Nil!23978) (Cons!23977 (h!25186 (_ BitVec 64)) (t!34178 List!23981)) )
))
(declare-fun arrayNoDuplicates!0 (array!71321 (_ BitVec 32) List!23981) Bool)

(assert (=> b!1100602 (= res!734438 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23978))))

(declare-fun mapIsEmpty!42583 () Bool)

(declare-fun mapRes!42583 () Bool)

(assert (=> mapIsEmpty!42583 mapRes!42583))

(declare-fun b!1100603 () Bool)

(declare-fun res!734435 () Bool)

(assert (=> b!1100603 (=> (not res!734435) (not e!628191))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100603 (= res!734435 (validKeyInArray!0 k0!904))))

(declare-fun b!1100604 () Bool)

(declare-fun res!734434 () Bool)

(assert (=> b!1100604 (=> (not res!734434) (not e!628191))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71321 (_ BitVec 32)) Bool)

(assert (=> b!1100604 (= res!734434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100605 () Bool)

(declare-datatypes ((V!41395 0))(
  ( (V!41396 (val!13657 Int)) )
))
(declare-datatypes ((tuple2!17366 0))(
  ( (tuple2!17367 (_1!8694 (_ BitVec 64)) (_2!8694 V!41395)) )
))
(declare-datatypes ((List!23982 0))(
  ( (Nil!23979) (Cons!23978 (h!25187 tuple2!17366) (t!34179 List!23982)) )
))
(declare-datatypes ((ListLongMap!15335 0))(
  ( (ListLongMap!15336 (toList!7683 List!23982)) )
))
(declare-fun lt!493201 () ListLongMap!15335)

(declare-fun e!628193 () Bool)

(declare-fun lt!493211 () ListLongMap!15335)

(declare-fun -!968 (ListLongMap!15335 (_ BitVec 64)) ListLongMap!15335)

(assert (=> b!1100605 (= e!628193 (= (-!968 lt!493211 k0!904) lt!493201))))

(declare-fun lt!493210 () ListLongMap!15335)

(declare-fun lt!493204 () ListLongMap!15335)

(assert (=> b!1100605 (= (-!968 lt!493210 k0!904) lt!493204)))

(declare-datatypes ((Unit!36182 0))(
  ( (Unit!36183) )
))
(declare-fun lt!493209 () Unit!36182)

(declare-fun zeroValue!831 () V!41395)

(declare-fun lt!493203 () ListLongMap!15335)

(declare-fun addRemoveCommutativeForDiffKeys!131 (ListLongMap!15335 (_ BitVec 64) V!41395 (_ BitVec 64)) Unit!36182)

(assert (=> b!1100605 (= lt!493209 (addRemoveCommutativeForDiffKeys!131 lt!493203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1100606 () Bool)

(declare-fun e!628192 () Bool)

(declare-fun tp_is_empty!27201 () Bool)

(assert (=> b!1100606 (= e!628192 tp_is_empty!27201)))

(declare-fun b!1100607 () Bool)

(declare-fun e!628187 () Bool)

(declare-fun e!628190 () Bool)

(assert (=> b!1100607 (= e!628187 (not e!628190))))

(declare-fun res!734442 () Bool)

(assert (=> b!1100607 (=> res!734442 e!628190)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100607 (= res!734442 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41395)

(declare-datatypes ((ValueCell!12891 0))(
  ( (ValueCellFull!12891 (v!16285 V!41395)) (EmptyCell!12891) )
))
(declare-datatypes ((array!71323 0))(
  ( (array!71324 (arr!34326 (Array (_ BitVec 32) ValueCell!12891)) (size!34862 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71323)

(declare-fun getCurrentListMap!4391 (array!71321 array!71323 (_ BitVec 32) (_ BitVec 32) V!41395 V!41395 (_ BitVec 32) Int) ListLongMap!15335)

(assert (=> b!1100607 (= lt!493211 (getCurrentListMap!4391 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493208 () array!71321)

(declare-fun lt!493207 () array!71323)

(assert (=> b!1100607 (= lt!493201 (getCurrentListMap!4391 lt!493208 lt!493207 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493205 () ListLongMap!15335)

(declare-fun lt!493202 () ListLongMap!15335)

(assert (=> b!1100607 (and (= lt!493205 lt!493202) (= lt!493202 lt!493205))))

(assert (=> b!1100607 (= lt!493202 (-!968 lt!493203 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!493200 () Unit!36182)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!217 (array!71321 array!71323 (_ BitVec 32) (_ BitVec 32) V!41395 V!41395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36182)

(assert (=> b!1100607 (= lt!493200 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!217 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4187 (array!71321 array!71323 (_ BitVec 32) (_ BitVec 32) V!41395 V!41395 (_ BitVec 32) Int) ListLongMap!15335)

(assert (=> b!1100607 (= lt!493205 (getCurrentListMapNoExtraKeys!4187 lt!493208 lt!493207 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2322 (Int (_ BitVec 64)) V!41395)

(assert (=> b!1100607 (= lt!493207 (array!71324 (store (arr!34326 _values!874) i!650 (ValueCellFull!12891 (dynLambda!2322 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34862 _values!874)))))

(assert (=> b!1100607 (= lt!493203 (getCurrentListMapNoExtraKeys!4187 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100607 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493212 () Unit!36182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71321 (_ BitVec 64) (_ BitVec 32)) Unit!36182)

(assert (=> b!1100607 (= lt!493212 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100608 () Bool)

(declare-fun e!628189 () Bool)

(assert (=> b!1100608 (= e!628189 (and e!628192 mapRes!42583))))

(declare-fun condMapEmpty!42583 () Bool)

(declare-fun mapDefault!42583 () ValueCell!12891)

(assert (=> b!1100608 (= condMapEmpty!42583 (= (arr!34326 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12891)) mapDefault!42583)))))

(declare-fun b!1100609 () Bool)

(declare-fun res!734440 () Bool)

(assert (=> b!1100609 (=> (not res!734440) (not e!628187))))

(assert (=> b!1100609 (= res!734440 (arrayNoDuplicates!0 lt!493208 #b00000000000000000000000000000000 Nil!23978))))

(declare-fun b!1100610 () Bool)

(assert (=> b!1100610 (= e!628191 e!628187)))

(declare-fun res!734439 () Bool)

(assert (=> b!1100610 (=> (not res!734439) (not e!628187))))

(assert (=> b!1100610 (= res!734439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493208 mask!1414))))

(assert (=> b!1100610 (= lt!493208 (array!71322 (store (arr!34325 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34861 _keys!1070)))))

(declare-fun res!734441 () Bool)

(assert (=> start!96756 (=> (not res!734441) (not e!628191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96756 (= res!734441 (validMask!0 mask!1414))))

(assert (=> start!96756 e!628191))

(assert (=> start!96756 tp!81401))

(assert (=> start!96756 true))

(assert (=> start!96756 tp_is_empty!27201))

(declare-fun array_inv!26438 (array!71321) Bool)

(assert (=> start!96756 (array_inv!26438 _keys!1070)))

(declare-fun array_inv!26439 (array!71323) Bool)

(assert (=> start!96756 (and (array_inv!26439 _values!874) e!628189)))

(declare-fun mapNonEmpty!42583 () Bool)

(declare-fun tp!81400 () Bool)

(declare-fun e!628194 () Bool)

(assert (=> mapNonEmpty!42583 (= mapRes!42583 (and tp!81400 e!628194))))

(declare-fun mapRest!42583 () (Array (_ BitVec 32) ValueCell!12891))

(declare-fun mapKey!42583 () (_ BitVec 32))

(declare-fun mapValue!42583 () ValueCell!12891)

(assert (=> mapNonEmpty!42583 (= (arr!34326 _values!874) (store mapRest!42583 mapKey!42583 mapValue!42583))))

(declare-fun b!1100611 () Bool)

(declare-fun res!734437 () Bool)

(assert (=> b!1100611 (=> (not res!734437) (not e!628191))))

(assert (=> b!1100611 (= res!734437 (and (= (size!34862 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34861 _keys!1070) (size!34862 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100612 () Bool)

(assert (=> b!1100612 (= e!628194 tp_is_empty!27201)))

(declare-fun b!1100613 () Bool)

(declare-fun res!734444 () Bool)

(assert (=> b!1100613 (=> (not res!734444) (not e!628191))))

(assert (=> b!1100613 (= res!734444 (= (select (arr!34325 _keys!1070) i!650) k0!904))))

(declare-fun b!1100614 () Bool)

(assert (=> b!1100614 (= e!628190 e!628193)))

(declare-fun res!734436 () Bool)

(assert (=> b!1100614 (=> res!734436 e!628193)))

(assert (=> b!1100614 (= res!734436 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1100614 (= lt!493201 lt!493204)))

(declare-fun lt!493206 () tuple2!17366)

(declare-fun +!3388 (ListLongMap!15335 tuple2!17366) ListLongMap!15335)

(assert (=> b!1100614 (= lt!493204 (+!3388 lt!493202 lt!493206))))

(assert (=> b!1100614 (= lt!493211 lt!493210)))

(assert (=> b!1100614 (= lt!493210 (+!3388 lt!493203 lt!493206))))

(assert (=> b!1100614 (= lt!493201 (+!3388 lt!493205 lt!493206))))

(assert (=> b!1100614 (= lt!493206 (tuple2!17367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100615 () Bool)

(declare-fun res!734443 () Bool)

(assert (=> b!1100615 (=> (not res!734443) (not e!628191))))

(assert (=> b!1100615 (= res!734443 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34861 _keys!1070))))))

(assert (= (and start!96756 res!734441) b!1100611))

(assert (= (and b!1100611 res!734437) b!1100604))

(assert (= (and b!1100604 res!734434) b!1100602))

(assert (= (and b!1100602 res!734438) b!1100615))

(assert (= (and b!1100615 res!734443) b!1100603))

(assert (= (and b!1100603 res!734435) b!1100613))

(assert (= (and b!1100613 res!734444) b!1100610))

(assert (= (and b!1100610 res!734439) b!1100609))

(assert (= (and b!1100609 res!734440) b!1100607))

(assert (= (and b!1100607 (not res!734442)) b!1100614))

(assert (= (and b!1100614 (not res!734436)) b!1100605))

(assert (= (and b!1100608 condMapEmpty!42583) mapIsEmpty!42583))

(assert (= (and b!1100608 (not condMapEmpty!42583)) mapNonEmpty!42583))

(get-info :version)

(assert (= (and mapNonEmpty!42583 ((_ is ValueCellFull!12891) mapValue!42583)) b!1100612))

(assert (= (and b!1100608 ((_ is ValueCellFull!12891) mapDefault!42583)) b!1100606))

(assert (= start!96756 b!1100608))

(declare-fun b_lambda!18019 () Bool)

(assert (=> (not b_lambda!18019) (not b!1100607)))

(declare-fun t!34177 () Bool)

(declare-fun tb!8017 () Bool)

(assert (=> (and start!96756 (= defaultEntry!882 defaultEntry!882) t!34177) tb!8017))

(declare-fun result!16571 () Bool)

(assert (=> tb!8017 (= result!16571 tp_is_empty!27201)))

(assert (=> b!1100607 t!34177))

(declare-fun b_and!37065 () Bool)

(assert (= b_and!37063 (and (=> t!34177 result!16571) b_and!37065)))

(declare-fun m!1020703 () Bool)

(assert (=> b!1100603 m!1020703))

(declare-fun m!1020705 () Bool)

(assert (=> mapNonEmpty!42583 m!1020705))

(declare-fun m!1020707 () Bool)

(assert (=> b!1100613 m!1020707))

(declare-fun m!1020709 () Bool)

(assert (=> start!96756 m!1020709))

(declare-fun m!1020711 () Bool)

(assert (=> start!96756 m!1020711))

(declare-fun m!1020713 () Bool)

(assert (=> start!96756 m!1020713))

(declare-fun m!1020715 () Bool)

(assert (=> b!1100604 m!1020715))

(declare-fun m!1020717 () Bool)

(assert (=> b!1100605 m!1020717))

(declare-fun m!1020719 () Bool)

(assert (=> b!1100605 m!1020719))

(declare-fun m!1020721 () Bool)

(assert (=> b!1100605 m!1020721))

(declare-fun m!1020723 () Bool)

(assert (=> b!1100602 m!1020723))

(declare-fun m!1020725 () Bool)

(assert (=> b!1100609 m!1020725))

(declare-fun m!1020727 () Bool)

(assert (=> b!1100614 m!1020727))

(declare-fun m!1020729 () Bool)

(assert (=> b!1100614 m!1020729))

(declare-fun m!1020731 () Bool)

(assert (=> b!1100614 m!1020731))

(declare-fun m!1020733 () Bool)

(assert (=> b!1100607 m!1020733))

(declare-fun m!1020735 () Bool)

(assert (=> b!1100607 m!1020735))

(declare-fun m!1020737 () Bool)

(assert (=> b!1100607 m!1020737))

(declare-fun m!1020739 () Bool)

(assert (=> b!1100607 m!1020739))

(declare-fun m!1020741 () Bool)

(assert (=> b!1100607 m!1020741))

(declare-fun m!1020743 () Bool)

(assert (=> b!1100607 m!1020743))

(declare-fun m!1020745 () Bool)

(assert (=> b!1100607 m!1020745))

(declare-fun m!1020747 () Bool)

(assert (=> b!1100607 m!1020747))

(declare-fun m!1020749 () Bool)

(assert (=> b!1100607 m!1020749))

(declare-fun m!1020751 () Bool)

(assert (=> b!1100607 m!1020751))

(declare-fun m!1020753 () Bool)

(assert (=> b!1100610 m!1020753))

(declare-fun m!1020755 () Bool)

(assert (=> b!1100610 m!1020755))

(check-sat (not b_lambda!18019) (not b!1100604) tp_is_empty!27201 (not b!1100603) b_and!37065 (not b!1100602) (not b_next!23151) (not b!1100609) (not b!1100607) (not b!1100610) (not start!96756) (not b!1100605) (not mapNonEmpty!42583) (not b!1100614))
(check-sat b_and!37065 (not b_next!23151))
