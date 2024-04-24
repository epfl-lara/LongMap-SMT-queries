; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34590 () Bool)

(assert start!34590)

(declare-fun b_free!7471 () Bool)

(declare-fun b_next!7471 () Bool)

(assert (=> start!34590 (= b_free!7471 (not b_next!7471))))

(declare-fun tp!25968 () Bool)

(declare-fun b_and!14699 () Bool)

(assert (=> start!34590 (= tp!25968 b_and!14699)))

(declare-fun b!345753 () Bool)

(declare-fun e!211916 () Bool)

(declare-fun e!211913 () Bool)

(declare-fun mapRes!12582 () Bool)

(assert (=> b!345753 (= e!211916 (and e!211913 mapRes!12582))))

(declare-fun condMapEmpty!12582 () Bool)

(declare-datatypes ((V!10875 0))(
  ( (V!10876 (val!3756 Int)) )
))
(declare-datatypes ((ValueCell!3368 0))(
  ( (ValueCellFull!3368 (v!5936 V!10875)) (EmptyCell!3368) )
))
(declare-datatypes ((array!18428 0))(
  ( (array!18429 (arr!8727 (Array (_ BitVec 32) ValueCell!3368)) (size!9079 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18428)

(declare-fun mapDefault!12582 () ValueCell!3368)

(assert (=> b!345753 (= condMapEmpty!12582 (= (arr!8727 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3368)) mapDefault!12582)))))

(declare-fun mapNonEmpty!12582 () Bool)

(declare-fun tp!25967 () Bool)

(declare-fun e!211915 () Bool)

(assert (=> mapNonEmpty!12582 (= mapRes!12582 (and tp!25967 e!211915))))

(declare-fun mapRest!12582 () (Array (_ BitVec 32) ValueCell!3368))

(declare-fun mapValue!12582 () ValueCell!3368)

(declare-fun mapKey!12582 () (_ BitVec 32))

(assert (=> mapNonEmpty!12582 (= (arr!8727 _values!1525) (store mapRest!12582 mapKey!12582 mapValue!12582))))

(declare-fun b!345754 () Bool)

(declare-fun res!191285 () Bool)

(declare-fun e!211911 () Bool)

(assert (=> b!345754 (=> (not res!191285) (not e!211911))))

(declare-datatypes ((array!18430 0))(
  ( (array!18431 (arr!8728 (Array (_ BitVec 32) (_ BitVec 64))) (size!9080 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18430)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18430 (_ BitVec 32)) Bool)

(assert (=> b!345754 (= res!191285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345755 () Bool)

(declare-fun res!191282 () Bool)

(assert (=> b!345755 (=> (not res!191282) (not e!211911))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10875)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10875)

(declare-datatypes ((tuple2!5350 0))(
  ( (tuple2!5351 (_1!2686 (_ BitVec 64)) (_2!2686 V!10875)) )
))
(declare-datatypes ((List!4955 0))(
  ( (Nil!4952) (Cons!4951 (h!5807 tuple2!5350) (t!10069 List!4955)) )
))
(declare-datatypes ((ListLongMap!4265 0))(
  ( (ListLongMap!4266 (toList!2148 List!4955)) )
))
(declare-fun contains!2228 (ListLongMap!4265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1677 (array!18430 array!18428 (_ BitVec 32) (_ BitVec 32) V!10875 V!10875 (_ BitVec 32) Int) ListLongMap!4265)

(assert (=> b!345755 (= res!191282 (not (contains!2228 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345756 () Bool)

(declare-fun e!211912 () Bool)

(declare-datatypes ((SeekEntryResult!3317 0))(
  ( (MissingZero!3317 (index!15447 (_ BitVec 32))) (Found!3317 (index!15448 (_ BitVec 32))) (Intermediate!3317 (undefined!4129 Bool) (index!15449 (_ BitVec 32)) (x!34402 (_ BitVec 32))) (Undefined!3317) (MissingVacant!3317 (index!15450 (_ BitVec 32))) )
))
(declare-fun lt!163087 () SeekEntryResult!3317)

(assert (=> b!345756 (= e!211912 (bvslt (index!15448 lt!163087) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12582 () Bool)

(assert (=> mapIsEmpty!12582 mapRes!12582))

(declare-fun b!345757 () Bool)

(declare-fun res!191284 () Bool)

(assert (=> b!345757 (=> (not res!191284) (not e!211912))))

(declare-fun arrayContainsKey!0 (array!18430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345757 (= res!191284 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15448 lt!163087)))))

(declare-fun b!345759 () Bool)

(declare-fun res!191286 () Bool)

(assert (=> b!345759 (=> (not res!191286) (not e!211911))))

(assert (=> b!345759 (= res!191286 (and (= (size!9079 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9080 _keys!1895) (size!9079 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!191287 () Bool)

(assert (=> start!34590 (=> (not res!191287) (not e!211911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34590 (= res!191287 (validMask!0 mask!2385))))

(assert (=> start!34590 e!211911))

(assert (=> start!34590 true))

(declare-fun tp_is_empty!7423 () Bool)

(assert (=> start!34590 tp_is_empty!7423))

(assert (=> start!34590 tp!25968))

(declare-fun array_inv!6450 (array!18428) Bool)

(assert (=> start!34590 (and (array_inv!6450 _values!1525) e!211916)))

(declare-fun array_inv!6451 (array!18430) Bool)

(assert (=> start!34590 (array_inv!6451 _keys!1895)))

(declare-fun b!345758 () Bool)

(assert (=> b!345758 (= e!211913 tp_is_empty!7423)))

(declare-fun b!345760 () Bool)

(assert (=> b!345760 (= e!211911 e!211912)))

(declare-fun res!191283 () Bool)

(assert (=> b!345760 (=> (not res!191283) (not e!211912))))

(get-info :version)

(assert (=> b!345760 (= res!191283 (and ((_ is Found!3317) lt!163087) (= (select (arr!8728 _keys!1895) (index!15448 lt!163087)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18430 (_ BitVec 32)) SeekEntryResult!3317)

(assert (=> b!345760 (= lt!163087 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345761 () Bool)

(declare-fun res!191288 () Bool)

(assert (=> b!345761 (=> (not res!191288) (not e!211911))))

(declare-datatypes ((List!4956 0))(
  ( (Nil!4953) (Cons!4952 (h!5808 (_ BitVec 64)) (t!10070 List!4956)) )
))
(declare-fun arrayNoDuplicates!0 (array!18430 (_ BitVec 32) List!4956) Bool)

(assert (=> b!345761 (= res!191288 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4953))))

(declare-fun b!345762 () Bool)

(assert (=> b!345762 (= e!211915 tp_is_empty!7423)))

(declare-fun b!345763 () Bool)

(declare-fun res!191281 () Bool)

(assert (=> b!345763 (=> (not res!191281) (not e!211911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345763 (= res!191281 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34590 res!191287) b!345759))

(assert (= (and b!345759 res!191286) b!345754))

(assert (= (and b!345754 res!191285) b!345761))

(assert (= (and b!345761 res!191288) b!345763))

(assert (= (and b!345763 res!191281) b!345755))

(assert (= (and b!345755 res!191282) b!345760))

(assert (= (and b!345760 res!191283) b!345757))

(assert (= (and b!345757 res!191284) b!345756))

(assert (= (and b!345753 condMapEmpty!12582) mapIsEmpty!12582))

(assert (= (and b!345753 (not condMapEmpty!12582)) mapNonEmpty!12582))

(assert (= (and mapNonEmpty!12582 ((_ is ValueCellFull!3368) mapValue!12582)) b!345762))

(assert (= (and b!345753 ((_ is ValueCellFull!3368) mapDefault!12582)) b!345758))

(assert (= start!34590 b!345753))

(declare-fun m!347303 () Bool)

(assert (=> b!345763 m!347303))

(declare-fun m!347305 () Bool)

(assert (=> b!345755 m!347305))

(assert (=> b!345755 m!347305))

(declare-fun m!347307 () Bool)

(assert (=> b!345755 m!347307))

(declare-fun m!347309 () Bool)

(assert (=> mapNonEmpty!12582 m!347309))

(declare-fun m!347311 () Bool)

(assert (=> b!345754 m!347311))

(declare-fun m!347313 () Bool)

(assert (=> b!345761 m!347313))

(declare-fun m!347315 () Bool)

(assert (=> b!345757 m!347315))

(declare-fun m!347317 () Bool)

(assert (=> start!34590 m!347317))

(declare-fun m!347319 () Bool)

(assert (=> start!34590 m!347319))

(declare-fun m!347321 () Bool)

(assert (=> start!34590 m!347321))

(declare-fun m!347323 () Bool)

(assert (=> b!345760 m!347323))

(declare-fun m!347325 () Bool)

(assert (=> b!345760 m!347325))

(check-sat (not b!345763) (not b!345757) (not b!345754) b_and!14699 tp_is_empty!7423 (not mapNonEmpty!12582) (not b!345755) (not b!345760) (not start!34590) (not b!345761) (not b_next!7471))
(check-sat b_and!14699 (not b_next!7471))
(get-model)

(declare-fun b!345838 () Bool)

(declare-fun e!211959 () Bool)

(declare-fun call!26744 () Bool)

(assert (=> b!345838 (= e!211959 call!26744)))

(declare-fun b!345839 () Bool)

(declare-fun e!211961 () Bool)

(assert (=> b!345839 (= e!211961 call!26744)))

(declare-fun b!345841 () Bool)

(declare-fun e!211960 () Bool)

(assert (=> b!345841 (= e!211960 e!211959)))

(declare-fun c!53042 () Bool)

(assert (=> b!345841 (= c!53042 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26741 () Bool)

(assert (=> bm!26741 (= call!26744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!345840 () Bool)

(assert (=> b!345840 (= e!211959 e!211961)))

(declare-fun lt!163100 () (_ BitVec 64))

(assert (=> b!345840 (= lt!163100 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10709 0))(
  ( (Unit!10710) )
))
(declare-fun lt!163101 () Unit!10709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18430 (_ BitVec 64) (_ BitVec 32)) Unit!10709)

(assert (=> b!345840 (= lt!163101 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163100 #b00000000000000000000000000000000))))

(assert (=> b!345840 (arrayContainsKey!0 _keys!1895 lt!163100 #b00000000000000000000000000000000)))

(declare-fun lt!163102 () Unit!10709)

(assert (=> b!345840 (= lt!163102 lt!163101)))

(declare-fun res!191341 () Bool)

(assert (=> b!345840 (= res!191341 (= (seekEntryOrOpen!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3317 #b00000000000000000000000000000000)))))

(assert (=> b!345840 (=> (not res!191341) (not e!211961))))

(declare-fun d!71209 () Bool)

(declare-fun res!191342 () Bool)

(assert (=> d!71209 (=> res!191342 e!211960)))

(assert (=> d!71209 (= res!191342 (bvsge #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(assert (=> d!71209 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211960)))

(assert (= (and d!71209 (not res!191342)) b!345841))

(assert (= (and b!345841 c!53042) b!345840))

(assert (= (and b!345841 (not c!53042)) b!345838))

(assert (= (and b!345840 res!191341) b!345839))

(assert (= (or b!345839 b!345838) bm!26741))

(declare-fun m!347375 () Bool)

(assert (=> b!345841 m!347375))

(assert (=> b!345841 m!347375))

(declare-fun m!347377 () Bool)

(assert (=> b!345841 m!347377))

(declare-fun m!347379 () Bool)

(assert (=> bm!26741 m!347379))

(assert (=> b!345840 m!347375))

(declare-fun m!347381 () Bool)

(assert (=> b!345840 m!347381))

(declare-fun m!347383 () Bool)

(assert (=> b!345840 m!347383))

(assert (=> b!345840 m!347375))

(declare-fun m!347385 () Bool)

(assert (=> b!345840 m!347385))

(assert (=> b!345754 d!71209))

(declare-fun d!71211 () Bool)

(assert (=> d!71211 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34590 d!71211))

(declare-fun d!71213 () Bool)

(assert (=> d!71213 (= (array_inv!6450 _values!1525) (bvsge (size!9079 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34590 d!71213))

(declare-fun d!71215 () Bool)

(assert (=> d!71215 (= (array_inv!6451 _keys!1895) (bvsge (size!9080 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34590 d!71215))

(declare-fun d!71217 () Bool)

(declare-fun e!211967 () Bool)

(assert (=> d!71217 e!211967))

(declare-fun res!191345 () Bool)

(assert (=> d!71217 (=> res!191345 e!211967)))

(declare-fun lt!163111 () Bool)

(assert (=> d!71217 (= res!191345 (not lt!163111))))

(declare-fun lt!163113 () Bool)

(assert (=> d!71217 (= lt!163111 lt!163113)))

(declare-fun lt!163112 () Unit!10709)

(declare-fun e!211966 () Unit!10709)

(assert (=> d!71217 (= lt!163112 e!211966)))

(declare-fun c!53045 () Bool)

(assert (=> d!71217 (= c!53045 lt!163113)))

(declare-fun containsKey!333 (List!4955 (_ BitVec 64)) Bool)

(assert (=> d!71217 (= lt!163113 (containsKey!333 (toList!2148 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71217 (= (contains!2228 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163111)))

(declare-fun b!345848 () Bool)

(declare-fun lt!163114 () Unit!10709)

(assert (=> b!345848 (= e!211966 lt!163114)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!281 (List!4955 (_ BitVec 64)) Unit!10709)

(assert (=> b!345848 (= lt!163114 (lemmaContainsKeyImpliesGetValueByKeyDefined!281 (toList!2148 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!348 0))(
  ( (Some!347 (v!5939 V!10875)) (None!346) )
))
(declare-fun isDefined!282 (Option!348) Bool)

(declare-fun getValueByKey!342 (List!4955 (_ BitVec 64)) Option!348)

(assert (=> b!345848 (isDefined!282 (getValueByKey!342 (toList!2148 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345849 () Bool)

(declare-fun Unit!10711 () Unit!10709)

(assert (=> b!345849 (= e!211966 Unit!10711)))

(declare-fun b!345850 () Bool)

(assert (=> b!345850 (= e!211967 (isDefined!282 (getValueByKey!342 (toList!2148 (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71217 c!53045) b!345848))

(assert (= (and d!71217 (not c!53045)) b!345849))

(assert (= (and d!71217 (not res!191345)) b!345850))

(declare-fun m!347387 () Bool)

(assert (=> d!71217 m!347387))

(declare-fun m!347389 () Bool)

(assert (=> b!345848 m!347389))

(declare-fun m!347391 () Bool)

(assert (=> b!345848 m!347391))

(assert (=> b!345848 m!347391))

(declare-fun m!347393 () Bool)

(assert (=> b!345848 m!347393))

(assert (=> b!345850 m!347391))

(assert (=> b!345850 m!347391))

(assert (=> b!345850 m!347393))

(assert (=> b!345755 d!71217))

(declare-fun b!345893 () Bool)

(declare-fun e!212001 () ListLongMap!4265)

(declare-fun call!26762 () ListLongMap!4265)

(assert (=> b!345893 (= e!212001 call!26762)))

(declare-fun b!345894 () Bool)

(declare-fun call!26760 () ListLongMap!4265)

(assert (=> b!345894 (= e!212001 call!26760)))

(declare-fun b!345895 () Bool)

(declare-fun e!211996 () Bool)

(declare-fun e!212003 () Bool)

(assert (=> b!345895 (= e!211996 e!212003)))

(declare-fun c!53061 () Bool)

(assert (=> b!345895 (= c!53061 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345896 () Bool)

(declare-fun e!211997 () Bool)

(declare-fun e!211998 () Bool)

(assert (=> b!345896 (= e!211997 e!211998)))

(declare-fun res!191365 () Bool)

(declare-fun call!26761 () Bool)

(assert (=> b!345896 (= res!191365 call!26761)))

(assert (=> b!345896 (=> (not res!191365) (not e!211998))))

(declare-fun b!345897 () Bool)

(declare-fun e!212000 () Bool)

(assert (=> b!345897 (= e!212000 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345898 () Bool)

(declare-fun call!26764 () Bool)

(assert (=> b!345898 (= e!212003 (not call!26764))))

(declare-fun b!345899 () Bool)

(declare-fun e!212002 () Unit!10709)

(declare-fun Unit!10712 () Unit!10709)

(assert (=> b!345899 (= e!212002 Unit!10712)))

(declare-fun b!345900 () Bool)

(declare-fun e!211999 () Bool)

(assert (=> b!345900 (= e!212003 e!211999)))

(declare-fun res!191367 () Bool)

(assert (=> b!345900 (= res!191367 call!26764)))

(assert (=> b!345900 (=> (not res!191367) (not e!211999))))

(declare-fun bm!26756 () Bool)

(declare-fun lt!163178 () ListLongMap!4265)

(assert (=> bm!26756 (= call!26761 (contains!2228 lt!163178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345901 () Bool)

(declare-fun apply!283 (ListLongMap!4265 (_ BitVec 64)) V!10875)

(assert (=> b!345901 (= e!211999 (= (apply!283 lt!163178 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345902 () Bool)

(declare-fun res!191369 () Bool)

(assert (=> b!345902 (=> (not res!191369) (not e!211996))))

(declare-fun e!212004 () Bool)

(assert (=> b!345902 (= res!191369 e!212004)))

(declare-fun res!191370 () Bool)

(assert (=> b!345902 (=> res!191370 e!212004)))

(assert (=> b!345902 (= res!191370 (not e!212000))))

(declare-fun res!191371 () Bool)

(assert (=> b!345902 (=> (not res!191371) (not e!212000))))

(assert (=> b!345902 (= res!191371 (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(declare-fun b!345903 () Bool)

(declare-fun e!212006 () ListLongMap!4265)

(declare-fun call!26759 () ListLongMap!4265)

(declare-fun +!734 (ListLongMap!4265 tuple2!5350) ListLongMap!4265)

(assert (=> b!345903 (= e!212006 (+!734 call!26759 (tuple2!5351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun call!26763 () ListLongMap!4265)

(declare-fun bm!26758 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!599 (array!18430 array!18428 (_ BitVec 32) (_ BitVec 32) V!10875 V!10875 (_ BitVec 32) Int) ListLongMap!4265)

(assert (=> bm!26758 (= call!26763 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345904 () Bool)

(declare-fun e!212005 () Bool)

(assert (=> b!345904 (= e!212004 e!212005)))

(declare-fun res!191372 () Bool)

(assert (=> b!345904 (=> (not res!191372) (not e!212005))))

(assert (=> b!345904 (= res!191372 (contains!2228 lt!163178 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345904 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(declare-fun b!345905 () Bool)

(declare-fun e!211994 () ListLongMap!4265)

(assert (=> b!345905 (= e!211994 call!26760)))

(declare-fun bm!26759 () Bool)

(assert (=> bm!26759 (= call!26764 (contains!2228 lt!163178 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345906 () Bool)

(assert (=> b!345906 (= e!211998 (= (apply!283 lt!163178 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345907 () Bool)

(assert (=> b!345907 (= e!211997 (not call!26761))))

(declare-fun b!345908 () Bool)

(declare-fun lt!163160 () Unit!10709)

(assert (=> b!345908 (= e!212002 lt!163160)))

(declare-fun lt!163164 () ListLongMap!4265)

(assert (=> b!345908 (= lt!163164 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163180 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163167 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163167 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163174 () Unit!10709)

(declare-fun addStillContains!259 (ListLongMap!4265 (_ BitVec 64) V!10875 (_ BitVec 64)) Unit!10709)

(assert (=> b!345908 (= lt!163174 (addStillContains!259 lt!163164 lt!163180 zeroValue!1467 lt!163167))))

(assert (=> b!345908 (contains!2228 (+!734 lt!163164 (tuple2!5351 lt!163180 zeroValue!1467)) lt!163167)))

(declare-fun lt!163165 () Unit!10709)

(assert (=> b!345908 (= lt!163165 lt!163174)))

(declare-fun lt!163163 () ListLongMap!4265)

(assert (=> b!345908 (= lt!163163 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163176 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163176 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163168 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163168 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163166 () Unit!10709)

(declare-fun addApplyDifferent!259 (ListLongMap!4265 (_ BitVec 64) V!10875 (_ BitVec 64)) Unit!10709)

(assert (=> b!345908 (= lt!163166 (addApplyDifferent!259 lt!163163 lt!163176 minValue!1467 lt!163168))))

(assert (=> b!345908 (= (apply!283 (+!734 lt!163163 (tuple2!5351 lt!163176 minValue!1467)) lt!163168) (apply!283 lt!163163 lt!163168))))

(declare-fun lt!163170 () Unit!10709)

(assert (=> b!345908 (= lt!163170 lt!163166)))

(declare-fun lt!163161 () ListLongMap!4265)

(assert (=> b!345908 (= lt!163161 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163177 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163162 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163162 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163169 () Unit!10709)

(assert (=> b!345908 (= lt!163169 (addApplyDifferent!259 lt!163161 lt!163177 zeroValue!1467 lt!163162))))

(assert (=> b!345908 (= (apply!283 (+!734 lt!163161 (tuple2!5351 lt!163177 zeroValue!1467)) lt!163162) (apply!283 lt!163161 lt!163162))))

(declare-fun lt!163173 () Unit!10709)

(assert (=> b!345908 (= lt!163173 lt!163169)))

(declare-fun lt!163172 () ListLongMap!4265)

(assert (=> b!345908 (= lt!163172 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163159 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163179 () (_ BitVec 64))

(assert (=> b!345908 (= lt!163179 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345908 (= lt!163160 (addApplyDifferent!259 lt!163172 lt!163159 minValue!1467 lt!163179))))

(assert (=> b!345908 (= (apply!283 (+!734 lt!163172 (tuple2!5351 lt!163159 minValue!1467)) lt!163179) (apply!283 lt!163172 lt!163179))))

(declare-fun bm!26760 () Bool)

(declare-fun call!26765 () ListLongMap!4265)

(assert (=> bm!26760 (= call!26765 call!26763)))

(declare-fun b!345909 () Bool)

(declare-fun c!53059 () Bool)

(assert (=> b!345909 (= c!53059 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!345909 (= e!211994 e!212001)))

(declare-fun b!345910 () Bool)

(declare-fun get!4709 (ValueCell!3368 V!10875) V!10875)

(declare-fun dynLambda!626 (Int (_ BitVec 64)) V!10875)

(assert (=> b!345910 (= e!212005 (= (apply!283 lt!163178 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)) (get!4709 (select (arr!8727 _values!1525) #b00000000000000000000000000000000) (dynLambda!626 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9079 _values!1525)))))

(assert (=> b!345910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(declare-fun c!53063 () Bool)

(declare-fun c!53058 () Bool)

(declare-fun bm!26761 () Bool)

(assert (=> bm!26761 (= call!26759 (+!734 (ite c!53063 call!26763 (ite c!53058 call!26765 call!26762)) (ite (or c!53063 c!53058) (tuple2!5351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345911 () Bool)

(declare-fun e!211995 () Bool)

(assert (=> b!345911 (= e!211995 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26757 () Bool)

(assert (=> bm!26757 (= call!26762 call!26765)))

(declare-fun d!71219 () Bool)

(assert (=> d!71219 e!211996))

(declare-fun res!191366 () Bool)

(assert (=> d!71219 (=> (not res!191366) (not e!211996))))

(assert (=> d!71219 (= res!191366 (or (bvsge #b00000000000000000000000000000000 (size!9080 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))))

(declare-fun lt!163171 () ListLongMap!4265)

(assert (=> d!71219 (= lt!163178 lt!163171)))

(declare-fun lt!163175 () Unit!10709)

(assert (=> d!71219 (= lt!163175 e!212002)))

(declare-fun c!53060 () Bool)

(assert (=> d!71219 (= c!53060 e!211995)))

(declare-fun res!191368 () Bool)

(assert (=> d!71219 (=> (not res!191368) (not e!211995))))

(assert (=> d!71219 (= res!191368 (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(assert (=> d!71219 (= lt!163171 e!212006)))

(assert (=> d!71219 (= c!53063 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71219 (validMask!0 mask!2385)))

(assert (=> d!71219 (= (getCurrentListMap!1677 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163178)))

(declare-fun b!345912 () Bool)

(assert (=> b!345912 (= e!212006 e!211994)))

(assert (=> b!345912 (= c!53058 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345913 () Bool)

(declare-fun res!191364 () Bool)

(assert (=> b!345913 (=> (not res!191364) (not e!211996))))

(assert (=> b!345913 (= res!191364 e!211997)))

(declare-fun c!53062 () Bool)

(assert (=> b!345913 (= c!53062 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26762 () Bool)

(assert (=> bm!26762 (= call!26760 call!26759)))

(assert (= (and d!71219 c!53063) b!345903))

(assert (= (and d!71219 (not c!53063)) b!345912))

(assert (= (and b!345912 c!53058) b!345905))

(assert (= (and b!345912 (not c!53058)) b!345909))

(assert (= (and b!345909 c!53059) b!345894))

(assert (= (and b!345909 (not c!53059)) b!345893))

(assert (= (or b!345894 b!345893) bm!26757))

(assert (= (or b!345905 bm!26757) bm!26760))

(assert (= (or b!345905 b!345894) bm!26762))

(assert (= (or b!345903 bm!26760) bm!26758))

(assert (= (or b!345903 bm!26762) bm!26761))

(assert (= (and d!71219 res!191368) b!345911))

(assert (= (and d!71219 c!53060) b!345908))

(assert (= (and d!71219 (not c!53060)) b!345899))

(assert (= (and d!71219 res!191366) b!345902))

(assert (= (and b!345902 res!191371) b!345897))

(assert (= (and b!345902 (not res!191370)) b!345904))

(assert (= (and b!345904 res!191372) b!345910))

(assert (= (and b!345902 res!191369) b!345913))

(assert (= (and b!345913 c!53062) b!345896))

(assert (= (and b!345913 (not c!53062)) b!345907))

(assert (= (and b!345896 res!191365) b!345906))

(assert (= (or b!345896 b!345907) bm!26756))

(assert (= (and b!345913 res!191364) b!345895))

(assert (= (and b!345895 c!53061) b!345900))

(assert (= (and b!345895 (not c!53061)) b!345898))

(assert (= (and b!345900 res!191367) b!345901))

(assert (= (or b!345900 b!345898) bm!26759))

(declare-fun b_lambda!8493 () Bool)

(assert (=> (not b_lambda!8493) (not b!345910)))

(declare-fun t!10076 () Bool)

(declare-fun tb!3073 () Bool)

(assert (=> (and start!34590 (= defaultEntry!1528 defaultEntry!1528) t!10076) tb!3073))

(declare-fun result!5565 () Bool)

(assert (=> tb!3073 (= result!5565 tp_is_empty!7423)))

(assert (=> b!345910 t!10076))

(declare-fun b_and!14705 () Bool)

(assert (= b_and!14699 (and (=> t!10076 result!5565) b_and!14705)))

(assert (=> b!345904 m!347375))

(assert (=> b!345904 m!347375))

(declare-fun m!347395 () Bool)

(assert (=> b!345904 m!347395))

(declare-fun m!347397 () Bool)

(assert (=> b!345908 m!347397))

(assert (=> b!345908 m!347375))

(declare-fun m!347399 () Bool)

(assert (=> b!345908 m!347399))

(declare-fun m!347401 () Bool)

(assert (=> b!345908 m!347401))

(declare-fun m!347403 () Bool)

(assert (=> b!345908 m!347403))

(declare-fun m!347405 () Bool)

(assert (=> b!345908 m!347405))

(declare-fun m!347407 () Bool)

(assert (=> b!345908 m!347407))

(declare-fun m!347409 () Bool)

(assert (=> b!345908 m!347409))

(declare-fun m!347411 () Bool)

(assert (=> b!345908 m!347411))

(declare-fun m!347413 () Bool)

(assert (=> b!345908 m!347413))

(declare-fun m!347415 () Bool)

(assert (=> b!345908 m!347415))

(assert (=> b!345908 m!347401))

(declare-fun m!347417 () Bool)

(assert (=> b!345908 m!347417))

(declare-fun m!347419 () Bool)

(assert (=> b!345908 m!347419))

(assert (=> b!345908 m!347417))

(assert (=> b!345908 m!347413))

(declare-fun m!347421 () Bool)

(assert (=> b!345908 m!347421))

(declare-fun m!347423 () Bool)

(assert (=> b!345908 m!347423))

(declare-fun m!347425 () Bool)

(assert (=> b!345908 m!347425))

(assert (=> b!345908 m!347425))

(declare-fun m!347427 () Bool)

(assert (=> b!345908 m!347427))

(declare-fun m!347429 () Bool)

(assert (=> bm!26756 m!347429))

(declare-fun m!347431 () Bool)

(assert (=> bm!26759 m!347431))

(assert (=> b!345897 m!347375))

(assert (=> b!345897 m!347375))

(assert (=> b!345897 m!347377))

(declare-fun m!347433 () Bool)

(assert (=> bm!26761 m!347433))

(assert (=> bm!26758 m!347409))

(declare-fun m!347435 () Bool)

(assert (=> b!345903 m!347435))

(declare-fun m!347437 () Bool)

(assert (=> b!345906 m!347437))

(declare-fun m!347439 () Bool)

(assert (=> b!345910 m!347439))

(assert (=> b!345910 m!347375))

(declare-fun m!347441 () Bool)

(assert (=> b!345910 m!347441))

(assert (=> b!345910 m!347375))

(declare-fun m!347443 () Bool)

(assert (=> b!345910 m!347443))

(assert (=> b!345910 m!347441))

(assert (=> b!345910 m!347439))

(declare-fun m!347445 () Bool)

(assert (=> b!345910 m!347445))

(assert (=> d!71219 m!347317))

(declare-fun m!347447 () Bool)

(assert (=> b!345901 m!347447))

(assert (=> b!345911 m!347375))

(assert (=> b!345911 m!347375))

(assert (=> b!345911 m!347377))

(assert (=> b!345755 d!71219))

(declare-fun b!345928 () Bool)

(declare-fun e!212013 () SeekEntryResult!3317)

(assert (=> b!345928 (= e!212013 Undefined!3317)))

(declare-fun b!345930 () Bool)

(declare-fun e!212014 () SeekEntryResult!3317)

(declare-fun lt!163187 () SeekEntryResult!3317)

(assert (=> b!345930 (= e!212014 (MissingZero!3317 (index!15449 lt!163187)))))

(declare-fun b!345931 () Bool)

(declare-fun e!212015 () SeekEntryResult!3317)

(assert (=> b!345931 (= e!212015 (Found!3317 (index!15449 lt!163187)))))

(declare-fun b!345932 () Bool)

(declare-fun c!53070 () Bool)

(declare-fun lt!163188 () (_ BitVec 64))

(assert (=> b!345932 (= c!53070 (= lt!163188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!345932 (= e!212015 e!212014)))

(declare-fun b!345933 () Bool)

(assert (=> b!345933 (= e!212013 e!212015)))

(assert (=> b!345933 (= lt!163188 (select (arr!8728 _keys!1895) (index!15449 lt!163187)))))

(declare-fun c!53071 () Bool)

(assert (=> b!345933 (= c!53071 (= lt!163188 k0!1348))))

(declare-fun b!345929 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18430 (_ BitVec 32)) SeekEntryResult!3317)

(assert (=> b!345929 (= e!212014 (seekKeyOrZeroReturnVacant!0 (x!34402 lt!163187) (index!15449 lt!163187) (index!15449 lt!163187) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!71221 () Bool)

(declare-fun lt!163189 () SeekEntryResult!3317)

(assert (=> d!71221 (and (or ((_ is Undefined!3317) lt!163189) (not ((_ is Found!3317) lt!163189)) (and (bvsge (index!15448 lt!163189) #b00000000000000000000000000000000) (bvslt (index!15448 lt!163189) (size!9080 _keys!1895)))) (or ((_ is Undefined!3317) lt!163189) ((_ is Found!3317) lt!163189) (not ((_ is MissingZero!3317) lt!163189)) (and (bvsge (index!15447 lt!163189) #b00000000000000000000000000000000) (bvslt (index!15447 lt!163189) (size!9080 _keys!1895)))) (or ((_ is Undefined!3317) lt!163189) ((_ is Found!3317) lt!163189) ((_ is MissingZero!3317) lt!163189) (not ((_ is MissingVacant!3317) lt!163189)) (and (bvsge (index!15450 lt!163189) #b00000000000000000000000000000000) (bvslt (index!15450 lt!163189) (size!9080 _keys!1895)))) (or ((_ is Undefined!3317) lt!163189) (ite ((_ is Found!3317) lt!163189) (= (select (arr!8728 _keys!1895) (index!15448 lt!163189)) k0!1348) (ite ((_ is MissingZero!3317) lt!163189) (= (select (arr!8728 _keys!1895) (index!15447 lt!163189)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3317) lt!163189) (= (select (arr!8728 _keys!1895) (index!15450 lt!163189)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71221 (= lt!163189 e!212013)))

(declare-fun c!53072 () Bool)

(assert (=> d!71221 (= c!53072 (and ((_ is Intermediate!3317) lt!163187) (undefined!4129 lt!163187)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18430 (_ BitVec 32)) SeekEntryResult!3317)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71221 (= lt!163187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71221 (validMask!0 mask!2385)))

(assert (=> d!71221 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163189)))

(assert (= (and d!71221 c!53072) b!345928))

(assert (= (and d!71221 (not c!53072)) b!345933))

(assert (= (and b!345933 c!53071) b!345931))

(assert (= (and b!345933 (not c!53071)) b!345932))

(assert (= (and b!345932 c!53070) b!345930))

(assert (= (and b!345932 (not c!53070)) b!345929))

(declare-fun m!347449 () Bool)

(assert (=> b!345933 m!347449))

(declare-fun m!347451 () Bool)

(assert (=> b!345929 m!347451))

(declare-fun m!347453 () Bool)

(assert (=> d!71221 m!347453))

(declare-fun m!347455 () Bool)

(assert (=> d!71221 m!347455))

(declare-fun m!347457 () Bool)

(assert (=> d!71221 m!347457))

(declare-fun m!347459 () Bool)

(assert (=> d!71221 m!347459))

(declare-fun m!347461 () Bool)

(assert (=> d!71221 m!347461))

(assert (=> d!71221 m!347457))

(assert (=> d!71221 m!347317))

(assert (=> b!345760 d!71221))

(declare-fun d!71223 () Bool)

(declare-fun res!191380 () Bool)

(declare-fun e!212026 () Bool)

(assert (=> d!71223 (=> res!191380 e!212026)))

(assert (=> d!71223 (= res!191380 (bvsge #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(assert (=> d!71223 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4953) e!212026)))

(declare-fun b!345944 () Bool)

(declare-fun e!212024 () Bool)

(declare-fun contains!2231 (List!4956 (_ BitVec 64)) Bool)

(assert (=> b!345944 (= e!212024 (contains!2231 Nil!4953 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345945 () Bool)

(declare-fun e!212025 () Bool)

(declare-fun call!26768 () Bool)

(assert (=> b!345945 (= e!212025 call!26768)))

(declare-fun b!345946 () Bool)

(declare-fun e!212027 () Bool)

(assert (=> b!345946 (= e!212026 e!212027)))

(declare-fun res!191379 () Bool)

(assert (=> b!345946 (=> (not res!191379) (not e!212027))))

(assert (=> b!345946 (= res!191379 (not e!212024))))

(declare-fun res!191381 () Bool)

(assert (=> b!345946 (=> (not res!191381) (not e!212024))))

(assert (=> b!345946 (= res!191381 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345947 () Bool)

(assert (=> b!345947 (= e!212027 e!212025)))

(declare-fun c!53075 () Bool)

(assert (=> b!345947 (= c!53075 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26765 () Bool)

(assert (=> bm!26765 (= call!26768 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53075 (Cons!4952 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000) Nil!4953) Nil!4953)))))

(declare-fun b!345948 () Bool)

(assert (=> b!345948 (= e!212025 call!26768)))

(assert (= (and d!71223 (not res!191380)) b!345946))

(assert (= (and b!345946 res!191381) b!345944))

(assert (= (and b!345946 res!191379) b!345947))

(assert (= (and b!345947 c!53075) b!345945))

(assert (= (and b!345947 (not c!53075)) b!345948))

(assert (= (or b!345945 b!345948) bm!26765))

(assert (=> b!345944 m!347375))

(assert (=> b!345944 m!347375))

(declare-fun m!347463 () Bool)

(assert (=> b!345944 m!347463))

(assert (=> b!345946 m!347375))

(assert (=> b!345946 m!347375))

(assert (=> b!345946 m!347377))

(assert (=> b!345947 m!347375))

(assert (=> b!345947 m!347375))

(assert (=> b!345947 m!347377))

(assert (=> bm!26765 m!347375))

(declare-fun m!347465 () Bool)

(assert (=> bm!26765 m!347465))

(assert (=> b!345761 d!71223))

(declare-fun d!71225 () Bool)

(declare-fun res!191386 () Bool)

(declare-fun e!212032 () Bool)

(assert (=> d!71225 (=> res!191386 e!212032)))

(assert (=> d!71225 (= res!191386 (= (select (arr!8728 _keys!1895) (index!15448 lt!163087)) k0!1348))))

(assert (=> d!71225 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15448 lt!163087)) e!212032)))

(declare-fun b!345953 () Bool)

(declare-fun e!212033 () Bool)

(assert (=> b!345953 (= e!212032 e!212033)))

(declare-fun res!191387 () Bool)

(assert (=> b!345953 (=> (not res!191387) (not e!212033))))

(assert (=> b!345953 (= res!191387 (bvslt (bvadd (index!15448 lt!163087) #b00000000000000000000000000000001) (size!9080 _keys!1895)))))

(declare-fun b!345954 () Bool)

(assert (=> b!345954 (= e!212033 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15448 lt!163087) #b00000000000000000000000000000001)))))

(assert (= (and d!71225 (not res!191386)) b!345953))

(assert (= (and b!345953 res!191387) b!345954))

(assert (=> d!71225 m!347323))

(declare-fun m!347467 () Bool)

(assert (=> b!345954 m!347467))

(assert (=> b!345757 d!71225))

(declare-fun d!71227 () Bool)

(assert (=> d!71227 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345763 d!71227))

(declare-fun mapIsEmpty!12591 () Bool)

(declare-fun mapRes!12591 () Bool)

(assert (=> mapIsEmpty!12591 mapRes!12591))

(declare-fun mapNonEmpty!12591 () Bool)

(declare-fun tp!25983 () Bool)

(declare-fun e!212039 () Bool)

(assert (=> mapNonEmpty!12591 (= mapRes!12591 (and tp!25983 e!212039))))

(declare-fun mapKey!12591 () (_ BitVec 32))

(declare-fun mapRest!12591 () (Array (_ BitVec 32) ValueCell!3368))

(declare-fun mapValue!12591 () ValueCell!3368)

(assert (=> mapNonEmpty!12591 (= mapRest!12582 (store mapRest!12591 mapKey!12591 mapValue!12591))))

(declare-fun b!345962 () Bool)

(declare-fun e!212038 () Bool)

(assert (=> b!345962 (= e!212038 tp_is_empty!7423)))

(declare-fun b!345961 () Bool)

(assert (=> b!345961 (= e!212039 tp_is_empty!7423)))

(declare-fun condMapEmpty!12591 () Bool)

(declare-fun mapDefault!12591 () ValueCell!3368)

(assert (=> mapNonEmpty!12582 (= condMapEmpty!12591 (= mapRest!12582 ((as const (Array (_ BitVec 32) ValueCell!3368)) mapDefault!12591)))))

(assert (=> mapNonEmpty!12582 (= tp!25967 (and e!212038 mapRes!12591))))

(assert (= (and mapNonEmpty!12582 condMapEmpty!12591) mapIsEmpty!12591))

(assert (= (and mapNonEmpty!12582 (not condMapEmpty!12591)) mapNonEmpty!12591))

(assert (= (and mapNonEmpty!12591 ((_ is ValueCellFull!3368) mapValue!12591)) b!345961))

(assert (= (and mapNonEmpty!12582 ((_ is ValueCellFull!3368) mapDefault!12591)) b!345962))

(declare-fun m!347469 () Bool)

(assert (=> mapNonEmpty!12591 m!347469))

(declare-fun b_lambda!8495 () Bool)

(assert (= b_lambda!8493 (or (and start!34590 b_free!7471) b_lambda!8495)))

(check-sat (not bm!26741) (not b!345903) (not bm!26758) (not mapNonEmpty!12591) (not b!345910) (not b!345904) (not bm!26759) (not d!71219) (not b!345947) (not b!345908) b_and!14705 (not bm!26765) (not b!345848) (not b!345840) (not bm!26761) tp_is_empty!7423 (not b!345929) (not b!345946) (not d!71217) (not b!345841) (not b!345906) (not b!345850) (not b!345954) (not b!345944) (not bm!26756) (not b!345901) (not b_lambda!8495) (not b!345897) (not b_next!7471) (not d!71221) (not b!345911))
(check-sat b_and!14705 (not b_next!7471))
