; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96754 () Bool)

(assert start!96754)

(declare-fun b_free!23071 () Bool)

(declare-fun b_next!23071 () Bool)

(assert (=> start!96754 (= b_free!23071 (not b_next!23071))))

(declare-fun tp!81142 () Bool)

(declare-fun b_and!36829 () Bool)

(assert (=> start!96754 (= tp!81142 b_and!36829)))

(declare-fun res!733101 () Bool)

(declare-fun e!627332 () Bool)

(assert (=> start!96754 (=> (not res!733101) (not e!627332))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96754 (= res!733101 (validMask!0 mask!1414))))

(assert (=> start!96754 e!627332))

(assert (=> start!96754 tp!81142))

(assert (=> start!96754 true))

(declare-fun tp_is_empty!27121 () Bool)

(assert (=> start!96754 tp_is_empty!27121))

(declare-datatypes ((array!71185 0))(
  ( (array!71186 (arr!34257 (Array (_ BitVec 32) (_ BitVec 64))) (size!34794 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71185)

(declare-fun array_inv!26418 (array!71185) Bool)

(assert (=> start!96754 (array_inv!26418 _keys!1070)))

(declare-datatypes ((V!41289 0))(
  ( (V!41290 (val!13617 Int)) )
))
(declare-datatypes ((ValueCell!12851 0))(
  ( (ValueCellFull!12851 (v!16235 V!41289)) (EmptyCell!12851) )
))
(declare-datatypes ((array!71187 0))(
  ( (array!71188 (arr!34258 (Array (_ BitVec 32) ValueCell!12851)) (size!34795 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71187)

(declare-fun e!627331 () Bool)

(declare-fun array_inv!26419 (array!71187) Bool)

(assert (=> start!96754 (and (array_inv!26419 _values!874) e!627331)))

(declare-fun b!1098971 () Bool)

(declare-fun res!733100 () Bool)

(assert (=> b!1098971 (=> (not res!733100) (not e!627332))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098971 (= res!733100 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34794 _keys!1070))))))

(declare-fun b!1098972 () Bool)

(declare-fun res!733103 () Bool)

(assert (=> b!1098972 (=> (not res!733103) (not e!627332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71185 (_ BitVec 32)) Bool)

(assert (=> b!1098972 (= res!733103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098973 () Bool)

(declare-fun res!733104 () Bool)

(assert (=> b!1098973 (=> (not res!733104) (not e!627332))))

(declare-datatypes ((List!23930 0))(
  ( (Nil!23927) (Cons!23926 (h!25144 (_ BitVec 64)) (t!34039 List!23930)) )
))
(declare-fun arrayNoDuplicates!0 (array!71185 (_ BitVec 32) List!23930) Bool)

(assert (=> b!1098973 (= res!733104 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23927))))

(declare-fun b!1098974 () Bool)

(declare-fun e!627330 () Bool)

(declare-fun e!627329 () Bool)

(assert (=> b!1098974 (= e!627330 (not e!627329))))

(declare-fun res!733107 () Bool)

(assert (=> b!1098974 (=> res!733107 e!627329)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098974 (= res!733107 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41289)

(declare-datatypes ((tuple2!17306 0))(
  ( (tuple2!17307 (_1!8664 (_ BitVec 64)) (_2!8664 V!41289)) )
))
(declare-datatypes ((List!23931 0))(
  ( (Nil!23928) (Cons!23927 (h!25145 tuple2!17306) (t!34040 List!23931)) )
))
(declare-datatypes ((ListLongMap!15283 0))(
  ( (ListLongMap!15284 (toList!7657 List!23931)) )
))
(declare-fun lt!491245 () ListLongMap!15283)

(declare-fun zeroValue!831 () V!41289)

(declare-fun getCurrentListMap!4368 (array!71185 array!71187 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) Int) ListLongMap!15283)

(assert (=> b!1098974 (= lt!491245 (getCurrentListMap!4368 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491252 () array!71185)

(declare-fun lt!491249 () ListLongMap!15283)

(declare-fun lt!491244 () array!71187)

(assert (=> b!1098974 (= lt!491249 (getCurrentListMap!4368 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491248 () ListLongMap!15283)

(declare-fun lt!491247 () ListLongMap!15283)

(assert (=> b!1098974 (and (= lt!491248 lt!491247) (= lt!491247 lt!491248))))

(declare-fun lt!491250 () ListLongMap!15283)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!930 (ListLongMap!15283 (_ BitVec 64)) ListLongMap!15283)

(assert (=> b!1098974 (= lt!491247 (-!930 lt!491250 k0!904))))

(declare-datatypes ((Unit!36101 0))(
  ( (Unit!36102) )
))
(declare-fun lt!491246 () Unit!36101)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!202 (array!71185 array!71187 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36101)

(assert (=> b!1098974 (= lt!491246 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!202 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4209 (array!71185 array!71187 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) Int) ListLongMap!15283)

(assert (=> b!1098974 (= lt!491248 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2327 (Int (_ BitVec 64)) V!41289)

(assert (=> b!1098974 (= lt!491244 (array!71188 (store (arr!34258 _values!874) i!650 (ValueCellFull!12851 (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34795 _values!874)))))

(assert (=> b!1098974 (= lt!491250 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098974 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491251 () Unit!36101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71185 (_ BitVec 64) (_ BitVec 32)) Unit!36101)

(assert (=> b!1098974 (= lt!491251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098975 () Bool)

(declare-fun res!733106 () Bool)

(assert (=> b!1098975 (=> (not res!733106) (not e!627332))))

(assert (=> b!1098975 (= res!733106 (and (= (size!34795 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34794 _keys!1070) (size!34795 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098976 () Bool)

(declare-fun e!627328 () Bool)

(declare-fun mapRes!42445 () Bool)

(assert (=> b!1098976 (= e!627331 (and e!627328 mapRes!42445))))

(declare-fun condMapEmpty!42445 () Bool)

(declare-fun mapDefault!42445 () ValueCell!12851)

(assert (=> b!1098976 (= condMapEmpty!42445 (= (arr!34258 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12851)) mapDefault!42445)))))

(declare-fun lt!491243 () tuple2!17306)

(declare-fun lt!491253 () tuple2!17306)

(declare-fun b!1098977 () Bool)

(declare-fun +!3392 (ListLongMap!15283 tuple2!17306) ListLongMap!15283)

(assert (=> b!1098977 (= e!627329 (= lt!491245 (+!3392 (+!3392 lt!491250 lt!491253) lt!491243)))))

(assert (=> b!1098977 (= lt!491249 (+!3392 (+!3392 lt!491248 lt!491253) lt!491243))))

(assert (=> b!1098977 (= lt!491243 (tuple2!17307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098977 (= lt!491253 (tuple2!17307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098978 () Bool)

(assert (=> b!1098978 (= e!627328 tp_is_empty!27121)))

(declare-fun mapIsEmpty!42445 () Bool)

(assert (=> mapIsEmpty!42445 mapRes!42445))

(declare-fun b!1098979 () Bool)

(declare-fun res!733098 () Bool)

(assert (=> b!1098979 (=> (not res!733098) (not e!627332))))

(assert (=> b!1098979 (= res!733098 (= (select (arr!34257 _keys!1070) i!650) k0!904))))

(declare-fun b!1098980 () Bool)

(declare-fun res!733105 () Bool)

(assert (=> b!1098980 (=> (not res!733105) (not e!627330))))

(assert (=> b!1098980 (= res!733105 (arrayNoDuplicates!0 lt!491252 #b00000000000000000000000000000000 Nil!23927))))

(declare-fun b!1098981 () Bool)

(assert (=> b!1098981 (= e!627332 e!627330)))

(declare-fun res!733099 () Bool)

(assert (=> b!1098981 (=> (not res!733099) (not e!627330))))

(assert (=> b!1098981 (= res!733099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491252 mask!1414))))

(assert (=> b!1098981 (= lt!491252 (array!71186 (store (arr!34257 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34794 _keys!1070)))))

(declare-fun b!1098982 () Bool)

(declare-fun res!733102 () Bool)

(assert (=> b!1098982 (=> (not res!733102) (not e!627332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098982 (= res!733102 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42445 () Bool)

(declare-fun tp!81143 () Bool)

(declare-fun e!627327 () Bool)

(assert (=> mapNonEmpty!42445 (= mapRes!42445 (and tp!81143 e!627327))))

(declare-fun mapValue!42445 () ValueCell!12851)

(declare-fun mapRest!42445 () (Array (_ BitVec 32) ValueCell!12851))

(declare-fun mapKey!42445 () (_ BitVec 32))

(assert (=> mapNonEmpty!42445 (= (arr!34258 _values!874) (store mapRest!42445 mapKey!42445 mapValue!42445))))

(declare-fun b!1098983 () Bool)

(assert (=> b!1098983 (= e!627327 tp_is_empty!27121)))

(assert (= (and start!96754 res!733101) b!1098975))

(assert (= (and b!1098975 res!733106) b!1098972))

(assert (= (and b!1098972 res!733103) b!1098973))

(assert (= (and b!1098973 res!733104) b!1098971))

(assert (= (and b!1098971 res!733100) b!1098982))

(assert (= (and b!1098982 res!733102) b!1098979))

(assert (= (and b!1098979 res!733098) b!1098981))

(assert (= (and b!1098981 res!733099) b!1098980))

(assert (= (and b!1098980 res!733105) b!1098974))

(assert (= (and b!1098974 (not res!733107)) b!1098977))

(assert (= (and b!1098976 condMapEmpty!42445) mapIsEmpty!42445))

(assert (= (and b!1098976 (not condMapEmpty!42445)) mapNonEmpty!42445))

(get-info :version)

(assert (= (and mapNonEmpty!42445 ((_ is ValueCellFull!12851) mapValue!42445)) b!1098983))

(assert (= (and b!1098976 ((_ is ValueCellFull!12851) mapDefault!42445)) b!1098978))

(assert (= start!96754 b!1098976))

(declare-fun b_lambda!17769 () Bool)

(assert (=> (not b_lambda!17769) (not b!1098974)))

(declare-fun t!34038 () Bool)

(declare-fun tb!7929 () Bool)

(assert (=> (and start!96754 (= defaultEntry!882 defaultEntry!882) t!34038) tb!7929))

(declare-fun result!16391 () Bool)

(assert (=> tb!7929 (= result!16391 tp_is_empty!27121)))

(assert (=> b!1098974 t!34038))

(declare-fun b_and!36831 () Bool)

(assert (= b_and!36829 (and (=> t!34038 result!16391) b_and!36831)))

(declare-fun m!1018817 () Bool)

(assert (=> b!1098979 m!1018817))

(declare-fun m!1018819 () Bool)

(assert (=> b!1098982 m!1018819))

(declare-fun m!1018821 () Bool)

(assert (=> mapNonEmpty!42445 m!1018821))

(declare-fun m!1018823 () Bool)

(assert (=> start!96754 m!1018823))

(declare-fun m!1018825 () Bool)

(assert (=> start!96754 m!1018825))

(declare-fun m!1018827 () Bool)

(assert (=> start!96754 m!1018827))

(declare-fun m!1018829 () Bool)

(assert (=> b!1098972 m!1018829))

(declare-fun m!1018831 () Bool)

(assert (=> b!1098973 m!1018831))

(declare-fun m!1018833 () Bool)

(assert (=> b!1098980 m!1018833))

(declare-fun m!1018835 () Bool)

(assert (=> b!1098974 m!1018835))

(declare-fun m!1018837 () Bool)

(assert (=> b!1098974 m!1018837))

(declare-fun m!1018839 () Bool)

(assert (=> b!1098974 m!1018839))

(declare-fun m!1018841 () Bool)

(assert (=> b!1098974 m!1018841))

(declare-fun m!1018843 () Bool)

(assert (=> b!1098974 m!1018843))

(declare-fun m!1018845 () Bool)

(assert (=> b!1098974 m!1018845))

(declare-fun m!1018847 () Bool)

(assert (=> b!1098974 m!1018847))

(declare-fun m!1018849 () Bool)

(assert (=> b!1098974 m!1018849))

(declare-fun m!1018851 () Bool)

(assert (=> b!1098974 m!1018851))

(declare-fun m!1018853 () Bool)

(assert (=> b!1098974 m!1018853))

(declare-fun m!1018855 () Bool)

(assert (=> b!1098981 m!1018855))

(declare-fun m!1018857 () Bool)

(assert (=> b!1098981 m!1018857))

(declare-fun m!1018859 () Bool)

(assert (=> b!1098977 m!1018859))

(assert (=> b!1098977 m!1018859))

(declare-fun m!1018861 () Bool)

(assert (=> b!1098977 m!1018861))

(declare-fun m!1018863 () Bool)

(assert (=> b!1098977 m!1018863))

(assert (=> b!1098977 m!1018863))

(declare-fun m!1018865 () Bool)

(assert (=> b!1098977 m!1018865))

(check-sat (not b_next!23071) (not start!96754) (not b!1098972) (not b!1098973) (not b!1098977) (not b!1098981) (not b_lambda!17769) (not b!1098980) (not b!1098974) (not mapNonEmpty!42445) tp_is_empty!27121 (not b!1098982) b_and!36831)
(check-sat b_and!36831 (not b_next!23071))
(get-model)

(declare-fun b_lambda!17775 () Bool)

(assert (= b_lambda!17769 (or (and start!96754 b_free!23071) b_lambda!17775)))

(check-sat (not b_next!23071) (not start!96754) (not b!1098973) (not b!1098977) (not b!1098981) (not b!1098980) (not b_lambda!17775) (not b!1098972) (not b!1098974) (not mapNonEmpty!42445) tp_is_empty!27121 (not b!1098982) b_and!36831)
(check-sat b_and!36831 (not b_next!23071))
(get-model)

(declare-fun d!130795 () Bool)

(declare-fun res!733172 () Bool)

(declare-fun e!627383 () Bool)

(assert (=> d!130795 (=> res!733172 e!627383)))

(assert (=> d!130795 (= res!733172 (bvsge #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(assert (=> d!130795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491252 mask!1414) e!627383)))

(declare-fun b!1099076 () Bool)

(declare-fun e!627382 () Bool)

(assert (=> b!1099076 (= e!627383 e!627382)))

(declare-fun c!108822 () Bool)

(assert (=> b!1099076 (= c!108822 (validKeyInArray!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(declare-fun b!1099077 () Bool)

(declare-fun e!627381 () Bool)

(declare-fun call!45880 () Bool)

(assert (=> b!1099077 (= e!627381 call!45880)))

(declare-fun b!1099078 () Bool)

(assert (=> b!1099078 (= e!627382 e!627381)))

(declare-fun lt!491328 () (_ BitVec 64))

(assert (=> b!1099078 (= lt!491328 (select (arr!34257 lt!491252) #b00000000000000000000000000000000))))

(declare-fun lt!491327 () Unit!36101)

(assert (=> b!1099078 (= lt!491327 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491252 lt!491328 #b00000000000000000000000000000000))))

(assert (=> b!1099078 (arrayContainsKey!0 lt!491252 lt!491328 #b00000000000000000000000000000000)))

(declare-fun lt!491326 () Unit!36101)

(assert (=> b!1099078 (= lt!491326 lt!491327)))

(declare-fun res!733173 () Bool)

(declare-datatypes ((SeekEntryResult!9863 0))(
  ( (MissingZero!9863 (index!41823 (_ BitVec 32))) (Found!9863 (index!41824 (_ BitVec 32))) (Intermediate!9863 (undefined!10675 Bool) (index!41825 (_ BitVec 32)) (x!98714 (_ BitVec 32))) (Undefined!9863) (MissingVacant!9863 (index!41826 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71185 (_ BitVec 32)) SeekEntryResult!9863)

(assert (=> b!1099078 (= res!733173 (= (seekEntryOrOpen!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000) lt!491252 mask!1414) (Found!9863 #b00000000000000000000000000000000)))))

(assert (=> b!1099078 (=> (not res!733173) (not e!627381))))

(declare-fun bm!45877 () Bool)

(assert (=> bm!45877 (= call!45880 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491252 mask!1414))))

(declare-fun b!1099079 () Bool)

(assert (=> b!1099079 (= e!627382 call!45880)))

(assert (= (and d!130795 (not res!733172)) b!1099076))

(assert (= (and b!1099076 c!108822) b!1099078))

(assert (= (and b!1099076 (not c!108822)) b!1099079))

(assert (= (and b!1099078 res!733173) b!1099077))

(assert (= (or b!1099077 b!1099079) bm!45877))

(declare-fun m!1018967 () Bool)

(assert (=> b!1099076 m!1018967))

(assert (=> b!1099076 m!1018967))

(declare-fun m!1018969 () Bool)

(assert (=> b!1099076 m!1018969))

(assert (=> b!1099078 m!1018967))

(declare-fun m!1018971 () Bool)

(assert (=> b!1099078 m!1018971))

(declare-fun m!1018973 () Bool)

(assert (=> b!1099078 m!1018973))

(assert (=> b!1099078 m!1018967))

(declare-fun m!1018975 () Bool)

(assert (=> b!1099078 m!1018975))

(declare-fun m!1018977 () Bool)

(assert (=> bm!45877 m!1018977))

(assert (=> b!1098981 d!130795))

(declare-fun d!130797 () Bool)

(declare-fun e!627386 () Bool)

(assert (=> d!130797 e!627386))

(declare-fun res!733178 () Bool)

(assert (=> d!130797 (=> (not res!733178) (not e!627386))))

(declare-fun lt!491337 () ListLongMap!15283)

(declare-fun contains!6404 (ListLongMap!15283 (_ BitVec 64)) Bool)

(assert (=> d!130797 (= res!733178 (contains!6404 lt!491337 (_1!8664 lt!491243)))))

(declare-fun lt!491340 () List!23931)

(assert (=> d!130797 (= lt!491337 (ListLongMap!15284 lt!491340))))

(declare-fun lt!491339 () Unit!36101)

(declare-fun lt!491338 () Unit!36101)

(assert (=> d!130797 (= lt!491339 lt!491338)))

(declare-datatypes ((Option!666 0))(
  ( (Some!665 (v!16238 V!41289)) (None!664) )
))
(declare-fun getValueByKey!615 (List!23931 (_ BitVec 64)) Option!666)

(assert (=> d!130797 (= (getValueByKey!615 lt!491340 (_1!8664 lt!491243)) (Some!665 (_2!8664 lt!491243)))))

(declare-fun lemmaContainsTupThenGetReturnValue!297 (List!23931 (_ BitVec 64) V!41289) Unit!36101)

(assert (=> d!130797 (= lt!491338 (lemmaContainsTupThenGetReturnValue!297 lt!491340 (_1!8664 lt!491243) (_2!8664 lt!491243)))))

(declare-fun insertStrictlySorted!390 (List!23931 (_ BitVec 64) V!41289) List!23931)

(assert (=> d!130797 (= lt!491340 (insertStrictlySorted!390 (toList!7657 (+!3392 lt!491250 lt!491253)) (_1!8664 lt!491243) (_2!8664 lt!491243)))))

(assert (=> d!130797 (= (+!3392 (+!3392 lt!491250 lt!491253) lt!491243) lt!491337)))

(declare-fun b!1099084 () Bool)

(declare-fun res!733179 () Bool)

(assert (=> b!1099084 (=> (not res!733179) (not e!627386))))

(assert (=> b!1099084 (= res!733179 (= (getValueByKey!615 (toList!7657 lt!491337) (_1!8664 lt!491243)) (Some!665 (_2!8664 lt!491243))))))

(declare-fun b!1099085 () Bool)

(declare-fun contains!6405 (List!23931 tuple2!17306) Bool)

(assert (=> b!1099085 (= e!627386 (contains!6405 (toList!7657 lt!491337) lt!491243))))

(assert (= (and d!130797 res!733178) b!1099084))

(assert (= (and b!1099084 res!733179) b!1099085))

(declare-fun m!1018979 () Bool)

(assert (=> d!130797 m!1018979))

(declare-fun m!1018981 () Bool)

(assert (=> d!130797 m!1018981))

(declare-fun m!1018983 () Bool)

(assert (=> d!130797 m!1018983))

(declare-fun m!1018985 () Bool)

(assert (=> d!130797 m!1018985))

(declare-fun m!1018987 () Bool)

(assert (=> b!1099084 m!1018987))

(declare-fun m!1018989 () Bool)

(assert (=> b!1099085 m!1018989))

(assert (=> b!1098977 d!130797))

(declare-fun d!130799 () Bool)

(declare-fun e!627387 () Bool)

(assert (=> d!130799 e!627387))

(declare-fun res!733180 () Bool)

(assert (=> d!130799 (=> (not res!733180) (not e!627387))))

(declare-fun lt!491341 () ListLongMap!15283)

(assert (=> d!130799 (= res!733180 (contains!6404 lt!491341 (_1!8664 lt!491253)))))

(declare-fun lt!491344 () List!23931)

(assert (=> d!130799 (= lt!491341 (ListLongMap!15284 lt!491344))))

(declare-fun lt!491343 () Unit!36101)

(declare-fun lt!491342 () Unit!36101)

(assert (=> d!130799 (= lt!491343 lt!491342)))

(assert (=> d!130799 (= (getValueByKey!615 lt!491344 (_1!8664 lt!491253)) (Some!665 (_2!8664 lt!491253)))))

(assert (=> d!130799 (= lt!491342 (lemmaContainsTupThenGetReturnValue!297 lt!491344 (_1!8664 lt!491253) (_2!8664 lt!491253)))))

(assert (=> d!130799 (= lt!491344 (insertStrictlySorted!390 (toList!7657 lt!491250) (_1!8664 lt!491253) (_2!8664 lt!491253)))))

(assert (=> d!130799 (= (+!3392 lt!491250 lt!491253) lt!491341)))

(declare-fun b!1099086 () Bool)

(declare-fun res!733181 () Bool)

(assert (=> b!1099086 (=> (not res!733181) (not e!627387))))

(assert (=> b!1099086 (= res!733181 (= (getValueByKey!615 (toList!7657 lt!491341) (_1!8664 lt!491253)) (Some!665 (_2!8664 lt!491253))))))

(declare-fun b!1099087 () Bool)

(assert (=> b!1099087 (= e!627387 (contains!6405 (toList!7657 lt!491341) lt!491253))))

(assert (= (and d!130799 res!733180) b!1099086))

(assert (= (and b!1099086 res!733181) b!1099087))

(declare-fun m!1018991 () Bool)

(assert (=> d!130799 m!1018991))

(declare-fun m!1018993 () Bool)

(assert (=> d!130799 m!1018993))

(declare-fun m!1018995 () Bool)

(assert (=> d!130799 m!1018995))

(declare-fun m!1018997 () Bool)

(assert (=> d!130799 m!1018997))

(declare-fun m!1018999 () Bool)

(assert (=> b!1099086 m!1018999))

(declare-fun m!1019001 () Bool)

(assert (=> b!1099087 m!1019001))

(assert (=> b!1098977 d!130799))

(declare-fun d!130801 () Bool)

(declare-fun e!627388 () Bool)

(assert (=> d!130801 e!627388))

(declare-fun res!733182 () Bool)

(assert (=> d!130801 (=> (not res!733182) (not e!627388))))

(declare-fun lt!491345 () ListLongMap!15283)

(assert (=> d!130801 (= res!733182 (contains!6404 lt!491345 (_1!8664 lt!491243)))))

(declare-fun lt!491348 () List!23931)

(assert (=> d!130801 (= lt!491345 (ListLongMap!15284 lt!491348))))

(declare-fun lt!491347 () Unit!36101)

(declare-fun lt!491346 () Unit!36101)

(assert (=> d!130801 (= lt!491347 lt!491346)))

(assert (=> d!130801 (= (getValueByKey!615 lt!491348 (_1!8664 lt!491243)) (Some!665 (_2!8664 lt!491243)))))

(assert (=> d!130801 (= lt!491346 (lemmaContainsTupThenGetReturnValue!297 lt!491348 (_1!8664 lt!491243) (_2!8664 lt!491243)))))

(assert (=> d!130801 (= lt!491348 (insertStrictlySorted!390 (toList!7657 (+!3392 lt!491248 lt!491253)) (_1!8664 lt!491243) (_2!8664 lt!491243)))))

(assert (=> d!130801 (= (+!3392 (+!3392 lt!491248 lt!491253) lt!491243) lt!491345)))

(declare-fun b!1099088 () Bool)

(declare-fun res!733183 () Bool)

(assert (=> b!1099088 (=> (not res!733183) (not e!627388))))

(assert (=> b!1099088 (= res!733183 (= (getValueByKey!615 (toList!7657 lt!491345) (_1!8664 lt!491243)) (Some!665 (_2!8664 lt!491243))))))

(declare-fun b!1099089 () Bool)

(assert (=> b!1099089 (= e!627388 (contains!6405 (toList!7657 lt!491345) lt!491243))))

(assert (= (and d!130801 res!733182) b!1099088))

(assert (= (and b!1099088 res!733183) b!1099089))

(declare-fun m!1019003 () Bool)

(assert (=> d!130801 m!1019003))

(declare-fun m!1019005 () Bool)

(assert (=> d!130801 m!1019005))

(declare-fun m!1019007 () Bool)

(assert (=> d!130801 m!1019007))

(declare-fun m!1019009 () Bool)

(assert (=> d!130801 m!1019009))

(declare-fun m!1019011 () Bool)

(assert (=> b!1099088 m!1019011))

(declare-fun m!1019013 () Bool)

(assert (=> b!1099089 m!1019013))

(assert (=> b!1098977 d!130801))

(declare-fun d!130803 () Bool)

(declare-fun e!627389 () Bool)

(assert (=> d!130803 e!627389))

(declare-fun res!733184 () Bool)

(assert (=> d!130803 (=> (not res!733184) (not e!627389))))

(declare-fun lt!491349 () ListLongMap!15283)

(assert (=> d!130803 (= res!733184 (contains!6404 lt!491349 (_1!8664 lt!491253)))))

(declare-fun lt!491352 () List!23931)

(assert (=> d!130803 (= lt!491349 (ListLongMap!15284 lt!491352))))

(declare-fun lt!491351 () Unit!36101)

(declare-fun lt!491350 () Unit!36101)

(assert (=> d!130803 (= lt!491351 lt!491350)))

(assert (=> d!130803 (= (getValueByKey!615 lt!491352 (_1!8664 lt!491253)) (Some!665 (_2!8664 lt!491253)))))

(assert (=> d!130803 (= lt!491350 (lemmaContainsTupThenGetReturnValue!297 lt!491352 (_1!8664 lt!491253) (_2!8664 lt!491253)))))

(assert (=> d!130803 (= lt!491352 (insertStrictlySorted!390 (toList!7657 lt!491248) (_1!8664 lt!491253) (_2!8664 lt!491253)))))

(assert (=> d!130803 (= (+!3392 lt!491248 lt!491253) lt!491349)))

(declare-fun b!1099090 () Bool)

(declare-fun res!733185 () Bool)

(assert (=> b!1099090 (=> (not res!733185) (not e!627389))))

(assert (=> b!1099090 (= res!733185 (= (getValueByKey!615 (toList!7657 lt!491349) (_1!8664 lt!491253)) (Some!665 (_2!8664 lt!491253))))))

(declare-fun b!1099091 () Bool)

(assert (=> b!1099091 (= e!627389 (contains!6405 (toList!7657 lt!491349) lt!491253))))

(assert (= (and d!130803 res!733184) b!1099090))

(assert (= (and b!1099090 res!733185) b!1099091))

(declare-fun m!1019015 () Bool)

(assert (=> d!130803 m!1019015))

(declare-fun m!1019017 () Bool)

(assert (=> d!130803 m!1019017))

(declare-fun m!1019019 () Bool)

(assert (=> d!130803 m!1019019))

(declare-fun m!1019021 () Bool)

(assert (=> d!130803 m!1019021))

(declare-fun m!1019023 () Bool)

(assert (=> b!1099090 m!1019023))

(declare-fun m!1019025 () Bool)

(assert (=> b!1099091 m!1019025))

(assert (=> b!1098977 d!130803))

(declare-fun b!1099102 () Bool)

(declare-fun e!627400 () Bool)

(declare-fun call!45883 () Bool)

(assert (=> b!1099102 (= e!627400 call!45883)))

(declare-fun bm!45880 () Bool)

(declare-fun c!108825 () Bool)

(assert (=> bm!45880 (= call!45883 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108825 (Cons!23926 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000) Nil!23927) Nil!23927)))))

(declare-fun b!1099103 () Bool)

(assert (=> b!1099103 (= e!627400 call!45883)))

(declare-fun b!1099104 () Bool)

(declare-fun e!627401 () Bool)

(declare-fun contains!6406 (List!23930 (_ BitVec 64)) Bool)

(assert (=> b!1099104 (= e!627401 (contains!6406 Nil!23927 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099105 () Bool)

(declare-fun e!627399 () Bool)

(declare-fun e!627398 () Bool)

(assert (=> b!1099105 (= e!627399 e!627398)))

(declare-fun res!733192 () Bool)

(assert (=> b!1099105 (=> (not res!733192) (not e!627398))))

(assert (=> b!1099105 (= res!733192 (not e!627401))))

(declare-fun res!733194 () Bool)

(assert (=> b!1099105 (=> (not res!733194) (not e!627401))))

(assert (=> b!1099105 (= res!733194 (validKeyInArray!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130805 () Bool)

(declare-fun res!733193 () Bool)

(assert (=> d!130805 (=> res!733193 e!627399)))

(assert (=> d!130805 (= res!733193 (bvsge #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(assert (=> d!130805 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23927) e!627399)))

(declare-fun b!1099106 () Bool)

(assert (=> b!1099106 (= e!627398 e!627400)))

(assert (=> b!1099106 (= c!108825 (validKeyInArray!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130805 (not res!733193)) b!1099105))

(assert (= (and b!1099105 res!733194) b!1099104))

(assert (= (and b!1099105 res!733192) b!1099106))

(assert (= (and b!1099106 c!108825) b!1099103))

(assert (= (and b!1099106 (not c!108825)) b!1099102))

(assert (= (or b!1099103 b!1099102) bm!45880))

(declare-fun m!1019027 () Bool)

(assert (=> bm!45880 m!1019027))

(declare-fun m!1019029 () Bool)

(assert (=> bm!45880 m!1019029))

(assert (=> b!1099104 m!1019027))

(assert (=> b!1099104 m!1019027))

(declare-fun m!1019031 () Bool)

(assert (=> b!1099104 m!1019031))

(assert (=> b!1099105 m!1019027))

(assert (=> b!1099105 m!1019027))

(declare-fun m!1019033 () Bool)

(assert (=> b!1099105 m!1019033))

(assert (=> b!1099106 m!1019027))

(assert (=> b!1099106 m!1019027))

(assert (=> b!1099106 m!1019033))

(assert (=> b!1098973 d!130805))

(declare-fun d!130807 () Bool)

(declare-fun res!733195 () Bool)

(declare-fun e!627404 () Bool)

(assert (=> d!130807 (=> res!733195 e!627404)))

(assert (=> d!130807 (= res!733195 (bvsge #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(assert (=> d!130807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627404)))

(declare-fun b!1099107 () Bool)

(declare-fun e!627403 () Bool)

(assert (=> b!1099107 (= e!627404 e!627403)))

(declare-fun c!108826 () Bool)

(assert (=> b!1099107 (= c!108826 (validKeyInArray!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099108 () Bool)

(declare-fun e!627402 () Bool)

(declare-fun call!45884 () Bool)

(assert (=> b!1099108 (= e!627402 call!45884)))

(declare-fun b!1099109 () Bool)

(assert (=> b!1099109 (= e!627403 e!627402)))

(declare-fun lt!491355 () (_ BitVec 64))

(assert (=> b!1099109 (= lt!491355 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491354 () Unit!36101)

(assert (=> b!1099109 (= lt!491354 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!491355 #b00000000000000000000000000000000))))

(assert (=> b!1099109 (arrayContainsKey!0 _keys!1070 lt!491355 #b00000000000000000000000000000000)))

(declare-fun lt!491353 () Unit!36101)

(assert (=> b!1099109 (= lt!491353 lt!491354)))

(declare-fun res!733196 () Bool)

(assert (=> b!1099109 (= res!733196 (= (seekEntryOrOpen!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9863 #b00000000000000000000000000000000)))))

(assert (=> b!1099109 (=> (not res!733196) (not e!627402))))

(declare-fun bm!45881 () Bool)

(assert (=> bm!45881 (= call!45884 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1099110 () Bool)

(assert (=> b!1099110 (= e!627403 call!45884)))

(assert (= (and d!130807 (not res!733195)) b!1099107))

(assert (= (and b!1099107 c!108826) b!1099109))

(assert (= (and b!1099107 (not c!108826)) b!1099110))

(assert (= (and b!1099109 res!733196) b!1099108))

(assert (= (or b!1099108 b!1099110) bm!45881))

(assert (=> b!1099107 m!1019027))

(assert (=> b!1099107 m!1019027))

(assert (=> b!1099107 m!1019033))

(assert (=> b!1099109 m!1019027))

(declare-fun m!1019035 () Bool)

(assert (=> b!1099109 m!1019035))

(declare-fun m!1019037 () Bool)

(assert (=> b!1099109 m!1019037))

(assert (=> b!1099109 m!1019027))

(declare-fun m!1019039 () Bool)

(assert (=> b!1099109 m!1019039))

(declare-fun m!1019041 () Bool)

(assert (=> bm!45881 m!1019041))

(assert (=> b!1098972 d!130807))

(declare-fun d!130809 () Bool)

(assert (=> d!130809 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098982 d!130809))

(declare-fun d!130811 () Bool)

(assert (=> d!130811 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96754 d!130811))

(declare-fun d!130813 () Bool)

(assert (=> d!130813 (= (array_inv!26418 _keys!1070) (bvsge (size!34794 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96754 d!130813))

(declare-fun d!130815 () Bool)

(assert (=> d!130815 (= (array_inv!26419 _values!874) (bvsge (size!34795 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96754 d!130815))

(declare-fun d!130817 () Bool)

(declare-fun res!733201 () Bool)

(declare-fun e!627409 () Bool)

(assert (=> d!130817 (=> res!733201 e!627409)))

(assert (=> d!130817 (= res!733201 (= (select (arr!34257 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130817 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627409)))

(declare-fun b!1099115 () Bool)

(declare-fun e!627410 () Bool)

(assert (=> b!1099115 (= e!627409 e!627410)))

(declare-fun res!733202 () Bool)

(assert (=> b!1099115 (=> (not res!733202) (not e!627410))))

(assert (=> b!1099115 (= res!733202 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34794 _keys!1070)))))

(declare-fun b!1099116 () Bool)

(assert (=> b!1099116 (= e!627410 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130817 (not res!733201)) b!1099115))

(assert (= (and b!1099115 res!733202) b!1099116))

(assert (=> d!130817 m!1019027))

(declare-fun m!1019043 () Bool)

(assert (=> b!1099116 m!1019043))

(assert (=> b!1098974 d!130817))

(declare-fun bm!45896 () Bool)

(declare-fun call!45903 () ListLongMap!15283)

(declare-fun call!45900 () ListLongMap!15283)

(assert (=> bm!45896 (= call!45903 call!45900)))

(declare-fun bm!45897 () Bool)

(declare-fun c!108843 () Bool)

(declare-fun call!45902 () ListLongMap!15283)

(declare-fun call!45899 () ListLongMap!15283)

(declare-fun c!108844 () Bool)

(declare-fun call!45904 () ListLongMap!15283)

(assert (=> bm!45897 (= call!45900 (+!3392 (ite c!108844 call!45899 (ite c!108843 call!45902 call!45904)) (ite (or c!108844 c!108843) (tuple2!17307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099159 () Bool)

(declare-fun e!627442 () Bool)

(declare-fun lt!491402 () ListLongMap!15283)

(declare-fun apply!953 (ListLongMap!15283 (_ BitVec 64)) V!41289)

(assert (=> b!1099159 (= e!627442 (= (apply!953 lt!491402 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099160 () Bool)

(declare-fun e!627440 () Bool)

(declare-fun e!627438 () Bool)

(assert (=> b!1099160 (= e!627440 e!627438)))

(declare-fun res!733228 () Bool)

(declare-fun call!45901 () Bool)

(assert (=> b!1099160 (= res!733228 call!45901)))

(assert (=> b!1099160 (=> (not res!733228) (not e!627438))))

(declare-fun bm!45898 () Bool)

(assert (=> bm!45898 (= call!45902 call!45899)))

(declare-fun b!1099161 () Bool)

(assert (=> b!1099161 (= e!627438 (= (apply!953 lt!491402 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099162 () Bool)

(declare-fun e!627441 () Bool)

(assert (=> b!1099162 (= e!627441 e!627442)))

(declare-fun res!733227 () Bool)

(declare-fun call!45905 () Bool)

(assert (=> b!1099162 (= res!733227 call!45905)))

(assert (=> b!1099162 (=> (not res!733227) (not e!627442))))

(declare-fun b!1099163 () Bool)

(declare-fun e!627437 () Bool)

(assert (=> b!1099163 (= e!627437 (validKeyInArray!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099164 () Bool)

(declare-fun e!627447 () Bool)

(declare-fun get!17643 (ValueCell!12851 V!41289) V!41289)

(assert (=> b!1099164 (= e!627447 (= (apply!953 lt!491402 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)) (get!17643 (select (arr!34258 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34795 _values!874)))))

(assert (=> b!1099164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(declare-fun bm!45899 () Bool)

(assert (=> bm!45899 (= call!45901 (contains!6404 lt!491402 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099165 () Bool)

(declare-fun e!627446 () Bool)

(assert (=> b!1099165 (= e!627446 (validKeyInArray!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45900 () Bool)

(assert (=> bm!45900 (= call!45904 call!45902)))

(declare-fun d!130819 () Bool)

(declare-fun e!627449 () Bool)

(assert (=> d!130819 e!627449))

(declare-fun res!733226 () Bool)

(assert (=> d!130819 (=> (not res!733226) (not e!627449))))

(assert (=> d!130819 (= res!733226 (or (bvsge #b00000000000000000000000000000000 (size!34794 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))))

(declare-fun lt!491404 () ListLongMap!15283)

(assert (=> d!130819 (= lt!491402 lt!491404)))

(declare-fun lt!491412 () Unit!36101)

(declare-fun e!627445 () Unit!36101)

(assert (=> d!130819 (= lt!491412 e!627445)))

(declare-fun c!108839 () Bool)

(assert (=> d!130819 (= c!108839 e!627437)))

(declare-fun res!733222 () Bool)

(assert (=> d!130819 (=> (not res!733222) (not e!627437))))

(assert (=> d!130819 (= res!733222 (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(declare-fun e!627444 () ListLongMap!15283)

(assert (=> d!130819 (= lt!491404 e!627444)))

(assert (=> d!130819 (= c!108844 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130819 (validMask!0 mask!1414)))

(assert (=> d!130819 (= (getCurrentListMap!4368 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491402)))

(declare-fun b!1099166 () Bool)

(declare-fun res!733225 () Bool)

(assert (=> b!1099166 (=> (not res!733225) (not e!627449))))

(assert (=> b!1099166 (= res!733225 e!627441)))

(declare-fun c!108841 () Bool)

(assert (=> b!1099166 (= c!108841 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099167 () Bool)

(declare-fun Unit!36105 () Unit!36101)

(assert (=> b!1099167 (= e!627445 Unit!36105)))

(declare-fun b!1099168 () Bool)

(declare-fun e!627448 () ListLongMap!15283)

(assert (=> b!1099168 (= e!627448 call!45903)))

(declare-fun bm!45901 () Bool)

(assert (=> bm!45901 (= call!45905 (contains!6404 lt!491402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099169 () Bool)

(assert (=> b!1099169 (= e!627440 (not call!45901))))

(declare-fun b!1099170 () Bool)

(assert (=> b!1099170 (= e!627441 (not call!45905))))

(declare-fun b!1099171 () Bool)

(declare-fun res!733224 () Bool)

(assert (=> b!1099171 (=> (not res!733224) (not e!627449))))

(declare-fun e!627439 () Bool)

(assert (=> b!1099171 (= res!733224 e!627439)))

(declare-fun res!733221 () Bool)

(assert (=> b!1099171 (=> res!733221 e!627439)))

(assert (=> b!1099171 (= res!733221 (not e!627446))))

(declare-fun res!733229 () Bool)

(assert (=> b!1099171 (=> (not res!733229) (not e!627446))))

(assert (=> b!1099171 (= res!733229 (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(declare-fun b!1099172 () Bool)

(assert (=> b!1099172 (= e!627444 (+!3392 call!45900 (tuple2!17307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099173 () Bool)

(declare-fun e!627443 () ListLongMap!15283)

(assert (=> b!1099173 (= e!627444 e!627443)))

(assert (=> b!1099173 (= c!108843 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099174 () Bool)

(assert (=> b!1099174 (= e!627443 call!45903)))

(declare-fun b!1099175 () Bool)

(declare-fun lt!491411 () Unit!36101)

(assert (=> b!1099175 (= e!627445 lt!491411)))

(declare-fun lt!491421 () ListLongMap!15283)

(assert (=> b!1099175 (= lt!491421 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491401 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491405 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491405 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491418 () Unit!36101)

(declare-fun addStillContains!657 (ListLongMap!15283 (_ BitVec 64) V!41289 (_ BitVec 64)) Unit!36101)

(assert (=> b!1099175 (= lt!491418 (addStillContains!657 lt!491421 lt!491401 zeroValue!831 lt!491405))))

(assert (=> b!1099175 (contains!6404 (+!3392 lt!491421 (tuple2!17307 lt!491401 zeroValue!831)) lt!491405)))

(declare-fun lt!491415 () Unit!36101)

(assert (=> b!1099175 (= lt!491415 lt!491418)))

(declare-fun lt!491414 () ListLongMap!15283)

(assert (=> b!1099175 (= lt!491414 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491400 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491416 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491416 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491420 () Unit!36101)

(declare-fun addApplyDifferent!513 (ListLongMap!15283 (_ BitVec 64) V!41289 (_ BitVec 64)) Unit!36101)

(assert (=> b!1099175 (= lt!491420 (addApplyDifferent!513 lt!491414 lt!491400 minValue!831 lt!491416))))

(assert (=> b!1099175 (= (apply!953 (+!3392 lt!491414 (tuple2!17307 lt!491400 minValue!831)) lt!491416) (apply!953 lt!491414 lt!491416))))

(declare-fun lt!491403 () Unit!36101)

(assert (=> b!1099175 (= lt!491403 lt!491420)))

(declare-fun lt!491417 () ListLongMap!15283)

(assert (=> b!1099175 (= lt!491417 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491407 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491407 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491410 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491410 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491408 () Unit!36101)

(assert (=> b!1099175 (= lt!491408 (addApplyDifferent!513 lt!491417 lt!491407 zeroValue!831 lt!491410))))

(assert (=> b!1099175 (= (apply!953 (+!3392 lt!491417 (tuple2!17307 lt!491407 zeroValue!831)) lt!491410) (apply!953 lt!491417 lt!491410))))

(declare-fun lt!491413 () Unit!36101)

(assert (=> b!1099175 (= lt!491413 lt!491408)))

(declare-fun lt!491406 () ListLongMap!15283)

(assert (=> b!1099175 (= lt!491406 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491409 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491409 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491419 () (_ BitVec 64))

(assert (=> b!1099175 (= lt!491419 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099175 (= lt!491411 (addApplyDifferent!513 lt!491406 lt!491409 minValue!831 lt!491419))))

(assert (=> b!1099175 (= (apply!953 (+!3392 lt!491406 (tuple2!17307 lt!491409 minValue!831)) lt!491419) (apply!953 lt!491406 lt!491419))))

(declare-fun b!1099176 () Bool)

(assert (=> b!1099176 (= e!627439 e!627447)))

(declare-fun res!733223 () Bool)

(assert (=> b!1099176 (=> (not res!733223) (not e!627447))))

(assert (=> b!1099176 (= res!733223 (contains!6404 lt!491402 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(declare-fun bm!45902 () Bool)

(assert (=> bm!45902 (= call!45899 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099177 () Bool)

(declare-fun c!108840 () Bool)

(assert (=> b!1099177 (= c!108840 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099177 (= e!627443 e!627448)))

(declare-fun b!1099178 () Bool)

(assert (=> b!1099178 (= e!627449 e!627440)))

(declare-fun c!108842 () Bool)

(assert (=> b!1099178 (= c!108842 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099179 () Bool)

(assert (=> b!1099179 (= e!627448 call!45904)))

(assert (= (and d!130819 c!108844) b!1099172))

(assert (= (and d!130819 (not c!108844)) b!1099173))

(assert (= (and b!1099173 c!108843) b!1099174))

(assert (= (and b!1099173 (not c!108843)) b!1099177))

(assert (= (and b!1099177 c!108840) b!1099168))

(assert (= (and b!1099177 (not c!108840)) b!1099179))

(assert (= (or b!1099168 b!1099179) bm!45900))

(assert (= (or b!1099174 bm!45900) bm!45898))

(assert (= (or b!1099174 b!1099168) bm!45896))

(assert (= (or b!1099172 bm!45898) bm!45902))

(assert (= (or b!1099172 bm!45896) bm!45897))

(assert (= (and d!130819 res!733222) b!1099163))

(assert (= (and d!130819 c!108839) b!1099175))

(assert (= (and d!130819 (not c!108839)) b!1099167))

(assert (= (and d!130819 res!733226) b!1099171))

(assert (= (and b!1099171 res!733229) b!1099165))

(assert (= (and b!1099171 (not res!733221)) b!1099176))

(assert (= (and b!1099176 res!733223) b!1099164))

(assert (= (and b!1099171 res!733224) b!1099166))

(assert (= (and b!1099166 c!108841) b!1099162))

(assert (= (and b!1099166 (not c!108841)) b!1099170))

(assert (= (and b!1099162 res!733227) b!1099159))

(assert (= (or b!1099162 b!1099170) bm!45901))

(assert (= (and b!1099166 res!733225) b!1099178))

(assert (= (and b!1099178 c!108842) b!1099160))

(assert (= (and b!1099178 (not c!108842)) b!1099169))

(assert (= (and b!1099160 res!733228) b!1099161))

(assert (= (or b!1099160 b!1099169) bm!45899))

(declare-fun b_lambda!17777 () Bool)

(assert (=> (not b_lambda!17777) (not b!1099164)))

(assert (=> b!1099164 t!34038))

(declare-fun b_and!36841 () Bool)

(assert (= b_and!36831 (and (=> t!34038 result!16391) b_and!36841)))

(declare-fun m!1019045 () Bool)

(assert (=> bm!45897 m!1019045))

(assert (=> bm!45902 m!1018849))

(assert (=> b!1099175 m!1018849))

(declare-fun m!1019047 () Bool)

(assert (=> b!1099175 m!1019047))

(assert (=> b!1099175 m!1019027))

(declare-fun m!1019049 () Bool)

(assert (=> b!1099175 m!1019049))

(assert (=> b!1099175 m!1019047))

(declare-fun m!1019051 () Bool)

(assert (=> b!1099175 m!1019051))

(declare-fun m!1019053 () Bool)

(assert (=> b!1099175 m!1019053))

(declare-fun m!1019055 () Bool)

(assert (=> b!1099175 m!1019055))

(declare-fun m!1019057 () Bool)

(assert (=> b!1099175 m!1019057))

(declare-fun m!1019059 () Bool)

(assert (=> b!1099175 m!1019059))

(declare-fun m!1019061 () Bool)

(assert (=> b!1099175 m!1019061))

(declare-fun m!1019063 () Bool)

(assert (=> b!1099175 m!1019063))

(declare-fun m!1019065 () Bool)

(assert (=> b!1099175 m!1019065))

(declare-fun m!1019067 () Bool)

(assert (=> b!1099175 m!1019067))

(declare-fun m!1019069 () Bool)

(assert (=> b!1099175 m!1019069))

(assert (=> b!1099175 m!1019069))

(declare-fun m!1019071 () Bool)

(assert (=> b!1099175 m!1019071))

(assert (=> b!1099175 m!1019059))

(declare-fun m!1019073 () Bool)

(assert (=> b!1099175 m!1019073))

(assert (=> b!1099175 m!1019065))

(declare-fun m!1019075 () Bool)

(assert (=> b!1099175 m!1019075))

(declare-fun m!1019077 () Bool)

(assert (=> b!1099159 m!1019077))

(declare-fun m!1019079 () Bool)

(assert (=> bm!45901 m!1019079))

(declare-fun m!1019081 () Bool)

(assert (=> bm!45899 m!1019081))

(assert (=> b!1099164 m!1018835))

(assert (=> b!1099164 m!1019027))

(declare-fun m!1019083 () Bool)

(assert (=> b!1099164 m!1019083))

(declare-fun m!1019085 () Bool)

(assert (=> b!1099164 m!1019085))

(assert (=> b!1099164 m!1019085))

(assert (=> b!1099164 m!1018835))

(declare-fun m!1019087 () Bool)

(assert (=> b!1099164 m!1019087))

(assert (=> b!1099164 m!1019027))

(declare-fun m!1019089 () Bool)

(assert (=> b!1099161 m!1019089))

(declare-fun m!1019091 () Bool)

(assert (=> b!1099172 m!1019091))

(assert (=> b!1099163 m!1019027))

(assert (=> b!1099163 m!1019027))

(assert (=> b!1099163 m!1019033))

(assert (=> b!1099165 m!1019027))

(assert (=> b!1099165 m!1019027))

(assert (=> b!1099165 m!1019033))

(assert (=> d!130819 m!1018823))

(assert (=> b!1099176 m!1019027))

(assert (=> b!1099176 m!1019027))

(declare-fun m!1019093 () Bool)

(assert (=> b!1099176 m!1019093))

(assert (=> b!1098974 d!130819))

(declare-fun b!1099204 () Bool)

(declare-fun e!627467 () Bool)

(declare-fun lt!491437 () ListLongMap!15283)

(declare-fun isEmpty!966 (ListLongMap!15283) Bool)

(assert (=> b!1099204 (= e!627467 (isEmpty!966 lt!491437))))

(declare-fun b!1099205 () Bool)

(declare-fun e!627466 () Bool)

(assert (=> b!1099205 (= e!627466 e!627467)))

(declare-fun c!108854 () Bool)

(assert (=> b!1099205 (= c!108854 (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(declare-fun b!1099206 () Bool)

(declare-fun e!627469 () ListLongMap!15283)

(assert (=> b!1099206 (= e!627469 (ListLongMap!15284 Nil!23928))))

(declare-fun b!1099207 () Bool)

(assert (=> b!1099207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(assert (=> b!1099207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34795 lt!491244)))))

(declare-fun e!627465 () Bool)

(assert (=> b!1099207 (= e!627465 (= (apply!953 lt!491437 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)) (get!17643 (select (arr!34258 lt!491244) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130821 () Bool)

(declare-fun e!627470 () Bool)

(assert (=> d!130821 e!627470))

(declare-fun res!733239 () Bool)

(assert (=> d!130821 (=> (not res!733239) (not e!627470))))

(assert (=> d!130821 (= res!733239 (not (contains!6404 lt!491437 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130821 (= lt!491437 e!627469)))

(declare-fun c!108856 () Bool)

(assert (=> d!130821 (= c!108856 (bvsge #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(assert (=> d!130821 (validMask!0 mask!1414)))

(assert (=> d!130821 (= (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491437)))

(declare-fun b!1099208 () Bool)

(declare-fun e!627468 () Bool)

(assert (=> b!1099208 (= e!627468 (validKeyInArray!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(assert (=> b!1099208 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099209 () Bool)

(assert (=> b!1099209 (= e!627466 e!627465)))

(assert (=> b!1099209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(declare-fun res!733238 () Bool)

(assert (=> b!1099209 (= res!733238 (contains!6404 lt!491437 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(assert (=> b!1099209 (=> (not res!733238) (not e!627465))))

(declare-fun b!1099210 () Bool)

(declare-fun e!627464 () ListLongMap!15283)

(declare-fun call!45908 () ListLongMap!15283)

(assert (=> b!1099210 (= e!627464 call!45908)))

(declare-fun b!1099211 () Bool)

(assert (=> b!1099211 (= e!627467 (= lt!491437 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun bm!45905 () Bool)

(assert (=> bm!45905 (= call!45908 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099212 () Bool)

(declare-fun res!733240 () Bool)

(assert (=> b!1099212 (=> (not res!733240) (not e!627470))))

(assert (=> b!1099212 (= res!733240 (not (contains!6404 lt!491437 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099213 () Bool)

(assert (=> b!1099213 (= e!627469 e!627464)))

(declare-fun c!108855 () Bool)

(assert (=> b!1099213 (= c!108855 (validKeyInArray!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(declare-fun b!1099214 () Bool)

(assert (=> b!1099214 (= e!627470 e!627466)))

(declare-fun c!108853 () Bool)

(assert (=> b!1099214 (= c!108853 e!627468)))

(declare-fun res!733241 () Bool)

(assert (=> b!1099214 (=> (not res!733241) (not e!627468))))

(assert (=> b!1099214 (= res!733241 (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(declare-fun b!1099215 () Bool)

(declare-fun lt!491438 () Unit!36101)

(declare-fun lt!491442 () Unit!36101)

(assert (=> b!1099215 (= lt!491438 lt!491442)))

(declare-fun lt!491436 () (_ BitVec 64))

(declare-fun lt!491439 () ListLongMap!15283)

(declare-fun lt!491441 () (_ BitVec 64))

(declare-fun lt!491440 () V!41289)

(assert (=> b!1099215 (not (contains!6404 (+!3392 lt!491439 (tuple2!17307 lt!491436 lt!491440)) lt!491441))))

(declare-fun addStillNotContains!274 (ListLongMap!15283 (_ BitVec 64) V!41289 (_ BitVec 64)) Unit!36101)

(assert (=> b!1099215 (= lt!491442 (addStillNotContains!274 lt!491439 lt!491436 lt!491440 lt!491441))))

(assert (=> b!1099215 (= lt!491441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099215 (= lt!491440 (get!17643 (select (arr!34258 lt!491244) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099215 (= lt!491436 (select (arr!34257 lt!491252) #b00000000000000000000000000000000))))

(assert (=> b!1099215 (= lt!491439 call!45908)))

(assert (=> b!1099215 (= e!627464 (+!3392 call!45908 (tuple2!17307 (select (arr!34257 lt!491252) #b00000000000000000000000000000000) (get!17643 (select (arr!34258 lt!491244) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!130821 c!108856) b!1099206))

(assert (= (and d!130821 (not c!108856)) b!1099213))

(assert (= (and b!1099213 c!108855) b!1099215))

(assert (= (and b!1099213 (not c!108855)) b!1099210))

(assert (= (or b!1099215 b!1099210) bm!45905))

(assert (= (and d!130821 res!733239) b!1099212))

(assert (= (and b!1099212 res!733240) b!1099214))

(assert (= (and b!1099214 res!733241) b!1099208))

(assert (= (and b!1099214 c!108853) b!1099209))

(assert (= (and b!1099214 (not c!108853)) b!1099205))

(assert (= (and b!1099209 res!733238) b!1099207))

(assert (= (and b!1099205 c!108854) b!1099211))

(assert (= (and b!1099205 (not c!108854)) b!1099204))

(declare-fun b_lambda!17779 () Bool)

(assert (=> (not b_lambda!17779) (not b!1099207)))

(assert (=> b!1099207 t!34038))

(declare-fun b_and!36843 () Bool)

(assert (= b_and!36841 (and (=> t!34038 result!16391) b_and!36843)))

(declare-fun b_lambda!17781 () Bool)

(assert (=> (not b_lambda!17781) (not b!1099215)))

(assert (=> b!1099215 t!34038))

(declare-fun b_and!36845 () Bool)

(assert (= b_and!36843 (and (=> t!34038 result!16391) b_and!36845)))

(declare-fun m!1019095 () Bool)

(assert (=> b!1099204 m!1019095))

(declare-fun m!1019097 () Bool)

(assert (=> d!130821 m!1019097))

(assert (=> d!130821 m!1018823))

(assert (=> b!1099209 m!1018967))

(assert (=> b!1099209 m!1018967))

(declare-fun m!1019099 () Bool)

(assert (=> b!1099209 m!1019099))

(assert (=> b!1099215 m!1018835))

(declare-fun m!1019101 () Bool)

(assert (=> b!1099215 m!1019101))

(declare-fun m!1019103 () Bool)

(assert (=> b!1099215 m!1019103))

(declare-fun m!1019105 () Bool)

(assert (=> b!1099215 m!1019105))

(declare-fun m!1019107 () Bool)

(assert (=> b!1099215 m!1019107))

(declare-fun m!1019109 () Bool)

(assert (=> b!1099215 m!1019109))

(assert (=> b!1099215 m!1019103))

(assert (=> b!1099215 m!1018967))

(assert (=> b!1099215 m!1019107))

(assert (=> b!1099215 m!1018835))

(declare-fun m!1019111 () Bool)

(assert (=> b!1099215 m!1019111))

(assert (=> b!1099208 m!1018967))

(assert (=> b!1099208 m!1018967))

(assert (=> b!1099208 m!1018969))

(assert (=> b!1099213 m!1018967))

(assert (=> b!1099213 m!1018967))

(assert (=> b!1099213 m!1018969))

(declare-fun m!1019113 () Bool)

(assert (=> b!1099212 m!1019113))

(declare-fun m!1019115 () Bool)

(assert (=> bm!45905 m!1019115))

(assert (=> b!1099207 m!1018835))

(assert (=> b!1099207 m!1019107))

(assert (=> b!1099207 m!1018967))

(declare-fun m!1019117 () Bool)

(assert (=> b!1099207 m!1019117))

(assert (=> b!1099207 m!1018967))

(assert (=> b!1099207 m!1019107))

(assert (=> b!1099207 m!1018835))

(assert (=> b!1099207 m!1019111))

(assert (=> b!1099211 m!1019115))

(assert (=> b!1098974 d!130821))

(declare-fun call!45913 () ListLongMap!15283)

(declare-fun bm!45910 () Bool)

(assert (=> bm!45910 (= call!45913 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45911 () Bool)

(declare-fun call!45914 () ListLongMap!15283)

(assert (=> bm!45911 (= call!45914 (getCurrentListMapNoExtraKeys!4209 (array!71186 (store (arr!34257 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34794 _keys!1070)) (array!71188 (store (arr!34258 _values!874) i!650 (ValueCellFull!12851 (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34795 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130823 () Bool)

(declare-fun e!627476 () Bool)

(assert (=> d!130823 e!627476))

(declare-fun res!733244 () Bool)

(assert (=> d!130823 (=> (not res!733244) (not e!627476))))

(assert (=> d!130823 (= res!733244 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34794 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34794 _keys!1070))))))))

(declare-fun lt!491445 () Unit!36101)

(declare-fun choose!1767 (array!71185 array!71187 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36101)

(assert (=> d!130823 (= lt!491445 (choose!1767 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(assert (=> d!130823 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!202 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!491445)))

(declare-fun b!1099222 () Bool)

(declare-fun e!627475 () Bool)

(assert (=> b!1099222 (= e!627475 (= call!45914 call!45913))))

(assert (=> b!1099222 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34795 _values!874)))))

(declare-fun b!1099223 () Bool)

(assert (=> b!1099223 (= e!627476 e!627475)))

(declare-fun c!108859 () Bool)

(assert (=> b!1099223 (= c!108859 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1099224 () Bool)

(assert (=> b!1099224 (= e!627475 (= call!45914 (-!930 call!45913 k0!904)))))

(assert (=> b!1099224 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34795 _values!874)))))

(assert (= (and d!130823 res!733244) b!1099223))

(assert (= (and b!1099223 c!108859) b!1099224))

(assert (= (and b!1099223 (not c!108859)) b!1099222))

(assert (= (or b!1099224 b!1099222) bm!45910))

(assert (= (or b!1099224 b!1099222) bm!45911))

(declare-fun b_lambda!17783 () Bool)

(assert (=> (not b_lambda!17783) (not bm!45911)))

(assert (=> bm!45911 t!34038))

(declare-fun b_and!36847 () Bool)

(assert (= b_and!36845 (and (=> t!34038 result!16391) b_and!36847)))

(assert (=> bm!45910 m!1018849))

(assert (=> bm!45911 m!1018857))

(assert (=> bm!45911 m!1018835))

(assert (=> bm!45911 m!1018841))

(declare-fun m!1019119 () Bool)

(assert (=> bm!45911 m!1019119))

(declare-fun m!1019121 () Bool)

(assert (=> d!130823 m!1019121))

(declare-fun m!1019123 () Bool)

(assert (=> b!1099224 m!1019123))

(assert (=> b!1098974 d!130823))

(declare-fun d!130825 () Bool)

(declare-fun lt!491448 () ListLongMap!15283)

(assert (=> d!130825 (not (contains!6404 lt!491448 k0!904))))

(declare-fun removeStrictlySorted!77 (List!23931 (_ BitVec 64)) List!23931)

(assert (=> d!130825 (= lt!491448 (ListLongMap!15284 (removeStrictlySorted!77 (toList!7657 lt!491250) k0!904)))))

(assert (=> d!130825 (= (-!930 lt!491250 k0!904) lt!491448)))

(declare-fun bs!32279 () Bool)

(assert (= bs!32279 d!130825))

(declare-fun m!1019125 () Bool)

(assert (=> bs!32279 m!1019125))

(declare-fun m!1019127 () Bool)

(assert (=> bs!32279 m!1019127))

(assert (=> b!1098974 d!130825))

(declare-fun bm!45912 () Bool)

(declare-fun call!45919 () ListLongMap!15283)

(declare-fun call!45916 () ListLongMap!15283)

(assert (=> bm!45912 (= call!45919 call!45916)))

(declare-fun c!108865 () Bool)

(declare-fun call!45920 () ListLongMap!15283)

(declare-fun call!45918 () ListLongMap!15283)

(declare-fun c!108864 () Bool)

(declare-fun call!45915 () ListLongMap!15283)

(declare-fun bm!45913 () Bool)

(assert (=> bm!45913 (= call!45916 (+!3392 (ite c!108865 call!45915 (ite c!108864 call!45918 call!45920)) (ite (or c!108865 c!108864) (tuple2!17307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099225 () Bool)

(declare-fun e!627482 () Bool)

(declare-fun lt!491451 () ListLongMap!15283)

(assert (=> b!1099225 (= e!627482 (= (apply!953 lt!491451 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099226 () Bool)

(declare-fun e!627480 () Bool)

(declare-fun e!627478 () Bool)

(assert (=> b!1099226 (= e!627480 e!627478)))

(declare-fun res!733252 () Bool)

(declare-fun call!45917 () Bool)

(assert (=> b!1099226 (= res!733252 call!45917)))

(assert (=> b!1099226 (=> (not res!733252) (not e!627478))))

(declare-fun bm!45914 () Bool)

(assert (=> bm!45914 (= call!45918 call!45915)))

(declare-fun b!1099227 () Bool)

(assert (=> b!1099227 (= e!627478 (= (apply!953 lt!491451 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099228 () Bool)

(declare-fun e!627481 () Bool)

(assert (=> b!1099228 (= e!627481 e!627482)))

(declare-fun res!733251 () Bool)

(declare-fun call!45921 () Bool)

(assert (=> b!1099228 (= res!733251 call!45921)))

(assert (=> b!1099228 (=> (not res!733251) (not e!627482))))

(declare-fun b!1099229 () Bool)

(declare-fun e!627477 () Bool)

(assert (=> b!1099229 (= e!627477 (validKeyInArray!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(declare-fun e!627487 () Bool)

(declare-fun b!1099230 () Bool)

(assert (=> b!1099230 (= e!627487 (= (apply!953 lt!491451 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)) (get!17643 (select (arr!34258 lt!491244) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34795 lt!491244)))))

(assert (=> b!1099230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(declare-fun bm!45915 () Bool)

(assert (=> bm!45915 (= call!45917 (contains!6404 lt!491451 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099231 () Bool)

(declare-fun e!627486 () Bool)

(assert (=> b!1099231 (= e!627486 (validKeyInArray!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(declare-fun bm!45916 () Bool)

(assert (=> bm!45916 (= call!45920 call!45918)))

(declare-fun d!130827 () Bool)

(declare-fun e!627489 () Bool)

(assert (=> d!130827 e!627489))

(declare-fun res!733250 () Bool)

(assert (=> d!130827 (=> (not res!733250) (not e!627489))))

(assert (=> d!130827 (= res!733250 (or (bvsge #b00000000000000000000000000000000 (size!34794 lt!491252)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))))

(declare-fun lt!491453 () ListLongMap!15283)

(assert (=> d!130827 (= lt!491451 lt!491453)))

(declare-fun lt!491461 () Unit!36101)

(declare-fun e!627485 () Unit!36101)

(assert (=> d!130827 (= lt!491461 e!627485)))

(declare-fun c!108860 () Bool)

(assert (=> d!130827 (= c!108860 e!627477)))

(declare-fun res!733246 () Bool)

(assert (=> d!130827 (=> (not res!733246) (not e!627477))))

(assert (=> d!130827 (= res!733246 (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(declare-fun e!627484 () ListLongMap!15283)

(assert (=> d!130827 (= lt!491453 e!627484)))

(assert (=> d!130827 (= c!108865 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130827 (validMask!0 mask!1414)))

(assert (=> d!130827 (= (getCurrentListMap!4368 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491451)))

(declare-fun b!1099232 () Bool)

(declare-fun res!733249 () Bool)

(assert (=> b!1099232 (=> (not res!733249) (not e!627489))))

(assert (=> b!1099232 (= res!733249 e!627481)))

(declare-fun c!108862 () Bool)

(assert (=> b!1099232 (= c!108862 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099233 () Bool)

(declare-fun Unit!36106 () Unit!36101)

(assert (=> b!1099233 (= e!627485 Unit!36106)))

(declare-fun b!1099234 () Bool)

(declare-fun e!627488 () ListLongMap!15283)

(assert (=> b!1099234 (= e!627488 call!45919)))

(declare-fun bm!45917 () Bool)

(assert (=> bm!45917 (= call!45921 (contains!6404 lt!491451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099235 () Bool)

(assert (=> b!1099235 (= e!627480 (not call!45917))))

(declare-fun b!1099236 () Bool)

(assert (=> b!1099236 (= e!627481 (not call!45921))))

(declare-fun b!1099237 () Bool)

(declare-fun res!733248 () Bool)

(assert (=> b!1099237 (=> (not res!733248) (not e!627489))))

(declare-fun e!627479 () Bool)

(assert (=> b!1099237 (= res!733248 e!627479)))

(declare-fun res!733245 () Bool)

(assert (=> b!1099237 (=> res!733245 e!627479)))

(assert (=> b!1099237 (= res!733245 (not e!627486))))

(declare-fun res!733253 () Bool)

(assert (=> b!1099237 (=> (not res!733253) (not e!627486))))

(assert (=> b!1099237 (= res!733253 (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(declare-fun b!1099238 () Bool)

(assert (=> b!1099238 (= e!627484 (+!3392 call!45916 (tuple2!17307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099239 () Bool)

(declare-fun e!627483 () ListLongMap!15283)

(assert (=> b!1099239 (= e!627484 e!627483)))

(assert (=> b!1099239 (= c!108864 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099240 () Bool)

(assert (=> b!1099240 (= e!627483 call!45919)))

(declare-fun b!1099241 () Bool)

(declare-fun lt!491460 () Unit!36101)

(assert (=> b!1099241 (= e!627485 lt!491460)))

(declare-fun lt!491470 () ListLongMap!15283)

(assert (=> b!1099241 (= lt!491470 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491450 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491450 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491454 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491454 (select (arr!34257 lt!491252) #b00000000000000000000000000000000))))

(declare-fun lt!491467 () Unit!36101)

(assert (=> b!1099241 (= lt!491467 (addStillContains!657 lt!491470 lt!491450 zeroValue!831 lt!491454))))

(assert (=> b!1099241 (contains!6404 (+!3392 lt!491470 (tuple2!17307 lt!491450 zeroValue!831)) lt!491454)))

(declare-fun lt!491464 () Unit!36101)

(assert (=> b!1099241 (= lt!491464 lt!491467)))

(declare-fun lt!491463 () ListLongMap!15283)

(assert (=> b!1099241 (= lt!491463 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491449 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491449 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491465 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491465 (select (arr!34257 lt!491252) #b00000000000000000000000000000000))))

(declare-fun lt!491469 () Unit!36101)

(assert (=> b!1099241 (= lt!491469 (addApplyDifferent!513 lt!491463 lt!491449 minValue!831 lt!491465))))

(assert (=> b!1099241 (= (apply!953 (+!3392 lt!491463 (tuple2!17307 lt!491449 minValue!831)) lt!491465) (apply!953 lt!491463 lt!491465))))

(declare-fun lt!491452 () Unit!36101)

(assert (=> b!1099241 (= lt!491452 lt!491469)))

(declare-fun lt!491466 () ListLongMap!15283)

(assert (=> b!1099241 (= lt!491466 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491456 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491459 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491459 (select (arr!34257 lt!491252) #b00000000000000000000000000000000))))

(declare-fun lt!491457 () Unit!36101)

(assert (=> b!1099241 (= lt!491457 (addApplyDifferent!513 lt!491466 lt!491456 zeroValue!831 lt!491459))))

(assert (=> b!1099241 (= (apply!953 (+!3392 lt!491466 (tuple2!17307 lt!491456 zeroValue!831)) lt!491459) (apply!953 lt!491466 lt!491459))))

(declare-fun lt!491462 () Unit!36101)

(assert (=> b!1099241 (= lt!491462 lt!491457)))

(declare-fun lt!491455 () ListLongMap!15283)

(assert (=> b!1099241 (= lt!491455 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491458 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491458 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491468 () (_ BitVec 64))

(assert (=> b!1099241 (= lt!491468 (select (arr!34257 lt!491252) #b00000000000000000000000000000000))))

(assert (=> b!1099241 (= lt!491460 (addApplyDifferent!513 lt!491455 lt!491458 minValue!831 lt!491468))))

(assert (=> b!1099241 (= (apply!953 (+!3392 lt!491455 (tuple2!17307 lt!491458 minValue!831)) lt!491468) (apply!953 lt!491455 lt!491468))))

(declare-fun b!1099242 () Bool)

(assert (=> b!1099242 (= e!627479 e!627487)))

(declare-fun res!733247 () Bool)

(assert (=> b!1099242 (=> (not res!733247) (not e!627487))))

(assert (=> b!1099242 (= res!733247 (contains!6404 lt!491451 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(assert (=> b!1099242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(declare-fun bm!45918 () Bool)

(assert (=> bm!45918 (= call!45915 (getCurrentListMapNoExtraKeys!4209 lt!491252 lt!491244 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099243 () Bool)

(declare-fun c!108861 () Bool)

(assert (=> b!1099243 (= c!108861 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099243 (= e!627483 e!627488)))

(declare-fun b!1099244 () Bool)

(assert (=> b!1099244 (= e!627489 e!627480)))

(declare-fun c!108863 () Bool)

(assert (=> b!1099244 (= c!108863 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099245 () Bool)

(assert (=> b!1099245 (= e!627488 call!45920)))

(assert (= (and d!130827 c!108865) b!1099238))

(assert (= (and d!130827 (not c!108865)) b!1099239))

(assert (= (and b!1099239 c!108864) b!1099240))

(assert (= (and b!1099239 (not c!108864)) b!1099243))

(assert (= (and b!1099243 c!108861) b!1099234))

(assert (= (and b!1099243 (not c!108861)) b!1099245))

(assert (= (or b!1099234 b!1099245) bm!45916))

(assert (= (or b!1099240 bm!45916) bm!45914))

(assert (= (or b!1099240 b!1099234) bm!45912))

(assert (= (or b!1099238 bm!45914) bm!45918))

(assert (= (or b!1099238 bm!45912) bm!45913))

(assert (= (and d!130827 res!733246) b!1099229))

(assert (= (and d!130827 c!108860) b!1099241))

(assert (= (and d!130827 (not c!108860)) b!1099233))

(assert (= (and d!130827 res!733250) b!1099237))

(assert (= (and b!1099237 res!733253) b!1099231))

(assert (= (and b!1099237 (not res!733245)) b!1099242))

(assert (= (and b!1099242 res!733247) b!1099230))

(assert (= (and b!1099237 res!733248) b!1099232))

(assert (= (and b!1099232 c!108862) b!1099228))

(assert (= (and b!1099232 (not c!108862)) b!1099236))

(assert (= (and b!1099228 res!733251) b!1099225))

(assert (= (or b!1099228 b!1099236) bm!45917))

(assert (= (and b!1099232 res!733249) b!1099244))

(assert (= (and b!1099244 c!108863) b!1099226))

(assert (= (and b!1099244 (not c!108863)) b!1099235))

(assert (= (and b!1099226 res!733252) b!1099227))

(assert (= (or b!1099226 b!1099235) bm!45915))

(declare-fun b_lambda!17785 () Bool)

(assert (=> (not b_lambda!17785) (not b!1099230)))

(assert (=> b!1099230 t!34038))

(declare-fun b_and!36849 () Bool)

(assert (= b_and!36847 (and (=> t!34038 result!16391) b_and!36849)))

(declare-fun m!1019129 () Bool)

(assert (=> bm!45913 m!1019129))

(assert (=> bm!45918 m!1018845))

(assert (=> b!1099241 m!1018845))

(declare-fun m!1019131 () Bool)

(assert (=> b!1099241 m!1019131))

(assert (=> b!1099241 m!1018967))

(declare-fun m!1019133 () Bool)

(assert (=> b!1099241 m!1019133))

(assert (=> b!1099241 m!1019131))

(declare-fun m!1019135 () Bool)

(assert (=> b!1099241 m!1019135))

(declare-fun m!1019137 () Bool)

(assert (=> b!1099241 m!1019137))

(declare-fun m!1019139 () Bool)

(assert (=> b!1099241 m!1019139))

(declare-fun m!1019141 () Bool)

(assert (=> b!1099241 m!1019141))

(declare-fun m!1019143 () Bool)

(assert (=> b!1099241 m!1019143))

(declare-fun m!1019145 () Bool)

(assert (=> b!1099241 m!1019145))

(declare-fun m!1019147 () Bool)

(assert (=> b!1099241 m!1019147))

(declare-fun m!1019149 () Bool)

(assert (=> b!1099241 m!1019149))

(declare-fun m!1019151 () Bool)

(assert (=> b!1099241 m!1019151))

(declare-fun m!1019153 () Bool)

(assert (=> b!1099241 m!1019153))

(assert (=> b!1099241 m!1019153))

(declare-fun m!1019155 () Bool)

(assert (=> b!1099241 m!1019155))

(assert (=> b!1099241 m!1019143))

(declare-fun m!1019157 () Bool)

(assert (=> b!1099241 m!1019157))

(assert (=> b!1099241 m!1019149))

(declare-fun m!1019159 () Bool)

(assert (=> b!1099241 m!1019159))

(declare-fun m!1019161 () Bool)

(assert (=> b!1099225 m!1019161))

(declare-fun m!1019163 () Bool)

(assert (=> bm!45917 m!1019163))

(declare-fun m!1019165 () Bool)

(assert (=> bm!45915 m!1019165))

(assert (=> b!1099230 m!1018835))

(assert (=> b!1099230 m!1018967))

(declare-fun m!1019167 () Bool)

(assert (=> b!1099230 m!1019167))

(assert (=> b!1099230 m!1019107))

(assert (=> b!1099230 m!1019107))

(assert (=> b!1099230 m!1018835))

(assert (=> b!1099230 m!1019111))

(assert (=> b!1099230 m!1018967))

(declare-fun m!1019169 () Bool)

(assert (=> b!1099227 m!1019169))

(declare-fun m!1019171 () Bool)

(assert (=> b!1099238 m!1019171))

(assert (=> b!1099229 m!1018967))

(assert (=> b!1099229 m!1018967))

(assert (=> b!1099229 m!1018969))

(assert (=> b!1099231 m!1018967))

(assert (=> b!1099231 m!1018967))

(assert (=> b!1099231 m!1018969))

(assert (=> d!130827 m!1018823))

(assert (=> b!1099242 m!1018967))

(assert (=> b!1099242 m!1018967))

(declare-fun m!1019173 () Bool)

(assert (=> b!1099242 m!1019173))

(assert (=> b!1098974 d!130827))

(declare-fun b!1099246 () Bool)

(declare-fun e!627493 () Bool)

(declare-fun lt!491472 () ListLongMap!15283)

(assert (=> b!1099246 (= e!627493 (isEmpty!966 lt!491472))))

(declare-fun b!1099247 () Bool)

(declare-fun e!627492 () Bool)

(assert (=> b!1099247 (= e!627492 e!627493)))

(declare-fun c!108867 () Bool)

(assert (=> b!1099247 (= c!108867 (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(declare-fun b!1099248 () Bool)

(declare-fun e!627495 () ListLongMap!15283)

(assert (=> b!1099248 (= e!627495 (ListLongMap!15284 Nil!23928))))

(declare-fun b!1099249 () Bool)

(assert (=> b!1099249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(assert (=> b!1099249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34795 _values!874)))))

(declare-fun e!627491 () Bool)

(assert (=> b!1099249 (= e!627491 (= (apply!953 lt!491472 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)) (get!17643 (select (arr!34258 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130829 () Bool)

(declare-fun e!627496 () Bool)

(assert (=> d!130829 e!627496))

(declare-fun res!733255 () Bool)

(assert (=> d!130829 (=> (not res!733255) (not e!627496))))

(assert (=> d!130829 (= res!733255 (not (contains!6404 lt!491472 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130829 (= lt!491472 e!627495)))

(declare-fun c!108869 () Bool)

(assert (=> d!130829 (= c!108869 (bvsge #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(assert (=> d!130829 (validMask!0 mask!1414)))

(assert (=> d!130829 (= (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491472)))

(declare-fun b!1099250 () Bool)

(declare-fun e!627494 () Bool)

(assert (=> b!1099250 (= e!627494 (validKeyInArray!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099250 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099251 () Bool)

(assert (=> b!1099251 (= e!627492 e!627491)))

(assert (=> b!1099251 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(declare-fun res!733254 () Bool)

(assert (=> b!1099251 (= res!733254 (contains!6404 lt!491472 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099251 (=> (not res!733254) (not e!627491))))

(declare-fun b!1099252 () Bool)

(declare-fun e!627490 () ListLongMap!15283)

(declare-fun call!45922 () ListLongMap!15283)

(assert (=> b!1099252 (= e!627490 call!45922)))

(declare-fun b!1099253 () Bool)

(assert (=> b!1099253 (= e!627493 (= lt!491472 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun bm!45919 () Bool)

(assert (=> bm!45919 (= call!45922 (getCurrentListMapNoExtraKeys!4209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099254 () Bool)

(declare-fun res!733256 () Bool)

(assert (=> b!1099254 (=> (not res!733256) (not e!627496))))

(assert (=> b!1099254 (= res!733256 (not (contains!6404 lt!491472 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099255 () Bool)

(assert (=> b!1099255 (= e!627495 e!627490)))

(declare-fun c!108868 () Bool)

(assert (=> b!1099255 (= c!108868 (validKeyInArray!0 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099256 () Bool)

(assert (=> b!1099256 (= e!627496 e!627492)))

(declare-fun c!108866 () Bool)

(assert (=> b!1099256 (= c!108866 e!627494)))

(declare-fun res!733257 () Bool)

(assert (=> b!1099256 (=> (not res!733257) (not e!627494))))

(assert (=> b!1099256 (= res!733257 (bvslt #b00000000000000000000000000000000 (size!34794 _keys!1070)))))

(declare-fun b!1099257 () Bool)

(declare-fun lt!491473 () Unit!36101)

(declare-fun lt!491477 () Unit!36101)

(assert (=> b!1099257 (= lt!491473 lt!491477)))

(declare-fun lt!491476 () (_ BitVec 64))

(declare-fun lt!491474 () ListLongMap!15283)

(declare-fun lt!491475 () V!41289)

(declare-fun lt!491471 () (_ BitVec 64))

(assert (=> b!1099257 (not (contains!6404 (+!3392 lt!491474 (tuple2!17307 lt!491471 lt!491475)) lt!491476))))

(assert (=> b!1099257 (= lt!491477 (addStillNotContains!274 lt!491474 lt!491471 lt!491475 lt!491476))))

(assert (=> b!1099257 (= lt!491476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099257 (= lt!491475 (get!17643 (select (arr!34258 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099257 (= lt!491471 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099257 (= lt!491474 call!45922)))

(assert (=> b!1099257 (= e!627490 (+!3392 call!45922 (tuple2!17307 (select (arr!34257 _keys!1070) #b00000000000000000000000000000000) (get!17643 (select (arr!34258 _values!874) #b00000000000000000000000000000000) (dynLambda!2327 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!130829 c!108869) b!1099248))

(assert (= (and d!130829 (not c!108869)) b!1099255))

(assert (= (and b!1099255 c!108868) b!1099257))

(assert (= (and b!1099255 (not c!108868)) b!1099252))

(assert (= (or b!1099257 b!1099252) bm!45919))

(assert (= (and d!130829 res!733255) b!1099254))

(assert (= (and b!1099254 res!733256) b!1099256))

(assert (= (and b!1099256 res!733257) b!1099250))

(assert (= (and b!1099256 c!108866) b!1099251))

(assert (= (and b!1099256 (not c!108866)) b!1099247))

(assert (= (and b!1099251 res!733254) b!1099249))

(assert (= (and b!1099247 c!108867) b!1099253))

(assert (= (and b!1099247 (not c!108867)) b!1099246))

(declare-fun b_lambda!17787 () Bool)

(assert (=> (not b_lambda!17787) (not b!1099249)))

(assert (=> b!1099249 t!34038))

(declare-fun b_and!36851 () Bool)

(assert (= b_and!36849 (and (=> t!34038 result!16391) b_and!36851)))

(declare-fun b_lambda!17789 () Bool)

(assert (=> (not b_lambda!17789) (not b!1099257)))

(assert (=> b!1099257 t!34038))

(declare-fun b_and!36853 () Bool)

(assert (= b_and!36851 (and (=> t!34038 result!16391) b_and!36853)))

(declare-fun m!1019175 () Bool)

(assert (=> b!1099246 m!1019175))

(declare-fun m!1019177 () Bool)

(assert (=> d!130829 m!1019177))

(assert (=> d!130829 m!1018823))

(assert (=> b!1099251 m!1019027))

(assert (=> b!1099251 m!1019027))

(declare-fun m!1019179 () Bool)

(assert (=> b!1099251 m!1019179))

(assert (=> b!1099257 m!1018835))

(declare-fun m!1019181 () Bool)

(assert (=> b!1099257 m!1019181))

(declare-fun m!1019183 () Bool)

(assert (=> b!1099257 m!1019183))

(declare-fun m!1019185 () Bool)

(assert (=> b!1099257 m!1019185))

(assert (=> b!1099257 m!1019085))

(declare-fun m!1019187 () Bool)

(assert (=> b!1099257 m!1019187))

(assert (=> b!1099257 m!1019183))

(assert (=> b!1099257 m!1019027))

(assert (=> b!1099257 m!1019085))

(assert (=> b!1099257 m!1018835))

(assert (=> b!1099257 m!1019087))

(assert (=> b!1099250 m!1019027))

(assert (=> b!1099250 m!1019027))

(assert (=> b!1099250 m!1019033))

(assert (=> b!1099255 m!1019027))

(assert (=> b!1099255 m!1019027))

(assert (=> b!1099255 m!1019033))

(declare-fun m!1019189 () Bool)

(assert (=> b!1099254 m!1019189))

(declare-fun m!1019191 () Bool)

(assert (=> bm!45919 m!1019191))

(assert (=> b!1099249 m!1018835))

(assert (=> b!1099249 m!1019085))

(assert (=> b!1099249 m!1019027))

(declare-fun m!1019193 () Bool)

(assert (=> b!1099249 m!1019193))

(assert (=> b!1099249 m!1019027))

(assert (=> b!1099249 m!1019085))

(assert (=> b!1099249 m!1018835))

(assert (=> b!1099249 m!1019087))

(assert (=> b!1099253 m!1019191))

(assert (=> b!1098974 d!130829))

(declare-fun d!130831 () Bool)

(assert (=> d!130831 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491480 () Unit!36101)

(declare-fun choose!13 (array!71185 (_ BitVec 64) (_ BitVec 32)) Unit!36101)

(assert (=> d!130831 (= lt!491480 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130831 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130831 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!491480)))

(declare-fun bs!32280 () Bool)

(assert (= bs!32280 d!130831))

(assert (=> bs!32280 m!1018843))

(declare-fun m!1019195 () Bool)

(assert (=> bs!32280 m!1019195))

(assert (=> b!1098974 d!130831))

(declare-fun b!1099258 () Bool)

(declare-fun e!627499 () Bool)

(declare-fun call!45923 () Bool)

(assert (=> b!1099258 (= e!627499 call!45923)))

(declare-fun bm!45920 () Bool)

(declare-fun c!108870 () Bool)

(assert (=> bm!45920 (= call!45923 (arrayNoDuplicates!0 lt!491252 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108870 (Cons!23926 (select (arr!34257 lt!491252) #b00000000000000000000000000000000) Nil!23927) Nil!23927)))))

(declare-fun b!1099259 () Bool)

(assert (=> b!1099259 (= e!627499 call!45923)))

(declare-fun b!1099260 () Bool)

(declare-fun e!627500 () Bool)

(assert (=> b!1099260 (= e!627500 (contains!6406 Nil!23927 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(declare-fun b!1099261 () Bool)

(declare-fun e!627498 () Bool)

(declare-fun e!627497 () Bool)

(assert (=> b!1099261 (= e!627498 e!627497)))

(declare-fun res!733258 () Bool)

(assert (=> b!1099261 (=> (not res!733258) (not e!627497))))

(assert (=> b!1099261 (= res!733258 (not e!627500))))

(declare-fun res!733260 () Bool)

(assert (=> b!1099261 (=> (not res!733260) (not e!627500))))

(assert (=> b!1099261 (= res!733260 (validKeyInArray!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(declare-fun d!130833 () Bool)

(declare-fun res!733259 () Bool)

(assert (=> d!130833 (=> res!733259 e!627498)))

(assert (=> d!130833 (= res!733259 (bvsge #b00000000000000000000000000000000 (size!34794 lt!491252)))))

(assert (=> d!130833 (= (arrayNoDuplicates!0 lt!491252 #b00000000000000000000000000000000 Nil!23927) e!627498)))

(declare-fun b!1099262 () Bool)

(assert (=> b!1099262 (= e!627497 e!627499)))

(assert (=> b!1099262 (= c!108870 (validKeyInArray!0 (select (arr!34257 lt!491252) #b00000000000000000000000000000000)))))

(assert (= (and d!130833 (not res!733259)) b!1099261))

(assert (= (and b!1099261 res!733260) b!1099260))

(assert (= (and b!1099261 res!733258) b!1099262))

(assert (= (and b!1099262 c!108870) b!1099259))

(assert (= (and b!1099262 (not c!108870)) b!1099258))

(assert (= (or b!1099259 b!1099258) bm!45920))

(assert (=> bm!45920 m!1018967))

(declare-fun m!1019197 () Bool)

(assert (=> bm!45920 m!1019197))

(assert (=> b!1099260 m!1018967))

(assert (=> b!1099260 m!1018967))

(declare-fun m!1019199 () Bool)

(assert (=> b!1099260 m!1019199))

(assert (=> b!1099261 m!1018967))

(assert (=> b!1099261 m!1018967))

(assert (=> b!1099261 m!1018969))

(assert (=> b!1099262 m!1018967))

(assert (=> b!1099262 m!1018967))

(assert (=> b!1099262 m!1018969))

(assert (=> b!1098980 d!130833))

(declare-fun mapNonEmpty!42454 () Bool)

(declare-fun mapRes!42454 () Bool)

(declare-fun tp!81158 () Bool)

(declare-fun e!627506 () Bool)

(assert (=> mapNonEmpty!42454 (= mapRes!42454 (and tp!81158 e!627506))))

(declare-fun mapRest!42454 () (Array (_ BitVec 32) ValueCell!12851))

(declare-fun mapValue!42454 () ValueCell!12851)

(declare-fun mapKey!42454 () (_ BitVec 32))

(assert (=> mapNonEmpty!42454 (= mapRest!42445 (store mapRest!42454 mapKey!42454 mapValue!42454))))

(declare-fun condMapEmpty!42454 () Bool)

(declare-fun mapDefault!42454 () ValueCell!12851)

(assert (=> mapNonEmpty!42445 (= condMapEmpty!42454 (= mapRest!42445 ((as const (Array (_ BitVec 32) ValueCell!12851)) mapDefault!42454)))))

(declare-fun e!627505 () Bool)

(assert (=> mapNonEmpty!42445 (= tp!81143 (and e!627505 mapRes!42454))))

(declare-fun mapIsEmpty!42454 () Bool)

(assert (=> mapIsEmpty!42454 mapRes!42454))

(declare-fun b!1099269 () Bool)

(assert (=> b!1099269 (= e!627506 tp_is_empty!27121)))

(declare-fun b!1099270 () Bool)

(assert (=> b!1099270 (= e!627505 tp_is_empty!27121)))

(assert (= (and mapNonEmpty!42445 condMapEmpty!42454) mapIsEmpty!42454))

(assert (= (and mapNonEmpty!42445 (not condMapEmpty!42454)) mapNonEmpty!42454))

(assert (= (and mapNonEmpty!42454 ((_ is ValueCellFull!12851) mapValue!42454)) b!1099269))

(assert (= (and mapNonEmpty!42445 ((_ is ValueCellFull!12851) mapDefault!42454)) b!1099270))

(declare-fun m!1019201 () Bool)

(assert (=> mapNonEmpty!42454 m!1019201))

(declare-fun b_lambda!17791 () Bool)

(assert (= b_lambda!17787 (or (and start!96754 b_free!23071) b_lambda!17791)))

(declare-fun b_lambda!17793 () Bool)

(assert (= b_lambda!17777 (or (and start!96754 b_free!23071) b_lambda!17793)))

(declare-fun b_lambda!17795 () Bool)

(assert (= b_lambda!17785 (or (and start!96754 b_free!23071) b_lambda!17795)))

(declare-fun b_lambda!17797 () Bool)

(assert (= b_lambda!17783 (or (and start!96754 b_free!23071) b_lambda!17797)))

(declare-fun b_lambda!17799 () Bool)

(assert (= b_lambda!17779 (or (and start!96754 b_free!23071) b_lambda!17799)))

(declare-fun b_lambda!17801 () Bool)

(assert (= b_lambda!17789 (or (and start!96754 b_free!23071) b_lambda!17801)))

(declare-fun b_lambda!17803 () Bool)

(assert (= b_lambda!17781 (or (and start!96754 b_free!23071) b_lambda!17803)))

(check-sat (not mapNonEmpty!42454) (not bm!45905) (not bm!45901) (not b!1099229) (not bm!45877) (not b!1099249) (not b!1099161) (not d!130799) (not b_next!23071) (not b!1099104) (not d!130797) (not b!1099238) (not b!1099204) (not d!130823) (not b!1099172) (not bm!45897) (not d!130825) (not b!1099106) (not b!1099254) (not b_lambda!17775) (not b!1099090) (not b!1099175) (not b!1099215) (not b!1099159) (not d!130821) (not b!1099091) (not bm!45915) (not b!1099250) (not b!1099109) (not b!1099255) (not b!1099242) (not bm!45911) (not b!1099253) (not b_lambda!17803) (not d!130827) (not b!1099230) (not bm!45881) (not b!1099107) (not bm!45902) (not b_lambda!17799) (not bm!45920) (not bm!45899) (not b!1099241) (not b!1099084) (not b!1099176) (not b!1099211) (not b_lambda!17801) (not b!1099087) (not b!1099078) (not b!1099225) (not b!1099207) (not bm!45918) (not bm!45917) (not b!1099251) tp_is_empty!27121 (not b!1099231) (not d!130831) (not b!1099164) (not d!130801) (not b!1099227) (not bm!45880) (not b!1099089) (not bm!45919) (not b!1099260) (not b!1099105) (not b_lambda!17793) (not b!1099163) (not b!1099086) (not b!1099262) (not b!1099088) (not b!1099209) (not d!130829) (not d!130803) (not b!1099076) (not d!130819) (not b!1099165) (not b_lambda!17791) (not b!1099224) (not b!1099116) (not b!1099213) (not bm!45910) (not b_lambda!17795) (not b!1099212) (not b!1099261) b_and!36853 (not b!1099085) (not b!1099246) (not b!1099257) (not b_lambda!17797) (not bm!45913) (not b!1099208))
(check-sat b_and!36853 (not b_next!23071))
