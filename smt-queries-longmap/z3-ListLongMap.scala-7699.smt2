; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96908 () Bool)

(assert start!96908)

(declare-fun b_free!23119 () Bool)

(declare-fun b_next!23119 () Bool)

(assert (=> start!96908 (= b_free!23119 (not b_next!23119))))

(declare-fun tp!81298 () Bool)

(declare-fun b_and!36981 () Bool)

(assert (=> start!96908 (= tp!81298 b_and!36981)))

(declare-fun b!1100823 () Bool)

(declare-fun res!734250 () Bool)

(declare-fun e!628406 () Bool)

(assert (=> b!1100823 (=> (not res!734250) (not e!628406))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71289 0))(
  ( (array!71290 (arr!34305 (Array (_ BitVec 32) (_ BitVec 64))) (size!34842 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71289)

(assert (=> b!1100823 (= res!734250 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34842 _keys!1070))))))

(declare-fun b!1100824 () Bool)

(declare-fun res!734254 () Bool)

(assert (=> b!1100824 (=> (not res!734254) (not e!628406))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41353 0))(
  ( (V!41354 (val!13641 Int)) )
))
(declare-datatypes ((ValueCell!12875 0))(
  ( (ValueCellFull!12875 (v!16263 V!41353)) (EmptyCell!12875) )
))
(declare-datatypes ((array!71291 0))(
  ( (array!71292 (arr!34306 (Array (_ BitVec 32) ValueCell!12875)) (size!34843 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71291)

(assert (=> b!1100824 (= res!734254 (and (= (size!34843 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34842 _keys!1070) (size!34843 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100825 () Bool)

(declare-fun res!734251 () Bool)

(assert (=> b!1100825 (=> (not res!734251) (not e!628406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71289 (_ BitVec 32)) Bool)

(assert (=> b!1100825 (= res!734251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100826 () Bool)

(declare-fun e!628405 () Bool)

(declare-fun e!628410 () Bool)

(assert (=> b!1100826 (= e!628405 (not e!628410))))

(declare-fun res!734249 () Bool)

(assert (=> b!1100826 (=> res!734249 e!628410)))

(assert (=> b!1100826 (= res!734249 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41353)

(declare-datatypes ((tuple2!17346 0))(
  ( (tuple2!17347 (_1!8684 (_ BitVec 64)) (_2!8684 V!41353)) )
))
(declare-datatypes ((List!23968 0))(
  ( (Nil!23965) (Cons!23964 (h!25182 tuple2!17346) (t!34125 List!23968)) )
))
(declare-datatypes ((ListLongMap!15323 0))(
  ( (ListLongMap!15324 (toList!7677 List!23968)) )
))
(declare-fun lt!492857 () ListLongMap!15323)

(declare-fun zeroValue!831 () V!41353)

(declare-fun getCurrentListMap!4385 (array!71289 array!71291 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) Int) ListLongMap!15323)

(assert (=> b!1100826 (= lt!492857 (getCurrentListMap!4385 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492864 () array!71291)

(declare-fun lt!492865 () ListLongMap!15323)

(declare-fun lt!492859 () array!71289)

(assert (=> b!1100826 (= lt!492865 (getCurrentListMap!4385 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492856 () ListLongMap!15323)

(declare-fun lt!492861 () ListLongMap!15323)

(assert (=> b!1100826 (and (= lt!492856 lt!492861) (= lt!492861 lt!492856))))

(declare-fun lt!492863 () ListLongMap!15323)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!949 (ListLongMap!15323 (_ BitVec 64)) ListLongMap!15323)

(assert (=> b!1100826 (= lt!492861 (-!949 lt!492863 k0!904))))

(declare-datatypes ((Unit!36147 0))(
  ( (Unit!36148) )
))
(declare-fun lt!492858 () Unit!36147)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 (array!71289 array!71291 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36147)

(assert (=> b!1100826 (= lt!492858 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4226 (array!71289 array!71291 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) Int) ListLongMap!15323)

(assert (=> b!1100826 (= lt!492856 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2344 (Int (_ BitVec 64)) V!41353)

(assert (=> b!1100826 (= lt!492864 (array!71292 (store (arr!34306 _values!874) i!650 (ValueCellFull!12875 (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34843 _values!874)))))

(assert (=> b!1100826 (= lt!492863 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100826 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492862 () Unit!36147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71289 (_ BitVec 64) (_ BitVec 32)) Unit!36147)

(assert (=> b!1100826 (= lt!492862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100827 () Bool)

(declare-fun res!734252 () Bool)

(assert (=> b!1100827 (=> (not res!734252) (not e!628406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100827 (= res!734252 (validKeyInArray!0 k0!904))))

(declare-fun b!1100828 () Bool)

(declare-fun res!734253 () Bool)

(assert (=> b!1100828 (=> (not res!734253) (not e!628406))))

(declare-datatypes ((List!23969 0))(
  ( (Nil!23966) (Cons!23965 (h!25183 (_ BitVec 64)) (t!34126 List!23969)) )
))
(declare-fun arrayNoDuplicates!0 (array!71289 (_ BitVec 32) List!23969) Bool)

(assert (=> b!1100828 (= res!734253 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23966))))

(declare-fun b!1100829 () Bool)

(declare-fun lt!492860 () tuple2!17346)

(declare-fun +!3409 (ListLongMap!15323 tuple2!17346) ListLongMap!15323)

(assert (=> b!1100829 (= e!628410 (= lt!492857 (+!3409 lt!492863 lt!492860)))))

(assert (=> b!1100829 (= lt!492865 (+!3409 lt!492856 lt!492860))))

(assert (=> b!1100829 (= lt!492860 (tuple2!17347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100830 () Bool)

(declare-fun res!734255 () Bool)

(assert (=> b!1100830 (=> (not res!734255) (not e!628406))))

(assert (=> b!1100830 (= res!734255 (= (select (arr!34305 _keys!1070) i!650) k0!904))))

(declare-fun b!1100831 () Bool)

(declare-fun e!628409 () Bool)

(declare-fun tp_is_empty!27169 () Bool)

(assert (=> b!1100831 (= e!628409 tp_is_empty!27169)))

(declare-fun b!1100832 () Bool)

(declare-fun e!628404 () Bool)

(assert (=> b!1100832 (= e!628404 tp_is_empty!27169)))

(declare-fun res!734246 () Bool)

(assert (=> start!96908 (=> (not res!734246) (not e!628406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96908 (= res!734246 (validMask!0 mask!1414))))

(assert (=> start!96908 e!628406))

(assert (=> start!96908 tp!81298))

(assert (=> start!96908 true))

(assert (=> start!96908 tp_is_empty!27169))

(declare-fun array_inv!26448 (array!71289) Bool)

(assert (=> start!96908 (array_inv!26448 _keys!1070)))

(declare-fun e!628407 () Bool)

(declare-fun array_inv!26449 (array!71291) Bool)

(assert (=> start!96908 (and (array_inv!26449 _values!874) e!628407)))

(declare-fun b!1100833 () Bool)

(declare-fun res!734248 () Bool)

(assert (=> b!1100833 (=> (not res!734248) (not e!628405))))

(assert (=> b!1100833 (= res!734248 (arrayNoDuplicates!0 lt!492859 #b00000000000000000000000000000000 Nil!23966))))

(declare-fun mapNonEmpty!42529 () Bool)

(declare-fun mapRes!42529 () Bool)

(declare-fun tp!81299 () Bool)

(assert (=> mapNonEmpty!42529 (= mapRes!42529 (and tp!81299 e!628409))))

(declare-fun mapKey!42529 () (_ BitVec 32))

(declare-fun mapRest!42529 () (Array (_ BitVec 32) ValueCell!12875))

(declare-fun mapValue!42529 () ValueCell!12875)

(assert (=> mapNonEmpty!42529 (= (arr!34306 _values!874) (store mapRest!42529 mapKey!42529 mapValue!42529))))

(declare-fun b!1100834 () Bool)

(assert (=> b!1100834 (= e!628406 e!628405)))

(declare-fun res!734247 () Bool)

(assert (=> b!1100834 (=> (not res!734247) (not e!628405))))

(assert (=> b!1100834 (= res!734247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492859 mask!1414))))

(assert (=> b!1100834 (= lt!492859 (array!71290 (store (arr!34305 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34842 _keys!1070)))))

(declare-fun b!1100835 () Bool)

(assert (=> b!1100835 (= e!628407 (and e!628404 mapRes!42529))))

(declare-fun condMapEmpty!42529 () Bool)

(declare-fun mapDefault!42529 () ValueCell!12875)

(assert (=> b!1100835 (= condMapEmpty!42529 (= (arr!34306 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12875)) mapDefault!42529)))))

(declare-fun mapIsEmpty!42529 () Bool)

(assert (=> mapIsEmpty!42529 mapRes!42529))

(assert (= (and start!96908 res!734246) b!1100824))

(assert (= (and b!1100824 res!734254) b!1100825))

(assert (= (and b!1100825 res!734251) b!1100828))

(assert (= (and b!1100828 res!734253) b!1100823))

(assert (= (and b!1100823 res!734250) b!1100827))

(assert (= (and b!1100827 res!734252) b!1100830))

(assert (= (and b!1100830 res!734255) b!1100834))

(assert (= (and b!1100834 res!734247) b!1100833))

(assert (= (and b!1100833 res!734248) b!1100826))

(assert (= (and b!1100826 (not res!734249)) b!1100829))

(assert (= (and b!1100835 condMapEmpty!42529) mapIsEmpty!42529))

(assert (= (and b!1100835 (not condMapEmpty!42529)) mapNonEmpty!42529))

(get-info :version)

(assert (= (and mapNonEmpty!42529 ((_ is ValueCellFull!12875) mapValue!42529)) b!1100831))

(assert (= (and b!1100835 ((_ is ValueCellFull!12875) mapDefault!42529)) b!1100832))

(assert (= start!96908 b!1100835))

(declare-fun b_lambda!17937 () Bool)

(assert (=> (not b_lambda!17937) (not b!1100826)))

(declare-fun t!34124 () Bool)

(declare-fun tb!7977 () Bool)

(assert (=> (and start!96908 (= defaultEntry!882 defaultEntry!882) t!34124) tb!7977))

(declare-fun result!16495 () Bool)

(assert (=> tb!7977 (= result!16495 tp_is_empty!27169)))

(assert (=> b!1100826 t!34124))

(declare-fun b_and!36983 () Bool)

(assert (= b_and!36981 (and (=> t!34124 result!16495) b_and!36983)))

(declare-fun m!1021147 () Bool)

(assert (=> b!1100833 m!1021147))

(declare-fun m!1021149 () Bool)

(assert (=> b!1100830 m!1021149))

(declare-fun m!1021151 () Bool)

(assert (=> start!96908 m!1021151))

(declare-fun m!1021153 () Bool)

(assert (=> start!96908 m!1021153))

(declare-fun m!1021155 () Bool)

(assert (=> start!96908 m!1021155))

(declare-fun m!1021157 () Bool)

(assert (=> b!1100834 m!1021157))

(declare-fun m!1021159 () Bool)

(assert (=> b!1100834 m!1021159))

(declare-fun m!1021161 () Bool)

(assert (=> b!1100829 m!1021161))

(declare-fun m!1021163 () Bool)

(assert (=> b!1100829 m!1021163))

(declare-fun m!1021165 () Bool)

(assert (=> b!1100828 m!1021165))

(declare-fun m!1021167 () Bool)

(assert (=> mapNonEmpty!42529 m!1021167))

(declare-fun m!1021169 () Bool)

(assert (=> b!1100827 m!1021169))

(declare-fun m!1021171 () Bool)

(assert (=> b!1100825 m!1021171))

(declare-fun m!1021173 () Bool)

(assert (=> b!1100826 m!1021173))

(declare-fun m!1021175 () Bool)

(assert (=> b!1100826 m!1021175))

(declare-fun m!1021177 () Bool)

(assert (=> b!1100826 m!1021177))

(declare-fun m!1021179 () Bool)

(assert (=> b!1100826 m!1021179))

(declare-fun m!1021181 () Bool)

(assert (=> b!1100826 m!1021181))

(declare-fun m!1021183 () Bool)

(assert (=> b!1100826 m!1021183))

(declare-fun m!1021185 () Bool)

(assert (=> b!1100826 m!1021185))

(declare-fun m!1021187 () Bool)

(assert (=> b!1100826 m!1021187))

(declare-fun m!1021189 () Bool)

(assert (=> b!1100826 m!1021189))

(declare-fun m!1021191 () Bool)

(assert (=> b!1100826 m!1021191))

(check-sat (not b!1100825) (not b!1100833) b_and!36983 (not b_next!23119) (not b!1100826) (not b!1100827) (not b_lambda!17937) (not b!1100829) (not b!1100834) (not mapNonEmpty!42529) tp_is_empty!27169 (not start!96908) (not b!1100828))
(check-sat b_and!36983 (not b_next!23119))
(get-model)

(declare-fun b_lambda!17943 () Bool)

(assert (= b_lambda!17937 (or (and start!96908 b_free!23119) b_lambda!17943)))

(check-sat (not b!1100825) (not b!1100833) b_and!36983 (not b!1100826) (not b!1100827) (not b!1100829) (not b!1100834) (not mapNonEmpty!42529) tp_is_empty!27169 (not start!96908) (not b!1100828) (not b_lambda!17943) (not b_next!23119))
(check-sat b_and!36983 (not b_next!23119))
(get-model)

(declare-fun b!1100930 () Bool)

(declare-fun e!628464 () Bool)

(declare-fun contains!6416 (List!23969 (_ BitVec 64)) Bool)

(assert (=> b!1100930 (= e!628464 (contains!6416 Nil!23966 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(declare-fun b!1100931 () Bool)

(declare-fun e!628462 () Bool)

(declare-fun e!628461 () Bool)

(assert (=> b!1100931 (= e!628462 e!628461)))

(declare-fun res!734322 () Bool)

(assert (=> b!1100931 (=> (not res!734322) (not e!628461))))

(assert (=> b!1100931 (= res!734322 (not e!628464))))

(declare-fun res!734324 () Bool)

(assert (=> b!1100931 (=> (not res!734324) (not e!628464))))

(assert (=> b!1100931 (= res!734324 (validKeyInArray!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(declare-fun d!130977 () Bool)

(declare-fun res!734323 () Bool)

(assert (=> d!130977 (=> res!734323 e!628462)))

(assert (=> d!130977 (= res!734323 (bvsge #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(assert (=> d!130977 (= (arrayNoDuplicates!0 lt!492859 #b00000000000000000000000000000000 Nil!23966) e!628462)))

(declare-fun bm!46061 () Bool)

(declare-fun call!46064 () Bool)

(declare-fun c!109026 () Bool)

(assert (=> bm!46061 (= call!46064 (arrayNoDuplicates!0 lt!492859 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109026 (Cons!23965 (select (arr!34305 lt!492859) #b00000000000000000000000000000000) Nil!23966) Nil!23966)))))

(declare-fun b!1100932 () Bool)

(declare-fun e!628463 () Bool)

(assert (=> b!1100932 (= e!628461 e!628463)))

(assert (=> b!1100932 (= c!109026 (validKeyInArray!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(declare-fun b!1100933 () Bool)

(assert (=> b!1100933 (= e!628463 call!46064)))

(declare-fun b!1100934 () Bool)

(assert (=> b!1100934 (= e!628463 call!46064)))

(assert (= (and d!130977 (not res!734323)) b!1100931))

(assert (= (and b!1100931 res!734324) b!1100930))

(assert (= (and b!1100931 res!734322) b!1100932))

(assert (= (and b!1100932 c!109026) b!1100934))

(assert (= (and b!1100932 (not c!109026)) b!1100933))

(assert (= (or b!1100934 b!1100933) bm!46061))

(declare-fun m!1021285 () Bool)

(assert (=> b!1100930 m!1021285))

(assert (=> b!1100930 m!1021285))

(declare-fun m!1021287 () Bool)

(assert (=> b!1100930 m!1021287))

(assert (=> b!1100931 m!1021285))

(assert (=> b!1100931 m!1021285))

(declare-fun m!1021289 () Bool)

(assert (=> b!1100931 m!1021289))

(assert (=> bm!46061 m!1021285))

(declare-fun m!1021291 () Bool)

(assert (=> bm!46061 m!1021291))

(assert (=> b!1100932 m!1021285))

(assert (=> b!1100932 m!1021285))

(assert (=> b!1100932 m!1021289))

(assert (=> b!1100833 d!130977))

(declare-fun d!130979 () Bool)

(assert (=> d!130979 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100827 d!130979))

(declare-fun d!130981 () Bool)

(declare-fun res!734329 () Bool)

(declare-fun e!628469 () Bool)

(assert (=> d!130981 (=> res!734329 e!628469)))

(assert (=> d!130981 (= res!734329 (= (select (arr!34305 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130981 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!628469)))

(declare-fun b!1100939 () Bool)

(declare-fun e!628470 () Bool)

(assert (=> b!1100939 (= e!628469 e!628470)))

(declare-fun res!734330 () Bool)

(assert (=> b!1100939 (=> (not res!734330) (not e!628470))))

(assert (=> b!1100939 (= res!734330 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34842 _keys!1070)))))

(declare-fun b!1100940 () Bool)

(assert (=> b!1100940 (= e!628470 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130981 (not res!734329)) b!1100939))

(assert (= (and b!1100939 res!734330) b!1100940))

(declare-fun m!1021293 () Bool)

(assert (=> d!130981 m!1021293))

(declare-fun m!1021295 () Bool)

(assert (=> b!1100940 m!1021295))

(assert (=> b!1100826 d!130981))

(declare-fun b!1100983 () Bool)

(declare-fun lt!492977 () ListLongMap!15323)

(declare-fun e!628500 () Bool)

(declare-fun apply!957 (ListLongMap!15323 (_ BitVec 64)) V!41353)

(declare-fun get!17663 (ValueCell!12875 V!41353) V!41353)

(assert (=> b!1100983 (= e!628500 (= (apply!957 lt!492977 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)) (get!17663 (select (arr!34306 _values!874) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100983 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 _values!874)))))

(assert (=> b!1100983 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(declare-fun b!1100984 () Bool)

(declare-fun e!628498 () Bool)

(assert (=> b!1100984 (= e!628498 (validKeyInArray!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100985 () Bool)

(declare-fun e!628507 () ListLongMap!15323)

(declare-fun call!46081 () ListLongMap!15323)

(assert (=> b!1100985 (= e!628507 (+!3409 call!46081 (tuple2!17347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1100986 () Bool)

(declare-fun e!628509 () Bool)

(declare-fun call!46080 () Bool)

(assert (=> b!1100986 (= e!628509 (not call!46080))))

(declare-fun b!1100987 () Bool)

(declare-fun e!628502 () Unit!36147)

(declare-fun lt!492973 () Unit!36147)

(assert (=> b!1100987 (= e!628502 lt!492973)))

(declare-fun lt!492979 () ListLongMap!15323)

(assert (=> b!1100987 (= lt!492979 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492984 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492984 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492978 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492978 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492982 () Unit!36147)

(declare-fun addStillContains!661 (ListLongMap!15323 (_ BitVec 64) V!41353 (_ BitVec 64)) Unit!36147)

(assert (=> b!1100987 (= lt!492982 (addStillContains!661 lt!492979 lt!492984 zeroValue!831 lt!492978))))

(declare-fun contains!6417 (ListLongMap!15323 (_ BitVec 64)) Bool)

(assert (=> b!1100987 (contains!6417 (+!3409 lt!492979 (tuple2!17347 lt!492984 zeroValue!831)) lt!492978)))

(declare-fun lt!492972 () Unit!36147)

(assert (=> b!1100987 (= lt!492972 lt!492982)))

(declare-fun lt!492976 () ListLongMap!15323)

(assert (=> b!1100987 (= lt!492976 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492971 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492985 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492985 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492990 () Unit!36147)

(declare-fun addApplyDifferent!517 (ListLongMap!15323 (_ BitVec 64) V!41353 (_ BitVec 64)) Unit!36147)

(assert (=> b!1100987 (= lt!492990 (addApplyDifferent!517 lt!492976 lt!492971 minValue!831 lt!492985))))

(assert (=> b!1100987 (= (apply!957 (+!3409 lt!492976 (tuple2!17347 lt!492971 minValue!831)) lt!492985) (apply!957 lt!492976 lt!492985))))

(declare-fun lt!492983 () Unit!36147)

(assert (=> b!1100987 (= lt!492983 lt!492990)))

(declare-fun lt!492991 () ListLongMap!15323)

(assert (=> b!1100987 (= lt!492991 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492975 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492988 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492988 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492989 () Unit!36147)

(assert (=> b!1100987 (= lt!492989 (addApplyDifferent!517 lt!492991 lt!492975 zeroValue!831 lt!492988))))

(assert (=> b!1100987 (= (apply!957 (+!3409 lt!492991 (tuple2!17347 lt!492975 zeroValue!831)) lt!492988) (apply!957 lt!492991 lt!492988))))

(declare-fun lt!492986 () Unit!36147)

(assert (=> b!1100987 (= lt!492986 lt!492989)))

(declare-fun lt!492980 () ListLongMap!15323)

(assert (=> b!1100987 (= lt!492980 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492981 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492981 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492974 () (_ BitVec 64))

(assert (=> b!1100987 (= lt!492974 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100987 (= lt!492973 (addApplyDifferent!517 lt!492980 lt!492981 minValue!831 lt!492974))))

(assert (=> b!1100987 (= (apply!957 (+!3409 lt!492980 (tuple2!17347 lt!492981 minValue!831)) lt!492974) (apply!957 lt!492980 lt!492974))))

(declare-fun b!1100988 () Bool)

(declare-fun c!109040 () Bool)

(assert (=> b!1100988 (= c!109040 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628504 () ListLongMap!15323)

(declare-fun e!628499 () ListLongMap!15323)

(assert (=> b!1100988 (= e!628504 e!628499)))

(declare-fun b!1100989 () Bool)

(declare-fun e!628506 () Bool)

(assert (=> b!1100989 (= e!628506 (validKeyInArray!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46076 () Bool)

(declare-fun call!46084 () Bool)

(assert (=> bm!46076 (= call!46084 (contains!6417 lt!492977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100990 () Bool)

(declare-fun e!628501 () Bool)

(assert (=> b!1100990 (= e!628501 (not call!46084))))

(declare-fun c!109041 () Bool)

(declare-fun call!46079 () ListLongMap!15323)

(declare-fun c!109044 () Bool)

(declare-fun call!46085 () ListLongMap!15323)

(declare-fun call!46082 () ListLongMap!15323)

(declare-fun bm!46077 () Bool)

(assert (=> bm!46077 (= call!46081 (+!3409 (ite c!109044 call!46085 (ite c!109041 call!46082 call!46079)) (ite (or c!109044 c!109041) (tuple2!17347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100991 () Bool)

(declare-fun res!734356 () Bool)

(declare-fun e!628503 () Bool)

(assert (=> b!1100991 (=> (not res!734356) (not e!628503))))

(assert (=> b!1100991 (= res!734356 e!628501)))

(declare-fun c!109039 () Bool)

(assert (=> b!1100991 (= c!109039 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!46078 () Bool)

(assert (=> bm!46078 (= call!46079 call!46082)))

(declare-fun b!1100992 () Bool)

(declare-fun Unit!36151 () Unit!36147)

(assert (=> b!1100992 (= e!628502 Unit!36151)))

(declare-fun b!1100993 () Bool)

(declare-fun e!628497 () Bool)

(assert (=> b!1100993 (= e!628509 e!628497)))

(declare-fun res!734353 () Bool)

(assert (=> b!1100993 (= res!734353 call!46080)))

(assert (=> b!1100993 (=> (not res!734353) (not e!628497))))

(declare-fun b!1100994 () Bool)

(declare-fun e!628505 () Bool)

(assert (=> b!1100994 (= e!628505 (= (apply!957 lt!492977 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100995 () Bool)

(declare-fun e!628508 () Bool)

(assert (=> b!1100995 (= e!628508 e!628500)))

(declare-fun res!734351 () Bool)

(assert (=> b!1100995 (=> (not res!734351) (not e!628500))))

(assert (=> b!1100995 (= res!734351 (contains!6417 lt!492977 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(declare-fun b!1100996 () Bool)

(declare-fun res!734355 () Bool)

(assert (=> b!1100996 (=> (not res!734355) (not e!628503))))

(assert (=> b!1100996 (= res!734355 e!628508)))

(declare-fun res!734349 () Bool)

(assert (=> b!1100996 (=> res!734349 e!628508)))

(assert (=> b!1100996 (= res!734349 (not e!628498))))

(declare-fun res!734357 () Bool)

(assert (=> b!1100996 (=> (not res!734357) (not e!628498))))

(assert (=> b!1100996 (= res!734357 (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(declare-fun b!1100997 () Bool)

(assert (=> b!1100997 (= e!628501 e!628505)))

(declare-fun res!734354 () Bool)

(assert (=> b!1100997 (= res!734354 call!46084)))

(assert (=> b!1100997 (=> (not res!734354) (not e!628505))))

(declare-fun b!1100998 () Bool)

(declare-fun call!46083 () ListLongMap!15323)

(assert (=> b!1100998 (= e!628499 call!46083)))

(declare-fun bm!46079 () Bool)

(assert (=> bm!46079 (= call!46083 call!46081)))

(declare-fun bm!46080 () Bool)

(assert (=> bm!46080 (= call!46080 (contains!6417 lt!492977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46081 () Bool)

(assert (=> bm!46081 (= call!46085 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100999 () Bool)

(assert (=> b!1100999 (= e!628497 (= (apply!957 lt!492977 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101000 () Bool)

(assert (=> b!1101000 (= e!628503 e!628509)))

(declare-fun c!109042 () Bool)

(assert (=> b!1101000 (= c!109042 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46082 () Bool)

(assert (=> bm!46082 (= call!46082 call!46085)))

(declare-fun b!1101001 () Bool)

(assert (=> b!1101001 (= e!628504 call!46083)))

(declare-fun d!130983 () Bool)

(assert (=> d!130983 e!628503))

(declare-fun res!734350 () Bool)

(assert (=> d!130983 (=> (not res!734350) (not e!628503))))

(assert (=> d!130983 (= res!734350 (or (bvsge #b00000000000000000000000000000000 (size!34842 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))))

(declare-fun lt!492970 () ListLongMap!15323)

(assert (=> d!130983 (= lt!492977 lt!492970)))

(declare-fun lt!492987 () Unit!36147)

(assert (=> d!130983 (= lt!492987 e!628502)))

(declare-fun c!109043 () Bool)

(assert (=> d!130983 (= c!109043 e!628506)))

(declare-fun res!734352 () Bool)

(assert (=> d!130983 (=> (not res!734352) (not e!628506))))

(assert (=> d!130983 (= res!734352 (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(assert (=> d!130983 (= lt!492970 e!628507)))

(assert (=> d!130983 (= c!109044 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130983 (validMask!0 mask!1414)))

(assert (=> d!130983 (= (getCurrentListMap!4385 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492977)))

(declare-fun b!1101002 () Bool)

(assert (=> b!1101002 (= e!628499 call!46079)))

(declare-fun b!1101003 () Bool)

(assert (=> b!1101003 (= e!628507 e!628504)))

(assert (=> b!1101003 (= c!109041 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130983 c!109044) b!1100985))

(assert (= (and d!130983 (not c!109044)) b!1101003))

(assert (= (and b!1101003 c!109041) b!1101001))

(assert (= (and b!1101003 (not c!109041)) b!1100988))

(assert (= (and b!1100988 c!109040) b!1100998))

(assert (= (and b!1100988 (not c!109040)) b!1101002))

(assert (= (or b!1100998 b!1101002) bm!46078))

(assert (= (or b!1101001 bm!46078) bm!46082))

(assert (= (or b!1101001 b!1100998) bm!46079))

(assert (= (or b!1100985 bm!46082) bm!46081))

(assert (= (or b!1100985 bm!46079) bm!46077))

(assert (= (and d!130983 res!734352) b!1100989))

(assert (= (and d!130983 c!109043) b!1100987))

(assert (= (and d!130983 (not c!109043)) b!1100992))

(assert (= (and d!130983 res!734350) b!1100996))

(assert (= (and b!1100996 res!734357) b!1100984))

(assert (= (and b!1100996 (not res!734349)) b!1100995))

(assert (= (and b!1100995 res!734351) b!1100983))

(assert (= (and b!1100996 res!734355) b!1100991))

(assert (= (and b!1100991 c!109039) b!1100997))

(assert (= (and b!1100991 (not c!109039)) b!1100990))

(assert (= (and b!1100997 res!734354) b!1100994))

(assert (= (or b!1100997 b!1100990) bm!46076))

(assert (= (and b!1100991 res!734356) b!1101000))

(assert (= (and b!1101000 c!109042) b!1100993))

(assert (= (and b!1101000 (not c!109042)) b!1100986))

(assert (= (and b!1100993 res!734353) b!1100999))

(assert (= (or b!1100993 b!1100986) bm!46080))

(declare-fun b_lambda!17945 () Bool)

(assert (=> (not b_lambda!17945) (not b!1100983)))

(assert (=> b!1100983 t!34124))

(declare-fun b_and!36993 () Bool)

(assert (= b_and!36983 (and (=> t!34124 result!16495) b_and!36993)))

(assert (=> b!1100989 m!1021293))

(assert (=> b!1100989 m!1021293))

(declare-fun m!1021297 () Bool)

(assert (=> b!1100989 m!1021297))

(declare-fun m!1021299 () Bool)

(assert (=> b!1100994 m!1021299))

(declare-fun m!1021301 () Bool)

(assert (=> bm!46080 m!1021301))

(assert (=> bm!46081 m!1021191))

(assert (=> b!1100984 m!1021293))

(assert (=> b!1100984 m!1021293))

(assert (=> b!1100984 m!1021297))

(declare-fun m!1021303 () Bool)

(assert (=> bm!46077 m!1021303))

(declare-fun m!1021305 () Bool)

(assert (=> b!1100985 m!1021305))

(declare-fun m!1021307 () Bool)

(assert (=> b!1100999 m!1021307))

(declare-fun m!1021309 () Bool)

(assert (=> b!1100987 m!1021309))

(assert (=> b!1100987 m!1021309))

(declare-fun m!1021311 () Bool)

(assert (=> b!1100987 m!1021311))

(declare-fun m!1021313 () Bool)

(assert (=> b!1100987 m!1021313))

(declare-fun m!1021315 () Bool)

(assert (=> b!1100987 m!1021315))

(declare-fun m!1021317 () Bool)

(assert (=> b!1100987 m!1021317))

(declare-fun m!1021319 () Bool)

(assert (=> b!1100987 m!1021319))

(declare-fun m!1021321 () Bool)

(assert (=> b!1100987 m!1021321))

(assert (=> b!1100987 m!1021191))

(declare-fun m!1021323 () Bool)

(assert (=> b!1100987 m!1021323))

(declare-fun m!1021325 () Bool)

(assert (=> b!1100987 m!1021325))

(assert (=> b!1100987 m!1021293))

(declare-fun m!1021327 () Bool)

(assert (=> b!1100987 m!1021327))

(assert (=> b!1100987 m!1021313))

(declare-fun m!1021329 () Bool)

(assert (=> b!1100987 m!1021329))

(declare-fun m!1021331 () Bool)

(assert (=> b!1100987 m!1021331))

(declare-fun m!1021333 () Bool)

(assert (=> b!1100987 m!1021333))

(assert (=> b!1100987 m!1021333))

(declare-fun m!1021335 () Bool)

(assert (=> b!1100987 m!1021335))

(assert (=> b!1100987 m!1021319))

(declare-fun m!1021337 () Bool)

(assert (=> b!1100987 m!1021337))

(declare-fun m!1021339 () Bool)

(assert (=> b!1100983 m!1021339))

(assert (=> b!1100983 m!1021293))

(declare-fun m!1021341 () Bool)

(assert (=> b!1100983 m!1021341))

(assert (=> b!1100983 m!1021339))

(assert (=> b!1100983 m!1021173))

(declare-fun m!1021343 () Bool)

(assert (=> b!1100983 m!1021343))

(assert (=> b!1100983 m!1021173))

(assert (=> b!1100983 m!1021293))

(assert (=> d!130983 m!1021151))

(declare-fun m!1021345 () Bool)

(assert (=> bm!46076 m!1021345))

(assert (=> b!1100995 m!1021293))

(assert (=> b!1100995 m!1021293))

(declare-fun m!1021347 () Bool)

(assert (=> b!1100995 m!1021347))

(assert (=> b!1100826 d!130983))

(declare-fun d!130985 () Bool)

(declare-fun lt!492994 () ListLongMap!15323)

(assert (=> d!130985 (not (contains!6417 lt!492994 k0!904))))

(declare-fun removeStrictlySorted!81 (List!23968 (_ BitVec 64)) List!23968)

(assert (=> d!130985 (= lt!492994 (ListLongMap!15324 (removeStrictlySorted!81 (toList!7677 lt!492863) k0!904)))))

(assert (=> d!130985 (= (-!949 lt!492863 k0!904) lt!492994)))

(declare-fun bs!32313 () Bool)

(assert (= bs!32313 d!130985))

(declare-fun m!1021349 () Bool)

(assert (=> bs!32313 m!1021349))

(declare-fun m!1021351 () Bool)

(assert (=> bs!32313 m!1021351))

(assert (=> b!1100826 d!130985))

(declare-fun call!46091 () ListLongMap!15323)

(declare-fun bm!46087 () Bool)

(assert (=> bm!46087 (= call!46091 (getCurrentListMapNoExtraKeys!4226 (array!71290 (store (arr!34305 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34842 _keys!1070)) (array!71292 (store (arr!34306 _values!874) i!650 (ValueCellFull!12875 (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34843 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130987 () Bool)

(declare-fun e!628514 () Bool)

(assert (=> d!130987 e!628514))

(declare-fun res!734360 () Bool)

(assert (=> d!130987 (=> (not res!734360) (not e!628514))))

(assert (=> d!130987 (= res!734360 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34842 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34842 _keys!1070))))))))

(declare-fun lt!492997 () Unit!36147)

(declare-fun choose!1772 (array!71289 array!71291 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36147)

(assert (=> d!130987 (= lt!492997 (choose!1772 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(assert (=> d!130987 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!219 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492997)))

(declare-fun b!1101010 () Bool)

(declare-fun e!628515 () Bool)

(declare-fun call!46090 () ListLongMap!15323)

(assert (=> b!1101010 (= e!628515 (= call!46091 call!46090))))

(assert (=> b!1101010 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34843 _values!874)))))

(declare-fun bm!46088 () Bool)

(assert (=> bm!46088 (= call!46090 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101011 () Bool)

(assert (=> b!1101011 (= e!628515 (= call!46091 (-!949 call!46090 k0!904)))))

(assert (=> b!1101011 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34843 _values!874)))))

(declare-fun b!1101012 () Bool)

(assert (=> b!1101012 (= e!628514 e!628515)))

(declare-fun c!109047 () Bool)

(assert (=> b!1101012 (= c!109047 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!130987 res!734360) b!1101012))

(assert (= (and b!1101012 c!109047) b!1101011))

(assert (= (and b!1101012 (not c!109047)) b!1101010))

(assert (= (or b!1101011 b!1101010) bm!46088))

(assert (= (or b!1101011 b!1101010) bm!46087))

(declare-fun b_lambda!17947 () Bool)

(assert (=> (not b_lambda!17947) (not bm!46087)))

(assert (=> bm!46087 t!34124))

(declare-fun b_and!36995 () Bool)

(assert (= b_and!36993 (and (=> t!34124 result!16495) b_and!36995)))

(assert (=> bm!46087 m!1021159))

(assert (=> bm!46087 m!1021173))

(assert (=> bm!46087 m!1021179))

(declare-fun m!1021353 () Bool)

(assert (=> bm!46087 m!1021353))

(declare-fun m!1021355 () Bool)

(assert (=> d!130987 m!1021355))

(assert (=> bm!46088 m!1021191))

(declare-fun m!1021357 () Bool)

(assert (=> b!1101011 m!1021357))

(assert (=> b!1100826 d!130987))

(declare-fun b!1101037 () Bool)

(declare-fun e!628530 () ListLongMap!15323)

(declare-fun call!46094 () ListLongMap!15323)

(assert (=> b!1101037 (= e!628530 call!46094)))

(declare-fun b!1101038 () Bool)

(declare-fun e!628531 () ListLongMap!15323)

(assert (=> b!1101038 (= e!628531 e!628530)))

(declare-fun c!109057 () Bool)

(assert (=> b!1101038 (= c!109057 (validKeyInArray!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(declare-fun b!1101039 () Bool)

(declare-fun e!628533 () Bool)

(declare-fun e!628536 () Bool)

(assert (=> b!1101039 (= e!628533 e!628536)))

(declare-fun c!109056 () Bool)

(declare-fun e!628534 () Bool)

(assert (=> b!1101039 (= c!109056 e!628534)))

(declare-fun res!734369 () Bool)

(assert (=> b!1101039 (=> (not res!734369) (not e!628534))))

(assert (=> b!1101039 (= res!734369 (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(declare-fun b!1101040 () Bool)

(assert (=> b!1101040 (= e!628531 (ListLongMap!15324 Nil!23965))))

(declare-fun b!1101041 () Bool)

(declare-fun res!734370 () Bool)

(assert (=> b!1101041 (=> (not res!734370) (not e!628533))))

(declare-fun lt!493016 () ListLongMap!15323)

(assert (=> b!1101041 (= res!734370 (not (contains!6417 lt!493016 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!46091 () Bool)

(assert (=> bm!46091 (= call!46094 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun d!130989 () Bool)

(assert (=> d!130989 e!628533))

(declare-fun res!734371 () Bool)

(assert (=> d!130989 (=> (not res!734371) (not e!628533))))

(assert (=> d!130989 (= res!734371 (not (contains!6417 lt!493016 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130989 (= lt!493016 e!628531)))

(declare-fun c!109058 () Bool)

(assert (=> d!130989 (= c!109058 (bvsge #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(assert (=> d!130989 (validMask!0 mask!1414)))

(assert (=> d!130989 (= (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493016)))

(declare-fun b!1101042 () Bool)

(assert (=> b!1101042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(assert (=> b!1101042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 lt!492864)))))

(declare-fun e!628532 () Bool)

(assert (=> b!1101042 (= e!628532 (= (apply!957 lt!493016 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)) (get!17663 (select (arr!34306 lt!492864) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101043 () Bool)

(assert (=> b!1101043 (= e!628534 (validKeyInArray!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(assert (=> b!1101043 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101044 () Bool)

(declare-fun e!628535 () Bool)

(assert (=> b!1101044 (= e!628536 e!628535)))

(declare-fun c!109059 () Bool)

(assert (=> b!1101044 (= c!109059 (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(declare-fun b!1101045 () Bool)

(assert (=> b!1101045 (= e!628536 e!628532)))

(assert (=> b!1101045 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(declare-fun res!734372 () Bool)

(assert (=> b!1101045 (= res!734372 (contains!6417 lt!493016 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(assert (=> b!1101045 (=> (not res!734372) (not e!628532))))

(declare-fun b!1101046 () Bool)

(assert (=> b!1101046 (= e!628535 (= lt!493016 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101047 () Bool)

(declare-fun lt!493017 () Unit!36147)

(declare-fun lt!493012 () Unit!36147)

(assert (=> b!1101047 (= lt!493017 lt!493012)))

(declare-fun lt!493015 () (_ BitVec 64))

(declare-fun lt!493014 () (_ BitVec 64))

(declare-fun lt!493013 () ListLongMap!15323)

(declare-fun lt!493018 () V!41353)

(assert (=> b!1101047 (not (contains!6417 (+!3409 lt!493013 (tuple2!17347 lt!493014 lt!493018)) lt!493015))))

(declare-fun addStillNotContains!278 (ListLongMap!15323 (_ BitVec 64) V!41353 (_ BitVec 64)) Unit!36147)

(assert (=> b!1101047 (= lt!493012 (addStillNotContains!278 lt!493013 lt!493014 lt!493018 lt!493015))))

(assert (=> b!1101047 (= lt!493015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101047 (= lt!493018 (get!17663 (select (arr!34306 lt!492864) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101047 (= lt!493014 (select (arr!34305 lt!492859) #b00000000000000000000000000000000))))

(assert (=> b!1101047 (= lt!493013 call!46094)))

(assert (=> b!1101047 (= e!628530 (+!3409 call!46094 (tuple2!17347 (select (arr!34305 lt!492859) #b00000000000000000000000000000000) (get!17663 (select (arr!34306 lt!492864) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101048 () Bool)

(declare-fun isEmpty!970 (ListLongMap!15323) Bool)

(assert (=> b!1101048 (= e!628535 (isEmpty!970 lt!493016))))

(assert (= (and d!130989 c!109058) b!1101040))

(assert (= (and d!130989 (not c!109058)) b!1101038))

(assert (= (and b!1101038 c!109057) b!1101047))

(assert (= (and b!1101038 (not c!109057)) b!1101037))

(assert (= (or b!1101047 b!1101037) bm!46091))

(assert (= (and d!130989 res!734371) b!1101041))

(assert (= (and b!1101041 res!734370) b!1101039))

(assert (= (and b!1101039 res!734369) b!1101043))

(assert (= (and b!1101039 c!109056) b!1101045))

(assert (= (and b!1101039 (not c!109056)) b!1101044))

(assert (= (and b!1101045 res!734372) b!1101042))

(assert (= (and b!1101044 c!109059) b!1101046))

(assert (= (and b!1101044 (not c!109059)) b!1101048))

(declare-fun b_lambda!17949 () Bool)

(assert (=> (not b_lambda!17949) (not b!1101042)))

(assert (=> b!1101042 t!34124))

(declare-fun b_and!36997 () Bool)

(assert (= b_and!36995 (and (=> t!34124 result!16495) b_and!36997)))

(declare-fun b_lambda!17951 () Bool)

(assert (=> (not b_lambda!17951) (not b!1101047)))

(assert (=> b!1101047 t!34124))

(declare-fun b_and!36999 () Bool)

(assert (= b_and!36997 (and (=> t!34124 result!16495) b_and!36999)))

(declare-fun m!1021359 () Bool)

(assert (=> b!1101048 m!1021359))

(declare-fun m!1021361 () Bool)

(assert (=> d!130989 m!1021361))

(assert (=> d!130989 m!1021151))

(assert (=> b!1101038 m!1021285))

(assert (=> b!1101038 m!1021285))

(assert (=> b!1101038 m!1021289))

(declare-fun m!1021363 () Bool)

(assert (=> b!1101041 m!1021363))

(assert (=> b!1101047 m!1021285))

(declare-fun m!1021365 () Bool)

(assert (=> b!1101047 m!1021365))

(assert (=> b!1101047 m!1021173))

(declare-fun m!1021367 () Bool)

(assert (=> b!1101047 m!1021367))

(assert (=> b!1101047 m!1021173))

(declare-fun m!1021369 () Bool)

(assert (=> b!1101047 m!1021369))

(assert (=> b!1101047 m!1021367))

(declare-fun m!1021371 () Bool)

(assert (=> b!1101047 m!1021371))

(assert (=> b!1101047 m!1021371))

(declare-fun m!1021373 () Bool)

(assert (=> b!1101047 m!1021373))

(declare-fun m!1021375 () Bool)

(assert (=> b!1101047 m!1021375))

(declare-fun m!1021377 () Bool)

(assert (=> bm!46091 m!1021377))

(assert (=> b!1101043 m!1021285))

(assert (=> b!1101043 m!1021285))

(assert (=> b!1101043 m!1021289))

(assert (=> b!1101042 m!1021285))

(assert (=> b!1101042 m!1021285))

(declare-fun m!1021379 () Bool)

(assert (=> b!1101042 m!1021379))

(assert (=> b!1101042 m!1021173))

(assert (=> b!1101042 m!1021367))

(assert (=> b!1101042 m!1021173))

(assert (=> b!1101042 m!1021369))

(assert (=> b!1101042 m!1021367))

(assert (=> b!1101046 m!1021377))

(assert (=> b!1101045 m!1021285))

(assert (=> b!1101045 m!1021285))

(declare-fun m!1021381 () Bool)

(assert (=> b!1101045 m!1021381))

(assert (=> b!1100826 d!130989))

(declare-fun e!628540 () Bool)

(declare-fun lt!493026 () ListLongMap!15323)

(declare-fun b!1101049 () Bool)

(assert (=> b!1101049 (= e!628540 (= (apply!957 lt!493026 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)) (get!17663 (select (arr!34306 lt!492864) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1101049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 lt!492864)))))

(assert (=> b!1101049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(declare-fun b!1101050 () Bool)

(declare-fun e!628538 () Bool)

(assert (=> b!1101050 (= e!628538 (validKeyInArray!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(declare-fun b!1101051 () Bool)

(declare-fun e!628547 () ListLongMap!15323)

(declare-fun call!46097 () ListLongMap!15323)

(assert (=> b!1101051 (= e!628547 (+!3409 call!46097 (tuple2!17347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1101052 () Bool)

(declare-fun e!628549 () Bool)

(declare-fun call!46096 () Bool)

(assert (=> b!1101052 (= e!628549 (not call!46096))))

(declare-fun b!1101053 () Bool)

(declare-fun e!628542 () Unit!36147)

(declare-fun lt!493022 () Unit!36147)

(assert (=> b!1101053 (= e!628542 lt!493022)))

(declare-fun lt!493028 () ListLongMap!15323)

(assert (=> b!1101053 (= lt!493028 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493033 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493027 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493027 (select (arr!34305 lt!492859) #b00000000000000000000000000000000))))

(declare-fun lt!493031 () Unit!36147)

(assert (=> b!1101053 (= lt!493031 (addStillContains!661 lt!493028 lt!493033 zeroValue!831 lt!493027))))

(assert (=> b!1101053 (contains!6417 (+!3409 lt!493028 (tuple2!17347 lt!493033 zeroValue!831)) lt!493027)))

(declare-fun lt!493021 () Unit!36147)

(assert (=> b!1101053 (= lt!493021 lt!493031)))

(declare-fun lt!493025 () ListLongMap!15323)

(assert (=> b!1101053 (= lt!493025 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493020 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493020 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493034 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493034 (select (arr!34305 lt!492859) #b00000000000000000000000000000000))))

(declare-fun lt!493039 () Unit!36147)

(assert (=> b!1101053 (= lt!493039 (addApplyDifferent!517 lt!493025 lt!493020 minValue!831 lt!493034))))

(assert (=> b!1101053 (= (apply!957 (+!3409 lt!493025 (tuple2!17347 lt!493020 minValue!831)) lt!493034) (apply!957 lt!493025 lt!493034))))

(declare-fun lt!493032 () Unit!36147)

(assert (=> b!1101053 (= lt!493032 lt!493039)))

(declare-fun lt!493040 () ListLongMap!15323)

(assert (=> b!1101053 (= lt!493040 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493024 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493037 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493037 (select (arr!34305 lt!492859) #b00000000000000000000000000000000))))

(declare-fun lt!493038 () Unit!36147)

(assert (=> b!1101053 (= lt!493038 (addApplyDifferent!517 lt!493040 lt!493024 zeroValue!831 lt!493037))))

(assert (=> b!1101053 (= (apply!957 (+!3409 lt!493040 (tuple2!17347 lt!493024 zeroValue!831)) lt!493037) (apply!957 lt!493040 lt!493037))))

(declare-fun lt!493035 () Unit!36147)

(assert (=> b!1101053 (= lt!493035 lt!493038)))

(declare-fun lt!493029 () ListLongMap!15323)

(assert (=> b!1101053 (= lt!493029 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493030 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493030 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493023 () (_ BitVec 64))

(assert (=> b!1101053 (= lt!493023 (select (arr!34305 lt!492859) #b00000000000000000000000000000000))))

(assert (=> b!1101053 (= lt!493022 (addApplyDifferent!517 lt!493029 lt!493030 minValue!831 lt!493023))))

(assert (=> b!1101053 (= (apply!957 (+!3409 lt!493029 (tuple2!17347 lt!493030 minValue!831)) lt!493023) (apply!957 lt!493029 lt!493023))))

(declare-fun b!1101054 () Bool)

(declare-fun c!109061 () Bool)

(assert (=> b!1101054 (= c!109061 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!628544 () ListLongMap!15323)

(declare-fun e!628539 () ListLongMap!15323)

(assert (=> b!1101054 (= e!628544 e!628539)))

(declare-fun b!1101055 () Bool)

(declare-fun e!628546 () Bool)

(assert (=> b!1101055 (= e!628546 (validKeyInArray!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(declare-fun bm!46092 () Bool)

(declare-fun call!46100 () Bool)

(assert (=> bm!46092 (= call!46100 (contains!6417 lt!493026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1101056 () Bool)

(declare-fun e!628541 () Bool)

(assert (=> b!1101056 (= e!628541 (not call!46100))))

(declare-fun c!109065 () Bool)

(declare-fun call!46098 () ListLongMap!15323)

(declare-fun call!46095 () ListLongMap!15323)

(declare-fun bm!46093 () Bool)

(declare-fun c!109062 () Bool)

(declare-fun call!46101 () ListLongMap!15323)

(assert (=> bm!46093 (= call!46097 (+!3409 (ite c!109065 call!46101 (ite c!109062 call!46098 call!46095)) (ite (or c!109065 c!109062) (tuple2!17347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1101057 () Bool)

(declare-fun res!734380 () Bool)

(declare-fun e!628543 () Bool)

(assert (=> b!1101057 (=> (not res!734380) (not e!628543))))

(assert (=> b!1101057 (= res!734380 e!628541)))

(declare-fun c!109060 () Bool)

(assert (=> b!1101057 (= c!109060 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!46094 () Bool)

(assert (=> bm!46094 (= call!46095 call!46098)))

(declare-fun b!1101058 () Bool)

(declare-fun Unit!36152 () Unit!36147)

(assert (=> b!1101058 (= e!628542 Unit!36152)))

(declare-fun b!1101059 () Bool)

(declare-fun e!628537 () Bool)

(assert (=> b!1101059 (= e!628549 e!628537)))

(declare-fun res!734377 () Bool)

(assert (=> b!1101059 (= res!734377 call!46096)))

(assert (=> b!1101059 (=> (not res!734377) (not e!628537))))

(declare-fun b!1101060 () Bool)

(declare-fun e!628545 () Bool)

(assert (=> b!1101060 (= e!628545 (= (apply!957 lt!493026 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1101061 () Bool)

(declare-fun e!628548 () Bool)

(assert (=> b!1101061 (= e!628548 e!628540)))

(declare-fun res!734375 () Bool)

(assert (=> b!1101061 (=> (not res!734375) (not e!628540))))

(assert (=> b!1101061 (= res!734375 (contains!6417 lt!493026 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(assert (=> b!1101061 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(declare-fun b!1101062 () Bool)

(declare-fun res!734379 () Bool)

(assert (=> b!1101062 (=> (not res!734379) (not e!628543))))

(assert (=> b!1101062 (= res!734379 e!628548)))

(declare-fun res!734373 () Bool)

(assert (=> b!1101062 (=> res!734373 e!628548)))

(assert (=> b!1101062 (= res!734373 (not e!628538))))

(declare-fun res!734381 () Bool)

(assert (=> b!1101062 (=> (not res!734381) (not e!628538))))

(assert (=> b!1101062 (= res!734381 (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(declare-fun b!1101063 () Bool)

(assert (=> b!1101063 (= e!628541 e!628545)))

(declare-fun res!734378 () Bool)

(assert (=> b!1101063 (= res!734378 call!46100)))

(assert (=> b!1101063 (=> (not res!734378) (not e!628545))))

(declare-fun b!1101064 () Bool)

(declare-fun call!46099 () ListLongMap!15323)

(assert (=> b!1101064 (= e!628539 call!46099)))

(declare-fun bm!46095 () Bool)

(assert (=> bm!46095 (= call!46099 call!46097)))

(declare-fun bm!46096 () Bool)

(assert (=> bm!46096 (= call!46096 (contains!6417 lt!493026 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46097 () Bool)

(assert (=> bm!46097 (= call!46101 (getCurrentListMapNoExtraKeys!4226 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1101065 () Bool)

(assert (=> b!1101065 (= e!628537 (= (apply!957 lt!493026 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1101066 () Bool)

(assert (=> b!1101066 (= e!628543 e!628549)))

(declare-fun c!109063 () Bool)

(assert (=> b!1101066 (= c!109063 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46098 () Bool)

(assert (=> bm!46098 (= call!46098 call!46101)))

(declare-fun b!1101067 () Bool)

(assert (=> b!1101067 (= e!628544 call!46099)))

(declare-fun d!130991 () Bool)

(assert (=> d!130991 e!628543))

(declare-fun res!734374 () Bool)

(assert (=> d!130991 (=> (not res!734374) (not e!628543))))

(assert (=> d!130991 (= res!734374 (or (bvsge #b00000000000000000000000000000000 (size!34842 lt!492859)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))))

(declare-fun lt!493019 () ListLongMap!15323)

(assert (=> d!130991 (= lt!493026 lt!493019)))

(declare-fun lt!493036 () Unit!36147)

(assert (=> d!130991 (= lt!493036 e!628542)))

(declare-fun c!109064 () Bool)

(assert (=> d!130991 (= c!109064 e!628546)))

(declare-fun res!734376 () Bool)

(assert (=> d!130991 (=> (not res!734376) (not e!628546))))

(assert (=> d!130991 (= res!734376 (bvslt #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(assert (=> d!130991 (= lt!493019 e!628547)))

(assert (=> d!130991 (= c!109065 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130991 (validMask!0 mask!1414)))

(assert (=> d!130991 (= (getCurrentListMap!4385 lt!492859 lt!492864 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493026)))

(declare-fun b!1101068 () Bool)

(assert (=> b!1101068 (= e!628539 call!46095)))

(declare-fun b!1101069 () Bool)

(assert (=> b!1101069 (= e!628547 e!628544)))

(assert (=> b!1101069 (= c!109062 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130991 c!109065) b!1101051))

(assert (= (and d!130991 (not c!109065)) b!1101069))

(assert (= (and b!1101069 c!109062) b!1101067))

(assert (= (and b!1101069 (not c!109062)) b!1101054))

(assert (= (and b!1101054 c!109061) b!1101064))

(assert (= (and b!1101054 (not c!109061)) b!1101068))

(assert (= (or b!1101064 b!1101068) bm!46094))

(assert (= (or b!1101067 bm!46094) bm!46098))

(assert (= (or b!1101067 b!1101064) bm!46095))

(assert (= (or b!1101051 bm!46098) bm!46097))

(assert (= (or b!1101051 bm!46095) bm!46093))

(assert (= (and d!130991 res!734376) b!1101055))

(assert (= (and d!130991 c!109064) b!1101053))

(assert (= (and d!130991 (not c!109064)) b!1101058))

(assert (= (and d!130991 res!734374) b!1101062))

(assert (= (and b!1101062 res!734381) b!1101050))

(assert (= (and b!1101062 (not res!734373)) b!1101061))

(assert (= (and b!1101061 res!734375) b!1101049))

(assert (= (and b!1101062 res!734379) b!1101057))

(assert (= (and b!1101057 c!109060) b!1101063))

(assert (= (and b!1101057 (not c!109060)) b!1101056))

(assert (= (and b!1101063 res!734378) b!1101060))

(assert (= (or b!1101063 b!1101056) bm!46092))

(assert (= (and b!1101057 res!734380) b!1101066))

(assert (= (and b!1101066 c!109063) b!1101059))

(assert (= (and b!1101066 (not c!109063)) b!1101052))

(assert (= (and b!1101059 res!734377) b!1101065))

(assert (= (or b!1101059 b!1101052) bm!46096))

(declare-fun b_lambda!17953 () Bool)

(assert (=> (not b_lambda!17953) (not b!1101049)))

(assert (=> b!1101049 t!34124))

(declare-fun b_and!37001 () Bool)

(assert (= b_and!36999 (and (=> t!34124 result!16495) b_and!37001)))

(assert (=> b!1101055 m!1021285))

(assert (=> b!1101055 m!1021285))

(assert (=> b!1101055 m!1021289))

(declare-fun m!1021383 () Bool)

(assert (=> b!1101060 m!1021383))

(declare-fun m!1021385 () Bool)

(assert (=> bm!46096 m!1021385))

(assert (=> bm!46097 m!1021189))

(assert (=> b!1101050 m!1021285))

(assert (=> b!1101050 m!1021285))

(assert (=> b!1101050 m!1021289))

(declare-fun m!1021387 () Bool)

(assert (=> bm!46093 m!1021387))

(declare-fun m!1021389 () Bool)

(assert (=> b!1101051 m!1021389))

(declare-fun m!1021391 () Bool)

(assert (=> b!1101065 m!1021391))

(declare-fun m!1021393 () Bool)

(assert (=> b!1101053 m!1021393))

(assert (=> b!1101053 m!1021393))

(declare-fun m!1021395 () Bool)

(assert (=> b!1101053 m!1021395))

(declare-fun m!1021397 () Bool)

(assert (=> b!1101053 m!1021397))

(declare-fun m!1021399 () Bool)

(assert (=> b!1101053 m!1021399))

(declare-fun m!1021401 () Bool)

(assert (=> b!1101053 m!1021401))

(declare-fun m!1021403 () Bool)

(assert (=> b!1101053 m!1021403))

(declare-fun m!1021405 () Bool)

(assert (=> b!1101053 m!1021405))

(assert (=> b!1101053 m!1021189))

(declare-fun m!1021407 () Bool)

(assert (=> b!1101053 m!1021407))

(declare-fun m!1021409 () Bool)

(assert (=> b!1101053 m!1021409))

(assert (=> b!1101053 m!1021285))

(declare-fun m!1021411 () Bool)

(assert (=> b!1101053 m!1021411))

(assert (=> b!1101053 m!1021397))

(declare-fun m!1021413 () Bool)

(assert (=> b!1101053 m!1021413))

(declare-fun m!1021415 () Bool)

(assert (=> b!1101053 m!1021415))

(declare-fun m!1021417 () Bool)

(assert (=> b!1101053 m!1021417))

(assert (=> b!1101053 m!1021417))

(declare-fun m!1021419 () Bool)

(assert (=> b!1101053 m!1021419))

(assert (=> b!1101053 m!1021403))

(declare-fun m!1021421 () Bool)

(assert (=> b!1101053 m!1021421))

(assert (=> b!1101049 m!1021367))

(assert (=> b!1101049 m!1021285))

(declare-fun m!1021423 () Bool)

(assert (=> b!1101049 m!1021423))

(assert (=> b!1101049 m!1021367))

(assert (=> b!1101049 m!1021173))

(assert (=> b!1101049 m!1021369))

(assert (=> b!1101049 m!1021173))

(assert (=> b!1101049 m!1021285))

(assert (=> d!130991 m!1021151))

(declare-fun m!1021425 () Bool)

(assert (=> bm!46092 m!1021425))

(assert (=> b!1101061 m!1021285))

(assert (=> b!1101061 m!1021285))

(declare-fun m!1021427 () Bool)

(assert (=> b!1101061 m!1021427))

(assert (=> b!1100826 d!130991))

(declare-fun b!1101070 () Bool)

(declare-fun e!628550 () ListLongMap!15323)

(declare-fun call!46102 () ListLongMap!15323)

(assert (=> b!1101070 (= e!628550 call!46102)))

(declare-fun b!1101071 () Bool)

(declare-fun e!628551 () ListLongMap!15323)

(assert (=> b!1101071 (= e!628551 e!628550)))

(declare-fun c!109067 () Bool)

(assert (=> b!1101071 (= c!109067 (validKeyInArray!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101072 () Bool)

(declare-fun e!628553 () Bool)

(declare-fun e!628556 () Bool)

(assert (=> b!1101072 (= e!628553 e!628556)))

(declare-fun c!109066 () Bool)

(declare-fun e!628554 () Bool)

(assert (=> b!1101072 (= c!109066 e!628554)))

(declare-fun res!734382 () Bool)

(assert (=> b!1101072 (=> (not res!734382) (not e!628554))))

(assert (=> b!1101072 (= res!734382 (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(declare-fun b!1101073 () Bool)

(assert (=> b!1101073 (= e!628551 (ListLongMap!15324 Nil!23965))))

(declare-fun b!1101074 () Bool)

(declare-fun res!734383 () Bool)

(assert (=> b!1101074 (=> (not res!734383) (not e!628553))))

(declare-fun lt!493045 () ListLongMap!15323)

(assert (=> b!1101074 (= res!734383 (not (contains!6417 lt!493045 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!46099 () Bool)

(assert (=> bm!46099 (= call!46102 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun d!130993 () Bool)

(assert (=> d!130993 e!628553))

(declare-fun res!734384 () Bool)

(assert (=> d!130993 (=> (not res!734384) (not e!628553))))

(assert (=> d!130993 (= res!734384 (not (contains!6417 lt!493045 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130993 (= lt!493045 e!628551)))

(declare-fun c!109068 () Bool)

(assert (=> d!130993 (= c!109068 (bvsge #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(assert (=> d!130993 (validMask!0 mask!1414)))

(assert (=> d!130993 (= (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493045)))

(declare-fun b!1101075 () Bool)

(assert (=> b!1101075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(assert (=> b!1101075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 _values!874)))))

(declare-fun e!628552 () Bool)

(assert (=> b!1101075 (= e!628552 (= (apply!957 lt!493045 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)) (get!17663 (select (arr!34306 _values!874) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1101076 () Bool)

(assert (=> b!1101076 (= e!628554 (validKeyInArray!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101076 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1101077 () Bool)

(declare-fun e!628555 () Bool)

(assert (=> b!1101077 (= e!628556 e!628555)))

(declare-fun c!109069 () Bool)

(assert (=> b!1101077 (= c!109069 (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(declare-fun b!1101078 () Bool)

(assert (=> b!1101078 (= e!628556 e!628552)))

(assert (=> b!1101078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(declare-fun res!734385 () Bool)

(assert (=> b!1101078 (= res!734385 (contains!6417 lt!493045 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1101078 (=> (not res!734385) (not e!628552))))

(declare-fun b!1101079 () Bool)

(assert (=> b!1101079 (= e!628555 (= lt!493045 (getCurrentListMapNoExtraKeys!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1101080 () Bool)

(declare-fun lt!493046 () Unit!36147)

(declare-fun lt!493041 () Unit!36147)

(assert (=> b!1101080 (= lt!493046 lt!493041)))

(declare-fun lt!493043 () (_ BitVec 64))

(declare-fun lt!493042 () ListLongMap!15323)

(declare-fun lt!493044 () (_ BitVec 64))

(declare-fun lt!493047 () V!41353)

(assert (=> b!1101080 (not (contains!6417 (+!3409 lt!493042 (tuple2!17347 lt!493043 lt!493047)) lt!493044))))

(assert (=> b!1101080 (= lt!493041 (addStillNotContains!278 lt!493042 lt!493043 lt!493047 lt!493044))))

(assert (=> b!1101080 (= lt!493044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1101080 (= lt!493047 (get!17663 (select (arr!34306 _values!874) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1101080 (= lt!493043 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1101080 (= lt!493042 call!46102)))

(assert (=> b!1101080 (= e!628550 (+!3409 call!46102 (tuple2!17347 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000) (get!17663 (select (arr!34306 _values!874) #b00000000000000000000000000000000) (dynLambda!2344 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1101081 () Bool)

(assert (=> b!1101081 (= e!628555 (isEmpty!970 lt!493045))))

(assert (= (and d!130993 c!109068) b!1101073))

(assert (= (and d!130993 (not c!109068)) b!1101071))

(assert (= (and b!1101071 c!109067) b!1101080))

(assert (= (and b!1101071 (not c!109067)) b!1101070))

(assert (= (or b!1101080 b!1101070) bm!46099))

(assert (= (and d!130993 res!734384) b!1101074))

(assert (= (and b!1101074 res!734383) b!1101072))

(assert (= (and b!1101072 res!734382) b!1101076))

(assert (= (and b!1101072 c!109066) b!1101078))

(assert (= (and b!1101072 (not c!109066)) b!1101077))

(assert (= (and b!1101078 res!734385) b!1101075))

(assert (= (and b!1101077 c!109069) b!1101079))

(assert (= (and b!1101077 (not c!109069)) b!1101081))

(declare-fun b_lambda!17955 () Bool)

(assert (=> (not b_lambda!17955) (not b!1101075)))

(assert (=> b!1101075 t!34124))

(declare-fun b_and!37003 () Bool)

(assert (= b_and!37001 (and (=> t!34124 result!16495) b_and!37003)))

(declare-fun b_lambda!17957 () Bool)

(assert (=> (not b_lambda!17957) (not b!1101080)))

(assert (=> b!1101080 t!34124))

(declare-fun b_and!37005 () Bool)

(assert (= b_and!37003 (and (=> t!34124 result!16495) b_and!37005)))

(declare-fun m!1021429 () Bool)

(assert (=> b!1101081 m!1021429))

(declare-fun m!1021431 () Bool)

(assert (=> d!130993 m!1021431))

(assert (=> d!130993 m!1021151))

(assert (=> b!1101071 m!1021293))

(assert (=> b!1101071 m!1021293))

(assert (=> b!1101071 m!1021297))

(declare-fun m!1021433 () Bool)

(assert (=> b!1101074 m!1021433))

(assert (=> b!1101080 m!1021293))

(declare-fun m!1021435 () Bool)

(assert (=> b!1101080 m!1021435))

(assert (=> b!1101080 m!1021173))

(assert (=> b!1101080 m!1021339))

(assert (=> b!1101080 m!1021173))

(assert (=> b!1101080 m!1021343))

(assert (=> b!1101080 m!1021339))

(declare-fun m!1021437 () Bool)

(assert (=> b!1101080 m!1021437))

(assert (=> b!1101080 m!1021437))

(declare-fun m!1021439 () Bool)

(assert (=> b!1101080 m!1021439))

(declare-fun m!1021441 () Bool)

(assert (=> b!1101080 m!1021441))

(declare-fun m!1021443 () Bool)

(assert (=> bm!46099 m!1021443))

(assert (=> b!1101076 m!1021293))

(assert (=> b!1101076 m!1021293))

(assert (=> b!1101076 m!1021297))

(assert (=> b!1101075 m!1021293))

(assert (=> b!1101075 m!1021293))

(declare-fun m!1021445 () Bool)

(assert (=> b!1101075 m!1021445))

(assert (=> b!1101075 m!1021173))

(assert (=> b!1101075 m!1021339))

(assert (=> b!1101075 m!1021173))

(assert (=> b!1101075 m!1021343))

(assert (=> b!1101075 m!1021339))

(assert (=> b!1101079 m!1021443))

(assert (=> b!1101078 m!1021293))

(assert (=> b!1101078 m!1021293))

(declare-fun m!1021447 () Bool)

(assert (=> b!1101078 m!1021447))

(assert (=> b!1100826 d!130993))

(declare-fun d!130995 () Bool)

(assert (=> d!130995 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493050 () Unit!36147)

(declare-fun choose!13 (array!71289 (_ BitVec 64) (_ BitVec 32)) Unit!36147)

(assert (=> d!130995 (= lt!493050 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130995 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130995 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493050)))

(declare-fun bs!32314 () Bool)

(assert (= bs!32314 d!130995))

(assert (=> bs!32314 m!1021181))

(declare-fun m!1021449 () Bool)

(assert (=> bs!32314 m!1021449))

(assert (=> b!1100826 d!130995))

(declare-fun b!1101090 () Bool)

(declare-fun e!628565 () Bool)

(declare-fun call!46105 () Bool)

(assert (=> b!1101090 (= e!628565 call!46105)))

(declare-fun bm!46102 () Bool)

(assert (=> bm!46102 (= call!46105 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130997 () Bool)

(declare-fun res!734390 () Bool)

(declare-fun e!628563 () Bool)

(assert (=> d!130997 (=> res!734390 e!628563)))

(assert (=> d!130997 (= res!734390 (bvsge #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(assert (=> d!130997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!628563)))

(declare-fun b!1101091 () Bool)

(declare-fun e!628564 () Bool)

(assert (=> b!1101091 (= e!628564 e!628565)))

(declare-fun lt!493057 () (_ BitVec 64))

(assert (=> b!1101091 (= lt!493057 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493058 () Unit!36147)

(assert (=> b!1101091 (= lt!493058 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493057 #b00000000000000000000000000000000))))

(assert (=> b!1101091 (arrayContainsKey!0 _keys!1070 lt!493057 #b00000000000000000000000000000000)))

(declare-fun lt!493059 () Unit!36147)

(assert (=> b!1101091 (= lt!493059 lt!493058)))

(declare-fun res!734391 () Bool)

(declare-datatypes ((SeekEntryResult!9867 0))(
  ( (MissingZero!9867 (index!41839 (_ BitVec 32))) (Found!9867 (index!41840 (_ BitVec 32))) (Intermediate!9867 (undefined!10679 Bool) (index!41841 (_ BitVec 32)) (x!98874 (_ BitVec 32))) (Undefined!9867) (MissingVacant!9867 (index!41842 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71289 (_ BitVec 32)) SeekEntryResult!9867)

(assert (=> b!1101091 (= res!734391 (= (seekEntryOrOpen!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9867 #b00000000000000000000000000000000)))))

(assert (=> b!1101091 (=> (not res!734391) (not e!628565))))

(declare-fun b!1101092 () Bool)

(assert (=> b!1101092 (= e!628563 e!628564)))

(declare-fun c!109072 () Bool)

(assert (=> b!1101092 (= c!109072 (validKeyInArray!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101093 () Bool)

(assert (=> b!1101093 (= e!628564 call!46105)))

(assert (= (and d!130997 (not res!734390)) b!1101092))

(assert (= (and b!1101092 c!109072) b!1101091))

(assert (= (and b!1101092 (not c!109072)) b!1101093))

(assert (= (and b!1101091 res!734391) b!1101090))

(assert (= (or b!1101090 b!1101093) bm!46102))

(declare-fun m!1021451 () Bool)

(assert (=> bm!46102 m!1021451))

(assert (=> b!1101091 m!1021293))

(declare-fun m!1021453 () Bool)

(assert (=> b!1101091 m!1021453))

(declare-fun m!1021455 () Bool)

(assert (=> b!1101091 m!1021455))

(assert (=> b!1101091 m!1021293))

(declare-fun m!1021457 () Bool)

(assert (=> b!1101091 m!1021457))

(assert (=> b!1101092 m!1021293))

(assert (=> b!1101092 m!1021293))

(assert (=> b!1101092 m!1021297))

(assert (=> b!1100825 d!130997))

(declare-fun b!1101094 () Bool)

(declare-fun e!628568 () Bool)

(declare-fun call!46106 () Bool)

(assert (=> b!1101094 (= e!628568 call!46106)))

(declare-fun bm!46103 () Bool)

(assert (=> bm!46103 (= call!46106 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!492859 mask!1414))))

(declare-fun d!130999 () Bool)

(declare-fun res!734392 () Bool)

(declare-fun e!628566 () Bool)

(assert (=> d!130999 (=> res!734392 e!628566)))

(assert (=> d!130999 (= res!734392 (bvsge #b00000000000000000000000000000000 (size!34842 lt!492859)))))

(assert (=> d!130999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492859 mask!1414) e!628566)))

(declare-fun b!1101095 () Bool)

(declare-fun e!628567 () Bool)

(assert (=> b!1101095 (= e!628567 e!628568)))

(declare-fun lt!493060 () (_ BitVec 64))

(assert (=> b!1101095 (= lt!493060 (select (arr!34305 lt!492859) #b00000000000000000000000000000000))))

(declare-fun lt!493061 () Unit!36147)

(assert (=> b!1101095 (= lt!493061 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!492859 lt!493060 #b00000000000000000000000000000000))))

(assert (=> b!1101095 (arrayContainsKey!0 lt!492859 lt!493060 #b00000000000000000000000000000000)))

(declare-fun lt!493062 () Unit!36147)

(assert (=> b!1101095 (= lt!493062 lt!493061)))

(declare-fun res!734393 () Bool)

(assert (=> b!1101095 (= res!734393 (= (seekEntryOrOpen!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000) lt!492859 mask!1414) (Found!9867 #b00000000000000000000000000000000)))))

(assert (=> b!1101095 (=> (not res!734393) (not e!628568))))

(declare-fun b!1101096 () Bool)

(assert (=> b!1101096 (= e!628566 e!628567)))

(declare-fun c!109073 () Bool)

(assert (=> b!1101096 (= c!109073 (validKeyInArray!0 (select (arr!34305 lt!492859) #b00000000000000000000000000000000)))))

(declare-fun b!1101097 () Bool)

(assert (=> b!1101097 (= e!628567 call!46106)))

(assert (= (and d!130999 (not res!734392)) b!1101096))

(assert (= (and b!1101096 c!109073) b!1101095))

(assert (= (and b!1101096 (not c!109073)) b!1101097))

(assert (= (and b!1101095 res!734393) b!1101094))

(assert (= (or b!1101094 b!1101097) bm!46103))

(declare-fun m!1021459 () Bool)

(assert (=> bm!46103 m!1021459))

(assert (=> b!1101095 m!1021285))

(declare-fun m!1021461 () Bool)

(assert (=> b!1101095 m!1021461))

(declare-fun m!1021463 () Bool)

(assert (=> b!1101095 m!1021463))

(assert (=> b!1101095 m!1021285))

(declare-fun m!1021465 () Bool)

(assert (=> b!1101095 m!1021465))

(assert (=> b!1101096 m!1021285))

(assert (=> b!1101096 m!1021285))

(assert (=> b!1101096 m!1021289))

(assert (=> b!1100834 d!130999))

(declare-fun d!131001 () Bool)

(assert (=> d!131001 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96908 d!131001))

(declare-fun d!131003 () Bool)

(assert (=> d!131003 (= (array_inv!26448 _keys!1070) (bvsge (size!34842 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96908 d!131003))

(declare-fun d!131005 () Bool)

(assert (=> d!131005 (= (array_inv!26449 _values!874) (bvsge (size!34843 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96908 d!131005))

(declare-fun d!131007 () Bool)

(declare-fun e!628571 () Bool)

(assert (=> d!131007 e!628571))

(declare-fun res!734399 () Bool)

(assert (=> d!131007 (=> (not res!734399) (not e!628571))))

(declare-fun lt!493071 () ListLongMap!15323)

(assert (=> d!131007 (= res!734399 (contains!6417 lt!493071 (_1!8684 lt!492860)))))

(declare-fun lt!493072 () List!23968)

(assert (=> d!131007 (= lt!493071 (ListLongMap!15324 lt!493072))))

(declare-fun lt!493074 () Unit!36147)

(declare-fun lt!493073 () Unit!36147)

(assert (=> d!131007 (= lt!493074 lt!493073)))

(declare-datatypes ((Option!670 0))(
  ( (Some!669 (v!16266 V!41353)) (None!668) )
))
(declare-fun getValueByKey!619 (List!23968 (_ BitVec 64)) Option!670)

(assert (=> d!131007 (= (getValueByKey!619 lt!493072 (_1!8684 lt!492860)) (Some!669 (_2!8684 lt!492860)))))

(declare-fun lemmaContainsTupThenGetReturnValue!301 (List!23968 (_ BitVec 64) V!41353) Unit!36147)

(assert (=> d!131007 (= lt!493073 (lemmaContainsTupThenGetReturnValue!301 lt!493072 (_1!8684 lt!492860) (_2!8684 lt!492860)))))

(declare-fun insertStrictlySorted!394 (List!23968 (_ BitVec 64) V!41353) List!23968)

(assert (=> d!131007 (= lt!493072 (insertStrictlySorted!394 (toList!7677 lt!492863) (_1!8684 lt!492860) (_2!8684 lt!492860)))))

(assert (=> d!131007 (= (+!3409 lt!492863 lt!492860) lt!493071)))

(declare-fun b!1101102 () Bool)

(declare-fun res!734398 () Bool)

(assert (=> b!1101102 (=> (not res!734398) (not e!628571))))

(assert (=> b!1101102 (= res!734398 (= (getValueByKey!619 (toList!7677 lt!493071) (_1!8684 lt!492860)) (Some!669 (_2!8684 lt!492860))))))

(declare-fun b!1101103 () Bool)

(declare-fun contains!6418 (List!23968 tuple2!17346) Bool)

(assert (=> b!1101103 (= e!628571 (contains!6418 (toList!7677 lt!493071) lt!492860))))

(assert (= (and d!131007 res!734399) b!1101102))

(assert (= (and b!1101102 res!734398) b!1101103))

(declare-fun m!1021467 () Bool)

(assert (=> d!131007 m!1021467))

(declare-fun m!1021469 () Bool)

(assert (=> d!131007 m!1021469))

(declare-fun m!1021471 () Bool)

(assert (=> d!131007 m!1021471))

(declare-fun m!1021473 () Bool)

(assert (=> d!131007 m!1021473))

(declare-fun m!1021475 () Bool)

(assert (=> b!1101102 m!1021475))

(declare-fun m!1021477 () Bool)

(assert (=> b!1101103 m!1021477))

(assert (=> b!1100829 d!131007))

(declare-fun d!131009 () Bool)

(declare-fun e!628572 () Bool)

(assert (=> d!131009 e!628572))

(declare-fun res!734401 () Bool)

(assert (=> d!131009 (=> (not res!734401) (not e!628572))))

(declare-fun lt!493075 () ListLongMap!15323)

(assert (=> d!131009 (= res!734401 (contains!6417 lt!493075 (_1!8684 lt!492860)))))

(declare-fun lt!493076 () List!23968)

(assert (=> d!131009 (= lt!493075 (ListLongMap!15324 lt!493076))))

(declare-fun lt!493078 () Unit!36147)

(declare-fun lt!493077 () Unit!36147)

(assert (=> d!131009 (= lt!493078 lt!493077)))

(assert (=> d!131009 (= (getValueByKey!619 lt!493076 (_1!8684 lt!492860)) (Some!669 (_2!8684 lt!492860)))))

(assert (=> d!131009 (= lt!493077 (lemmaContainsTupThenGetReturnValue!301 lt!493076 (_1!8684 lt!492860) (_2!8684 lt!492860)))))

(assert (=> d!131009 (= lt!493076 (insertStrictlySorted!394 (toList!7677 lt!492856) (_1!8684 lt!492860) (_2!8684 lt!492860)))))

(assert (=> d!131009 (= (+!3409 lt!492856 lt!492860) lt!493075)))

(declare-fun b!1101104 () Bool)

(declare-fun res!734400 () Bool)

(assert (=> b!1101104 (=> (not res!734400) (not e!628572))))

(assert (=> b!1101104 (= res!734400 (= (getValueByKey!619 (toList!7677 lt!493075) (_1!8684 lt!492860)) (Some!669 (_2!8684 lt!492860))))))

(declare-fun b!1101105 () Bool)

(assert (=> b!1101105 (= e!628572 (contains!6418 (toList!7677 lt!493075) lt!492860))))

(assert (= (and d!131009 res!734401) b!1101104))

(assert (= (and b!1101104 res!734400) b!1101105))

(declare-fun m!1021479 () Bool)

(assert (=> d!131009 m!1021479))

(declare-fun m!1021481 () Bool)

(assert (=> d!131009 m!1021481))

(declare-fun m!1021483 () Bool)

(assert (=> d!131009 m!1021483))

(declare-fun m!1021485 () Bool)

(assert (=> d!131009 m!1021485))

(declare-fun m!1021487 () Bool)

(assert (=> b!1101104 m!1021487))

(declare-fun m!1021489 () Bool)

(assert (=> b!1101105 m!1021489))

(assert (=> b!1100829 d!131009))

(declare-fun b!1101106 () Bool)

(declare-fun e!628576 () Bool)

(assert (=> b!1101106 (= e!628576 (contains!6416 Nil!23966 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101107 () Bool)

(declare-fun e!628574 () Bool)

(declare-fun e!628573 () Bool)

(assert (=> b!1101107 (= e!628574 e!628573)))

(declare-fun res!734402 () Bool)

(assert (=> b!1101107 (=> (not res!734402) (not e!628573))))

(assert (=> b!1101107 (= res!734402 (not e!628576))))

(declare-fun res!734404 () Bool)

(assert (=> b!1101107 (=> (not res!734404) (not e!628576))))

(assert (=> b!1101107 (= res!734404 (validKeyInArray!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!131011 () Bool)

(declare-fun res!734403 () Bool)

(assert (=> d!131011 (=> res!734403 e!628574)))

(assert (=> d!131011 (= res!734403 (bvsge #b00000000000000000000000000000000 (size!34842 _keys!1070)))))

(assert (=> d!131011 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23966) e!628574)))

(declare-fun bm!46104 () Bool)

(declare-fun call!46107 () Bool)

(declare-fun c!109074 () Bool)

(assert (=> bm!46104 (= call!46107 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109074 (Cons!23965 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000) Nil!23966) Nil!23966)))))

(declare-fun b!1101108 () Bool)

(declare-fun e!628575 () Bool)

(assert (=> b!1101108 (= e!628573 e!628575)))

(assert (=> b!1101108 (= c!109074 (validKeyInArray!0 (select (arr!34305 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1101109 () Bool)

(assert (=> b!1101109 (= e!628575 call!46107)))

(declare-fun b!1101110 () Bool)

(assert (=> b!1101110 (= e!628575 call!46107)))

(assert (= (and d!131011 (not res!734403)) b!1101107))

(assert (= (and b!1101107 res!734404) b!1101106))

(assert (= (and b!1101107 res!734402) b!1101108))

(assert (= (and b!1101108 c!109074) b!1101110))

(assert (= (and b!1101108 (not c!109074)) b!1101109))

(assert (= (or b!1101110 b!1101109) bm!46104))

(assert (=> b!1101106 m!1021293))

(assert (=> b!1101106 m!1021293))

(declare-fun m!1021491 () Bool)

(assert (=> b!1101106 m!1021491))

(assert (=> b!1101107 m!1021293))

(assert (=> b!1101107 m!1021293))

(assert (=> b!1101107 m!1021297))

(assert (=> bm!46104 m!1021293))

(declare-fun m!1021493 () Bool)

(assert (=> bm!46104 m!1021493))

(assert (=> b!1101108 m!1021293))

(assert (=> b!1101108 m!1021293))

(assert (=> b!1101108 m!1021297))

(assert (=> b!1100828 d!131011))

(declare-fun condMapEmpty!42538 () Bool)

(declare-fun mapDefault!42538 () ValueCell!12875)

(assert (=> mapNonEmpty!42529 (= condMapEmpty!42538 (= mapRest!42529 ((as const (Array (_ BitVec 32) ValueCell!12875)) mapDefault!42538)))))

(declare-fun e!628581 () Bool)

(declare-fun mapRes!42538 () Bool)

(assert (=> mapNonEmpty!42529 (= tp!81299 (and e!628581 mapRes!42538))))

(declare-fun b!1101118 () Bool)

(assert (=> b!1101118 (= e!628581 tp_is_empty!27169)))

(declare-fun b!1101117 () Bool)

(declare-fun e!628582 () Bool)

(assert (=> b!1101117 (= e!628582 tp_is_empty!27169)))

(declare-fun mapIsEmpty!42538 () Bool)

(assert (=> mapIsEmpty!42538 mapRes!42538))

(declare-fun mapNonEmpty!42538 () Bool)

(declare-fun tp!81314 () Bool)

(assert (=> mapNonEmpty!42538 (= mapRes!42538 (and tp!81314 e!628582))))

(declare-fun mapKey!42538 () (_ BitVec 32))

(declare-fun mapRest!42538 () (Array (_ BitVec 32) ValueCell!12875))

(declare-fun mapValue!42538 () ValueCell!12875)

(assert (=> mapNonEmpty!42538 (= mapRest!42529 (store mapRest!42538 mapKey!42538 mapValue!42538))))

(assert (= (and mapNonEmpty!42529 condMapEmpty!42538) mapIsEmpty!42538))

(assert (= (and mapNonEmpty!42529 (not condMapEmpty!42538)) mapNonEmpty!42538))

(assert (= (and mapNonEmpty!42538 ((_ is ValueCellFull!12875) mapValue!42538)) b!1101117))

(assert (= (and mapNonEmpty!42529 ((_ is ValueCellFull!12875) mapDefault!42538)) b!1101118))

(declare-fun m!1021495 () Bool)

(assert (=> mapNonEmpty!42538 m!1021495))

(declare-fun b_lambda!17959 () Bool)

(assert (= b_lambda!17955 (or (and start!96908 b_free!23119) b_lambda!17959)))

(declare-fun b_lambda!17961 () Bool)

(assert (= b_lambda!17953 (or (and start!96908 b_free!23119) b_lambda!17961)))

(declare-fun b_lambda!17963 () Bool)

(assert (= b_lambda!17957 (or (and start!96908 b_free!23119) b_lambda!17963)))

(declare-fun b_lambda!17965 () Bool)

(assert (= b_lambda!17947 (or (and start!96908 b_free!23119) b_lambda!17965)))

(declare-fun b_lambda!17967 () Bool)

(assert (= b_lambda!17949 (or (and start!96908 b_free!23119) b_lambda!17967)))

(declare-fun b_lambda!17969 () Bool)

(assert (= b_lambda!17951 (or (and start!96908 b_free!23119) b_lambda!17969)))

(declare-fun b_lambda!17971 () Bool)

(assert (= b_lambda!17945 (or (and start!96908 b_free!23119) b_lambda!17971)))

(check-sat (not d!130993) b_and!37005 (not bm!46087) (not b_lambda!17959) (not b!1101076) (not bm!46088) (not d!130989) (not bm!46097) (not d!130991) (not b_lambda!17963) (not bm!46076) (not d!131009) (not b!1101048) (not b!1101092) (not b!1101041) (not b!1100932) (not b!1101106) (not b!1101051) (not b!1101050) (not b_lambda!17943) (not b!1101053) (not b_next!23119) (not bm!46061) (not b!1101091) (not d!130987) (not d!130995) (not d!130985) (not b!1101038) (not b!1101042) (not b!1100995) (not b!1101096) (not b!1100999) (not b!1101078) (not bm!46103) (not bm!46077) (not d!131007) (not b!1101102) (not b!1100984) (not b!1101075) (not b!1101103) (not bm!46093) (not b_lambda!17971) (not b!1100994) (not b!1100985) (not bm!46081) (not b!1101104) (not b_lambda!17961) (not b!1101074) (not b!1101060) (not b!1101049) (not b!1100931) (not b!1101080) (not b_lambda!17969) (not b!1101055) (not b!1101081) (not bm!46102) (not bm!46104) (not b_lambda!17965) (not b!1101065) (not b!1101045) (not b!1101061) (not bm!46091) (not bm!46096) (not b!1101047) (not b!1101108) (not bm!46099) (not b!1101107) (not b!1101105) (not b!1100987) (not b!1101079) (not b!1101071) (not b!1100940) (not bm!46080) (not b!1101046) (not b_lambda!17967) tp_is_empty!27169 (not d!130983) (not b!1101011) (not mapNonEmpty!42538) (not b!1100930) (not b!1101095) (not bm!46092) (not b!1101043) (not b!1100989) (not b!1100983))
(check-sat b_and!37005 (not b_next!23119))
