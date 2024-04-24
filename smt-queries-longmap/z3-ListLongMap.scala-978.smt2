; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21150 () Bool)

(assert start!21150)

(declare-fun b_free!5617 () Bool)

(declare-fun b_next!5617 () Bool)

(assert (=> start!21150 (= b_free!5617 (not b_next!5617))))

(declare-fun tp!19918 () Bool)

(declare-fun b_and!12485 () Bool)

(assert (=> start!21150 (= tp!19918 b_and!12485)))

(declare-fun mapIsEmpty!9314 () Bool)

(declare-fun mapRes!9314 () Bool)

(assert (=> mapIsEmpty!9314 mapRes!9314))

(declare-fun b!212930 () Bool)

(declare-fun e!138511 () Bool)

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!212930 (= e!138511 (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138512 () Bool)

(assert (=> b!212930 e!138512))

(declare-fun res!104151 () Bool)

(assert (=> b!212930 (=> (not res!104151) (not e!138512))))

(declare-datatypes ((V!6953 0))(
  ( (V!6954 (val!2784 Int)) )
))
(declare-datatypes ((tuple2!4152 0))(
  ( (tuple2!4153 (_1!2087 (_ BitVec 64)) (_2!2087 V!6953)) )
))
(declare-datatypes ((List!3035 0))(
  ( (Nil!3032) (Cons!3031 (h!3673 tuple2!4152) (t!7976 List!3035)) )
))
(declare-datatypes ((ListLongMap!3067 0))(
  ( (ListLongMap!3068 (toList!1549 List!3035)) )
))
(declare-fun lt!109896 () ListLongMap!3067)

(declare-fun lt!109898 () tuple2!4152)

(declare-fun lt!109893 () ListLongMap!3067)

(declare-fun +!578 (ListLongMap!3067 tuple2!4152) ListLongMap!3067)

(assert (=> b!212930 (= res!104151 (= lt!109893 (+!578 lt!109896 lt!109898)))))

(declare-fun minValue!615 () V!6953)

(assert (=> b!212930 (= lt!109898 (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212931 () Bool)

(declare-fun res!104144 () Bool)

(declare-fun e!138515 () Bool)

(assert (=> b!212931 (=> (not res!104144) (not e!138515))))

(declare-datatypes ((array!10161 0))(
  ( (array!10162 (arr!4822 (Array (_ BitVec 32) (_ BitVec 64))) (size!5147 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10161)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212931 (= res!104144 (= (select (arr!4822 _keys!825) i!601) k0!843))))

(declare-fun lt!109894 () ListLongMap!3067)

(declare-fun lt!109895 () ListLongMap!3067)

(declare-fun b!212932 () Bool)

(assert (=> b!212932 (= e!138512 (= lt!109895 (+!578 lt!109894 lt!109898)))))

(declare-fun b!212933 () Bool)

(declare-fun res!104152 () Bool)

(assert (=> b!212933 (=> (not res!104152) (not e!138515))))

(assert (=> b!212933 (= res!104152 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5147 _keys!825))))))

(declare-fun b!212934 () Bool)

(declare-fun res!104148 () Bool)

(assert (=> b!212934 (=> (not res!104148) (not e!138515))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10161 (_ BitVec 32)) Bool)

(assert (=> b!212934 (= res!104148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212935 () Bool)

(declare-fun e!138517 () Bool)

(declare-fun tp_is_empty!5479 () Bool)

(assert (=> b!212935 (= e!138517 tp_is_empty!5479)))

(declare-fun b!212936 () Bool)

(declare-fun e!138514 () Bool)

(assert (=> b!212936 (= e!138514 (and e!138517 mapRes!9314))))

(declare-fun condMapEmpty!9314 () Bool)

(declare-datatypes ((ValueCell!2396 0))(
  ( (ValueCellFull!2396 (v!4791 V!6953)) (EmptyCell!2396) )
))
(declare-datatypes ((array!10163 0))(
  ( (array!10164 (arr!4823 (Array (_ BitVec 32) ValueCell!2396)) (size!5148 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10163)

(declare-fun mapDefault!9314 () ValueCell!2396)

(assert (=> b!212936 (= condMapEmpty!9314 (= (arr!4823 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2396)) mapDefault!9314)))))

(declare-fun res!104145 () Bool)

(assert (=> start!21150 (=> (not res!104145) (not e!138515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21150 (= res!104145 (validMask!0 mask!1149))))

(assert (=> start!21150 e!138515))

(declare-fun array_inv!3163 (array!10163) Bool)

(assert (=> start!21150 (and (array_inv!3163 _values!649) e!138514)))

(assert (=> start!21150 true))

(assert (=> start!21150 tp_is_empty!5479))

(declare-fun array_inv!3164 (array!10161) Bool)

(assert (=> start!21150 (array_inv!3164 _keys!825)))

(assert (=> start!21150 tp!19918))

(declare-fun b!212937 () Bool)

(assert (=> b!212937 (= e!138515 (not e!138511))))

(declare-fun res!104150 () Bool)

(assert (=> b!212937 (=> res!104150 e!138511)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212937 (= res!104150 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6953)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1085 (array!10161 array!10163 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) Int) ListLongMap!3067)

(assert (=> b!212937 (= lt!109895 (getCurrentListMap!1085 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109899 () array!10163)

(assert (=> b!212937 (= lt!109893 (getCurrentListMap!1085 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109897 () ListLongMap!3067)

(assert (=> b!212937 (and (= lt!109896 lt!109897) (= lt!109897 lt!109896))))

(declare-fun v!520 () V!6953)

(assert (=> b!212937 (= lt!109897 (+!578 lt!109894 (tuple2!4153 k0!843 v!520)))))

(declare-datatypes ((Unit!6446 0))(
  ( (Unit!6447) )
))
(declare-fun lt!109900 () Unit!6446)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 (array!10161 array!10163 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) (_ BitVec 64) V!6953 (_ BitVec 32) Int) Unit!6446)

(assert (=> b!212937 (= lt!109900 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!508 (array!10161 array!10163 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) Int) ListLongMap!3067)

(assert (=> b!212937 (= lt!109896 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212937 (= lt!109899 (array!10164 (store (arr!4823 _values!649) i!601 (ValueCellFull!2396 v!520)) (size!5148 _values!649)))))

(assert (=> b!212937 (= lt!109894 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212938 () Bool)

(declare-fun res!104146 () Bool)

(assert (=> b!212938 (=> (not res!104146) (not e!138515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212938 (= res!104146 (validKeyInArray!0 k0!843))))

(declare-fun b!212939 () Bool)

(declare-fun res!104147 () Bool)

(assert (=> b!212939 (=> (not res!104147) (not e!138515))))

(declare-datatypes ((List!3036 0))(
  ( (Nil!3033) (Cons!3032 (h!3674 (_ BitVec 64)) (t!7977 List!3036)) )
))
(declare-fun arrayNoDuplicates!0 (array!10161 (_ BitVec 32) List!3036) Bool)

(assert (=> b!212939 (= res!104147 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3033))))

(declare-fun b!212940 () Bool)

(declare-fun res!104153 () Bool)

(assert (=> b!212940 (=> (not res!104153) (not e!138515))))

(assert (=> b!212940 (= res!104153 (and (= (size!5148 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5147 _keys!825) (size!5148 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9314 () Bool)

(declare-fun tp!19919 () Bool)

(declare-fun e!138513 () Bool)

(assert (=> mapNonEmpty!9314 (= mapRes!9314 (and tp!19919 e!138513))))

(declare-fun mapRest!9314 () (Array (_ BitVec 32) ValueCell!2396))

(declare-fun mapValue!9314 () ValueCell!2396)

(declare-fun mapKey!9314 () (_ BitVec 32))

(assert (=> mapNonEmpty!9314 (= (arr!4823 _values!649) (store mapRest!9314 mapKey!9314 mapValue!9314))))

(declare-fun b!212941 () Bool)

(assert (=> b!212941 (= e!138513 tp_is_empty!5479)))

(declare-fun b!212942 () Bool)

(declare-fun res!104149 () Bool)

(assert (=> b!212942 (=> (not res!104149) (not e!138512))))

(assert (=> b!212942 (= res!104149 (= lt!109893 (+!578 lt!109897 lt!109898)))))

(assert (= (and start!21150 res!104145) b!212940))

(assert (= (and b!212940 res!104153) b!212934))

(assert (= (and b!212934 res!104148) b!212939))

(assert (= (and b!212939 res!104147) b!212933))

(assert (= (and b!212933 res!104152) b!212938))

(assert (= (and b!212938 res!104146) b!212931))

(assert (= (and b!212931 res!104144) b!212937))

(assert (= (and b!212937 (not res!104150)) b!212930))

(assert (= (and b!212930 res!104151) b!212942))

(assert (= (and b!212942 res!104149) b!212932))

(assert (= (and b!212936 condMapEmpty!9314) mapIsEmpty!9314))

(assert (= (and b!212936 (not condMapEmpty!9314)) mapNonEmpty!9314))

(get-info :version)

(assert (= (and mapNonEmpty!9314 ((_ is ValueCellFull!2396) mapValue!9314)) b!212941))

(assert (= (and b!212936 ((_ is ValueCellFull!2396) mapDefault!9314)) b!212935))

(assert (= start!21150 b!212936))

(declare-fun m!240889 () Bool)

(assert (=> start!21150 m!240889))

(declare-fun m!240891 () Bool)

(assert (=> start!21150 m!240891))

(declare-fun m!240893 () Bool)

(assert (=> start!21150 m!240893))

(declare-fun m!240895 () Bool)

(assert (=> mapNonEmpty!9314 m!240895))

(declare-fun m!240897 () Bool)

(assert (=> b!212934 m!240897))

(declare-fun m!240899 () Bool)

(assert (=> b!212937 m!240899))

(declare-fun m!240901 () Bool)

(assert (=> b!212937 m!240901))

(declare-fun m!240903 () Bool)

(assert (=> b!212937 m!240903))

(declare-fun m!240905 () Bool)

(assert (=> b!212937 m!240905))

(declare-fun m!240907 () Bool)

(assert (=> b!212937 m!240907))

(declare-fun m!240909 () Bool)

(assert (=> b!212937 m!240909))

(declare-fun m!240911 () Bool)

(assert (=> b!212937 m!240911))

(declare-fun m!240913 () Bool)

(assert (=> b!212930 m!240913))

(declare-fun m!240915 () Bool)

(assert (=> b!212931 m!240915))

(declare-fun m!240917 () Bool)

(assert (=> b!212932 m!240917))

(declare-fun m!240919 () Bool)

(assert (=> b!212939 m!240919))

(declare-fun m!240921 () Bool)

(assert (=> b!212942 m!240921))

(declare-fun m!240923 () Bool)

(assert (=> b!212938 m!240923))

(check-sat (not start!21150) (not b!212930) (not b!212942) (not b!212934) tp_is_empty!5479 (not b_next!5617) (not b!212938) (not mapNonEmpty!9314) (not b!212939) b_and!12485 (not b!212937) (not b!212932))
(check-sat b_and!12485 (not b_next!5617))
(get-model)

(declare-fun b!213031 () Bool)

(declare-fun e!138570 () Bool)

(declare-fun e!138569 () Bool)

(assert (=> b!213031 (= e!138570 e!138569)))

(declare-fun res!104222 () Bool)

(assert (=> b!213031 (=> (not res!104222) (not e!138569))))

(declare-fun e!138571 () Bool)

(assert (=> b!213031 (= res!104222 (not e!138571))))

(declare-fun res!104221 () Bool)

(assert (=> b!213031 (=> (not res!104221) (not e!138571))))

(assert (=> b!213031 (= res!104221 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213032 () Bool)

(declare-fun e!138568 () Bool)

(assert (=> b!213032 (= e!138569 e!138568)))

(declare-fun c!35892 () Bool)

(assert (=> b!213032 (= c!35892 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213033 () Bool)

(declare-fun contains!1399 (List!3036 (_ BitVec 64)) Bool)

(assert (=> b!213033 (= e!138571 (contains!1399 Nil!3033 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58243 () Bool)

(declare-fun res!104220 () Bool)

(assert (=> d!58243 (=> res!104220 e!138570)))

(assert (=> d!58243 (= res!104220 (bvsge #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> d!58243 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3033) e!138570)))

(declare-fun b!213034 () Bool)

(declare-fun call!20163 () Bool)

(assert (=> b!213034 (= e!138568 call!20163)))

(declare-fun b!213035 () Bool)

(assert (=> b!213035 (= e!138568 call!20163)))

(declare-fun bm!20160 () Bool)

(assert (=> bm!20160 (= call!20163 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35892 (Cons!3032 (select (arr!4822 _keys!825) #b00000000000000000000000000000000) Nil!3033) Nil!3033)))))

(assert (= (and d!58243 (not res!104220)) b!213031))

(assert (= (and b!213031 res!104221) b!213033))

(assert (= (and b!213031 res!104222) b!213032))

(assert (= (and b!213032 c!35892) b!213035))

(assert (= (and b!213032 (not c!35892)) b!213034))

(assert (= (or b!213035 b!213034) bm!20160))

(declare-fun m!240997 () Bool)

(assert (=> b!213031 m!240997))

(assert (=> b!213031 m!240997))

(declare-fun m!240999 () Bool)

(assert (=> b!213031 m!240999))

(assert (=> b!213032 m!240997))

(assert (=> b!213032 m!240997))

(assert (=> b!213032 m!240999))

(assert (=> b!213033 m!240997))

(assert (=> b!213033 m!240997))

(declare-fun m!241001 () Bool)

(assert (=> b!213033 m!241001))

(assert (=> bm!20160 m!240997))

(declare-fun m!241003 () Bool)

(assert (=> bm!20160 m!241003))

(assert (=> b!212939 d!58243))

(declare-fun bm!20163 () Bool)

(declare-fun call!20166 () Bool)

(assert (=> bm!20163 (= call!20166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!213044 () Bool)

(declare-fun e!138579 () Bool)

(assert (=> b!213044 (= e!138579 call!20166)))

(declare-fun b!213045 () Bool)

(declare-fun e!138580 () Bool)

(declare-fun e!138578 () Bool)

(assert (=> b!213045 (= e!138580 e!138578)))

(declare-fun c!35895 () Bool)

(assert (=> b!213045 (= c!35895 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213046 () Bool)

(assert (=> b!213046 (= e!138578 call!20166)))

(declare-fun d!58245 () Bool)

(declare-fun res!104228 () Bool)

(assert (=> d!58245 (=> res!104228 e!138580)))

(assert (=> d!58245 (= res!104228 (bvsge #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> d!58245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138580)))

(declare-fun b!213047 () Bool)

(assert (=> b!213047 (= e!138578 e!138579)))

(declare-fun lt!109955 () (_ BitVec 64))

(assert (=> b!213047 (= lt!109955 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109957 () Unit!6446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10161 (_ BitVec 64) (_ BitVec 32)) Unit!6446)

(assert (=> b!213047 (= lt!109957 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109955 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!213047 (arrayContainsKey!0 _keys!825 lt!109955 #b00000000000000000000000000000000)))

(declare-fun lt!109956 () Unit!6446)

(assert (=> b!213047 (= lt!109956 lt!109957)))

(declare-fun res!104227 () Bool)

(declare-datatypes ((SeekEntryResult!702 0))(
  ( (MissingZero!702 (index!4978 (_ BitVec 32))) (Found!702 (index!4979 (_ BitVec 32))) (Intermediate!702 (undefined!1514 Bool) (index!4980 (_ BitVec 32)) (x!22199 (_ BitVec 32))) (Undefined!702) (MissingVacant!702 (index!4981 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10161 (_ BitVec 32)) SeekEntryResult!702)

(assert (=> b!213047 (= res!104227 (= (seekEntryOrOpen!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!702 #b00000000000000000000000000000000)))))

(assert (=> b!213047 (=> (not res!104227) (not e!138579))))

(assert (= (and d!58245 (not res!104228)) b!213045))

(assert (= (and b!213045 c!35895) b!213047))

(assert (= (and b!213045 (not c!35895)) b!213046))

(assert (= (and b!213047 res!104227) b!213044))

(assert (= (or b!213044 b!213046) bm!20163))

(declare-fun m!241005 () Bool)

(assert (=> bm!20163 m!241005))

(assert (=> b!213045 m!240997))

(assert (=> b!213045 m!240997))

(assert (=> b!213045 m!240999))

(assert (=> b!213047 m!240997))

(declare-fun m!241007 () Bool)

(assert (=> b!213047 m!241007))

(declare-fun m!241009 () Bool)

(assert (=> b!213047 m!241009))

(assert (=> b!213047 m!240997))

(declare-fun m!241011 () Bool)

(assert (=> b!213047 m!241011))

(assert (=> b!212934 d!58245))

(declare-fun d!58247 () Bool)

(declare-fun e!138583 () Bool)

(assert (=> d!58247 e!138583))

(declare-fun res!104233 () Bool)

(assert (=> d!58247 (=> (not res!104233) (not e!138583))))

(declare-fun lt!109969 () ListLongMap!3067)

(declare-fun contains!1400 (ListLongMap!3067 (_ BitVec 64)) Bool)

(assert (=> d!58247 (= res!104233 (contains!1400 lt!109969 (_1!2087 lt!109898)))))

(declare-fun lt!109966 () List!3035)

(assert (=> d!58247 (= lt!109969 (ListLongMap!3068 lt!109966))))

(declare-fun lt!109967 () Unit!6446)

(declare-fun lt!109968 () Unit!6446)

(assert (=> d!58247 (= lt!109967 lt!109968)))

(declare-datatypes ((Option!263 0))(
  ( (Some!262 (v!4797 V!6953)) (None!261) )
))
(declare-fun getValueByKey!257 (List!3035 (_ BitVec 64)) Option!263)

(assert (=> d!58247 (= (getValueByKey!257 lt!109966 (_1!2087 lt!109898)) (Some!262 (_2!2087 lt!109898)))))

(declare-fun lemmaContainsTupThenGetReturnValue!144 (List!3035 (_ BitVec 64) V!6953) Unit!6446)

(assert (=> d!58247 (= lt!109968 (lemmaContainsTupThenGetReturnValue!144 lt!109966 (_1!2087 lt!109898) (_2!2087 lt!109898)))))

(declare-fun insertStrictlySorted!147 (List!3035 (_ BitVec 64) V!6953) List!3035)

(assert (=> d!58247 (= lt!109966 (insertStrictlySorted!147 (toList!1549 lt!109896) (_1!2087 lt!109898) (_2!2087 lt!109898)))))

(assert (=> d!58247 (= (+!578 lt!109896 lt!109898) lt!109969)))

(declare-fun b!213052 () Bool)

(declare-fun res!104234 () Bool)

(assert (=> b!213052 (=> (not res!104234) (not e!138583))))

(assert (=> b!213052 (= res!104234 (= (getValueByKey!257 (toList!1549 lt!109969) (_1!2087 lt!109898)) (Some!262 (_2!2087 lt!109898))))))

(declare-fun b!213053 () Bool)

(declare-fun contains!1401 (List!3035 tuple2!4152) Bool)

(assert (=> b!213053 (= e!138583 (contains!1401 (toList!1549 lt!109969) lt!109898))))

(assert (= (and d!58247 res!104233) b!213052))

(assert (= (and b!213052 res!104234) b!213053))

(declare-fun m!241013 () Bool)

(assert (=> d!58247 m!241013))

(declare-fun m!241015 () Bool)

(assert (=> d!58247 m!241015))

(declare-fun m!241017 () Bool)

(assert (=> d!58247 m!241017))

(declare-fun m!241019 () Bool)

(assert (=> d!58247 m!241019))

(declare-fun m!241021 () Bool)

(assert (=> b!213052 m!241021))

(declare-fun m!241023 () Bool)

(assert (=> b!213053 m!241023))

(assert (=> b!212930 d!58247))

(declare-fun d!58249 () Bool)

(assert (=> d!58249 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21150 d!58249))

(declare-fun d!58251 () Bool)

(assert (=> d!58251 (= (array_inv!3163 _values!649) (bvsge (size!5148 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21150 d!58251))

(declare-fun d!58253 () Bool)

(assert (=> d!58253 (= (array_inv!3164 _keys!825) (bvsge (size!5147 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21150 d!58253))

(declare-fun d!58255 () Bool)

(declare-fun e!138584 () Bool)

(assert (=> d!58255 e!138584))

(declare-fun res!104235 () Bool)

(assert (=> d!58255 (=> (not res!104235) (not e!138584))))

(declare-fun lt!109973 () ListLongMap!3067)

(assert (=> d!58255 (= res!104235 (contains!1400 lt!109973 (_1!2087 lt!109898)))))

(declare-fun lt!109970 () List!3035)

(assert (=> d!58255 (= lt!109973 (ListLongMap!3068 lt!109970))))

(declare-fun lt!109971 () Unit!6446)

(declare-fun lt!109972 () Unit!6446)

(assert (=> d!58255 (= lt!109971 lt!109972)))

(assert (=> d!58255 (= (getValueByKey!257 lt!109970 (_1!2087 lt!109898)) (Some!262 (_2!2087 lt!109898)))))

(assert (=> d!58255 (= lt!109972 (lemmaContainsTupThenGetReturnValue!144 lt!109970 (_1!2087 lt!109898) (_2!2087 lt!109898)))))

(assert (=> d!58255 (= lt!109970 (insertStrictlySorted!147 (toList!1549 lt!109897) (_1!2087 lt!109898) (_2!2087 lt!109898)))))

(assert (=> d!58255 (= (+!578 lt!109897 lt!109898) lt!109973)))

(declare-fun b!213054 () Bool)

(declare-fun res!104236 () Bool)

(assert (=> b!213054 (=> (not res!104236) (not e!138584))))

(assert (=> b!213054 (= res!104236 (= (getValueByKey!257 (toList!1549 lt!109973) (_1!2087 lt!109898)) (Some!262 (_2!2087 lt!109898))))))

(declare-fun b!213055 () Bool)

(assert (=> b!213055 (= e!138584 (contains!1401 (toList!1549 lt!109973) lt!109898))))

(assert (= (and d!58255 res!104235) b!213054))

(assert (= (and b!213054 res!104236) b!213055))

(declare-fun m!241025 () Bool)

(assert (=> d!58255 m!241025))

(declare-fun m!241027 () Bool)

(assert (=> d!58255 m!241027))

(declare-fun m!241029 () Bool)

(assert (=> d!58255 m!241029))

(declare-fun m!241031 () Bool)

(assert (=> d!58255 m!241031))

(declare-fun m!241033 () Bool)

(assert (=> b!213054 m!241033))

(declare-fun m!241035 () Bool)

(assert (=> b!213055 m!241035))

(assert (=> b!212942 d!58255))

(declare-fun d!58257 () Bool)

(assert (=> d!58257 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212938 d!58257))

(declare-fun b!213098 () Bool)

(declare-fun e!138611 () Bool)

(assert (=> b!213098 (= e!138611 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213099 () Bool)

(declare-fun e!138613 () ListLongMap!3067)

(declare-fun call!20184 () ListLongMap!3067)

(assert (=> b!213099 (= e!138613 call!20184)))

(declare-fun b!213100 () Bool)

(declare-fun e!138614 () Bool)

(declare-fun e!138620 () Bool)

(assert (=> b!213100 (= e!138614 e!138620)))

(declare-fun res!104261 () Bool)

(assert (=> b!213100 (=> (not res!104261) (not e!138620))))

(declare-fun lt!110022 () ListLongMap!3067)

(assert (=> b!213100 (= res!104261 (contains!1400 lt!110022 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213101 () Bool)

(declare-fun e!138621 () Bool)

(declare-fun apply!198 (ListLongMap!3067 (_ BitVec 64)) V!6953)

(assert (=> b!213101 (= e!138621 (= (apply!198 lt!110022 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213102 () Bool)

(declare-fun e!138618 () Bool)

(assert (=> b!213102 (= e!138618 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20178 () Bool)

(declare-fun call!20186 () Bool)

(assert (=> bm!20178 (= call!20186 (contains!1400 lt!110022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213103 () Bool)

(declare-fun e!138617 () Bool)

(assert (=> b!213103 (= e!138617 (= (apply!198 lt!110022 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20179 () Bool)

(declare-fun call!20181 () Bool)

(assert (=> bm!20179 (= call!20181 (contains!1400 lt!110022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20180 () Bool)

(declare-fun call!20183 () ListLongMap!3067)

(assert (=> bm!20180 (= call!20184 call!20183)))

(declare-fun b!213104 () Bool)

(declare-fun e!138623 () Unit!6446)

(declare-fun Unit!6450 () Unit!6446)

(assert (=> b!213104 (= e!138623 Unit!6450)))

(declare-fun b!213105 () Bool)

(declare-fun e!138619 () ListLongMap!3067)

(declare-fun call!20182 () ListLongMap!3067)

(assert (=> b!213105 (= e!138619 call!20182)))

(declare-fun b!213106 () Bool)

(declare-fun e!138615 () Bool)

(declare-fun e!138622 () Bool)

(assert (=> b!213106 (= e!138615 e!138622)))

(declare-fun c!35910 () Bool)

(assert (=> b!213106 (= c!35910 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213107 () Bool)

(assert (=> b!213107 (= e!138622 (not call!20186))))

(declare-fun b!213108 () Bool)

(declare-fun get!2586 (ValueCell!2396 V!6953) V!6953)

(declare-fun dynLambda!541 (Int (_ BitVec 64)) V!6953)

(assert (=> b!213108 (= e!138620 (= (apply!198 lt!110022 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4823 lt!109899) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5148 lt!109899)))))

(assert (=> b!213108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213109 () Bool)

(assert (=> b!213109 (= e!138622 e!138621)))

(declare-fun res!104262 () Bool)

(assert (=> b!213109 (= res!104262 call!20186)))

(assert (=> b!213109 (=> (not res!104262) (not e!138621))))

(declare-fun b!213110 () Bool)

(declare-fun e!138612 () Bool)

(assert (=> b!213110 (= e!138612 e!138617)))

(declare-fun res!104259 () Bool)

(assert (=> b!213110 (= res!104259 call!20181)))

(assert (=> b!213110 (=> (not res!104259) (not e!138617))))

(declare-fun bm!20181 () Bool)

(declare-fun c!35909 () Bool)

(declare-fun call!20187 () ListLongMap!3067)

(declare-fun c!35913 () Bool)

(declare-fun call!20185 () ListLongMap!3067)

(assert (=> bm!20181 (= call!20183 (+!578 (ite c!35909 call!20187 (ite c!35913 call!20185 call!20182)) (ite (or c!35909 c!35913) (tuple2!4153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20182 () Bool)

(assert (=> bm!20182 (= call!20182 call!20185)))

(declare-fun b!213111 () Bool)

(declare-fun res!104257 () Bool)

(assert (=> b!213111 (=> (not res!104257) (not e!138615))))

(assert (=> b!213111 (= res!104257 e!138612)))

(declare-fun c!35908 () Bool)

(assert (=> b!213111 (= c!35908 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213112 () Bool)

(assert (=> b!213112 (= e!138612 (not call!20181))))

(declare-fun bm!20183 () Bool)

(assert (=> bm!20183 (= call!20187 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213113 () Bool)

(assert (=> b!213113 (= e!138619 call!20184)))

(declare-fun b!213114 () Bool)

(declare-fun res!104256 () Bool)

(assert (=> b!213114 (=> (not res!104256) (not e!138615))))

(assert (=> b!213114 (= res!104256 e!138614)))

(declare-fun res!104258 () Bool)

(assert (=> b!213114 (=> res!104258 e!138614)))

(assert (=> b!213114 (= res!104258 (not e!138611))))

(declare-fun res!104260 () Bool)

(assert (=> b!213114 (=> (not res!104260) (not e!138611))))

(assert (=> b!213114 (= res!104260 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213115 () Bool)

(declare-fun c!35912 () Bool)

(assert (=> b!213115 (= c!35912 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213115 (= e!138613 e!138619)))

(declare-fun bm!20184 () Bool)

(assert (=> bm!20184 (= call!20185 call!20187)))

(declare-fun b!213116 () Bool)

(declare-fun e!138616 () ListLongMap!3067)

(assert (=> b!213116 (= e!138616 (+!578 call!20183 (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213117 () Bool)

(declare-fun lt!110024 () Unit!6446)

(assert (=> b!213117 (= e!138623 lt!110024)))

(declare-fun lt!110031 () ListLongMap!3067)

(assert (=> b!213117 (= lt!110031 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110028 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110025 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110025 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110036 () Unit!6446)

(declare-fun addStillContains!174 (ListLongMap!3067 (_ BitVec 64) V!6953 (_ BitVec 64)) Unit!6446)

(assert (=> b!213117 (= lt!110036 (addStillContains!174 lt!110031 lt!110028 zeroValue!615 lt!110025))))

(assert (=> b!213117 (contains!1400 (+!578 lt!110031 (tuple2!4153 lt!110028 zeroValue!615)) lt!110025)))

(declare-fun lt!110030 () Unit!6446)

(assert (=> b!213117 (= lt!110030 lt!110036)))

(declare-fun lt!110023 () ListLongMap!3067)

(assert (=> b!213117 (= lt!110023 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110032 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110032 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110033 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110033 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110021 () Unit!6446)

(declare-fun addApplyDifferent!174 (ListLongMap!3067 (_ BitVec 64) V!6953 (_ BitVec 64)) Unit!6446)

(assert (=> b!213117 (= lt!110021 (addApplyDifferent!174 lt!110023 lt!110032 minValue!615 lt!110033))))

(assert (=> b!213117 (= (apply!198 (+!578 lt!110023 (tuple2!4153 lt!110032 minValue!615)) lt!110033) (apply!198 lt!110023 lt!110033))))

(declare-fun lt!110018 () Unit!6446)

(assert (=> b!213117 (= lt!110018 lt!110021)))

(declare-fun lt!110037 () ListLongMap!3067)

(assert (=> b!213117 (= lt!110037 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110038 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110026 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110026 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110034 () Unit!6446)

(assert (=> b!213117 (= lt!110034 (addApplyDifferent!174 lt!110037 lt!110038 zeroValue!615 lt!110026))))

(assert (=> b!213117 (= (apply!198 (+!578 lt!110037 (tuple2!4153 lt!110038 zeroValue!615)) lt!110026) (apply!198 lt!110037 lt!110026))))

(declare-fun lt!110039 () Unit!6446)

(assert (=> b!213117 (= lt!110039 lt!110034)))

(declare-fun lt!110020 () ListLongMap!3067)

(assert (=> b!213117 (= lt!110020 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110019 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110019 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110029 () (_ BitVec 64))

(assert (=> b!213117 (= lt!110029 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213117 (= lt!110024 (addApplyDifferent!174 lt!110020 lt!110019 minValue!615 lt!110029))))

(assert (=> b!213117 (= (apply!198 (+!578 lt!110020 (tuple2!4153 lt!110019 minValue!615)) lt!110029) (apply!198 lt!110020 lt!110029))))

(declare-fun b!213118 () Bool)

(assert (=> b!213118 (= e!138616 e!138613)))

(assert (=> b!213118 (= c!35913 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!58259 () Bool)

(assert (=> d!58259 e!138615))

(declare-fun res!104255 () Bool)

(assert (=> d!58259 (=> (not res!104255) (not e!138615))))

(assert (=> d!58259 (= res!104255 (or (bvsge #b00000000000000000000000000000000 (size!5147 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))))

(declare-fun lt!110027 () ListLongMap!3067)

(assert (=> d!58259 (= lt!110022 lt!110027)))

(declare-fun lt!110035 () Unit!6446)

(assert (=> d!58259 (= lt!110035 e!138623)))

(declare-fun c!35911 () Bool)

(assert (=> d!58259 (= c!35911 e!138618)))

(declare-fun res!104263 () Bool)

(assert (=> d!58259 (=> (not res!104263) (not e!138618))))

(assert (=> d!58259 (= res!104263 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> d!58259 (= lt!110027 e!138616)))

(assert (=> d!58259 (= c!35909 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58259 (validMask!0 mask!1149)))

(assert (=> d!58259 (= (getCurrentListMap!1085 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110022)))

(assert (= (and d!58259 c!35909) b!213116))

(assert (= (and d!58259 (not c!35909)) b!213118))

(assert (= (and b!213118 c!35913) b!213099))

(assert (= (and b!213118 (not c!35913)) b!213115))

(assert (= (and b!213115 c!35912) b!213113))

(assert (= (and b!213115 (not c!35912)) b!213105))

(assert (= (or b!213113 b!213105) bm!20182))

(assert (= (or b!213099 bm!20182) bm!20184))

(assert (= (or b!213099 b!213113) bm!20180))

(assert (= (or b!213116 bm!20184) bm!20183))

(assert (= (or b!213116 bm!20180) bm!20181))

(assert (= (and d!58259 res!104263) b!213102))

(assert (= (and d!58259 c!35911) b!213117))

(assert (= (and d!58259 (not c!35911)) b!213104))

(assert (= (and d!58259 res!104255) b!213114))

(assert (= (and b!213114 res!104260) b!213098))

(assert (= (and b!213114 (not res!104258)) b!213100))

(assert (= (and b!213100 res!104261) b!213108))

(assert (= (and b!213114 res!104256) b!213111))

(assert (= (and b!213111 c!35908) b!213110))

(assert (= (and b!213111 (not c!35908)) b!213112))

(assert (= (and b!213110 res!104259) b!213103))

(assert (= (or b!213110 b!213112) bm!20179))

(assert (= (and b!213111 res!104257) b!213106))

(assert (= (and b!213106 c!35910) b!213109))

(assert (= (and b!213106 (not c!35910)) b!213107))

(assert (= (and b!213109 res!104262) b!213101))

(assert (= (or b!213109 b!213107) bm!20178))

(declare-fun b_lambda!7777 () Bool)

(assert (=> (not b_lambda!7777) (not b!213108)))

(declare-fun t!7983 () Bool)

(declare-fun tb!2901 () Bool)

(assert (=> (and start!21150 (= defaultEntry!657 defaultEntry!657) t!7983) tb!2901))

(declare-fun result!5007 () Bool)

(assert (=> tb!2901 (= result!5007 tp_is_empty!5479)))

(assert (=> b!213108 t!7983))

(declare-fun b_and!12491 () Bool)

(assert (= b_and!12485 (and (=> t!7983 result!5007) b_and!12491)))

(declare-fun m!241037 () Bool)

(assert (=> b!213108 m!241037))

(declare-fun m!241039 () Bool)

(assert (=> b!213108 m!241039))

(assert (=> b!213108 m!241037))

(declare-fun m!241041 () Bool)

(assert (=> b!213108 m!241041))

(assert (=> b!213108 m!240997))

(declare-fun m!241043 () Bool)

(assert (=> b!213108 m!241043))

(assert (=> b!213108 m!240997))

(assert (=> b!213108 m!241039))

(declare-fun m!241045 () Bool)

(assert (=> bm!20179 m!241045))

(assert (=> b!213100 m!240997))

(assert (=> b!213100 m!240997))

(declare-fun m!241047 () Bool)

(assert (=> b!213100 m!241047))

(declare-fun m!241049 () Bool)

(assert (=> b!213117 m!241049))

(declare-fun m!241051 () Bool)

(assert (=> b!213117 m!241051))

(declare-fun m!241053 () Bool)

(assert (=> b!213117 m!241053))

(assert (=> b!213117 m!240997))

(declare-fun m!241055 () Bool)

(assert (=> b!213117 m!241055))

(declare-fun m!241057 () Bool)

(assert (=> b!213117 m!241057))

(declare-fun m!241059 () Bool)

(assert (=> b!213117 m!241059))

(declare-fun m!241061 () Bool)

(assert (=> b!213117 m!241061))

(assert (=> b!213117 m!241055))

(declare-fun m!241063 () Bool)

(assert (=> b!213117 m!241063))

(declare-fun m!241065 () Bool)

(assert (=> b!213117 m!241065))

(assert (=> b!213117 m!241051))

(assert (=> b!213117 m!240899))

(declare-fun m!241067 () Bool)

(assert (=> b!213117 m!241067))

(declare-fun m!241069 () Bool)

(assert (=> b!213117 m!241069))

(declare-fun m!241071 () Bool)

(assert (=> b!213117 m!241071))

(assert (=> b!213117 m!241063))

(declare-fun m!241073 () Bool)

(assert (=> b!213117 m!241073))

(declare-fun m!241075 () Bool)

(assert (=> b!213117 m!241075))

(assert (=> b!213117 m!241071))

(declare-fun m!241077 () Bool)

(assert (=> b!213117 m!241077))

(declare-fun m!241079 () Bool)

(assert (=> b!213103 m!241079))

(assert (=> b!213102 m!240997))

(assert (=> b!213102 m!240997))

(assert (=> b!213102 m!240999))

(assert (=> bm!20183 m!240899))

(declare-fun m!241081 () Bool)

(assert (=> b!213116 m!241081))

(declare-fun m!241083 () Bool)

(assert (=> bm!20178 m!241083))

(declare-fun m!241085 () Bool)

(assert (=> b!213101 m!241085))

(assert (=> d!58259 m!240889))

(assert (=> b!213098 m!240997))

(assert (=> b!213098 m!240997))

(assert (=> b!213098 m!240999))

(declare-fun m!241087 () Bool)

(assert (=> bm!20181 m!241087))

(assert (=> b!212937 d!58259))

(declare-fun b!213145 () Bool)

(declare-fun res!104274 () Bool)

(declare-fun e!138639 () Bool)

(assert (=> b!213145 (=> (not res!104274) (not e!138639))))

(declare-fun lt!110060 () ListLongMap!3067)

(assert (=> b!213145 (= res!104274 (not (contains!1400 lt!110060 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213146 () Bool)

(declare-fun e!138644 () Bool)

(declare-fun isEmpty!505 (ListLongMap!3067) Bool)

(assert (=> b!213146 (= e!138644 (isEmpty!505 lt!110060))))

(declare-fun b!213147 () Bool)

(declare-fun e!138641 () ListLongMap!3067)

(declare-fun e!138640 () ListLongMap!3067)

(assert (=> b!213147 (= e!138641 e!138640)))

(declare-fun c!35924 () Bool)

(assert (=> b!213147 (= c!35924 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213148 () Bool)

(declare-fun e!138643 () Bool)

(declare-fun e!138642 () Bool)

(assert (=> b!213148 (= e!138643 e!138642)))

(assert (=> b!213148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun res!104272 () Bool)

(assert (=> b!213148 (= res!104272 (contains!1400 lt!110060 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213148 (=> (not res!104272) (not e!138642))))

(declare-fun d!58261 () Bool)

(assert (=> d!58261 e!138639))

(declare-fun res!104275 () Bool)

(assert (=> d!58261 (=> (not res!104275) (not e!138639))))

(assert (=> d!58261 (= res!104275 (not (contains!1400 lt!110060 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58261 (= lt!110060 e!138641)))

(declare-fun c!35922 () Bool)

(assert (=> d!58261 (= c!35922 (bvsge #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> d!58261 (validMask!0 mask!1149)))

(assert (=> d!58261 (= (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110060)))

(declare-fun b!213149 () Bool)

(declare-fun call!20190 () ListLongMap!3067)

(assert (=> b!213149 (= e!138640 call!20190)))

(declare-fun b!213150 () Bool)

(declare-fun lt!110058 () Unit!6446)

(declare-fun lt!110054 () Unit!6446)

(assert (=> b!213150 (= lt!110058 lt!110054)))

(declare-fun lt!110057 () (_ BitVec 64))

(declare-fun lt!110056 () ListLongMap!3067)

(declare-fun lt!110059 () (_ BitVec 64))

(declare-fun lt!110055 () V!6953)

(assert (=> b!213150 (not (contains!1400 (+!578 lt!110056 (tuple2!4153 lt!110057 lt!110055)) lt!110059))))

(declare-fun addStillNotContains!109 (ListLongMap!3067 (_ BitVec 64) V!6953 (_ BitVec 64)) Unit!6446)

(assert (=> b!213150 (= lt!110054 (addStillNotContains!109 lt!110056 lt!110057 lt!110055 lt!110059))))

(assert (=> b!213150 (= lt!110059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213150 (= lt!110055 (get!2586 (select (arr!4823 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213150 (= lt!110057 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213150 (= lt!110056 call!20190)))

(assert (=> b!213150 (= e!138640 (+!578 call!20190 (tuple2!4153 (select (arr!4822 _keys!825) #b00000000000000000000000000000000) (get!2586 (select (arr!4823 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213151 () Bool)

(assert (=> b!213151 (= e!138641 (ListLongMap!3068 Nil!3032))))

(declare-fun b!213152 () Bool)

(assert (=> b!213152 (= e!138639 e!138643)))

(declare-fun c!35923 () Bool)

(declare-fun e!138638 () Bool)

(assert (=> b!213152 (= c!35923 e!138638)))

(declare-fun res!104273 () Bool)

(assert (=> b!213152 (=> (not res!104273) (not e!138638))))

(assert (=> b!213152 (= res!104273 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213153 () Bool)

(assert (=> b!213153 (= e!138644 (= lt!110060 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213154 () Bool)

(assert (=> b!213154 (= e!138643 e!138644)))

(declare-fun c!35925 () Bool)

(assert (=> b!213154 (= c!35925 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213155 () Bool)

(assert (=> b!213155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> b!213155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5148 _values!649)))))

(assert (=> b!213155 (= e!138642 (= (apply!198 lt!110060 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4823 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20187 () Bool)

(assert (=> bm!20187 (= call!20190 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213156 () Bool)

(assert (=> b!213156 (= e!138638 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213156 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58261 c!35922) b!213151))

(assert (= (and d!58261 (not c!35922)) b!213147))

(assert (= (and b!213147 c!35924) b!213150))

(assert (= (and b!213147 (not c!35924)) b!213149))

(assert (= (or b!213150 b!213149) bm!20187))

(assert (= (and d!58261 res!104275) b!213145))

(assert (= (and b!213145 res!104274) b!213152))

(assert (= (and b!213152 res!104273) b!213156))

(assert (= (and b!213152 c!35923) b!213148))

(assert (= (and b!213152 (not c!35923)) b!213154))

(assert (= (and b!213148 res!104272) b!213155))

(assert (= (and b!213154 c!35925) b!213153))

(assert (= (and b!213154 (not c!35925)) b!213146))

(declare-fun b_lambda!7779 () Bool)

(assert (=> (not b_lambda!7779) (not b!213150)))

(assert (=> b!213150 t!7983))

(declare-fun b_and!12493 () Bool)

(assert (= b_and!12491 (and (=> t!7983 result!5007) b_and!12493)))

(declare-fun b_lambda!7781 () Bool)

(assert (=> (not b_lambda!7781) (not b!213155)))

(assert (=> b!213155 t!7983))

(declare-fun b_and!12495 () Bool)

(assert (= b_and!12493 (and (=> t!7983 result!5007) b_and!12495)))

(declare-fun m!241089 () Bool)

(assert (=> b!213153 m!241089))

(assert (=> b!213147 m!240997))

(assert (=> b!213147 m!240997))

(assert (=> b!213147 m!240999))

(assert (=> bm!20187 m!241089))

(assert (=> b!213156 m!240997))

(assert (=> b!213156 m!240997))

(assert (=> b!213156 m!240999))

(declare-fun m!241091 () Bool)

(assert (=> b!213146 m!241091))

(declare-fun m!241093 () Bool)

(assert (=> b!213145 m!241093))

(declare-fun m!241095 () Bool)

(assert (=> d!58261 m!241095))

(assert (=> d!58261 m!240889))

(declare-fun m!241097 () Bool)

(assert (=> b!213155 m!241097))

(assert (=> b!213155 m!241097))

(assert (=> b!213155 m!241037))

(declare-fun m!241099 () Bool)

(assert (=> b!213155 m!241099))

(assert (=> b!213155 m!240997))

(declare-fun m!241101 () Bool)

(assert (=> b!213155 m!241101))

(assert (=> b!213155 m!240997))

(assert (=> b!213155 m!241037))

(declare-fun m!241103 () Bool)

(assert (=> b!213150 m!241103))

(assert (=> b!213150 m!241097))

(assert (=> b!213150 m!241097))

(assert (=> b!213150 m!241037))

(assert (=> b!213150 m!241099))

(declare-fun m!241105 () Bool)

(assert (=> b!213150 m!241105))

(declare-fun m!241107 () Bool)

(assert (=> b!213150 m!241107))

(assert (=> b!213150 m!241037))

(assert (=> b!213150 m!241103))

(declare-fun m!241109 () Bool)

(assert (=> b!213150 m!241109))

(assert (=> b!213150 m!240997))

(assert (=> b!213148 m!240997))

(assert (=> b!213148 m!240997))

(declare-fun m!241111 () Bool)

(assert (=> b!213148 m!241111))

(assert (=> b!212937 d!58261))

(declare-fun b!213163 () Bool)

(declare-fun e!138650 () Bool)

(declare-fun call!20195 () ListLongMap!3067)

(declare-fun call!20196 () ListLongMap!3067)

(assert (=> b!213163 (= e!138650 (= call!20195 call!20196))))

(declare-fun b!213164 () Bool)

(declare-fun e!138649 () Bool)

(assert (=> b!213164 (= e!138649 e!138650)))

(declare-fun c!35928 () Bool)

(assert (=> b!213164 (= c!35928 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!213165 () Bool)

(assert (=> b!213165 (= e!138650 (= call!20195 (+!578 call!20196 (tuple2!4153 k0!843 v!520))))))

(declare-fun bm!20192 () Bool)

(assert (=> bm!20192 (= call!20195 (getCurrentListMapNoExtraKeys!508 _keys!825 (array!10164 (store (arr!4823 _values!649) i!601 (ValueCellFull!2396 v!520)) (size!5148 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58263 () Bool)

(assert (=> d!58263 e!138649))

(declare-fun res!104278 () Bool)

(assert (=> d!58263 (=> (not res!104278) (not e!138649))))

(assert (=> d!58263 (= res!104278 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5148 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5148 _values!649))))))))

(declare-fun lt!110063 () Unit!6446)

(declare-fun choose!1089 (array!10161 array!10163 (_ BitVec 32) (_ BitVec 32) V!6953 V!6953 (_ BitVec 32) (_ BitVec 64) V!6953 (_ BitVec 32) Int) Unit!6446)

(assert (=> d!58263 (= lt!110063 (choose!1089 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> d!58263 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110063)))

(declare-fun bm!20193 () Bool)

(assert (=> bm!20193 (= call!20196 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58263 res!104278) b!213164))

(assert (= (and b!213164 c!35928) b!213165))

(assert (= (and b!213164 (not c!35928)) b!213163))

(assert (= (or b!213165 b!213163) bm!20192))

(assert (= (or b!213165 b!213163) bm!20193))

(declare-fun m!241113 () Bool)

(assert (=> b!213165 m!241113))

(assert (=> bm!20192 m!240903))

(declare-fun m!241115 () Bool)

(assert (=> bm!20192 m!241115))

(declare-fun m!241117 () Bool)

(assert (=> d!58263 m!241117))

(assert (=> bm!20193 m!240911))

(assert (=> b!212937 d!58263))

(declare-fun b!213166 () Bool)

(declare-fun e!138651 () Bool)

(assert (=> b!213166 (= e!138651 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213167 () Bool)

(declare-fun e!138653 () ListLongMap!3067)

(declare-fun call!20200 () ListLongMap!3067)

(assert (=> b!213167 (= e!138653 call!20200)))

(declare-fun b!213168 () Bool)

(declare-fun e!138654 () Bool)

(declare-fun e!138660 () Bool)

(assert (=> b!213168 (= e!138654 e!138660)))

(declare-fun res!104285 () Bool)

(assert (=> b!213168 (=> (not res!104285) (not e!138660))))

(declare-fun lt!110068 () ListLongMap!3067)

(assert (=> b!213168 (= res!104285 (contains!1400 lt!110068 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213169 () Bool)

(declare-fun e!138661 () Bool)

(assert (=> b!213169 (= e!138661 (= (apply!198 lt!110068 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213170 () Bool)

(declare-fun e!138658 () Bool)

(assert (=> b!213170 (= e!138658 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20194 () Bool)

(declare-fun call!20202 () Bool)

(assert (=> bm!20194 (= call!20202 (contains!1400 lt!110068 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213171 () Bool)

(declare-fun e!138657 () Bool)

(assert (=> b!213171 (= e!138657 (= (apply!198 lt!110068 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20195 () Bool)

(declare-fun call!20197 () Bool)

(assert (=> bm!20195 (= call!20197 (contains!1400 lt!110068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20196 () Bool)

(declare-fun call!20199 () ListLongMap!3067)

(assert (=> bm!20196 (= call!20200 call!20199)))

(declare-fun b!213172 () Bool)

(declare-fun e!138663 () Unit!6446)

(declare-fun Unit!6451 () Unit!6446)

(assert (=> b!213172 (= e!138663 Unit!6451)))

(declare-fun b!213173 () Bool)

(declare-fun e!138659 () ListLongMap!3067)

(declare-fun call!20198 () ListLongMap!3067)

(assert (=> b!213173 (= e!138659 call!20198)))

(declare-fun b!213174 () Bool)

(declare-fun e!138655 () Bool)

(declare-fun e!138662 () Bool)

(assert (=> b!213174 (= e!138655 e!138662)))

(declare-fun c!35931 () Bool)

(assert (=> b!213174 (= c!35931 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213175 () Bool)

(assert (=> b!213175 (= e!138662 (not call!20202))))

(declare-fun b!213176 () Bool)

(assert (=> b!213176 (= e!138660 (= (apply!198 lt!110068 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4823 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5148 _values!649)))))

(assert (=> b!213176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213177 () Bool)

(assert (=> b!213177 (= e!138662 e!138661)))

(declare-fun res!104286 () Bool)

(assert (=> b!213177 (= res!104286 call!20202)))

(assert (=> b!213177 (=> (not res!104286) (not e!138661))))

(declare-fun b!213178 () Bool)

(declare-fun e!138652 () Bool)

(assert (=> b!213178 (= e!138652 e!138657)))

(declare-fun res!104283 () Bool)

(assert (=> b!213178 (= res!104283 call!20197)))

(assert (=> b!213178 (=> (not res!104283) (not e!138657))))

(declare-fun c!35930 () Bool)

(declare-fun bm!20197 () Bool)

(declare-fun c!35934 () Bool)

(declare-fun call!20203 () ListLongMap!3067)

(declare-fun call!20201 () ListLongMap!3067)

(assert (=> bm!20197 (= call!20199 (+!578 (ite c!35930 call!20203 (ite c!35934 call!20201 call!20198)) (ite (or c!35930 c!35934) (tuple2!4153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20198 () Bool)

(assert (=> bm!20198 (= call!20198 call!20201)))

(declare-fun b!213179 () Bool)

(declare-fun res!104281 () Bool)

(assert (=> b!213179 (=> (not res!104281) (not e!138655))))

(assert (=> b!213179 (= res!104281 e!138652)))

(declare-fun c!35929 () Bool)

(assert (=> b!213179 (= c!35929 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213180 () Bool)

(assert (=> b!213180 (= e!138652 (not call!20197))))

(declare-fun bm!20199 () Bool)

(assert (=> bm!20199 (= call!20203 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213181 () Bool)

(assert (=> b!213181 (= e!138659 call!20200)))

(declare-fun b!213182 () Bool)

(declare-fun res!104280 () Bool)

(assert (=> b!213182 (=> (not res!104280) (not e!138655))))

(assert (=> b!213182 (= res!104280 e!138654)))

(declare-fun res!104282 () Bool)

(assert (=> b!213182 (=> res!104282 e!138654)))

(assert (=> b!213182 (= res!104282 (not e!138651))))

(declare-fun res!104284 () Bool)

(assert (=> b!213182 (=> (not res!104284) (not e!138651))))

(assert (=> b!213182 (= res!104284 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213183 () Bool)

(declare-fun c!35933 () Bool)

(assert (=> b!213183 (= c!35933 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213183 (= e!138653 e!138659)))

(declare-fun bm!20200 () Bool)

(assert (=> bm!20200 (= call!20201 call!20203)))

(declare-fun b!213184 () Bool)

(declare-fun e!138656 () ListLongMap!3067)

(assert (=> b!213184 (= e!138656 (+!578 call!20199 (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213185 () Bool)

(declare-fun lt!110070 () Unit!6446)

(assert (=> b!213185 (= e!138663 lt!110070)))

(declare-fun lt!110077 () ListLongMap!3067)

(assert (=> b!213185 (= lt!110077 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110074 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110074 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110071 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110071 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110082 () Unit!6446)

(assert (=> b!213185 (= lt!110082 (addStillContains!174 lt!110077 lt!110074 zeroValue!615 lt!110071))))

(assert (=> b!213185 (contains!1400 (+!578 lt!110077 (tuple2!4153 lt!110074 zeroValue!615)) lt!110071)))

(declare-fun lt!110076 () Unit!6446)

(assert (=> b!213185 (= lt!110076 lt!110082)))

(declare-fun lt!110069 () ListLongMap!3067)

(assert (=> b!213185 (= lt!110069 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110078 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110078 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110079 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110079 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110067 () Unit!6446)

(assert (=> b!213185 (= lt!110067 (addApplyDifferent!174 lt!110069 lt!110078 minValue!615 lt!110079))))

(assert (=> b!213185 (= (apply!198 (+!578 lt!110069 (tuple2!4153 lt!110078 minValue!615)) lt!110079) (apply!198 lt!110069 lt!110079))))

(declare-fun lt!110064 () Unit!6446)

(assert (=> b!213185 (= lt!110064 lt!110067)))

(declare-fun lt!110083 () ListLongMap!3067)

(assert (=> b!213185 (= lt!110083 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110084 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110072 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110072 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110080 () Unit!6446)

(assert (=> b!213185 (= lt!110080 (addApplyDifferent!174 lt!110083 lt!110084 zeroValue!615 lt!110072))))

(assert (=> b!213185 (= (apply!198 (+!578 lt!110083 (tuple2!4153 lt!110084 zeroValue!615)) lt!110072) (apply!198 lt!110083 lt!110072))))

(declare-fun lt!110085 () Unit!6446)

(assert (=> b!213185 (= lt!110085 lt!110080)))

(declare-fun lt!110066 () ListLongMap!3067)

(assert (=> b!213185 (= lt!110066 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110065 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110065 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110075 () (_ BitVec 64))

(assert (=> b!213185 (= lt!110075 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213185 (= lt!110070 (addApplyDifferent!174 lt!110066 lt!110065 minValue!615 lt!110075))))

(assert (=> b!213185 (= (apply!198 (+!578 lt!110066 (tuple2!4153 lt!110065 minValue!615)) lt!110075) (apply!198 lt!110066 lt!110075))))

(declare-fun b!213186 () Bool)

(assert (=> b!213186 (= e!138656 e!138653)))

(assert (=> b!213186 (= c!35934 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!58265 () Bool)

(assert (=> d!58265 e!138655))

(declare-fun res!104279 () Bool)

(assert (=> d!58265 (=> (not res!104279) (not e!138655))))

(assert (=> d!58265 (= res!104279 (or (bvsge #b00000000000000000000000000000000 (size!5147 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))))

(declare-fun lt!110073 () ListLongMap!3067)

(assert (=> d!58265 (= lt!110068 lt!110073)))

(declare-fun lt!110081 () Unit!6446)

(assert (=> d!58265 (= lt!110081 e!138663)))

(declare-fun c!35932 () Bool)

(assert (=> d!58265 (= c!35932 e!138658)))

(declare-fun res!104287 () Bool)

(assert (=> d!58265 (=> (not res!104287) (not e!138658))))

(assert (=> d!58265 (= res!104287 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> d!58265 (= lt!110073 e!138656)))

(assert (=> d!58265 (= c!35930 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58265 (validMask!0 mask!1149)))

(assert (=> d!58265 (= (getCurrentListMap!1085 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110068)))

(assert (= (and d!58265 c!35930) b!213184))

(assert (= (and d!58265 (not c!35930)) b!213186))

(assert (= (and b!213186 c!35934) b!213167))

(assert (= (and b!213186 (not c!35934)) b!213183))

(assert (= (and b!213183 c!35933) b!213181))

(assert (= (and b!213183 (not c!35933)) b!213173))

(assert (= (or b!213181 b!213173) bm!20198))

(assert (= (or b!213167 bm!20198) bm!20200))

(assert (= (or b!213167 b!213181) bm!20196))

(assert (= (or b!213184 bm!20200) bm!20199))

(assert (= (or b!213184 bm!20196) bm!20197))

(assert (= (and d!58265 res!104287) b!213170))

(assert (= (and d!58265 c!35932) b!213185))

(assert (= (and d!58265 (not c!35932)) b!213172))

(assert (= (and d!58265 res!104279) b!213182))

(assert (= (and b!213182 res!104284) b!213166))

(assert (= (and b!213182 (not res!104282)) b!213168))

(assert (= (and b!213168 res!104285) b!213176))

(assert (= (and b!213182 res!104280) b!213179))

(assert (= (and b!213179 c!35929) b!213178))

(assert (= (and b!213179 (not c!35929)) b!213180))

(assert (= (and b!213178 res!104283) b!213171))

(assert (= (or b!213178 b!213180) bm!20195))

(assert (= (and b!213179 res!104281) b!213174))

(assert (= (and b!213174 c!35931) b!213177))

(assert (= (and b!213174 (not c!35931)) b!213175))

(assert (= (and b!213177 res!104286) b!213169))

(assert (= (or b!213177 b!213175) bm!20194))

(declare-fun b_lambda!7783 () Bool)

(assert (=> (not b_lambda!7783) (not b!213176)))

(assert (=> b!213176 t!7983))

(declare-fun b_and!12497 () Bool)

(assert (= b_and!12495 (and (=> t!7983 result!5007) b_and!12497)))

(assert (=> b!213176 m!241037))

(assert (=> b!213176 m!241097))

(assert (=> b!213176 m!241037))

(assert (=> b!213176 m!241099))

(assert (=> b!213176 m!240997))

(declare-fun m!241119 () Bool)

(assert (=> b!213176 m!241119))

(assert (=> b!213176 m!240997))

(assert (=> b!213176 m!241097))

(declare-fun m!241121 () Bool)

(assert (=> bm!20195 m!241121))

(assert (=> b!213168 m!240997))

(assert (=> b!213168 m!240997))

(declare-fun m!241123 () Bool)

(assert (=> b!213168 m!241123))

(declare-fun m!241125 () Bool)

(assert (=> b!213185 m!241125))

(declare-fun m!241127 () Bool)

(assert (=> b!213185 m!241127))

(declare-fun m!241129 () Bool)

(assert (=> b!213185 m!241129))

(assert (=> b!213185 m!240997))

(declare-fun m!241131 () Bool)

(assert (=> b!213185 m!241131))

(declare-fun m!241133 () Bool)

(assert (=> b!213185 m!241133))

(declare-fun m!241135 () Bool)

(assert (=> b!213185 m!241135))

(declare-fun m!241137 () Bool)

(assert (=> b!213185 m!241137))

(assert (=> b!213185 m!241131))

(declare-fun m!241139 () Bool)

(assert (=> b!213185 m!241139))

(declare-fun m!241141 () Bool)

(assert (=> b!213185 m!241141))

(assert (=> b!213185 m!241127))

(assert (=> b!213185 m!240911))

(declare-fun m!241143 () Bool)

(assert (=> b!213185 m!241143))

(declare-fun m!241145 () Bool)

(assert (=> b!213185 m!241145))

(declare-fun m!241147 () Bool)

(assert (=> b!213185 m!241147))

(assert (=> b!213185 m!241139))

(declare-fun m!241149 () Bool)

(assert (=> b!213185 m!241149))

(declare-fun m!241151 () Bool)

(assert (=> b!213185 m!241151))

(assert (=> b!213185 m!241147))

(declare-fun m!241153 () Bool)

(assert (=> b!213185 m!241153))

(declare-fun m!241155 () Bool)

(assert (=> b!213171 m!241155))

(assert (=> b!213170 m!240997))

(assert (=> b!213170 m!240997))

(assert (=> b!213170 m!240999))

(assert (=> bm!20199 m!240911))

(declare-fun m!241157 () Bool)

(assert (=> b!213184 m!241157))

(declare-fun m!241159 () Bool)

(assert (=> bm!20194 m!241159))

(declare-fun m!241161 () Bool)

(assert (=> b!213169 m!241161))

(assert (=> d!58265 m!240889))

(assert (=> b!213166 m!240997))

(assert (=> b!213166 m!240997))

(assert (=> b!213166 m!240999))

(declare-fun m!241163 () Bool)

(assert (=> bm!20197 m!241163))

(assert (=> b!212937 d!58265))

(declare-fun b!213187 () Bool)

(declare-fun res!104290 () Bool)

(declare-fun e!138665 () Bool)

(assert (=> b!213187 (=> (not res!104290) (not e!138665))))

(declare-fun lt!110092 () ListLongMap!3067)

(assert (=> b!213187 (= res!104290 (not (contains!1400 lt!110092 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213188 () Bool)

(declare-fun e!138670 () Bool)

(assert (=> b!213188 (= e!138670 (isEmpty!505 lt!110092))))

(declare-fun b!213189 () Bool)

(declare-fun e!138667 () ListLongMap!3067)

(declare-fun e!138666 () ListLongMap!3067)

(assert (=> b!213189 (= e!138667 e!138666)))

(declare-fun c!35937 () Bool)

(assert (=> b!213189 (= c!35937 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213190 () Bool)

(declare-fun e!138669 () Bool)

(declare-fun e!138668 () Bool)

(assert (=> b!213190 (= e!138669 e!138668)))

(assert (=> b!213190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun res!104288 () Bool)

(assert (=> b!213190 (= res!104288 (contains!1400 lt!110092 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213190 (=> (not res!104288) (not e!138668))))

(declare-fun d!58267 () Bool)

(assert (=> d!58267 e!138665))

(declare-fun res!104291 () Bool)

(assert (=> d!58267 (=> (not res!104291) (not e!138665))))

(assert (=> d!58267 (= res!104291 (not (contains!1400 lt!110092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58267 (= lt!110092 e!138667)))

(declare-fun c!35935 () Bool)

(assert (=> d!58267 (= c!35935 (bvsge #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> d!58267 (validMask!0 mask!1149)))

(assert (=> d!58267 (= (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110092)))

(declare-fun b!213191 () Bool)

(declare-fun call!20204 () ListLongMap!3067)

(assert (=> b!213191 (= e!138666 call!20204)))

(declare-fun b!213192 () Bool)

(declare-fun lt!110090 () Unit!6446)

(declare-fun lt!110086 () Unit!6446)

(assert (=> b!213192 (= lt!110090 lt!110086)))

(declare-fun lt!110087 () V!6953)

(declare-fun lt!110088 () ListLongMap!3067)

(declare-fun lt!110091 () (_ BitVec 64))

(declare-fun lt!110089 () (_ BitVec 64))

(assert (=> b!213192 (not (contains!1400 (+!578 lt!110088 (tuple2!4153 lt!110089 lt!110087)) lt!110091))))

(assert (=> b!213192 (= lt!110086 (addStillNotContains!109 lt!110088 lt!110089 lt!110087 lt!110091))))

(assert (=> b!213192 (= lt!110091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213192 (= lt!110087 (get!2586 (select (arr!4823 lt!109899) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213192 (= lt!110089 (select (arr!4822 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213192 (= lt!110088 call!20204)))

(assert (=> b!213192 (= e!138666 (+!578 call!20204 (tuple2!4153 (select (arr!4822 _keys!825) #b00000000000000000000000000000000) (get!2586 (select (arr!4823 lt!109899) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213193 () Bool)

(assert (=> b!213193 (= e!138667 (ListLongMap!3068 Nil!3032))))

(declare-fun b!213194 () Bool)

(assert (=> b!213194 (= e!138665 e!138669)))

(declare-fun c!35936 () Bool)

(declare-fun e!138664 () Bool)

(assert (=> b!213194 (= c!35936 e!138664)))

(declare-fun res!104289 () Bool)

(assert (=> b!213194 (=> (not res!104289) (not e!138664))))

(assert (=> b!213194 (= res!104289 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213195 () Bool)

(assert (=> b!213195 (= e!138670 (= lt!110092 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213196 () Bool)

(assert (=> b!213196 (= e!138669 e!138670)))

(declare-fun c!35938 () Bool)

(assert (=> b!213196 (= c!35938 (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(declare-fun b!213197 () Bool)

(assert (=> b!213197 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5147 _keys!825)))))

(assert (=> b!213197 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5148 lt!109899)))))

(assert (=> b!213197 (= e!138668 (= (apply!198 lt!110092 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4823 lt!109899) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20201 () Bool)

(assert (=> bm!20201 (= call!20204 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213198 () Bool)

(assert (=> b!213198 (= e!138664 (validKeyInArray!0 (select (arr!4822 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213198 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58267 c!35935) b!213193))

(assert (= (and d!58267 (not c!35935)) b!213189))

(assert (= (and b!213189 c!35937) b!213192))

(assert (= (and b!213189 (not c!35937)) b!213191))

(assert (= (or b!213192 b!213191) bm!20201))

(assert (= (and d!58267 res!104291) b!213187))

(assert (= (and b!213187 res!104290) b!213194))

(assert (= (and b!213194 res!104289) b!213198))

(assert (= (and b!213194 c!35936) b!213190))

(assert (= (and b!213194 (not c!35936)) b!213196))

(assert (= (and b!213190 res!104288) b!213197))

(assert (= (and b!213196 c!35938) b!213195))

(assert (= (and b!213196 (not c!35938)) b!213188))

(declare-fun b_lambda!7785 () Bool)

(assert (=> (not b_lambda!7785) (not b!213192)))

(assert (=> b!213192 t!7983))

(declare-fun b_and!12499 () Bool)

(assert (= b_and!12497 (and (=> t!7983 result!5007) b_and!12499)))

(declare-fun b_lambda!7787 () Bool)

(assert (=> (not b_lambda!7787) (not b!213197)))

(assert (=> b!213197 t!7983))

(declare-fun b_and!12501 () Bool)

(assert (= b_and!12499 (and (=> t!7983 result!5007) b_and!12501)))

(declare-fun m!241165 () Bool)

(assert (=> b!213195 m!241165))

(assert (=> b!213189 m!240997))

(assert (=> b!213189 m!240997))

(assert (=> b!213189 m!240999))

(assert (=> bm!20201 m!241165))

(assert (=> b!213198 m!240997))

(assert (=> b!213198 m!240997))

(assert (=> b!213198 m!240999))

(declare-fun m!241167 () Bool)

(assert (=> b!213188 m!241167))

(declare-fun m!241169 () Bool)

(assert (=> b!213187 m!241169))

(declare-fun m!241171 () Bool)

(assert (=> d!58267 m!241171))

(assert (=> d!58267 m!240889))

(assert (=> b!213197 m!241039))

(assert (=> b!213197 m!241039))

(assert (=> b!213197 m!241037))

(assert (=> b!213197 m!241041))

(assert (=> b!213197 m!240997))

(declare-fun m!241173 () Bool)

(assert (=> b!213197 m!241173))

(assert (=> b!213197 m!240997))

(assert (=> b!213197 m!241037))

(declare-fun m!241175 () Bool)

(assert (=> b!213192 m!241175))

(assert (=> b!213192 m!241039))

(assert (=> b!213192 m!241039))

(assert (=> b!213192 m!241037))

(assert (=> b!213192 m!241041))

(declare-fun m!241177 () Bool)

(assert (=> b!213192 m!241177))

(declare-fun m!241179 () Bool)

(assert (=> b!213192 m!241179))

(assert (=> b!213192 m!241037))

(assert (=> b!213192 m!241175))

(declare-fun m!241181 () Bool)

(assert (=> b!213192 m!241181))

(assert (=> b!213192 m!240997))

(assert (=> b!213190 m!240997))

(assert (=> b!213190 m!240997))

(declare-fun m!241183 () Bool)

(assert (=> b!213190 m!241183))

(assert (=> b!212937 d!58267))

(declare-fun d!58269 () Bool)

(declare-fun e!138671 () Bool)

(assert (=> d!58269 e!138671))

(declare-fun res!104292 () Bool)

(assert (=> d!58269 (=> (not res!104292) (not e!138671))))

(declare-fun lt!110096 () ListLongMap!3067)

(assert (=> d!58269 (= res!104292 (contains!1400 lt!110096 (_1!2087 (tuple2!4153 k0!843 v!520))))))

(declare-fun lt!110093 () List!3035)

(assert (=> d!58269 (= lt!110096 (ListLongMap!3068 lt!110093))))

(declare-fun lt!110094 () Unit!6446)

(declare-fun lt!110095 () Unit!6446)

(assert (=> d!58269 (= lt!110094 lt!110095)))

(assert (=> d!58269 (= (getValueByKey!257 lt!110093 (_1!2087 (tuple2!4153 k0!843 v!520))) (Some!262 (_2!2087 (tuple2!4153 k0!843 v!520))))))

(assert (=> d!58269 (= lt!110095 (lemmaContainsTupThenGetReturnValue!144 lt!110093 (_1!2087 (tuple2!4153 k0!843 v!520)) (_2!2087 (tuple2!4153 k0!843 v!520))))))

(assert (=> d!58269 (= lt!110093 (insertStrictlySorted!147 (toList!1549 lt!109894) (_1!2087 (tuple2!4153 k0!843 v!520)) (_2!2087 (tuple2!4153 k0!843 v!520))))))

(assert (=> d!58269 (= (+!578 lt!109894 (tuple2!4153 k0!843 v!520)) lt!110096)))

(declare-fun b!213199 () Bool)

(declare-fun res!104293 () Bool)

(assert (=> b!213199 (=> (not res!104293) (not e!138671))))

(assert (=> b!213199 (= res!104293 (= (getValueByKey!257 (toList!1549 lt!110096) (_1!2087 (tuple2!4153 k0!843 v!520))) (Some!262 (_2!2087 (tuple2!4153 k0!843 v!520)))))))

(declare-fun b!213200 () Bool)

(assert (=> b!213200 (= e!138671 (contains!1401 (toList!1549 lt!110096) (tuple2!4153 k0!843 v!520)))))

(assert (= (and d!58269 res!104292) b!213199))

(assert (= (and b!213199 res!104293) b!213200))

(declare-fun m!241185 () Bool)

(assert (=> d!58269 m!241185))

(declare-fun m!241187 () Bool)

(assert (=> d!58269 m!241187))

(declare-fun m!241189 () Bool)

(assert (=> d!58269 m!241189))

(declare-fun m!241191 () Bool)

(assert (=> d!58269 m!241191))

(declare-fun m!241193 () Bool)

(assert (=> b!213199 m!241193))

(declare-fun m!241195 () Bool)

(assert (=> b!213200 m!241195))

(assert (=> b!212937 d!58269))

(declare-fun d!58271 () Bool)

(declare-fun e!138672 () Bool)

(assert (=> d!58271 e!138672))

(declare-fun res!104294 () Bool)

(assert (=> d!58271 (=> (not res!104294) (not e!138672))))

(declare-fun lt!110100 () ListLongMap!3067)

(assert (=> d!58271 (= res!104294 (contains!1400 lt!110100 (_1!2087 lt!109898)))))

(declare-fun lt!110097 () List!3035)

(assert (=> d!58271 (= lt!110100 (ListLongMap!3068 lt!110097))))

(declare-fun lt!110098 () Unit!6446)

(declare-fun lt!110099 () Unit!6446)

(assert (=> d!58271 (= lt!110098 lt!110099)))

(assert (=> d!58271 (= (getValueByKey!257 lt!110097 (_1!2087 lt!109898)) (Some!262 (_2!2087 lt!109898)))))

(assert (=> d!58271 (= lt!110099 (lemmaContainsTupThenGetReturnValue!144 lt!110097 (_1!2087 lt!109898) (_2!2087 lt!109898)))))

(assert (=> d!58271 (= lt!110097 (insertStrictlySorted!147 (toList!1549 lt!109894) (_1!2087 lt!109898) (_2!2087 lt!109898)))))

(assert (=> d!58271 (= (+!578 lt!109894 lt!109898) lt!110100)))

(declare-fun b!213201 () Bool)

(declare-fun res!104295 () Bool)

(assert (=> b!213201 (=> (not res!104295) (not e!138672))))

(assert (=> b!213201 (= res!104295 (= (getValueByKey!257 (toList!1549 lt!110100) (_1!2087 lt!109898)) (Some!262 (_2!2087 lt!109898))))))

(declare-fun b!213202 () Bool)

(assert (=> b!213202 (= e!138672 (contains!1401 (toList!1549 lt!110100) lt!109898))))

(assert (= (and d!58271 res!104294) b!213201))

(assert (= (and b!213201 res!104295) b!213202))

(declare-fun m!241197 () Bool)

(assert (=> d!58271 m!241197))

(declare-fun m!241199 () Bool)

(assert (=> d!58271 m!241199))

(declare-fun m!241201 () Bool)

(assert (=> d!58271 m!241201))

(declare-fun m!241203 () Bool)

(assert (=> d!58271 m!241203))

(declare-fun m!241205 () Bool)

(assert (=> b!213201 m!241205))

(declare-fun m!241207 () Bool)

(assert (=> b!213202 m!241207))

(assert (=> b!212932 d!58271))

(declare-fun b!213209 () Bool)

(declare-fun e!138677 () Bool)

(assert (=> b!213209 (= e!138677 tp_is_empty!5479)))

(declare-fun mapIsEmpty!9323 () Bool)

(declare-fun mapRes!9323 () Bool)

(assert (=> mapIsEmpty!9323 mapRes!9323))

(declare-fun b!213210 () Bool)

(declare-fun e!138678 () Bool)

(assert (=> b!213210 (= e!138678 tp_is_empty!5479)))

(declare-fun mapNonEmpty!9323 () Bool)

(declare-fun tp!19934 () Bool)

(assert (=> mapNonEmpty!9323 (= mapRes!9323 (and tp!19934 e!138677))))

(declare-fun mapValue!9323 () ValueCell!2396)

(declare-fun mapRest!9323 () (Array (_ BitVec 32) ValueCell!2396))

(declare-fun mapKey!9323 () (_ BitVec 32))

(assert (=> mapNonEmpty!9323 (= mapRest!9314 (store mapRest!9323 mapKey!9323 mapValue!9323))))

(declare-fun condMapEmpty!9323 () Bool)

(declare-fun mapDefault!9323 () ValueCell!2396)

(assert (=> mapNonEmpty!9314 (= condMapEmpty!9323 (= mapRest!9314 ((as const (Array (_ BitVec 32) ValueCell!2396)) mapDefault!9323)))))

(assert (=> mapNonEmpty!9314 (= tp!19919 (and e!138678 mapRes!9323))))

(assert (= (and mapNonEmpty!9314 condMapEmpty!9323) mapIsEmpty!9323))

(assert (= (and mapNonEmpty!9314 (not condMapEmpty!9323)) mapNonEmpty!9323))

(assert (= (and mapNonEmpty!9323 ((_ is ValueCellFull!2396) mapValue!9323)) b!213209))

(assert (= (and mapNonEmpty!9314 ((_ is ValueCellFull!2396) mapDefault!9323)) b!213210))

(declare-fun m!241209 () Bool)

(assert (=> mapNonEmpty!9323 m!241209))

(declare-fun b_lambda!7789 () Bool)

(assert (= b_lambda!7781 (or (and start!21150 b_free!5617) b_lambda!7789)))

(declare-fun b_lambda!7791 () Bool)

(assert (= b_lambda!7785 (or (and start!21150 b_free!5617) b_lambda!7791)))

(declare-fun b_lambda!7793 () Bool)

(assert (= b_lambda!7779 (or (and start!21150 b_free!5617) b_lambda!7793)))

(declare-fun b_lambda!7795 () Bool)

(assert (= b_lambda!7787 (or (and start!21150 b_free!5617) b_lambda!7795)))

(declare-fun b_lambda!7797 () Bool)

(assert (= b_lambda!7783 (or (and start!21150 b_free!5617) b_lambda!7797)))

(declare-fun b_lambda!7799 () Bool)

(assert (= b_lambda!7777 (or (and start!21150 b_free!5617) b_lambda!7799)))

(check-sat (not bm!20181) b_and!12501 (not b!213103) (not b!213155) (not b_lambda!7789) (not b!213166) (not b_lambda!7799) (not bm!20178) (not bm!20193) (not b!213100) (not d!58267) (not b_lambda!7797) (not bm!20199) (not bm!20195) (not b!213201) (not b!213117) (not b!213169) (not b_lambda!7791) (not d!58259) (not b!213199) (not bm!20183) (not b_lambda!7795) (not b!213108) (not b!213116) (not b!213198) (not b!213147) (not b!213054) (not b!213200) (not b!213165) (not d!58265) (not b!213190) (not b!213053) (not bm!20160) (not b!213148) (not bm!20187) (not b!213197) tp_is_empty!5479 (not b!213153) (not b!213189) (not d!58261) (not b!213170) (not b_next!5617) (not b!213184) (not b!213031) (not b!213146) (not bm!20197) (not b!213033) (not b!213185) (not b!213188) (not b!213150) (not b!213202) (not d!58247) (not b!213145) (not d!58269) (not b!213045) (not b!213101) (not d!58255) (not d!58271) (not bm!20179) (not b!213032) (not b!213098) (not bm!20201) (not b!213195) (not b!213187) (not b!213156) (not b!213168) (not b!213102) (not b!213171) (not b!213192) (not b!213176) (not bm!20163) (not d!58263) (not b!213047) (not b_lambda!7793) (not b!213052) (not bm!20194) (not mapNonEmpty!9323) (not b!213055) (not bm!20192))
(check-sat b_and!12501 (not b_next!5617))
