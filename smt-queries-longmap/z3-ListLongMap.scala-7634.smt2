; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96360 () Bool)

(assert start!96360)

(declare-fun b_free!22777 () Bool)

(declare-fun b_next!22777 () Bool)

(assert (=> start!96360 (= b_free!22777 (not b_next!22777))))

(declare-fun tp!80179 () Bool)

(declare-fun b_and!36239 () Bool)

(assert (=> start!96360 (= tp!80179 b_and!36239)))

(declare-fun b!1092170 () Bool)

(declare-fun res!728284 () Bool)

(declare-fun e!623867 () Bool)

(assert (=> b!1092170 (=> (not res!728284) (not e!623867))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092170 (= res!728284 (validKeyInArray!0 k0!904))))

(declare-fun b!1092171 () Bool)

(declare-fun e!623871 () Bool)

(assert (=> b!1092171 (= e!623867 e!623871)))

(declare-fun res!728278 () Bool)

(assert (=> b!1092171 (=> (not res!728278) (not e!623871))))

(declare-datatypes ((array!70515 0))(
  ( (array!70516 (arr!33925 (Array (_ BitVec 32) (_ BitVec 64))) (size!34462 (_ BitVec 32))) )
))
(declare-fun lt!487411 () array!70515)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70515 (_ BitVec 32)) Bool)

(assert (=> b!1092171 (= res!728278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487411 mask!1414))))

(declare-fun _keys!1070 () array!70515)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092171 (= lt!487411 (array!70516 (store (arr!33925 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34462 _keys!1070)))))

(declare-fun mapNonEmpty!41923 () Bool)

(declare-fun mapRes!41923 () Bool)

(declare-fun tp!80180 () Bool)

(declare-fun e!623869 () Bool)

(assert (=> mapNonEmpty!41923 (= mapRes!41923 (and tp!80180 e!623869))))

(declare-datatypes ((V!40833 0))(
  ( (V!40834 (val!13446 Int)) )
))
(declare-datatypes ((ValueCell!12680 0))(
  ( (ValueCellFull!12680 (v!16063 V!40833)) (EmptyCell!12680) )
))
(declare-fun mapValue!41923 () ValueCell!12680)

(declare-fun mapKey!41923 () (_ BitVec 32))

(declare-datatypes ((array!70517 0))(
  ( (array!70518 (arr!33926 (Array (_ BitVec 32) ValueCell!12680)) (size!34463 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70517)

(declare-fun mapRest!41923 () (Array (_ BitVec 32) ValueCell!12680))

(assert (=> mapNonEmpty!41923 (= (arr!33926 _values!874) (store mapRest!41923 mapKey!41923 mapValue!41923))))

(declare-fun mapIsEmpty!41923 () Bool)

(assert (=> mapIsEmpty!41923 mapRes!41923))

(declare-fun res!728279 () Bool)

(assert (=> start!96360 (=> (not res!728279) (not e!623867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96360 (= res!728279 (validMask!0 mask!1414))))

(assert (=> start!96360 e!623867))

(assert (=> start!96360 tp!80179))

(assert (=> start!96360 true))

(declare-fun tp_is_empty!26779 () Bool)

(assert (=> start!96360 tp_is_empty!26779))

(declare-fun array_inv!26206 (array!70515) Bool)

(assert (=> start!96360 (array_inv!26206 _keys!1070)))

(declare-fun e!623868 () Bool)

(declare-fun array_inv!26207 (array!70517) Bool)

(assert (=> start!96360 (and (array_inv!26207 _values!874) e!623868)))

(declare-fun b!1092172 () Bool)

(declare-fun res!728286 () Bool)

(assert (=> b!1092172 (=> (not res!728286) (not e!623871))))

(declare-datatypes ((List!23695 0))(
  ( (Nil!23692) (Cons!23691 (h!24909 (_ BitVec 64)) (t!33522 List!23695)) )
))
(declare-fun arrayNoDuplicates!0 (array!70515 (_ BitVec 32) List!23695) Bool)

(assert (=> b!1092172 (= res!728286 (arrayNoDuplicates!0 lt!487411 #b00000000000000000000000000000000 Nil!23692))))

(declare-fun b!1092173 () Bool)

(declare-fun res!728280 () Bool)

(assert (=> b!1092173 (=> (not res!728280) (not e!623867))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092173 (= res!728280 (and (= (size!34463 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34462 _keys!1070) (size!34463 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092174 () Bool)

(declare-fun res!728277 () Bool)

(assert (=> b!1092174 (=> (not res!728277) (not e!623867))))

(assert (=> b!1092174 (= res!728277 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34462 _keys!1070))))))

(declare-fun b!1092175 () Bool)

(declare-fun res!728281 () Bool)

(assert (=> b!1092175 (=> (not res!728281) (not e!623867))))

(assert (=> b!1092175 (= res!728281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092176 () Bool)

(declare-fun e!623873 () Bool)

(declare-fun e!623866 () Bool)

(assert (=> b!1092176 (= e!623873 e!623866)))

(declare-fun res!728282 () Bool)

(assert (=> b!1092176 (=> res!728282 e!623866)))

(assert (=> b!1092176 (= res!728282 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17102 0))(
  ( (tuple2!17103 (_1!8562 (_ BitVec 64)) (_2!8562 V!40833)) )
))
(declare-datatypes ((List!23696 0))(
  ( (Nil!23693) (Cons!23692 (h!24910 tuple2!17102) (t!33523 List!23696)) )
))
(declare-datatypes ((ListLongMap!15079 0))(
  ( (ListLongMap!15080 (toList!7555 List!23696)) )
))
(declare-fun lt!487407 () ListLongMap!15079)

(declare-fun lt!487418 () ListLongMap!15079)

(assert (=> b!1092176 (= lt!487407 lt!487418)))

(declare-fun lt!487419 () ListLongMap!15079)

(declare-fun lt!487416 () tuple2!17102)

(declare-fun +!3370 (ListLongMap!15079 tuple2!17102) ListLongMap!15079)

(assert (=> b!1092176 (= lt!487418 (+!3370 lt!487419 lt!487416))))

(declare-fun lt!487412 () ListLongMap!15079)

(declare-fun lt!487409 () ListLongMap!15079)

(assert (=> b!1092176 (= lt!487412 lt!487409)))

(declare-fun lt!487413 () ListLongMap!15079)

(assert (=> b!1092176 (= lt!487409 (+!3370 lt!487413 lt!487416))))

(declare-fun lt!487417 () ListLongMap!15079)

(assert (=> b!1092176 (= lt!487412 (+!3370 lt!487417 lt!487416))))

(declare-fun minValue!831 () V!40833)

(assert (=> b!1092176 (= lt!487416 (tuple2!17103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092177 () Bool)

(declare-fun e!623870 () Bool)

(assert (=> b!1092177 (= e!623868 (and e!623870 mapRes!41923))))

(declare-fun condMapEmpty!41923 () Bool)

(declare-fun mapDefault!41923 () ValueCell!12680)

(assert (=> b!1092177 (= condMapEmpty!41923 (= (arr!33926 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12680)) mapDefault!41923)))))

(declare-fun b!1092178 () Bool)

(assert (=> b!1092178 (= e!623866 true)))

(declare-fun -!861 (ListLongMap!15079 (_ BitVec 64)) ListLongMap!15079)

(assert (=> b!1092178 (= (-!861 lt!487418 k0!904) lt!487409)))

(declare-datatypes ((Unit!35889 0))(
  ( (Unit!35890) )
))
(declare-fun lt!487415 () Unit!35889)

(declare-fun addRemoveCommutativeForDiffKeys!95 (ListLongMap!15079 (_ BitVec 64) V!40833 (_ BitVec 64)) Unit!35889)

(assert (=> b!1092178 (= lt!487415 (addRemoveCommutativeForDiffKeys!95 lt!487419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1092179 () Bool)

(assert (=> b!1092179 (= e!623869 tp_is_empty!26779)))

(declare-fun b!1092180 () Bool)

(declare-fun res!728283 () Bool)

(assert (=> b!1092180 (=> (not res!728283) (not e!623867))))

(assert (=> b!1092180 (= res!728283 (= (select (arr!33925 _keys!1070) i!650) k0!904))))

(declare-fun b!1092181 () Bool)

(assert (=> b!1092181 (= e!623870 tp_is_empty!26779)))

(declare-fun b!1092182 () Bool)

(assert (=> b!1092182 (= e!623871 (not e!623873))))

(declare-fun res!728276 () Bool)

(assert (=> b!1092182 (=> res!728276 e!623873)))

(assert (=> b!1092182 (= res!728276 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40833)

(declare-fun getCurrentListMap!4307 (array!70515 array!70517 (_ BitVec 32) (_ BitVec 32) V!40833 V!40833 (_ BitVec 32) Int) ListLongMap!15079)

(assert (=> b!1092182 (= lt!487407 (getCurrentListMap!4307 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487414 () array!70517)

(assert (=> b!1092182 (= lt!487412 (getCurrentListMap!4307 lt!487411 lt!487414 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1092182 (and (= lt!487417 lt!487413) (= lt!487413 lt!487417))))

(assert (=> b!1092182 (= lt!487413 (-!861 lt!487419 k0!904))))

(declare-fun lt!487410 () Unit!35889)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!136 (array!70515 array!70517 (_ BitVec 32) (_ BitVec 32) V!40833 V!40833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35889)

(assert (=> b!1092182 (= lt!487410 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!136 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4112 (array!70515 array!70517 (_ BitVec 32) (_ BitVec 32) V!40833 V!40833 (_ BitVec 32) Int) ListLongMap!15079)

(assert (=> b!1092182 (= lt!487417 (getCurrentListMapNoExtraKeys!4112 lt!487411 lt!487414 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2233 (Int (_ BitVec 64)) V!40833)

(assert (=> b!1092182 (= lt!487414 (array!70518 (store (arr!33926 _values!874) i!650 (ValueCellFull!12680 (dynLambda!2233 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34463 _values!874)))))

(assert (=> b!1092182 (= lt!487419 (getCurrentListMapNoExtraKeys!4112 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092182 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487408 () Unit!35889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70515 (_ BitVec 64) (_ BitVec 32)) Unit!35889)

(assert (=> b!1092182 (= lt!487408 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092183 () Bool)

(declare-fun res!728285 () Bool)

(assert (=> b!1092183 (=> (not res!728285) (not e!623867))))

(assert (=> b!1092183 (= res!728285 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23692))))

(assert (= (and start!96360 res!728279) b!1092173))

(assert (= (and b!1092173 res!728280) b!1092175))

(assert (= (and b!1092175 res!728281) b!1092183))

(assert (= (and b!1092183 res!728285) b!1092174))

(assert (= (and b!1092174 res!728277) b!1092170))

(assert (= (and b!1092170 res!728284) b!1092180))

(assert (= (and b!1092180 res!728283) b!1092171))

(assert (= (and b!1092171 res!728278) b!1092172))

(assert (= (and b!1092172 res!728286) b!1092182))

(assert (= (and b!1092182 (not res!728276)) b!1092176))

(assert (= (and b!1092176 (not res!728282)) b!1092178))

(assert (= (and b!1092177 condMapEmpty!41923) mapIsEmpty!41923))

(assert (= (and b!1092177 (not condMapEmpty!41923)) mapNonEmpty!41923))

(get-info :version)

(assert (= (and mapNonEmpty!41923 ((_ is ValueCellFull!12680) mapValue!41923)) b!1092179))

(assert (= (and b!1092177 ((_ is ValueCellFull!12680) mapDefault!41923)) b!1092181))

(assert (= start!96360 b!1092177))

(declare-fun b_lambda!17457 () Bool)

(assert (=> (not b_lambda!17457) (not b!1092182)))

(declare-fun t!33521 () Bool)

(declare-fun tb!7647 () Bool)

(assert (=> (and start!96360 (= defaultEntry!882 defaultEntry!882) t!33521) tb!7647))

(declare-fun result!15821 () Bool)

(assert (=> tb!7647 (= result!15821 tp_is_empty!26779)))

(assert (=> b!1092182 t!33521))

(declare-fun b_and!36241 () Bool)

(assert (= b_and!36239 (and (=> t!33521 result!15821) b_and!36241)))

(declare-fun m!1011995 () Bool)

(assert (=> b!1092175 m!1011995))

(declare-fun m!1011997 () Bool)

(assert (=> b!1092172 m!1011997))

(declare-fun m!1011999 () Bool)

(assert (=> b!1092183 m!1011999))

(declare-fun m!1012001 () Bool)

(assert (=> b!1092176 m!1012001))

(declare-fun m!1012003 () Bool)

(assert (=> b!1092176 m!1012003))

(declare-fun m!1012005 () Bool)

(assert (=> b!1092176 m!1012005))

(declare-fun m!1012007 () Bool)

(assert (=> start!96360 m!1012007))

(declare-fun m!1012009 () Bool)

(assert (=> start!96360 m!1012009))

(declare-fun m!1012011 () Bool)

(assert (=> start!96360 m!1012011))

(declare-fun m!1012013 () Bool)

(assert (=> b!1092171 m!1012013))

(declare-fun m!1012015 () Bool)

(assert (=> b!1092171 m!1012015))

(declare-fun m!1012017 () Bool)

(assert (=> b!1092180 m!1012017))

(declare-fun m!1012019 () Bool)

(assert (=> b!1092182 m!1012019))

(declare-fun m!1012021 () Bool)

(assert (=> b!1092182 m!1012021))

(declare-fun m!1012023 () Bool)

(assert (=> b!1092182 m!1012023))

(declare-fun m!1012025 () Bool)

(assert (=> b!1092182 m!1012025))

(declare-fun m!1012027 () Bool)

(assert (=> b!1092182 m!1012027))

(declare-fun m!1012029 () Bool)

(assert (=> b!1092182 m!1012029))

(declare-fun m!1012031 () Bool)

(assert (=> b!1092182 m!1012031))

(declare-fun m!1012033 () Bool)

(assert (=> b!1092182 m!1012033))

(declare-fun m!1012035 () Bool)

(assert (=> b!1092182 m!1012035))

(declare-fun m!1012037 () Bool)

(assert (=> b!1092182 m!1012037))

(declare-fun m!1012039 () Bool)

(assert (=> b!1092170 m!1012039))

(declare-fun m!1012041 () Bool)

(assert (=> mapNonEmpty!41923 m!1012041))

(declare-fun m!1012043 () Bool)

(assert (=> b!1092178 m!1012043))

(declare-fun m!1012045 () Bool)

(assert (=> b!1092178 m!1012045))

(check-sat (not b!1092175) (not b!1092183) (not b!1092172) (not b!1092170) (not b!1092178) b_and!36241 (not b_lambda!17457) (not b!1092171) (not b_next!22777) tp_is_empty!26779 (not b!1092182) (not b!1092176) (not start!96360) (not mapNonEmpty!41923))
(check-sat b_and!36241 (not b_next!22777))
