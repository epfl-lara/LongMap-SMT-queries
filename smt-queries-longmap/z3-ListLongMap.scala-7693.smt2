; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96558 () Bool)

(assert start!96558)

(declare-fun b_free!23085 () Bool)

(declare-fun b_next!23085 () Bool)

(assert (=> start!96558 (= b_free!23085 (not b_next!23085))))

(declare-fun tp!81188 () Bool)

(declare-fun b_and!36861 () Bool)

(assert (=> start!96558 (= tp!81188 b_and!36861)))

(declare-datatypes ((V!41307 0))(
  ( (V!41308 (val!13624 Int)) )
))
(declare-datatypes ((tuple2!17304 0))(
  ( (tuple2!17305 (_1!8663 (_ BitVec 64)) (_2!8663 V!41307)) )
))
(declare-fun lt!491129 () tuple2!17304)

(declare-fun b!1098153 () Bool)

(declare-fun e!626764 () Bool)

(declare-datatypes ((List!23925 0))(
  ( (Nil!23922) (Cons!23921 (h!25130 tuple2!17304) (t!34056 List!23925)) )
))
(declare-datatypes ((ListLongMap!15273 0))(
  ( (ListLongMap!15274 (toList!7652 List!23925)) )
))
(declare-fun lt!491128 () ListLongMap!15273)

(declare-fun lt!491123 () tuple2!17304)

(declare-fun lt!491125 () ListLongMap!15273)

(declare-fun +!3361 (ListLongMap!15273 tuple2!17304) ListLongMap!15273)

(assert (=> b!1098153 (= e!626764 (= lt!491125 (+!3361 (+!3361 lt!491128 lt!491123) lt!491129)))))

(declare-fun b!1098154 () Bool)

(declare-fun e!626770 () Bool)

(declare-fun e!626765 () Bool)

(assert (=> b!1098154 (= e!626770 e!626765)))

(declare-fun res!732909 () Bool)

(assert (=> b!1098154 (=> (not res!732909) (not e!626765))))

(declare-datatypes ((array!71181 0))(
  ( (array!71182 (arr!34260 (Array (_ BitVec 32) (_ BitVec 64))) (size!34796 (_ BitVec 32))) )
))
(declare-fun lt!491120 () array!71181)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71181 (_ BitVec 32)) Bool)

(assert (=> b!1098154 (= res!732909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491120 mask!1414))))

(declare-fun _keys!1070 () array!71181)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098154 (= lt!491120 (array!71182 (store (arr!34260 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34796 _keys!1070)))))

(declare-fun b!1098155 () Bool)

(declare-fun res!732904 () Bool)

(assert (=> b!1098155 (=> (not res!732904) (not e!626770))))

(assert (=> b!1098155 (= res!732904 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34796 _keys!1070))))))

(declare-fun b!1098156 () Bool)

(declare-fun e!626767 () Bool)

(declare-fun e!626771 () Bool)

(declare-fun mapRes!42469 () Bool)

(assert (=> b!1098156 (= e!626767 (and e!626771 mapRes!42469))))

(declare-fun condMapEmpty!42469 () Bool)

(declare-datatypes ((ValueCell!12858 0))(
  ( (ValueCellFull!12858 (v!16247 V!41307)) (EmptyCell!12858) )
))
(declare-datatypes ((array!71183 0))(
  ( (array!71184 (arr!34261 (Array (_ BitVec 32) ValueCell!12858)) (size!34797 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71183)

(declare-fun mapDefault!42469 () ValueCell!12858)

(assert (=> b!1098156 (= condMapEmpty!42469 (= (arr!34261 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12858)) mapDefault!42469)))))

(declare-fun res!732901 () Bool)

(assert (=> start!96558 (=> (not res!732901) (not e!626770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96558 (= res!732901 (validMask!0 mask!1414))))

(assert (=> start!96558 e!626770))

(assert (=> start!96558 tp!81188))

(assert (=> start!96558 true))

(declare-fun tp_is_empty!27135 () Bool)

(assert (=> start!96558 tp_is_empty!27135))

(declare-fun array_inv!26394 (array!71181) Bool)

(assert (=> start!96558 (array_inv!26394 _keys!1070)))

(declare-fun array_inv!26395 (array!71183) Bool)

(assert (=> start!96558 (and (array_inv!26395 _values!874) e!626767)))

(declare-fun mapNonEmpty!42469 () Bool)

(declare-fun tp!81187 () Bool)

(declare-fun e!626769 () Bool)

(assert (=> mapNonEmpty!42469 (= mapRes!42469 (and tp!81187 e!626769))))

(declare-fun mapKey!42469 () (_ BitVec 32))

(declare-fun mapRest!42469 () (Array (_ BitVec 32) ValueCell!12858))

(declare-fun mapValue!42469 () ValueCell!12858)

(assert (=> mapNonEmpty!42469 (= (arr!34261 _values!874) (store mapRest!42469 mapKey!42469 mapValue!42469))))

(declare-fun b!1098157 () Bool)

(declare-fun e!626768 () Bool)

(assert (=> b!1098157 (= e!626765 (not e!626768))))

(declare-fun res!732905 () Bool)

(assert (=> b!1098157 (=> res!732905 e!626768)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098157 (= res!732905 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!41307)

(declare-fun zeroValue!831 () V!41307)

(declare-fun lt!491122 () ListLongMap!15273)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4372 (array!71181 array!71183 (_ BitVec 32) (_ BitVec 32) V!41307 V!41307 (_ BitVec 32) Int) ListLongMap!15273)

(assert (=> b!1098157 (= lt!491122 (getCurrentListMap!4372 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491130 () array!71183)

(assert (=> b!1098157 (= lt!491125 (getCurrentListMap!4372 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491121 () ListLongMap!15273)

(assert (=> b!1098157 (and (= lt!491121 lt!491128) (= lt!491128 lt!491121))))

(declare-fun lt!491126 () ListLongMap!15273)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!942 (ListLongMap!15273 (_ BitVec 64)) ListLongMap!15273)

(assert (=> b!1098157 (= lt!491128 (-!942 lt!491126 k0!904))))

(declare-datatypes ((Unit!36120 0))(
  ( (Unit!36121) )
))
(declare-fun lt!491124 () Unit!36120)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!198 (array!71181 array!71183 (_ BitVec 32) (_ BitVec 32) V!41307 V!41307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36120)

(assert (=> b!1098157 (= lt!491124 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!198 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4168 (array!71181 array!71183 (_ BitVec 32) (_ BitVec 32) V!41307 V!41307 (_ BitVec 32) Int) ListLongMap!15273)

(assert (=> b!1098157 (= lt!491121 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2303 (Int (_ BitVec 64)) V!41307)

(assert (=> b!1098157 (= lt!491130 (array!71184 (store (arr!34261 _values!874) i!650 (ValueCellFull!12858 (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34797 _values!874)))))

(assert (=> b!1098157 (= lt!491126 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098157 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491127 () Unit!36120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71181 (_ BitVec 64) (_ BitVec 32)) Unit!36120)

(assert (=> b!1098157 (= lt!491127 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098158 () Bool)

(declare-fun res!732908 () Bool)

(assert (=> b!1098158 (=> (not res!732908) (not e!626770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098158 (= res!732908 (validKeyInArray!0 k0!904))))

(declare-fun b!1098159 () Bool)

(declare-fun res!732900 () Bool)

(assert (=> b!1098159 (=> (not res!732900) (not e!626770))))

(assert (=> b!1098159 (= res!732900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098160 () Bool)

(declare-fun res!732899 () Bool)

(assert (=> b!1098160 (=> (not res!732899) (not e!626764))))

(assert (=> b!1098160 (= res!732899 (= lt!491122 (+!3361 (+!3361 lt!491126 lt!491123) lt!491129)))))

(declare-fun mapIsEmpty!42469 () Bool)

(assert (=> mapIsEmpty!42469 mapRes!42469))

(declare-fun b!1098161 () Bool)

(declare-fun res!732902 () Bool)

(assert (=> b!1098161 (=> (not res!732902) (not e!626765))))

(declare-datatypes ((List!23926 0))(
  ( (Nil!23923) (Cons!23922 (h!25131 (_ BitVec 64)) (t!34057 List!23926)) )
))
(declare-fun arrayNoDuplicates!0 (array!71181 (_ BitVec 32) List!23926) Bool)

(assert (=> b!1098161 (= res!732902 (arrayNoDuplicates!0 lt!491120 #b00000000000000000000000000000000 Nil!23923))))

(declare-fun b!1098162 () Bool)

(assert (=> b!1098162 (= e!626768 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(assert (=> b!1098162 e!626764))

(declare-fun res!732898 () Bool)

(assert (=> b!1098162 (=> (not res!732898) (not e!626764))))

(assert (=> b!1098162 (= res!732898 (= lt!491125 (+!3361 (+!3361 lt!491121 lt!491123) lt!491129)))))

(assert (=> b!1098162 (= lt!491129 (tuple2!17305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098162 (= lt!491123 (tuple2!17305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098163 () Bool)

(declare-fun res!732906 () Bool)

(assert (=> b!1098163 (=> (not res!732906) (not e!626770))))

(assert (=> b!1098163 (= res!732906 (and (= (size!34797 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34796 _keys!1070) (size!34797 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098164 () Bool)

(assert (=> b!1098164 (= e!626769 tp_is_empty!27135)))

(declare-fun b!1098165 () Bool)

(declare-fun res!732907 () Bool)

(assert (=> b!1098165 (=> (not res!732907) (not e!626770))))

(assert (=> b!1098165 (= res!732907 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23923))))

(declare-fun b!1098166 () Bool)

(declare-fun res!732903 () Bool)

(assert (=> b!1098166 (=> (not res!732903) (not e!626770))))

(assert (=> b!1098166 (= res!732903 (= (select (arr!34260 _keys!1070) i!650) k0!904))))

(declare-fun b!1098167 () Bool)

(assert (=> b!1098167 (= e!626771 tp_is_empty!27135)))

(assert (= (and start!96558 res!732901) b!1098163))

(assert (= (and b!1098163 res!732906) b!1098159))

(assert (= (and b!1098159 res!732900) b!1098165))

(assert (= (and b!1098165 res!732907) b!1098155))

(assert (= (and b!1098155 res!732904) b!1098158))

(assert (= (and b!1098158 res!732908) b!1098166))

(assert (= (and b!1098166 res!732903) b!1098154))

(assert (= (and b!1098154 res!732909) b!1098161))

(assert (= (and b!1098161 res!732902) b!1098157))

(assert (= (and b!1098157 (not res!732905)) b!1098162))

(assert (= (and b!1098162 res!732898) b!1098160))

(assert (= (and b!1098160 res!732899) b!1098153))

(assert (= (and b!1098156 condMapEmpty!42469) mapIsEmpty!42469))

(assert (= (and b!1098156 (not condMapEmpty!42469)) mapNonEmpty!42469))

(get-info :version)

(assert (= (and mapNonEmpty!42469 ((_ is ValueCellFull!12858) mapValue!42469)) b!1098164))

(assert (= (and b!1098156 ((_ is ValueCellFull!12858) mapDefault!42469)) b!1098167))

(assert (= start!96558 b!1098156))

(declare-fun b_lambda!17803 () Bool)

(assert (=> (not b_lambda!17803) (not b!1098157)))

(declare-fun t!34055 () Bool)

(declare-fun tb!7951 () Bool)

(assert (=> (and start!96558 (= defaultEntry!882 defaultEntry!882) t!34055) tb!7951))

(declare-fun result!16429 () Bool)

(assert (=> tb!7951 (= result!16429 tp_is_empty!27135)))

(assert (=> b!1098157 t!34055))

(declare-fun b_and!36863 () Bool)

(assert (= b_and!36861 (and (=> t!34055 result!16429) b_and!36863)))

(declare-fun m!1017747 () Bool)

(assert (=> b!1098153 m!1017747))

(assert (=> b!1098153 m!1017747))

(declare-fun m!1017749 () Bool)

(assert (=> b!1098153 m!1017749))

(declare-fun m!1017751 () Bool)

(assert (=> b!1098159 m!1017751))

(declare-fun m!1017753 () Bool)

(assert (=> b!1098166 m!1017753))

(declare-fun m!1017755 () Bool)

(assert (=> b!1098154 m!1017755))

(declare-fun m!1017757 () Bool)

(assert (=> b!1098154 m!1017757))

(declare-fun m!1017759 () Bool)

(assert (=> mapNonEmpty!42469 m!1017759))

(declare-fun m!1017761 () Bool)

(assert (=> b!1098157 m!1017761))

(declare-fun m!1017763 () Bool)

(assert (=> b!1098157 m!1017763))

(declare-fun m!1017765 () Bool)

(assert (=> b!1098157 m!1017765))

(declare-fun m!1017767 () Bool)

(assert (=> b!1098157 m!1017767))

(declare-fun m!1017769 () Bool)

(assert (=> b!1098157 m!1017769))

(declare-fun m!1017771 () Bool)

(assert (=> b!1098157 m!1017771))

(declare-fun m!1017773 () Bool)

(assert (=> b!1098157 m!1017773))

(declare-fun m!1017775 () Bool)

(assert (=> b!1098157 m!1017775))

(declare-fun m!1017777 () Bool)

(assert (=> b!1098157 m!1017777))

(declare-fun m!1017779 () Bool)

(assert (=> b!1098157 m!1017779))

(declare-fun m!1017781 () Bool)

(assert (=> b!1098158 m!1017781))

(declare-fun m!1017783 () Bool)

(assert (=> b!1098160 m!1017783))

(assert (=> b!1098160 m!1017783))

(declare-fun m!1017785 () Bool)

(assert (=> b!1098160 m!1017785))

(declare-fun m!1017787 () Bool)

(assert (=> b!1098165 m!1017787))

(declare-fun m!1017789 () Bool)

(assert (=> b!1098161 m!1017789))

(declare-fun m!1017791 () Bool)

(assert (=> b!1098162 m!1017791))

(assert (=> b!1098162 m!1017791))

(declare-fun m!1017793 () Bool)

(assert (=> b!1098162 m!1017793))

(declare-fun m!1017795 () Bool)

(assert (=> start!96558 m!1017795))

(declare-fun m!1017797 () Bool)

(assert (=> start!96558 m!1017797))

(declare-fun m!1017799 () Bool)

(assert (=> start!96558 m!1017799))

(check-sat (not b!1098161) (not b!1098165) (not b!1098153) (not b_next!23085) tp_is_empty!27135 (not b!1098162) (not b!1098160) (not b!1098157) (not start!96558) (not b!1098159) b_and!36863 (not b_lambda!17803) (not b!1098154) (not b!1098158) (not mapNonEmpty!42469))
(check-sat b_and!36863 (not b_next!23085))
(get-model)

(declare-fun b_lambda!17807 () Bool)

(assert (= b_lambda!17803 (or (and start!96558 b_free!23085) b_lambda!17807)))

(check-sat (not b!1098161) (not b!1098165) (not b!1098153) (not b_next!23085) tp_is_empty!27135 (not b!1098160) (not b!1098157) (not start!96558) (not b!1098159) b_and!36863 (not b!1098154) (not b!1098162) (not b_lambda!17807) (not b!1098158) (not mapNonEmpty!42469))
(check-sat b_and!36863 (not b_next!23085))
(get-model)

(declare-fun d!130375 () Bool)

(declare-fun res!732951 () Bool)

(declare-fun e!626803 () Bool)

(assert (=> d!130375 (=> res!732951 e!626803)))

(assert (=> d!130375 (= res!732951 (bvsge #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(assert (=> d!130375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626803)))

(declare-fun b!1098225 () Bool)

(declare-fun e!626802 () Bool)

(assert (=> b!1098225 (= e!626803 e!626802)))

(declare-fun c!108463 () Bool)

(assert (=> b!1098225 (= c!108463 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098226 () Bool)

(declare-fun call!45859 () Bool)

(assert (=> b!1098226 (= e!626802 call!45859)))

(declare-fun b!1098227 () Bool)

(declare-fun e!626804 () Bool)

(assert (=> b!1098227 (= e!626804 call!45859)))

(declare-fun bm!45856 () Bool)

(assert (=> bm!45856 (= call!45859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1098228 () Bool)

(assert (=> b!1098228 (= e!626802 e!626804)))

(declare-fun lt!491171 () (_ BitVec 64))

(assert (=> b!1098228 (= lt!491171 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491172 () Unit!36120)

(assert (=> b!1098228 (= lt!491172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!491171 #b00000000000000000000000000000000))))

(assert (=> b!1098228 (arrayContainsKey!0 _keys!1070 lt!491171 #b00000000000000000000000000000000)))

(declare-fun lt!491170 () Unit!36120)

(assert (=> b!1098228 (= lt!491170 lt!491172)))

(declare-fun res!732950 () Bool)

(declare-datatypes ((SeekEntryResult!9908 0))(
  ( (MissingZero!9908 (index!42003 (_ BitVec 32))) (Found!9908 (index!42004 (_ BitVec 32))) (Intermediate!9908 (undefined!10720 Bool) (index!42005 (_ BitVec 32)) (x!98776 (_ BitVec 32))) (Undefined!9908) (MissingVacant!9908 (index!42006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71181 (_ BitVec 32)) SeekEntryResult!9908)

(assert (=> b!1098228 (= res!732950 (= (seekEntryOrOpen!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9908 #b00000000000000000000000000000000)))))

(assert (=> b!1098228 (=> (not res!732950) (not e!626804))))

(assert (= (and d!130375 (not res!732951)) b!1098225))

(assert (= (and b!1098225 c!108463) b!1098228))

(assert (= (and b!1098225 (not c!108463)) b!1098226))

(assert (= (and b!1098228 res!732950) b!1098227))

(assert (= (or b!1098227 b!1098226) bm!45856))

(declare-fun m!1017855 () Bool)

(assert (=> b!1098225 m!1017855))

(assert (=> b!1098225 m!1017855))

(declare-fun m!1017857 () Bool)

(assert (=> b!1098225 m!1017857))

(declare-fun m!1017859 () Bool)

(assert (=> bm!45856 m!1017859))

(assert (=> b!1098228 m!1017855))

(declare-fun m!1017861 () Bool)

(assert (=> b!1098228 m!1017861))

(declare-fun m!1017863 () Bool)

(assert (=> b!1098228 m!1017863))

(assert (=> b!1098228 m!1017855))

(declare-fun m!1017865 () Bool)

(assert (=> b!1098228 m!1017865))

(assert (=> b!1098159 d!130375))

(declare-fun d!130377 () Bool)

(declare-fun e!626807 () Bool)

(assert (=> d!130377 e!626807))

(declare-fun res!732957 () Bool)

(assert (=> d!130377 (=> (not res!732957) (not e!626807))))

(declare-fun lt!491184 () ListLongMap!15273)

(declare-fun contains!6383 (ListLongMap!15273 (_ BitVec 64)) Bool)

(assert (=> d!130377 (= res!732957 (contains!6383 lt!491184 (_1!8663 lt!491129)))))

(declare-fun lt!491181 () List!23925)

(assert (=> d!130377 (= lt!491184 (ListLongMap!15274 lt!491181))))

(declare-fun lt!491183 () Unit!36120)

(declare-fun lt!491182 () Unit!36120)

(assert (=> d!130377 (= lt!491183 lt!491182)))

(declare-datatypes ((Option!671 0))(
  ( (Some!670 (v!16249 V!41307)) (None!669) )
))
(declare-fun getValueByKey!620 (List!23925 (_ BitVec 64)) Option!671)

(assert (=> d!130377 (= (getValueByKey!620 lt!491181 (_1!8663 lt!491129)) (Some!670 (_2!8663 lt!491129)))))

(declare-fun lemmaContainsTupThenGetReturnValue!297 (List!23925 (_ BitVec 64) V!41307) Unit!36120)

(assert (=> d!130377 (= lt!491182 (lemmaContainsTupThenGetReturnValue!297 lt!491181 (_1!8663 lt!491129) (_2!8663 lt!491129)))))

(declare-fun insertStrictlySorted!390 (List!23925 (_ BitVec 64) V!41307) List!23925)

(assert (=> d!130377 (= lt!491181 (insertStrictlySorted!390 (toList!7652 (+!3361 lt!491126 lt!491123)) (_1!8663 lt!491129) (_2!8663 lt!491129)))))

(assert (=> d!130377 (= (+!3361 (+!3361 lt!491126 lt!491123) lt!491129) lt!491184)))

(declare-fun b!1098233 () Bool)

(declare-fun res!732956 () Bool)

(assert (=> b!1098233 (=> (not res!732956) (not e!626807))))

(assert (=> b!1098233 (= res!732956 (= (getValueByKey!620 (toList!7652 lt!491184) (_1!8663 lt!491129)) (Some!670 (_2!8663 lt!491129))))))

(declare-fun b!1098234 () Bool)

(declare-fun contains!6384 (List!23925 tuple2!17304) Bool)

(assert (=> b!1098234 (= e!626807 (contains!6384 (toList!7652 lt!491184) lt!491129))))

(assert (= (and d!130377 res!732957) b!1098233))

(assert (= (and b!1098233 res!732956) b!1098234))

(declare-fun m!1017867 () Bool)

(assert (=> d!130377 m!1017867))

(declare-fun m!1017869 () Bool)

(assert (=> d!130377 m!1017869))

(declare-fun m!1017871 () Bool)

(assert (=> d!130377 m!1017871))

(declare-fun m!1017873 () Bool)

(assert (=> d!130377 m!1017873))

(declare-fun m!1017875 () Bool)

(assert (=> b!1098233 m!1017875))

(declare-fun m!1017877 () Bool)

(assert (=> b!1098234 m!1017877))

(assert (=> b!1098160 d!130377))

(declare-fun d!130379 () Bool)

(declare-fun e!626808 () Bool)

(assert (=> d!130379 e!626808))

(declare-fun res!732959 () Bool)

(assert (=> d!130379 (=> (not res!732959) (not e!626808))))

(declare-fun lt!491188 () ListLongMap!15273)

(assert (=> d!130379 (= res!732959 (contains!6383 lt!491188 (_1!8663 lt!491123)))))

(declare-fun lt!491185 () List!23925)

(assert (=> d!130379 (= lt!491188 (ListLongMap!15274 lt!491185))))

(declare-fun lt!491187 () Unit!36120)

(declare-fun lt!491186 () Unit!36120)

(assert (=> d!130379 (= lt!491187 lt!491186)))

(assert (=> d!130379 (= (getValueByKey!620 lt!491185 (_1!8663 lt!491123)) (Some!670 (_2!8663 lt!491123)))))

(assert (=> d!130379 (= lt!491186 (lemmaContainsTupThenGetReturnValue!297 lt!491185 (_1!8663 lt!491123) (_2!8663 lt!491123)))))

(assert (=> d!130379 (= lt!491185 (insertStrictlySorted!390 (toList!7652 lt!491126) (_1!8663 lt!491123) (_2!8663 lt!491123)))))

(assert (=> d!130379 (= (+!3361 lt!491126 lt!491123) lt!491188)))

(declare-fun b!1098235 () Bool)

(declare-fun res!732958 () Bool)

(assert (=> b!1098235 (=> (not res!732958) (not e!626808))))

(assert (=> b!1098235 (= res!732958 (= (getValueByKey!620 (toList!7652 lt!491188) (_1!8663 lt!491123)) (Some!670 (_2!8663 lt!491123))))))

(declare-fun b!1098236 () Bool)

(assert (=> b!1098236 (= e!626808 (contains!6384 (toList!7652 lt!491188) lt!491123))))

(assert (= (and d!130379 res!732959) b!1098235))

(assert (= (and b!1098235 res!732958) b!1098236))

(declare-fun m!1017879 () Bool)

(assert (=> d!130379 m!1017879))

(declare-fun m!1017881 () Bool)

(assert (=> d!130379 m!1017881))

(declare-fun m!1017883 () Bool)

(assert (=> d!130379 m!1017883))

(declare-fun m!1017885 () Bool)

(assert (=> d!130379 m!1017885))

(declare-fun m!1017887 () Bool)

(assert (=> b!1098235 m!1017887))

(declare-fun m!1017889 () Bool)

(assert (=> b!1098236 m!1017889))

(assert (=> b!1098160 d!130379))

(declare-fun d!130381 () Bool)

(assert (=> d!130381 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96558 d!130381))

(declare-fun d!130383 () Bool)

(assert (=> d!130383 (= (array_inv!26394 _keys!1070) (bvsge (size!34796 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96558 d!130383))

(declare-fun d!130385 () Bool)

(assert (=> d!130385 (= (array_inv!26395 _values!874) (bvsge (size!34797 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96558 d!130385))

(declare-fun d!130387 () Bool)

(assert (=> d!130387 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098158 d!130387))

(declare-fun d!130389 () Bool)

(declare-fun e!626809 () Bool)

(assert (=> d!130389 e!626809))

(declare-fun res!732961 () Bool)

(assert (=> d!130389 (=> (not res!732961) (not e!626809))))

(declare-fun lt!491192 () ListLongMap!15273)

(assert (=> d!130389 (= res!732961 (contains!6383 lt!491192 (_1!8663 lt!491129)))))

(declare-fun lt!491189 () List!23925)

(assert (=> d!130389 (= lt!491192 (ListLongMap!15274 lt!491189))))

(declare-fun lt!491191 () Unit!36120)

(declare-fun lt!491190 () Unit!36120)

(assert (=> d!130389 (= lt!491191 lt!491190)))

(assert (=> d!130389 (= (getValueByKey!620 lt!491189 (_1!8663 lt!491129)) (Some!670 (_2!8663 lt!491129)))))

(assert (=> d!130389 (= lt!491190 (lemmaContainsTupThenGetReturnValue!297 lt!491189 (_1!8663 lt!491129) (_2!8663 lt!491129)))))

(assert (=> d!130389 (= lt!491189 (insertStrictlySorted!390 (toList!7652 (+!3361 lt!491121 lt!491123)) (_1!8663 lt!491129) (_2!8663 lt!491129)))))

(assert (=> d!130389 (= (+!3361 (+!3361 lt!491121 lt!491123) lt!491129) lt!491192)))

(declare-fun b!1098237 () Bool)

(declare-fun res!732960 () Bool)

(assert (=> b!1098237 (=> (not res!732960) (not e!626809))))

(assert (=> b!1098237 (= res!732960 (= (getValueByKey!620 (toList!7652 lt!491192) (_1!8663 lt!491129)) (Some!670 (_2!8663 lt!491129))))))

(declare-fun b!1098238 () Bool)

(assert (=> b!1098238 (= e!626809 (contains!6384 (toList!7652 lt!491192) lt!491129))))

(assert (= (and d!130389 res!732961) b!1098237))

(assert (= (and b!1098237 res!732960) b!1098238))

(declare-fun m!1017891 () Bool)

(assert (=> d!130389 m!1017891))

(declare-fun m!1017893 () Bool)

(assert (=> d!130389 m!1017893))

(declare-fun m!1017895 () Bool)

(assert (=> d!130389 m!1017895))

(declare-fun m!1017897 () Bool)

(assert (=> d!130389 m!1017897))

(declare-fun m!1017899 () Bool)

(assert (=> b!1098237 m!1017899))

(declare-fun m!1017901 () Bool)

(assert (=> b!1098238 m!1017901))

(assert (=> b!1098162 d!130389))

(declare-fun d!130391 () Bool)

(declare-fun e!626810 () Bool)

(assert (=> d!130391 e!626810))

(declare-fun res!732963 () Bool)

(assert (=> d!130391 (=> (not res!732963) (not e!626810))))

(declare-fun lt!491196 () ListLongMap!15273)

(assert (=> d!130391 (= res!732963 (contains!6383 lt!491196 (_1!8663 lt!491123)))))

(declare-fun lt!491193 () List!23925)

(assert (=> d!130391 (= lt!491196 (ListLongMap!15274 lt!491193))))

(declare-fun lt!491195 () Unit!36120)

(declare-fun lt!491194 () Unit!36120)

(assert (=> d!130391 (= lt!491195 lt!491194)))

(assert (=> d!130391 (= (getValueByKey!620 lt!491193 (_1!8663 lt!491123)) (Some!670 (_2!8663 lt!491123)))))

(assert (=> d!130391 (= lt!491194 (lemmaContainsTupThenGetReturnValue!297 lt!491193 (_1!8663 lt!491123) (_2!8663 lt!491123)))))

(assert (=> d!130391 (= lt!491193 (insertStrictlySorted!390 (toList!7652 lt!491121) (_1!8663 lt!491123) (_2!8663 lt!491123)))))

(assert (=> d!130391 (= (+!3361 lt!491121 lt!491123) lt!491196)))

(declare-fun b!1098239 () Bool)

(declare-fun res!732962 () Bool)

(assert (=> b!1098239 (=> (not res!732962) (not e!626810))))

(assert (=> b!1098239 (= res!732962 (= (getValueByKey!620 (toList!7652 lt!491196) (_1!8663 lt!491123)) (Some!670 (_2!8663 lt!491123))))))

(declare-fun b!1098240 () Bool)

(assert (=> b!1098240 (= e!626810 (contains!6384 (toList!7652 lt!491196) lt!491123))))

(assert (= (and d!130391 res!732963) b!1098239))

(assert (= (and b!1098239 res!732962) b!1098240))

(declare-fun m!1017903 () Bool)

(assert (=> d!130391 m!1017903))

(declare-fun m!1017905 () Bool)

(assert (=> d!130391 m!1017905))

(declare-fun m!1017907 () Bool)

(assert (=> d!130391 m!1017907))

(declare-fun m!1017909 () Bool)

(assert (=> d!130391 m!1017909))

(declare-fun m!1017911 () Bool)

(assert (=> b!1098239 m!1017911))

(declare-fun m!1017913 () Bool)

(assert (=> b!1098240 m!1017913))

(assert (=> b!1098162 d!130391))

(declare-fun d!130393 () Bool)

(declare-fun res!732965 () Bool)

(declare-fun e!626812 () Bool)

(assert (=> d!130393 (=> res!732965 e!626812)))

(assert (=> d!130393 (= res!732965 (bvsge #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(assert (=> d!130393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491120 mask!1414) e!626812)))

(declare-fun b!1098241 () Bool)

(declare-fun e!626811 () Bool)

(assert (=> b!1098241 (= e!626812 e!626811)))

(declare-fun c!108464 () Bool)

(assert (=> b!1098241 (= c!108464 (validKeyInArray!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(declare-fun b!1098242 () Bool)

(declare-fun call!45860 () Bool)

(assert (=> b!1098242 (= e!626811 call!45860)))

(declare-fun b!1098243 () Bool)

(declare-fun e!626813 () Bool)

(assert (=> b!1098243 (= e!626813 call!45860)))

(declare-fun bm!45857 () Bool)

(assert (=> bm!45857 (= call!45860 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491120 mask!1414))))

(declare-fun b!1098244 () Bool)

(assert (=> b!1098244 (= e!626811 e!626813)))

(declare-fun lt!491198 () (_ BitVec 64))

(assert (=> b!1098244 (= lt!491198 (select (arr!34260 lt!491120) #b00000000000000000000000000000000))))

(declare-fun lt!491199 () Unit!36120)

(assert (=> b!1098244 (= lt!491199 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491120 lt!491198 #b00000000000000000000000000000000))))

(assert (=> b!1098244 (arrayContainsKey!0 lt!491120 lt!491198 #b00000000000000000000000000000000)))

(declare-fun lt!491197 () Unit!36120)

(assert (=> b!1098244 (= lt!491197 lt!491199)))

(declare-fun res!732964 () Bool)

(assert (=> b!1098244 (= res!732964 (= (seekEntryOrOpen!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000) lt!491120 mask!1414) (Found!9908 #b00000000000000000000000000000000)))))

(assert (=> b!1098244 (=> (not res!732964) (not e!626813))))

(assert (= (and d!130393 (not res!732965)) b!1098241))

(assert (= (and b!1098241 c!108464) b!1098244))

(assert (= (and b!1098241 (not c!108464)) b!1098242))

(assert (= (and b!1098244 res!732964) b!1098243))

(assert (= (or b!1098243 b!1098242) bm!45857))

(declare-fun m!1017915 () Bool)

(assert (=> b!1098241 m!1017915))

(assert (=> b!1098241 m!1017915))

(declare-fun m!1017917 () Bool)

(assert (=> b!1098241 m!1017917))

(declare-fun m!1017919 () Bool)

(assert (=> bm!45857 m!1017919))

(assert (=> b!1098244 m!1017915))

(declare-fun m!1017921 () Bool)

(assert (=> b!1098244 m!1017921))

(declare-fun m!1017923 () Bool)

(assert (=> b!1098244 m!1017923))

(assert (=> b!1098244 m!1017915))

(declare-fun m!1017925 () Bool)

(assert (=> b!1098244 m!1017925))

(assert (=> b!1098154 d!130393))

(declare-fun b!1098255 () Bool)

(declare-fun e!626825 () Bool)

(declare-fun call!45863 () Bool)

(assert (=> b!1098255 (= e!626825 call!45863)))

(declare-fun bm!45860 () Bool)

(declare-fun c!108467 () Bool)

(assert (=> bm!45860 (= call!45863 (arrayNoDuplicates!0 lt!491120 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108467 (Cons!23922 (select (arr!34260 lt!491120) #b00000000000000000000000000000000) Nil!23923) Nil!23923)))))

(declare-fun b!1098257 () Bool)

(declare-fun e!626823 () Bool)

(declare-fun e!626822 () Bool)

(assert (=> b!1098257 (= e!626823 e!626822)))

(declare-fun res!732972 () Bool)

(assert (=> b!1098257 (=> (not res!732972) (not e!626822))))

(declare-fun e!626824 () Bool)

(assert (=> b!1098257 (= res!732972 (not e!626824))))

(declare-fun res!732974 () Bool)

(assert (=> b!1098257 (=> (not res!732974) (not e!626824))))

(assert (=> b!1098257 (= res!732974 (validKeyInArray!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(declare-fun b!1098258 () Bool)

(assert (=> b!1098258 (= e!626825 call!45863)))

(declare-fun b!1098259 () Bool)

(declare-fun contains!6385 (List!23926 (_ BitVec 64)) Bool)

(assert (=> b!1098259 (= e!626824 (contains!6385 Nil!23923 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(declare-fun d!130395 () Bool)

(declare-fun res!732973 () Bool)

(assert (=> d!130395 (=> res!732973 e!626823)))

(assert (=> d!130395 (= res!732973 (bvsge #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(assert (=> d!130395 (= (arrayNoDuplicates!0 lt!491120 #b00000000000000000000000000000000 Nil!23923) e!626823)))

(declare-fun b!1098256 () Bool)

(assert (=> b!1098256 (= e!626822 e!626825)))

(assert (=> b!1098256 (= c!108467 (validKeyInArray!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(assert (= (and d!130395 (not res!732973)) b!1098257))

(assert (= (and b!1098257 res!732974) b!1098259))

(assert (= (and b!1098257 res!732972) b!1098256))

(assert (= (and b!1098256 c!108467) b!1098258))

(assert (= (and b!1098256 (not c!108467)) b!1098255))

(assert (= (or b!1098258 b!1098255) bm!45860))

(assert (=> bm!45860 m!1017915))

(declare-fun m!1017927 () Bool)

(assert (=> bm!45860 m!1017927))

(assert (=> b!1098257 m!1017915))

(assert (=> b!1098257 m!1017915))

(assert (=> b!1098257 m!1017917))

(assert (=> b!1098259 m!1017915))

(assert (=> b!1098259 m!1017915))

(declare-fun m!1017929 () Bool)

(assert (=> b!1098259 m!1017929))

(assert (=> b!1098256 m!1017915))

(assert (=> b!1098256 m!1017915))

(assert (=> b!1098256 m!1017917))

(assert (=> b!1098161 d!130395))

(declare-fun d!130397 () Bool)

(declare-fun e!626826 () Bool)

(assert (=> d!130397 e!626826))

(declare-fun res!732976 () Bool)

(assert (=> d!130397 (=> (not res!732976) (not e!626826))))

(declare-fun lt!491203 () ListLongMap!15273)

(assert (=> d!130397 (= res!732976 (contains!6383 lt!491203 (_1!8663 lt!491129)))))

(declare-fun lt!491200 () List!23925)

(assert (=> d!130397 (= lt!491203 (ListLongMap!15274 lt!491200))))

(declare-fun lt!491202 () Unit!36120)

(declare-fun lt!491201 () Unit!36120)

(assert (=> d!130397 (= lt!491202 lt!491201)))

(assert (=> d!130397 (= (getValueByKey!620 lt!491200 (_1!8663 lt!491129)) (Some!670 (_2!8663 lt!491129)))))

(assert (=> d!130397 (= lt!491201 (lemmaContainsTupThenGetReturnValue!297 lt!491200 (_1!8663 lt!491129) (_2!8663 lt!491129)))))

(assert (=> d!130397 (= lt!491200 (insertStrictlySorted!390 (toList!7652 (+!3361 lt!491128 lt!491123)) (_1!8663 lt!491129) (_2!8663 lt!491129)))))

(assert (=> d!130397 (= (+!3361 (+!3361 lt!491128 lt!491123) lt!491129) lt!491203)))

(declare-fun b!1098260 () Bool)

(declare-fun res!732975 () Bool)

(assert (=> b!1098260 (=> (not res!732975) (not e!626826))))

(assert (=> b!1098260 (= res!732975 (= (getValueByKey!620 (toList!7652 lt!491203) (_1!8663 lt!491129)) (Some!670 (_2!8663 lt!491129))))))

(declare-fun b!1098261 () Bool)

(assert (=> b!1098261 (= e!626826 (contains!6384 (toList!7652 lt!491203) lt!491129))))

(assert (= (and d!130397 res!732976) b!1098260))

(assert (= (and b!1098260 res!732975) b!1098261))

(declare-fun m!1017931 () Bool)

(assert (=> d!130397 m!1017931))

(declare-fun m!1017933 () Bool)

(assert (=> d!130397 m!1017933))

(declare-fun m!1017935 () Bool)

(assert (=> d!130397 m!1017935))

(declare-fun m!1017937 () Bool)

(assert (=> d!130397 m!1017937))

(declare-fun m!1017939 () Bool)

(assert (=> b!1098260 m!1017939))

(declare-fun m!1017941 () Bool)

(assert (=> b!1098261 m!1017941))

(assert (=> b!1098153 d!130397))

(declare-fun d!130399 () Bool)

(declare-fun e!626827 () Bool)

(assert (=> d!130399 e!626827))

(declare-fun res!732978 () Bool)

(assert (=> d!130399 (=> (not res!732978) (not e!626827))))

(declare-fun lt!491207 () ListLongMap!15273)

(assert (=> d!130399 (= res!732978 (contains!6383 lt!491207 (_1!8663 lt!491123)))))

(declare-fun lt!491204 () List!23925)

(assert (=> d!130399 (= lt!491207 (ListLongMap!15274 lt!491204))))

(declare-fun lt!491206 () Unit!36120)

(declare-fun lt!491205 () Unit!36120)

(assert (=> d!130399 (= lt!491206 lt!491205)))

(assert (=> d!130399 (= (getValueByKey!620 lt!491204 (_1!8663 lt!491123)) (Some!670 (_2!8663 lt!491123)))))

(assert (=> d!130399 (= lt!491205 (lemmaContainsTupThenGetReturnValue!297 lt!491204 (_1!8663 lt!491123) (_2!8663 lt!491123)))))

(assert (=> d!130399 (= lt!491204 (insertStrictlySorted!390 (toList!7652 lt!491128) (_1!8663 lt!491123) (_2!8663 lt!491123)))))

(assert (=> d!130399 (= (+!3361 lt!491128 lt!491123) lt!491207)))

(declare-fun b!1098262 () Bool)

(declare-fun res!732977 () Bool)

(assert (=> b!1098262 (=> (not res!732977) (not e!626827))))

(assert (=> b!1098262 (= res!732977 (= (getValueByKey!620 (toList!7652 lt!491207) (_1!8663 lt!491123)) (Some!670 (_2!8663 lt!491123))))))

(declare-fun b!1098263 () Bool)

(assert (=> b!1098263 (= e!626827 (contains!6384 (toList!7652 lt!491207) lt!491123))))

(assert (= (and d!130399 res!732978) b!1098262))

(assert (= (and b!1098262 res!732977) b!1098263))

(declare-fun m!1017943 () Bool)

(assert (=> d!130399 m!1017943))

(declare-fun m!1017945 () Bool)

(assert (=> d!130399 m!1017945))

(declare-fun m!1017947 () Bool)

(assert (=> d!130399 m!1017947))

(declare-fun m!1017949 () Bool)

(assert (=> d!130399 m!1017949))

(declare-fun m!1017951 () Bool)

(assert (=> b!1098262 m!1017951))

(declare-fun m!1017953 () Bool)

(assert (=> b!1098263 m!1017953))

(assert (=> b!1098153 d!130399))

(declare-fun d!130401 () Bool)

(declare-fun res!732983 () Bool)

(declare-fun e!626832 () Bool)

(assert (=> d!130401 (=> res!732983 e!626832)))

(assert (=> d!130401 (= res!732983 (= (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130401 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!626832)))

(declare-fun b!1098268 () Bool)

(declare-fun e!626833 () Bool)

(assert (=> b!1098268 (= e!626832 e!626833)))

(declare-fun res!732984 () Bool)

(assert (=> b!1098268 (=> (not res!732984) (not e!626833))))

(assert (=> b!1098268 (= res!732984 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34796 _keys!1070)))))

(declare-fun b!1098269 () Bool)

(assert (=> b!1098269 (= e!626833 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130401 (not res!732983)) b!1098268))

(assert (= (and b!1098268 res!732984) b!1098269))

(assert (=> d!130401 m!1017855))

(declare-fun m!1017955 () Bool)

(assert (=> b!1098269 m!1017955))

(assert (=> b!1098157 d!130401))

(declare-fun e!626871 () Bool)

(declare-fun lt!491265 () ListLongMap!15273)

(declare-fun b!1098312 () Bool)

(declare-fun apply!945 (ListLongMap!15273 (_ BitVec 64)) V!41307)

(declare-fun get!17619 (ValueCell!12858 V!41307) V!41307)

(assert (=> b!1098312 (= e!626871 (= (apply!945 lt!491265 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)) (get!17619 (select (arr!34261 _values!874) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 _values!874)))))

(assert (=> b!1098312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(declare-fun b!1098313 () Bool)

(declare-fun e!626867 () Bool)

(assert (=> b!1098313 (= e!626867 e!626871)))

(declare-fun res!733004 () Bool)

(assert (=> b!1098313 (=> (not res!733004) (not e!626871))))

(assert (=> b!1098313 (= res!733004 (contains!6383 lt!491265 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(declare-fun b!1098314 () Bool)

(declare-fun e!626864 () Bool)

(declare-fun e!626868 () Bool)

(assert (=> b!1098314 (= e!626864 e!626868)))

(declare-fun c!108481 () Bool)

(assert (=> b!1098314 (= c!108481 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!45881 () ListLongMap!15273)

(declare-fun call!45879 () ListLongMap!15273)

(declare-fun c!108483 () Bool)

(declare-fun call!45878 () ListLongMap!15273)

(declare-fun bm!45875 () Bool)

(declare-fun call!45882 () ListLongMap!15273)

(declare-fun c!108484 () Bool)

(assert (=> bm!45875 (= call!45878 (+!3361 (ite c!108483 call!45881 (ite c!108484 call!45879 call!45882)) (ite (or c!108483 c!108484) (tuple2!17305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098315 () Bool)

(declare-fun e!626861 () Unit!36120)

(declare-fun lt!491271 () Unit!36120)

(assert (=> b!1098315 (= e!626861 lt!491271)))

(declare-fun lt!491272 () ListLongMap!15273)

(assert (=> b!1098315 (= lt!491272 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491273 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491273 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491261 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491261 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491264 () Unit!36120)

(declare-fun addStillContains!658 (ListLongMap!15273 (_ BitVec 64) V!41307 (_ BitVec 64)) Unit!36120)

(assert (=> b!1098315 (= lt!491264 (addStillContains!658 lt!491272 lt!491273 zeroValue!831 lt!491261))))

(assert (=> b!1098315 (contains!6383 (+!3361 lt!491272 (tuple2!17305 lt!491273 zeroValue!831)) lt!491261)))

(declare-fun lt!491255 () Unit!36120)

(assert (=> b!1098315 (= lt!491255 lt!491264)))

(declare-fun lt!491270 () ListLongMap!15273)

(assert (=> b!1098315 (= lt!491270 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491262 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491262 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491260 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491260 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491254 () Unit!36120)

(declare-fun addApplyDifferent!518 (ListLongMap!15273 (_ BitVec 64) V!41307 (_ BitVec 64)) Unit!36120)

(assert (=> b!1098315 (= lt!491254 (addApplyDifferent!518 lt!491270 lt!491262 minValue!831 lt!491260))))

(assert (=> b!1098315 (= (apply!945 (+!3361 lt!491270 (tuple2!17305 lt!491262 minValue!831)) lt!491260) (apply!945 lt!491270 lt!491260))))

(declare-fun lt!491258 () Unit!36120)

(assert (=> b!1098315 (= lt!491258 lt!491254)))

(declare-fun lt!491257 () ListLongMap!15273)

(assert (=> b!1098315 (= lt!491257 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491267 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491268 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491268 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491253 () Unit!36120)

(assert (=> b!1098315 (= lt!491253 (addApplyDifferent!518 lt!491257 lt!491267 zeroValue!831 lt!491268))))

(assert (=> b!1098315 (= (apply!945 (+!3361 lt!491257 (tuple2!17305 lt!491267 zeroValue!831)) lt!491268) (apply!945 lt!491257 lt!491268))))

(declare-fun lt!491266 () Unit!36120)

(assert (=> b!1098315 (= lt!491266 lt!491253)))

(declare-fun lt!491256 () ListLongMap!15273)

(assert (=> b!1098315 (= lt!491256 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491259 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491259 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491269 () (_ BitVec 64))

(assert (=> b!1098315 (= lt!491269 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098315 (= lt!491271 (addApplyDifferent!518 lt!491256 lt!491259 minValue!831 lt!491269))))

(assert (=> b!1098315 (= (apply!945 (+!3361 lt!491256 (tuple2!17305 lt!491259 minValue!831)) lt!491269) (apply!945 lt!491256 lt!491269))))

(declare-fun b!1098316 () Bool)

(declare-fun e!626865 () ListLongMap!15273)

(declare-fun call!45884 () ListLongMap!15273)

(assert (=> b!1098316 (= e!626865 call!45884)))

(declare-fun b!1098317 () Bool)

(declare-fun e!626872 () Bool)

(assert (=> b!1098317 (= e!626872 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098318 () Bool)

(declare-fun c!108480 () Bool)

(assert (=> b!1098318 (= c!108480 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626860 () ListLongMap!15273)

(assert (=> b!1098318 (= e!626865 e!626860)))

(declare-fun b!1098319 () Bool)

(assert (=> b!1098319 (= e!626860 call!45884)))

(declare-fun bm!45876 () Bool)

(assert (=> bm!45876 (= call!45881 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098320 () Bool)

(declare-fun e!626869 () Bool)

(declare-fun e!626863 () Bool)

(assert (=> b!1098320 (= e!626869 e!626863)))

(declare-fun res!733003 () Bool)

(declare-fun call!45883 () Bool)

(assert (=> b!1098320 (= res!733003 call!45883)))

(assert (=> b!1098320 (=> (not res!733003) (not e!626863))))

(declare-fun b!1098321 () Bool)

(declare-fun Unit!36122 () Unit!36120)

(assert (=> b!1098321 (= e!626861 Unit!36122)))

(declare-fun b!1098322 () Bool)

(assert (=> b!1098322 (= e!626860 call!45882)))

(declare-fun b!1098323 () Bool)

(declare-fun e!626862 () ListLongMap!15273)

(assert (=> b!1098323 (= e!626862 e!626865)))

(assert (=> b!1098323 (= c!108484 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098324 () Bool)

(declare-fun e!626866 () Bool)

(assert (=> b!1098324 (= e!626866 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098325 () Bool)

(declare-fun res!733009 () Bool)

(assert (=> b!1098325 (=> (not res!733009) (not e!626864))))

(assert (=> b!1098325 (= res!733009 e!626867)))

(declare-fun res!733011 () Bool)

(assert (=> b!1098325 (=> res!733011 e!626867)))

(assert (=> b!1098325 (= res!733011 (not e!626866))))

(declare-fun res!733007 () Bool)

(assert (=> b!1098325 (=> (not res!733007) (not e!626866))))

(assert (=> b!1098325 (= res!733007 (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(declare-fun b!1098326 () Bool)

(declare-fun res!733005 () Bool)

(assert (=> b!1098326 (=> (not res!733005) (not e!626864))))

(assert (=> b!1098326 (= res!733005 e!626869)))

(declare-fun c!108485 () Bool)

(assert (=> b!1098326 (= c!108485 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45877 () Bool)

(assert (=> bm!45877 (= call!45879 call!45881)))

(declare-fun b!1098327 () Bool)

(assert (=> b!1098327 (= e!626869 (not call!45883))))

(declare-fun b!1098328 () Bool)

(assert (=> b!1098328 (= e!626862 (+!3361 call!45878 (tuple2!17305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun d!130403 () Bool)

(assert (=> d!130403 e!626864))

(declare-fun res!733010 () Bool)

(assert (=> d!130403 (=> (not res!733010) (not e!626864))))

(assert (=> d!130403 (= res!733010 (or (bvsge #b00000000000000000000000000000000 (size!34796 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))))

(declare-fun lt!491252 () ListLongMap!15273)

(assert (=> d!130403 (= lt!491265 lt!491252)))

(declare-fun lt!491263 () Unit!36120)

(assert (=> d!130403 (= lt!491263 e!626861)))

(declare-fun c!108482 () Bool)

(assert (=> d!130403 (= c!108482 e!626872)))

(declare-fun res!733006 () Bool)

(assert (=> d!130403 (=> (not res!733006) (not e!626872))))

(assert (=> d!130403 (= res!733006 (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(assert (=> d!130403 (= lt!491252 e!626862)))

(assert (=> d!130403 (= c!108483 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130403 (validMask!0 mask!1414)))

(assert (=> d!130403 (= (getCurrentListMap!4372 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491265)))

(declare-fun b!1098329 () Bool)

(declare-fun e!626870 () Bool)

(assert (=> b!1098329 (= e!626868 e!626870)))

(declare-fun res!733008 () Bool)

(declare-fun call!45880 () Bool)

(assert (=> b!1098329 (= res!733008 call!45880)))

(assert (=> b!1098329 (=> (not res!733008) (not e!626870))))

(declare-fun bm!45878 () Bool)

(assert (=> bm!45878 (= call!45884 call!45878)))

(declare-fun b!1098330 () Bool)

(assert (=> b!1098330 (= e!626868 (not call!45880))))

(declare-fun bm!45879 () Bool)

(assert (=> bm!45879 (= call!45883 (contains!6383 lt!491265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45880 () Bool)

(assert (=> bm!45880 (= call!45880 (contains!6383 lt!491265 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098331 () Bool)

(assert (=> b!1098331 (= e!626870 (= (apply!945 lt!491265 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098332 () Bool)

(assert (=> b!1098332 (= e!626863 (= (apply!945 lt!491265 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!45881 () Bool)

(assert (=> bm!45881 (= call!45882 call!45879)))

(assert (= (and d!130403 c!108483) b!1098328))

(assert (= (and d!130403 (not c!108483)) b!1098323))

(assert (= (and b!1098323 c!108484) b!1098316))

(assert (= (and b!1098323 (not c!108484)) b!1098318))

(assert (= (and b!1098318 c!108480) b!1098319))

(assert (= (and b!1098318 (not c!108480)) b!1098322))

(assert (= (or b!1098319 b!1098322) bm!45881))

(assert (= (or b!1098316 bm!45881) bm!45877))

(assert (= (or b!1098316 b!1098319) bm!45878))

(assert (= (or b!1098328 bm!45877) bm!45876))

(assert (= (or b!1098328 bm!45878) bm!45875))

(assert (= (and d!130403 res!733006) b!1098317))

(assert (= (and d!130403 c!108482) b!1098315))

(assert (= (and d!130403 (not c!108482)) b!1098321))

(assert (= (and d!130403 res!733010) b!1098325))

(assert (= (and b!1098325 res!733007) b!1098324))

(assert (= (and b!1098325 (not res!733011)) b!1098313))

(assert (= (and b!1098313 res!733004) b!1098312))

(assert (= (and b!1098325 res!733009) b!1098326))

(assert (= (and b!1098326 c!108485) b!1098320))

(assert (= (and b!1098326 (not c!108485)) b!1098327))

(assert (= (and b!1098320 res!733003) b!1098332))

(assert (= (or b!1098320 b!1098327) bm!45879))

(assert (= (and b!1098326 res!733005) b!1098314))

(assert (= (and b!1098314 c!108481) b!1098329))

(assert (= (and b!1098314 (not c!108481)) b!1098330))

(assert (= (and b!1098329 res!733008) b!1098331))

(assert (= (or b!1098329 b!1098330) bm!45880))

(declare-fun b_lambda!17809 () Bool)

(assert (=> (not b_lambda!17809) (not b!1098312)))

(assert (=> b!1098312 t!34055))

(declare-fun b_and!36869 () Bool)

(assert (= b_and!36863 (and (=> t!34055 result!16429) b_and!36869)))

(assert (=> b!1098312 m!1017855))

(declare-fun m!1017957 () Bool)

(assert (=> b!1098312 m!1017957))

(assert (=> b!1098312 m!1017763))

(declare-fun m!1017959 () Bool)

(assert (=> b!1098312 m!1017959))

(assert (=> b!1098312 m!1017957))

(assert (=> b!1098312 m!1017763))

(assert (=> b!1098312 m!1017855))

(declare-fun m!1017961 () Bool)

(assert (=> b!1098312 m!1017961))

(assert (=> b!1098313 m!1017855))

(assert (=> b!1098313 m!1017855))

(declare-fun m!1017963 () Bool)

(assert (=> b!1098313 m!1017963))

(declare-fun m!1017965 () Bool)

(assert (=> bm!45875 m!1017965))

(assert (=> b!1098317 m!1017855))

(assert (=> b!1098317 m!1017855))

(assert (=> b!1098317 m!1017857))

(declare-fun m!1017967 () Bool)

(assert (=> b!1098332 m!1017967))

(assert (=> bm!45876 m!1017775))

(declare-fun m!1017969 () Bool)

(assert (=> bm!45879 m!1017969))

(assert (=> d!130403 m!1017795))

(assert (=> b!1098324 m!1017855))

(assert (=> b!1098324 m!1017855))

(assert (=> b!1098324 m!1017857))

(declare-fun m!1017971 () Bool)

(assert (=> b!1098328 m!1017971))

(declare-fun m!1017973 () Bool)

(assert (=> b!1098331 m!1017973))

(declare-fun m!1017975 () Bool)

(assert (=> b!1098315 m!1017975))

(declare-fun m!1017977 () Bool)

(assert (=> b!1098315 m!1017977))

(assert (=> b!1098315 m!1017775))

(declare-fun m!1017979 () Bool)

(assert (=> b!1098315 m!1017979))

(declare-fun m!1017981 () Bool)

(assert (=> b!1098315 m!1017981))

(declare-fun m!1017983 () Bool)

(assert (=> b!1098315 m!1017983))

(declare-fun m!1017985 () Bool)

(assert (=> b!1098315 m!1017985))

(declare-fun m!1017987 () Bool)

(assert (=> b!1098315 m!1017987))

(declare-fun m!1017989 () Bool)

(assert (=> b!1098315 m!1017989))

(assert (=> b!1098315 m!1017975))

(assert (=> b!1098315 m!1017855))

(declare-fun m!1017991 () Bool)

(assert (=> b!1098315 m!1017991))

(declare-fun m!1017993 () Bool)

(assert (=> b!1098315 m!1017993))

(assert (=> b!1098315 m!1017981))

(declare-fun m!1017995 () Bool)

(assert (=> b!1098315 m!1017995))

(declare-fun m!1017997 () Bool)

(assert (=> b!1098315 m!1017997))

(declare-fun m!1017999 () Bool)

(assert (=> b!1098315 m!1017999))

(declare-fun m!1018001 () Bool)

(assert (=> b!1098315 m!1018001))

(assert (=> b!1098315 m!1017997))

(declare-fun m!1018003 () Bool)

(assert (=> b!1098315 m!1018003))

(assert (=> b!1098315 m!1017985))

(declare-fun m!1018005 () Bool)

(assert (=> bm!45880 m!1018005))

(assert (=> b!1098157 d!130403))

(declare-fun e!626884 () Bool)

(declare-fun lt!491287 () ListLongMap!15273)

(declare-fun b!1098333 () Bool)

(assert (=> b!1098333 (= e!626884 (= (apply!945 lt!491287 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)) (get!17619 (select (arr!34261 lt!491130) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 lt!491130)))))

(assert (=> b!1098333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(declare-fun b!1098334 () Bool)

(declare-fun e!626880 () Bool)

(assert (=> b!1098334 (= e!626880 e!626884)))

(declare-fun res!733013 () Bool)

(assert (=> b!1098334 (=> (not res!733013) (not e!626884))))

(assert (=> b!1098334 (= res!733013 (contains!6383 lt!491287 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(assert (=> b!1098334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(declare-fun b!1098335 () Bool)

(declare-fun e!626877 () Bool)

(declare-fun e!626881 () Bool)

(assert (=> b!1098335 (= e!626877 e!626881)))

(declare-fun c!108487 () Bool)

(assert (=> b!1098335 (= c!108487 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!45886 () ListLongMap!15273)

(declare-fun call!45889 () ListLongMap!15273)

(declare-fun c!108489 () Bool)

(declare-fun c!108490 () Bool)

(declare-fun call!45888 () ListLongMap!15273)

(declare-fun call!45885 () ListLongMap!15273)

(declare-fun bm!45882 () Bool)

(assert (=> bm!45882 (= call!45885 (+!3361 (ite c!108489 call!45888 (ite c!108490 call!45886 call!45889)) (ite (or c!108489 c!108490) (tuple2!17305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098336 () Bool)

(declare-fun e!626874 () Unit!36120)

(declare-fun lt!491293 () Unit!36120)

(assert (=> b!1098336 (= e!626874 lt!491293)))

(declare-fun lt!491294 () ListLongMap!15273)

(assert (=> b!1098336 (= lt!491294 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491295 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491283 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491283 (select (arr!34260 lt!491120) #b00000000000000000000000000000000))))

(declare-fun lt!491286 () Unit!36120)

(assert (=> b!1098336 (= lt!491286 (addStillContains!658 lt!491294 lt!491295 zeroValue!831 lt!491283))))

(assert (=> b!1098336 (contains!6383 (+!3361 lt!491294 (tuple2!17305 lt!491295 zeroValue!831)) lt!491283)))

(declare-fun lt!491277 () Unit!36120)

(assert (=> b!1098336 (= lt!491277 lt!491286)))

(declare-fun lt!491292 () ListLongMap!15273)

(assert (=> b!1098336 (= lt!491292 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491284 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491284 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491282 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491282 (select (arr!34260 lt!491120) #b00000000000000000000000000000000))))

(declare-fun lt!491276 () Unit!36120)

(assert (=> b!1098336 (= lt!491276 (addApplyDifferent!518 lt!491292 lt!491284 minValue!831 lt!491282))))

(assert (=> b!1098336 (= (apply!945 (+!3361 lt!491292 (tuple2!17305 lt!491284 minValue!831)) lt!491282) (apply!945 lt!491292 lt!491282))))

(declare-fun lt!491280 () Unit!36120)

(assert (=> b!1098336 (= lt!491280 lt!491276)))

(declare-fun lt!491279 () ListLongMap!15273)

(assert (=> b!1098336 (= lt!491279 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491289 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491290 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491290 (select (arr!34260 lt!491120) #b00000000000000000000000000000000))))

(declare-fun lt!491275 () Unit!36120)

(assert (=> b!1098336 (= lt!491275 (addApplyDifferent!518 lt!491279 lt!491289 zeroValue!831 lt!491290))))

(assert (=> b!1098336 (= (apply!945 (+!3361 lt!491279 (tuple2!17305 lt!491289 zeroValue!831)) lt!491290) (apply!945 lt!491279 lt!491290))))

(declare-fun lt!491288 () Unit!36120)

(assert (=> b!1098336 (= lt!491288 lt!491275)))

(declare-fun lt!491278 () ListLongMap!15273)

(assert (=> b!1098336 (= lt!491278 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491281 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491291 () (_ BitVec 64))

(assert (=> b!1098336 (= lt!491291 (select (arr!34260 lt!491120) #b00000000000000000000000000000000))))

(assert (=> b!1098336 (= lt!491293 (addApplyDifferent!518 lt!491278 lt!491281 minValue!831 lt!491291))))

(assert (=> b!1098336 (= (apply!945 (+!3361 lt!491278 (tuple2!17305 lt!491281 minValue!831)) lt!491291) (apply!945 lt!491278 lt!491291))))

(declare-fun b!1098337 () Bool)

(declare-fun e!626878 () ListLongMap!15273)

(declare-fun call!45891 () ListLongMap!15273)

(assert (=> b!1098337 (= e!626878 call!45891)))

(declare-fun b!1098338 () Bool)

(declare-fun e!626885 () Bool)

(assert (=> b!1098338 (= e!626885 (validKeyInArray!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(declare-fun b!1098339 () Bool)

(declare-fun c!108486 () Bool)

(assert (=> b!1098339 (= c!108486 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626873 () ListLongMap!15273)

(assert (=> b!1098339 (= e!626878 e!626873)))

(declare-fun b!1098340 () Bool)

(assert (=> b!1098340 (= e!626873 call!45891)))

(declare-fun bm!45883 () Bool)

(assert (=> bm!45883 (= call!45888 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098341 () Bool)

(declare-fun e!626882 () Bool)

(declare-fun e!626876 () Bool)

(assert (=> b!1098341 (= e!626882 e!626876)))

(declare-fun res!733012 () Bool)

(declare-fun call!45890 () Bool)

(assert (=> b!1098341 (= res!733012 call!45890)))

(assert (=> b!1098341 (=> (not res!733012) (not e!626876))))

(declare-fun b!1098342 () Bool)

(declare-fun Unit!36123 () Unit!36120)

(assert (=> b!1098342 (= e!626874 Unit!36123)))

(declare-fun b!1098343 () Bool)

(assert (=> b!1098343 (= e!626873 call!45889)))

(declare-fun b!1098344 () Bool)

(declare-fun e!626875 () ListLongMap!15273)

(assert (=> b!1098344 (= e!626875 e!626878)))

(assert (=> b!1098344 (= c!108490 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098345 () Bool)

(declare-fun e!626879 () Bool)

(assert (=> b!1098345 (= e!626879 (validKeyInArray!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(declare-fun b!1098346 () Bool)

(declare-fun res!733018 () Bool)

(assert (=> b!1098346 (=> (not res!733018) (not e!626877))))

(assert (=> b!1098346 (= res!733018 e!626880)))

(declare-fun res!733020 () Bool)

(assert (=> b!1098346 (=> res!733020 e!626880)))

(assert (=> b!1098346 (= res!733020 (not e!626879))))

(declare-fun res!733016 () Bool)

(assert (=> b!1098346 (=> (not res!733016) (not e!626879))))

(assert (=> b!1098346 (= res!733016 (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(declare-fun b!1098347 () Bool)

(declare-fun res!733014 () Bool)

(assert (=> b!1098347 (=> (not res!733014) (not e!626877))))

(assert (=> b!1098347 (= res!733014 e!626882)))

(declare-fun c!108491 () Bool)

(assert (=> b!1098347 (= c!108491 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45884 () Bool)

(assert (=> bm!45884 (= call!45886 call!45888)))

(declare-fun b!1098348 () Bool)

(assert (=> b!1098348 (= e!626882 (not call!45890))))

(declare-fun b!1098349 () Bool)

(assert (=> b!1098349 (= e!626875 (+!3361 call!45885 (tuple2!17305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun d!130405 () Bool)

(assert (=> d!130405 e!626877))

(declare-fun res!733019 () Bool)

(assert (=> d!130405 (=> (not res!733019) (not e!626877))))

(assert (=> d!130405 (= res!733019 (or (bvsge #b00000000000000000000000000000000 (size!34796 lt!491120)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))))

(declare-fun lt!491274 () ListLongMap!15273)

(assert (=> d!130405 (= lt!491287 lt!491274)))

(declare-fun lt!491285 () Unit!36120)

(assert (=> d!130405 (= lt!491285 e!626874)))

(declare-fun c!108488 () Bool)

(assert (=> d!130405 (= c!108488 e!626885)))

(declare-fun res!733015 () Bool)

(assert (=> d!130405 (=> (not res!733015) (not e!626885))))

(assert (=> d!130405 (= res!733015 (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(assert (=> d!130405 (= lt!491274 e!626875)))

(assert (=> d!130405 (= c!108489 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130405 (validMask!0 mask!1414)))

(assert (=> d!130405 (= (getCurrentListMap!4372 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491287)))

(declare-fun b!1098350 () Bool)

(declare-fun e!626883 () Bool)

(assert (=> b!1098350 (= e!626881 e!626883)))

(declare-fun res!733017 () Bool)

(declare-fun call!45887 () Bool)

(assert (=> b!1098350 (= res!733017 call!45887)))

(assert (=> b!1098350 (=> (not res!733017) (not e!626883))))

(declare-fun bm!45885 () Bool)

(assert (=> bm!45885 (= call!45891 call!45885)))

(declare-fun b!1098351 () Bool)

(assert (=> b!1098351 (= e!626881 (not call!45887))))

(declare-fun bm!45886 () Bool)

(assert (=> bm!45886 (= call!45890 (contains!6383 lt!491287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45887 () Bool)

(assert (=> bm!45887 (= call!45887 (contains!6383 lt!491287 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098352 () Bool)

(assert (=> b!1098352 (= e!626883 (= (apply!945 lt!491287 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098353 () Bool)

(assert (=> b!1098353 (= e!626876 (= (apply!945 lt!491287 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!45888 () Bool)

(assert (=> bm!45888 (= call!45889 call!45886)))

(assert (= (and d!130405 c!108489) b!1098349))

(assert (= (and d!130405 (not c!108489)) b!1098344))

(assert (= (and b!1098344 c!108490) b!1098337))

(assert (= (and b!1098344 (not c!108490)) b!1098339))

(assert (= (and b!1098339 c!108486) b!1098340))

(assert (= (and b!1098339 (not c!108486)) b!1098343))

(assert (= (or b!1098340 b!1098343) bm!45888))

(assert (= (or b!1098337 bm!45888) bm!45884))

(assert (= (or b!1098337 b!1098340) bm!45885))

(assert (= (or b!1098349 bm!45884) bm!45883))

(assert (= (or b!1098349 bm!45885) bm!45882))

(assert (= (and d!130405 res!733015) b!1098338))

(assert (= (and d!130405 c!108488) b!1098336))

(assert (= (and d!130405 (not c!108488)) b!1098342))

(assert (= (and d!130405 res!733019) b!1098346))

(assert (= (and b!1098346 res!733016) b!1098345))

(assert (= (and b!1098346 (not res!733020)) b!1098334))

(assert (= (and b!1098334 res!733013) b!1098333))

(assert (= (and b!1098346 res!733018) b!1098347))

(assert (= (and b!1098347 c!108491) b!1098341))

(assert (= (and b!1098347 (not c!108491)) b!1098348))

(assert (= (and b!1098341 res!733012) b!1098353))

(assert (= (or b!1098341 b!1098348) bm!45886))

(assert (= (and b!1098347 res!733014) b!1098335))

(assert (= (and b!1098335 c!108487) b!1098350))

(assert (= (and b!1098335 (not c!108487)) b!1098351))

(assert (= (and b!1098350 res!733017) b!1098352))

(assert (= (or b!1098350 b!1098351) bm!45887))

(declare-fun b_lambda!17811 () Bool)

(assert (=> (not b_lambda!17811) (not b!1098333)))

(assert (=> b!1098333 t!34055))

(declare-fun b_and!36871 () Bool)

(assert (= b_and!36869 (and (=> t!34055 result!16429) b_and!36871)))

(assert (=> b!1098333 m!1017915))

(declare-fun m!1018007 () Bool)

(assert (=> b!1098333 m!1018007))

(assert (=> b!1098333 m!1017763))

(declare-fun m!1018009 () Bool)

(assert (=> b!1098333 m!1018009))

(assert (=> b!1098333 m!1018007))

(assert (=> b!1098333 m!1017763))

(assert (=> b!1098333 m!1017915))

(declare-fun m!1018011 () Bool)

(assert (=> b!1098333 m!1018011))

(assert (=> b!1098334 m!1017915))

(assert (=> b!1098334 m!1017915))

(declare-fun m!1018013 () Bool)

(assert (=> b!1098334 m!1018013))

(declare-fun m!1018015 () Bool)

(assert (=> bm!45882 m!1018015))

(assert (=> b!1098338 m!1017915))

(assert (=> b!1098338 m!1017915))

(assert (=> b!1098338 m!1017917))

(declare-fun m!1018017 () Bool)

(assert (=> b!1098353 m!1018017))

(assert (=> bm!45883 m!1017769))

(declare-fun m!1018019 () Bool)

(assert (=> bm!45886 m!1018019))

(assert (=> d!130405 m!1017795))

(assert (=> b!1098345 m!1017915))

(assert (=> b!1098345 m!1017915))

(assert (=> b!1098345 m!1017917))

(declare-fun m!1018021 () Bool)

(assert (=> b!1098349 m!1018021))

(declare-fun m!1018023 () Bool)

(assert (=> b!1098352 m!1018023))

(declare-fun m!1018025 () Bool)

(assert (=> b!1098336 m!1018025))

(declare-fun m!1018027 () Bool)

(assert (=> b!1098336 m!1018027))

(assert (=> b!1098336 m!1017769))

(declare-fun m!1018029 () Bool)

(assert (=> b!1098336 m!1018029))

(declare-fun m!1018031 () Bool)

(assert (=> b!1098336 m!1018031))

(declare-fun m!1018033 () Bool)

(assert (=> b!1098336 m!1018033))

(declare-fun m!1018035 () Bool)

(assert (=> b!1098336 m!1018035))

(declare-fun m!1018037 () Bool)

(assert (=> b!1098336 m!1018037))

(declare-fun m!1018039 () Bool)

(assert (=> b!1098336 m!1018039))

(assert (=> b!1098336 m!1018025))

(assert (=> b!1098336 m!1017915))

(declare-fun m!1018041 () Bool)

(assert (=> b!1098336 m!1018041))

(declare-fun m!1018043 () Bool)

(assert (=> b!1098336 m!1018043))

(assert (=> b!1098336 m!1018031))

(declare-fun m!1018045 () Bool)

(assert (=> b!1098336 m!1018045))

(declare-fun m!1018047 () Bool)

(assert (=> b!1098336 m!1018047))

(declare-fun m!1018049 () Bool)

(assert (=> b!1098336 m!1018049))

(declare-fun m!1018051 () Bool)

(assert (=> b!1098336 m!1018051))

(assert (=> b!1098336 m!1018047))

(declare-fun m!1018053 () Bool)

(assert (=> b!1098336 m!1018053))

(assert (=> b!1098336 m!1018035))

(declare-fun m!1018055 () Bool)

(assert (=> bm!45887 m!1018055))

(assert (=> b!1098157 d!130405))

(declare-fun e!626906 () Bool)

(declare-fun b!1098378 () Bool)

(declare-fun lt!491313 () ListLongMap!15273)

(assert (=> b!1098378 (= e!626906 (= lt!491313 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1098380 () Bool)

(assert (=> b!1098380 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(assert (=> b!1098380 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 lt!491130)))))

(declare-fun e!626902 () Bool)

(assert (=> b!1098380 (= e!626902 (= (apply!945 lt!491313 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)) (get!17619 (select (arr!34261 lt!491130) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098381 () Bool)

(declare-fun res!733030 () Bool)

(declare-fun e!626905 () Bool)

(assert (=> b!1098381 (=> (not res!733030) (not e!626905))))

(assert (=> b!1098381 (= res!733030 (not (contains!6383 lt!491313 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098382 () Bool)

(declare-fun e!626903 () ListLongMap!15273)

(assert (=> b!1098382 (= e!626903 (ListLongMap!15274 Nil!23922))))

(declare-fun b!1098383 () Bool)

(declare-fun e!626901 () Bool)

(assert (=> b!1098383 (= e!626901 e!626902)))

(assert (=> b!1098383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(declare-fun res!733029 () Bool)

(assert (=> b!1098383 (= res!733029 (contains!6383 lt!491313 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(assert (=> b!1098383 (=> (not res!733029) (not e!626902))))

(declare-fun b!1098384 () Bool)

(declare-fun lt!491314 () Unit!36120)

(declare-fun lt!491311 () Unit!36120)

(assert (=> b!1098384 (= lt!491314 lt!491311)))

(declare-fun lt!491312 () (_ BitVec 64))

(declare-fun lt!491310 () ListLongMap!15273)

(declare-fun lt!491315 () (_ BitVec 64))

(declare-fun lt!491316 () V!41307)

(assert (=> b!1098384 (not (contains!6383 (+!3361 lt!491310 (tuple2!17305 lt!491315 lt!491316)) lt!491312))))

(declare-fun addStillNotContains!273 (ListLongMap!15273 (_ BitVec 64) V!41307 (_ BitVec 64)) Unit!36120)

(assert (=> b!1098384 (= lt!491311 (addStillNotContains!273 lt!491310 lt!491315 lt!491316 lt!491312))))

(assert (=> b!1098384 (= lt!491312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098384 (= lt!491316 (get!17619 (select (arr!34261 lt!491130) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098384 (= lt!491315 (select (arr!34260 lt!491120) #b00000000000000000000000000000000))))

(declare-fun call!45894 () ListLongMap!15273)

(assert (=> b!1098384 (= lt!491310 call!45894)))

(declare-fun e!626904 () ListLongMap!15273)

(assert (=> b!1098384 (= e!626904 (+!3361 call!45894 (tuple2!17305 (select (arr!34260 lt!491120) #b00000000000000000000000000000000) (get!17619 (select (arr!34261 lt!491130) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098385 () Bool)

(declare-fun isEmpty!963 (ListLongMap!15273) Bool)

(assert (=> b!1098385 (= e!626906 (isEmpty!963 lt!491313))))

(declare-fun b!1098386 () Bool)

(declare-fun e!626900 () Bool)

(assert (=> b!1098386 (= e!626900 (validKeyInArray!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(assert (=> b!1098386 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130407 () Bool)

(assert (=> d!130407 e!626905))

(declare-fun res!733031 () Bool)

(assert (=> d!130407 (=> (not res!733031) (not e!626905))))

(assert (=> d!130407 (= res!733031 (not (contains!6383 lt!491313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130407 (= lt!491313 e!626903)))

(declare-fun c!108503 () Bool)

(assert (=> d!130407 (= c!108503 (bvsge #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(assert (=> d!130407 (validMask!0 mask!1414)))

(assert (=> d!130407 (= (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491313)))

(declare-fun b!1098379 () Bool)

(assert (=> b!1098379 (= e!626901 e!626906)))

(declare-fun c!108501 () Bool)

(assert (=> b!1098379 (= c!108501 (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(declare-fun b!1098387 () Bool)

(assert (=> b!1098387 (= e!626904 call!45894)))

(declare-fun b!1098388 () Bool)

(assert (=> b!1098388 (= e!626903 e!626904)))

(declare-fun c!108502 () Bool)

(assert (=> b!1098388 (= c!108502 (validKeyInArray!0 (select (arr!34260 lt!491120) #b00000000000000000000000000000000)))))

(declare-fun b!1098389 () Bool)

(assert (=> b!1098389 (= e!626905 e!626901)))

(declare-fun c!108500 () Bool)

(assert (=> b!1098389 (= c!108500 e!626900)))

(declare-fun res!733032 () Bool)

(assert (=> b!1098389 (=> (not res!733032) (not e!626900))))

(assert (=> b!1098389 (= res!733032 (bvslt #b00000000000000000000000000000000 (size!34796 lt!491120)))))

(declare-fun bm!45891 () Bool)

(assert (=> bm!45891 (= call!45894 (getCurrentListMapNoExtraKeys!4168 lt!491120 lt!491130 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(assert (= (and d!130407 c!108503) b!1098382))

(assert (= (and d!130407 (not c!108503)) b!1098388))

(assert (= (and b!1098388 c!108502) b!1098384))

(assert (= (and b!1098388 (not c!108502)) b!1098387))

(assert (= (or b!1098384 b!1098387) bm!45891))

(assert (= (and d!130407 res!733031) b!1098381))

(assert (= (and b!1098381 res!733030) b!1098389))

(assert (= (and b!1098389 res!733032) b!1098386))

(assert (= (and b!1098389 c!108500) b!1098383))

(assert (= (and b!1098389 (not c!108500)) b!1098379))

(assert (= (and b!1098383 res!733029) b!1098380))

(assert (= (and b!1098379 c!108501) b!1098378))

(assert (= (and b!1098379 (not c!108501)) b!1098385))

(declare-fun b_lambda!17813 () Bool)

(assert (=> (not b_lambda!17813) (not b!1098380)))

(assert (=> b!1098380 t!34055))

(declare-fun b_and!36873 () Bool)

(assert (= b_and!36871 (and (=> t!34055 result!16429) b_and!36873)))

(declare-fun b_lambda!17815 () Bool)

(assert (=> (not b_lambda!17815) (not b!1098384)))

(assert (=> b!1098384 t!34055))

(declare-fun b_and!36875 () Bool)

(assert (= b_and!36873 (and (=> t!34055 result!16429) b_and!36875)))

(declare-fun m!1018057 () Bool)

(assert (=> b!1098385 m!1018057))

(declare-fun m!1018059 () Bool)

(assert (=> b!1098384 m!1018059))

(declare-fun m!1018061 () Bool)

(assert (=> b!1098384 m!1018061))

(assert (=> b!1098384 m!1017763))

(assert (=> b!1098384 m!1017915))

(assert (=> b!1098384 m!1018007))

(assert (=> b!1098384 m!1018007))

(assert (=> b!1098384 m!1017763))

(assert (=> b!1098384 m!1018009))

(declare-fun m!1018063 () Bool)

(assert (=> b!1098384 m!1018063))

(assert (=> b!1098384 m!1018061))

(declare-fun m!1018065 () Bool)

(assert (=> b!1098384 m!1018065))

(declare-fun m!1018067 () Bool)

(assert (=> d!130407 m!1018067))

(assert (=> d!130407 m!1017795))

(declare-fun m!1018069 () Bool)

(assert (=> bm!45891 m!1018069))

(declare-fun m!1018071 () Bool)

(assert (=> b!1098381 m!1018071))

(assert (=> b!1098386 m!1017915))

(assert (=> b!1098386 m!1017915))

(assert (=> b!1098386 m!1017917))

(assert (=> b!1098380 m!1017915))

(declare-fun m!1018073 () Bool)

(assert (=> b!1098380 m!1018073))

(assert (=> b!1098380 m!1017763))

(assert (=> b!1098380 m!1017915))

(assert (=> b!1098380 m!1018007))

(assert (=> b!1098380 m!1018007))

(assert (=> b!1098380 m!1017763))

(assert (=> b!1098380 m!1018009))

(assert (=> b!1098378 m!1018069))

(assert (=> b!1098388 m!1017915))

(assert (=> b!1098388 m!1017915))

(assert (=> b!1098388 m!1017917))

(assert (=> b!1098383 m!1017915))

(assert (=> b!1098383 m!1017915))

(declare-fun m!1018075 () Bool)

(assert (=> b!1098383 m!1018075))

(assert (=> b!1098157 d!130407))

(declare-fun b!1098396 () Bool)

(declare-fun e!626911 () Bool)

(declare-fun call!45900 () ListLongMap!15273)

(declare-fun call!45899 () ListLongMap!15273)

(assert (=> b!1098396 (= e!626911 (= call!45900 call!45899))))

(assert (=> b!1098396 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34797 _values!874)))))

(declare-fun bm!45896 () Bool)

(assert (=> bm!45896 (= call!45900 (getCurrentListMapNoExtraKeys!4168 (array!71182 (store (arr!34260 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34796 _keys!1070)) (array!71184 (store (arr!34261 _values!874) i!650 (ValueCellFull!12858 (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34797 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130409 () Bool)

(declare-fun e!626912 () Bool)

(assert (=> d!130409 e!626912))

(declare-fun res!733035 () Bool)

(assert (=> d!130409 (=> (not res!733035) (not e!626912))))

(assert (=> d!130409 (= res!733035 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34796 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34796 _keys!1070))))))))

(declare-fun lt!491319 () Unit!36120)

(declare-fun choose!1763 (array!71181 array!71183 (_ BitVec 32) (_ BitVec 32) V!41307 V!41307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36120)

(assert (=> d!130409 (= lt!491319 (choose!1763 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(assert (=> d!130409 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!198 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!491319)))

(declare-fun bm!45897 () Bool)

(assert (=> bm!45897 (= call!45899 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098397 () Bool)

(assert (=> b!1098397 (= e!626911 (= call!45900 (-!942 call!45899 k0!904)))))

(assert (=> b!1098397 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34797 _values!874)))))

(declare-fun b!1098398 () Bool)

(assert (=> b!1098398 (= e!626912 e!626911)))

(declare-fun c!108506 () Bool)

(assert (=> b!1098398 (= c!108506 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!130409 res!733035) b!1098398))

(assert (= (and b!1098398 c!108506) b!1098397))

(assert (= (and b!1098398 (not c!108506)) b!1098396))

(assert (= (or b!1098397 b!1098396) bm!45897))

(assert (= (or b!1098397 b!1098396) bm!45896))

(declare-fun b_lambda!17817 () Bool)

(assert (=> (not b_lambda!17817) (not bm!45896)))

(assert (=> bm!45896 t!34055))

(declare-fun b_and!36877 () Bool)

(assert (= b_and!36875 (and (=> t!34055 result!16429) b_and!36877)))

(assert (=> bm!45896 m!1017757))

(assert (=> bm!45896 m!1017763))

(assert (=> bm!45896 m!1017767))

(declare-fun m!1018077 () Bool)

(assert (=> bm!45896 m!1018077))

(declare-fun m!1018079 () Bool)

(assert (=> d!130409 m!1018079))

(assert (=> bm!45897 m!1017775))

(declare-fun m!1018081 () Bool)

(assert (=> b!1098397 m!1018081))

(assert (=> b!1098157 d!130409))

(declare-fun d!130411 () Bool)

(declare-fun lt!491322 () ListLongMap!15273)

(assert (=> d!130411 (not (contains!6383 lt!491322 k0!904))))

(declare-fun removeStrictlySorted!79 (List!23925 (_ BitVec 64)) List!23925)

(assert (=> d!130411 (= lt!491322 (ListLongMap!15274 (removeStrictlySorted!79 (toList!7652 lt!491126) k0!904)))))

(assert (=> d!130411 (= (-!942 lt!491126 k0!904) lt!491322)))

(declare-fun bs!32267 () Bool)

(assert (= bs!32267 d!130411))

(declare-fun m!1018083 () Bool)

(assert (=> bs!32267 m!1018083))

(declare-fun m!1018085 () Bool)

(assert (=> bs!32267 m!1018085))

(assert (=> b!1098157 d!130411))

(declare-fun e!626919 () Bool)

(declare-fun lt!491326 () ListLongMap!15273)

(declare-fun b!1098399 () Bool)

(assert (=> b!1098399 (= e!626919 (= lt!491326 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1098401 () Bool)

(assert (=> b!1098401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(assert (=> b!1098401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 _values!874)))))

(declare-fun e!626915 () Bool)

(assert (=> b!1098401 (= e!626915 (= (apply!945 lt!491326 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)) (get!17619 (select (arr!34261 _values!874) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098402 () Bool)

(declare-fun res!733037 () Bool)

(declare-fun e!626918 () Bool)

(assert (=> b!1098402 (=> (not res!733037) (not e!626918))))

(assert (=> b!1098402 (= res!733037 (not (contains!6383 lt!491326 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098403 () Bool)

(declare-fun e!626916 () ListLongMap!15273)

(assert (=> b!1098403 (= e!626916 (ListLongMap!15274 Nil!23922))))

(declare-fun b!1098404 () Bool)

(declare-fun e!626914 () Bool)

(assert (=> b!1098404 (= e!626914 e!626915)))

(assert (=> b!1098404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(declare-fun res!733036 () Bool)

(assert (=> b!1098404 (= res!733036 (contains!6383 lt!491326 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098404 (=> (not res!733036) (not e!626915))))

(declare-fun b!1098405 () Bool)

(declare-fun lt!491327 () Unit!36120)

(declare-fun lt!491324 () Unit!36120)

(assert (=> b!1098405 (= lt!491327 lt!491324)))

(declare-fun lt!491329 () V!41307)

(declare-fun lt!491328 () (_ BitVec 64))

(declare-fun lt!491323 () ListLongMap!15273)

(declare-fun lt!491325 () (_ BitVec 64))

(assert (=> b!1098405 (not (contains!6383 (+!3361 lt!491323 (tuple2!17305 lt!491328 lt!491329)) lt!491325))))

(assert (=> b!1098405 (= lt!491324 (addStillNotContains!273 lt!491323 lt!491328 lt!491329 lt!491325))))

(assert (=> b!1098405 (= lt!491325 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098405 (= lt!491329 (get!17619 (select (arr!34261 _values!874) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098405 (= lt!491328 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!45901 () ListLongMap!15273)

(assert (=> b!1098405 (= lt!491323 call!45901)))

(declare-fun e!626917 () ListLongMap!15273)

(assert (=> b!1098405 (= e!626917 (+!3361 call!45901 (tuple2!17305 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) (get!17619 (select (arr!34261 _values!874) #b00000000000000000000000000000000) (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098406 () Bool)

(assert (=> b!1098406 (= e!626919 (isEmpty!963 lt!491326))))

(declare-fun b!1098407 () Bool)

(declare-fun e!626913 () Bool)

(assert (=> b!1098407 (= e!626913 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098407 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130413 () Bool)

(assert (=> d!130413 e!626918))

(declare-fun res!733038 () Bool)

(assert (=> d!130413 (=> (not res!733038) (not e!626918))))

(assert (=> d!130413 (= res!733038 (not (contains!6383 lt!491326 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130413 (= lt!491326 e!626916)))

(declare-fun c!108510 () Bool)

(assert (=> d!130413 (= c!108510 (bvsge #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(assert (=> d!130413 (validMask!0 mask!1414)))

(assert (=> d!130413 (= (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491326)))

(declare-fun b!1098400 () Bool)

(assert (=> b!1098400 (= e!626914 e!626919)))

(declare-fun c!108508 () Bool)

(assert (=> b!1098400 (= c!108508 (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(declare-fun b!1098408 () Bool)

(assert (=> b!1098408 (= e!626917 call!45901)))

(declare-fun b!1098409 () Bool)

(assert (=> b!1098409 (= e!626916 e!626917)))

(declare-fun c!108509 () Bool)

(assert (=> b!1098409 (= c!108509 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098410 () Bool)

(assert (=> b!1098410 (= e!626918 e!626914)))

(declare-fun c!108507 () Bool)

(assert (=> b!1098410 (= c!108507 e!626913)))

(declare-fun res!733039 () Bool)

(assert (=> b!1098410 (=> (not res!733039) (not e!626913))))

(assert (=> b!1098410 (= res!733039 (bvslt #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(declare-fun bm!45898 () Bool)

(assert (=> bm!45898 (= call!45901 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(assert (= (and d!130413 c!108510) b!1098403))

(assert (= (and d!130413 (not c!108510)) b!1098409))

(assert (= (and b!1098409 c!108509) b!1098405))

(assert (= (and b!1098409 (not c!108509)) b!1098408))

(assert (= (or b!1098405 b!1098408) bm!45898))

(assert (= (and d!130413 res!733038) b!1098402))

(assert (= (and b!1098402 res!733037) b!1098410))

(assert (= (and b!1098410 res!733039) b!1098407))

(assert (= (and b!1098410 c!108507) b!1098404))

(assert (= (and b!1098410 (not c!108507)) b!1098400))

(assert (= (and b!1098404 res!733036) b!1098401))

(assert (= (and b!1098400 c!108508) b!1098399))

(assert (= (and b!1098400 (not c!108508)) b!1098406))

(declare-fun b_lambda!17819 () Bool)

(assert (=> (not b_lambda!17819) (not b!1098401)))

(assert (=> b!1098401 t!34055))

(declare-fun b_and!36879 () Bool)

(assert (= b_and!36877 (and (=> t!34055 result!16429) b_and!36879)))

(declare-fun b_lambda!17821 () Bool)

(assert (=> (not b_lambda!17821) (not b!1098405)))

(assert (=> b!1098405 t!34055))

(declare-fun b_and!36881 () Bool)

(assert (= b_and!36879 (and (=> t!34055 result!16429) b_and!36881)))

(declare-fun m!1018087 () Bool)

(assert (=> b!1098406 m!1018087))

(declare-fun m!1018089 () Bool)

(assert (=> b!1098405 m!1018089))

(declare-fun m!1018091 () Bool)

(assert (=> b!1098405 m!1018091))

(assert (=> b!1098405 m!1017763))

(assert (=> b!1098405 m!1017855))

(assert (=> b!1098405 m!1017957))

(assert (=> b!1098405 m!1017957))

(assert (=> b!1098405 m!1017763))

(assert (=> b!1098405 m!1017959))

(declare-fun m!1018093 () Bool)

(assert (=> b!1098405 m!1018093))

(assert (=> b!1098405 m!1018091))

(declare-fun m!1018095 () Bool)

(assert (=> b!1098405 m!1018095))

(declare-fun m!1018097 () Bool)

(assert (=> d!130413 m!1018097))

(assert (=> d!130413 m!1017795))

(declare-fun m!1018099 () Bool)

(assert (=> bm!45898 m!1018099))

(declare-fun m!1018101 () Bool)

(assert (=> b!1098402 m!1018101))

(assert (=> b!1098407 m!1017855))

(assert (=> b!1098407 m!1017855))

(assert (=> b!1098407 m!1017857))

(assert (=> b!1098401 m!1017855))

(declare-fun m!1018103 () Bool)

(assert (=> b!1098401 m!1018103))

(assert (=> b!1098401 m!1017763))

(assert (=> b!1098401 m!1017855))

(assert (=> b!1098401 m!1017957))

(assert (=> b!1098401 m!1017957))

(assert (=> b!1098401 m!1017763))

(assert (=> b!1098401 m!1017959))

(assert (=> b!1098399 m!1018099))

(assert (=> b!1098409 m!1017855))

(assert (=> b!1098409 m!1017855))

(assert (=> b!1098409 m!1017857))

(assert (=> b!1098404 m!1017855))

(assert (=> b!1098404 m!1017855))

(declare-fun m!1018105 () Bool)

(assert (=> b!1098404 m!1018105))

(assert (=> b!1098157 d!130413))

(declare-fun d!130415 () Bool)

(assert (=> d!130415 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491332 () Unit!36120)

(declare-fun choose!13 (array!71181 (_ BitVec 64) (_ BitVec 32)) Unit!36120)

(assert (=> d!130415 (= lt!491332 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130415 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130415 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!491332)))

(declare-fun bs!32268 () Bool)

(assert (= bs!32268 d!130415))

(assert (=> bs!32268 m!1017771))

(declare-fun m!1018107 () Bool)

(assert (=> bs!32268 m!1018107))

(assert (=> b!1098157 d!130415))

(declare-fun b!1098411 () Bool)

(declare-fun e!626923 () Bool)

(declare-fun call!45902 () Bool)

(assert (=> b!1098411 (= e!626923 call!45902)))

(declare-fun bm!45899 () Bool)

(declare-fun c!108511 () Bool)

(assert (=> bm!45899 (= call!45902 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108511 (Cons!23922 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) Nil!23923) Nil!23923)))))

(declare-fun b!1098413 () Bool)

(declare-fun e!626921 () Bool)

(declare-fun e!626920 () Bool)

(assert (=> b!1098413 (= e!626921 e!626920)))

(declare-fun res!733040 () Bool)

(assert (=> b!1098413 (=> (not res!733040) (not e!626920))))

(declare-fun e!626922 () Bool)

(assert (=> b!1098413 (= res!733040 (not e!626922))))

(declare-fun res!733042 () Bool)

(assert (=> b!1098413 (=> (not res!733042) (not e!626922))))

(assert (=> b!1098413 (= res!733042 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098414 () Bool)

(assert (=> b!1098414 (= e!626923 call!45902)))

(declare-fun b!1098415 () Bool)

(assert (=> b!1098415 (= e!626922 (contains!6385 Nil!23923 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130417 () Bool)

(declare-fun res!733041 () Bool)

(assert (=> d!130417 (=> res!733041 e!626921)))

(assert (=> d!130417 (= res!733041 (bvsge #b00000000000000000000000000000000 (size!34796 _keys!1070)))))

(assert (=> d!130417 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23923) e!626921)))

(declare-fun b!1098412 () Bool)

(assert (=> b!1098412 (= e!626920 e!626923)))

(assert (=> b!1098412 (= c!108511 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130417 (not res!733041)) b!1098413))

(assert (= (and b!1098413 res!733042) b!1098415))

(assert (= (and b!1098413 res!733040) b!1098412))

(assert (= (and b!1098412 c!108511) b!1098414))

(assert (= (and b!1098412 (not c!108511)) b!1098411))

(assert (= (or b!1098414 b!1098411) bm!45899))

(assert (=> bm!45899 m!1017855))

(declare-fun m!1018109 () Bool)

(assert (=> bm!45899 m!1018109))

(assert (=> b!1098413 m!1017855))

(assert (=> b!1098413 m!1017855))

(assert (=> b!1098413 m!1017857))

(assert (=> b!1098415 m!1017855))

(assert (=> b!1098415 m!1017855))

(declare-fun m!1018111 () Bool)

(assert (=> b!1098415 m!1018111))

(assert (=> b!1098412 m!1017855))

(assert (=> b!1098412 m!1017855))

(assert (=> b!1098412 m!1017857))

(assert (=> b!1098165 d!130417))

(declare-fun b!1098422 () Bool)

(declare-fun e!626929 () Bool)

(assert (=> b!1098422 (= e!626929 tp_is_empty!27135)))

(declare-fun mapIsEmpty!42475 () Bool)

(declare-fun mapRes!42475 () Bool)

(assert (=> mapIsEmpty!42475 mapRes!42475))

(declare-fun mapNonEmpty!42475 () Bool)

(declare-fun tp!81197 () Bool)

(assert (=> mapNonEmpty!42475 (= mapRes!42475 (and tp!81197 e!626929))))

(declare-fun mapValue!42475 () ValueCell!12858)

(declare-fun mapKey!42475 () (_ BitVec 32))

(declare-fun mapRest!42475 () (Array (_ BitVec 32) ValueCell!12858))

(assert (=> mapNonEmpty!42475 (= mapRest!42469 (store mapRest!42475 mapKey!42475 mapValue!42475))))

(declare-fun b!1098423 () Bool)

(declare-fun e!626928 () Bool)

(assert (=> b!1098423 (= e!626928 tp_is_empty!27135)))

(declare-fun condMapEmpty!42475 () Bool)

(declare-fun mapDefault!42475 () ValueCell!12858)

(assert (=> mapNonEmpty!42469 (= condMapEmpty!42475 (= mapRest!42469 ((as const (Array (_ BitVec 32) ValueCell!12858)) mapDefault!42475)))))

(assert (=> mapNonEmpty!42469 (= tp!81187 (and e!626928 mapRes!42475))))

(assert (= (and mapNonEmpty!42469 condMapEmpty!42475) mapIsEmpty!42475))

(assert (= (and mapNonEmpty!42469 (not condMapEmpty!42475)) mapNonEmpty!42475))

(assert (= (and mapNonEmpty!42475 ((_ is ValueCellFull!12858) mapValue!42475)) b!1098422))

(assert (= (and mapNonEmpty!42469 ((_ is ValueCellFull!12858) mapDefault!42475)) b!1098423))

(declare-fun m!1018113 () Bool)

(assert (=> mapNonEmpty!42475 m!1018113))

(declare-fun b_lambda!17823 () Bool)

(assert (= b_lambda!17817 (or (and start!96558 b_free!23085) b_lambda!17823)))

(declare-fun b_lambda!17825 () Bool)

(assert (= b_lambda!17813 (or (and start!96558 b_free!23085) b_lambda!17825)))

(declare-fun b_lambda!17827 () Bool)

(assert (= b_lambda!17809 (or (and start!96558 b_free!23085) b_lambda!17827)))

(declare-fun b_lambda!17829 () Bool)

(assert (= b_lambda!17815 (or (and start!96558 b_free!23085) b_lambda!17829)))

(declare-fun b_lambda!17831 () Bool)

(assert (= b_lambda!17819 (or (and start!96558 b_free!23085) b_lambda!17831)))

(declare-fun b_lambda!17833 () Bool)

(assert (= b_lambda!17811 (or (and start!96558 b_free!23085) b_lambda!17833)))

(declare-fun b_lambda!17835 () Bool)

(assert (= b_lambda!17821 (or (and start!96558 b_free!23085) b_lambda!17835)))

(check-sat (not b!1098404) (not b_lambda!17835) (not bm!45899) (not b!1098260) (not b!1098313) (not b!1098269) (not b!1098399) (not b!1098328) (not d!130411) (not b!1098386) (not b!1098238) (not b!1098338) (not b!1098261) (not b!1098409) (not b!1098397) (not d!130391) (not b!1098378) (not d!130415) (not bm!45880) (not bm!45886) (not b_lambda!17823) (not b!1098225) (not b!1098239) (not bm!45896) (not b!1098241) (not b!1098236) (not b!1098407) (not bm!45860) (not b!1098353) (not b!1098256) (not bm!45897) (not b!1098385) (not b!1098324) (not b!1098381) (not b!1098234) (not b!1098331) (not b!1098262) (not b!1098345) (not b!1098235) (not b!1098312) (not b!1098388) (not b_lambda!17825) (not b!1098263) (not b!1098412) (not b!1098383) (not b!1098317) (not b!1098402) (not b_next!23085) (not b_lambda!17827) (not b!1098334) tp_is_empty!27135 (not b!1098333) (not d!130413) (not d!130377) (not d!130379) (not d!130405) (not b_lambda!17831) (not b!1098413) (not d!130409) (not b!1098244) (not bm!45857) (not b!1098406) (not bm!45891) (not bm!45876) (not bm!45883) (not b!1098352) (not b!1098259) (not b!1098349) (not b!1098240) (not b!1098401) (not b!1098315) b_and!36881 (not b!1098257) (not b!1098233) (not b!1098336) (not b!1098332) (not bm!45879) (not d!130403) (not bm!45887) (not b_lambda!17807) (not bm!45875) (not d!130389) (not b!1098405) (not b!1098380) (not mapNonEmpty!42475) (not b!1098237) (not b!1098228) (not b_lambda!17833) (not b_lambda!17829) (not d!130399) (not b!1098415) (not d!130397) (not bm!45898) (not bm!45882) (not b!1098384) (not d!130407) (not bm!45856))
(check-sat b_and!36881 (not b_next!23085))
