; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96078 () Bool)

(assert start!96078)

(declare-fun b_free!22731 () Bool)

(declare-fun b_next!22731 () Bool)

(assert (=> start!96078 (= b_free!22731 (not b_next!22731))))

(declare-fun tp!80041 () Bool)

(declare-fun b_and!36137 () Bool)

(assert (=> start!96078 (= tp!80041 b_and!36137)))

(declare-fun b!1089827 () Bool)

(declare-fun e!622466 () Bool)

(declare-fun e!622460 () Bool)

(assert (=> b!1089827 (= e!622466 (not e!622460))))

(declare-fun res!726995 () Bool)

(assert (=> b!1089827 (=> res!726995 e!622460)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089827 (= res!726995 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40771 0))(
  ( (V!40772 (val!13423 Int)) )
))
(declare-fun minValue!831 () V!40771)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17054 0))(
  ( (tuple2!17055 (_1!8538 (_ BitVec 64)) (_2!8538 V!40771)) )
))
(declare-datatypes ((List!23643 0))(
  ( (Nil!23640) (Cons!23639 (h!24848 tuple2!17054) (t!33432 List!23643)) )
))
(declare-datatypes ((ListLongMap!15023 0))(
  ( (ListLongMap!15024 (toList!7527 List!23643)) )
))
(declare-fun lt!486007 () ListLongMap!15023)

(declare-fun zeroValue!831 () V!40771)

(declare-datatypes ((array!70389 0))(
  ( (array!70390 (arr!33868 (Array (_ BitVec 32) (_ BitVec 64))) (size!34404 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70389)

(declare-datatypes ((ValueCell!12657 0))(
  ( (ValueCellFull!12657 (v!16044 V!40771)) (EmptyCell!12657) )
))
(declare-datatypes ((array!70391 0))(
  ( (array!70392 (arr!33869 (Array (_ BitVec 32) ValueCell!12657)) (size!34405 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70391)

(declare-fun getCurrentListMap!4296 (array!70389 array!70391 (_ BitVec 32) (_ BitVec 32) V!40771 V!40771 (_ BitVec 32) Int) ListLongMap!15023)

(assert (=> b!1089827 (= lt!486007 (getCurrentListMap!4296 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486016 () array!70391)

(declare-fun lt!486012 () ListLongMap!15023)

(declare-fun lt!486015 () array!70389)

(assert (=> b!1089827 (= lt!486012 (getCurrentListMap!4296 lt!486015 lt!486016 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486013 () ListLongMap!15023)

(declare-fun lt!486010 () ListLongMap!15023)

(assert (=> b!1089827 (and (= lt!486013 lt!486010) (= lt!486010 lt!486013))))

(declare-fun lt!486008 () ListLongMap!15023)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!852 (ListLongMap!15023 (_ BitVec 64)) ListLongMap!15023)

(assert (=> b!1089827 (= lt!486010 (-!852 lt!486008 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35870 0))(
  ( (Unit!35871) )
))
(declare-fun lt!486014 () Unit!35870)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!115 (array!70389 array!70391 (_ BitVec 32) (_ BitVec 32) V!40771 V!40771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35870)

(assert (=> b!1089827 (= lt!486014 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!115 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4056 (array!70389 array!70391 (_ BitVec 32) (_ BitVec 32) V!40771 V!40771 (_ BitVec 32) Int) ListLongMap!15023)

(assert (=> b!1089827 (= lt!486013 (getCurrentListMapNoExtraKeys!4056 lt!486015 lt!486016 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2193 (Int (_ BitVec 64)) V!40771)

(assert (=> b!1089827 (= lt!486016 (array!70392 (store (arr!33869 _values!874) i!650 (ValueCellFull!12657 (dynLambda!2193 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34405 _values!874)))))

(assert (=> b!1089827 (= lt!486008 (getCurrentListMapNoExtraKeys!4056 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089827 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486011 () Unit!35870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70389 (_ BitVec 64) (_ BitVec 32)) Unit!35870)

(assert (=> b!1089827 (= lt!486011 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089828 () Bool)

(declare-fun e!622462 () Bool)

(declare-fun e!622459 () Bool)

(declare-fun mapRes!41854 () Bool)

(assert (=> b!1089828 (= e!622462 (and e!622459 mapRes!41854))))

(declare-fun condMapEmpty!41854 () Bool)

(declare-fun mapDefault!41854 () ValueCell!12657)

(assert (=> b!1089828 (= condMapEmpty!41854 (= (arr!33869 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12657)) mapDefault!41854)))))

(declare-fun b!1089829 () Bool)

(declare-fun res!726996 () Bool)

(declare-fun e!622464 () Bool)

(assert (=> b!1089829 (=> (not res!726996) (not e!622464))))

(declare-datatypes ((List!23644 0))(
  ( (Nil!23641) (Cons!23640 (h!24849 (_ BitVec 64)) (t!33433 List!23644)) )
))
(declare-fun arrayNoDuplicates!0 (array!70389 (_ BitVec 32) List!23644) Bool)

(assert (=> b!1089829 (= res!726996 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23641))))

(declare-fun b!1089830 () Bool)

(declare-fun res!726997 () Bool)

(assert (=> b!1089830 (=> (not res!726997) (not e!622466))))

(assert (=> b!1089830 (= res!726997 (arrayNoDuplicates!0 lt!486015 #b00000000000000000000000000000000 Nil!23641))))

(declare-fun b!1089831 () Bool)

(declare-fun res!726999 () Bool)

(assert (=> b!1089831 (=> (not res!726999) (not e!622464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089831 (= res!726999 (validKeyInArray!0 k0!904))))

(declare-fun b!1089832 () Bool)

(declare-fun res!726994 () Bool)

(declare-fun e!622461 () Bool)

(assert (=> b!1089832 (=> (not res!726994) (not e!622461))))

(declare-fun lt!486009 () tuple2!17054)

(declare-fun +!3318 (ListLongMap!15023 tuple2!17054) ListLongMap!15023)

(assert (=> b!1089832 (= res!726994 (= lt!486012 (+!3318 lt!486010 lt!486009)))))

(declare-fun b!1089833 () Bool)

(assert (=> b!1089833 (= e!622461 (= lt!486007 (+!3318 lt!486008 lt!486009)))))

(declare-fun b!1089835 () Bool)

(assert (=> b!1089835 (= e!622464 e!622466)))

(declare-fun res!726992 () Bool)

(assert (=> b!1089835 (=> (not res!726992) (not e!622466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70389 (_ BitVec 32)) Bool)

(assert (=> b!1089835 (= res!726992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486015 mask!1414))))

(assert (=> b!1089835 (= lt!486015 (array!70390 (store (arr!33868 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34404 _keys!1070)))))

(declare-fun b!1089836 () Bool)

(declare-fun res!726991 () Bool)

(assert (=> b!1089836 (=> (not res!726991) (not e!622464))))

(assert (=> b!1089836 (= res!726991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089837 () Bool)

(declare-fun e!622463 () Bool)

(declare-fun tp_is_empty!26733 () Bool)

(assert (=> b!1089837 (= e!622463 tp_is_empty!26733)))

(declare-fun b!1089838 () Bool)

(declare-fun res!727000 () Bool)

(assert (=> b!1089838 (=> (not res!727000) (not e!622464))))

(assert (=> b!1089838 (= res!727000 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34404 _keys!1070))))))

(declare-fun b!1089839 () Bool)

(declare-fun res!727002 () Bool)

(assert (=> b!1089839 (=> (not res!727002) (not e!622464))))

(assert (=> b!1089839 (= res!727002 (= (select (arr!33868 _keys!1070) i!650) k0!904))))

(declare-fun b!1089840 () Bool)

(declare-fun res!726998 () Bool)

(assert (=> b!1089840 (=> (not res!726998) (not e!622464))))

(assert (=> b!1089840 (= res!726998 (and (= (size!34405 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34404 _keys!1070) (size!34405 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!726993 () Bool)

(assert (=> start!96078 (=> (not res!726993) (not e!622464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96078 (= res!726993 (validMask!0 mask!1414))))

(assert (=> start!96078 e!622464))

(assert (=> start!96078 tp!80041))

(assert (=> start!96078 true))

(assert (=> start!96078 tp_is_empty!26733))

(declare-fun array_inv!26116 (array!70389) Bool)

(assert (=> start!96078 (array_inv!26116 _keys!1070)))

(declare-fun array_inv!26117 (array!70391) Bool)

(assert (=> start!96078 (and (array_inv!26117 _values!874) e!622462)))

(declare-fun b!1089834 () Bool)

(assert (=> b!1089834 (= e!622460 true)))

(assert (=> b!1089834 e!622461))

(declare-fun res!727001 () Bool)

(assert (=> b!1089834 (=> (not res!727001) (not e!622461))))

(assert (=> b!1089834 (= res!727001 (= lt!486012 (+!3318 lt!486013 lt!486009)))))

(assert (=> b!1089834 (= lt!486009 (tuple2!17055 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1089841 () Bool)

(assert (=> b!1089841 (= e!622459 tp_is_empty!26733)))

(declare-fun mapNonEmpty!41854 () Bool)

(declare-fun tp!80042 () Bool)

(assert (=> mapNonEmpty!41854 (= mapRes!41854 (and tp!80042 e!622463))))

(declare-fun mapValue!41854 () ValueCell!12657)

(declare-fun mapRest!41854 () (Array (_ BitVec 32) ValueCell!12657))

(declare-fun mapKey!41854 () (_ BitVec 32))

(assert (=> mapNonEmpty!41854 (= (arr!33869 _values!874) (store mapRest!41854 mapKey!41854 mapValue!41854))))

(declare-fun mapIsEmpty!41854 () Bool)

(assert (=> mapIsEmpty!41854 mapRes!41854))

(assert (= (and start!96078 res!726993) b!1089840))

(assert (= (and b!1089840 res!726998) b!1089836))

(assert (= (and b!1089836 res!726991) b!1089829))

(assert (= (and b!1089829 res!726996) b!1089838))

(assert (= (and b!1089838 res!727000) b!1089831))

(assert (= (and b!1089831 res!726999) b!1089839))

(assert (= (and b!1089839 res!727002) b!1089835))

(assert (= (and b!1089835 res!726992) b!1089830))

(assert (= (and b!1089830 res!726997) b!1089827))

(assert (= (and b!1089827 (not res!726995)) b!1089834))

(assert (= (and b!1089834 res!727001) b!1089832))

(assert (= (and b!1089832 res!726994) b!1089833))

(assert (= (and b!1089828 condMapEmpty!41854) mapIsEmpty!41854))

(assert (= (and b!1089828 (not condMapEmpty!41854)) mapNonEmpty!41854))

(get-info :version)

(assert (= (and mapNonEmpty!41854 ((_ is ValueCellFull!12657) mapValue!41854)) b!1089837))

(assert (= (and b!1089828 ((_ is ValueCellFull!12657) mapDefault!41854)) b!1089841))

(assert (= start!96078 b!1089828))

(declare-fun b_lambda!17401 () Bool)

(assert (=> (not b_lambda!17401) (not b!1089827)))

(declare-fun t!33431 () Bool)

(declare-fun tb!7609 () Bool)

(assert (=> (and start!96078 (= defaultEntry!882 defaultEntry!882) t!33431) tb!7609))

(declare-fun result!15737 () Bool)

(assert (=> tb!7609 (= result!15737 tp_is_empty!26733)))

(assert (=> b!1089827 t!33431))

(declare-fun b_and!36139 () Bool)

(assert (= b_and!36137 (and (=> t!33431 result!15737) b_and!36139)))

(declare-fun m!1009135 () Bool)

(assert (=> b!1089830 m!1009135))

(declare-fun m!1009137 () Bool)

(assert (=> b!1089834 m!1009137))

(declare-fun m!1009139 () Bool)

(assert (=> b!1089829 m!1009139))

(declare-fun m!1009141 () Bool)

(assert (=> b!1089831 m!1009141))

(declare-fun m!1009143 () Bool)

(assert (=> mapNonEmpty!41854 m!1009143))

(declare-fun m!1009145 () Bool)

(assert (=> b!1089839 m!1009145))

(declare-fun m!1009147 () Bool)

(assert (=> b!1089827 m!1009147))

(declare-fun m!1009149 () Bool)

(assert (=> b!1089827 m!1009149))

(declare-fun m!1009151 () Bool)

(assert (=> b!1089827 m!1009151))

(declare-fun m!1009153 () Bool)

(assert (=> b!1089827 m!1009153))

(declare-fun m!1009155 () Bool)

(assert (=> b!1089827 m!1009155))

(declare-fun m!1009157 () Bool)

(assert (=> b!1089827 m!1009157))

(declare-fun m!1009159 () Bool)

(assert (=> b!1089827 m!1009159))

(declare-fun m!1009161 () Bool)

(assert (=> b!1089827 m!1009161))

(declare-fun m!1009163 () Bool)

(assert (=> b!1089827 m!1009163))

(declare-fun m!1009165 () Bool)

(assert (=> b!1089827 m!1009165))

(declare-fun m!1009167 () Bool)

(assert (=> b!1089835 m!1009167))

(declare-fun m!1009169 () Bool)

(assert (=> b!1089835 m!1009169))

(declare-fun m!1009171 () Bool)

(assert (=> start!96078 m!1009171))

(declare-fun m!1009173 () Bool)

(assert (=> start!96078 m!1009173))

(declare-fun m!1009175 () Bool)

(assert (=> start!96078 m!1009175))

(declare-fun m!1009177 () Bool)

(assert (=> b!1089836 m!1009177))

(declare-fun m!1009179 () Bool)

(assert (=> b!1089833 m!1009179))

(declare-fun m!1009181 () Bool)

(assert (=> b!1089832 m!1009181))

(check-sat b_and!36139 (not b!1089829) (not b!1089832) (not b_next!22731) tp_is_empty!26733 (not b!1089827) (not mapNonEmpty!41854) (not b!1089835) (not b!1089833) (not b_lambda!17401) (not start!96078) (not b!1089830) (not b!1089834) (not b!1089831) (not b!1089836))
(check-sat b_and!36139 (not b_next!22731))
