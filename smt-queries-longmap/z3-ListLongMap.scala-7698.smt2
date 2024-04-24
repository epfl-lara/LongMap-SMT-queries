; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96876 () Bool)

(assert start!96876)

(declare-fun b_free!23113 () Bool)

(declare-fun b_next!23113 () Bool)

(assert (=> start!96876 (= b_free!23113 (not b_next!23113))))

(declare-fun tp!81277 () Bool)

(declare-fun b_and!36955 () Bool)

(assert (=> start!96876 (= tp!81277 b_and!36955)))

(declare-fun b!1100503 () Bool)

(declare-fun e!628218 () Bool)

(declare-fun e!628216 () Bool)

(assert (=> b!1100503 (= e!628218 (not e!628216))))

(declare-fun res!734073 () Bool)

(assert (=> b!1100503 (=> res!734073 e!628216)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100503 (= res!734073 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41345 0))(
  ( (V!41346 (val!13638 Int)) )
))
(declare-fun minValue!831 () V!41345)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17342 0))(
  ( (tuple2!17343 (_1!8682 (_ BitVec 64)) (_2!8682 V!41345)) )
))
(declare-datatypes ((List!23963 0))(
  ( (Nil!23960) (Cons!23959 (h!25177 tuple2!17342) (t!34114 List!23963)) )
))
(declare-datatypes ((ListLongMap!15319 0))(
  ( (ListLongMap!15320 (toList!7675 List!23963)) )
))
(declare-fun lt!492629 () ListLongMap!15319)

(declare-fun zeroValue!831 () V!41345)

(declare-datatypes ((array!71275 0))(
  ( (array!71276 (arr!34299 (Array (_ BitVec 32) (_ BitVec 64))) (size!34836 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71275)

(declare-datatypes ((ValueCell!12872 0))(
  ( (ValueCellFull!12872 (v!16259 V!41345)) (EmptyCell!12872) )
))
(declare-datatypes ((array!71277 0))(
  ( (array!71278 (arr!34300 (Array (_ BitVec 32) ValueCell!12872)) (size!34837 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71277)

(declare-fun getCurrentListMap!4383 (array!71275 array!71277 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) Int) ListLongMap!15319)

(assert (=> b!1100503 (= lt!492629 (getCurrentListMap!4383 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492630 () array!71277)

(declare-fun lt!492626 () ListLongMap!15319)

(declare-fun lt!492632 () array!71275)

(assert (=> b!1100503 (= lt!492626 (getCurrentListMap!4383 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492628 () ListLongMap!15319)

(declare-fun lt!492625 () ListLongMap!15319)

(assert (=> b!1100503 (and (= lt!492628 lt!492625) (= lt!492625 lt!492628))))

(declare-fun lt!492631 () ListLongMap!15319)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!947 (ListLongMap!15319 (_ BitVec 64)) ListLongMap!15319)

(assert (=> b!1100503 (= lt!492625 (-!947 lt!492631 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36141 0))(
  ( (Unit!36142) )
))
(declare-fun lt!492627 () Unit!36141)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!217 (array!71275 array!71277 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36141)

(assert (=> b!1100503 (= lt!492627 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!217 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4224 (array!71275 array!71277 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) Int) ListLongMap!15319)

(assert (=> b!1100503 (= lt!492628 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2342 (Int (_ BitVec 64)) V!41345)

(assert (=> b!1100503 (= lt!492630 (array!71278 (store (arr!34300 _values!874) i!650 (ValueCellFull!12872 (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34837 _values!874)))))

(assert (=> b!1100503 (= lt!492631 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100503 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492624 () Unit!36141)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71275 (_ BitVec 64) (_ BitVec 32)) Unit!36141)

(assert (=> b!1100503 (= lt!492624 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100504 () Bool)

(declare-fun e!628217 () Bool)

(declare-fun tp_is_empty!27163 () Bool)

(assert (=> b!1100504 (= e!628217 tp_is_empty!27163)))

(declare-fun b!1100505 () Bool)

(declare-fun res!734069 () Bool)

(declare-fun e!628215 () Bool)

(assert (=> b!1100505 (=> (not res!734069) (not e!628215))))

(declare-datatypes ((List!23964 0))(
  ( (Nil!23961) (Cons!23960 (h!25178 (_ BitVec 64)) (t!34115 List!23964)) )
))
(declare-fun arrayNoDuplicates!0 (array!71275 (_ BitVec 32) List!23964) Bool)

(assert (=> b!1100505 (= res!734069 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23961))))

(declare-fun mapNonEmpty!42517 () Bool)

(declare-fun mapRes!42517 () Bool)

(declare-fun tp!81278 () Bool)

(assert (=> mapNonEmpty!42517 (= mapRes!42517 (and tp!81278 e!628217))))

(declare-fun mapRest!42517 () (Array (_ BitVec 32) ValueCell!12872))

(declare-fun mapValue!42517 () ValueCell!12872)

(declare-fun mapKey!42517 () (_ BitVec 32))

(assert (=> mapNonEmpty!42517 (= (arr!34300 _values!874) (store mapRest!42517 mapKey!42517 mapValue!42517))))

(declare-fun res!734078 () Bool)

(assert (=> start!96876 (=> (not res!734078) (not e!628215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96876 (= res!734078 (validMask!0 mask!1414))))

(assert (=> start!96876 e!628215))

(assert (=> start!96876 tp!81277))

(assert (=> start!96876 true))

(assert (=> start!96876 tp_is_empty!27163))

(declare-fun array_inv!26444 (array!71275) Bool)

(assert (=> start!96876 (array_inv!26444 _keys!1070)))

(declare-fun e!628213 () Bool)

(declare-fun array_inv!26445 (array!71277) Bool)

(assert (=> start!96876 (and (array_inv!26445 _values!874) e!628213)))

(declare-fun b!1100506 () Bool)

(assert (=> b!1100506 (= e!628215 e!628218)))

(declare-fun res!734075 () Bool)

(assert (=> b!1100506 (=> (not res!734075) (not e!628218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71275 (_ BitVec 32)) Bool)

(assert (=> b!1100506 (= res!734075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492632 mask!1414))))

(assert (=> b!1100506 (= lt!492632 (array!71276 (store (arr!34299 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34836 _keys!1070)))))

(declare-fun b!1100507 () Bool)

(declare-fun res!734070 () Bool)

(assert (=> b!1100507 (=> (not res!734070) (not e!628218))))

(assert (=> b!1100507 (= res!734070 (arrayNoDuplicates!0 lt!492632 #b00000000000000000000000000000000 Nil!23961))))

(declare-fun mapIsEmpty!42517 () Bool)

(assert (=> mapIsEmpty!42517 mapRes!42517))

(declare-fun b!1100508 () Bool)

(declare-fun res!734077 () Bool)

(assert (=> b!1100508 (=> (not res!734077) (not e!628215))))

(assert (=> b!1100508 (= res!734077 (and (= (size!34837 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34836 _keys!1070) (size!34837 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100509 () Bool)

(declare-fun res!734074 () Bool)

(assert (=> b!1100509 (=> (not res!734074) (not e!628215))))

(assert (=> b!1100509 (= res!734074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100510 () Bool)

(declare-fun res!734071 () Bool)

(assert (=> b!1100510 (=> (not res!734071) (not e!628215))))

(assert (=> b!1100510 (= res!734071 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34836 _keys!1070))))))

(declare-fun b!1100511 () Bool)

(declare-fun +!3408 (ListLongMap!15319 tuple2!17342) ListLongMap!15319)

(assert (=> b!1100511 (= e!628216 (= lt!492626 (+!3408 lt!492628 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun b!1100512 () Bool)

(declare-fun e!628214 () Bool)

(assert (=> b!1100512 (= e!628214 tp_is_empty!27163)))

(declare-fun b!1100513 () Bool)

(assert (=> b!1100513 (= e!628213 (and e!628214 mapRes!42517))))

(declare-fun condMapEmpty!42517 () Bool)

(declare-fun mapDefault!42517 () ValueCell!12872)

(assert (=> b!1100513 (= condMapEmpty!42517 (= (arr!34300 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12872)) mapDefault!42517)))))

(declare-fun b!1100514 () Bool)

(declare-fun res!734076 () Bool)

(assert (=> b!1100514 (=> (not res!734076) (not e!628215))))

(assert (=> b!1100514 (= res!734076 (= (select (arr!34299 _keys!1070) i!650) k0!904))))

(declare-fun b!1100515 () Bool)

(declare-fun res!734072 () Bool)

(assert (=> b!1100515 (=> (not res!734072) (not e!628215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100515 (= res!734072 (validKeyInArray!0 k0!904))))

(assert (= (and start!96876 res!734078) b!1100508))

(assert (= (and b!1100508 res!734077) b!1100509))

(assert (= (and b!1100509 res!734074) b!1100505))

(assert (= (and b!1100505 res!734069) b!1100510))

(assert (= (and b!1100510 res!734071) b!1100515))

(assert (= (and b!1100515 res!734072) b!1100514))

(assert (= (and b!1100514 res!734076) b!1100506))

(assert (= (and b!1100506 res!734075) b!1100507))

(assert (= (and b!1100507 res!734070) b!1100503))

(assert (= (and b!1100503 (not res!734073)) b!1100511))

(assert (= (and b!1100513 condMapEmpty!42517) mapIsEmpty!42517))

(assert (= (and b!1100513 (not condMapEmpty!42517)) mapNonEmpty!42517))

(get-info :version)

(assert (= (and mapNonEmpty!42517 ((_ is ValueCellFull!12872) mapValue!42517)) b!1100504))

(assert (= (and b!1100513 ((_ is ValueCellFull!12872) mapDefault!42517)) b!1100512))

(assert (= start!96876 b!1100513))

(declare-fun b_lambda!17901 () Bool)

(assert (=> (not b_lambda!17901) (not b!1100503)))

(declare-fun t!34113 () Bool)

(declare-fun tb!7971 () Bool)

(assert (=> (and start!96876 (= defaultEntry!882 defaultEntry!882) t!34113) tb!7971))

(declare-fun result!16481 () Bool)

(assert (=> tb!7971 (= result!16481 tp_is_empty!27163)))

(assert (=> b!1100503 t!34113))

(declare-fun b_and!36957 () Bool)

(assert (= b_and!36955 (and (=> t!34113 result!16481) b_and!36957)))

(declare-fun m!1020815 () Bool)

(assert (=> mapNonEmpty!42517 m!1020815))

(declare-fun m!1020817 () Bool)

(assert (=> b!1100511 m!1020817))

(declare-fun m!1020819 () Bool)

(assert (=> b!1100514 m!1020819))

(declare-fun m!1020821 () Bool)

(assert (=> start!96876 m!1020821))

(declare-fun m!1020823 () Bool)

(assert (=> start!96876 m!1020823))

(declare-fun m!1020825 () Bool)

(assert (=> start!96876 m!1020825))

(declare-fun m!1020827 () Bool)

(assert (=> b!1100503 m!1020827))

(declare-fun m!1020829 () Bool)

(assert (=> b!1100503 m!1020829))

(declare-fun m!1020831 () Bool)

(assert (=> b!1100503 m!1020831))

(declare-fun m!1020833 () Bool)

(assert (=> b!1100503 m!1020833))

(declare-fun m!1020835 () Bool)

(assert (=> b!1100503 m!1020835))

(declare-fun m!1020837 () Bool)

(assert (=> b!1100503 m!1020837))

(declare-fun m!1020839 () Bool)

(assert (=> b!1100503 m!1020839))

(declare-fun m!1020841 () Bool)

(assert (=> b!1100503 m!1020841))

(declare-fun m!1020843 () Bool)

(assert (=> b!1100503 m!1020843))

(declare-fun m!1020845 () Bool)

(assert (=> b!1100503 m!1020845))

(declare-fun m!1020847 () Bool)

(assert (=> b!1100505 m!1020847))

(declare-fun m!1020849 () Bool)

(assert (=> b!1100509 m!1020849))

(declare-fun m!1020851 () Bool)

(assert (=> b!1100506 m!1020851))

(declare-fun m!1020853 () Bool)

(assert (=> b!1100506 m!1020853))

(declare-fun m!1020855 () Bool)

(assert (=> b!1100507 m!1020855))

(declare-fun m!1020857 () Bool)

(assert (=> b!1100515 m!1020857))

(check-sat tp_is_empty!27163 (not b_lambda!17901) (not b_next!23113) (not b!1100503) (not b!1100509) (not start!96876) (not b!1100505) (not mapNonEmpty!42517) (not b!1100506) (not b!1100515) (not b!1100511) (not b!1100507) b_and!36957)
(check-sat b_and!36957 (not b_next!23113))
(get-model)

(declare-fun b_lambda!17907 () Bool)

(assert (= b_lambda!17901 (or (and start!96876 b_free!23113) b_lambda!17907)))

(check-sat tp_is_empty!27163 (not b_next!23113) (not b!1100503) (not b!1100509) (not start!96876) (not b!1100505) (not b!1100506) (not b!1100515) (not b!1100511) (not b!1100507) b_and!36957 (not mapNonEmpty!42517) (not b_lambda!17907))
(check-sat b_and!36957 (not b_next!23113))
(get-model)

(declare-fun d!130941 () Bool)

(assert (=> d!130941 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100515 d!130941))

(declare-fun d!130943 () Bool)

(assert (=> d!130943 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96876 d!130943))

(declare-fun d!130945 () Bool)

(assert (=> d!130945 (= (array_inv!26444 _keys!1070) (bvsge (size!34836 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96876 d!130945))

(declare-fun d!130947 () Bool)

(assert (=> d!130947 (= (array_inv!26445 _values!874) (bvsge (size!34837 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96876 d!130947))

(declare-fun d!130949 () Bool)

(declare-fun res!734143 () Bool)

(declare-fun e!628268 () Bool)

(assert (=> d!130949 (=> res!734143 e!628268)))

(assert (=> d!130949 (= res!734143 (bvsge #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(assert (=> d!130949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492632 mask!1414) e!628268)))

(declare-fun b!1100608 () Bool)

(declare-fun e!628267 () Bool)

(declare-fun call!46018 () Bool)

(assert (=> b!1100608 (= e!628267 call!46018)))

(declare-fun b!1100609 () Bool)

(declare-fun e!628269 () Bool)

(assert (=> b!1100609 (= e!628267 e!628269)))

(declare-fun lt!492693 () (_ BitVec 64))

(assert (=> b!1100609 (= lt!492693 (select (arr!34299 lt!492632) #b00000000000000000000000000000000))))

(declare-fun lt!492694 () Unit!36141)

(assert (=> b!1100609 (= lt!492694 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!492632 lt!492693 #b00000000000000000000000000000000))))

(assert (=> b!1100609 (arrayContainsKey!0 lt!492632 lt!492693 #b00000000000000000000000000000000)))

(declare-fun lt!492695 () Unit!36141)

(assert (=> b!1100609 (= lt!492695 lt!492694)))

(declare-fun res!734144 () Bool)

(declare-datatypes ((SeekEntryResult!9866 0))(
  ( (MissingZero!9866 (index!41835 (_ BitVec 32))) (Found!9866 (index!41836 (_ BitVec 32))) (Intermediate!9866 (undefined!10678 Bool) (index!41837 (_ BitVec 32)) (x!98848 (_ BitVec 32))) (Undefined!9866) (MissingVacant!9866 (index!41838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71275 (_ BitVec 32)) SeekEntryResult!9866)

(assert (=> b!1100609 (= res!734144 (= (seekEntryOrOpen!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000) lt!492632 mask!1414) (Found!9866 #b00000000000000000000000000000000)))))

(assert (=> b!1100609 (=> (not res!734144) (not e!628269))))

(declare-fun b!1100610 () Bool)

(assert (=> b!1100610 (= e!628269 call!46018)))

(declare-fun bm!46015 () Bool)

(assert (=> bm!46015 (= call!46018 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!492632 mask!1414))))

(declare-fun b!1100611 () Bool)

(assert (=> b!1100611 (= e!628268 e!628267)))

(declare-fun c!108975 () Bool)

(assert (=> b!1100611 (= c!108975 (validKeyInArray!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(assert (= (and d!130949 (not res!734143)) b!1100611))

(assert (= (and b!1100611 c!108975) b!1100609))

(assert (= (and b!1100611 (not c!108975)) b!1100608))

(assert (= (and b!1100609 res!734144) b!1100610))

(assert (= (or b!1100610 b!1100608) bm!46015))

(declare-fun m!1020947 () Bool)

(assert (=> b!1100609 m!1020947))

(declare-fun m!1020949 () Bool)

(assert (=> b!1100609 m!1020949))

(declare-fun m!1020951 () Bool)

(assert (=> b!1100609 m!1020951))

(assert (=> b!1100609 m!1020947))

(declare-fun m!1020953 () Bool)

(assert (=> b!1100609 m!1020953))

(declare-fun m!1020955 () Bool)

(assert (=> bm!46015 m!1020955))

(assert (=> b!1100611 m!1020947))

(assert (=> b!1100611 m!1020947))

(declare-fun m!1020957 () Bool)

(assert (=> b!1100611 m!1020957))

(assert (=> b!1100506 d!130949))

(declare-fun d!130951 () Bool)

(declare-fun e!628272 () Bool)

(assert (=> d!130951 e!628272))

(declare-fun res!734150 () Bool)

(assert (=> d!130951 (=> (not res!734150) (not e!628272))))

(declare-fun lt!492705 () ListLongMap!15319)

(declare-fun contains!6413 (ListLongMap!15319 (_ BitVec 64)) Bool)

(assert (=> d!130951 (= res!734150 (contains!6413 lt!492705 (_1!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lt!492706 () List!23963)

(assert (=> d!130951 (= lt!492705 (ListLongMap!15320 lt!492706))))

(declare-fun lt!492704 () Unit!36141)

(declare-fun lt!492707 () Unit!36141)

(assert (=> d!130951 (= lt!492704 lt!492707)))

(declare-datatypes ((Option!669 0))(
  ( (Some!668 (v!16262 V!41345)) (None!667) )
))
(declare-fun getValueByKey!618 (List!23963 (_ BitVec 64)) Option!669)

(assert (=> d!130951 (= (getValueByKey!618 lt!492706 (_1!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!668 (_2!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!300 (List!23963 (_ BitVec 64) V!41345) Unit!36141)

(assert (=> d!130951 (= lt!492707 (lemmaContainsTupThenGetReturnValue!300 lt!492706 (_1!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun insertStrictlySorted!393 (List!23963 (_ BitVec 64) V!41345) List!23963)

(assert (=> d!130951 (= lt!492706 (insertStrictlySorted!393 (toList!7675 lt!492628) (_1!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130951 (= (+!3408 lt!492628 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) lt!492705)))

(declare-fun b!1100616 () Bool)

(declare-fun res!734149 () Bool)

(assert (=> b!1100616 (=> (not res!734149) (not e!628272))))

(assert (=> b!1100616 (= res!734149 (= (getValueByKey!618 (toList!7675 lt!492705) (_1!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!668 (_2!8682 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))))

(declare-fun b!1100617 () Bool)

(declare-fun contains!6414 (List!23963 tuple2!17342) Bool)

(assert (=> b!1100617 (= e!628272 (contains!6414 (toList!7675 lt!492705) (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(assert (= (and d!130951 res!734150) b!1100616))

(assert (= (and b!1100616 res!734149) b!1100617))

(declare-fun m!1020959 () Bool)

(assert (=> d!130951 m!1020959))

(declare-fun m!1020961 () Bool)

(assert (=> d!130951 m!1020961))

(declare-fun m!1020963 () Bool)

(assert (=> d!130951 m!1020963))

(declare-fun m!1020965 () Bool)

(assert (=> d!130951 m!1020965))

(declare-fun m!1020967 () Bool)

(assert (=> b!1100616 m!1020967))

(declare-fun m!1020969 () Bool)

(assert (=> b!1100617 m!1020969))

(assert (=> b!1100511 d!130951))

(declare-fun b!1100629 () Bool)

(declare-fun e!628281 () Bool)

(declare-fun call!46021 () Bool)

(assert (=> b!1100629 (= e!628281 call!46021)))

(declare-fun b!1100630 () Bool)

(declare-fun e!628283 () Bool)

(assert (=> b!1100630 (= e!628283 e!628281)))

(declare-fun c!108978 () Bool)

(assert (=> b!1100630 (= c!108978 (validKeyInArray!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(declare-fun b!1100631 () Bool)

(declare-fun e!628282 () Bool)

(declare-fun contains!6415 (List!23964 (_ BitVec 64)) Bool)

(assert (=> b!1100631 (= e!628282 (contains!6415 Nil!23961 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(declare-fun b!1100628 () Bool)

(declare-fun e!628284 () Bool)

(assert (=> b!1100628 (= e!628284 e!628283)))

(declare-fun res!734158 () Bool)

(assert (=> b!1100628 (=> (not res!734158) (not e!628283))))

(assert (=> b!1100628 (= res!734158 (not e!628282))))

(declare-fun res!734157 () Bool)

(assert (=> b!1100628 (=> (not res!734157) (not e!628282))))

(assert (=> b!1100628 (= res!734157 (validKeyInArray!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(declare-fun d!130953 () Bool)

(declare-fun res!734159 () Bool)

(assert (=> d!130953 (=> res!734159 e!628284)))

(assert (=> d!130953 (= res!734159 (bvsge #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(assert (=> d!130953 (= (arrayNoDuplicates!0 lt!492632 #b00000000000000000000000000000000 Nil!23961) e!628284)))

(declare-fun bm!46018 () Bool)

(assert (=> bm!46018 (= call!46021 (arrayNoDuplicates!0 lt!492632 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108978 (Cons!23960 (select (arr!34299 lt!492632) #b00000000000000000000000000000000) Nil!23961) Nil!23961)))))

(declare-fun b!1100632 () Bool)

(assert (=> b!1100632 (= e!628281 call!46021)))

(assert (= (and d!130953 (not res!734159)) b!1100628))

(assert (= (and b!1100628 res!734157) b!1100631))

(assert (= (and b!1100628 res!734158) b!1100630))

(assert (= (and b!1100630 c!108978) b!1100629))

(assert (= (and b!1100630 (not c!108978)) b!1100632))

(assert (= (or b!1100629 b!1100632) bm!46018))

(assert (=> b!1100630 m!1020947))

(assert (=> b!1100630 m!1020947))

(assert (=> b!1100630 m!1020957))

(assert (=> b!1100631 m!1020947))

(assert (=> b!1100631 m!1020947))

(declare-fun m!1020971 () Bool)

(assert (=> b!1100631 m!1020971))

(assert (=> b!1100628 m!1020947))

(assert (=> b!1100628 m!1020947))

(assert (=> b!1100628 m!1020957))

(assert (=> bm!46018 m!1020947))

(declare-fun m!1020973 () Bool)

(assert (=> bm!46018 m!1020973))

(assert (=> b!1100507 d!130953))

(declare-fun d!130955 () Bool)

(declare-fun res!734164 () Bool)

(declare-fun e!628289 () Bool)

(assert (=> d!130955 (=> res!734164 e!628289)))

(assert (=> d!130955 (= res!734164 (= (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130955 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628289)))

(declare-fun b!1100637 () Bool)

(declare-fun e!628290 () Bool)

(assert (=> b!1100637 (= e!628289 e!628290)))

(declare-fun res!734165 () Bool)

(assert (=> b!1100637 (=> (not res!734165) (not e!628290))))

(assert (=> b!1100637 (= res!734165 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34836 _keys!1070)))))

(declare-fun b!1100638 () Bool)

(assert (=> b!1100638 (= e!628290 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130955 (not res!734164)) b!1100637))

(assert (= (and b!1100637 res!734165) b!1100638))

(declare-fun m!1020975 () Bool)

(assert (=> d!130955 m!1020975))

(declare-fun m!1020977 () Bool)

(assert (=> b!1100638 m!1020977))

(assert (=> b!1100503 d!130955))

(declare-fun b!1100681 () Bool)

(declare-fun res!734188 () Bool)

(declare-fun e!628324 () Bool)

(assert (=> b!1100681 (=> (not res!734188) (not e!628324))))

(declare-fun e!628325 () Bool)

(assert (=> b!1100681 (= res!734188 e!628325)))

(declare-fun res!734192 () Bool)

(assert (=> b!1100681 (=> res!734192 e!628325)))

(declare-fun e!628317 () Bool)

(assert (=> b!1100681 (= res!734192 (not e!628317))))

(declare-fun res!734187 () Bool)

(assert (=> b!1100681 (=> (not res!734187) (not e!628317))))

(assert (=> b!1100681 (= res!734187 (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(declare-fun bm!46033 () Bool)

(declare-fun call!46037 () ListLongMap!15319)

(declare-fun call!46040 () ListLongMap!15319)

(assert (=> bm!46033 (= call!46037 call!46040)))

(declare-fun bm!46034 () Bool)

(declare-fun call!46042 () Bool)

(declare-fun lt!492772 () ListLongMap!15319)

(assert (=> bm!46034 (= call!46042 (contains!6413 lt!492772 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100682 () Bool)

(declare-fun res!734184 () Bool)

(assert (=> b!1100682 (=> (not res!734184) (not e!628324))))

(declare-fun e!628326 () Bool)

(assert (=> b!1100682 (= res!734184 e!628326)))

(declare-fun c!108994 () Bool)

(assert (=> b!1100682 (= c!108994 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!46035 () Bool)

(declare-fun call!46039 () Bool)

(assert (=> bm!46035 (= call!46039 (contains!6413 lt!492772 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!130957 () Bool)

(assert (=> d!130957 e!628324))

(declare-fun res!734185 () Bool)

(assert (=> d!130957 (=> (not res!734185) (not e!628324))))

(assert (=> d!130957 (= res!734185 (or (bvsge #b00000000000000000000000000000000 (size!34836 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))))

(declare-fun lt!492773 () ListLongMap!15319)

(assert (=> d!130957 (= lt!492772 lt!492773)))

(declare-fun lt!492755 () Unit!36141)

(declare-fun e!628328 () Unit!36141)

(assert (=> d!130957 (= lt!492755 e!628328)))

(declare-fun c!108992 () Bool)

(declare-fun e!628323 () Bool)

(assert (=> d!130957 (= c!108992 e!628323)))

(declare-fun res!734186 () Bool)

(assert (=> d!130957 (=> (not res!734186) (not e!628323))))

(assert (=> d!130957 (= res!734186 (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(declare-fun e!628329 () ListLongMap!15319)

(assert (=> d!130957 (= lt!492773 e!628329)))

(declare-fun c!108991 () Bool)

(assert (=> d!130957 (= c!108991 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130957 (validMask!0 mask!1414)))

(assert (=> d!130957 (= (getCurrentListMap!4383 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492772)))

(declare-fun b!1100683 () Bool)

(assert (=> b!1100683 (= e!628317 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100684 () Bool)

(declare-fun c!108993 () Bool)

(assert (=> b!1100684 (= c!108993 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628319 () ListLongMap!15319)

(declare-fun e!628322 () ListLongMap!15319)

(assert (=> b!1100684 (= e!628319 e!628322)))

(declare-fun b!1100685 () Bool)

(declare-fun Unit!36145 () Unit!36141)

(assert (=> b!1100685 (= e!628328 Unit!36145)))

(declare-fun b!1100686 () Bool)

(declare-fun e!628327 () Bool)

(declare-fun apply!956 (ListLongMap!15319 (_ BitVec 64)) V!41345)

(assert (=> b!1100686 (= e!628327 (= (apply!956 lt!492772 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100687 () Bool)

(declare-fun e!628318 () Bool)

(assert (=> b!1100687 (= e!628318 (= (apply!956 lt!492772 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1100688 () Bool)

(assert (=> b!1100688 (= e!628323 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100689 () Bool)

(assert (=> b!1100689 (= e!628326 e!628327)))

(declare-fun res!734189 () Bool)

(assert (=> b!1100689 (= res!734189 call!46039)))

(assert (=> b!1100689 (=> (not res!734189) (not e!628327))))

(declare-fun b!1100690 () Bool)

(declare-fun call!46041 () ListLongMap!15319)

(assert (=> b!1100690 (= e!628322 call!46041)))

(declare-fun b!1100691 () Bool)

(declare-fun e!628320 () Bool)

(assert (=> b!1100691 (= e!628320 (not call!46042))))

(declare-fun bm!46036 () Bool)

(declare-fun call!46036 () ListLongMap!15319)

(assert (=> bm!46036 (= call!46041 call!46036)))

(declare-fun b!1100692 () Bool)

(declare-fun e!628321 () Bool)

(assert (=> b!1100692 (= e!628325 e!628321)))

(declare-fun res!734191 () Bool)

(assert (=> b!1100692 (=> (not res!734191) (not e!628321))))

(assert (=> b!1100692 (= res!734191 (contains!6413 lt!492772 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100692 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(declare-fun b!1100693 () Bool)

(declare-fun lt!492765 () Unit!36141)

(assert (=> b!1100693 (= e!628328 lt!492765)))

(declare-fun lt!492771 () ListLongMap!15319)

(assert (=> b!1100693 (= lt!492771 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492764 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492752 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492752 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492759 () Unit!36141)

(declare-fun addStillContains!660 (ListLongMap!15319 (_ BitVec 64) V!41345 (_ BitVec 64)) Unit!36141)

(assert (=> b!1100693 (= lt!492759 (addStillContains!660 lt!492771 lt!492764 zeroValue!831 lt!492752))))

(assert (=> b!1100693 (contains!6413 (+!3408 lt!492771 (tuple2!17343 lt!492764 zeroValue!831)) lt!492752)))

(declare-fun lt!492754 () Unit!36141)

(assert (=> b!1100693 (= lt!492754 lt!492759)))

(declare-fun lt!492756 () ListLongMap!15319)

(assert (=> b!1100693 (= lt!492756 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492770 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492770 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492766 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492766 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492762 () Unit!36141)

(declare-fun addApplyDifferent!516 (ListLongMap!15319 (_ BitVec 64) V!41345 (_ BitVec 64)) Unit!36141)

(assert (=> b!1100693 (= lt!492762 (addApplyDifferent!516 lt!492756 lt!492770 minValue!831 lt!492766))))

(assert (=> b!1100693 (= (apply!956 (+!3408 lt!492756 (tuple2!17343 lt!492770 minValue!831)) lt!492766) (apply!956 lt!492756 lt!492766))))

(declare-fun lt!492761 () Unit!36141)

(assert (=> b!1100693 (= lt!492761 lt!492762)))

(declare-fun lt!492760 () ListLongMap!15319)

(assert (=> b!1100693 (= lt!492760 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492763 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492769 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492769 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492767 () Unit!36141)

(assert (=> b!1100693 (= lt!492767 (addApplyDifferent!516 lt!492760 lt!492763 zeroValue!831 lt!492769))))

(assert (=> b!1100693 (= (apply!956 (+!3408 lt!492760 (tuple2!17343 lt!492763 zeroValue!831)) lt!492769) (apply!956 lt!492760 lt!492769))))

(declare-fun lt!492753 () Unit!36141)

(assert (=> b!1100693 (= lt!492753 lt!492767)))

(declare-fun lt!492768 () ListLongMap!15319)

(assert (=> b!1100693 (= lt!492768 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492757 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492757 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492758 () (_ BitVec 64))

(assert (=> b!1100693 (= lt!492758 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100693 (= lt!492765 (addApplyDifferent!516 lt!492768 lt!492757 minValue!831 lt!492758))))

(assert (=> b!1100693 (= (apply!956 (+!3408 lt!492768 (tuple2!17343 lt!492757 minValue!831)) lt!492758) (apply!956 lt!492768 lt!492758))))

(declare-fun b!1100694 () Bool)

(assert (=> b!1100694 (= e!628319 call!46041)))

(declare-fun b!1100695 () Bool)

(assert (=> b!1100695 (= e!628320 e!628318)))

(declare-fun res!734190 () Bool)

(assert (=> b!1100695 (= res!734190 call!46042)))

(assert (=> b!1100695 (=> (not res!734190) (not e!628318))))

(declare-fun b!1100696 () Bool)

(assert (=> b!1100696 (= e!628324 e!628320)))

(declare-fun c!108995 () Bool)

(assert (=> b!1100696 (= c!108995 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100697 () Bool)

(assert (=> b!1100697 (= e!628329 e!628319)))

(declare-fun c!108996 () Bool)

(assert (=> b!1100697 (= c!108996 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100698 () Bool)

(assert (=> b!1100698 (= e!628329 (+!3408 call!46036 (tuple2!17343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!46037 () Bool)

(declare-fun call!46038 () ListLongMap!15319)

(assert (=> bm!46037 (= call!46038 call!46037)))

(declare-fun b!1100699 () Bool)

(declare-fun get!17660 (ValueCell!12872 V!41345) V!41345)

(assert (=> b!1100699 (= e!628321 (= (apply!956 lt!492772 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)) (get!17660 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100699 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 _values!874)))))

(assert (=> b!1100699 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(declare-fun b!1100700 () Bool)

(assert (=> b!1100700 (= e!628326 (not call!46039))))

(declare-fun b!1100701 () Bool)

(assert (=> b!1100701 (= e!628322 call!46038)))

(declare-fun bm!46038 () Bool)

(assert (=> bm!46038 (= call!46040 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46039 () Bool)

(assert (=> bm!46039 (= call!46036 (+!3408 (ite c!108991 call!46040 (ite c!108996 call!46037 call!46038)) (ite (or c!108991 c!108996) (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (= (and d!130957 c!108991) b!1100698))

(assert (= (and d!130957 (not c!108991)) b!1100697))

(assert (= (and b!1100697 c!108996) b!1100694))

(assert (= (and b!1100697 (not c!108996)) b!1100684))

(assert (= (and b!1100684 c!108993) b!1100690))

(assert (= (and b!1100684 (not c!108993)) b!1100701))

(assert (= (or b!1100690 b!1100701) bm!46037))

(assert (= (or b!1100694 bm!46037) bm!46033))

(assert (= (or b!1100694 b!1100690) bm!46036))

(assert (= (or b!1100698 bm!46033) bm!46038))

(assert (= (or b!1100698 bm!46036) bm!46039))

(assert (= (and d!130957 res!734186) b!1100688))

(assert (= (and d!130957 c!108992) b!1100693))

(assert (= (and d!130957 (not c!108992)) b!1100685))

(assert (= (and d!130957 res!734185) b!1100681))

(assert (= (and b!1100681 res!734187) b!1100683))

(assert (= (and b!1100681 (not res!734192)) b!1100692))

(assert (= (and b!1100692 res!734191) b!1100699))

(assert (= (and b!1100681 res!734188) b!1100682))

(assert (= (and b!1100682 c!108994) b!1100689))

(assert (= (and b!1100682 (not c!108994)) b!1100700))

(assert (= (and b!1100689 res!734189) b!1100686))

(assert (= (or b!1100689 b!1100700) bm!46035))

(assert (= (and b!1100682 res!734184) b!1100696))

(assert (= (and b!1100696 c!108995) b!1100695))

(assert (= (and b!1100696 (not c!108995)) b!1100691))

(assert (= (and b!1100695 res!734190) b!1100687))

(assert (= (or b!1100695 b!1100691) bm!46034))

(declare-fun b_lambda!17909 () Bool)

(assert (=> (not b_lambda!17909) (not b!1100699)))

(assert (=> b!1100699 t!34113))

(declare-fun b_and!36967 () Bool)

(assert (= b_and!36957 (and (=> t!34113 result!16481) b_and!36967)))

(assert (=> b!1100683 m!1020975))

(assert (=> b!1100683 m!1020975))

(declare-fun m!1020979 () Bool)

(assert (=> b!1100683 m!1020979))

(assert (=> d!130957 m!1020821))

(declare-fun m!1020981 () Bool)

(assert (=> bm!46035 m!1020981))

(declare-fun m!1020983 () Bool)

(assert (=> bm!46039 m!1020983))

(assert (=> b!1100692 m!1020975))

(assert (=> b!1100692 m!1020975))

(declare-fun m!1020985 () Bool)

(assert (=> b!1100692 m!1020985))

(declare-fun m!1020987 () Bool)

(assert (=> bm!46034 m!1020987))

(declare-fun m!1020989 () Bool)

(assert (=> b!1100686 m!1020989))

(assert (=> b!1100699 m!1020975))

(assert (=> b!1100699 m!1020975))

(declare-fun m!1020991 () Bool)

(assert (=> b!1100699 m!1020991))

(assert (=> b!1100699 m!1020827))

(declare-fun m!1020993 () Bool)

(assert (=> b!1100699 m!1020993))

(assert (=> b!1100699 m!1020827))

(declare-fun m!1020995 () Bool)

(assert (=> b!1100699 m!1020995))

(assert (=> b!1100699 m!1020993))

(declare-fun m!1020997 () Bool)

(assert (=> b!1100687 m!1020997))

(declare-fun m!1020999 () Bool)

(assert (=> b!1100698 m!1020999))

(assert (=> bm!46038 m!1020837))

(declare-fun m!1021001 () Bool)

(assert (=> b!1100693 m!1021001))

(declare-fun m!1021003 () Bool)

(assert (=> b!1100693 m!1021003))

(declare-fun m!1021005 () Bool)

(assert (=> b!1100693 m!1021005))

(declare-fun m!1021007 () Bool)

(assert (=> b!1100693 m!1021007))

(declare-fun m!1021009 () Bool)

(assert (=> b!1100693 m!1021009))

(assert (=> b!1100693 m!1021009))

(declare-fun m!1021011 () Bool)

(assert (=> b!1100693 m!1021011))

(declare-fun m!1021013 () Bool)

(assert (=> b!1100693 m!1021013))

(declare-fun m!1021015 () Bool)

(assert (=> b!1100693 m!1021015))

(declare-fun m!1021017 () Bool)

(assert (=> b!1100693 m!1021017))

(declare-fun m!1021019 () Bool)

(assert (=> b!1100693 m!1021019))

(declare-fun m!1021021 () Bool)

(assert (=> b!1100693 m!1021021))

(assert (=> b!1100693 m!1021013))

(assert (=> b!1100693 m!1021001))

(declare-fun m!1021023 () Bool)

(assert (=> b!1100693 m!1021023))

(declare-fun m!1021025 () Bool)

(assert (=> b!1100693 m!1021025))

(assert (=> b!1100693 m!1020975))

(declare-fun m!1021027 () Bool)

(assert (=> b!1100693 m!1021027))

(assert (=> b!1100693 m!1021021))

(declare-fun m!1021029 () Bool)

(assert (=> b!1100693 m!1021029))

(assert (=> b!1100693 m!1020837))

(assert (=> b!1100688 m!1020975))

(assert (=> b!1100688 m!1020975))

(assert (=> b!1100688 m!1020979))

(assert (=> b!1100503 d!130957))

(declare-fun d!130959 () Bool)

(declare-fun lt!492776 () ListLongMap!15319)

(assert (=> d!130959 (not (contains!6413 lt!492776 k0!904))))

(declare-fun removeStrictlySorted!80 (List!23963 (_ BitVec 64)) List!23963)

(assert (=> d!130959 (= lt!492776 (ListLongMap!15320 (removeStrictlySorted!80 (toList!7675 lt!492631) k0!904)))))

(assert (=> d!130959 (= (-!947 lt!492631 k0!904) lt!492776)))

(declare-fun bs!32308 () Bool)

(assert (= bs!32308 d!130959))

(declare-fun m!1021031 () Bool)

(assert (=> bs!32308 m!1021031))

(declare-fun m!1021033 () Bool)

(assert (=> bs!32308 m!1021033))

(assert (=> b!1100503 d!130959))

(declare-fun call!46047 () ListLongMap!15319)

(declare-fun bm!46044 () Bool)

(assert (=> bm!46044 (= call!46047 (getCurrentListMapNoExtraKeys!4224 (array!71276 (store (arr!34299 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34836 _keys!1070)) (array!71278 (store (arr!34300 _values!874) i!650 (ValueCellFull!12872 (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34837 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100708 () Bool)

(declare-fun e!628334 () Bool)

(declare-fun call!46048 () ListLongMap!15319)

(assert (=> b!1100708 (= e!628334 (= call!46047 call!46048))))

(assert (=> b!1100708 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34837 _values!874)))))

(declare-fun b!1100709 () Bool)

(declare-fun e!628335 () Bool)

(assert (=> b!1100709 (= e!628335 e!628334)))

(declare-fun c!108999 () Bool)

(assert (=> b!1100709 (= c!108999 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun bm!46045 () Bool)

(assert (=> bm!46045 (= call!46048 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100710 () Bool)

(assert (=> b!1100710 (= e!628334 (= call!46047 (-!947 call!46048 k0!904)))))

(assert (=> b!1100710 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34837 _values!874)))))

(declare-fun d!130961 () Bool)

(assert (=> d!130961 e!628335))

(declare-fun res!734195 () Bool)

(assert (=> d!130961 (=> (not res!734195) (not e!628335))))

(assert (=> d!130961 (= res!734195 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34836 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34836 _keys!1070))))))))

(declare-fun lt!492779 () Unit!36141)

(declare-fun choose!1771 (array!71275 array!71277 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36141)

(assert (=> d!130961 (= lt!492779 (choose!1771 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(assert (=> d!130961 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!217 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492779)))

(assert (= (and d!130961 res!734195) b!1100709))

(assert (= (and b!1100709 c!108999) b!1100710))

(assert (= (and b!1100709 (not c!108999)) b!1100708))

(assert (= (or b!1100710 b!1100708) bm!46045))

(assert (= (or b!1100710 b!1100708) bm!46044))

(declare-fun b_lambda!17911 () Bool)

(assert (=> (not b_lambda!17911) (not bm!46044)))

(assert (=> bm!46044 t!34113))

(declare-fun b_and!36969 () Bool)

(assert (= b_and!36967 (and (=> t!34113 result!16481) b_and!36969)))

(assert (=> bm!46044 m!1020853))

(assert (=> bm!46044 m!1020827))

(assert (=> bm!46044 m!1020831))

(declare-fun m!1021035 () Bool)

(assert (=> bm!46044 m!1021035))

(assert (=> bm!46045 m!1020837))

(declare-fun m!1021037 () Bool)

(assert (=> b!1100710 m!1021037))

(declare-fun m!1021039 () Bool)

(assert (=> d!130961 m!1021039))

(assert (=> b!1100503 d!130961))

(declare-fun b!1100711 () Bool)

(declare-fun res!734200 () Bool)

(declare-fun e!628343 () Bool)

(assert (=> b!1100711 (=> (not res!734200) (not e!628343))))

(declare-fun e!628344 () Bool)

(assert (=> b!1100711 (= res!734200 e!628344)))

(declare-fun res!734204 () Bool)

(assert (=> b!1100711 (=> res!734204 e!628344)))

(declare-fun e!628336 () Bool)

(assert (=> b!1100711 (= res!734204 (not e!628336))))

(declare-fun res!734199 () Bool)

(assert (=> b!1100711 (=> (not res!734199) (not e!628336))))

(assert (=> b!1100711 (= res!734199 (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(declare-fun bm!46046 () Bool)

(declare-fun call!46050 () ListLongMap!15319)

(declare-fun call!46053 () ListLongMap!15319)

(assert (=> bm!46046 (= call!46050 call!46053)))

(declare-fun bm!46047 () Bool)

(declare-fun call!46055 () Bool)

(declare-fun lt!492800 () ListLongMap!15319)

(assert (=> bm!46047 (= call!46055 (contains!6413 lt!492800 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100712 () Bool)

(declare-fun res!734196 () Bool)

(assert (=> b!1100712 (=> (not res!734196) (not e!628343))))

(declare-fun e!628345 () Bool)

(assert (=> b!1100712 (= res!734196 e!628345)))

(declare-fun c!109003 () Bool)

(assert (=> b!1100712 (= c!109003 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!46048 () Bool)

(declare-fun call!46052 () Bool)

(assert (=> bm!46048 (= call!46052 (contains!6413 lt!492800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!130963 () Bool)

(assert (=> d!130963 e!628343))

(declare-fun res!734197 () Bool)

(assert (=> d!130963 (=> (not res!734197) (not e!628343))))

(assert (=> d!130963 (= res!734197 (or (bvsge #b00000000000000000000000000000000 (size!34836 lt!492632)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))))

(declare-fun lt!492801 () ListLongMap!15319)

(assert (=> d!130963 (= lt!492800 lt!492801)))

(declare-fun lt!492783 () Unit!36141)

(declare-fun e!628347 () Unit!36141)

(assert (=> d!130963 (= lt!492783 e!628347)))

(declare-fun c!109001 () Bool)

(declare-fun e!628342 () Bool)

(assert (=> d!130963 (= c!109001 e!628342)))

(declare-fun res!734198 () Bool)

(assert (=> d!130963 (=> (not res!734198) (not e!628342))))

(assert (=> d!130963 (= res!734198 (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(declare-fun e!628348 () ListLongMap!15319)

(assert (=> d!130963 (= lt!492801 e!628348)))

(declare-fun c!109000 () Bool)

(assert (=> d!130963 (= c!109000 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130963 (validMask!0 mask!1414)))

(assert (=> d!130963 (= (getCurrentListMap!4383 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492800)))

(declare-fun b!1100713 () Bool)

(assert (=> b!1100713 (= e!628336 (validKeyInArray!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(declare-fun b!1100714 () Bool)

(declare-fun c!109002 () Bool)

(assert (=> b!1100714 (= c!109002 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628338 () ListLongMap!15319)

(declare-fun e!628341 () ListLongMap!15319)

(assert (=> b!1100714 (= e!628338 e!628341)))

(declare-fun b!1100715 () Bool)

(declare-fun Unit!36146 () Unit!36141)

(assert (=> b!1100715 (= e!628347 Unit!36146)))

(declare-fun b!1100716 () Bool)

(declare-fun e!628346 () Bool)

(assert (=> b!1100716 (= e!628346 (= (apply!956 lt!492800 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100717 () Bool)

(declare-fun e!628337 () Bool)

(assert (=> b!1100717 (= e!628337 (= (apply!956 lt!492800 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1100718 () Bool)

(assert (=> b!1100718 (= e!628342 (validKeyInArray!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(declare-fun b!1100719 () Bool)

(assert (=> b!1100719 (= e!628345 e!628346)))

(declare-fun res!734201 () Bool)

(assert (=> b!1100719 (= res!734201 call!46052)))

(assert (=> b!1100719 (=> (not res!734201) (not e!628346))))

(declare-fun b!1100720 () Bool)

(declare-fun call!46054 () ListLongMap!15319)

(assert (=> b!1100720 (= e!628341 call!46054)))

(declare-fun b!1100721 () Bool)

(declare-fun e!628339 () Bool)

(assert (=> b!1100721 (= e!628339 (not call!46055))))

(declare-fun bm!46049 () Bool)

(declare-fun call!46049 () ListLongMap!15319)

(assert (=> bm!46049 (= call!46054 call!46049)))

(declare-fun b!1100722 () Bool)

(declare-fun e!628340 () Bool)

(assert (=> b!1100722 (= e!628344 e!628340)))

(declare-fun res!734203 () Bool)

(assert (=> b!1100722 (=> (not res!734203) (not e!628340))))

(assert (=> b!1100722 (= res!734203 (contains!6413 lt!492800 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(assert (=> b!1100722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(declare-fun b!1100723 () Bool)

(declare-fun lt!492793 () Unit!36141)

(assert (=> b!1100723 (= e!628347 lt!492793)))

(declare-fun lt!492799 () ListLongMap!15319)

(assert (=> b!1100723 (= lt!492799 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492792 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492780 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492780 (select (arr!34299 lt!492632) #b00000000000000000000000000000000))))

(declare-fun lt!492787 () Unit!36141)

(assert (=> b!1100723 (= lt!492787 (addStillContains!660 lt!492799 lt!492792 zeroValue!831 lt!492780))))

(assert (=> b!1100723 (contains!6413 (+!3408 lt!492799 (tuple2!17343 lt!492792 zeroValue!831)) lt!492780)))

(declare-fun lt!492782 () Unit!36141)

(assert (=> b!1100723 (= lt!492782 lt!492787)))

(declare-fun lt!492784 () ListLongMap!15319)

(assert (=> b!1100723 (= lt!492784 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492798 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492798 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492794 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492794 (select (arr!34299 lt!492632) #b00000000000000000000000000000000))))

(declare-fun lt!492790 () Unit!36141)

(assert (=> b!1100723 (= lt!492790 (addApplyDifferent!516 lt!492784 lt!492798 minValue!831 lt!492794))))

(assert (=> b!1100723 (= (apply!956 (+!3408 lt!492784 (tuple2!17343 lt!492798 minValue!831)) lt!492794) (apply!956 lt!492784 lt!492794))))

(declare-fun lt!492789 () Unit!36141)

(assert (=> b!1100723 (= lt!492789 lt!492790)))

(declare-fun lt!492788 () ListLongMap!15319)

(assert (=> b!1100723 (= lt!492788 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492791 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492797 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492797 (select (arr!34299 lt!492632) #b00000000000000000000000000000000))))

(declare-fun lt!492795 () Unit!36141)

(assert (=> b!1100723 (= lt!492795 (addApplyDifferent!516 lt!492788 lt!492791 zeroValue!831 lt!492797))))

(assert (=> b!1100723 (= (apply!956 (+!3408 lt!492788 (tuple2!17343 lt!492791 zeroValue!831)) lt!492797) (apply!956 lt!492788 lt!492797))))

(declare-fun lt!492781 () Unit!36141)

(assert (=> b!1100723 (= lt!492781 lt!492795)))

(declare-fun lt!492796 () ListLongMap!15319)

(assert (=> b!1100723 (= lt!492796 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492785 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492786 () (_ BitVec 64))

(assert (=> b!1100723 (= lt!492786 (select (arr!34299 lt!492632) #b00000000000000000000000000000000))))

(assert (=> b!1100723 (= lt!492793 (addApplyDifferent!516 lt!492796 lt!492785 minValue!831 lt!492786))))

(assert (=> b!1100723 (= (apply!956 (+!3408 lt!492796 (tuple2!17343 lt!492785 minValue!831)) lt!492786) (apply!956 lt!492796 lt!492786))))

(declare-fun b!1100724 () Bool)

(assert (=> b!1100724 (= e!628338 call!46054)))

(declare-fun b!1100725 () Bool)

(assert (=> b!1100725 (= e!628339 e!628337)))

(declare-fun res!734202 () Bool)

(assert (=> b!1100725 (= res!734202 call!46055)))

(assert (=> b!1100725 (=> (not res!734202) (not e!628337))))

(declare-fun b!1100726 () Bool)

(assert (=> b!1100726 (= e!628343 e!628339)))

(declare-fun c!109004 () Bool)

(assert (=> b!1100726 (= c!109004 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100727 () Bool)

(assert (=> b!1100727 (= e!628348 e!628338)))

(declare-fun c!109005 () Bool)

(assert (=> b!1100727 (= c!109005 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100728 () Bool)

(assert (=> b!1100728 (= e!628348 (+!3408 call!46049 (tuple2!17343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!46050 () Bool)

(declare-fun call!46051 () ListLongMap!15319)

(assert (=> bm!46050 (= call!46051 call!46050)))

(declare-fun b!1100729 () Bool)

(assert (=> b!1100729 (= e!628340 (= (apply!956 lt!492800 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)) (get!17660 (select (arr!34300 lt!492630) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 lt!492630)))))

(assert (=> b!1100729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(declare-fun b!1100730 () Bool)

(assert (=> b!1100730 (= e!628345 (not call!46052))))

(declare-fun b!1100731 () Bool)

(assert (=> b!1100731 (= e!628341 call!46051)))

(declare-fun bm!46051 () Bool)

(assert (=> bm!46051 (= call!46053 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46052 () Bool)

(assert (=> bm!46052 (= call!46049 (+!3408 (ite c!109000 call!46053 (ite c!109005 call!46050 call!46051)) (ite (or c!109000 c!109005) (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (= (and d!130963 c!109000) b!1100728))

(assert (= (and d!130963 (not c!109000)) b!1100727))

(assert (= (and b!1100727 c!109005) b!1100724))

(assert (= (and b!1100727 (not c!109005)) b!1100714))

(assert (= (and b!1100714 c!109002) b!1100720))

(assert (= (and b!1100714 (not c!109002)) b!1100731))

(assert (= (or b!1100720 b!1100731) bm!46050))

(assert (= (or b!1100724 bm!46050) bm!46046))

(assert (= (or b!1100724 b!1100720) bm!46049))

(assert (= (or b!1100728 bm!46046) bm!46051))

(assert (= (or b!1100728 bm!46049) bm!46052))

(assert (= (and d!130963 res!734198) b!1100718))

(assert (= (and d!130963 c!109001) b!1100723))

(assert (= (and d!130963 (not c!109001)) b!1100715))

(assert (= (and d!130963 res!734197) b!1100711))

(assert (= (and b!1100711 res!734199) b!1100713))

(assert (= (and b!1100711 (not res!734204)) b!1100722))

(assert (= (and b!1100722 res!734203) b!1100729))

(assert (= (and b!1100711 res!734200) b!1100712))

(assert (= (and b!1100712 c!109003) b!1100719))

(assert (= (and b!1100712 (not c!109003)) b!1100730))

(assert (= (and b!1100719 res!734201) b!1100716))

(assert (= (or b!1100719 b!1100730) bm!46048))

(assert (= (and b!1100712 res!734196) b!1100726))

(assert (= (and b!1100726 c!109004) b!1100725))

(assert (= (and b!1100726 (not c!109004)) b!1100721))

(assert (= (and b!1100725 res!734202) b!1100717))

(assert (= (or b!1100725 b!1100721) bm!46047))

(declare-fun b_lambda!17913 () Bool)

(assert (=> (not b_lambda!17913) (not b!1100729)))

(assert (=> b!1100729 t!34113))

(declare-fun b_and!36971 () Bool)

(assert (= b_and!36969 (and (=> t!34113 result!16481) b_and!36971)))

(assert (=> b!1100713 m!1020947))

(assert (=> b!1100713 m!1020947))

(assert (=> b!1100713 m!1020957))

(assert (=> d!130963 m!1020821))

(declare-fun m!1021041 () Bool)

(assert (=> bm!46048 m!1021041))

(declare-fun m!1021043 () Bool)

(assert (=> bm!46052 m!1021043))

(assert (=> b!1100722 m!1020947))

(assert (=> b!1100722 m!1020947))

(declare-fun m!1021045 () Bool)

(assert (=> b!1100722 m!1021045))

(declare-fun m!1021047 () Bool)

(assert (=> bm!46047 m!1021047))

(declare-fun m!1021049 () Bool)

(assert (=> b!1100716 m!1021049))

(assert (=> b!1100729 m!1020947))

(assert (=> b!1100729 m!1020947))

(declare-fun m!1021051 () Bool)

(assert (=> b!1100729 m!1021051))

(assert (=> b!1100729 m!1020827))

(declare-fun m!1021053 () Bool)

(assert (=> b!1100729 m!1021053))

(assert (=> b!1100729 m!1020827))

(declare-fun m!1021055 () Bool)

(assert (=> b!1100729 m!1021055))

(assert (=> b!1100729 m!1021053))

(declare-fun m!1021057 () Bool)

(assert (=> b!1100717 m!1021057))

(declare-fun m!1021059 () Bool)

(assert (=> b!1100728 m!1021059))

(assert (=> bm!46051 m!1020833))

(declare-fun m!1021061 () Bool)

(assert (=> b!1100723 m!1021061))

(declare-fun m!1021063 () Bool)

(assert (=> b!1100723 m!1021063))

(declare-fun m!1021065 () Bool)

(assert (=> b!1100723 m!1021065))

(declare-fun m!1021067 () Bool)

(assert (=> b!1100723 m!1021067))

(declare-fun m!1021069 () Bool)

(assert (=> b!1100723 m!1021069))

(assert (=> b!1100723 m!1021069))

(declare-fun m!1021071 () Bool)

(assert (=> b!1100723 m!1021071))

(declare-fun m!1021073 () Bool)

(assert (=> b!1100723 m!1021073))

(declare-fun m!1021075 () Bool)

(assert (=> b!1100723 m!1021075))

(declare-fun m!1021077 () Bool)

(assert (=> b!1100723 m!1021077))

(declare-fun m!1021079 () Bool)

(assert (=> b!1100723 m!1021079))

(declare-fun m!1021081 () Bool)

(assert (=> b!1100723 m!1021081))

(assert (=> b!1100723 m!1021073))

(assert (=> b!1100723 m!1021061))

(declare-fun m!1021083 () Bool)

(assert (=> b!1100723 m!1021083))

(declare-fun m!1021085 () Bool)

(assert (=> b!1100723 m!1021085))

(assert (=> b!1100723 m!1020947))

(declare-fun m!1021087 () Bool)

(assert (=> b!1100723 m!1021087))

(assert (=> b!1100723 m!1021081))

(declare-fun m!1021089 () Bool)

(assert (=> b!1100723 m!1021089))

(assert (=> b!1100723 m!1020833))

(assert (=> b!1100718 m!1020947))

(assert (=> b!1100718 m!1020947))

(assert (=> b!1100718 m!1020957))

(assert (=> b!1100503 d!130963))

(declare-fun b!1100756 () Bool)

(declare-fun e!628368 () Bool)

(declare-fun lt!492817 () ListLongMap!15319)

(declare-fun isEmpty!969 (ListLongMap!15319) Bool)

(assert (=> b!1100756 (= e!628368 (isEmpty!969 lt!492817))))

(declare-fun b!1100757 () Bool)

(declare-fun lt!492819 () Unit!36141)

(declare-fun lt!492820 () Unit!36141)

(assert (=> b!1100757 (= lt!492819 lt!492820)))

(declare-fun lt!492818 () V!41345)

(declare-fun lt!492822 () (_ BitVec 64))

(declare-fun lt!492821 () ListLongMap!15319)

(declare-fun lt!492816 () (_ BitVec 64))

(assert (=> b!1100757 (not (contains!6413 (+!3408 lt!492821 (tuple2!17343 lt!492822 lt!492818)) lt!492816))))

(declare-fun addStillNotContains!277 (ListLongMap!15319 (_ BitVec 64) V!41345 (_ BitVec 64)) Unit!36141)

(assert (=> b!1100757 (= lt!492820 (addStillNotContains!277 lt!492821 lt!492822 lt!492818 lt!492816))))

(assert (=> b!1100757 (= lt!492816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100757 (= lt!492818 (get!17660 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100757 (= lt!492822 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!46058 () ListLongMap!15319)

(assert (=> b!1100757 (= lt!492821 call!46058)))

(declare-fun e!628366 () ListLongMap!15319)

(assert (=> b!1100757 (= e!628366 (+!3408 call!46058 (tuple2!17343 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) (get!17660 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100758 () Bool)

(assert (=> b!1100758 (= e!628368 (= lt!492817 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100759 () Bool)

(assert (=> b!1100759 (= e!628366 call!46058)))

(declare-fun b!1100760 () Bool)

(assert (=> b!1100760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(assert (=> b!1100760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 _values!874)))))

(declare-fun e!628367 () Bool)

(assert (=> b!1100760 (= e!628367 (= (apply!956 lt!492817 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)) (get!17660 (select (arr!34300 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130965 () Bool)

(declare-fun e!628365 () Bool)

(assert (=> d!130965 e!628365))

(declare-fun res!734216 () Bool)

(assert (=> d!130965 (=> (not res!734216) (not e!628365))))

(assert (=> d!130965 (= res!734216 (not (contains!6413 lt!492817 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!628369 () ListLongMap!15319)

(assert (=> d!130965 (= lt!492817 e!628369)))

(declare-fun c!109016 () Bool)

(assert (=> d!130965 (= c!109016 (bvsge #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(assert (=> d!130965 (validMask!0 mask!1414)))

(assert (=> d!130965 (= (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492817)))

(declare-fun b!1100761 () Bool)

(assert (=> b!1100761 (= e!628369 e!628366)))

(declare-fun c!109015 () Bool)

(assert (=> b!1100761 (= c!109015 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100762 () Bool)

(declare-fun e!628363 () Bool)

(assert (=> b!1100762 (= e!628363 e!628367)))

(assert (=> b!1100762 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(declare-fun res!734214 () Bool)

(assert (=> b!1100762 (= res!734214 (contains!6413 lt!492817 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100762 (=> (not res!734214) (not e!628367))))

(declare-fun b!1100763 () Bool)

(assert (=> b!1100763 (= e!628369 (ListLongMap!15320 Nil!23960))))

(declare-fun b!1100764 () Bool)

(declare-fun e!628364 () Bool)

(assert (=> b!1100764 (= e!628364 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100764 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1100765 () Bool)

(assert (=> b!1100765 (= e!628365 e!628363)))

(declare-fun c!109014 () Bool)

(assert (=> b!1100765 (= c!109014 e!628364)))

(declare-fun res!734215 () Bool)

(assert (=> b!1100765 (=> (not res!734215) (not e!628364))))

(assert (=> b!1100765 (= res!734215 (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(declare-fun b!1100766 () Bool)

(assert (=> b!1100766 (= e!628363 e!628368)))

(declare-fun c!109017 () Bool)

(assert (=> b!1100766 (= c!109017 (bvslt #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(declare-fun bm!46055 () Bool)

(assert (=> bm!46055 (= call!46058 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100767 () Bool)

(declare-fun res!734213 () Bool)

(assert (=> b!1100767 (=> (not res!734213) (not e!628365))))

(assert (=> b!1100767 (= res!734213 (not (contains!6413 lt!492817 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!130965 c!109016) b!1100763))

(assert (= (and d!130965 (not c!109016)) b!1100761))

(assert (= (and b!1100761 c!109015) b!1100757))

(assert (= (and b!1100761 (not c!109015)) b!1100759))

(assert (= (or b!1100757 b!1100759) bm!46055))

(assert (= (and d!130965 res!734216) b!1100767))

(assert (= (and b!1100767 res!734213) b!1100765))

(assert (= (and b!1100765 res!734215) b!1100764))

(assert (= (and b!1100765 c!109014) b!1100762))

(assert (= (and b!1100765 (not c!109014)) b!1100766))

(assert (= (and b!1100762 res!734214) b!1100760))

(assert (= (and b!1100766 c!109017) b!1100758))

(assert (= (and b!1100766 (not c!109017)) b!1100756))

(declare-fun b_lambda!17915 () Bool)

(assert (=> (not b_lambda!17915) (not b!1100757)))

(assert (=> b!1100757 t!34113))

(declare-fun b_and!36973 () Bool)

(assert (= b_and!36971 (and (=> t!34113 result!16481) b_and!36973)))

(declare-fun b_lambda!17917 () Bool)

(assert (=> (not b_lambda!17917) (not b!1100760)))

(assert (=> b!1100760 t!34113))

(declare-fun b_and!36975 () Bool)

(assert (= b_and!36973 (and (=> t!34113 result!16481) b_and!36975)))

(declare-fun m!1021091 () Bool)

(assert (=> d!130965 m!1021091))

(assert (=> d!130965 m!1020821))

(declare-fun m!1021093 () Bool)

(assert (=> bm!46055 m!1021093))

(assert (=> b!1100764 m!1020975))

(assert (=> b!1100764 m!1020975))

(assert (=> b!1100764 m!1020979))

(assert (=> b!1100760 m!1020827))

(assert (=> b!1100760 m!1020993))

(assert (=> b!1100760 m!1020827))

(assert (=> b!1100760 m!1020995))

(assert (=> b!1100760 m!1020993))

(assert (=> b!1100760 m!1020975))

(assert (=> b!1100760 m!1020975))

(declare-fun m!1021095 () Bool)

(assert (=> b!1100760 m!1021095))

(declare-fun m!1021097 () Bool)

(assert (=> b!1100767 m!1021097))

(assert (=> b!1100758 m!1021093))

(declare-fun m!1021099 () Bool)

(assert (=> b!1100756 m!1021099))

(assert (=> b!1100762 m!1020975))

(assert (=> b!1100762 m!1020975))

(declare-fun m!1021101 () Bool)

(assert (=> b!1100762 m!1021101))

(assert (=> b!1100761 m!1020975))

(assert (=> b!1100761 m!1020975))

(assert (=> b!1100761 m!1020979))

(declare-fun m!1021103 () Bool)

(assert (=> b!1100757 m!1021103))

(assert (=> b!1100757 m!1020827))

(assert (=> b!1100757 m!1020993))

(assert (=> b!1100757 m!1020827))

(assert (=> b!1100757 m!1020995))

(assert (=> b!1100757 m!1020993))

(declare-fun m!1021105 () Bool)

(assert (=> b!1100757 m!1021105))

(declare-fun m!1021107 () Bool)

(assert (=> b!1100757 m!1021107))

(assert (=> b!1100757 m!1020975))

(declare-fun m!1021109 () Bool)

(assert (=> b!1100757 m!1021109))

(assert (=> b!1100757 m!1021105))

(assert (=> b!1100503 d!130965))

(declare-fun b!1100768 () Bool)

(declare-fun e!628375 () Bool)

(declare-fun lt!492824 () ListLongMap!15319)

(assert (=> b!1100768 (= e!628375 (isEmpty!969 lt!492824))))

(declare-fun b!1100769 () Bool)

(declare-fun lt!492826 () Unit!36141)

(declare-fun lt!492827 () Unit!36141)

(assert (=> b!1100769 (= lt!492826 lt!492827)))

(declare-fun lt!492825 () V!41345)

(declare-fun lt!492823 () (_ BitVec 64))

(declare-fun lt!492829 () (_ BitVec 64))

(declare-fun lt!492828 () ListLongMap!15319)

(assert (=> b!1100769 (not (contains!6413 (+!3408 lt!492828 (tuple2!17343 lt!492829 lt!492825)) lt!492823))))

(assert (=> b!1100769 (= lt!492827 (addStillNotContains!277 lt!492828 lt!492829 lt!492825 lt!492823))))

(assert (=> b!1100769 (= lt!492823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100769 (= lt!492825 (get!17660 (select (arr!34300 lt!492630) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100769 (= lt!492829 (select (arr!34299 lt!492632) #b00000000000000000000000000000000))))

(declare-fun call!46059 () ListLongMap!15319)

(assert (=> b!1100769 (= lt!492828 call!46059)))

(declare-fun e!628373 () ListLongMap!15319)

(assert (=> b!1100769 (= e!628373 (+!3408 call!46059 (tuple2!17343 (select (arr!34299 lt!492632) #b00000000000000000000000000000000) (get!17660 (select (arr!34300 lt!492630) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100770 () Bool)

(assert (=> b!1100770 (= e!628375 (= lt!492824 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100771 () Bool)

(assert (=> b!1100771 (= e!628373 call!46059)))

(declare-fun b!1100772 () Bool)

(assert (=> b!1100772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(assert (=> b!1100772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34837 lt!492630)))))

(declare-fun e!628374 () Bool)

(assert (=> b!1100772 (= e!628374 (= (apply!956 lt!492824 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)) (get!17660 (select (arr!34300 lt!492630) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130967 () Bool)

(declare-fun e!628372 () Bool)

(assert (=> d!130967 e!628372))

(declare-fun res!734220 () Bool)

(assert (=> d!130967 (=> (not res!734220) (not e!628372))))

(assert (=> d!130967 (= res!734220 (not (contains!6413 lt!492824 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!628376 () ListLongMap!15319)

(assert (=> d!130967 (= lt!492824 e!628376)))

(declare-fun c!109020 () Bool)

(assert (=> d!130967 (= c!109020 (bvsge #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(assert (=> d!130967 (validMask!0 mask!1414)))

(assert (=> d!130967 (= (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492824)))

(declare-fun b!1100773 () Bool)

(assert (=> b!1100773 (= e!628376 e!628373)))

(declare-fun c!109019 () Bool)

(assert (=> b!1100773 (= c!109019 (validKeyInArray!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(declare-fun b!1100774 () Bool)

(declare-fun e!628370 () Bool)

(assert (=> b!1100774 (= e!628370 e!628374)))

(assert (=> b!1100774 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(declare-fun res!734218 () Bool)

(assert (=> b!1100774 (= res!734218 (contains!6413 lt!492824 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(assert (=> b!1100774 (=> (not res!734218) (not e!628374))))

(declare-fun b!1100775 () Bool)

(assert (=> b!1100775 (= e!628376 (ListLongMap!15320 Nil!23960))))

(declare-fun b!1100776 () Bool)

(declare-fun e!628371 () Bool)

(assert (=> b!1100776 (= e!628371 (validKeyInArray!0 (select (arr!34299 lt!492632) #b00000000000000000000000000000000)))))

(assert (=> b!1100776 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1100777 () Bool)

(assert (=> b!1100777 (= e!628372 e!628370)))

(declare-fun c!109018 () Bool)

(assert (=> b!1100777 (= c!109018 e!628371)))

(declare-fun res!734219 () Bool)

(assert (=> b!1100777 (=> (not res!734219) (not e!628371))))

(assert (=> b!1100777 (= res!734219 (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(declare-fun b!1100778 () Bool)

(assert (=> b!1100778 (= e!628370 e!628375)))

(declare-fun c!109021 () Bool)

(assert (=> b!1100778 (= c!109021 (bvslt #b00000000000000000000000000000000 (size!34836 lt!492632)))))

(declare-fun bm!46056 () Bool)

(assert (=> bm!46056 (= call!46059 (getCurrentListMapNoExtraKeys!4224 lt!492632 lt!492630 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100779 () Bool)

(declare-fun res!734217 () Bool)

(assert (=> b!1100779 (=> (not res!734217) (not e!628372))))

(assert (=> b!1100779 (= res!734217 (not (contains!6413 lt!492824 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!130967 c!109020) b!1100775))

(assert (= (and d!130967 (not c!109020)) b!1100773))

(assert (= (and b!1100773 c!109019) b!1100769))

(assert (= (and b!1100773 (not c!109019)) b!1100771))

(assert (= (or b!1100769 b!1100771) bm!46056))

(assert (= (and d!130967 res!734220) b!1100779))

(assert (= (and b!1100779 res!734217) b!1100777))

(assert (= (and b!1100777 res!734219) b!1100776))

(assert (= (and b!1100777 c!109018) b!1100774))

(assert (= (and b!1100777 (not c!109018)) b!1100778))

(assert (= (and b!1100774 res!734218) b!1100772))

(assert (= (and b!1100778 c!109021) b!1100770))

(assert (= (and b!1100778 (not c!109021)) b!1100768))

(declare-fun b_lambda!17919 () Bool)

(assert (=> (not b_lambda!17919) (not b!1100769)))

(assert (=> b!1100769 t!34113))

(declare-fun b_and!36977 () Bool)

(assert (= b_and!36975 (and (=> t!34113 result!16481) b_and!36977)))

(declare-fun b_lambda!17921 () Bool)

(assert (=> (not b_lambda!17921) (not b!1100772)))

(assert (=> b!1100772 t!34113))

(declare-fun b_and!36979 () Bool)

(assert (= b_and!36977 (and (=> t!34113 result!16481) b_and!36979)))

(declare-fun m!1021111 () Bool)

(assert (=> d!130967 m!1021111))

(assert (=> d!130967 m!1020821))

(declare-fun m!1021113 () Bool)

(assert (=> bm!46056 m!1021113))

(assert (=> b!1100776 m!1020947))

(assert (=> b!1100776 m!1020947))

(assert (=> b!1100776 m!1020957))

(assert (=> b!1100772 m!1020827))

(assert (=> b!1100772 m!1021053))

(assert (=> b!1100772 m!1020827))

(assert (=> b!1100772 m!1021055))

(assert (=> b!1100772 m!1021053))

(assert (=> b!1100772 m!1020947))

(assert (=> b!1100772 m!1020947))

(declare-fun m!1021115 () Bool)

(assert (=> b!1100772 m!1021115))

(declare-fun m!1021117 () Bool)

(assert (=> b!1100779 m!1021117))

(assert (=> b!1100770 m!1021113))

(declare-fun m!1021119 () Bool)

(assert (=> b!1100768 m!1021119))

(assert (=> b!1100774 m!1020947))

(assert (=> b!1100774 m!1020947))

(declare-fun m!1021121 () Bool)

(assert (=> b!1100774 m!1021121))

(assert (=> b!1100773 m!1020947))

(assert (=> b!1100773 m!1020947))

(assert (=> b!1100773 m!1020957))

(declare-fun m!1021123 () Bool)

(assert (=> b!1100769 m!1021123))

(assert (=> b!1100769 m!1020827))

(assert (=> b!1100769 m!1021053))

(assert (=> b!1100769 m!1020827))

(assert (=> b!1100769 m!1021055))

(assert (=> b!1100769 m!1021053))

(declare-fun m!1021125 () Bool)

(assert (=> b!1100769 m!1021125))

(declare-fun m!1021127 () Bool)

(assert (=> b!1100769 m!1021127))

(assert (=> b!1100769 m!1020947))

(declare-fun m!1021129 () Bool)

(assert (=> b!1100769 m!1021129))

(assert (=> b!1100769 m!1021125))

(assert (=> b!1100503 d!130967))

(declare-fun d!130969 () Bool)

(assert (=> d!130969 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492832 () Unit!36141)

(declare-fun choose!13 (array!71275 (_ BitVec 64) (_ BitVec 32)) Unit!36141)

(assert (=> d!130969 (= lt!492832 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130969 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130969 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492832)))

(declare-fun bs!32309 () Bool)

(assert (= bs!32309 d!130969))

(assert (=> bs!32309 m!1020841))

(declare-fun m!1021131 () Bool)

(assert (=> bs!32309 m!1021131))

(assert (=> b!1100503 d!130969))

(declare-fun b!1100781 () Bool)

(declare-fun e!628377 () Bool)

(declare-fun call!46060 () Bool)

(assert (=> b!1100781 (= e!628377 call!46060)))

(declare-fun b!1100782 () Bool)

(declare-fun e!628379 () Bool)

(assert (=> b!1100782 (= e!628379 e!628377)))

(declare-fun c!109022 () Bool)

(assert (=> b!1100782 (= c!109022 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100783 () Bool)

(declare-fun e!628378 () Bool)

(assert (=> b!1100783 (= e!628378 (contains!6415 Nil!23961 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100780 () Bool)

(declare-fun e!628380 () Bool)

(assert (=> b!1100780 (= e!628380 e!628379)))

(declare-fun res!734222 () Bool)

(assert (=> b!1100780 (=> (not res!734222) (not e!628379))))

(assert (=> b!1100780 (= res!734222 (not e!628378))))

(declare-fun res!734221 () Bool)

(assert (=> b!1100780 (=> (not res!734221) (not e!628378))))

(assert (=> b!1100780 (= res!734221 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130971 () Bool)

(declare-fun res!734223 () Bool)

(assert (=> d!130971 (=> res!734223 e!628380)))

(assert (=> d!130971 (= res!734223 (bvsge #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(assert (=> d!130971 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23961) e!628380)))

(declare-fun bm!46057 () Bool)

(assert (=> bm!46057 (= call!46060 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109022 (Cons!23960 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) Nil!23961) Nil!23961)))))

(declare-fun b!1100784 () Bool)

(assert (=> b!1100784 (= e!628377 call!46060)))

(assert (= (and d!130971 (not res!734223)) b!1100780))

(assert (= (and b!1100780 res!734221) b!1100783))

(assert (= (and b!1100780 res!734222) b!1100782))

(assert (= (and b!1100782 c!109022) b!1100781))

(assert (= (and b!1100782 (not c!109022)) b!1100784))

(assert (= (or b!1100781 b!1100784) bm!46057))

(assert (=> b!1100782 m!1020975))

(assert (=> b!1100782 m!1020975))

(assert (=> b!1100782 m!1020979))

(assert (=> b!1100783 m!1020975))

(assert (=> b!1100783 m!1020975))

(declare-fun m!1021133 () Bool)

(assert (=> b!1100783 m!1021133))

(assert (=> b!1100780 m!1020975))

(assert (=> b!1100780 m!1020975))

(assert (=> b!1100780 m!1020979))

(assert (=> bm!46057 m!1020975))

(declare-fun m!1021135 () Bool)

(assert (=> bm!46057 m!1021135))

(assert (=> b!1100505 d!130971))

(declare-fun d!130973 () Bool)

(declare-fun res!734224 () Bool)

(declare-fun e!628382 () Bool)

(assert (=> d!130973 (=> res!734224 e!628382)))

(assert (=> d!130973 (= res!734224 (bvsge #b00000000000000000000000000000000 (size!34836 _keys!1070)))))

(assert (=> d!130973 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628382)))

(declare-fun b!1100785 () Bool)

(declare-fun e!628381 () Bool)

(declare-fun call!46061 () Bool)

(assert (=> b!1100785 (= e!628381 call!46061)))

(declare-fun b!1100786 () Bool)

(declare-fun e!628383 () Bool)

(assert (=> b!1100786 (= e!628381 e!628383)))

(declare-fun lt!492833 () (_ BitVec 64))

(assert (=> b!1100786 (= lt!492833 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492834 () Unit!36141)

(assert (=> b!1100786 (= lt!492834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!492833 #b00000000000000000000000000000000))))

(assert (=> b!1100786 (arrayContainsKey!0 _keys!1070 lt!492833 #b00000000000000000000000000000000)))

(declare-fun lt!492835 () Unit!36141)

(assert (=> b!1100786 (= lt!492835 lt!492834)))

(declare-fun res!734225 () Bool)

(assert (=> b!1100786 (= res!734225 (= (seekEntryOrOpen!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9866 #b00000000000000000000000000000000)))))

(assert (=> b!1100786 (=> (not res!734225) (not e!628383))))

(declare-fun b!1100787 () Bool)

(assert (=> b!1100787 (= e!628383 call!46061)))

(declare-fun bm!46058 () Bool)

(assert (=> bm!46058 (= call!46061 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1100788 () Bool)

(assert (=> b!1100788 (= e!628382 e!628381)))

(declare-fun c!109023 () Bool)

(assert (=> b!1100788 (= c!109023 (validKeyInArray!0 (select (arr!34299 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130973 (not res!734224)) b!1100788))

(assert (= (and b!1100788 c!109023) b!1100786))

(assert (= (and b!1100788 (not c!109023)) b!1100785))

(assert (= (and b!1100786 res!734225) b!1100787))

(assert (= (or b!1100787 b!1100785) bm!46058))

(assert (=> b!1100786 m!1020975))

(declare-fun m!1021137 () Bool)

(assert (=> b!1100786 m!1021137))

(declare-fun m!1021139 () Bool)

(assert (=> b!1100786 m!1021139))

(assert (=> b!1100786 m!1020975))

(declare-fun m!1021141 () Bool)

(assert (=> b!1100786 m!1021141))

(declare-fun m!1021143 () Bool)

(assert (=> bm!46058 m!1021143))

(assert (=> b!1100788 m!1020975))

(assert (=> b!1100788 m!1020975))

(assert (=> b!1100788 m!1020979))

(assert (=> b!1100509 d!130973))

(declare-fun b!1100796 () Bool)

(declare-fun e!628388 () Bool)

(assert (=> b!1100796 (= e!628388 tp_is_empty!27163)))

(declare-fun b!1100795 () Bool)

(declare-fun e!628389 () Bool)

(assert (=> b!1100795 (= e!628389 tp_is_empty!27163)))

(declare-fun mapNonEmpty!42526 () Bool)

(declare-fun mapRes!42526 () Bool)

(declare-fun tp!81293 () Bool)

(assert (=> mapNonEmpty!42526 (= mapRes!42526 (and tp!81293 e!628389))))

(declare-fun mapKey!42526 () (_ BitVec 32))

(declare-fun mapValue!42526 () ValueCell!12872)

(declare-fun mapRest!42526 () (Array (_ BitVec 32) ValueCell!12872))

(assert (=> mapNonEmpty!42526 (= mapRest!42517 (store mapRest!42526 mapKey!42526 mapValue!42526))))

(declare-fun condMapEmpty!42526 () Bool)

(declare-fun mapDefault!42526 () ValueCell!12872)

(assert (=> mapNonEmpty!42517 (= condMapEmpty!42526 (= mapRest!42517 ((as const (Array (_ BitVec 32) ValueCell!12872)) mapDefault!42526)))))

(assert (=> mapNonEmpty!42517 (= tp!81278 (and e!628388 mapRes!42526))))

(declare-fun mapIsEmpty!42526 () Bool)

(assert (=> mapIsEmpty!42526 mapRes!42526))

(assert (= (and mapNonEmpty!42517 condMapEmpty!42526) mapIsEmpty!42526))

(assert (= (and mapNonEmpty!42517 (not condMapEmpty!42526)) mapNonEmpty!42526))

(assert (= (and mapNonEmpty!42526 ((_ is ValueCellFull!12872) mapValue!42526)) b!1100795))

(assert (= (and mapNonEmpty!42517 ((_ is ValueCellFull!12872) mapDefault!42526)) b!1100796))

(declare-fun m!1021145 () Bool)

(assert (=> mapNonEmpty!42526 m!1021145))

(declare-fun b_lambda!17923 () Bool)

(assert (= b_lambda!17915 (or (and start!96876 b_free!23113) b_lambda!17923)))

(declare-fun b_lambda!17925 () Bool)

(assert (= b_lambda!17919 (or (and start!96876 b_free!23113) b_lambda!17925)))

(declare-fun b_lambda!17927 () Bool)

(assert (= b_lambda!17917 (or (and start!96876 b_free!23113) b_lambda!17927)))

(declare-fun b_lambda!17929 () Bool)

(assert (= b_lambda!17911 (or (and start!96876 b_free!23113) b_lambda!17929)))

(declare-fun b_lambda!17931 () Bool)

(assert (= b_lambda!17909 (or (and start!96876 b_free!23113) b_lambda!17931)))

(declare-fun b_lambda!17933 () Bool)

(assert (= b_lambda!17913 (or (and start!96876 b_free!23113) b_lambda!17933)))

(declare-fun b_lambda!17935 () Bool)

(assert (= b_lambda!17921 (or (and start!96876 b_free!23113) b_lambda!17935)))

(check-sat (not b!1100773) (not bm!46045) (not b!1100630) (not d!130951) (not b!1100782) (not b!1100609) (not mapNonEmpty!42526) tp_is_empty!27163 (not b!1100718) (not b!1100710) (not b_lambda!17933) (not b!1100686) (not b!1100692) (not b!1100729) (not b!1100687) (not bm!46051) (not b_next!23113) (not bm!46044) (not bm!46055) (not b!1100756) (not b!1100717) (not b!1100683) (not d!130963) (not b!1100757) (not d!130961) b_and!36979 (not d!130965) (not b!1100713) (not bm!46039) (not b!1100693) (not b_lambda!17923) (not b_lambda!17927) (not b!1100758) (not b!1100768) (not b!1100611) (not bm!46038) (not b!1100779) (not b!1100774) (not b!1100760) (not b!1100762) (not b!1100722) (not b!1100728) (not bm!46052) (not bm!46057) (not b!1100764) (not b!1100616) (not b!1100688) (not b!1100631) (not bm!46015) (not b!1100788) (not b!1100617) (not bm!46048) (not d!130967) (not bm!46018) (not b!1100770) (not b_lambda!17929) (not d!130959) (not b_lambda!17907) (not b!1100769) (not b!1100783) (not b!1100786) (not b!1100761) (not bm!46034) (not bm!46047) (not b!1100716) (not b_lambda!17935) (not b!1100780) (not b!1100772) (not b!1100767) (not b_lambda!17925) (not d!130969) (not b!1100699) (not b!1100698) (not b!1100628) (not bm!46035) (not b!1100638) (not bm!46056) (not bm!46058) (not b_lambda!17931) (not b!1100723) (not b!1100776) (not d!130957))
(check-sat b_and!36979 (not b_next!23113))
