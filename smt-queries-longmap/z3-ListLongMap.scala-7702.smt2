; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96736 () Bool)

(assert start!96736)

(declare-fun b_free!23137 () Bool)

(declare-fun b_next!23137 () Bool)

(assert (=> start!96736 (= b_free!23137 (not b_next!23137))))

(declare-fun tp!81358 () Bool)

(declare-fun b_and!37009 () Bool)

(assert (=> start!96736 (= tp!81358 b_and!37009)))

(declare-fun b!1100141 () Bool)

(declare-fun e!627926 () Bool)

(declare-fun e!627931 () Bool)

(declare-fun mapRes!42562 () Bool)

(assert (=> b!1100141 (= e!627926 (and e!627931 mapRes!42562))))

(declare-fun condMapEmpty!42562 () Bool)

(declare-datatypes ((V!41377 0))(
  ( (V!41378 (val!13650 Int)) )
))
(declare-datatypes ((ValueCell!12884 0))(
  ( (ValueCellFull!12884 (v!16277 V!41377)) (EmptyCell!12884) )
))
(declare-datatypes ((array!71200 0))(
  ( (array!71201 (arr!34265 (Array (_ BitVec 32) ValueCell!12884)) (size!34803 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71200)

(declare-fun mapDefault!42562 () ValueCell!12884)

(assert (=> b!1100141 (= condMapEmpty!42562 (= (arr!34265 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12884)) mapDefault!42562)))))

(declare-fun b!1100142 () Bool)

(declare-fun res!734142 () Bool)

(declare-fun e!627927 () Bool)

(assert (=> b!1100142 (=> (not res!734142) (not e!627927))))

(declare-datatypes ((array!71202 0))(
  ( (array!71203 (arr!34266 (Array (_ BitVec 32) (_ BitVec 64))) (size!34804 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71202)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71202 (_ BitVec 32)) Bool)

(assert (=> b!1100142 (= res!734142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100143 () Bool)

(declare-fun res!734139 () Bool)

(assert (=> b!1100143 (=> (not res!734139) (not e!627927))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100143 (= res!734139 (and (= (size!34803 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34804 _keys!1070) (size!34803 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100144 () Bool)

(declare-fun e!627930 () Bool)

(declare-fun e!627932 () Bool)

(assert (=> b!1100144 (= e!627930 e!627932)))

(declare-fun res!734134 () Bool)

(assert (=> b!1100144 (=> res!734134 e!627932)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1100144 (= res!734134 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17410 0))(
  ( (tuple2!17411 (_1!8716 (_ BitVec 64)) (_2!8716 V!41377)) )
))
(declare-datatypes ((List!24003 0))(
  ( (Nil!24000) (Cons!23999 (h!25208 tuple2!17410) (t!34177 List!24003)) )
))
(declare-datatypes ((ListLongMap!15379 0))(
  ( (ListLongMap!15380 (toList!7705 List!24003)) )
))
(declare-fun lt!492739 () ListLongMap!15379)

(declare-fun lt!492733 () ListLongMap!15379)

(assert (=> b!1100144 (= lt!492739 lt!492733)))

(declare-fun lt!492734 () ListLongMap!15379)

(declare-fun lt!492729 () tuple2!17410)

(declare-fun +!3416 (ListLongMap!15379 tuple2!17410) ListLongMap!15379)

(assert (=> b!1100144 (= lt!492733 (+!3416 lt!492734 lt!492729))))

(declare-fun lt!492732 () ListLongMap!15379)

(declare-fun lt!492736 () ListLongMap!15379)

(assert (=> b!1100144 (= lt!492732 lt!492736)))

(declare-fun lt!492738 () ListLongMap!15379)

(assert (=> b!1100144 (= lt!492736 (+!3416 lt!492738 lt!492729))))

(declare-fun lt!492730 () ListLongMap!15379)

(assert (=> b!1100144 (= lt!492739 (+!3416 lt!492730 lt!492729))))

(declare-fun zeroValue!831 () V!41377)

(assert (=> b!1100144 (= lt!492729 (tuple2!17411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!42562 () Bool)

(declare-fun tp!81359 () Bool)

(declare-fun e!627933 () Bool)

(assert (=> mapNonEmpty!42562 (= mapRes!42562 (and tp!81359 e!627933))))

(declare-fun mapKey!42562 () (_ BitVec 32))

(declare-fun mapRest!42562 () (Array (_ BitVec 32) ValueCell!12884))

(declare-fun mapValue!42562 () ValueCell!12884)

(assert (=> mapNonEmpty!42562 (= (arr!34265 _values!874) (store mapRest!42562 mapKey!42562 mapValue!42562))))

(declare-fun b!1100145 () Bool)

(declare-fun res!734137 () Bool)

(declare-fun e!627929 () Bool)

(assert (=> b!1100145 (=> (not res!734137) (not e!627929))))

(declare-fun lt!492728 () array!71202)

(declare-datatypes ((List!24004 0))(
  ( (Nil!24001) (Cons!24000 (h!25209 (_ BitVec 64)) (t!34178 List!24004)) )
))
(declare-fun arrayNoDuplicates!0 (array!71202 (_ BitVec 32) List!24004) Bool)

(assert (=> b!1100145 (= res!734137 (arrayNoDuplicates!0 lt!492728 #b00000000000000000000000000000000 Nil!24001))))

(declare-fun b!1100146 () Bool)

(assert (=> b!1100146 (= e!627929 (not e!627930))))

(declare-fun res!734141 () Bool)

(assert (=> b!1100146 (=> res!734141 e!627930)))

(assert (=> b!1100146 (= res!734141 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41377)

(declare-fun getCurrentListMap!4324 (array!71202 array!71200 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) Int) ListLongMap!15379)

(assert (=> b!1100146 (= lt!492732 (getCurrentListMap!4324 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492737 () array!71200)

(assert (=> b!1100146 (= lt!492739 (getCurrentListMap!4324 lt!492728 lt!492737 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1100146 (and (= lt!492730 lt!492734) (= lt!492734 lt!492730))))

(declare-fun -!939 (ListLongMap!15379 (_ BitVec 64)) ListLongMap!15379)

(assert (=> b!1100146 (= lt!492734 (-!939 lt!492738 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35999 0))(
  ( (Unit!36000) )
))
(declare-fun lt!492727 () Unit!35999)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!213 (array!71202 array!71200 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35999)

(assert (=> b!1100146 (= lt!492727 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4231 (array!71202 array!71200 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) Int) ListLongMap!15379)

(assert (=> b!1100146 (= lt!492730 (getCurrentListMapNoExtraKeys!4231 lt!492728 lt!492737 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2300 (Int (_ BitVec 64)) V!41377)

(assert (=> b!1100146 (= lt!492737 (array!71201 (store (arr!34265 _values!874) i!650 (ValueCellFull!12884 (dynLambda!2300 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34803 _values!874)))))

(assert (=> b!1100146 (= lt!492738 (getCurrentListMapNoExtraKeys!4231 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100146 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492735 () Unit!35999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71202 (_ BitVec 64) (_ BitVec 32)) Unit!35999)

(assert (=> b!1100146 (= lt!492735 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100147 () Bool)

(declare-fun res!734136 () Bool)

(assert (=> b!1100147 (=> (not res!734136) (not e!627927))))

(assert (=> b!1100147 (= res!734136 (= (select (arr!34266 _keys!1070) i!650) k0!904))))

(declare-fun b!1100148 () Bool)

(declare-fun res!734135 () Bool)

(assert (=> b!1100148 (=> (not res!734135) (not e!627927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100148 (= res!734135 (validKeyInArray!0 k0!904))))

(declare-fun b!1100149 () Bool)

(assert (=> b!1100149 (= e!627927 e!627929)))

(declare-fun res!734140 () Bool)

(assert (=> b!1100149 (=> (not res!734140) (not e!627929))))

(assert (=> b!1100149 (= res!734140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492728 mask!1414))))

(assert (=> b!1100149 (= lt!492728 (array!71203 (store (arr!34266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34804 _keys!1070)))))

(declare-fun b!1100150 () Bool)

(declare-fun tp_is_empty!27187 () Bool)

(assert (=> b!1100150 (= e!627931 tp_is_empty!27187)))

(declare-fun b!1100151 () Bool)

(declare-fun res!734144 () Bool)

(assert (=> b!1100151 (=> (not res!734144) (not e!627927))))

(assert (=> b!1100151 (= res!734144 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24001))))

(declare-fun b!1100152 () Bool)

(assert (=> b!1100152 (= e!627932 true)))

(assert (=> b!1100152 (= (-!939 lt!492736 k0!904) lt!492733)))

(declare-fun lt!492731 () Unit!35999)

(declare-fun addRemoveCommutativeForDiffKeys!127 (ListLongMap!15379 (_ BitVec 64) V!41377 (_ BitVec 64)) Unit!35999)

(assert (=> b!1100152 (= lt!492731 (addRemoveCommutativeForDiffKeys!127 lt!492738 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun res!734143 () Bool)

(assert (=> start!96736 (=> (not res!734143) (not e!627927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96736 (= res!734143 (validMask!0 mask!1414))))

(assert (=> start!96736 e!627927))

(assert (=> start!96736 tp!81358))

(assert (=> start!96736 true))

(assert (=> start!96736 tp_is_empty!27187))

(declare-fun array_inv!26426 (array!71202) Bool)

(assert (=> start!96736 (array_inv!26426 _keys!1070)))

(declare-fun array_inv!26427 (array!71200) Bool)

(assert (=> start!96736 (and (array_inv!26427 _values!874) e!627926)))

(declare-fun b!1100153 () Bool)

(declare-fun res!734138 () Bool)

(assert (=> b!1100153 (=> (not res!734138) (not e!627927))))

(assert (=> b!1100153 (= res!734138 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34804 _keys!1070))))))

(declare-fun mapIsEmpty!42562 () Bool)

(assert (=> mapIsEmpty!42562 mapRes!42562))

(declare-fun b!1100154 () Bool)

(assert (=> b!1100154 (= e!627933 tp_is_empty!27187)))

(assert (= (and start!96736 res!734143) b!1100143))

(assert (= (and b!1100143 res!734139) b!1100142))

(assert (= (and b!1100142 res!734142) b!1100151))

(assert (= (and b!1100151 res!734144) b!1100153))

(assert (= (and b!1100153 res!734138) b!1100148))

(assert (= (and b!1100148 res!734135) b!1100147))

(assert (= (and b!1100147 res!734136) b!1100149))

(assert (= (and b!1100149 res!734140) b!1100145))

(assert (= (and b!1100145 res!734137) b!1100146))

(assert (= (and b!1100146 (not res!734141)) b!1100144))

(assert (= (and b!1100144 (not res!734134)) b!1100152))

(assert (= (and b!1100141 condMapEmpty!42562) mapIsEmpty!42562))

(assert (= (and b!1100141 (not condMapEmpty!42562)) mapNonEmpty!42562))

(get-info :version)

(assert (= (and mapNonEmpty!42562 ((_ is ValueCellFull!12884) mapValue!42562)) b!1100154))

(assert (= (and b!1100141 ((_ is ValueCellFull!12884) mapDefault!42562)) b!1100150))

(assert (= start!96736 b!1100141))

(declare-fun b_lambda!17983 () Bool)

(assert (=> (not b_lambda!17983) (not b!1100146)))

(declare-fun t!34176 () Bool)

(declare-fun tb!7995 () Bool)

(assert (=> (and start!96736 (= defaultEntry!882 defaultEntry!882) t!34176) tb!7995))

(declare-fun result!16535 () Bool)

(assert (=> tb!7995 (= result!16535 tp_is_empty!27187)))

(assert (=> b!1100146 t!34176))

(declare-fun b_and!37011 () Bool)

(assert (= b_and!37009 (and (=> t!34176 result!16535) b_and!37011)))

(declare-fun m!1019711 () Bool)

(assert (=> start!96736 m!1019711))

(declare-fun m!1019713 () Bool)

(assert (=> start!96736 m!1019713))

(declare-fun m!1019715 () Bool)

(assert (=> start!96736 m!1019715))

(declare-fun m!1019717 () Bool)

(assert (=> mapNonEmpty!42562 m!1019717))

(declare-fun m!1019719 () Bool)

(assert (=> b!1100148 m!1019719))

(declare-fun m!1019721 () Bool)

(assert (=> b!1100152 m!1019721))

(declare-fun m!1019723 () Bool)

(assert (=> b!1100152 m!1019723))

(declare-fun m!1019725 () Bool)

(assert (=> b!1100151 m!1019725))

(declare-fun m!1019727 () Bool)

(assert (=> b!1100145 m!1019727))

(declare-fun m!1019729 () Bool)

(assert (=> b!1100144 m!1019729))

(declare-fun m!1019731 () Bool)

(assert (=> b!1100144 m!1019731))

(declare-fun m!1019733 () Bool)

(assert (=> b!1100144 m!1019733))

(declare-fun m!1019735 () Bool)

(assert (=> b!1100147 m!1019735))

(declare-fun m!1019737 () Bool)

(assert (=> b!1100142 m!1019737))

(declare-fun m!1019739 () Bool)

(assert (=> b!1100146 m!1019739))

(declare-fun m!1019741 () Bool)

(assert (=> b!1100146 m!1019741))

(declare-fun m!1019743 () Bool)

(assert (=> b!1100146 m!1019743))

(declare-fun m!1019745 () Bool)

(assert (=> b!1100146 m!1019745))

(declare-fun m!1019747 () Bool)

(assert (=> b!1100146 m!1019747))

(declare-fun m!1019749 () Bool)

(assert (=> b!1100146 m!1019749))

(declare-fun m!1019751 () Bool)

(assert (=> b!1100146 m!1019751))

(declare-fun m!1019753 () Bool)

(assert (=> b!1100146 m!1019753))

(declare-fun m!1019755 () Bool)

(assert (=> b!1100146 m!1019755))

(declare-fun m!1019757 () Bool)

(assert (=> b!1100146 m!1019757))

(declare-fun m!1019759 () Bool)

(assert (=> b!1100149 m!1019759))

(declare-fun m!1019761 () Bool)

(assert (=> b!1100149 m!1019761))

(check-sat (not b!1100142) (not b!1100145) (not start!96736) tp_is_empty!27187 (not b!1100144) (not b!1100148) (not b!1100149) (not b_next!23137) (not b!1100152) (not b!1100151) (not b_lambda!17983) (not mapNonEmpty!42562) (not b!1100146) b_and!37011)
(check-sat b_and!37011 (not b_next!23137))
