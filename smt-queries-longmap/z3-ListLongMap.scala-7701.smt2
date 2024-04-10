; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96712 () Bool)

(assert start!96712)

(declare-fun b_free!23133 () Bool)

(declare-fun b_next!23133 () Bool)

(assert (=> start!96712 (= b_free!23133 (not b_next!23133))))

(declare-fun tp!81344 () Bool)

(declare-fun b_and!37013 () Bool)

(assert (=> start!96712 (= tp!81344 b_and!37013)))

(declare-fun b!1100001 () Bool)

(declare-fun res!734045 () Bool)

(declare-fun e!627841 () Bool)

(assert (=> b!1100001 (=> (not res!734045) (not e!627841))))

(declare-datatypes ((array!71283 0))(
  ( (array!71284 (arr!34307 (Array (_ BitVec 32) (_ BitVec 64))) (size!34843 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71283)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71283 (_ BitVec 32)) Bool)

(assert (=> b!1100001 (= res!734045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100002 () Bool)

(declare-fun e!627845 () Bool)

(declare-fun e!627842 () Bool)

(assert (=> b!1100002 (= e!627845 (not e!627842))))

(declare-fun res!734052 () Bool)

(assert (=> b!1100002 (=> res!734052 e!627842)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100002 (= res!734052 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41371 0))(
  ( (V!41372 (val!13648 Int)) )
))
(declare-datatypes ((tuple2!17348 0))(
  ( (tuple2!17349 (_1!8685 (_ BitVec 64)) (_2!8685 V!41371)) )
))
(declare-datatypes ((List!23966 0))(
  ( (Nil!23963) (Cons!23962 (h!25171 tuple2!17348) (t!34145 List!23966)) )
))
(declare-datatypes ((ListLongMap!15317 0))(
  ( (ListLongMap!15318 (toList!7674 List!23966)) )
))
(declare-fun lt!492705 () ListLongMap!15317)

(declare-fun minValue!831 () V!41371)

(declare-fun zeroValue!831 () V!41371)

(declare-datatypes ((ValueCell!12882 0))(
  ( (ValueCellFull!12882 (v!16275 V!41371)) (EmptyCell!12882) )
))
(declare-datatypes ((array!71285 0))(
  ( (array!71286 (arr!34308 (Array (_ BitVec 32) ValueCell!12882)) (size!34844 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71285)

(declare-fun getCurrentListMap!4386 (array!71283 array!71285 (_ BitVec 32) (_ BitVec 32) V!41371 V!41371 (_ BitVec 32) Int) ListLongMap!15317)

(assert (=> b!1100002 (= lt!492705 (getCurrentListMap!4386 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492706 () array!71285)

(declare-fun lt!492710 () array!71283)

(declare-fun lt!492711 () ListLongMap!15317)

(assert (=> b!1100002 (= lt!492711 (getCurrentListMap!4386 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492707 () ListLongMap!15317)

(declare-fun lt!492712 () ListLongMap!15317)

(assert (=> b!1100002 (and (= lt!492707 lt!492712) (= lt!492712 lt!492707))))

(declare-fun lt!492709 () ListLongMap!15317)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!961 (ListLongMap!15317 (_ BitVec 64)) ListLongMap!15317)

(assert (=> b!1100002 (= lt!492712 (-!961 lt!492709 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36166 0))(
  ( (Unit!36167) )
))
(declare-fun lt!492704 () Unit!36166)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!212 (array!71283 array!71285 (_ BitVec 32) (_ BitVec 32) V!41371 V!41371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36166)

(assert (=> b!1100002 (= lt!492704 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!212 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4182 (array!71283 array!71285 (_ BitVec 32) (_ BitVec 32) V!41371 V!41371 (_ BitVec 32) Int) ListLongMap!15317)

(assert (=> b!1100002 (= lt!492707 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2317 (Int (_ BitVec 64)) V!41371)

(assert (=> b!1100002 (= lt!492706 (array!71286 (store (arr!34308 _values!874) i!650 (ValueCellFull!12882 (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34844 _values!874)))))

(assert (=> b!1100002 (= lt!492709 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100002 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492713 () Unit!36166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71283 (_ BitVec 64) (_ BitVec 32)) Unit!36166)

(assert (=> b!1100002 (= lt!492713 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100003 () Bool)

(declare-fun e!627847 () Bool)

(declare-fun e!627844 () Bool)

(declare-fun mapRes!42553 () Bool)

(assert (=> b!1100003 (= e!627847 (and e!627844 mapRes!42553))))

(declare-fun condMapEmpty!42553 () Bool)

(declare-fun mapDefault!42553 () ValueCell!12882)

(assert (=> b!1100003 (= condMapEmpty!42553 (= (arr!34308 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12882)) mapDefault!42553)))))

(declare-fun b!1100004 () Bool)

(declare-fun res!734053 () Bool)

(assert (=> b!1100004 (=> (not res!734053) (not e!627841))))

(declare-datatypes ((List!23967 0))(
  ( (Nil!23964) (Cons!23963 (h!25172 (_ BitVec 64)) (t!34146 List!23967)) )
))
(declare-fun arrayNoDuplicates!0 (array!71283 (_ BitVec 32) List!23967) Bool)

(assert (=> b!1100004 (= res!734053 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23964))))

(declare-fun res!734047 () Bool)

(assert (=> start!96712 (=> (not res!734047) (not e!627841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96712 (= res!734047 (validMask!0 mask!1414))))

(assert (=> start!96712 e!627841))

(assert (=> start!96712 tp!81344))

(assert (=> start!96712 true))

(declare-fun tp_is_empty!27183 () Bool)

(assert (=> start!96712 tp_is_empty!27183))

(declare-fun array_inv!26426 (array!71283) Bool)

(assert (=> start!96712 (array_inv!26426 _keys!1070)))

(declare-fun array_inv!26427 (array!71285) Bool)

(assert (=> start!96712 (and (array_inv!26427 _values!874) e!627847)))

(declare-fun b!1100005 () Bool)

(assert (=> b!1100005 (= e!627841 e!627845)))

(declare-fun res!734049 () Bool)

(assert (=> b!1100005 (=> (not res!734049) (not e!627845))))

(assert (=> b!1100005 (= res!734049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492710 mask!1414))))

(assert (=> b!1100005 (= lt!492710 (array!71284 (store (arr!34307 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34843 _keys!1070)))))

(declare-fun b!1100006 () Bool)

(declare-fun res!734050 () Bool)

(assert (=> b!1100006 (=> (not res!734050) (not e!627841))))

(assert (=> b!1100006 (= res!734050 (= (select (arr!34307 _keys!1070) i!650) k0!904))))

(declare-fun b!1100007 () Bool)

(declare-fun res!734046 () Bool)

(assert (=> b!1100007 (=> (not res!734046) (not e!627845))))

(assert (=> b!1100007 (= res!734046 (arrayNoDuplicates!0 lt!492710 #b00000000000000000000000000000000 Nil!23964))))

(declare-fun mapNonEmpty!42553 () Bool)

(declare-fun tp!81343 () Bool)

(declare-fun e!627840 () Bool)

(assert (=> mapNonEmpty!42553 (= mapRes!42553 (and tp!81343 e!627840))))

(declare-fun mapRest!42553 () (Array (_ BitVec 32) ValueCell!12882))

(declare-fun mapKey!42553 () (_ BitVec 32))

(declare-fun mapValue!42553 () ValueCell!12882)

(assert (=> mapNonEmpty!42553 (= (arr!34308 _values!874) (store mapRest!42553 mapKey!42553 mapValue!42553))))

(declare-fun b!1100008 () Bool)

(declare-fun res!734043 () Bool)

(assert (=> b!1100008 (=> (not res!734043) (not e!627841))))

(assert (=> b!1100008 (= res!734043 (and (= (size!34844 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34843 _keys!1070) (size!34844 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100009 () Bool)

(assert (=> b!1100009 (= e!627842 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(declare-fun e!627846 () Bool)

(assert (=> b!1100009 e!627846))

(declare-fun res!734051 () Bool)

(assert (=> b!1100009 (=> (not res!734051) (not e!627846))))

(declare-fun lt!492708 () tuple2!17348)

(declare-fun +!3381 (ListLongMap!15317 tuple2!17348) ListLongMap!15317)

(assert (=> b!1100009 (= res!734051 (= lt!492711 (+!3381 lt!492707 lt!492708)))))

(assert (=> b!1100009 (= lt!492708 (tuple2!17349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100010 () Bool)

(declare-fun res!734042 () Bool)

(assert (=> b!1100010 (=> (not res!734042) (not e!627841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100010 (= res!734042 (validKeyInArray!0 k0!904))))

(declare-fun b!1100011 () Bool)

(assert (=> b!1100011 (= e!627844 tp_is_empty!27183)))

(declare-fun b!1100012 () Bool)

(declare-fun res!734048 () Bool)

(assert (=> b!1100012 (=> (not res!734048) (not e!627846))))

(assert (=> b!1100012 (= res!734048 (= lt!492705 (+!3381 lt!492709 lt!492708)))))

(declare-fun mapIsEmpty!42553 () Bool)

(assert (=> mapIsEmpty!42553 mapRes!42553))

(declare-fun b!1100013 () Bool)

(assert (=> b!1100013 (= e!627846 (= lt!492711 (+!3381 lt!492712 lt!492708)))))

(declare-fun b!1100014 () Bool)

(declare-fun res!734044 () Bool)

(assert (=> b!1100014 (=> (not res!734044) (not e!627841))))

(assert (=> b!1100014 (= res!734044 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34843 _keys!1070))))))

(declare-fun b!1100015 () Bool)

(assert (=> b!1100015 (= e!627840 tp_is_empty!27183)))

(assert (= (and start!96712 res!734047) b!1100008))

(assert (= (and b!1100008 res!734043) b!1100001))

(assert (= (and b!1100001 res!734045) b!1100004))

(assert (= (and b!1100004 res!734053) b!1100014))

(assert (= (and b!1100014 res!734044) b!1100010))

(assert (= (and b!1100010 res!734042) b!1100006))

(assert (= (and b!1100006 res!734050) b!1100005))

(assert (= (and b!1100005 res!734049) b!1100007))

(assert (= (and b!1100007 res!734046) b!1100002))

(assert (= (and b!1100002 (not res!734052)) b!1100009))

(assert (= (and b!1100009 res!734051) b!1100012))

(assert (= (and b!1100012 res!734048) b!1100013))

(assert (= (and b!1100003 condMapEmpty!42553) mapIsEmpty!42553))

(assert (= (and b!1100003 (not condMapEmpty!42553)) mapNonEmpty!42553))

(get-info :version)

(assert (= (and mapNonEmpty!42553 ((_ is ValueCellFull!12882) mapValue!42553)) b!1100015))

(assert (= (and b!1100003 ((_ is ValueCellFull!12882) mapDefault!42553)) b!1100011))

(assert (= start!96712 b!1100003))

(declare-fun b_lambda!17971 () Bool)

(assert (=> (not b_lambda!17971) (not b!1100002)))

(declare-fun t!34144 () Bool)

(declare-fun tb!7999 () Bool)

(assert (=> (and start!96712 (= defaultEntry!882 defaultEntry!882) t!34144) tb!7999))

(declare-fun result!16533 () Bool)

(assert (=> tb!7999 (= result!16533 tp_is_empty!27183)))

(assert (=> b!1100002 t!34144))

(declare-fun b_and!37015 () Bool)

(assert (= b_and!37013 (and (=> t!34144 result!16533) b_and!37015)))

(declare-fun m!1020017 () Bool)

(assert (=> b!1100007 m!1020017))

(declare-fun m!1020019 () Bool)

(assert (=> start!96712 m!1020019))

(declare-fun m!1020021 () Bool)

(assert (=> start!96712 m!1020021))

(declare-fun m!1020023 () Bool)

(assert (=> start!96712 m!1020023))

(declare-fun m!1020025 () Bool)

(assert (=> b!1100002 m!1020025))

(declare-fun m!1020027 () Bool)

(assert (=> b!1100002 m!1020027))

(declare-fun m!1020029 () Bool)

(assert (=> b!1100002 m!1020029))

(declare-fun m!1020031 () Bool)

(assert (=> b!1100002 m!1020031))

(declare-fun m!1020033 () Bool)

(assert (=> b!1100002 m!1020033))

(declare-fun m!1020035 () Bool)

(assert (=> b!1100002 m!1020035))

(declare-fun m!1020037 () Bool)

(assert (=> b!1100002 m!1020037))

(declare-fun m!1020039 () Bool)

(assert (=> b!1100002 m!1020039))

(declare-fun m!1020041 () Bool)

(assert (=> b!1100002 m!1020041))

(declare-fun m!1020043 () Bool)

(assert (=> b!1100002 m!1020043))

(declare-fun m!1020045 () Bool)

(assert (=> mapNonEmpty!42553 m!1020045))

(declare-fun m!1020047 () Bool)

(assert (=> b!1100005 m!1020047))

(declare-fun m!1020049 () Bool)

(assert (=> b!1100005 m!1020049))

(declare-fun m!1020051 () Bool)

(assert (=> b!1100010 m!1020051))

(declare-fun m!1020053 () Bool)

(assert (=> b!1100013 m!1020053))

(declare-fun m!1020055 () Bool)

(assert (=> b!1100004 m!1020055))

(declare-fun m!1020057 () Bool)

(assert (=> b!1100012 m!1020057))

(declare-fun m!1020059 () Bool)

(assert (=> b!1100009 m!1020059))

(declare-fun m!1020061 () Bool)

(assert (=> b!1100006 m!1020061))

(declare-fun m!1020063 () Bool)

(assert (=> b!1100001 m!1020063))

(check-sat (not b!1100013) (not b!1100004) (not b!1100001) (not b!1100002) (not b!1100007) (not b!1100009) b_and!37015 (not b_lambda!17971) (not mapNonEmpty!42553) (not b!1100005) (not start!96712) (not b!1100010) (not b!1100012) (not b_next!23133) tp_is_empty!27183)
(check-sat b_and!37015 (not b_next!23133))
(get-model)

(declare-fun b_lambda!17975 () Bool)

(assert (= b_lambda!17971 (or (and start!96712 b_free!23133) b_lambda!17975)))

(check-sat (not b_lambda!17975) (not b!1100013) (not b!1100004) (not b!1100001) (not b!1100002) (not b!1100007) (not b!1100009) b_and!37015 (not mapNonEmpty!42553) (not b!1100005) (not start!96712) (not b!1100010) (not b!1100012) (not b_next!23133) tp_is_empty!27183)
(check-sat b_and!37015 (not b_next!23133))
(get-model)

(declare-fun d!130553 () Bool)

(declare-fun e!627874 () Bool)

(assert (=> d!130553 e!627874))

(declare-fun res!734094 () Bool)

(assert (=> d!130553 (=> (not res!734094) (not e!627874))))

(declare-fun lt!492755 () ListLongMap!15317)

(declare-fun contains!6395 (ListLongMap!15317 (_ BitVec 64)) Bool)

(assert (=> d!130553 (= res!734094 (contains!6395 lt!492755 (_1!8685 lt!492708)))))

(declare-fun lt!492752 () List!23966)

(assert (=> d!130553 (= lt!492755 (ListLongMap!15318 lt!492752))))

(declare-fun lt!492753 () Unit!36166)

(declare-fun lt!492754 () Unit!36166)

(assert (=> d!130553 (= lt!492753 lt!492754)))

(declare-datatypes ((Option!675 0))(
  ( (Some!674 (v!16277 V!41371)) (None!673) )
))
(declare-fun getValueByKey!624 (List!23966 (_ BitVec 64)) Option!675)

(assert (=> d!130553 (= (getValueByKey!624 lt!492752 (_1!8685 lt!492708)) (Some!674 (_2!8685 lt!492708)))))

(declare-fun lemmaContainsTupThenGetReturnValue!301 (List!23966 (_ BitVec 64) V!41371) Unit!36166)

(assert (=> d!130553 (= lt!492754 (lemmaContainsTupThenGetReturnValue!301 lt!492752 (_1!8685 lt!492708) (_2!8685 lt!492708)))))

(declare-fun insertStrictlySorted!394 (List!23966 (_ BitVec 64) V!41371) List!23966)

(assert (=> d!130553 (= lt!492752 (insertStrictlySorted!394 (toList!7674 lt!492709) (_1!8685 lt!492708) (_2!8685 lt!492708)))))

(assert (=> d!130553 (= (+!3381 lt!492709 lt!492708) lt!492755)))

(declare-fun b!1100069 () Bool)

(declare-fun res!734095 () Bool)

(assert (=> b!1100069 (=> (not res!734095) (not e!627874))))

(assert (=> b!1100069 (= res!734095 (= (getValueByKey!624 (toList!7674 lt!492755) (_1!8685 lt!492708)) (Some!674 (_2!8685 lt!492708))))))

(declare-fun b!1100070 () Bool)

(declare-fun contains!6396 (List!23966 tuple2!17348) Bool)

(assert (=> b!1100070 (= e!627874 (contains!6396 (toList!7674 lt!492755) lt!492708))))

(assert (= (and d!130553 res!734094) b!1100069))

(assert (= (and b!1100069 res!734095) b!1100070))

(declare-fun m!1020113 () Bool)

(assert (=> d!130553 m!1020113))

(declare-fun m!1020115 () Bool)

(assert (=> d!130553 m!1020115))

(declare-fun m!1020117 () Bool)

(assert (=> d!130553 m!1020117))

(declare-fun m!1020119 () Bool)

(assert (=> d!130553 m!1020119))

(declare-fun m!1020121 () Bool)

(assert (=> b!1100069 m!1020121))

(declare-fun m!1020123 () Bool)

(assert (=> b!1100070 m!1020123))

(assert (=> b!1100012 d!130553))

(declare-fun d!130555 () Bool)

(declare-fun res!734100 () Bool)

(declare-fun e!627879 () Bool)

(assert (=> d!130555 (=> res!734100 e!627879)))

(assert (=> d!130555 (= res!734100 (= (select (arr!34307 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130555 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627879)))

(declare-fun b!1100075 () Bool)

(declare-fun e!627880 () Bool)

(assert (=> b!1100075 (= e!627879 e!627880)))

(declare-fun res!734101 () Bool)

(assert (=> b!1100075 (=> (not res!734101) (not e!627880))))

(assert (=> b!1100075 (= res!734101 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34843 _keys!1070)))))

(declare-fun b!1100076 () Bool)

(assert (=> b!1100076 (= e!627880 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130555 (not res!734100)) b!1100075))

(assert (= (and b!1100075 res!734101) b!1100076))

(declare-fun m!1020125 () Bool)

(assert (=> d!130555 m!1020125))

(declare-fun m!1020127 () Bool)

(assert (=> b!1100076 m!1020127))

(assert (=> b!1100002 d!130555))

(declare-fun b!1100101 () Bool)

(declare-fun e!627899 () ListLongMap!15317)

(declare-fun e!627898 () ListLongMap!15317)

(assert (=> b!1100101 (= e!627899 e!627898)))

(declare-fun c!108676 () Bool)

(assert (=> b!1100101 (= c!108676 (validKeyInArray!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(declare-fun b!1100102 () Bool)

(declare-fun e!627901 () Bool)

(declare-fun e!627897 () Bool)

(assert (=> b!1100102 (= e!627901 e!627897)))

(declare-fun c!108675 () Bool)

(declare-fun e!627896 () Bool)

(assert (=> b!1100102 (= c!108675 e!627896)))

(declare-fun res!734113 () Bool)

(assert (=> b!1100102 (=> (not res!734113) (not e!627896))))

(assert (=> b!1100102 (= res!734113 (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(declare-fun b!1100103 () Bool)

(declare-fun e!627900 () Bool)

(assert (=> b!1100103 (= e!627897 e!627900)))

(assert (=> b!1100103 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(declare-fun res!734112 () Bool)

(declare-fun lt!492771 () ListLongMap!15317)

(assert (=> b!1100103 (= res!734112 (contains!6395 lt!492771 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(assert (=> b!1100103 (=> (not res!734112) (not e!627900))))

(declare-fun b!1100104 () Bool)

(declare-fun e!627895 () Bool)

(assert (=> b!1100104 (= e!627895 (= lt!492771 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100105 () Bool)

(assert (=> b!1100105 (= e!627896 (validKeyInArray!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(assert (=> b!1100105 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1100106 () Bool)

(declare-fun call!46043 () ListLongMap!15317)

(assert (=> b!1100106 (= e!627898 call!46043)))

(declare-fun b!1100107 () Bool)

(declare-fun lt!492772 () Unit!36166)

(declare-fun lt!492770 () Unit!36166)

(assert (=> b!1100107 (= lt!492772 lt!492770)))

(declare-fun lt!492775 () (_ BitVec 64))

(declare-fun lt!492776 () ListLongMap!15317)

(declare-fun lt!492774 () V!41371)

(declare-fun lt!492773 () (_ BitVec 64))

(assert (=> b!1100107 (not (contains!6395 (+!3381 lt!492776 (tuple2!17349 lt!492775 lt!492774)) lt!492773))))

(declare-fun addStillNotContains!277 (ListLongMap!15317 (_ BitVec 64) V!41371 (_ BitVec 64)) Unit!36166)

(assert (=> b!1100107 (= lt!492770 (addStillNotContains!277 lt!492776 lt!492775 lt!492774 lt!492773))))

(assert (=> b!1100107 (= lt!492773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17639 (ValueCell!12882 V!41371) V!41371)

(assert (=> b!1100107 (= lt!492774 (get!17639 (select (arr!34308 lt!492706) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100107 (= lt!492775 (select (arr!34307 lt!492710) #b00000000000000000000000000000000))))

(assert (=> b!1100107 (= lt!492776 call!46043)))

(assert (=> b!1100107 (= e!627898 (+!3381 call!46043 (tuple2!17349 (select (arr!34307 lt!492710) #b00000000000000000000000000000000) (get!17639 (select (arr!34308 lt!492706) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100108 () Bool)

(declare-fun res!734111 () Bool)

(assert (=> b!1100108 (=> (not res!734111) (not e!627901))))

(assert (=> b!1100108 (= res!734111 (not (contains!6395 lt!492771 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100109 () Bool)

(assert (=> b!1100109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(assert (=> b!1100109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34844 lt!492706)))))

(declare-fun apply!949 (ListLongMap!15317 (_ BitVec 64)) V!41371)

(assert (=> b!1100109 (= e!627900 (= (apply!949 lt!492771 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)) (get!17639 (select (arr!34308 lt!492706) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130557 () Bool)

(assert (=> d!130557 e!627901))

(declare-fun res!734110 () Bool)

(assert (=> d!130557 (=> (not res!734110) (not e!627901))))

(assert (=> d!130557 (= res!734110 (not (contains!6395 lt!492771 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130557 (= lt!492771 e!627899)))

(declare-fun c!108674 () Bool)

(assert (=> d!130557 (= c!108674 (bvsge #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(assert (=> d!130557 (validMask!0 mask!1414)))

(assert (=> d!130557 (= (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492771)))

(declare-fun bm!46040 () Bool)

(assert (=> bm!46040 (= call!46043 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100110 () Bool)

(assert (=> b!1100110 (= e!627899 (ListLongMap!15318 Nil!23963))))

(declare-fun b!1100111 () Bool)

(declare-fun isEmpty!967 (ListLongMap!15317) Bool)

(assert (=> b!1100111 (= e!627895 (isEmpty!967 lt!492771))))

(declare-fun b!1100112 () Bool)

(assert (=> b!1100112 (= e!627897 e!627895)))

(declare-fun c!108673 () Bool)

(assert (=> b!1100112 (= c!108673 (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(assert (= (and d!130557 c!108674) b!1100110))

(assert (= (and d!130557 (not c!108674)) b!1100101))

(assert (= (and b!1100101 c!108676) b!1100107))

(assert (= (and b!1100101 (not c!108676)) b!1100106))

(assert (= (or b!1100107 b!1100106) bm!46040))

(assert (= (and d!130557 res!734110) b!1100108))

(assert (= (and b!1100108 res!734111) b!1100102))

(assert (= (and b!1100102 res!734113) b!1100105))

(assert (= (and b!1100102 c!108675) b!1100103))

(assert (= (and b!1100102 (not c!108675)) b!1100112))

(assert (= (and b!1100103 res!734112) b!1100109))

(assert (= (and b!1100112 c!108673) b!1100104))

(assert (= (and b!1100112 (not c!108673)) b!1100111))

(declare-fun b_lambda!17977 () Bool)

(assert (=> (not b_lambda!17977) (not b!1100107)))

(assert (=> b!1100107 t!34144))

(declare-fun b_and!37021 () Bool)

(assert (= b_and!37015 (and (=> t!34144 result!16533) b_and!37021)))

(declare-fun b_lambda!17979 () Bool)

(assert (=> (not b_lambda!17979) (not b!1100109)))

(assert (=> b!1100109 t!34144))

(declare-fun b_and!37023 () Bool)

(assert (= b_and!37021 (and (=> t!34144 result!16533) b_and!37023)))

(declare-fun m!1020129 () Bool)

(assert (=> b!1100103 m!1020129))

(assert (=> b!1100103 m!1020129))

(declare-fun m!1020131 () Bool)

(assert (=> b!1100103 m!1020131))

(declare-fun m!1020133 () Bool)

(assert (=> b!1100107 m!1020133))

(declare-fun m!1020135 () Bool)

(assert (=> b!1100107 m!1020135))

(assert (=> b!1100107 m!1020135))

(declare-fun m!1020137 () Bool)

(assert (=> b!1100107 m!1020137))

(assert (=> b!1100107 m!1020129))

(assert (=> b!1100107 m!1020025))

(declare-fun m!1020139 () Bool)

(assert (=> b!1100107 m!1020139))

(declare-fun m!1020141 () Bool)

(assert (=> b!1100107 m!1020141))

(assert (=> b!1100107 m!1020025))

(declare-fun m!1020143 () Bool)

(assert (=> b!1100107 m!1020143))

(assert (=> b!1100107 m!1020141))

(assert (=> b!1100109 m!1020129))

(assert (=> b!1100109 m!1020025))

(assert (=> b!1100109 m!1020129))

(declare-fun m!1020145 () Bool)

(assert (=> b!1100109 m!1020145))

(assert (=> b!1100109 m!1020141))

(assert (=> b!1100109 m!1020025))

(assert (=> b!1100109 m!1020143))

(assert (=> b!1100109 m!1020141))

(assert (=> b!1100101 m!1020129))

(assert (=> b!1100101 m!1020129))

(declare-fun m!1020147 () Bool)

(assert (=> b!1100101 m!1020147))

(declare-fun m!1020149 () Bool)

(assert (=> b!1100108 m!1020149))

(assert (=> b!1100105 m!1020129))

(assert (=> b!1100105 m!1020129))

(assert (=> b!1100105 m!1020147))

(declare-fun m!1020151 () Bool)

(assert (=> d!130557 m!1020151))

(assert (=> d!130557 m!1020019))

(declare-fun m!1020153 () Bool)

(assert (=> bm!46040 m!1020153))

(declare-fun m!1020155 () Bool)

(assert (=> b!1100111 m!1020155))

(assert (=> b!1100104 m!1020153))

(assert (=> b!1100002 d!130557))

(declare-fun bm!46055 () Bool)

(declare-fun call!46062 () Bool)

(declare-fun lt!492824 () ListLongMap!15317)

(assert (=> bm!46055 (= call!46062 (contains!6395 lt!492824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46056 () Bool)

(declare-fun call!46058 () ListLongMap!15317)

(declare-fun call!46064 () ListLongMap!15317)

(assert (=> bm!46056 (= call!46058 call!46064)))

(declare-fun b!1100155 () Bool)

(declare-fun e!627935 () Bool)

(assert (=> b!1100155 (= e!627935 (= (apply!949 lt!492824 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)) (get!17639 (select (arr!34308 _values!874) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34844 _values!874)))))

(assert (=> b!1100155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(declare-fun b!1100156 () Bool)

(declare-fun e!627931 () ListLongMap!15317)

(assert (=> b!1100156 (= e!627931 call!46058)))

(declare-fun b!1100157 () Bool)

(declare-fun e!627934 () Bool)

(assert (=> b!1100157 (= e!627934 (validKeyInArray!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100158 () Bool)

(declare-fun e!627936 () Bool)

(declare-fun e!627928 () Bool)

(assert (=> b!1100158 (= e!627936 e!627928)))

(declare-fun res!734140 () Bool)

(declare-fun call!46063 () Bool)

(assert (=> b!1100158 (= res!734140 call!46063)))

(assert (=> b!1100158 (=> (not res!734140) (not e!627928))))

(declare-fun b!1100159 () Bool)

(assert (=> b!1100159 (= e!627928 (= (apply!949 lt!492824 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46058 () Bool)

(declare-fun call!46061 () ListLongMap!15317)

(declare-fun call!46060 () ListLongMap!15317)

(assert (=> bm!46058 (= call!46061 call!46060)))

(declare-fun b!1100160 () Bool)

(declare-fun e!627938 () Bool)

(declare-fun e!627929 () Bool)

(assert (=> b!1100160 (= e!627938 e!627929)))

(declare-fun res!734134 () Bool)

(assert (=> b!1100160 (= res!734134 call!46062)))

(assert (=> b!1100160 (=> (not res!734134) (not e!627929))))

(declare-fun b!1100161 () Bool)

(assert (=> b!1100161 (= e!627938 (not call!46062))))

(declare-fun b!1100162 () Bool)

(declare-fun res!734133 () Bool)

(declare-fun e!627932 () Bool)

(assert (=> b!1100162 (=> (not res!734133) (not e!627932))))

(declare-fun e!627930 () Bool)

(assert (=> b!1100162 (= res!734133 e!627930)))

(declare-fun res!734136 () Bool)

(assert (=> b!1100162 (=> res!734136 e!627930)))

(declare-fun e!627937 () Bool)

(assert (=> b!1100162 (= res!734136 (not e!627937))))

(declare-fun res!734135 () Bool)

(assert (=> b!1100162 (=> (not res!734135) (not e!627937))))

(assert (=> b!1100162 (= res!734135 (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(declare-fun call!46059 () ListLongMap!15317)

(declare-fun c!108690 () Bool)

(declare-fun c!108691 () Bool)

(declare-fun bm!46059 () Bool)

(assert (=> bm!46059 (= call!46064 (+!3381 (ite c!108690 call!46060 (ite c!108691 call!46061 call!46059)) (ite (or c!108690 c!108691) (tuple2!17349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100163 () Bool)

(assert (=> b!1100163 (= e!627930 e!627935)))

(declare-fun res!734138 () Bool)

(assert (=> b!1100163 (=> (not res!734138) (not e!627935))))

(assert (=> b!1100163 (= res!734138 (contains!6395 lt!492824 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(declare-fun bm!46060 () Bool)

(assert (=> bm!46060 (= call!46063 (contains!6395 lt!492824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100164 () Bool)

(declare-fun e!627940 () ListLongMap!15317)

(assert (=> b!1100164 (= e!627940 call!46059)))

(declare-fun b!1100165 () Bool)

(declare-fun c!108693 () Bool)

(assert (=> b!1100165 (= c!108693 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100165 (= e!627931 e!627940)))

(declare-fun d!130559 () Bool)

(assert (=> d!130559 e!627932))

(declare-fun res!734137 () Bool)

(assert (=> d!130559 (=> (not res!734137) (not e!627932))))

(assert (=> d!130559 (= res!734137 (or (bvsge #b00000000000000000000000000000000 (size!34843 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))))

(declare-fun lt!492833 () ListLongMap!15317)

(assert (=> d!130559 (= lt!492824 lt!492833)))

(declare-fun lt!492825 () Unit!36166)

(declare-fun e!627939 () Unit!36166)

(assert (=> d!130559 (= lt!492825 e!627939)))

(declare-fun c!108689 () Bool)

(assert (=> d!130559 (= c!108689 e!627934)))

(declare-fun res!734139 () Bool)

(assert (=> d!130559 (=> (not res!734139) (not e!627934))))

(assert (=> d!130559 (= res!734139 (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(declare-fun e!627933 () ListLongMap!15317)

(assert (=> d!130559 (= lt!492833 e!627933)))

(assert (=> d!130559 (= c!108690 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130559 (validMask!0 mask!1414)))

(assert (=> d!130559 (= (getCurrentListMap!4386 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492824)))

(declare-fun bm!46057 () Bool)

(assert (=> bm!46057 (= call!46059 call!46061)))

(declare-fun b!1100166 () Bool)

(assert (=> b!1100166 (= e!627933 (+!3381 call!46064 (tuple2!17349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!46061 () Bool)

(assert (=> bm!46061 (= call!46060 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100167 () Bool)

(declare-fun Unit!36168 () Unit!36166)

(assert (=> b!1100167 (= e!627939 Unit!36168)))

(declare-fun b!1100168 () Bool)

(assert (=> b!1100168 (= e!627937 (validKeyInArray!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100169 () Bool)

(assert (=> b!1100169 (= e!627940 call!46058)))

(declare-fun b!1100170 () Bool)

(assert (=> b!1100170 (= e!627936 (not call!46063))))

(declare-fun b!1100171 () Bool)

(declare-fun res!734132 () Bool)

(assert (=> b!1100171 (=> (not res!734132) (not e!627932))))

(assert (=> b!1100171 (= res!734132 e!627938)))

(declare-fun c!108694 () Bool)

(assert (=> b!1100171 (= c!108694 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1100172 () Bool)

(assert (=> b!1100172 (= e!627933 e!627931)))

(assert (=> b!1100172 (= c!108691 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100173 () Bool)

(assert (=> b!1100173 (= e!627929 (= (apply!949 lt!492824 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100174 () Bool)

(assert (=> b!1100174 (= e!627932 e!627936)))

(declare-fun c!108692 () Bool)

(assert (=> b!1100174 (= c!108692 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100175 () Bool)

(declare-fun lt!492838 () Unit!36166)

(assert (=> b!1100175 (= e!627939 lt!492838)))

(declare-fun lt!492834 () ListLongMap!15317)

(assert (=> b!1100175 (= lt!492834 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492827 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492835 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492835 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492837 () Unit!36166)

(declare-fun addStillContains!662 (ListLongMap!15317 (_ BitVec 64) V!41371 (_ BitVec 64)) Unit!36166)

(assert (=> b!1100175 (= lt!492837 (addStillContains!662 lt!492834 lt!492827 zeroValue!831 lt!492835))))

(assert (=> b!1100175 (contains!6395 (+!3381 lt!492834 (tuple2!17349 lt!492827 zeroValue!831)) lt!492835)))

(declare-fun lt!492832 () Unit!36166)

(assert (=> b!1100175 (= lt!492832 lt!492837)))

(declare-fun lt!492823 () ListLongMap!15317)

(assert (=> b!1100175 (= lt!492823 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492836 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492836 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492829 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492829 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492830 () Unit!36166)

(declare-fun addApplyDifferent!522 (ListLongMap!15317 (_ BitVec 64) V!41371 (_ BitVec 64)) Unit!36166)

(assert (=> b!1100175 (= lt!492830 (addApplyDifferent!522 lt!492823 lt!492836 minValue!831 lt!492829))))

(assert (=> b!1100175 (= (apply!949 (+!3381 lt!492823 (tuple2!17349 lt!492836 minValue!831)) lt!492829) (apply!949 lt!492823 lt!492829))))

(declare-fun lt!492828 () Unit!36166)

(assert (=> b!1100175 (= lt!492828 lt!492830)))

(declare-fun lt!492831 () ListLongMap!15317)

(assert (=> b!1100175 (= lt!492831 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492826 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492842 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492842 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492822 () Unit!36166)

(assert (=> b!1100175 (= lt!492822 (addApplyDifferent!522 lt!492831 lt!492826 zeroValue!831 lt!492842))))

(assert (=> b!1100175 (= (apply!949 (+!3381 lt!492831 (tuple2!17349 lt!492826 zeroValue!831)) lt!492842) (apply!949 lt!492831 lt!492842))))

(declare-fun lt!492841 () Unit!36166)

(assert (=> b!1100175 (= lt!492841 lt!492822)))

(declare-fun lt!492840 () ListLongMap!15317)

(assert (=> b!1100175 (= lt!492840 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492839 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492839 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492821 () (_ BitVec 64))

(assert (=> b!1100175 (= lt!492821 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100175 (= lt!492838 (addApplyDifferent!522 lt!492840 lt!492839 minValue!831 lt!492821))))

(assert (=> b!1100175 (= (apply!949 (+!3381 lt!492840 (tuple2!17349 lt!492839 minValue!831)) lt!492821) (apply!949 lt!492840 lt!492821))))

(assert (= (and d!130559 c!108690) b!1100166))

(assert (= (and d!130559 (not c!108690)) b!1100172))

(assert (= (and b!1100172 c!108691) b!1100156))

(assert (= (and b!1100172 (not c!108691)) b!1100165))

(assert (= (and b!1100165 c!108693) b!1100169))

(assert (= (and b!1100165 (not c!108693)) b!1100164))

(assert (= (or b!1100169 b!1100164) bm!46057))

(assert (= (or b!1100156 bm!46057) bm!46058))

(assert (= (or b!1100156 b!1100169) bm!46056))

(assert (= (or b!1100166 bm!46058) bm!46061))

(assert (= (or b!1100166 bm!46056) bm!46059))

(assert (= (and d!130559 res!734139) b!1100157))

(assert (= (and d!130559 c!108689) b!1100175))

(assert (= (and d!130559 (not c!108689)) b!1100167))

(assert (= (and d!130559 res!734137) b!1100162))

(assert (= (and b!1100162 res!734135) b!1100168))

(assert (= (and b!1100162 (not res!734136)) b!1100163))

(assert (= (and b!1100163 res!734138) b!1100155))

(assert (= (and b!1100162 res!734133) b!1100171))

(assert (= (and b!1100171 c!108694) b!1100160))

(assert (= (and b!1100171 (not c!108694)) b!1100161))

(assert (= (and b!1100160 res!734134) b!1100173))

(assert (= (or b!1100160 b!1100161) bm!46055))

(assert (= (and b!1100171 res!734132) b!1100174))

(assert (= (and b!1100174 c!108692) b!1100158))

(assert (= (and b!1100174 (not c!108692)) b!1100170))

(assert (= (and b!1100158 res!734140) b!1100159))

(assert (= (or b!1100158 b!1100170) bm!46060))

(declare-fun b_lambda!17981 () Bool)

(assert (=> (not b_lambda!17981) (not b!1100155)))

(assert (=> b!1100155 t!34144))

(declare-fun b_and!37025 () Bool)

(assert (= b_and!37023 (and (=> t!34144 result!16533) b_and!37025)))

(declare-fun m!1020157 () Bool)

(assert (=> b!1100166 m!1020157))

(declare-fun m!1020159 () Bool)

(assert (=> bm!46055 m!1020159))

(assert (=> d!130559 m!1020019))

(declare-fun m!1020161 () Bool)

(assert (=> b!1100159 m!1020161))

(declare-fun m!1020163 () Bool)

(assert (=> bm!46059 m!1020163))

(assert (=> b!1100157 m!1020125))

(assert (=> b!1100157 m!1020125))

(declare-fun m!1020165 () Bool)

(assert (=> b!1100157 m!1020165))

(declare-fun m!1020167 () Bool)

(assert (=> b!1100173 m!1020167))

(assert (=> b!1100168 m!1020125))

(assert (=> b!1100168 m!1020125))

(assert (=> b!1100168 m!1020165))

(assert (=> b!1100163 m!1020125))

(assert (=> b!1100163 m!1020125))

(declare-fun m!1020169 () Bool)

(assert (=> b!1100163 m!1020169))

(declare-fun m!1020171 () Bool)

(assert (=> b!1100175 m!1020171))

(assert (=> b!1100175 m!1020171))

(declare-fun m!1020173 () Bool)

(assert (=> b!1100175 m!1020173))

(assert (=> b!1100175 m!1020125))

(declare-fun m!1020175 () Bool)

(assert (=> b!1100175 m!1020175))

(declare-fun m!1020177 () Bool)

(assert (=> b!1100175 m!1020177))

(declare-fun m!1020179 () Bool)

(assert (=> b!1100175 m!1020179))

(declare-fun m!1020181 () Bool)

(assert (=> b!1100175 m!1020181))

(declare-fun m!1020183 () Bool)

(assert (=> b!1100175 m!1020183))

(declare-fun m!1020185 () Bool)

(assert (=> b!1100175 m!1020185))

(declare-fun m!1020187 () Bool)

(assert (=> b!1100175 m!1020187))

(assert (=> b!1100175 m!1020177))

(declare-fun m!1020189 () Bool)

(assert (=> b!1100175 m!1020189))

(assert (=> b!1100175 m!1020039))

(declare-fun m!1020191 () Bool)

(assert (=> b!1100175 m!1020191))

(assert (=> b!1100175 m!1020185))

(declare-fun m!1020193 () Bool)

(assert (=> b!1100175 m!1020193))

(assert (=> b!1100175 m!1020191))

(declare-fun m!1020195 () Bool)

(assert (=> b!1100175 m!1020195))

(declare-fun m!1020197 () Bool)

(assert (=> b!1100175 m!1020197))

(declare-fun m!1020199 () Bool)

(assert (=> b!1100175 m!1020199))

(assert (=> bm!46061 m!1020039))

(declare-fun m!1020201 () Bool)

(assert (=> b!1100155 m!1020201))

(assert (=> b!1100155 m!1020025))

(assert (=> b!1100155 m!1020125))

(assert (=> b!1100155 m!1020125))

(declare-fun m!1020203 () Bool)

(assert (=> b!1100155 m!1020203))

(assert (=> b!1100155 m!1020201))

(assert (=> b!1100155 m!1020025))

(declare-fun m!1020205 () Bool)

(assert (=> b!1100155 m!1020205))

(declare-fun m!1020207 () Bool)

(assert (=> bm!46060 m!1020207))

(assert (=> b!1100002 d!130559))

(declare-fun call!46069 () ListLongMap!15317)

(declare-fun b!1100182 () Bool)

(declare-fun e!627945 () Bool)

(declare-fun call!46070 () ListLongMap!15317)

(assert (=> b!1100182 (= e!627945 (= call!46069 (-!961 call!46070 k0!904)))))

(assert (=> b!1100182 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34844 _values!874)))))

(declare-fun bm!46066 () Bool)

(assert (=> bm!46066 (= call!46070 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46067 () Bool)

(assert (=> bm!46067 (= call!46069 (getCurrentListMapNoExtraKeys!4182 (array!71284 (store (arr!34307 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34843 _keys!1070)) (array!71286 (store (arr!34308 _values!874) i!650 (ValueCellFull!12882 (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34844 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130561 () Bool)

(declare-fun e!627946 () Bool)

(assert (=> d!130561 e!627946))

(declare-fun res!734143 () Bool)

(assert (=> d!130561 (=> (not res!734143) (not e!627946))))

(assert (=> d!130561 (= res!734143 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34843 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34843 _keys!1070))))))))

(declare-fun lt!492845 () Unit!36166)

(declare-fun choose!1768 (array!71283 array!71285 (_ BitVec 32) (_ BitVec 32) V!41371 V!41371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36166)

(assert (=> d!130561 (= lt!492845 (choose!1768 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(assert (=> d!130561 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!212 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492845)))

(declare-fun b!1100183 () Bool)

(assert (=> b!1100183 (= e!627946 e!627945)))

(declare-fun c!108697 () Bool)

(assert (=> b!1100183 (= c!108697 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1100184 () Bool)

(assert (=> b!1100184 (= e!627945 (= call!46069 call!46070))))

(assert (=> b!1100184 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34844 _values!874)))))

(assert (= (and d!130561 res!734143) b!1100183))

(assert (= (and b!1100183 c!108697) b!1100182))

(assert (= (and b!1100183 (not c!108697)) b!1100184))

(assert (= (or b!1100182 b!1100184) bm!46066))

(assert (= (or b!1100182 b!1100184) bm!46067))

(declare-fun b_lambda!17983 () Bool)

(assert (=> (not b_lambda!17983) (not bm!46067)))

(assert (=> bm!46067 t!34144))

(declare-fun b_and!37027 () Bool)

(assert (= b_and!37025 (and (=> t!34144 result!16533) b_and!37027)))

(declare-fun m!1020209 () Bool)

(assert (=> b!1100182 m!1020209))

(assert (=> bm!46066 m!1020039))

(assert (=> bm!46067 m!1020049))

(assert (=> bm!46067 m!1020025))

(assert (=> bm!46067 m!1020033))

(declare-fun m!1020211 () Bool)

(assert (=> bm!46067 m!1020211))

(declare-fun m!1020213 () Bool)

(assert (=> d!130561 m!1020213))

(assert (=> b!1100002 d!130561))

(declare-fun b!1100185 () Bool)

(declare-fun e!627951 () ListLongMap!15317)

(declare-fun e!627950 () ListLongMap!15317)

(assert (=> b!1100185 (= e!627951 e!627950)))

(declare-fun c!108701 () Bool)

(assert (=> b!1100185 (= c!108701 (validKeyInArray!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100186 () Bool)

(declare-fun e!627953 () Bool)

(declare-fun e!627949 () Bool)

(assert (=> b!1100186 (= e!627953 e!627949)))

(declare-fun c!108700 () Bool)

(declare-fun e!627948 () Bool)

(assert (=> b!1100186 (= c!108700 e!627948)))

(declare-fun res!734147 () Bool)

(assert (=> b!1100186 (=> (not res!734147) (not e!627948))))

(assert (=> b!1100186 (= res!734147 (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(declare-fun b!1100187 () Bool)

(declare-fun e!627952 () Bool)

(assert (=> b!1100187 (= e!627949 e!627952)))

(assert (=> b!1100187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(declare-fun res!734146 () Bool)

(declare-fun lt!492847 () ListLongMap!15317)

(assert (=> b!1100187 (= res!734146 (contains!6395 lt!492847 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100187 (=> (not res!734146) (not e!627952))))

(declare-fun b!1100188 () Bool)

(declare-fun e!627947 () Bool)

(assert (=> b!1100188 (= e!627947 (= lt!492847 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100189 () Bool)

(assert (=> b!1100189 (= e!627948 (validKeyInArray!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100189 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1100190 () Bool)

(declare-fun call!46071 () ListLongMap!15317)

(assert (=> b!1100190 (= e!627950 call!46071)))

(declare-fun b!1100191 () Bool)

(declare-fun lt!492848 () Unit!36166)

(declare-fun lt!492846 () Unit!36166)

(assert (=> b!1100191 (= lt!492848 lt!492846)))

(declare-fun lt!492849 () (_ BitVec 64))

(declare-fun lt!492852 () ListLongMap!15317)

(declare-fun lt!492850 () V!41371)

(declare-fun lt!492851 () (_ BitVec 64))

(assert (=> b!1100191 (not (contains!6395 (+!3381 lt!492852 (tuple2!17349 lt!492851 lt!492850)) lt!492849))))

(assert (=> b!1100191 (= lt!492846 (addStillNotContains!277 lt!492852 lt!492851 lt!492850 lt!492849))))

(assert (=> b!1100191 (= lt!492849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100191 (= lt!492850 (get!17639 (select (arr!34308 _values!874) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100191 (= lt!492851 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100191 (= lt!492852 call!46071)))

(assert (=> b!1100191 (= e!627950 (+!3381 call!46071 (tuple2!17349 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000) (get!17639 (select (arr!34308 _values!874) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100192 () Bool)

(declare-fun res!734145 () Bool)

(assert (=> b!1100192 (=> (not res!734145) (not e!627953))))

(assert (=> b!1100192 (= res!734145 (not (contains!6395 lt!492847 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100193 () Bool)

(assert (=> b!1100193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(assert (=> b!1100193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34844 _values!874)))))

(assert (=> b!1100193 (= e!627952 (= (apply!949 lt!492847 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)) (get!17639 (select (arr!34308 _values!874) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130563 () Bool)

(assert (=> d!130563 e!627953))

(declare-fun res!734144 () Bool)

(assert (=> d!130563 (=> (not res!734144) (not e!627953))))

(assert (=> d!130563 (= res!734144 (not (contains!6395 lt!492847 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130563 (= lt!492847 e!627951)))

(declare-fun c!108699 () Bool)

(assert (=> d!130563 (= c!108699 (bvsge #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(assert (=> d!130563 (validMask!0 mask!1414)))

(assert (=> d!130563 (= (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492847)))

(declare-fun bm!46068 () Bool)

(assert (=> bm!46068 (= call!46071 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100194 () Bool)

(assert (=> b!1100194 (= e!627951 (ListLongMap!15318 Nil!23963))))

(declare-fun b!1100195 () Bool)

(assert (=> b!1100195 (= e!627947 (isEmpty!967 lt!492847))))

(declare-fun b!1100196 () Bool)

(assert (=> b!1100196 (= e!627949 e!627947)))

(declare-fun c!108698 () Bool)

(assert (=> b!1100196 (= c!108698 (bvslt #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(assert (= (and d!130563 c!108699) b!1100194))

(assert (= (and d!130563 (not c!108699)) b!1100185))

(assert (= (and b!1100185 c!108701) b!1100191))

(assert (= (and b!1100185 (not c!108701)) b!1100190))

(assert (= (or b!1100191 b!1100190) bm!46068))

(assert (= (and d!130563 res!734144) b!1100192))

(assert (= (and b!1100192 res!734145) b!1100186))

(assert (= (and b!1100186 res!734147) b!1100189))

(assert (= (and b!1100186 c!108700) b!1100187))

(assert (= (and b!1100186 (not c!108700)) b!1100196))

(assert (= (and b!1100187 res!734146) b!1100193))

(assert (= (and b!1100196 c!108698) b!1100188))

(assert (= (and b!1100196 (not c!108698)) b!1100195))

(declare-fun b_lambda!17985 () Bool)

(assert (=> (not b_lambda!17985) (not b!1100191)))

(assert (=> b!1100191 t!34144))

(declare-fun b_and!37029 () Bool)

(assert (= b_and!37027 (and (=> t!34144 result!16533) b_and!37029)))

(declare-fun b_lambda!17987 () Bool)

(assert (=> (not b_lambda!17987) (not b!1100193)))

(assert (=> b!1100193 t!34144))

(declare-fun b_and!37031 () Bool)

(assert (= b_and!37029 (and (=> t!34144 result!16533) b_and!37031)))

(assert (=> b!1100187 m!1020125))

(assert (=> b!1100187 m!1020125))

(declare-fun m!1020215 () Bool)

(assert (=> b!1100187 m!1020215))

(declare-fun m!1020217 () Bool)

(assert (=> b!1100191 m!1020217))

(declare-fun m!1020219 () Bool)

(assert (=> b!1100191 m!1020219))

(assert (=> b!1100191 m!1020219))

(declare-fun m!1020221 () Bool)

(assert (=> b!1100191 m!1020221))

(assert (=> b!1100191 m!1020125))

(assert (=> b!1100191 m!1020025))

(declare-fun m!1020223 () Bool)

(assert (=> b!1100191 m!1020223))

(assert (=> b!1100191 m!1020201))

(assert (=> b!1100191 m!1020025))

(assert (=> b!1100191 m!1020205))

(assert (=> b!1100191 m!1020201))

(assert (=> b!1100193 m!1020125))

(assert (=> b!1100193 m!1020025))

(assert (=> b!1100193 m!1020125))

(declare-fun m!1020225 () Bool)

(assert (=> b!1100193 m!1020225))

(assert (=> b!1100193 m!1020201))

(assert (=> b!1100193 m!1020025))

(assert (=> b!1100193 m!1020205))

(assert (=> b!1100193 m!1020201))

(assert (=> b!1100185 m!1020125))

(assert (=> b!1100185 m!1020125))

(assert (=> b!1100185 m!1020165))

(declare-fun m!1020227 () Bool)

(assert (=> b!1100192 m!1020227))

(assert (=> b!1100189 m!1020125))

(assert (=> b!1100189 m!1020125))

(assert (=> b!1100189 m!1020165))

(declare-fun m!1020229 () Bool)

(assert (=> d!130563 m!1020229))

(assert (=> d!130563 m!1020019))

(declare-fun m!1020231 () Bool)

(assert (=> bm!46068 m!1020231))

(declare-fun m!1020233 () Bool)

(assert (=> b!1100195 m!1020233))

(assert (=> b!1100188 m!1020231))

(assert (=> b!1100002 d!130563))

(declare-fun d!130565 () Bool)

(assert (=> d!130565 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492855 () Unit!36166)

(declare-fun choose!13 (array!71283 (_ BitVec 64) (_ BitVec 32)) Unit!36166)

(assert (=> d!130565 (= lt!492855 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130565 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130565 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492855)))

(declare-fun bs!32301 () Bool)

(assert (= bs!32301 d!130565))

(assert (=> bs!32301 m!1020035))

(declare-fun m!1020235 () Bool)

(assert (=> bs!32301 m!1020235))

(assert (=> b!1100002 d!130565))

(declare-fun d!130567 () Bool)

(declare-fun lt!492858 () ListLongMap!15317)

(assert (=> d!130567 (not (contains!6395 lt!492858 k0!904))))

(declare-fun removeStrictlySorted!83 (List!23966 (_ BitVec 64)) List!23966)

(assert (=> d!130567 (= lt!492858 (ListLongMap!15318 (removeStrictlySorted!83 (toList!7674 lt!492709) k0!904)))))

(assert (=> d!130567 (= (-!961 lt!492709 k0!904) lt!492858)))

(declare-fun bs!32302 () Bool)

(assert (= bs!32302 d!130567))

(declare-fun m!1020237 () Bool)

(assert (=> bs!32302 m!1020237))

(declare-fun m!1020239 () Bool)

(assert (=> bs!32302 m!1020239))

(assert (=> b!1100002 d!130567))

(declare-fun bm!46069 () Bool)

(declare-fun call!46076 () Bool)

(declare-fun lt!492862 () ListLongMap!15317)

(assert (=> bm!46069 (= call!46076 (contains!6395 lt!492862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46070 () Bool)

(declare-fun call!46072 () ListLongMap!15317)

(declare-fun call!46078 () ListLongMap!15317)

(assert (=> bm!46070 (= call!46072 call!46078)))

(declare-fun b!1100197 () Bool)

(declare-fun e!627961 () Bool)

(assert (=> b!1100197 (= e!627961 (= (apply!949 lt!492862 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)) (get!17639 (select (arr!34308 lt!492706) #b00000000000000000000000000000000) (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100197 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34844 lt!492706)))))

(assert (=> b!1100197 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(declare-fun b!1100198 () Bool)

(declare-fun e!627957 () ListLongMap!15317)

(assert (=> b!1100198 (= e!627957 call!46072)))

(declare-fun b!1100199 () Bool)

(declare-fun e!627960 () Bool)

(assert (=> b!1100199 (= e!627960 (validKeyInArray!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(declare-fun b!1100200 () Bool)

(declare-fun e!627962 () Bool)

(declare-fun e!627954 () Bool)

(assert (=> b!1100200 (= e!627962 e!627954)))

(declare-fun res!734156 () Bool)

(declare-fun call!46077 () Bool)

(assert (=> b!1100200 (= res!734156 call!46077)))

(assert (=> b!1100200 (=> (not res!734156) (not e!627954))))

(declare-fun b!1100201 () Bool)

(assert (=> b!1100201 (= e!627954 (= (apply!949 lt!492862 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46072 () Bool)

(declare-fun call!46075 () ListLongMap!15317)

(declare-fun call!46074 () ListLongMap!15317)

(assert (=> bm!46072 (= call!46075 call!46074)))

(declare-fun b!1100202 () Bool)

(declare-fun e!627964 () Bool)

(declare-fun e!627955 () Bool)

(assert (=> b!1100202 (= e!627964 e!627955)))

(declare-fun res!734150 () Bool)

(assert (=> b!1100202 (= res!734150 call!46076)))

(assert (=> b!1100202 (=> (not res!734150) (not e!627955))))

(declare-fun b!1100203 () Bool)

(assert (=> b!1100203 (= e!627964 (not call!46076))))

(declare-fun b!1100204 () Bool)

(declare-fun res!734149 () Bool)

(declare-fun e!627958 () Bool)

(assert (=> b!1100204 (=> (not res!734149) (not e!627958))))

(declare-fun e!627956 () Bool)

(assert (=> b!1100204 (= res!734149 e!627956)))

(declare-fun res!734152 () Bool)

(assert (=> b!1100204 (=> res!734152 e!627956)))

(declare-fun e!627963 () Bool)

(assert (=> b!1100204 (= res!734152 (not e!627963))))

(declare-fun res!734151 () Bool)

(assert (=> b!1100204 (=> (not res!734151) (not e!627963))))

(assert (=> b!1100204 (= res!734151 (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(declare-fun call!46073 () ListLongMap!15317)

(declare-fun bm!46073 () Bool)

(declare-fun c!108704 () Bool)

(declare-fun c!108703 () Bool)

(assert (=> bm!46073 (= call!46078 (+!3381 (ite c!108703 call!46074 (ite c!108704 call!46075 call!46073)) (ite (or c!108703 c!108704) (tuple2!17349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100205 () Bool)

(assert (=> b!1100205 (= e!627956 e!627961)))

(declare-fun res!734154 () Bool)

(assert (=> b!1100205 (=> (not res!734154) (not e!627961))))

(assert (=> b!1100205 (= res!734154 (contains!6395 lt!492862 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(assert (=> b!1100205 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(declare-fun bm!46074 () Bool)

(assert (=> bm!46074 (= call!46077 (contains!6395 lt!492862 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100206 () Bool)

(declare-fun e!627966 () ListLongMap!15317)

(assert (=> b!1100206 (= e!627966 call!46073)))

(declare-fun b!1100207 () Bool)

(declare-fun c!108706 () Bool)

(assert (=> b!1100207 (= c!108706 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100207 (= e!627957 e!627966)))

(declare-fun d!130569 () Bool)

(assert (=> d!130569 e!627958))

(declare-fun res!734153 () Bool)

(assert (=> d!130569 (=> (not res!734153) (not e!627958))))

(assert (=> d!130569 (= res!734153 (or (bvsge #b00000000000000000000000000000000 (size!34843 lt!492710)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))))

(declare-fun lt!492871 () ListLongMap!15317)

(assert (=> d!130569 (= lt!492862 lt!492871)))

(declare-fun lt!492863 () Unit!36166)

(declare-fun e!627965 () Unit!36166)

(assert (=> d!130569 (= lt!492863 e!627965)))

(declare-fun c!108702 () Bool)

(assert (=> d!130569 (= c!108702 e!627960)))

(declare-fun res!734155 () Bool)

(assert (=> d!130569 (=> (not res!734155) (not e!627960))))

(assert (=> d!130569 (= res!734155 (bvslt #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(declare-fun e!627959 () ListLongMap!15317)

(assert (=> d!130569 (= lt!492871 e!627959)))

(assert (=> d!130569 (= c!108703 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130569 (validMask!0 mask!1414)))

(assert (=> d!130569 (= (getCurrentListMap!4386 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492862)))

(declare-fun bm!46071 () Bool)

(assert (=> bm!46071 (= call!46073 call!46075)))

(declare-fun b!1100208 () Bool)

(assert (=> b!1100208 (= e!627959 (+!3381 call!46078 (tuple2!17349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!46075 () Bool)

(assert (=> bm!46075 (= call!46074 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100209 () Bool)

(declare-fun Unit!36169 () Unit!36166)

(assert (=> b!1100209 (= e!627965 Unit!36169)))

(declare-fun b!1100210 () Bool)

(assert (=> b!1100210 (= e!627963 (validKeyInArray!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(declare-fun b!1100211 () Bool)

(assert (=> b!1100211 (= e!627966 call!46072)))

(declare-fun b!1100212 () Bool)

(assert (=> b!1100212 (= e!627962 (not call!46077))))

(declare-fun b!1100213 () Bool)

(declare-fun res!734148 () Bool)

(assert (=> b!1100213 (=> (not res!734148) (not e!627958))))

(assert (=> b!1100213 (= res!734148 e!627964)))

(declare-fun c!108707 () Bool)

(assert (=> b!1100213 (= c!108707 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1100214 () Bool)

(assert (=> b!1100214 (= e!627959 e!627957)))

(assert (=> b!1100214 (= c!108704 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100215 () Bool)

(assert (=> b!1100215 (= e!627955 (= (apply!949 lt!492862 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100216 () Bool)

(assert (=> b!1100216 (= e!627958 e!627962)))

(declare-fun c!108705 () Bool)

(assert (=> b!1100216 (= c!108705 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100217 () Bool)

(declare-fun lt!492876 () Unit!36166)

(assert (=> b!1100217 (= e!627965 lt!492876)))

(declare-fun lt!492872 () ListLongMap!15317)

(assert (=> b!1100217 (= lt!492872 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492865 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492873 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492873 (select (arr!34307 lt!492710) #b00000000000000000000000000000000))))

(declare-fun lt!492875 () Unit!36166)

(assert (=> b!1100217 (= lt!492875 (addStillContains!662 lt!492872 lt!492865 zeroValue!831 lt!492873))))

(assert (=> b!1100217 (contains!6395 (+!3381 lt!492872 (tuple2!17349 lt!492865 zeroValue!831)) lt!492873)))

(declare-fun lt!492870 () Unit!36166)

(assert (=> b!1100217 (= lt!492870 lt!492875)))

(declare-fun lt!492861 () ListLongMap!15317)

(assert (=> b!1100217 (= lt!492861 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492874 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492874 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492867 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492867 (select (arr!34307 lt!492710) #b00000000000000000000000000000000))))

(declare-fun lt!492868 () Unit!36166)

(assert (=> b!1100217 (= lt!492868 (addApplyDifferent!522 lt!492861 lt!492874 minValue!831 lt!492867))))

(assert (=> b!1100217 (= (apply!949 (+!3381 lt!492861 (tuple2!17349 lt!492874 minValue!831)) lt!492867) (apply!949 lt!492861 lt!492867))))

(declare-fun lt!492866 () Unit!36166)

(assert (=> b!1100217 (= lt!492866 lt!492868)))

(declare-fun lt!492869 () ListLongMap!15317)

(assert (=> b!1100217 (= lt!492869 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492864 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492880 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492880 (select (arr!34307 lt!492710) #b00000000000000000000000000000000))))

(declare-fun lt!492860 () Unit!36166)

(assert (=> b!1100217 (= lt!492860 (addApplyDifferent!522 lt!492869 lt!492864 zeroValue!831 lt!492880))))

(assert (=> b!1100217 (= (apply!949 (+!3381 lt!492869 (tuple2!17349 lt!492864 zeroValue!831)) lt!492880) (apply!949 lt!492869 lt!492880))))

(declare-fun lt!492879 () Unit!36166)

(assert (=> b!1100217 (= lt!492879 lt!492860)))

(declare-fun lt!492878 () ListLongMap!15317)

(assert (=> b!1100217 (= lt!492878 (getCurrentListMapNoExtraKeys!4182 lt!492710 lt!492706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492877 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492877 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492859 () (_ BitVec 64))

(assert (=> b!1100217 (= lt!492859 (select (arr!34307 lt!492710) #b00000000000000000000000000000000))))

(assert (=> b!1100217 (= lt!492876 (addApplyDifferent!522 lt!492878 lt!492877 minValue!831 lt!492859))))

(assert (=> b!1100217 (= (apply!949 (+!3381 lt!492878 (tuple2!17349 lt!492877 minValue!831)) lt!492859) (apply!949 lt!492878 lt!492859))))

(assert (= (and d!130569 c!108703) b!1100208))

(assert (= (and d!130569 (not c!108703)) b!1100214))

(assert (= (and b!1100214 c!108704) b!1100198))

(assert (= (and b!1100214 (not c!108704)) b!1100207))

(assert (= (and b!1100207 c!108706) b!1100211))

(assert (= (and b!1100207 (not c!108706)) b!1100206))

(assert (= (or b!1100211 b!1100206) bm!46071))

(assert (= (or b!1100198 bm!46071) bm!46072))

(assert (= (or b!1100198 b!1100211) bm!46070))

(assert (= (or b!1100208 bm!46072) bm!46075))

(assert (= (or b!1100208 bm!46070) bm!46073))

(assert (= (and d!130569 res!734155) b!1100199))

(assert (= (and d!130569 c!108702) b!1100217))

(assert (= (and d!130569 (not c!108702)) b!1100209))

(assert (= (and d!130569 res!734153) b!1100204))

(assert (= (and b!1100204 res!734151) b!1100210))

(assert (= (and b!1100204 (not res!734152)) b!1100205))

(assert (= (and b!1100205 res!734154) b!1100197))

(assert (= (and b!1100204 res!734149) b!1100213))

(assert (= (and b!1100213 c!108707) b!1100202))

(assert (= (and b!1100213 (not c!108707)) b!1100203))

(assert (= (and b!1100202 res!734150) b!1100215))

(assert (= (or b!1100202 b!1100203) bm!46069))

(assert (= (and b!1100213 res!734148) b!1100216))

(assert (= (and b!1100216 c!108705) b!1100200))

(assert (= (and b!1100216 (not c!108705)) b!1100212))

(assert (= (and b!1100200 res!734156) b!1100201))

(assert (= (or b!1100200 b!1100212) bm!46074))

(declare-fun b_lambda!17989 () Bool)

(assert (=> (not b_lambda!17989) (not b!1100197)))

(assert (=> b!1100197 t!34144))

(declare-fun b_and!37033 () Bool)

(assert (= b_and!37031 (and (=> t!34144 result!16533) b_and!37033)))

(declare-fun m!1020241 () Bool)

(assert (=> b!1100208 m!1020241))

(declare-fun m!1020243 () Bool)

(assert (=> bm!46069 m!1020243))

(assert (=> d!130569 m!1020019))

(declare-fun m!1020245 () Bool)

(assert (=> b!1100201 m!1020245))

(declare-fun m!1020247 () Bool)

(assert (=> bm!46073 m!1020247))

(assert (=> b!1100199 m!1020129))

(assert (=> b!1100199 m!1020129))

(assert (=> b!1100199 m!1020147))

(declare-fun m!1020249 () Bool)

(assert (=> b!1100215 m!1020249))

(assert (=> b!1100210 m!1020129))

(assert (=> b!1100210 m!1020129))

(assert (=> b!1100210 m!1020147))

(assert (=> b!1100205 m!1020129))

(assert (=> b!1100205 m!1020129))

(declare-fun m!1020251 () Bool)

(assert (=> b!1100205 m!1020251))

(declare-fun m!1020253 () Bool)

(assert (=> b!1100217 m!1020253))

(assert (=> b!1100217 m!1020253))

(declare-fun m!1020255 () Bool)

(assert (=> b!1100217 m!1020255))

(assert (=> b!1100217 m!1020129))

(declare-fun m!1020257 () Bool)

(assert (=> b!1100217 m!1020257))

(declare-fun m!1020259 () Bool)

(assert (=> b!1100217 m!1020259))

(declare-fun m!1020261 () Bool)

(assert (=> b!1100217 m!1020261))

(declare-fun m!1020263 () Bool)

(assert (=> b!1100217 m!1020263))

(declare-fun m!1020265 () Bool)

(assert (=> b!1100217 m!1020265))

(declare-fun m!1020267 () Bool)

(assert (=> b!1100217 m!1020267))

(declare-fun m!1020269 () Bool)

(assert (=> b!1100217 m!1020269))

(assert (=> b!1100217 m!1020259))

(declare-fun m!1020271 () Bool)

(assert (=> b!1100217 m!1020271))

(assert (=> b!1100217 m!1020031))

(declare-fun m!1020273 () Bool)

(assert (=> b!1100217 m!1020273))

(assert (=> b!1100217 m!1020267))

(declare-fun m!1020275 () Bool)

(assert (=> b!1100217 m!1020275))

(assert (=> b!1100217 m!1020273))

(declare-fun m!1020277 () Bool)

(assert (=> b!1100217 m!1020277))

(declare-fun m!1020279 () Bool)

(assert (=> b!1100217 m!1020279))

(declare-fun m!1020281 () Bool)

(assert (=> b!1100217 m!1020281))

(assert (=> bm!46075 m!1020031))

(assert (=> b!1100197 m!1020141))

(assert (=> b!1100197 m!1020025))

(assert (=> b!1100197 m!1020129))

(assert (=> b!1100197 m!1020129))

(declare-fun m!1020283 () Bool)

(assert (=> b!1100197 m!1020283))

(assert (=> b!1100197 m!1020141))

(assert (=> b!1100197 m!1020025))

(assert (=> b!1100197 m!1020143))

(declare-fun m!1020285 () Bool)

(assert (=> bm!46074 m!1020285))

(assert (=> b!1100002 d!130569))

(declare-fun d!130571 () Bool)

(declare-fun e!627967 () Bool)

(assert (=> d!130571 e!627967))

(declare-fun res!734157 () Bool)

(assert (=> d!130571 (=> (not res!734157) (not e!627967))))

(declare-fun lt!492884 () ListLongMap!15317)

(assert (=> d!130571 (= res!734157 (contains!6395 lt!492884 (_1!8685 lt!492708)))))

(declare-fun lt!492881 () List!23966)

(assert (=> d!130571 (= lt!492884 (ListLongMap!15318 lt!492881))))

(declare-fun lt!492882 () Unit!36166)

(declare-fun lt!492883 () Unit!36166)

(assert (=> d!130571 (= lt!492882 lt!492883)))

(assert (=> d!130571 (= (getValueByKey!624 lt!492881 (_1!8685 lt!492708)) (Some!674 (_2!8685 lt!492708)))))

(assert (=> d!130571 (= lt!492883 (lemmaContainsTupThenGetReturnValue!301 lt!492881 (_1!8685 lt!492708) (_2!8685 lt!492708)))))

(assert (=> d!130571 (= lt!492881 (insertStrictlySorted!394 (toList!7674 lt!492712) (_1!8685 lt!492708) (_2!8685 lt!492708)))))

(assert (=> d!130571 (= (+!3381 lt!492712 lt!492708) lt!492884)))

(declare-fun b!1100218 () Bool)

(declare-fun res!734158 () Bool)

(assert (=> b!1100218 (=> (not res!734158) (not e!627967))))

(assert (=> b!1100218 (= res!734158 (= (getValueByKey!624 (toList!7674 lt!492884) (_1!8685 lt!492708)) (Some!674 (_2!8685 lt!492708))))))

(declare-fun b!1100219 () Bool)

(assert (=> b!1100219 (= e!627967 (contains!6396 (toList!7674 lt!492884) lt!492708))))

(assert (= (and d!130571 res!734157) b!1100218))

(assert (= (and b!1100218 res!734158) b!1100219))

(declare-fun m!1020287 () Bool)

(assert (=> d!130571 m!1020287))

(declare-fun m!1020289 () Bool)

(assert (=> d!130571 m!1020289))

(declare-fun m!1020291 () Bool)

(assert (=> d!130571 m!1020291))

(declare-fun m!1020293 () Bool)

(assert (=> d!130571 m!1020293))

(declare-fun m!1020295 () Bool)

(assert (=> b!1100218 m!1020295))

(declare-fun m!1020297 () Bool)

(assert (=> b!1100219 m!1020297))

(assert (=> b!1100013 d!130571))

(declare-fun b!1100230 () Bool)

(declare-fun e!627977 () Bool)

(declare-fun contains!6397 (List!23967 (_ BitVec 64)) Bool)

(assert (=> b!1100230 (= e!627977 (contains!6397 Nil!23964 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100231 () Bool)

(declare-fun e!627979 () Bool)

(declare-fun e!627976 () Bool)

(assert (=> b!1100231 (= e!627979 e!627976)))

(declare-fun c!108710 () Bool)

(assert (=> b!1100231 (= c!108710 (validKeyInArray!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130573 () Bool)

(declare-fun res!734167 () Bool)

(declare-fun e!627978 () Bool)

(assert (=> d!130573 (=> res!734167 e!627978)))

(assert (=> d!130573 (= res!734167 (bvsge #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(assert (=> d!130573 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23964) e!627978)))

(declare-fun b!1100232 () Bool)

(declare-fun call!46081 () Bool)

(assert (=> b!1100232 (= e!627976 call!46081)))

(declare-fun bm!46078 () Bool)

(assert (=> bm!46078 (= call!46081 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108710 (Cons!23963 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000) Nil!23964) Nil!23964)))))

(declare-fun b!1100233 () Bool)

(assert (=> b!1100233 (= e!627976 call!46081)))

(declare-fun b!1100234 () Bool)

(assert (=> b!1100234 (= e!627978 e!627979)))

(declare-fun res!734165 () Bool)

(assert (=> b!1100234 (=> (not res!734165) (not e!627979))))

(assert (=> b!1100234 (= res!734165 (not e!627977))))

(declare-fun res!734166 () Bool)

(assert (=> b!1100234 (=> (not res!734166) (not e!627977))))

(assert (=> b!1100234 (= res!734166 (validKeyInArray!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130573 (not res!734167)) b!1100234))

(assert (= (and b!1100234 res!734166) b!1100230))

(assert (= (and b!1100234 res!734165) b!1100231))

(assert (= (and b!1100231 c!108710) b!1100233))

(assert (= (and b!1100231 (not c!108710)) b!1100232))

(assert (= (or b!1100233 b!1100232) bm!46078))

(assert (=> b!1100230 m!1020125))

(assert (=> b!1100230 m!1020125))

(declare-fun m!1020299 () Bool)

(assert (=> b!1100230 m!1020299))

(assert (=> b!1100231 m!1020125))

(assert (=> b!1100231 m!1020125))

(assert (=> b!1100231 m!1020165))

(assert (=> bm!46078 m!1020125))

(declare-fun m!1020301 () Bool)

(assert (=> bm!46078 m!1020301))

(assert (=> b!1100234 m!1020125))

(assert (=> b!1100234 m!1020125))

(assert (=> b!1100234 m!1020165))

(assert (=> b!1100004 d!130573))

(declare-fun b!1100243 () Bool)

(declare-fun e!627988 () Bool)

(declare-fun e!627987 () Bool)

(assert (=> b!1100243 (= e!627988 e!627987)))

(declare-fun c!108713 () Bool)

(assert (=> b!1100243 (= c!108713 (validKeyInArray!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(declare-fun bm!46081 () Bool)

(declare-fun call!46084 () Bool)

(assert (=> bm!46081 (= call!46084 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!492710 mask!1414))))

(declare-fun d!130575 () Bool)

(declare-fun res!734173 () Bool)

(assert (=> d!130575 (=> res!734173 e!627988)))

(assert (=> d!130575 (= res!734173 (bvsge #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(assert (=> d!130575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492710 mask!1414) e!627988)))

(declare-fun b!1100244 () Bool)

(assert (=> b!1100244 (= e!627987 call!46084)))

(declare-fun b!1100245 () Bool)

(declare-fun e!627986 () Bool)

(assert (=> b!1100245 (= e!627986 call!46084)))

(declare-fun b!1100246 () Bool)

(assert (=> b!1100246 (= e!627987 e!627986)))

(declare-fun lt!492892 () (_ BitVec 64))

(assert (=> b!1100246 (= lt!492892 (select (arr!34307 lt!492710) #b00000000000000000000000000000000))))

(declare-fun lt!492891 () Unit!36166)

(assert (=> b!1100246 (= lt!492891 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!492710 lt!492892 #b00000000000000000000000000000000))))

(assert (=> b!1100246 (arrayContainsKey!0 lt!492710 lt!492892 #b00000000000000000000000000000000)))

(declare-fun lt!492893 () Unit!36166)

(assert (=> b!1100246 (= lt!492893 lt!492891)))

(declare-fun res!734172 () Bool)

(declare-datatypes ((SeekEntryResult!9912 0))(
  ( (MissingZero!9912 (index!42019 (_ BitVec 32))) (Found!9912 (index!42020 (_ BitVec 32))) (Intermediate!9912 (undefined!10724 Bool) (index!42021 (_ BitVec 32)) (x!98936 (_ BitVec 32))) (Undefined!9912) (MissingVacant!9912 (index!42022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71283 (_ BitVec 32)) SeekEntryResult!9912)

(assert (=> b!1100246 (= res!734172 (= (seekEntryOrOpen!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000) lt!492710 mask!1414) (Found!9912 #b00000000000000000000000000000000)))))

(assert (=> b!1100246 (=> (not res!734172) (not e!627986))))

(assert (= (and d!130575 (not res!734173)) b!1100243))

(assert (= (and b!1100243 c!108713) b!1100246))

(assert (= (and b!1100243 (not c!108713)) b!1100244))

(assert (= (and b!1100246 res!734172) b!1100245))

(assert (= (or b!1100245 b!1100244) bm!46081))

(assert (=> b!1100243 m!1020129))

(assert (=> b!1100243 m!1020129))

(assert (=> b!1100243 m!1020147))

(declare-fun m!1020303 () Bool)

(assert (=> bm!46081 m!1020303))

(assert (=> b!1100246 m!1020129))

(declare-fun m!1020305 () Bool)

(assert (=> b!1100246 m!1020305))

(declare-fun m!1020307 () Bool)

(assert (=> b!1100246 m!1020307))

(assert (=> b!1100246 m!1020129))

(declare-fun m!1020309 () Bool)

(assert (=> b!1100246 m!1020309))

(assert (=> b!1100005 d!130575))

(declare-fun d!130577 () Bool)

(assert (=> d!130577 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96712 d!130577))

(declare-fun d!130579 () Bool)

(assert (=> d!130579 (= (array_inv!26426 _keys!1070) (bvsge (size!34843 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96712 d!130579))

(declare-fun d!130581 () Bool)

(assert (=> d!130581 (= (array_inv!26427 _values!874) (bvsge (size!34844 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96712 d!130581))

(declare-fun d!130583 () Bool)

(declare-fun e!627989 () Bool)

(assert (=> d!130583 e!627989))

(declare-fun res!734174 () Bool)

(assert (=> d!130583 (=> (not res!734174) (not e!627989))))

(declare-fun lt!492897 () ListLongMap!15317)

(assert (=> d!130583 (= res!734174 (contains!6395 lt!492897 (_1!8685 lt!492708)))))

(declare-fun lt!492894 () List!23966)

(assert (=> d!130583 (= lt!492897 (ListLongMap!15318 lt!492894))))

(declare-fun lt!492895 () Unit!36166)

(declare-fun lt!492896 () Unit!36166)

(assert (=> d!130583 (= lt!492895 lt!492896)))

(assert (=> d!130583 (= (getValueByKey!624 lt!492894 (_1!8685 lt!492708)) (Some!674 (_2!8685 lt!492708)))))

(assert (=> d!130583 (= lt!492896 (lemmaContainsTupThenGetReturnValue!301 lt!492894 (_1!8685 lt!492708) (_2!8685 lt!492708)))))

(assert (=> d!130583 (= lt!492894 (insertStrictlySorted!394 (toList!7674 lt!492707) (_1!8685 lt!492708) (_2!8685 lt!492708)))))

(assert (=> d!130583 (= (+!3381 lt!492707 lt!492708) lt!492897)))

(declare-fun b!1100247 () Bool)

(declare-fun res!734175 () Bool)

(assert (=> b!1100247 (=> (not res!734175) (not e!627989))))

(assert (=> b!1100247 (= res!734175 (= (getValueByKey!624 (toList!7674 lt!492897) (_1!8685 lt!492708)) (Some!674 (_2!8685 lt!492708))))))

(declare-fun b!1100248 () Bool)

(assert (=> b!1100248 (= e!627989 (contains!6396 (toList!7674 lt!492897) lt!492708))))

(assert (= (and d!130583 res!734174) b!1100247))

(assert (= (and b!1100247 res!734175) b!1100248))

(declare-fun m!1020311 () Bool)

(assert (=> d!130583 m!1020311))

(declare-fun m!1020313 () Bool)

(assert (=> d!130583 m!1020313))

(declare-fun m!1020315 () Bool)

(assert (=> d!130583 m!1020315))

(declare-fun m!1020317 () Bool)

(assert (=> d!130583 m!1020317))

(declare-fun m!1020319 () Bool)

(assert (=> b!1100247 m!1020319))

(declare-fun m!1020321 () Bool)

(assert (=> b!1100248 m!1020321))

(assert (=> b!1100009 d!130583))

(declare-fun d!130585 () Bool)

(assert (=> d!130585 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100010 d!130585))

(declare-fun b!1100249 () Bool)

(declare-fun e!627992 () Bool)

(declare-fun e!627991 () Bool)

(assert (=> b!1100249 (= e!627992 e!627991)))

(declare-fun c!108714 () Bool)

(assert (=> b!1100249 (= c!108714 (validKeyInArray!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46082 () Bool)

(declare-fun call!46085 () Bool)

(assert (=> bm!46082 (= call!46085 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130587 () Bool)

(declare-fun res!734177 () Bool)

(assert (=> d!130587 (=> res!734177 e!627992)))

(assert (=> d!130587 (= res!734177 (bvsge #b00000000000000000000000000000000 (size!34843 _keys!1070)))))

(assert (=> d!130587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627992)))

(declare-fun b!1100250 () Bool)

(assert (=> b!1100250 (= e!627991 call!46085)))

(declare-fun b!1100251 () Bool)

(declare-fun e!627990 () Bool)

(assert (=> b!1100251 (= e!627990 call!46085)))

(declare-fun b!1100252 () Bool)

(assert (=> b!1100252 (= e!627991 e!627990)))

(declare-fun lt!492899 () (_ BitVec 64))

(assert (=> b!1100252 (= lt!492899 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492898 () Unit!36166)

(assert (=> b!1100252 (= lt!492898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!492899 #b00000000000000000000000000000000))))

(assert (=> b!1100252 (arrayContainsKey!0 _keys!1070 lt!492899 #b00000000000000000000000000000000)))

(declare-fun lt!492900 () Unit!36166)

(assert (=> b!1100252 (= lt!492900 lt!492898)))

(declare-fun res!734176 () Bool)

(assert (=> b!1100252 (= res!734176 (= (seekEntryOrOpen!0 (select (arr!34307 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9912 #b00000000000000000000000000000000)))))

(assert (=> b!1100252 (=> (not res!734176) (not e!627990))))

(assert (= (and d!130587 (not res!734177)) b!1100249))

(assert (= (and b!1100249 c!108714) b!1100252))

(assert (= (and b!1100249 (not c!108714)) b!1100250))

(assert (= (and b!1100252 res!734176) b!1100251))

(assert (= (or b!1100251 b!1100250) bm!46082))

(assert (=> b!1100249 m!1020125))

(assert (=> b!1100249 m!1020125))

(assert (=> b!1100249 m!1020165))

(declare-fun m!1020323 () Bool)

(assert (=> bm!46082 m!1020323))

(assert (=> b!1100252 m!1020125))

(declare-fun m!1020325 () Bool)

(assert (=> b!1100252 m!1020325))

(declare-fun m!1020327 () Bool)

(assert (=> b!1100252 m!1020327))

(assert (=> b!1100252 m!1020125))

(declare-fun m!1020329 () Bool)

(assert (=> b!1100252 m!1020329))

(assert (=> b!1100001 d!130587))

(declare-fun b!1100253 () Bool)

(declare-fun e!627994 () Bool)

(assert (=> b!1100253 (= e!627994 (contains!6397 Nil!23964 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(declare-fun b!1100254 () Bool)

(declare-fun e!627996 () Bool)

(declare-fun e!627993 () Bool)

(assert (=> b!1100254 (= e!627996 e!627993)))

(declare-fun c!108715 () Bool)

(assert (=> b!1100254 (= c!108715 (validKeyInArray!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(declare-fun d!130589 () Bool)

(declare-fun res!734180 () Bool)

(declare-fun e!627995 () Bool)

(assert (=> d!130589 (=> res!734180 e!627995)))

(assert (=> d!130589 (= res!734180 (bvsge #b00000000000000000000000000000000 (size!34843 lt!492710)))))

(assert (=> d!130589 (= (arrayNoDuplicates!0 lt!492710 #b00000000000000000000000000000000 Nil!23964) e!627995)))

(declare-fun b!1100255 () Bool)

(declare-fun call!46086 () Bool)

(assert (=> b!1100255 (= e!627993 call!46086)))

(declare-fun bm!46083 () Bool)

(assert (=> bm!46083 (= call!46086 (arrayNoDuplicates!0 lt!492710 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108715 (Cons!23963 (select (arr!34307 lt!492710) #b00000000000000000000000000000000) Nil!23964) Nil!23964)))))

(declare-fun b!1100256 () Bool)

(assert (=> b!1100256 (= e!627993 call!46086)))

(declare-fun b!1100257 () Bool)

(assert (=> b!1100257 (= e!627995 e!627996)))

(declare-fun res!734178 () Bool)

(assert (=> b!1100257 (=> (not res!734178) (not e!627996))))

(assert (=> b!1100257 (= res!734178 (not e!627994))))

(declare-fun res!734179 () Bool)

(assert (=> b!1100257 (=> (not res!734179) (not e!627994))))

(assert (=> b!1100257 (= res!734179 (validKeyInArray!0 (select (arr!34307 lt!492710) #b00000000000000000000000000000000)))))

(assert (= (and d!130589 (not res!734180)) b!1100257))

(assert (= (and b!1100257 res!734179) b!1100253))

(assert (= (and b!1100257 res!734178) b!1100254))

(assert (= (and b!1100254 c!108715) b!1100256))

(assert (= (and b!1100254 (not c!108715)) b!1100255))

(assert (= (or b!1100256 b!1100255) bm!46083))

(assert (=> b!1100253 m!1020129))

(assert (=> b!1100253 m!1020129))

(declare-fun m!1020331 () Bool)

(assert (=> b!1100253 m!1020331))

(assert (=> b!1100254 m!1020129))

(assert (=> b!1100254 m!1020129))

(assert (=> b!1100254 m!1020147))

(assert (=> bm!46083 m!1020129))

(declare-fun m!1020333 () Bool)

(assert (=> bm!46083 m!1020333))

(assert (=> b!1100257 m!1020129))

(assert (=> b!1100257 m!1020129))

(assert (=> b!1100257 m!1020147))

(assert (=> b!1100007 d!130589))

(declare-fun mapIsEmpty!42559 () Bool)

(declare-fun mapRes!42559 () Bool)

(assert (=> mapIsEmpty!42559 mapRes!42559))

(declare-fun mapNonEmpty!42559 () Bool)

(declare-fun tp!81353 () Bool)

(declare-fun e!628001 () Bool)

(assert (=> mapNonEmpty!42559 (= mapRes!42559 (and tp!81353 e!628001))))

(declare-fun mapKey!42559 () (_ BitVec 32))

(declare-fun mapRest!42559 () (Array (_ BitVec 32) ValueCell!12882))

(declare-fun mapValue!42559 () ValueCell!12882)

(assert (=> mapNonEmpty!42559 (= mapRest!42553 (store mapRest!42559 mapKey!42559 mapValue!42559))))

(declare-fun b!1100264 () Bool)

(assert (=> b!1100264 (= e!628001 tp_is_empty!27183)))

(declare-fun condMapEmpty!42559 () Bool)

(declare-fun mapDefault!42559 () ValueCell!12882)

(assert (=> mapNonEmpty!42553 (= condMapEmpty!42559 (= mapRest!42553 ((as const (Array (_ BitVec 32) ValueCell!12882)) mapDefault!42559)))))

(declare-fun e!628002 () Bool)

(assert (=> mapNonEmpty!42553 (= tp!81343 (and e!628002 mapRes!42559))))

(declare-fun b!1100265 () Bool)

(assert (=> b!1100265 (= e!628002 tp_is_empty!27183)))

(assert (= (and mapNonEmpty!42553 condMapEmpty!42559) mapIsEmpty!42559))

(assert (= (and mapNonEmpty!42553 (not condMapEmpty!42559)) mapNonEmpty!42559))

(assert (= (and mapNonEmpty!42559 ((_ is ValueCellFull!12882) mapValue!42559)) b!1100264))

(assert (= (and mapNonEmpty!42553 ((_ is ValueCellFull!12882) mapDefault!42559)) b!1100265))

(declare-fun m!1020335 () Bool)

(assert (=> mapNonEmpty!42559 m!1020335))

(declare-fun b_lambda!17991 () Bool)

(assert (= b_lambda!17981 (or (and start!96712 b_free!23133) b_lambda!17991)))

(declare-fun b_lambda!17993 () Bool)

(assert (= b_lambda!17979 (or (and start!96712 b_free!23133) b_lambda!17993)))

(declare-fun b_lambda!17995 () Bool)

(assert (= b_lambda!17977 (or (and start!96712 b_free!23133) b_lambda!17995)))

(declare-fun b_lambda!17997 () Bool)

(assert (= b_lambda!17987 (or (and start!96712 b_free!23133) b_lambda!17997)))

(declare-fun b_lambda!17999 () Bool)

(assert (= b_lambda!17983 (or (and start!96712 b_free!23133) b_lambda!17999)))

(declare-fun b_lambda!18001 () Bool)

(assert (= b_lambda!17989 (or (and start!96712 b_free!23133) b_lambda!18001)))

(declare-fun b_lambda!18003 () Bool)

(assert (= b_lambda!17985 (or (and start!96712 b_free!23133) b_lambda!18003)))

(check-sat (not d!130571) (not b!1100231) (not b!1100187) (not b!1100182) (not b!1100210) (not b!1100104) (not b!1100155) (not b!1100103) (not bm!46066) (not b!1100217) (not b!1100109) (not b_lambda!18003) (not b!1100208) (not b_lambda!17975) (not d!130569) (not d!130565) (not b!1100166) (not b!1100105) (not d!130583) (not bm!46069) (not b_lambda!17995) (not b!1100163) (not b!1100107) (not b!1100189) (not bm!46074) (not b!1100191) (not b!1100185) (not bm!46068) (not b!1100111) (not b!1100201) (not b!1100253) (not b!1100205) (not b!1100175) (not d!130567) (not b_lambda!17997) (not b!1100188) (not b!1100101) (not bm!46067) (not b!1100192) (not b_lambda!17999) (not b!1100249) (not bm!46083) (not b!1100069) (not bm!46078) (not bm!46082) (not b!1100248) (not b!1100252) (not d!130559) (not b!1100076) (not b!1100193) (not b!1100215) (not b!1100173) (not d!130557) (not b_lambda!17991) (not bm!46059) b_and!37033 (not b!1100247) (not b!1100243) (not bm!46040) (not b!1100070) (not b!1100219) (not b_lambda!17993) (not d!130553) (not b!1100197) (not b_lambda!18001) (not b!1100230) (not b!1100168) (not b!1100257) (not bm!46060) (not bm!46075) (not b!1100157) (not b_next!23133) tp_is_empty!27183 (not b!1100254) (not b!1100195) (not b!1100218) (not d!130561) (not b!1100159) (not b!1100199) (not bm!46081) (not b!1100234) (not b!1100108) (not bm!46055) (not bm!46061) (not bm!46073) (not mapNonEmpty!42559) (not b!1100246) (not d!130563))
(check-sat b_and!37033 (not b_next!23133))
