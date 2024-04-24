; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96114 () Bool)

(assert start!96114)

(declare-fun b_free!22531 () Bool)

(declare-fun b_next!22531 () Bool)

(assert (=> start!96114 (= b_free!22531 (not b_next!22531))))

(declare-fun tp!79441 () Bool)

(declare-fun b_and!35747 () Bool)

(assert (=> start!96114 (= tp!79441 b_and!35747)))

(declare-fun res!724200 () Bool)

(declare-fun e!620917 () Bool)

(assert (=> start!96114 (=> (not res!724200) (not e!620917))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96114 (= res!724200 (validMask!0 mask!1414))))

(assert (=> start!96114 e!620917))

(assert (=> start!96114 tp!79441))

(assert (=> start!96114 true))

(declare-fun tp_is_empty!26533 () Bool)

(assert (=> start!96114 tp_is_empty!26533))

(declare-datatypes ((array!70039 0))(
  ( (array!70040 (arr!33687 (Array (_ BitVec 32) (_ BitVec 64))) (size!34224 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70039)

(declare-fun array_inv!26040 (array!70039) Bool)

(assert (=> start!96114 (array_inv!26040 _keys!1070)))

(declare-datatypes ((V!40505 0))(
  ( (V!40506 (val!13323 Int)) )
))
(declare-datatypes ((ValueCell!12557 0))(
  ( (ValueCellFull!12557 (v!15940 V!40505)) (EmptyCell!12557) )
))
(declare-datatypes ((array!70041 0))(
  ( (array!70042 (arr!33688 (Array (_ BitVec 32) ValueCell!12557)) (size!34225 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70041)

(declare-fun e!620919 () Bool)

(declare-fun array_inv!26041 (array!70041) Bool)

(assert (=> start!96114 (and (array_inv!26041 _values!874) e!620919)))

(declare-fun mapIsEmpty!41554 () Bool)

(declare-fun mapRes!41554 () Bool)

(assert (=> mapIsEmpty!41554 mapRes!41554))

(declare-fun b!1086740 () Bool)

(declare-fun e!620914 () Bool)

(declare-fun e!620921 () Bool)

(assert (=> b!1086740 (= e!620914 e!620921)))

(declare-fun res!724206 () Bool)

(assert (=> b!1086740 (=> res!724206 e!620921)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1086740 (= res!724206 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16900 0))(
  ( (tuple2!16901 (_1!8461 (_ BitVec 64)) (_2!8461 V!40505)) )
))
(declare-datatypes ((List!23499 0))(
  ( (Nil!23496) (Cons!23495 (h!24713 tuple2!16900) (t!33080 List!23499)) )
))
(declare-datatypes ((ListLongMap!14877 0))(
  ( (ListLongMap!14878 (toList!7454 List!23499)) )
))
(declare-fun lt!482180 () ListLongMap!14877)

(declare-fun lt!482177 () ListLongMap!14877)

(assert (=> b!1086740 (= lt!482180 lt!482177)))

(declare-fun lt!482170 () ListLongMap!14877)

(declare-fun -!766 (ListLongMap!14877 (_ BitVec 64)) ListLongMap!14877)

(assert (=> b!1086740 (= lt!482180 (-!766 lt!482170 k0!904))))

(declare-datatypes ((Unit!35699 0))(
  ( (Unit!35700) )
))
(declare-fun lt!482174 () Unit!35699)

(declare-fun lt!482169 () ListLongMap!14877)

(declare-fun zeroValue!831 () V!40505)

(declare-fun addRemoveCommutativeForDiffKeys!13 (ListLongMap!14877 (_ BitVec 64) V!40505 (_ BitVec 64)) Unit!35699)

(assert (=> b!1086740 (= lt!482174 (addRemoveCommutativeForDiffKeys!13 lt!482169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482179 () ListLongMap!14877)

(declare-fun lt!482172 () tuple2!16900)

(declare-fun +!3279 (ListLongMap!14877 tuple2!16900) ListLongMap!14877)

(assert (=> b!1086740 (= lt!482179 (+!3279 lt!482177 lt!482172))))

(declare-fun lt!482178 () ListLongMap!14877)

(declare-fun lt!482175 () tuple2!16900)

(assert (=> b!1086740 (= lt!482177 (+!3279 lt!482178 lt!482175))))

(declare-fun lt!482184 () ListLongMap!14877)

(declare-fun lt!482171 () ListLongMap!14877)

(assert (=> b!1086740 (= lt!482184 lt!482171)))

(assert (=> b!1086740 (= lt!482171 (+!3279 lt!482170 lt!482172))))

(assert (=> b!1086740 (= lt!482170 (+!3279 lt!482169 lt!482175))))

(declare-fun lt!482183 () ListLongMap!14877)

(assert (=> b!1086740 (= lt!482179 (+!3279 (+!3279 lt!482183 lt!482175) lt!482172))))

(declare-fun minValue!831 () V!40505)

(assert (=> b!1086740 (= lt!482172 (tuple2!16901 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086740 (= lt!482175 (tuple2!16901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41554 () Bool)

(declare-fun tp!79442 () Bool)

(declare-fun e!620920 () Bool)

(assert (=> mapNonEmpty!41554 (= mapRes!41554 (and tp!79442 e!620920))))

(declare-fun mapKey!41554 () (_ BitVec 32))

(declare-fun mapValue!41554 () ValueCell!12557)

(declare-fun mapRest!41554 () (Array (_ BitVec 32) ValueCell!12557))

(assert (=> mapNonEmpty!41554 (= (arr!33688 _values!874) (store mapRest!41554 mapKey!41554 mapValue!41554))))

(declare-fun b!1086741 () Bool)

(declare-fun res!724201 () Bool)

(declare-fun e!620916 () Bool)

(assert (=> b!1086741 (=> (not res!724201) (not e!620916))))

(declare-fun lt!482182 () array!70039)

(declare-datatypes ((List!23500 0))(
  ( (Nil!23497) (Cons!23496 (h!24714 (_ BitVec 64)) (t!33081 List!23500)) )
))
(declare-fun arrayNoDuplicates!0 (array!70039 (_ BitVec 32) List!23500) Bool)

(assert (=> b!1086741 (= res!724201 (arrayNoDuplicates!0 lt!482182 #b00000000000000000000000000000000 Nil!23497))))

(declare-fun b!1086742 () Bool)

(assert (=> b!1086742 (= e!620920 tp_is_empty!26533)))

(declare-fun b!1086743 () Bool)

(declare-fun res!724209 () Bool)

(assert (=> b!1086743 (=> (not res!724209) (not e!620917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70039 (_ BitVec 32)) Bool)

(assert (=> b!1086743 (= res!724209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086744 () Bool)

(declare-fun res!724208 () Bool)

(assert (=> b!1086744 (=> (not res!724208) (not e!620917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086744 (= res!724208 (validKeyInArray!0 k0!904))))

(declare-fun b!1086745 () Bool)

(assert (=> b!1086745 (= e!620917 e!620916)))

(declare-fun res!724199 () Bool)

(assert (=> b!1086745 (=> (not res!724199) (not e!620916))))

(assert (=> b!1086745 (= res!724199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482182 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086745 (= lt!482182 (array!70040 (store (arr!33687 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34224 _keys!1070)))))

(declare-fun b!1086746 () Bool)

(assert (=> b!1086746 (= e!620921 true)))

(assert (=> b!1086746 (= (-!766 lt!482171 k0!904) (+!3279 lt!482180 lt!482172))))

(declare-fun lt!482181 () Unit!35699)

(assert (=> b!1086746 (= lt!482181 (addRemoveCommutativeForDiffKeys!13 lt!482170 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086747 () Bool)

(declare-fun res!724207 () Bool)

(assert (=> b!1086747 (=> (not res!724207) (not e!620917))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086747 (= res!724207 (and (= (size!34225 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34224 _keys!1070) (size!34225 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086748 () Bool)

(assert (=> b!1086748 (= e!620916 (not e!620914))))

(declare-fun res!724204 () Bool)

(assert (=> b!1086748 (=> res!724204 e!620914)))

(assert (=> b!1086748 (= res!724204 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4224 (array!70039 array!70041 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) Int) ListLongMap!14877)

(assert (=> b!1086748 (= lt!482184 (getCurrentListMap!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482168 () array!70041)

(assert (=> b!1086748 (= lt!482179 (getCurrentListMap!4224 lt!482182 lt!482168 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086748 (and (= lt!482183 lt!482178) (= lt!482178 lt!482183))))

(assert (=> b!1086748 (= lt!482178 (-!766 lt!482169 k0!904))))

(declare-fun lt!482176 () Unit!35699)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!53 (array!70039 array!70041 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35699)

(assert (=> b!1086748 (= lt!482176 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!53 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4029 (array!70039 array!70041 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) Int) ListLongMap!14877)

(assert (=> b!1086748 (= lt!482183 (getCurrentListMapNoExtraKeys!4029 lt!482182 lt!482168 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2150 (Int (_ BitVec 64)) V!40505)

(assert (=> b!1086748 (= lt!482168 (array!70042 (store (arr!33688 _values!874) i!650 (ValueCellFull!12557 (dynLambda!2150 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34225 _values!874)))))

(assert (=> b!1086748 (= lt!482169 (getCurrentListMapNoExtraKeys!4029 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086748 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482173 () Unit!35699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70039 (_ BitVec 64) (_ BitVec 32)) Unit!35699)

(assert (=> b!1086748 (= lt!482173 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086749 () Bool)

(declare-fun e!620915 () Bool)

(assert (=> b!1086749 (= e!620919 (and e!620915 mapRes!41554))))

(declare-fun condMapEmpty!41554 () Bool)

(declare-fun mapDefault!41554 () ValueCell!12557)

(assert (=> b!1086749 (= condMapEmpty!41554 (= (arr!33688 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12557)) mapDefault!41554)))))

(declare-fun b!1086750 () Bool)

(assert (=> b!1086750 (= e!620915 tp_is_empty!26533)))

(declare-fun b!1086751 () Bool)

(declare-fun res!724205 () Bool)

(assert (=> b!1086751 (=> (not res!724205) (not e!620917))))

(assert (=> b!1086751 (= res!724205 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23497))))

(declare-fun b!1086752 () Bool)

(declare-fun res!724202 () Bool)

(assert (=> b!1086752 (=> (not res!724202) (not e!620917))))

(assert (=> b!1086752 (= res!724202 (= (select (arr!33687 _keys!1070) i!650) k0!904))))

(declare-fun b!1086753 () Bool)

(declare-fun res!724203 () Bool)

(assert (=> b!1086753 (=> (not res!724203) (not e!620917))))

(assert (=> b!1086753 (= res!724203 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34224 _keys!1070))))))

(assert (= (and start!96114 res!724200) b!1086747))

(assert (= (and b!1086747 res!724207) b!1086743))

(assert (= (and b!1086743 res!724209) b!1086751))

(assert (= (and b!1086751 res!724205) b!1086753))

(assert (= (and b!1086753 res!724203) b!1086744))

(assert (= (and b!1086744 res!724208) b!1086752))

(assert (= (and b!1086752 res!724202) b!1086745))

(assert (= (and b!1086745 res!724199) b!1086741))

(assert (= (and b!1086741 res!724201) b!1086748))

(assert (= (and b!1086748 (not res!724204)) b!1086740))

(assert (= (and b!1086740 (not res!724206)) b!1086746))

(assert (= (and b!1086749 condMapEmpty!41554) mapIsEmpty!41554))

(assert (= (and b!1086749 (not condMapEmpty!41554)) mapNonEmpty!41554))

(get-info :version)

(assert (= (and mapNonEmpty!41554 ((_ is ValueCellFull!12557) mapValue!41554)) b!1086742))

(assert (= (and b!1086749 ((_ is ValueCellFull!12557) mapDefault!41554)) b!1086750))

(assert (= start!96114 b!1086749))

(declare-fun b_lambda!17211 () Bool)

(assert (=> (not b_lambda!17211) (not b!1086748)))

(declare-fun t!33079 () Bool)

(declare-fun tb!7401 () Bool)

(assert (=> (and start!96114 (= defaultEntry!882 defaultEntry!882) t!33079) tb!7401))

(declare-fun result!15329 () Bool)

(assert (=> tb!7401 (= result!15329 tp_is_empty!26533)))

(assert (=> b!1086748 t!33079))

(declare-fun b_and!35749 () Bool)

(assert (= b_and!35747 (and (=> t!33079 result!15329) b_and!35749)))

(declare-fun m!1005119 () Bool)

(assert (=> b!1086741 m!1005119))

(declare-fun m!1005121 () Bool)

(assert (=> b!1086743 m!1005121))

(declare-fun m!1005123 () Bool)

(assert (=> b!1086752 m!1005123))

(declare-fun m!1005125 () Bool)

(assert (=> b!1086744 m!1005125))

(declare-fun m!1005127 () Bool)

(assert (=> b!1086751 m!1005127))

(declare-fun m!1005129 () Bool)

(assert (=> b!1086745 m!1005129))

(declare-fun m!1005131 () Bool)

(assert (=> b!1086745 m!1005131))

(declare-fun m!1005133 () Bool)

(assert (=> start!96114 m!1005133))

(declare-fun m!1005135 () Bool)

(assert (=> start!96114 m!1005135))

(declare-fun m!1005137 () Bool)

(assert (=> start!96114 m!1005137))

(declare-fun m!1005139 () Bool)

(assert (=> mapNonEmpty!41554 m!1005139))

(declare-fun m!1005141 () Bool)

(assert (=> b!1086740 m!1005141))

(assert (=> b!1086740 m!1005141))

(declare-fun m!1005143 () Bool)

(assert (=> b!1086740 m!1005143))

(declare-fun m!1005145 () Bool)

(assert (=> b!1086740 m!1005145))

(declare-fun m!1005147 () Bool)

(assert (=> b!1086740 m!1005147))

(declare-fun m!1005149 () Bool)

(assert (=> b!1086740 m!1005149))

(declare-fun m!1005151 () Bool)

(assert (=> b!1086740 m!1005151))

(declare-fun m!1005153 () Bool)

(assert (=> b!1086740 m!1005153))

(declare-fun m!1005155 () Bool)

(assert (=> b!1086740 m!1005155))

(declare-fun m!1005157 () Bool)

(assert (=> b!1086748 m!1005157))

(declare-fun m!1005159 () Bool)

(assert (=> b!1086748 m!1005159))

(declare-fun m!1005161 () Bool)

(assert (=> b!1086748 m!1005161))

(declare-fun m!1005163 () Bool)

(assert (=> b!1086748 m!1005163))

(declare-fun m!1005165 () Bool)

(assert (=> b!1086748 m!1005165))

(declare-fun m!1005167 () Bool)

(assert (=> b!1086748 m!1005167))

(declare-fun m!1005169 () Bool)

(assert (=> b!1086748 m!1005169))

(declare-fun m!1005171 () Bool)

(assert (=> b!1086748 m!1005171))

(declare-fun m!1005173 () Bool)

(assert (=> b!1086748 m!1005173))

(declare-fun m!1005175 () Bool)

(assert (=> b!1086748 m!1005175))

(declare-fun m!1005177 () Bool)

(assert (=> b!1086746 m!1005177))

(declare-fun m!1005179 () Bool)

(assert (=> b!1086746 m!1005179))

(declare-fun m!1005181 () Bool)

(assert (=> b!1086746 m!1005181))

(check-sat (not b!1086744) (not b_next!22531) (not b!1086741) (not start!96114) (not b_lambda!17211) tp_is_empty!26533 b_and!35749 (not b!1086745) (not b!1086748) (not b!1086751) (not b!1086746) (not b!1086740) (not b!1086743) (not mapNonEmpty!41554))
(check-sat b_and!35749 (not b_next!22531))
