; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34270 () Bool)

(assert start!34270)

(declare-fun b_free!7269 () Bool)

(declare-fun b_next!7269 () Bool)

(assert (=> start!34270 (= b_free!7269 (not b_next!7269))))

(declare-fun tp!25344 () Bool)

(declare-fun b_and!14471 () Bool)

(assert (=> start!34270 (= tp!25344 b_and!14471)))

(declare-fun b!341944 () Bool)

(declare-fun e!209697 () Bool)

(declare-fun e!209700 () Bool)

(declare-fun mapRes!12261 () Bool)

(assert (=> b!341944 (= e!209697 (and e!209700 mapRes!12261))))

(declare-fun condMapEmpty!12261 () Bool)

(declare-datatypes ((V!10605 0))(
  ( (V!10606 (val!3655 Int)) )
))
(declare-datatypes ((ValueCell!3267 0))(
  ( (ValueCellFull!3267 (v!5828 V!10605)) (EmptyCell!3267) )
))
(declare-datatypes ((array!18037 0))(
  ( (array!18038 (arr!8538 (Array (_ BitVec 32) ValueCell!3267)) (size!8890 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18037)

(declare-fun mapDefault!12261 () ValueCell!3267)

(assert (=> b!341944 (= condMapEmpty!12261 (= (arr!8538 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3267)) mapDefault!12261)))))

(declare-fun b!341945 () Bool)

(declare-fun res!189030 () Bool)

(declare-fun e!209696 () Bool)

(assert (=> b!341945 (=> (not res!189030) (not e!209696))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18039 0))(
  ( (array!18040 (arr!8539 (Array (_ BitVec 32) (_ BitVec 64))) (size!8891 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18039)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341945 (= res!189030 (and (= (size!8890 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8891 _keys!1895) (size!8890 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341946 () Bool)

(declare-datatypes ((Unit!10624 0))(
  ( (Unit!10625) )
))
(declare-fun e!209699 () Unit!10624)

(declare-fun Unit!10626 () Unit!10624)

(assert (=> b!341946 (= e!209699 Unit!10626)))

(declare-fun b!341947 () Bool)

(declare-fun Unit!10627 () Unit!10624)

(assert (=> b!341947 (= e!209699 Unit!10627)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10605)

(declare-fun lt!161958 () Unit!10624)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10605)

(declare-fun lemmaArrayContainsKeyThenInListMap!294 (array!18039 array!18037 (_ BitVec 32) (_ BitVec 32) V!10605 V!10605 (_ BitVec 64) (_ BitVec 32) Int) Unit!10624)

(declare-fun arrayScanForKey!0 (array!18039 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341947 (= lt!161958 (lemmaArrayContainsKeyThenInListMap!294 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341947 false))

(declare-fun b!341948 () Bool)

(declare-fun res!189032 () Bool)

(assert (=> b!341948 (=> (not res!189032) (not e!209696))))

(declare-datatypes ((tuple2!5296 0))(
  ( (tuple2!5297 (_1!2659 (_ BitVec 64)) (_2!2659 V!10605)) )
))
(declare-datatypes ((List!4913 0))(
  ( (Nil!4910) (Cons!4909 (h!5765 tuple2!5296) (t!10023 List!4913)) )
))
(declare-datatypes ((ListLongMap!4209 0))(
  ( (ListLongMap!4210 (toList!2120 List!4913)) )
))
(declare-fun contains!2175 (ListLongMap!4209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1641 (array!18039 array!18037 (_ BitVec 32) (_ BitVec 32) V!10605 V!10605 (_ BitVec 32) Int) ListLongMap!4209)

(assert (=> b!341948 (= res!189032 (not (contains!2175 (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12261 () Bool)

(assert (=> mapIsEmpty!12261 mapRes!12261))

(declare-fun b!341949 () Bool)

(declare-fun res!189031 () Bool)

(assert (=> b!341949 (=> (not res!189031) (not e!209696))))

(declare-datatypes ((List!4914 0))(
  ( (Nil!4911) (Cons!4910 (h!5766 (_ BitVec 64)) (t!10024 List!4914)) )
))
(declare-fun arrayNoDuplicates!0 (array!18039 (_ BitVec 32) List!4914) Bool)

(assert (=> b!341949 (= res!189031 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4911))))

(declare-fun b!341950 () Bool)

(declare-fun res!189029 () Bool)

(assert (=> b!341950 (=> (not res!189029) (not e!209696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18039 (_ BitVec 32)) Bool)

(assert (=> b!341950 (= res!189029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341951 () Bool)

(declare-fun res!189035 () Bool)

(assert (=> b!341951 (=> (not res!189035) (not e!209696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341951 (= res!189035 (validKeyInArray!0 k0!1348))))

(declare-fun b!341952 () Bool)

(declare-fun e!209694 () Bool)

(assert (=> b!341952 (= e!209694 (and (bvslt #b00000000000000000000000000000000 (size!8891 _keys!1895)) (bvsge (size!8891 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun lt!161957 () Unit!10624)

(assert (=> b!341952 (= lt!161957 e!209699)))

(declare-fun c!52746 () Bool)

(declare-fun arrayContainsKey!0 (array!18039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341952 (= c!52746 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341953 () Bool)

(declare-fun e!209695 () Bool)

(declare-fun tp_is_empty!7221 () Bool)

(assert (=> b!341953 (= e!209695 tp_is_empty!7221)))

(declare-fun mapNonEmpty!12261 () Bool)

(declare-fun tp!25343 () Bool)

(assert (=> mapNonEmpty!12261 (= mapRes!12261 (and tp!25343 e!209695))))

(declare-fun mapKey!12261 () (_ BitVec 32))

(declare-fun mapRest!12261 () (Array (_ BitVec 32) ValueCell!3267))

(declare-fun mapValue!12261 () ValueCell!3267)

(assert (=> mapNonEmpty!12261 (= (arr!8538 _values!1525) (store mapRest!12261 mapKey!12261 mapValue!12261))))

(declare-fun res!189033 () Bool)

(assert (=> start!34270 (=> (not res!189033) (not e!209696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34270 (= res!189033 (validMask!0 mask!2385))))

(assert (=> start!34270 e!209696))

(assert (=> start!34270 true))

(assert (=> start!34270 tp_is_empty!7221))

(assert (=> start!34270 tp!25344))

(declare-fun array_inv!6320 (array!18037) Bool)

(assert (=> start!34270 (and (array_inv!6320 _values!1525) e!209697)))

(declare-fun array_inv!6321 (array!18039) Bool)

(assert (=> start!34270 (array_inv!6321 _keys!1895)))

(declare-fun b!341954 () Bool)

(assert (=> b!341954 (= e!209696 e!209694)))

(declare-fun res!189034 () Bool)

(assert (=> b!341954 (=> (not res!189034) (not e!209694))))

(declare-datatypes ((SeekEntryResult!3296 0))(
  ( (MissingZero!3296 (index!15363 (_ BitVec 32))) (Found!3296 (index!15364 (_ BitVec 32))) (Intermediate!3296 (undefined!4108 Bool) (index!15365 (_ BitVec 32)) (x!34052 (_ BitVec 32))) (Undefined!3296) (MissingVacant!3296 (index!15366 (_ BitVec 32))) )
))
(declare-fun lt!161959 () SeekEntryResult!3296)

(get-info :version)

(assert (=> b!341954 (= res!189034 (and (not ((_ is Found!3296) lt!161959)) (not ((_ is MissingZero!3296) lt!161959)) ((_ is MissingVacant!3296) lt!161959)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18039 (_ BitVec 32)) SeekEntryResult!3296)

(assert (=> b!341954 (= lt!161959 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341955 () Bool)

(assert (=> b!341955 (= e!209700 tp_is_empty!7221)))

(assert (= (and start!34270 res!189033) b!341945))

(assert (= (and b!341945 res!189030) b!341950))

(assert (= (and b!341950 res!189029) b!341949))

(assert (= (and b!341949 res!189031) b!341951))

(assert (= (and b!341951 res!189035) b!341948))

(assert (= (and b!341948 res!189032) b!341954))

(assert (= (and b!341954 res!189034) b!341952))

(assert (= (and b!341952 c!52746) b!341947))

(assert (= (and b!341952 (not c!52746)) b!341946))

(assert (= (and b!341944 condMapEmpty!12261) mapIsEmpty!12261))

(assert (= (and b!341944 (not condMapEmpty!12261)) mapNonEmpty!12261))

(assert (= (and mapNonEmpty!12261 ((_ is ValueCellFull!3267) mapValue!12261)) b!341953))

(assert (= (and b!341944 ((_ is ValueCellFull!3267) mapDefault!12261)) b!341955))

(assert (= start!34270 b!341944))

(declare-fun m!344235 () Bool)

(assert (=> mapNonEmpty!12261 m!344235))

(declare-fun m!344237 () Bool)

(assert (=> b!341952 m!344237))

(declare-fun m!344239 () Bool)

(assert (=> b!341954 m!344239))

(declare-fun m!344241 () Bool)

(assert (=> b!341947 m!344241))

(assert (=> b!341947 m!344241))

(declare-fun m!344243 () Bool)

(assert (=> b!341947 m!344243))

(declare-fun m!344245 () Bool)

(assert (=> b!341951 m!344245))

(declare-fun m!344247 () Bool)

(assert (=> b!341950 m!344247))

(declare-fun m!344249 () Bool)

(assert (=> start!34270 m!344249))

(declare-fun m!344251 () Bool)

(assert (=> start!34270 m!344251))

(declare-fun m!344253 () Bool)

(assert (=> start!34270 m!344253))

(declare-fun m!344255 () Bool)

(assert (=> b!341948 m!344255))

(assert (=> b!341948 m!344255))

(declare-fun m!344257 () Bool)

(assert (=> b!341948 m!344257))

(declare-fun m!344259 () Bool)

(assert (=> b!341949 m!344259))

(check-sat (not b!341951) (not b!341952) (not b_next!7269) (not start!34270) (not b!341949) (not b!341954) (not b!341950) (not b!341947) (not mapNonEmpty!12261) (not b!341948) b_and!14471 tp_is_empty!7221)
(check-sat b_and!14471 (not b_next!7269))
(get-model)

(declare-fun d!70981 () Bool)

(assert (=> d!70981 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341951 d!70981))

(declare-fun d!70983 () Bool)

(assert (=> d!70983 (contains!2175 (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!161971 () Unit!10624)

(declare-fun choose!1303 (array!18039 array!18037 (_ BitVec 32) (_ BitVec 32) V!10605 V!10605 (_ BitVec 64) (_ BitVec 32) Int) Unit!10624)

(assert (=> d!70983 (= lt!161971 (choose!1303 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70983 (validMask!0 mask!2385)))

(assert (=> d!70983 (= (lemmaArrayContainsKeyThenInListMap!294 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!161971)))

(declare-fun bs!11734 () Bool)

(assert (= bs!11734 d!70983))

(assert (=> bs!11734 m!344255))

(assert (=> bs!11734 m!344255))

(assert (=> bs!11734 m!344257))

(assert (=> bs!11734 m!344241))

(declare-fun m!344287 () Bool)

(assert (=> bs!11734 m!344287))

(assert (=> bs!11734 m!344249))

(assert (=> b!341947 d!70983))

(declare-fun d!70985 () Bool)

(declare-fun lt!161974 () (_ BitVec 32))

(assert (=> d!70985 (and (or (bvslt lt!161974 #b00000000000000000000000000000000) (bvsge lt!161974 (size!8891 _keys!1895)) (and (bvsge lt!161974 #b00000000000000000000000000000000) (bvslt lt!161974 (size!8891 _keys!1895)))) (bvsge lt!161974 #b00000000000000000000000000000000) (bvslt lt!161974 (size!8891 _keys!1895)) (= (select (arr!8539 _keys!1895) lt!161974) k0!1348))))

(declare-fun e!209724 () (_ BitVec 32))

(assert (=> d!70985 (= lt!161974 e!209724)))

(declare-fun c!52752 () Bool)

(assert (=> d!70985 (= c!52752 (= (select (arr!8539 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8891 _keys!1895)) (bvslt (size!8891 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70985 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!161974)))

(declare-fun b!341996 () Bool)

(assert (=> b!341996 (= e!209724 #b00000000000000000000000000000000)))

(declare-fun b!341997 () Bool)

(assert (=> b!341997 (= e!209724 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70985 c!52752) b!341996))

(assert (= (and d!70985 (not c!52752)) b!341997))

(declare-fun m!344289 () Bool)

(assert (=> d!70985 m!344289))

(declare-fun m!344291 () Bool)

(assert (=> d!70985 m!344291))

(declare-fun m!344293 () Bool)

(assert (=> b!341997 m!344293))

(assert (=> b!341947 d!70985))

(declare-fun d!70987 () Bool)

(assert (=> d!70987 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34270 d!70987))

(declare-fun d!70989 () Bool)

(assert (=> d!70989 (= (array_inv!6320 _values!1525) (bvsge (size!8890 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34270 d!70989))

(declare-fun d!70991 () Bool)

(assert (=> d!70991 (= (array_inv!6321 _keys!1895) (bvsge (size!8891 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34270 d!70991))

(declare-fun d!70993 () Bool)

(declare-fun res!189061 () Bool)

(declare-fun e!209729 () Bool)

(assert (=> d!70993 (=> res!189061 e!209729)))

(assert (=> d!70993 (= res!189061 (= (select (arr!8539 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70993 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!209729)))

(declare-fun b!342002 () Bool)

(declare-fun e!209730 () Bool)

(assert (=> b!342002 (= e!209729 e!209730)))

(declare-fun res!189062 () Bool)

(assert (=> b!342002 (=> (not res!189062) (not e!209730))))

(assert (=> b!342002 (= res!189062 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8891 _keys!1895)))))

(declare-fun b!342003 () Bool)

(assert (=> b!342003 (= e!209730 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70993 (not res!189061)) b!342002))

(assert (= (and b!342002 res!189062) b!342003))

(assert (=> d!70993 m!344291))

(declare-fun m!344295 () Bool)

(assert (=> b!342003 m!344295))

(assert (=> b!341952 d!70993))

(declare-fun d!70995 () Bool)

(declare-fun e!209735 () Bool)

(assert (=> d!70995 e!209735))

(declare-fun res!189065 () Bool)

(assert (=> d!70995 (=> res!189065 e!209735)))

(declare-fun lt!161984 () Bool)

(assert (=> d!70995 (= res!189065 (not lt!161984))))

(declare-fun lt!161985 () Bool)

(assert (=> d!70995 (= lt!161984 lt!161985)))

(declare-fun lt!161983 () Unit!10624)

(declare-fun e!209736 () Unit!10624)

(assert (=> d!70995 (= lt!161983 e!209736)))

(declare-fun c!52755 () Bool)

(assert (=> d!70995 (= c!52755 lt!161985)))

(declare-fun containsKey!327 (List!4913 (_ BitVec 64)) Bool)

(assert (=> d!70995 (= lt!161985 (containsKey!327 (toList!2120 (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70995 (= (contains!2175 (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161984)))

(declare-fun b!342010 () Bool)

(declare-fun lt!161986 () Unit!10624)

(assert (=> b!342010 (= e!209736 lt!161986)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!275 (List!4913 (_ BitVec 64)) Unit!10624)

(assert (=> b!342010 (= lt!161986 (lemmaContainsKeyImpliesGetValueByKeyDefined!275 (toList!2120 (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!341 0))(
  ( (Some!340 (v!5830 V!10605)) (None!339) )
))
(declare-fun isDefined!276 (Option!341) Bool)

(declare-fun getValueByKey!335 (List!4913 (_ BitVec 64)) Option!341)

(assert (=> b!342010 (isDefined!276 (getValueByKey!335 (toList!2120 (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!342011 () Bool)

(declare-fun Unit!10632 () Unit!10624)

(assert (=> b!342011 (= e!209736 Unit!10632)))

(declare-fun b!342012 () Bool)

(assert (=> b!342012 (= e!209735 (isDefined!276 (getValueByKey!335 (toList!2120 (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70995 c!52755) b!342010))

(assert (= (and d!70995 (not c!52755)) b!342011))

(assert (= (and d!70995 (not res!189065)) b!342012))

(declare-fun m!344297 () Bool)

(assert (=> d!70995 m!344297))

(declare-fun m!344299 () Bool)

(assert (=> b!342010 m!344299))

(declare-fun m!344301 () Bool)

(assert (=> b!342010 m!344301))

(assert (=> b!342010 m!344301))

(declare-fun m!344303 () Bool)

(assert (=> b!342010 m!344303))

(assert (=> b!342012 m!344301))

(assert (=> b!342012 m!344301))

(assert (=> b!342012 m!344303))

(assert (=> b!341948 d!70995))

(declare-fun b!342055 () Bool)

(declare-fun e!209770 () Bool)

(declare-fun call!26608 () Bool)

(assert (=> b!342055 (= e!209770 (not call!26608))))

(declare-fun b!342056 () Bool)

(declare-fun e!209766 () Bool)

(declare-fun lt!162034 () ListLongMap!4209)

(declare-fun apply!277 (ListLongMap!4209 (_ BitVec 64)) V!10605)

(assert (=> b!342056 (= e!209766 (= (apply!277 lt!162034 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun call!26610 () ListLongMap!4209)

(declare-fun c!52769 () Bool)

(declare-fun call!26609 () ListLongMap!4209)

(declare-fun bm!26605 () Bool)

(declare-fun call!26612 () ListLongMap!4209)

(declare-fun call!26613 () ListLongMap!4209)

(declare-fun c!52770 () Bool)

(declare-fun +!726 (ListLongMap!4209 tuple2!5296) ListLongMap!4209)

(assert (=> bm!26605 (= call!26610 (+!726 (ite c!52769 call!26613 (ite c!52770 call!26609 call!26612)) (ite (or c!52769 c!52770) (tuple2!5297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5297 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!342057 () Bool)

(declare-fun e!209768 () Unit!10624)

(declare-fun Unit!10633 () Unit!10624)

(assert (=> b!342057 (= e!209768 Unit!10633)))

(declare-fun bm!26606 () Bool)

(assert (=> bm!26606 (= call!26609 call!26613)))

(declare-fun b!342058 () Bool)

(declare-fun e!209765 () Bool)

(declare-fun e!209772 () Bool)

(assert (=> b!342058 (= e!209765 e!209772)))

(declare-fun c!52772 () Bool)

(assert (=> b!342058 (= c!52772 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!342059 () Bool)

(declare-fun e!209763 () Bool)

(declare-fun e!209775 () Bool)

(assert (=> b!342059 (= e!209763 e!209775)))

(declare-fun res!189086 () Bool)

(assert (=> b!342059 (=> (not res!189086) (not e!209775))))

(assert (=> b!342059 (= res!189086 (contains!2175 lt!162034 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!342059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8891 _keys!1895)))))

(declare-fun b!342060 () Bool)

(declare-fun res!189084 () Bool)

(assert (=> b!342060 (=> (not res!189084) (not e!209765))))

(assert (=> b!342060 (= res!189084 e!209770)))

(declare-fun c!52773 () Bool)

(assert (=> b!342060 (= c!52773 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!342061 () Bool)

(assert (=> b!342061 (= e!209772 e!209766)))

(declare-fun res!189087 () Bool)

(declare-fun call!26614 () Bool)

(assert (=> b!342061 (= res!189087 call!26614)))

(assert (=> b!342061 (=> (not res!189087) (not e!209766))))

(declare-fun bm!26608 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!599 (array!18039 array!18037 (_ BitVec 32) (_ BitVec 32) V!10605 V!10605 (_ BitVec 32) Int) ListLongMap!4209)

(assert (=> bm!26608 (= call!26613 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!342062 () Bool)

(declare-fun e!209769 () ListLongMap!4209)

(declare-fun call!26611 () ListLongMap!4209)

(assert (=> b!342062 (= e!209769 call!26611)))

(declare-fun b!342063 () Bool)

(declare-fun e!209771 () ListLongMap!4209)

(assert (=> b!342063 (= e!209771 call!26612)))

(declare-fun b!342064 () Bool)

(assert (=> b!342064 (= e!209772 (not call!26614))))

(declare-fun bm!26609 () Bool)

(assert (=> bm!26609 (= call!26614 (contains!2175 lt!162034 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!342065 () Bool)

(declare-fun res!189091 () Bool)

(assert (=> b!342065 (=> (not res!189091) (not e!209765))))

(assert (=> b!342065 (= res!189091 e!209763)))

(declare-fun res!189085 () Bool)

(assert (=> b!342065 (=> res!189085 e!209763)))

(declare-fun e!209774 () Bool)

(assert (=> b!342065 (= res!189085 (not e!209774))))

(declare-fun res!189092 () Bool)

(assert (=> b!342065 (=> (not res!189092) (not e!209774))))

(assert (=> b!342065 (= res!189092 (bvslt #b00000000000000000000000000000000 (size!8891 _keys!1895)))))

(declare-fun b!342066 () Bool)

(declare-fun e!209764 () ListLongMap!4209)

(assert (=> b!342066 (= e!209764 e!209769)))

(assert (=> b!342066 (= c!52770 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26607 () Bool)

(assert (=> bm!26607 (= call!26612 call!26609)))

(declare-fun d!70997 () Bool)

(assert (=> d!70997 e!209765))

(declare-fun res!189090 () Bool)

(assert (=> d!70997 (=> (not res!189090) (not e!209765))))

(assert (=> d!70997 (= res!189090 (or (bvsge #b00000000000000000000000000000000 (size!8891 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8891 _keys!1895)))))))

(declare-fun lt!162044 () ListLongMap!4209)

(assert (=> d!70997 (= lt!162034 lt!162044)))

(declare-fun lt!162050 () Unit!10624)

(assert (=> d!70997 (= lt!162050 e!209768)))

(declare-fun c!52771 () Bool)

(declare-fun e!209773 () Bool)

(assert (=> d!70997 (= c!52771 e!209773)))

(declare-fun res!189088 () Bool)

(assert (=> d!70997 (=> (not res!189088) (not e!209773))))

(assert (=> d!70997 (= res!189088 (bvslt #b00000000000000000000000000000000 (size!8891 _keys!1895)))))

(assert (=> d!70997 (= lt!162044 e!209764)))

(assert (=> d!70997 (= c!52769 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70997 (validMask!0 mask!2385)))

(assert (=> d!70997 (= (getCurrentListMap!1641 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162034)))

(declare-fun b!342067 () Bool)

(assert (=> b!342067 (= e!209764 (+!726 call!26610 (tuple2!5297 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26610 () Bool)

(assert (=> bm!26610 (= call!26608 (contains!2175 lt!162034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!342068 () Bool)

(declare-fun get!4629 (ValueCell!3267 V!10605) V!10605)

(declare-fun dynLambda!620 (Int (_ BitVec 64)) V!10605)

(assert (=> b!342068 (= e!209775 (= (apply!277 lt!162034 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)) (get!4629 (select (arr!8538 _values!1525) #b00000000000000000000000000000000) (dynLambda!620 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!342068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8890 _values!1525)))))

(assert (=> b!342068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8891 _keys!1895)))))

(declare-fun b!342069 () Bool)

(assert (=> b!342069 (= e!209773 (validKeyInArray!0 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342070 () Bool)

(declare-fun e!209767 () Bool)

(assert (=> b!342070 (= e!209767 (= (apply!277 lt!162034 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!342071 () Bool)

(declare-fun c!52768 () Bool)

(assert (=> b!342071 (= c!52768 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!342071 (= e!209769 e!209771)))

(declare-fun b!342072 () Bool)

(assert (=> b!342072 (= e!209774 (validKeyInArray!0 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342073 () Bool)

(assert (=> b!342073 (= e!209771 call!26611)))

(declare-fun b!342074 () Bool)

(assert (=> b!342074 (= e!209770 e!209767)))

(declare-fun res!189089 () Bool)

(assert (=> b!342074 (= res!189089 call!26608)))

(assert (=> b!342074 (=> (not res!189089) (not e!209767))))

(declare-fun b!342075 () Bool)

(declare-fun lt!162039 () Unit!10624)

(assert (=> b!342075 (= e!209768 lt!162039)))

(declare-fun lt!162045 () ListLongMap!4209)

(assert (=> b!342075 (= lt!162045 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162038 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162032 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162032 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162031 () Unit!10624)

(declare-fun addStillContains!253 (ListLongMap!4209 (_ BitVec 64) V!10605 (_ BitVec 64)) Unit!10624)

(assert (=> b!342075 (= lt!162031 (addStillContains!253 lt!162045 lt!162038 zeroValue!1467 lt!162032))))

(assert (=> b!342075 (contains!2175 (+!726 lt!162045 (tuple2!5297 lt!162038 zeroValue!1467)) lt!162032)))

(declare-fun lt!162042 () Unit!10624)

(assert (=> b!342075 (= lt!162042 lt!162031)))

(declare-fun lt!162043 () ListLongMap!4209)

(assert (=> b!342075 (= lt!162043 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162036 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162036 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162035 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162035 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162047 () Unit!10624)

(declare-fun addApplyDifferent!253 (ListLongMap!4209 (_ BitVec 64) V!10605 (_ BitVec 64)) Unit!10624)

(assert (=> b!342075 (= lt!162047 (addApplyDifferent!253 lt!162043 lt!162036 minValue!1467 lt!162035))))

(assert (=> b!342075 (= (apply!277 (+!726 lt!162043 (tuple2!5297 lt!162036 minValue!1467)) lt!162035) (apply!277 lt!162043 lt!162035))))

(declare-fun lt!162033 () Unit!10624)

(assert (=> b!342075 (= lt!162033 lt!162047)))

(declare-fun lt!162040 () ListLongMap!4209)

(assert (=> b!342075 (= lt!162040 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162052 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162049 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162049 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162046 () Unit!10624)

(assert (=> b!342075 (= lt!162046 (addApplyDifferent!253 lt!162040 lt!162052 zeroValue!1467 lt!162049))))

(assert (=> b!342075 (= (apply!277 (+!726 lt!162040 (tuple2!5297 lt!162052 zeroValue!1467)) lt!162049) (apply!277 lt!162040 lt!162049))))

(declare-fun lt!162051 () Unit!10624)

(assert (=> b!342075 (= lt!162051 lt!162046)))

(declare-fun lt!162048 () ListLongMap!4209)

(assert (=> b!342075 (= lt!162048 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162037 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162037 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162041 () (_ BitVec 64))

(assert (=> b!342075 (= lt!162041 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!342075 (= lt!162039 (addApplyDifferent!253 lt!162048 lt!162037 minValue!1467 lt!162041))))

(assert (=> b!342075 (= (apply!277 (+!726 lt!162048 (tuple2!5297 lt!162037 minValue!1467)) lt!162041) (apply!277 lt!162048 lt!162041))))

(declare-fun bm!26611 () Bool)

(assert (=> bm!26611 (= call!26611 call!26610)))

(assert (= (and d!70997 c!52769) b!342067))

(assert (= (and d!70997 (not c!52769)) b!342066))

(assert (= (and b!342066 c!52770) b!342062))

(assert (= (and b!342066 (not c!52770)) b!342071))

(assert (= (and b!342071 c!52768) b!342073))

(assert (= (and b!342071 (not c!52768)) b!342063))

(assert (= (or b!342073 b!342063) bm!26607))

(assert (= (or b!342062 bm!26607) bm!26606))

(assert (= (or b!342062 b!342073) bm!26611))

(assert (= (or b!342067 bm!26606) bm!26608))

(assert (= (or b!342067 bm!26611) bm!26605))

(assert (= (and d!70997 res!189088) b!342069))

(assert (= (and d!70997 c!52771) b!342075))

(assert (= (and d!70997 (not c!52771)) b!342057))

(assert (= (and d!70997 res!189090) b!342065))

(assert (= (and b!342065 res!189092) b!342072))

(assert (= (and b!342065 (not res!189085)) b!342059))

(assert (= (and b!342059 res!189086) b!342068))

(assert (= (and b!342065 res!189091) b!342060))

(assert (= (and b!342060 c!52773) b!342074))

(assert (= (and b!342060 (not c!52773)) b!342055))

(assert (= (and b!342074 res!189089) b!342070))

(assert (= (or b!342074 b!342055) bm!26610))

(assert (= (and b!342060 res!189084) b!342058))

(assert (= (and b!342058 c!52772) b!342061))

(assert (= (and b!342058 (not c!52772)) b!342064))

(assert (= (and b!342061 res!189087) b!342056))

(assert (= (or b!342061 b!342064) bm!26609))

(declare-fun b_lambda!8447 () Bool)

(assert (=> (not b_lambda!8447) (not b!342068)))

(declare-fun t!10028 () Bool)

(declare-fun tb!3069 () Bool)

(assert (=> (and start!34270 (= defaultEntry!1528 defaultEntry!1528) t!10028) tb!3069))

(declare-fun result!5537 () Bool)

(assert (=> tb!3069 (= result!5537 tp_is_empty!7221)))

(assert (=> b!342068 t!10028))

(declare-fun b_and!14475 () Bool)

(assert (= b_and!14471 (and (=> t!10028 result!5537) b_and!14475)))

(declare-fun m!344305 () Bool)

(assert (=> b!342070 m!344305))

(assert (=> b!342072 m!344291))

(assert (=> b!342072 m!344291))

(declare-fun m!344307 () Bool)

(assert (=> b!342072 m!344307))

(declare-fun m!344309 () Bool)

(assert (=> bm!26609 m!344309))

(declare-fun m!344311 () Bool)

(assert (=> b!342075 m!344311))

(declare-fun m!344313 () Bool)

(assert (=> b!342075 m!344313))

(declare-fun m!344315 () Bool)

(assert (=> b!342075 m!344315))

(assert (=> b!342075 m!344311))

(declare-fun m!344317 () Bool)

(assert (=> b!342075 m!344317))

(declare-fun m!344319 () Bool)

(assert (=> b!342075 m!344319))

(declare-fun m!344321 () Bool)

(assert (=> b!342075 m!344321))

(assert (=> b!342075 m!344313))

(declare-fun m!344323 () Bool)

(assert (=> b!342075 m!344323))

(declare-fun m!344325 () Bool)

(assert (=> b!342075 m!344325))

(declare-fun m!344327 () Bool)

(assert (=> b!342075 m!344327))

(declare-fun m!344329 () Bool)

(assert (=> b!342075 m!344329))

(assert (=> b!342075 m!344291))

(declare-fun m!344331 () Bool)

(assert (=> b!342075 m!344331))

(declare-fun m!344333 () Bool)

(assert (=> b!342075 m!344333))

(declare-fun m!344335 () Bool)

(assert (=> b!342075 m!344335))

(declare-fun m!344337 () Bool)

(assert (=> b!342075 m!344337))

(declare-fun m!344339 () Bool)

(assert (=> b!342075 m!344339))

(assert (=> b!342075 m!344327))

(assert (=> b!342075 m!344319))

(declare-fun m!344341 () Bool)

(assert (=> b!342075 m!344341))

(declare-fun m!344343 () Bool)

(assert (=> bm!26610 m!344343))

(assert (=> d!70997 m!344249))

(assert (=> b!342069 m!344291))

(assert (=> b!342069 m!344291))

(assert (=> b!342069 m!344307))

(declare-fun m!344345 () Bool)

(assert (=> b!342056 m!344345))

(declare-fun m!344347 () Bool)

(assert (=> b!342067 m!344347))

(assert (=> b!342059 m!344291))

(assert (=> b!342059 m!344291))

(declare-fun m!344349 () Bool)

(assert (=> b!342059 m!344349))

(declare-fun m!344351 () Bool)

(assert (=> bm!26605 m!344351))

(assert (=> bm!26608 m!344323))

(assert (=> b!342068 m!344291))

(declare-fun m!344353 () Bool)

(assert (=> b!342068 m!344353))

(declare-fun m!344355 () Bool)

(assert (=> b!342068 m!344355))

(declare-fun m!344357 () Bool)

(assert (=> b!342068 m!344357))

(assert (=> b!342068 m!344355))

(assert (=> b!342068 m!344357))

(declare-fun m!344359 () Bool)

(assert (=> b!342068 m!344359))

(assert (=> b!342068 m!344291))

(assert (=> b!341948 d!70997))

(declare-fun d!70999 () Bool)

(declare-fun res!189099 () Bool)

(declare-fun e!209784 () Bool)

(assert (=> d!70999 (=> res!189099 e!209784)))

(assert (=> d!70999 (= res!189099 (bvsge #b00000000000000000000000000000000 (size!8891 _keys!1895)))))

(assert (=> d!70999 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4911) e!209784)))

(declare-fun b!342088 () Bool)

(declare-fun e!209785 () Bool)

(declare-fun contains!2177 (List!4914 (_ BitVec 64)) Bool)

(assert (=> b!342088 (= e!209785 (contains!2177 Nil!4911 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342089 () Bool)

(declare-fun e!209787 () Bool)

(assert (=> b!342089 (= e!209784 e!209787)))

(declare-fun res!189100 () Bool)

(assert (=> b!342089 (=> (not res!189100) (not e!209787))))

(assert (=> b!342089 (= res!189100 (not e!209785))))

(declare-fun res!189101 () Bool)

(assert (=> b!342089 (=> (not res!189101) (not e!209785))))

(assert (=> b!342089 (= res!189101 (validKeyInArray!0 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342090 () Bool)

(declare-fun e!209786 () Bool)

(assert (=> b!342090 (= e!209787 e!209786)))

(declare-fun c!52776 () Bool)

(assert (=> b!342090 (= c!52776 (validKeyInArray!0 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26614 () Bool)

(declare-fun call!26617 () Bool)

(assert (=> bm!26614 (= call!26617 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52776 (Cons!4910 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000) Nil!4911) Nil!4911)))))

(declare-fun b!342091 () Bool)

(assert (=> b!342091 (= e!209786 call!26617)))

(declare-fun b!342092 () Bool)

(assert (=> b!342092 (= e!209786 call!26617)))

(assert (= (and d!70999 (not res!189099)) b!342089))

(assert (= (and b!342089 res!189101) b!342088))

(assert (= (and b!342089 res!189100) b!342090))

(assert (= (and b!342090 c!52776) b!342092))

(assert (= (and b!342090 (not c!52776)) b!342091))

(assert (= (or b!342092 b!342091) bm!26614))

(assert (=> b!342088 m!344291))

(assert (=> b!342088 m!344291))

(declare-fun m!344361 () Bool)

(assert (=> b!342088 m!344361))

(assert (=> b!342089 m!344291))

(assert (=> b!342089 m!344291))

(assert (=> b!342089 m!344307))

(assert (=> b!342090 m!344291))

(assert (=> b!342090 m!344291))

(assert (=> b!342090 m!344307))

(assert (=> bm!26614 m!344291))

(declare-fun m!344363 () Bool)

(assert (=> bm!26614 m!344363))

(assert (=> b!341949 d!70999))

(declare-fun b!342106 () Bool)

(declare-fun c!52783 () Bool)

(declare-fun lt!162059 () (_ BitVec 64))

(assert (=> b!342106 (= c!52783 (= lt!162059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!209794 () SeekEntryResult!3296)

(declare-fun e!209796 () SeekEntryResult!3296)

(assert (=> b!342106 (= e!209794 e!209796)))

(declare-fun b!342107 () Bool)

(declare-fun e!209795 () SeekEntryResult!3296)

(assert (=> b!342107 (= e!209795 e!209794)))

(declare-fun lt!162061 () SeekEntryResult!3296)

(assert (=> b!342107 (= lt!162059 (select (arr!8539 _keys!1895) (index!15365 lt!162061)))))

(declare-fun c!52784 () Bool)

(assert (=> b!342107 (= c!52784 (= lt!162059 k0!1348))))

(declare-fun b!342108 () Bool)

(assert (=> b!342108 (= e!209795 Undefined!3296)))

(declare-fun b!342105 () Bool)

(assert (=> b!342105 (= e!209794 (Found!3296 (index!15365 lt!162061)))))

(declare-fun d!71001 () Bool)

(declare-fun lt!162060 () SeekEntryResult!3296)

(assert (=> d!71001 (and (or ((_ is Undefined!3296) lt!162060) (not ((_ is Found!3296) lt!162060)) (and (bvsge (index!15364 lt!162060) #b00000000000000000000000000000000) (bvslt (index!15364 lt!162060) (size!8891 _keys!1895)))) (or ((_ is Undefined!3296) lt!162060) ((_ is Found!3296) lt!162060) (not ((_ is MissingZero!3296) lt!162060)) (and (bvsge (index!15363 lt!162060) #b00000000000000000000000000000000) (bvslt (index!15363 lt!162060) (size!8891 _keys!1895)))) (or ((_ is Undefined!3296) lt!162060) ((_ is Found!3296) lt!162060) ((_ is MissingZero!3296) lt!162060) (not ((_ is MissingVacant!3296) lt!162060)) (and (bvsge (index!15366 lt!162060) #b00000000000000000000000000000000) (bvslt (index!15366 lt!162060) (size!8891 _keys!1895)))) (or ((_ is Undefined!3296) lt!162060) (ite ((_ is Found!3296) lt!162060) (= (select (arr!8539 _keys!1895) (index!15364 lt!162060)) k0!1348) (ite ((_ is MissingZero!3296) lt!162060) (= (select (arr!8539 _keys!1895) (index!15363 lt!162060)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3296) lt!162060) (= (select (arr!8539 _keys!1895) (index!15366 lt!162060)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71001 (= lt!162060 e!209795)))

(declare-fun c!52785 () Bool)

(assert (=> d!71001 (= c!52785 (and ((_ is Intermediate!3296) lt!162061) (undefined!4108 lt!162061)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18039 (_ BitVec 32)) SeekEntryResult!3296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71001 (= lt!162061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71001 (validMask!0 mask!2385)))

(assert (=> d!71001 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162060)))

(declare-fun b!342109 () Bool)

(assert (=> b!342109 (= e!209796 (MissingZero!3296 (index!15365 lt!162061)))))

(declare-fun b!342110 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18039 (_ BitVec 32)) SeekEntryResult!3296)

(assert (=> b!342110 (= e!209796 (seekKeyOrZeroReturnVacant!0 (x!34052 lt!162061) (index!15365 lt!162061) (index!15365 lt!162061) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71001 c!52785) b!342108))

(assert (= (and d!71001 (not c!52785)) b!342107))

(assert (= (and b!342107 c!52784) b!342105))

(assert (= (and b!342107 (not c!52784)) b!342106))

(assert (= (and b!342106 c!52783) b!342109))

(assert (= (and b!342106 (not c!52783)) b!342110))

(declare-fun m!344365 () Bool)

(assert (=> b!342107 m!344365))

(assert (=> d!71001 m!344249))

(declare-fun m!344367 () Bool)

(assert (=> d!71001 m!344367))

(declare-fun m!344369 () Bool)

(assert (=> d!71001 m!344369))

(declare-fun m!344371 () Bool)

(assert (=> d!71001 m!344371))

(assert (=> d!71001 m!344369))

(declare-fun m!344373 () Bool)

(assert (=> d!71001 m!344373))

(declare-fun m!344375 () Bool)

(assert (=> d!71001 m!344375))

(declare-fun m!344377 () Bool)

(assert (=> b!342110 m!344377))

(assert (=> b!341954 d!71001))

(declare-fun b!342119 () Bool)

(declare-fun e!209805 () Bool)

(declare-fun e!209803 () Bool)

(assert (=> b!342119 (= e!209805 e!209803)))

(declare-fun c!52788 () Bool)

(assert (=> b!342119 (= c!52788 (validKeyInArray!0 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342120 () Bool)

(declare-fun e!209804 () Bool)

(declare-fun call!26620 () Bool)

(assert (=> b!342120 (= e!209804 call!26620)))

(declare-fun b!342121 () Bool)

(assert (=> b!342121 (= e!209803 call!26620)))

(declare-fun bm!26617 () Bool)

(assert (=> bm!26617 (= call!26620 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!342122 () Bool)

(assert (=> b!342122 (= e!209803 e!209804)))

(declare-fun lt!162070 () (_ BitVec 64))

(assert (=> b!342122 (= lt!162070 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162069 () Unit!10624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18039 (_ BitVec 64) (_ BitVec 32)) Unit!10624)

(assert (=> b!342122 (= lt!162069 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162070 #b00000000000000000000000000000000))))

(assert (=> b!342122 (arrayContainsKey!0 _keys!1895 lt!162070 #b00000000000000000000000000000000)))

(declare-fun lt!162068 () Unit!10624)

(assert (=> b!342122 (= lt!162068 lt!162069)))

(declare-fun res!189107 () Bool)

(assert (=> b!342122 (= res!189107 (= (seekEntryOrOpen!0 (select (arr!8539 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3296 #b00000000000000000000000000000000)))))

(assert (=> b!342122 (=> (not res!189107) (not e!209804))))

(declare-fun d!71003 () Bool)

(declare-fun res!189106 () Bool)

(assert (=> d!71003 (=> res!189106 e!209805)))

(assert (=> d!71003 (= res!189106 (bvsge #b00000000000000000000000000000000 (size!8891 _keys!1895)))))

(assert (=> d!71003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!209805)))

(assert (= (and d!71003 (not res!189106)) b!342119))

(assert (= (and b!342119 c!52788) b!342122))

(assert (= (and b!342119 (not c!52788)) b!342121))

(assert (= (and b!342122 res!189107) b!342120))

(assert (= (or b!342120 b!342121) bm!26617))

(assert (=> b!342119 m!344291))

(assert (=> b!342119 m!344291))

(assert (=> b!342119 m!344307))

(declare-fun m!344379 () Bool)

(assert (=> bm!26617 m!344379))

(assert (=> b!342122 m!344291))

(declare-fun m!344381 () Bool)

(assert (=> b!342122 m!344381))

(declare-fun m!344383 () Bool)

(assert (=> b!342122 m!344383))

(assert (=> b!342122 m!344291))

(declare-fun m!344385 () Bool)

(assert (=> b!342122 m!344385))

(assert (=> b!341950 d!71003))

(declare-fun condMapEmpty!12267 () Bool)

(declare-fun mapDefault!12267 () ValueCell!3267)

(assert (=> mapNonEmpty!12261 (= condMapEmpty!12267 (= mapRest!12261 ((as const (Array (_ BitVec 32) ValueCell!3267)) mapDefault!12267)))))

(declare-fun e!209811 () Bool)

(declare-fun mapRes!12267 () Bool)

(assert (=> mapNonEmpty!12261 (= tp!25343 (and e!209811 mapRes!12267))))

(declare-fun mapIsEmpty!12267 () Bool)

(assert (=> mapIsEmpty!12267 mapRes!12267))

(declare-fun b!342129 () Bool)

(declare-fun e!209810 () Bool)

(assert (=> b!342129 (= e!209810 tp_is_empty!7221)))

(declare-fun mapNonEmpty!12267 () Bool)

(declare-fun tp!25353 () Bool)

(assert (=> mapNonEmpty!12267 (= mapRes!12267 (and tp!25353 e!209810))))

(declare-fun mapRest!12267 () (Array (_ BitVec 32) ValueCell!3267))

(declare-fun mapValue!12267 () ValueCell!3267)

(declare-fun mapKey!12267 () (_ BitVec 32))

(assert (=> mapNonEmpty!12267 (= mapRest!12261 (store mapRest!12267 mapKey!12267 mapValue!12267))))

(declare-fun b!342130 () Bool)

(assert (=> b!342130 (= e!209811 tp_is_empty!7221)))

(assert (= (and mapNonEmpty!12261 condMapEmpty!12267) mapIsEmpty!12267))

(assert (= (and mapNonEmpty!12261 (not condMapEmpty!12267)) mapNonEmpty!12267))

(assert (= (and mapNonEmpty!12267 ((_ is ValueCellFull!3267) mapValue!12267)) b!342129))

(assert (= (and mapNonEmpty!12261 ((_ is ValueCellFull!3267) mapDefault!12267)) b!342130))

(declare-fun m!344387 () Bool)

(assert (=> mapNonEmpty!12267 m!344387))

(declare-fun b_lambda!8449 () Bool)

(assert (= b_lambda!8447 (or (and start!34270 b_free!7269) b_lambda!8449)))

(check-sat (not b!342088) (not d!71001) (not b!342067) (not b!342122) (not d!70997) (not mapNonEmpty!12267) b_and!14475 (not b!342119) (not b!342089) (not b!342010) (not b!342070) (not bm!26610) (not bm!26608) (not b!342068) (not bm!26617) (not b!341997) (not b!342072) (not b_next!7269) (not d!70995) (not b!342110) (not b!342075) (not b_lambda!8449) (not b!342012) (not bm!26605) (not b!342069) (not b!342003) (not b!342056) (not b!342059) (not bm!26614) (not b!342090) tp_is_empty!7221 (not bm!26609) (not d!70983))
(check-sat b_and!14475 (not b_next!7269))
