; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33536 () Bool)

(assert start!33536)

(declare-fun b_free!6825 () Bool)

(declare-fun b_next!6825 () Bool)

(assert (=> start!33536 (= b_free!6825 (not b_next!6825))))

(declare-fun tp!23969 () Bool)

(declare-fun b_and!13999 () Bool)

(assert (=> start!33536 (= tp!23969 b_and!13999)))

(declare-fun b!332852 () Bool)

(declare-fun e!204391 () Bool)

(declare-fun tp_is_empty!6777 () Bool)

(assert (=> b!332852 (= e!204391 tp_is_empty!6777)))

(declare-fun b!332853 () Bool)

(declare-fun res!183394 () Bool)

(declare-fun e!204389 () Bool)

(assert (=> b!332853 (=> (not res!183394) (not e!204389))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332853 (= res!183394 (validKeyInArray!0 k0!1348))))

(declare-fun res!183396 () Bool)

(assert (=> start!33536 (=> (not res!183396) (not e!204389))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33536 (= res!183396 (validMask!0 mask!2385))))

(assert (=> start!33536 e!204389))

(assert (=> start!33536 true))

(assert (=> start!33536 tp_is_empty!6777))

(assert (=> start!33536 tp!23969))

(declare-datatypes ((V!10013 0))(
  ( (V!10014 (val!3433 Int)) )
))
(declare-datatypes ((ValueCell!3045 0))(
  ( (ValueCellFull!3045 (v!5592 V!10013)) (EmptyCell!3045) )
))
(declare-datatypes ((array!17147 0))(
  ( (array!17148 (arr!8107 (Array (_ BitVec 32) ValueCell!3045)) (size!8459 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17147)

(declare-fun e!204393 () Bool)

(declare-fun array_inv!6036 (array!17147) Bool)

(assert (=> start!33536 (and (array_inv!6036 _values!1525) e!204393)))

(declare-datatypes ((array!17149 0))(
  ( (array!17150 (arr!8108 (Array (_ BitVec 32) (_ BitVec 64))) (size!8460 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17149)

(declare-fun array_inv!6037 (array!17149) Bool)

(assert (=> start!33536 (array_inv!6037 _keys!1895)))

(declare-fun b!332854 () Bool)

(declare-fun res!183398 () Bool)

(assert (=> b!332854 (=> (not res!183398) (not e!204389))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332854 (= res!183398 (and (= (size!8459 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8460 _keys!1895) (size!8459 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332855 () Bool)

(declare-fun e!204392 () Bool)

(assert (=> b!332855 (= e!204392 tp_is_empty!6777)))

(declare-fun b!332856 () Bool)

(declare-fun res!183397 () Bool)

(assert (=> b!332856 (=> (not res!183397) (not e!204389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17149 (_ BitVec 32)) Bool)

(assert (=> b!332856 (= res!183397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332857 () Bool)

(declare-fun res!183393 () Bool)

(assert (=> b!332857 (=> (not res!183393) (not e!204389))))

(declare-datatypes ((List!4612 0))(
  ( (Nil!4609) (Cons!4608 (h!5464 (_ BitVec 64)) (t!9694 List!4612)) )
))
(declare-fun arrayNoDuplicates!0 (array!17149 (_ BitVec 32) List!4612) Bool)

(assert (=> b!332857 (= res!183393 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4609))))

(declare-fun mapIsEmpty!11553 () Bool)

(declare-fun mapRes!11553 () Bool)

(assert (=> mapIsEmpty!11553 mapRes!11553))

(declare-datatypes ((SeekEntryResult!3133 0))(
  ( (MissingZero!3133 (index!14711 (_ BitVec 32))) (Found!3133 (index!14712 (_ BitVec 32))) (Intermediate!3133 (undefined!3945 Bool) (index!14713 (_ BitVec 32)) (x!33157 (_ BitVec 32))) (Undefined!3133) (MissingVacant!3133 (index!14714 (_ BitVec 32))) )
))
(declare-fun lt!159052 () SeekEntryResult!3133)

(declare-fun b!332858 () Bool)

(get-info :version)

(assert (=> b!332858 (= e!204389 (and ((_ is Found!3133) lt!159052) (= (select (arr!8108 _keys!1895) (index!14712 lt!159052)) k0!1348) (bvslt (index!14712 lt!159052) #b00000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17149 (_ BitVec 32)) SeekEntryResult!3133)

(assert (=> b!332858 (= lt!159052 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332859 () Bool)

(declare-fun res!183395 () Bool)

(assert (=> b!332859 (=> (not res!183395) (not e!204389))))

(declare-fun zeroValue!1467 () V!10013)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10013)

(declare-datatypes ((tuple2!4998 0))(
  ( (tuple2!4999 (_1!2510 (_ BitVec 64)) (_2!2510 V!10013)) )
))
(declare-datatypes ((List!4613 0))(
  ( (Nil!4610) (Cons!4609 (h!5465 tuple2!4998) (t!9695 List!4613)) )
))
(declare-datatypes ((ListLongMap!3911 0))(
  ( (ListLongMap!3912 (toList!1971 List!4613)) )
))
(declare-fun contains!2012 (ListLongMap!3911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1499 (array!17149 array!17147 (_ BitVec 32) (_ BitVec 32) V!10013 V!10013 (_ BitVec 32) Int) ListLongMap!3911)

(assert (=> b!332859 (= res!183395 (not (contains!2012 (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11553 () Bool)

(declare-fun tp!23970 () Bool)

(assert (=> mapNonEmpty!11553 (= mapRes!11553 (and tp!23970 e!204392))))

(declare-fun mapValue!11553 () ValueCell!3045)

(declare-fun mapKey!11553 () (_ BitVec 32))

(declare-fun mapRest!11553 () (Array (_ BitVec 32) ValueCell!3045))

(assert (=> mapNonEmpty!11553 (= (arr!8107 _values!1525) (store mapRest!11553 mapKey!11553 mapValue!11553))))

(declare-fun b!332860 () Bool)

(assert (=> b!332860 (= e!204393 (and e!204391 mapRes!11553))))

(declare-fun condMapEmpty!11553 () Bool)

(declare-fun mapDefault!11553 () ValueCell!3045)

(assert (=> b!332860 (= condMapEmpty!11553 (= (arr!8107 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3045)) mapDefault!11553)))))

(assert (= (and start!33536 res!183396) b!332854))

(assert (= (and b!332854 res!183398) b!332856))

(assert (= (and b!332856 res!183397) b!332857))

(assert (= (and b!332857 res!183393) b!332853))

(assert (= (and b!332853 res!183394) b!332859))

(assert (= (and b!332859 res!183395) b!332858))

(assert (= (and b!332860 condMapEmpty!11553) mapIsEmpty!11553))

(assert (= (and b!332860 (not condMapEmpty!11553)) mapNonEmpty!11553))

(assert (= (and mapNonEmpty!11553 ((_ is ValueCellFull!3045) mapValue!11553)) b!332855))

(assert (= (and b!332860 ((_ is ValueCellFull!3045) mapDefault!11553)) b!332852))

(assert (= start!33536 b!332860))

(declare-fun m!337243 () Bool)

(assert (=> mapNonEmpty!11553 m!337243))

(declare-fun m!337245 () Bool)

(assert (=> b!332853 m!337245))

(declare-fun m!337247 () Bool)

(assert (=> b!332858 m!337247))

(declare-fun m!337249 () Bool)

(assert (=> b!332858 m!337249))

(declare-fun m!337251 () Bool)

(assert (=> start!33536 m!337251))

(declare-fun m!337253 () Bool)

(assert (=> start!33536 m!337253))

(declare-fun m!337255 () Bool)

(assert (=> start!33536 m!337255))

(declare-fun m!337257 () Bool)

(assert (=> b!332856 m!337257))

(declare-fun m!337259 () Bool)

(assert (=> b!332859 m!337259))

(assert (=> b!332859 m!337259))

(declare-fun m!337261 () Bool)

(assert (=> b!332859 m!337261))

(declare-fun m!337263 () Bool)

(assert (=> b!332857 m!337263))

(check-sat (not b!332859) (not mapNonEmpty!11553) (not b!332856) (not b!332853) (not b!332857) tp_is_empty!6777 b_and!13999 (not b!332858) (not b_next!6825) (not start!33536))
(check-sat b_and!13999 (not b_next!6825))
(get-model)

(declare-fun d!70543 () Bool)

(assert (=> d!70543 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332853 d!70543))

(declare-fun b!332900 () Bool)

(declare-fun c!52095 () Bool)

(declare-fun lt!159062 () (_ BitVec 64))

(assert (=> b!332900 (= c!52095 (= lt!159062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!204417 () SeekEntryResult!3133)

(declare-fun e!204415 () SeekEntryResult!3133)

(assert (=> b!332900 (= e!204417 e!204415)))

(declare-fun d!70545 () Bool)

(declare-fun lt!159063 () SeekEntryResult!3133)

(assert (=> d!70545 (and (or ((_ is Undefined!3133) lt!159063) (not ((_ is Found!3133) lt!159063)) (and (bvsge (index!14712 lt!159063) #b00000000000000000000000000000000) (bvslt (index!14712 lt!159063) (size!8460 _keys!1895)))) (or ((_ is Undefined!3133) lt!159063) ((_ is Found!3133) lt!159063) (not ((_ is MissingZero!3133) lt!159063)) (and (bvsge (index!14711 lt!159063) #b00000000000000000000000000000000) (bvslt (index!14711 lt!159063) (size!8460 _keys!1895)))) (or ((_ is Undefined!3133) lt!159063) ((_ is Found!3133) lt!159063) ((_ is MissingZero!3133) lt!159063) (not ((_ is MissingVacant!3133) lt!159063)) (and (bvsge (index!14714 lt!159063) #b00000000000000000000000000000000) (bvslt (index!14714 lt!159063) (size!8460 _keys!1895)))) (or ((_ is Undefined!3133) lt!159063) (ite ((_ is Found!3133) lt!159063) (= (select (arr!8108 _keys!1895) (index!14712 lt!159063)) k0!1348) (ite ((_ is MissingZero!3133) lt!159063) (= (select (arr!8108 _keys!1895) (index!14711 lt!159063)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3133) lt!159063) (= (select (arr!8108 _keys!1895) (index!14714 lt!159063)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!204416 () SeekEntryResult!3133)

(assert (=> d!70545 (= lt!159063 e!204416)))

(declare-fun c!52093 () Bool)

(declare-fun lt!159064 () SeekEntryResult!3133)

(assert (=> d!70545 (= c!52093 (and ((_ is Intermediate!3133) lt!159064) (undefined!3945 lt!159064)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17149 (_ BitVec 32)) SeekEntryResult!3133)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70545 (= lt!159064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70545 (validMask!0 mask!2385)))

(assert (=> d!70545 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159063)))

(declare-fun b!332901 () Bool)

(assert (=> b!332901 (= e!204416 e!204417)))

(assert (=> b!332901 (= lt!159062 (select (arr!8108 _keys!1895) (index!14713 lt!159064)))))

(declare-fun c!52094 () Bool)

(assert (=> b!332901 (= c!52094 (= lt!159062 k0!1348))))

(declare-fun b!332902 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17149 (_ BitVec 32)) SeekEntryResult!3133)

(assert (=> b!332902 (= e!204415 (seekKeyOrZeroReturnVacant!0 (x!33157 lt!159064) (index!14713 lt!159064) (index!14713 lt!159064) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332903 () Bool)

(assert (=> b!332903 (= e!204417 (Found!3133 (index!14713 lt!159064)))))

(declare-fun b!332904 () Bool)

(assert (=> b!332904 (= e!204415 (MissingZero!3133 (index!14713 lt!159064)))))

(declare-fun b!332905 () Bool)

(assert (=> b!332905 (= e!204416 Undefined!3133)))

(assert (= (and d!70545 c!52093) b!332905))

(assert (= (and d!70545 (not c!52093)) b!332901))

(assert (= (and b!332901 c!52094) b!332903))

(assert (= (and b!332901 (not c!52094)) b!332900))

(assert (= (and b!332900 c!52095) b!332904))

(assert (= (and b!332900 (not c!52095)) b!332902))

(declare-fun m!337287 () Bool)

(assert (=> d!70545 m!337287))

(declare-fun m!337289 () Bool)

(assert (=> d!70545 m!337289))

(declare-fun m!337291 () Bool)

(assert (=> d!70545 m!337291))

(declare-fun m!337293 () Bool)

(assert (=> d!70545 m!337293))

(assert (=> d!70545 m!337287))

(assert (=> d!70545 m!337251))

(declare-fun m!337295 () Bool)

(assert (=> d!70545 m!337295))

(declare-fun m!337297 () Bool)

(assert (=> b!332901 m!337297))

(declare-fun m!337299 () Bool)

(assert (=> b!332902 m!337299))

(assert (=> b!332858 d!70545))

(declare-fun d!70547 () Bool)

(declare-fun e!204423 () Bool)

(assert (=> d!70547 e!204423))

(declare-fun res!183419 () Bool)

(assert (=> d!70547 (=> res!183419 e!204423)))

(declare-fun lt!159075 () Bool)

(assert (=> d!70547 (= res!183419 (not lt!159075))))

(declare-fun lt!159073 () Bool)

(assert (=> d!70547 (= lt!159075 lt!159073)))

(declare-datatypes ((Unit!10361 0))(
  ( (Unit!10362) )
))
(declare-fun lt!159074 () Unit!10361)

(declare-fun e!204422 () Unit!10361)

(assert (=> d!70547 (= lt!159074 e!204422)))

(declare-fun c!52098 () Bool)

(assert (=> d!70547 (= c!52098 lt!159073)))

(declare-fun containsKey!313 (List!4613 (_ BitVec 64)) Bool)

(assert (=> d!70547 (= lt!159073 (containsKey!313 (toList!1971 (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70547 (= (contains!2012 (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159075)))

(declare-fun b!332912 () Bool)

(declare-fun lt!159076 () Unit!10361)

(assert (=> b!332912 (= e!204422 lt!159076)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!261 (List!4613 (_ BitVec 64)) Unit!10361)

(assert (=> b!332912 (= lt!159076 (lemmaContainsKeyImpliesGetValueByKeyDefined!261 (toList!1971 (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!327 0))(
  ( (Some!326 (v!5594 V!10013)) (None!325) )
))
(declare-fun isDefined!262 (Option!327) Bool)

(declare-fun getValueByKey!321 (List!4613 (_ BitVec 64)) Option!327)

(assert (=> b!332912 (isDefined!262 (getValueByKey!321 (toList!1971 (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!332913 () Bool)

(declare-fun Unit!10363 () Unit!10361)

(assert (=> b!332913 (= e!204422 Unit!10363)))

(declare-fun b!332914 () Bool)

(assert (=> b!332914 (= e!204423 (isDefined!262 (getValueByKey!321 (toList!1971 (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70547 c!52098) b!332912))

(assert (= (and d!70547 (not c!52098)) b!332913))

(assert (= (and d!70547 (not res!183419)) b!332914))

(declare-fun m!337301 () Bool)

(assert (=> d!70547 m!337301))

(declare-fun m!337303 () Bool)

(assert (=> b!332912 m!337303))

(declare-fun m!337305 () Bool)

(assert (=> b!332912 m!337305))

(assert (=> b!332912 m!337305))

(declare-fun m!337307 () Bool)

(assert (=> b!332912 m!337307))

(assert (=> b!332914 m!337305))

(assert (=> b!332914 m!337305))

(assert (=> b!332914 m!337307))

(assert (=> b!332859 d!70547))

(declare-fun bm!26227 () Bool)

(declare-fun call!26230 () ListLongMap!3911)

(declare-fun call!26235 () ListLongMap!3911)

(assert (=> bm!26227 (= call!26230 call!26235)))

(declare-fun bm!26228 () Bool)

(declare-fun call!26234 () Bool)

(declare-fun lt!159126 () ListLongMap!3911)

(assert (=> bm!26228 (= call!26234 (contains!2012 lt!159126 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332958 () Bool)

(declare-fun e!204462 () Bool)

(declare-fun e!204457 () Bool)

(assert (=> b!332958 (= e!204462 e!204457)))

(declare-fun res!183440 () Bool)

(assert (=> b!332958 (=> (not res!183440) (not e!204457))))

(assert (=> b!332958 (= res!183440 (contains!2012 lt!159126 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!332958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8460 _keys!1895)))))

(declare-fun b!332959 () Bool)

(declare-fun e!204459 () ListLongMap!3911)

(assert (=> b!332959 (= e!204459 call!26230)))

(declare-fun b!332960 () Bool)

(declare-fun e!204450 () ListLongMap!3911)

(declare-fun call!26231 () ListLongMap!3911)

(assert (=> b!332960 (= e!204450 call!26231)))

(declare-fun call!26232 () ListLongMap!3911)

(declare-fun bm!26229 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!585 (array!17149 array!17147 (_ BitVec 32) (_ BitVec 32) V!10013 V!10013 (_ BitVec 32) Int) ListLongMap!3911)

(assert (=> bm!26229 (= call!26232 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun call!26233 () ListLongMap!3911)

(declare-fun c!52116 () Bool)

(declare-fun c!52113 () Bool)

(declare-fun bm!26230 () Bool)

(declare-fun +!712 (ListLongMap!3911 tuple2!4998) ListLongMap!3911)

(assert (=> bm!26230 (= call!26235 (+!712 (ite c!52116 call!26232 (ite c!52113 call!26233 call!26231)) (ite (or c!52116 c!52113) (tuple2!4999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!4999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!332961 () Bool)

(declare-fun e!204452 () Bool)

(assert (=> b!332961 (= e!204452 (validKeyInArray!0 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332962 () Bool)

(declare-fun e!204453 () Bool)

(declare-fun e!204455 () Bool)

(assert (=> b!332962 (= e!204453 e!204455)))

(declare-fun c!52112 () Bool)

(assert (=> b!332962 (= c!52112 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!332963 () Bool)

(declare-fun e!204460 () Bool)

(declare-fun call!26236 () Bool)

(assert (=> b!332963 (= e!204460 (not call!26236))))

(declare-fun b!332964 () Bool)

(assert (=> b!332964 (= e!204455 (not call!26234))))

(declare-fun b!332965 () Bool)

(declare-fun e!204451 () Bool)

(declare-fun apply!263 (ListLongMap!3911 (_ BitVec 64)) V!10013)

(assert (=> b!332965 (= e!204451 (= (apply!263 lt!159126 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26231 () Bool)

(assert (=> bm!26231 (= call!26236 (contains!2012 lt!159126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332966 () Bool)

(declare-fun get!4467 (ValueCell!3045 V!10013) V!10013)

(declare-fun dynLambda!606 (Int (_ BitVec 64)) V!10013)

(assert (=> b!332966 (= e!204457 (= (apply!263 lt!159126 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)) (get!4467 (select (arr!8107 _values!1525) #b00000000000000000000000000000000) (dynLambda!606 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8459 _values!1525)))))

(assert (=> b!332966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8460 _keys!1895)))))

(declare-fun d!70549 () Bool)

(assert (=> d!70549 e!204453))

(declare-fun res!183446 () Bool)

(assert (=> d!70549 (=> (not res!183446) (not e!204453))))

(assert (=> d!70549 (= res!183446 (or (bvsge #b00000000000000000000000000000000 (size!8460 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8460 _keys!1895)))))))

(declare-fun lt!159135 () ListLongMap!3911)

(assert (=> d!70549 (= lt!159126 lt!159135)))

(declare-fun lt!159123 () Unit!10361)

(declare-fun e!204461 () Unit!10361)

(assert (=> d!70549 (= lt!159123 e!204461)))

(declare-fun c!52111 () Bool)

(declare-fun e!204456 () Bool)

(assert (=> d!70549 (= c!52111 e!204456)))

(declare-fun res!183442 () Bool)

(assert (=> d!70549 (=> (not res!183442) (not e!204456))))

(assert (=> d!70549 (= res!183442 (bvslt #b00000000000000000000000000000000 (size!8460 _keys!1895)))))

(declare-fun e!204454 () ListLongMap!3911)

(assert (=> d!70549 (= lt!159135 e!204454)))

(assert (=> d!70549 (= c!52116 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70549 (validMask!0 mask!2385)))

(assert (=> d!70549 (= (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159126)))

(declare-fun b!332957 () Bool)

(declare-fun e!204458 () Bool)

(assert (=> b!332957 (= e!204458 (= (apply!263 lt!159126 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!332967 () Bool)

(declare-fun c!52115 () Bool)

(assert (=> b!332967 (= c!52115 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!332967 (= e!204459 e!204450)))

(declare-fun b!332968 () Bool)

(assert (=> b!332968 (= e!204460 e!204451)))

(declare-fun res!183444 () Bool)

(assert (=> b!332968 (= res!183444 call!26236)))

(assert (=> b!332968 (=> (not res!183444) (not e!204451))))

(declare-fun b!332969 () Bool)

(assert (=> b!332969 (= e!204450 call!26230)))

(declare-fun b!332970 () Bool)

(assert (=> b!332970 (= e!204455 e!204458)))

(declare-fun res!183441 () Bool)

(assert (=> b!332970 (= res!183441 call!26234)))

(assert (=> b!332970 (=> (not res!183441) (not e!204458))))

(declare-fun b!332971 () Bool)

(assert (=> b!332971 (= e!204456 (validKeyInArray!0 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332972 () Bool)

(declare-fun lt!159140 () Unit!10361)

(assert (=> b!332972 (= e!204461 lt!159140)))

(declare-fun lt!159136 () ListLongMap!3911)

(assert (=> b!332972 (= lt!159136 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159125 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159125 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159139 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159139 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159124 () Unit!10361)

(declare-fun addStillContains!239 (ListLongMap!3911 (_ BitVec 64) V!10013 (_ BitVec 64)) Unit!10361)

(assert (=> b!332972 (= lt!159124 (addStillContains!239 lt!159136 lt!159125 zeroValue!1467 lt!159139))))

(assert (=> b!332972 (contains!2012 (+!712 lt!159136 (tuple2!4999 lt!159125 zeroValue!1467)) lt!159139)))

(declare-fun lt!159121 () Unit!10361)

(assert (=> b!332972 (= lt!159121 lt!159124)))

(declare-fun lt!159127 () ListLongMap!3911)

(assert (=> b!332972 (= lt!159127 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159129 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159129 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159122 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159122 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159131 () Unit!10361)

(declare-fun addApplyDifferent!239 (ListLongMap!3911 (_ BitVec 64) V!10013 (_ BitVec 64)) Unit!10361)

(assert (=> b!332972 (= lt!159131 (addApplyDifferent!239 lt!159127 lt!159129 minValue!1467 lt!159122))))

(assert (=> b!332972 (= (apply!263 (+!712 lt!159127 (tuple2!4999 lt!159129 minValue!1467)) lt!159122) (apply!263 lt!159127 lt!159122))))

(declare-fun lt!159141 () Unit!10361)

(assert (=> b!332972 (= lt!159141 lt!159131)))

(declare-fun lt!159134 () ListLongMap!3911)

(assert (=> b!332972 (= lt!159134 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159132 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159130 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159130 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159142 () Unit!10361)

(assert (=> b!332972 (= lt!159142 (addApplyDifferent!239 lt!159134 lt!159132 zeroValue!1467 lt!159130))))

(assert (=> b!332972 (= (apply!263 (+!712 lt!159134 (tuple2!4999 lt!159132 zeroValue!1467)) lt!159130) (apply!263 lt!159134 lt!159130))))

(declare-fun lt!159133 () Unit!10361)

(assert (=> b!332972 (= lt!159133 lt!159142)))

(declare-fun lt!159128 () ListLongMap!3911)

(assert (=> b!332972 (= lt!159128 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159137 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159137 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159138 () (_ BitVec 64))

(assert (=> b!332972 (= lt!159138 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!332972 (= lt!159140 (addApplyDifferent!239 lt!159128 lt!159137 minValue!1467 lt!159138))))

(assert (=> b!332972 (= (apply!263 (+!712 lt!159128 (tuple2!4999 lt!159137 minValue!1467)) lt!159138) (apply!263 lt!159128 lt!159138))))

(declare-fun b!332973 () Bool)

(declare-fun Unit!10364 () Unit!10361)

(assert (=> b!332973 (= e!204461 Unit!10364)))

(declare-fun bm!26232 () Bool)

(assert (=> bm!26232 (= call!26233 call!26232)))

(declare-fun b!332974 () Bool)

(assert (=> b!332974 (= e!204454 (+!712 call!26235 (tuple2!4999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!332975 () Bool)

(declare-fun res!183439 () Bool)

(assert (=> b!332975 (=> (not res!183439) (not e!204453))))

(assert (=> b!332975 (= res!183439 e!204462)))

(declare-fun res!183443 () Bool)

(assert (=> b!332975 (=> res!183443 e!204462)))

(assert (=> b!332975 (= res!183443 (not e!204452))))

(declare-fun res!183438 () Bool)

(assert (=> b!332975 (=> (not res!183438) (not e!204452))))

(assert (=> b!332975 (= res!183438 (bvslt #b00000000000000000000000000000000 (size!8460 _keys!1895)))))

(declare-fun bm!26233 () Bool)

(assert (=> bm!26233 (= call!26231 call!26233)))

(declare-fun b!332976 () Bool)

(assert (=> b!332976 (= e!204454 e!204459)))

(assert (=> b!332976 (= c!52113 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!332977 () Bool)

(declare-fun res!183445 () Bool)

(assert (=> b!332977 (=> (not res!183445) (not e!204453))))

(assert (=> b!332977 (= res!183445 e!204460)))

(declare-fun c!52114 () Bool)

(assert (=> b!332977 (= c!52114 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!70549 c!52116) b!332974))

(assert (= (and d!70549 (not c!52116)) b!332976))

(assert (= (and b!332976 c!52113) b!332959))

(assert (= (and b!332976 (not c!52113)) b!332967))

(assert (= (and b!332967 c!52115) b!332969))

(assert (= (and b!332967 (not c!52115)) b!332960))

(assert (= (or b!332969 b!332960) bm!26233))

(assert (= (or b!332959 bm!26233) bm!26232))

(assert (= (or b!332959 b!332969) bm!26227))

(assert (= (or b!332974 bm!26232) bm!26229))

(assert (= (or b!332974 bm!26227) bm!26230))

(assert (= (and d!70549 res!183442) b!332971))

(assert (= (and d!70549 c!52111) b!332972))

(assert (= (and d!70549 (not c!52111)) b!332973))

(assert (= (and d!70549 res!183446) b!332975))

(assert (= (and b!332975 res!183438) b!332961))

(assert (= (and b!332975 (not res!183443)) b!332958))

(assert (= (and b!332958 res!183440) b!332966))

(assert (= (and b!332975 res!183439) b!332977))

(assert (= (and b!332977 c!52114) b!332968))

(assert (= (and b!332977 (not c!52114)) b!332963))

(assert (= (and b!332968 res!183444) b!332965))

(assert (= (or b!332968 b!332963) bm!26231))

(assert (= (and b!332977 res!183445) b!332962))

(assert (= (and b!332962 c!52112) b!332970))

(assert (= (and b!332962 (not c!52112)) b!332964))

(assert (= (and b!332970 res!183441) b!332957))

(assert (= (or b!332970 b!332964) bm!26228))

(declare-fun b_lambda!8391 () Bool)

(assert (=> (not b_lambda!8391) (not b!332966)))

(declare-fun t!9699 () Bool)

(declare-fun tb!3041 () Bool)

(assert (=> (and start!33536 (= defaultEntry!1528 defaultEntry!1528) t!9699) tb!3041))

(declare-fun result!5453 () Bool)

(assert (=> tb!3041 (= result!5453 tp_is_empty!6777)))

(assert (=> b!332966 t!9699))

(declare-fun b_and!14003 () Bool)

(assert (= b_and!13999 (and (=> t!9699 result!5453) b_and!14003)))

(declare-fun m!337309 () Bool)

(assert (=> b!332965 m!337309))

(declare-fun m!337311 () Bool)

(assert (=> b!332974 m!337311))

(declare-fun m!337313 () Bool)

(assert (=> bm!26230 m!337313))

(declare-fun m!337315 () Bool)

(assert (=> b!332958 m!337315))

(assert (=> b!332958 m!337315))

(declare-fun m!337317 () Bool)

(assert (=> b!332958 m!337317))

(declare-fun m!337319 () Bool)

(assert (=> b!332966 m!337319))

(assert (=> b!332966 m!337315))

(declare-fun m!337321 () Bool)

(assert (=> b!332966 m!337321))

(declare-fun m!337323 () Bool)

(assert (=> b!332966 m!337323))

(assert (=> b!332966 m!337319))

(declare-fun m!337325 () Bool)

(assert (=> b!332966 m!337325))

(assert (=> b!332966 m!337323))

(assert (=> b!332966 m!337315))

(assert (=> b!332971 m!337315))

(assert (=> b!332971 m!337315))

(declare-fun m!337327 () Bool)

(assert (=> b!332971 m!337327))

(declare-fun m!337329 () Bool)

(assert (=> bm!26231 m!337329))

(declare-fun m!337331 () Bool)

(assert (=> bm!26229 m!337331))

(declare-fun m!337333 () Bool)

(assert (=> b!332972 m!337333))

(declare-fun m!337335 () Bool)

(assert (=> b!332972 m!337335))

(declare-fun m!337337 () Bool)

(assert (=> b!332972 m!337337))

(declare-fun m!337339 () Bool)

(assert (=> b!332972 m!337339))

(declare-fun m!337341 () Bool)

(assert (=> b!332972 m!337341))

(declare-fun m!337343 () Bool)

(assert (=> b!332972 m!337343))

(declare-fun m!337345 () Bool)

(assert (=> b!332972 m!337345))

(declare-fun m!337347 () Bool)

(assert (=> b!332972 m!337347))

(declare-fun m!337349 () Bool)

(assert (=> b!332972 m!337349))

(declare-fun m!337351 () Bool)

(assert (=> b!332972 m!337351))

(assert (=> b!332972 m!337315))

(assert (=> b!332972 m!337339))

(declare-fun m!337353 () Bool)

(assert (=> b!332972 m!337353))

(assert (=> b!332972 m!337331))

(assert (=> b!332972 m!337335))

(declare-fun m!337355 () Bool)

(assert (=> b!332972 m!337355))

(assert (=> b!332972 m!337347))

(declare-fun m!337357 () Bool)

(assert (=> b!332972 m!337357))

(assert (=> b!332972 m!337343))

(declare-fun m!337359 () Bool)

(assert (=> b!332972 m!337359))

(declare-fun m!337361 () Bool)

(assert (=> b!332972 m!337361))

(assert (=> b!332961 m!337315))

(assert (=> b!332961 m!337315))

(assert (=> b!332961 m!337327))

(declare-fun m!337363 () Bool)

(assert (=> b!332957 m!337363))

(assert (=> d!70549 m!337251))

(declare-fun m!337365 () Bool)

(assert (=> bm!26228 m!337365))

(assert (=> b!332859 d!70549))

(declare-fun b!332988 () Bool)

(declare-fun e!204469 () Bool)

(declare-fun call!26239 () Bool)

(assert (=> b!332988 (= e!204469 call!26239)))

(declare-fun d!70551 () Bool)

(declare-fun res!183452 () Bool)

(declare-fun e!204471 () Bool)

(assert (=> d!70551 (=> res!183452 e!204471)))

(assert (=> d!70551 (= res!183452 (bvsge #b00000000000000000000000000000000 (size!8460 _keys!1895)))))

(assert (=> d!70551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204471)))

(declare-fun b!332989 () Bool)

(declare-fun e!204470 () Bool)

(assert (=> b!332989 (= e!204470 call!26239)))

(declare-fun b!332990 () Bool)

(assert (=> b!332990 (= e!204471 e!204469)))

(declare-fun c!52119 () Bool)

(assert (=> b!332990 (= c!52119 (validKeyInArray!0 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332991 () Bool)

(assert (=> b!332991 (= e!204469 e!204470)))

(declare-fun lt!159151 () (_ BitVec 64))

(assert (=> b!332991 (= lt!159151 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159150 () Unit!10361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17149 (_ BitVec 64) (_ BitVec 32)) Unit!10361)

(assert (=> b!332991 (= lt!159150 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159151 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!332991 (arrayContainsKey!0 _keys!1895 lt!159151 #b00000000000000000000000000000000)))

(declare-fun lt!159149 () Unit!10361)

(assert (=> b!332991 (= lt!159149 lt!159150)))

(declare-fun res!183451 () Bool)

(assert (=> b!332991 (= res!183451 (= (seekEntryOrOpen!0 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3133 #b00000000000000000000000000000000)))))

(assert (=> b!332991 (=> (not res!183451) (not e!204470))))

(declare-fun bm!26236 () Bool)

(assert (=> bm!26236 (= call!26239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!70551 (not res!183452)) b!332990))

(assert (= (and b!332990 c!52119) b!332991))

(assert (= (and b!332990 (not c!52119)) b!332988))

(assert (= (and b!332991 res!183451) b!332989))

(assert (= (or b!332989 b!332988) bm!26236))

(assert (=> b!332990 m!337315))

(assert (=> b!332990 m!337315))

(assert (=> b!332990 m!337327))

(assert (=> b!332991 m!337315))

(declare-fun m!337367 () Bool)

(assert (=> b!332991 m!337367))

(declare-fun m!337369 () Bool)

(assert (=> b!332991 m!337369))

(assert (=> b!332991 m!337315))

(declare-fun m!337371 () Bool)

(assert (=> b!332991 m!337371))

(declare-fun m!337373 () Bool)

(assert (=> bm!26236 m!337373))

(assert (=> b!332856 d!70551))

(declare-fun b!333002 () Bool)

(declare-fun e!204480 () Bool)

(declare-fun e!204481 () Bool)

(assert (=> b!333002 (= e!204480 e!204481)))

(declare-fun c!52122 () Bool)

(assert (=> b!333002 (= c!52122 (validKeyInArray!0 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70553 () Bool)

(declare-fun res!183461 () Bool)

(declare-fun e!204482 () Bool)

(assert (=> d!70553 (=> res!183461 e!204482)))

(assert (=> d!70553 (= res!183461 (bvsge #b00000000000000000000000000000000 (size!8460 _keys!1895)))))

(assert (=> d!70553 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4609) e!204482)))

(declare-fun b!333003 () Bool)

(assert (=> b!333003 (= e!204482 e!204480)))

(declare-fun res!183460 () Bool)

(assert (=> b!333003 (=> (not res!183460) (not e!204480))))

(declare-fun e!204483 () Bool)

(assert (=> b!333003 (= res!183460 (not e!204483))))

(declare-fun res!183459 () Bool)

(assert (=> b!333003 (=> (not res!183459) (not e!204483))))

(assert (=> b!333003 (= res!183459 (validKeyInArray!0 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333004 () Bool)

(declare-fun contains!2014 (List!4612 (_ BitVec 64)) Bool)

(assert (=> b!333004 (= e!204483 (contains!2014 Nil!4609 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26239 () Bool)

(declare-fun call!26242 () Bool)

(assert (=> bm!26239 (= call!26242 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52122 (Cons!4608 (select (arr!8108 _keys!1895) #b00000000000000000000000000000000) Nil!4609) Nil!4609)))))

(declare-fun b!333005 () Bool)

(assert (=> b!333005 (= e!204481 call!26242)))

(declare-fun b!333006 () Bool)

(assert (=> b!333006 (= e!204481 call!26242)))

(assert (= (and d!70553 (not res!183461)) b!333003))

(assert (= (and b!333003 res!183459) b!333004))

(assert (= (and b!333003 res!183460) b!333002))

(assert (= (and b!333002 c!52122) b!333006))

(assert (= (and b!333002 (not c!52122)) b!333005))

(assert (= (or b!333006 b!333005) bm!26239))

(assert (=> b!333002 m!337315))

(assert (=> b!333002 m!337315))

(assert (=> b!333002 m!337327))

(assert (=> b!333003 m!337315))

(assert (=> b!333003 m!337315))

(assert (=> b!333003 m!337327))

(assert (=> b!333004 m!337315))

(assert (=> b!333004 m!337315))

(declare-fun m!337375 () Bool)

(assert (=> b!333004 m!337375))

(assert (=> bm!26239 m!337315))

(declare-fun m!337377 () Bool)

(assert (=> bm!26239 m!337377))

(assert (=> b!332857 d!70553))

(declare-fun d!70555 () Bool)

(assert (=> d!70555 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33536 d!70555))

(declare-fun d!70557 () Bool)

(assert (=> d!70557 (= (array_inv!6036 _values!1525) (bvsge (size!8459 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33536 d!70557))

(declare-fun d!70559 () Bool)

(assert (=> d!70559 (= (array_inv!6037 _keys!1895) (bvsge (size!8460 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33536 d!70559))

(declare-fun b!333014 () Bool)

(declare-fun e!204489 () Bool)

(assert (=> b!333014 (= e!204489 tp_is_empty!6777)))

(declare-fun condMapEmpty!11559 () Bool)

(declare-fun mapDefault!11559 () ValueCell!3045)

(assert (=> mapNonEmpty!11553 (= condMapEmpty!11559 (= mapRest!11553 ((as const (Array (_ BitVec 32) ValueCell!3045)) mapDefault!11559)))))

(declare-fun mapRes!11559 () Bool)

(assert (=> mapNonEmpty!11553 (= tp!23970 (and e!204489 mapRes!11559))))

(declare-fun mapNonEmpty!11559 () Bool)

(declare-fun tp!23979 () Bool)

(declare-fun e!204488 () Bool)

(assert (=> mapNonEmpty!11559 (= mapRes!11559 (and tp!23979 e!204488))))

(declare-fun mapKey!11559 () (_ BitVec 32))

(declare-fun mapRest!11559 () (Array (_ BitVec 32) ValueCell!3045))

(declare-fun mapValue!11559 () ValueCell!3045)

(assert (=> mapNonEmpty!11559 (= mapRest!11553 (store mapRest!11559 mapKey!11559 mapValue!11559))))

(declare-fun mapIsEmpty!11559 () Bool)

(assert (=> mapIsEmpty!11559 mapRes!11559))

(declare-fun b!333013 () Bool)

(assert (=> b!333013 (= e!204488 tp_is_empty!6777)))

(assert (= (and mapNonEmpty!11553 condMapEmpty!11559) mapIsEmpty!11559))

(assert (= (and mapNonEmpty!11553 (not condMapEmpty!11559)) mapNonEmpty!11559))

(assert (= (and mapNonEmpty!11559 ((_ is ValueCellFull!3045) mapValue!11559)) b!333013))

(assert (= (and mapNonEmpty!11553 ((_ is ValueCellFull!3045) mapDefault!11559)) b!333014))

(declare-fun m!337379 () Bool)

(assert (=> mapNonEmpty!11559 m!337379))

(declare-fun b_lambda!8393 () Bool)

(assert (= b_lambda!8391 (or (and start!33536 b_free!6825) b_lambda!8393)))

(check-sat (not bm!26231) (not b!332957) (not d!70549) (not b!332958) (not b!332991) (not b!332902) (not mapNonEmpty!11559) (not b!332965) (not b!333003) (not b!333004) tp_is_empty!6777 (not d!70547) (not d!70545) (not b!332990) (not b!332961) (not bm!26236) (not b_lambda!8393) (not b!332974) (not b_next!6825) (not b!332914) (not bm!26228) (not bm!26239) (not bm!26229) (not b!332972) b_and!14003 (not b!333002) (not b!332971) (not bm!26230) (not b!332966) (not b!332912))
(check-sat b_and!14003 (not b_next!6825))
