; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34940 () Bool)

(assert start!34940)

(declare-fun b_free!7669 () Bool)

(declare-fun b_next!7669 () Bool)

(assert (=> start!34940 (= b_free!7669 (not b_next!7669))))

(declare-fun tp!26583 () Bool)

(declare-fun b_and!14871 () Bool)

(assert (=> start!34940 (= tp!26583 b_and!14871)))

(declare-fun b!349812 () Bool)

(declare-fun res!193896 () Bool)

(declare-fun e!214276 () Bool)

(assert (=> b!349812 (=> res!193896 e!214276)))

(declare-fun call!26921 () Bool)

(assert (=> b!349812 (= res!193896 (not call!26921))))

(declare-fun e!214273 () Bool)

(assert (=> b!349812 (= e!214273 e!214276)))

(declare-fun b!349813 () Bool)

(declare-fun e!214277 () Bool)

(declare-fun e!214270 () Bool)

(assert (=> b!349813 (= e!214277 e!214270)))

(declare-fun res!193894 () Bool)

(assert (=> b!349813 (= res!193894 (not call!26921))))

(assert (=> b!349813 (=> res!193894 e!214270)))

(declare-fun b!349814 () Bool)

(assert (=> b!349814 (= e!214277 e!214273)))

(declare-fun c!53286 () Bool)

(declare-datatypes ((SeekEntryResult!3434 0))(
  ( (MissingZero!3434 (index!15915 (_ BitVec 32))) (Found!3434 (index!15916 (_ BitVec 32))) (Intermediate!3434 (undefined!4246 Bool) (index!15917 (_ BitVec 32)) (x!34851 (_ BitVec 32))) (Undefined!3434) (MissingVacant!3434 (index!15918 (_ BitVec 32))) )
))
(declare-fun lt!164204 () SeekEntryResult!3434)

(get-info :version)

(assert (=> b!349814 (= c!53286 ((_ is MissingVacant!3434) lt!164204))))

(declare-fun b!349815 () Bool)

(declare-fun res!193888 () Bool)

(declare-fun e!214274 () Bool)

(assert (=> b!349815 (=> (not res!193888) (not e!214274))))

(declare-datatypes ((array!18807 0))(
  ( (array!18808 (arr!8910 (Array (_ BitVec 32) (_ BitVec 64))) (size!9263 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18807)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18807 (_ BitVec 32)) Bool)

(assert (=> b!349815 (= res!193888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12900 () Bool)

(declare-fun mapRes!12900 () Bool)

(assert (=> mapIsEmpty!12900 mapRes!12900))

(declare-fun b!349816 () Bool)

(declare-datatypes ((Unit!10834 0))(
  ( (Unit!10835) )
))
(declare-fun e!214275 () Unit!10834)

(declare-fun Unit!10836 () Unit!10834)

(assert (=> b!349816 (= e!214275 Unit!10836)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11139 0))(
  ( (V!11140 (val!3855 Int)) )
))
(declare-fun zeroValue!1467 () V!11139)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!164202 () Unit!10834)

(declare-datatypes ((ValueCell!3467 0))(
  ( (ValueCellFull!3467 (v!6035 V!11139)) (EmptyCell!3467) )
))
(declare-datatypes ((array!18809 0))(
  ( (array!18810 (arr!8911 (Array (_ BitVec 32) ValueCell!3467)) (size!9264 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18809)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11139)

(declare-fun lemmaArrayContainsKeyThenInListMap!326 (array!18807 array!18809 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 64) (_ BitVec 32) Int) Unit!10834)

(declare-fun arrayScanForKey!0 (array!18807 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349816 (= lt!164202 (lemmaArrayContainsKeyThenInListMap!326 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349816 false))

(declare-fun b!349817 () Bool)

(declare-fun e!214272 () Bool)

(declare-fun e!214269 () Bool)

(assert (=> b!349817 (= e!214272 e!214269)))

(declare-fun res!193890 () Bool)

(assert (=> b!349817 (=> (not res!193890) (not e!214269))))

(declare-fun lt!164205 () Bool)

(assert (=> b!349817 (= res!193890 (not lt!164205))))

(declare-fun lt!164203 () Unit!10834)

(assert (=> b!349817 (= lt!164203 e!214275)))

(declare-fun c!53287 () Bool)

(assert (=> b!349817 (= c!53287 lt!164205)))

(declare-fun arrayContainsKey!0 (array!18807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349817 (= lt!164205 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349818 () Bool)

(declare-fun res!193892 () Bool)

(assert (=> b!349818 (=> (not res!193892) (not e!214274))))

(declare-datatypes ((tuple2!5532 0))(
  ( (tuple2!5533 (_1!2777 (_ BitVec 64)) (_2!2777 V!11139)) )
))
(declare-datatypes ((List!5147 0))(
  ( (Nil!5144) (Cons!5143 (h!5999 tuple2!5532) (t!10274 List!5147)) )
))
(declare-datatypes ((ListLongMap!4435 0))(
  ( (ListLongMap!4436 (toList!2233 List!5147)) )
))
(declare-fun contains!2312 (ListLongMap!4435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1738 (array!18807 array!18809 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 32) Int) ListLongMap!4435)

(assert (=> b!349818 (= res!193892 (not (contains!2312 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349819 () Bool)

(declare-fun res!193895 () Bool)

(assert (=> b!349819 (=> (not res!193895) (not e!214274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349819 (= res!193895 (validKeyInArray!0 k0!1348))))

(declare-fun b!349820 () Bool)

(declare-fun e!214266 () Bool)

(declare-fun e!214271 () Bool)

(assert (=> b!349820 (= e!214266 (and e!214271 mapRes!12900))))

(declare-fun condMapEmpty!12900 () Bool)

(declare-fun mapDefault!12900 () ValueCell!3467)

(assert (=> b!349820 (= condMapEmpty!12900 (= (arr!8911 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3467)) mapDefault!12900)))))

(declare-fun b!349821 () Bool)

(assert (=> b!349821 (= e!214270 (not (= (select (arr!8910 _keys!1895) (index!15915 lt!164204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!349823 () Bool)

(assert (=> b!349823 (= e!214269 e!214277)))

(declare-fun c!53288 () Bool)

(assert (=> b!349823 (= c!53288 ((_ is MissingZero!3434) lt!164204))))

(declare-fun bm!26918 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!26918 (= call!26921 (inRange!0 (ite c!53288 (index!15915 lt!164204) (index!15918 lt!164204)) mask!2385))))

(declare-fun b!349824 () Bool)

(declare-fun res!193893 () Bool)

(assert (=> b!349824 (=> (not res!193893) (not e!214274))))

(assert (=> b!349824 (= res!193893 (and (= (size!9264 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9263 _keys!1895) (size!9264 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349825 () Bool)

(declare-fun tp_is_empty!7621 () Bool)

(assert (=> b!349825 (= e!214271 tp_is_empty!7621)))

(declare-fun b!349826 () Bool)

(declare-fun Unit!10837 () Unit!10834)

(assert (=> b!349826 (= e!214275 Unit!10837)))

(declare-fun b!349827 () Bool)

(assert (=> b!349827 (= e!214274 e!214272)))

(declare-fun res!193891 () Bool)

(assert (=> b!349827 (=> (not res!193891) (not e!214272))))

(assert (=> b!349827 (= res!193891 (and (not ((_ is Found!3434) lt!164204)) ((_ is MissingZero!3434) lt!164204)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18807 (_ BitVec 32)) SeekEntryResult!3434)

(assert (=> b!349827 (= lt!164204 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349828 () Bool)

(declare-fun res!193889 () Bool)

(assert (=> b!349828 (=> (not res!193889) (not e!214274))))

(declare-datatypes ((List!5148 0))(
  ( (Nil!5145) (Cons!5144 (h!6000 (_ BitVec 64)) (t!10275 List!5148)) )
))
(declare-fun arrayNoDuplicates!0 (array!18807 (_ BitVec 32) List!5148) Bool)

(assert (=> b!349828 (= res!193889 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5145))))

(declare-fun b!349829 () Bool)

(assert (=> b!349829 (= e!214276 (not (= (select (arr!8910 _keys!1895) (index!15918 lt!164204)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!12900 () Bool)

(declare-fun tp!26582 () Bool)

(declare-fun e!214267 () Bool)

(assert (=> mapNonEmpty!12900 (= mapRes!12900 (and tp!26582 e!214267))))

(declare-fun mapRest!12900 () (Array (_ BitVec 32) ValueCell!3467))

(declare-fun mapKey!12900 () (_ BitVec 32))

(declare-fun mapValue!12900 () ValueCell!3467)

(assert (=> mapNonEmpty!12900 (= (arr!8911 _values!1525) (store mapRest!12900 mapKey!12900 mapValue!12900))))

(declare-fun b!349830 () Bool)

(assert (=> b!349830 (= e!214273 (not ((_ is Undefined!3434) lt!164204)))))

(declare-fun b!349822 () Bool)

(assert (=> b!349822 (= e!214267 tp_is_empty!7621)))

(declare-fun res!193887 () Bool)

(assert (=> start!34940 (=> (not res!193887) (not e!214274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34940 (= res!193887 (validMask!0 mask!2385))))

(assert (=> start!34940 e!214274))

(assert (=> start!34940 true))

(assert (=> start!34940 tp_is_empty!7621))

(assert (=> start!34940 tp!26583))

(declare-fun array_inv!6608 (array!18809) Bool)

(assert (=> start!34940 (and (array_inv!6608 _values!1525) e!214266)))

(declare-fun array_inv!6609 (array!18807) Bool)

(assert (=> start!34940 (array_inv!6609 _keys!1895)))

(assert (= (and start!34940 res!193887) b!349824))

(assert (= (and b!349824 res!193893) b!349815))

(assert (= (and b!349815 res!193888) b!349828))

(assert (= (and b!349828 res!193889) b!349819))

(assert (= (and b!349819 res!193895) b!349818))

(assert (= (and b!349818 res!193892) b!349827))

(assert (= (and b!349827 res!193891) b!349817))

(assert (= (and b!349817 c!53287) b!349816))

(assert (= (and b!349817 (not c!53287)) b!349826))

(assert (= (and b!349817 res!193890) b!349823))

(assert (= (and b!349823 c!53288) b!349813))

(assert (= (and b!349823 (not c!53288)) b!349814))

(assert (= (and b!349813 (not res!193894)) b!349821))

(assert (= (and b!349814 c!53286) b!349812))

(assert (= (and b!349814 (not c!53286)) b!349830))

(assert (= (and b!349812 (not res!193896)) b!349829))

(assert (= (or b!349813 b!349812) bm!26918))

(assert (= (and b!349820 condMapEmpty!12900) mapIsEmpty!12900))

(assert (= (and b!349820 (not condMapEmpty!12900)) mapNonEmpty!12900))

(assert (= (and mapNonEmpty!12900 ((_ is ValueCellFull!3467) mapValue!12900)) b!349822))

(assert (= (and b!349820 ((_ is ValueCellFull!3467) mapDefault!12900)) b!349825))

(assert (= start!34940 b!349820))

(declare-fun m!349665 () Bool)

(assert (=> b!349821 m!349665))

(declare-fun m!349667 () Bool)

(assert (=> b!349815 m!349667))

(declare-fun m!349669 () Bool)

(assert (=> start!34940 m!349669))

(declare-fun m!349671 () Bool)

(assert (=> start!34940 m!349671))

(declare-fun m!349673 () Bool)

(assert (=> start!34940 m!349673))

(declare-fun m!349675 () Bool)

(assert (=> b!349827 m!349675))

(declare-fun m!349677 () Bool)

(assert (=> b!349829 m!349677))

(declare-fun m!349679 () Bool)

(assert (=> b!349828 m!349679))

(declare-fun m!349681 () Bool)

(assert (=> b!349816 m!349681))

(assert (=> b!349816 m!349681))

(declare-fun m!349683 () Bool)

(assert (=> b!349816 m!349683))

(declare-fun m!349685 () Bool)

(assert (=> mapNonEmpty!12900 m!349685))

(declare-fun m!349687 () Bool)

(assert (=> bm!26918 m!349687))

(declare-fun m!349689 () Bool)

(assert (=> b!349817 m!349689))

(declare-fun m!349691 () Bool)

(assert (=> b!349819 m!349691))

(declare-fun m!349693 () Bool)

(assert (=> b!349818 m!349693))

(assert (=> b!349818 m!349693))

(declare-fun m!349695 () Bool)

(assert (=> b!349818 m!349695))

(check-sat (not b_next!7669) (not b!349816) (not b!349827) (not mapNonEmpty!12900) (not b!349819) tp_is_empty!7621 (not start!34940) (not bm!26918) (not b!349815) (not b!349818) (not b!349828) b_and!14871 (not b!349817))
(check-sat b_and!14871 (not b_next!7669))
(get-model)

(declare-fun bm!26927 () Bool)

(declare-fun call!26930 () Bool)

(assert (=> bm!26927 (= call!26930 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!349953 () Bool)

(declare-fun e!214357 () Bool)

(declare-fun e!214358 () Bool)

(assert (=> b!349953 (= e!214357 e!214358)))

(declare-fun c!53309 () Bool)

(assert (=> b!349953 (= c!53309 (validKeyInArray!0 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349954 () Bool)

(declare-fun e!214356 () Bool)

(assert (=> b!349954 (= e!214356 call!26930)))

(declare-fun b!349955 () Bool)

(assert (=> b!349955 (= e!214358 call!26930)))

(declare-fun d!71197 () Bool)

(declare-fun res!193961 () Bool)

(assert (=> d!71197 (=> res!193961 e!214357)))

(assert (=> d!71197 (= res!193961 (bvsge #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(assert (=> d!71197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!214357)))

(declare-fun b!349956 () Bool)

(assert (=> b!349956 (= e!214358 e!214356)))

(declare-fun lt!164237 () (_ BitVec 64))

(assert (=> b!349956 (= lt!164237 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164238 () Unit!10834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18807 (_ BitVec 64) (_ BitVec 32)) Unit!10834)

(assert (=> b!349956 (= lt!164238 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164237 #b00000000000000000000000000000000))))

(assert (=> b!349956 (arrayContainsKey!0 _keys!1895 lt!164237 #b00000000000000000000000000000000)))

(declare-fun lt!164236 () Unit!10834)

(assert (=> b!349956 (= lt!164236 lt!164238)))

(declare-fun res!193962 () Bool)

(assert (=> b!349956 (= res!193962 (= (seekEntryOrOpen!0 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3434 #b00000000000000000000000000000000)))))

(assert (=> b!349956 (=> (not res!193962) (not e!214356))))

(assert (= (and d!71197 (not res!193961)) b!349953))

(assert (= (and b!349953 c!53309) b!349956))

(assert (= (and b!349953 (not c!53309)) b!349955))

(assert (= (and b!349956 res!193962) b!349954))

(assert (= (or b!349954 b!349955) bm!26927))

(declare-fun m!349761 () Bool)

(assert (=> bm!26927 m!349761))

(declare-fun m!349763 () Bool)

(assert (=> b!349953 m!349763))

(assert (=> b!349953 m!349763))

(declare-fun m!349765 () Bool)

(assert (=> b!349953 m!349765))

(assert (=> b!349956 m!349763))

(declare-fun m!349767 () Bool)

(assert (=> b!349956 m!349767))

(declare-fun m!349769 () Bool)

(assert (=> b!349956 m!349769))

(assert (=> b!349956 m!349763))

(declare-fun m!349771 () Bool)

(assert (=> b!349956 m!349771))

(assert (=> b!349815 d!71197))

(declare-fun d!71199 () Bool)

(assert (=> d!71199 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349819 d!71199))

(declare-fun d!71201 () Bool)

(assert (=> d!71201 (= (inRange!0 (ite c!53288 (index!15915 lt!164204) (index!15918 lt!164204)) mask!2385) (and (bvsge (ite c!53288 (index!15915 lt!164204) (index!15918 lt!164204)) #b00000000000000000000000000000000) (bvslt (ite c!53288 (index!15915 lt!164204) (index!15918 lt!164204)) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> bm!26918 d!71201))

(declare-fun b!349967 () Bool)

(declare-fun e!214369 () Bool)

(declare-fun e!214367 () Bool)

(assert (=> b!349967 (= e!214369 e!214367)))

(declare-fun res!193970 () Bool)

(assert (=> b!349967 (=> (not res!193970) (not e!214367))))

(declare-fun e!214370 () Bool)

(assert (=> b!349967 (= res!193970 (not e!214370))))

(declare-fun res!193969 () Bool)

(assert (=> b!349967 (=> (not res!193969) (not e!214370))))

(assert (=> b!349967 (= res!193969 (validKeyInArray!0 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71203 () Bool)

(declare-fun res!193971 () Bool)

(assert (=> d!71203 (=> res!193971 e!214369)))

(assert (=> d!71203 (= res!193971 (bvsge #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(assert (=> d!71203 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5145) e!214369)))

(declare-fun b!349968 () Bool)

(declare-fun e!214368 () Bool)

(declare-fun call!26933 () Bool)

(assert (=> b!349968 (= e!214368 call!26933)))

(declare-fun b!349969 () Bool)

(declare-fun contains!2315 (List!5148 (_ BitVec 64)) Bool)

(assert (=> b!349969 (= e!214370 (contains!2315 Nil!5145 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349970 () Bool)

(assert (=> b!349970 (= e!214368 call!26933)))

(declare-fun bm!26930 () Bool)

(declare-fun c!53312 () Bool)

(assert (=> bm!26930 (= call!26933 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53312 (Cons!5144 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000) Nil!5145) Nil!5145)))))

(declare-fun b!349971 () Bool)

(assert (=> b!349971 (= e!214367 e!214368)))

(assert (=> b!349971 (= c!53312 (validKeyInArray!0 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71203 (not res!193971)) b!349967))

(assert (= (and b!349967 res!193969) b!349969))

(assert (= (and b!349967 res!193970) b!349971))

(assert (= (and b!349971 c!53312) b!349968))

(assert (= (and b!349971 (not c!53312)) b!349970))

(assert (= (or b!349968 b!349970) bm!26930))

(assert (=> b!349967 m!349763))

(assert (=> b!349967 m!349763))

(assert (=> b!349967 m!349765))

(assert (=> b!349969 m!349763))

(assert (=> b!349969 m!349763))

(declare-fun m!349773 () Bool)

(assert (=> b!349969 m!349773))

(assert (=> bm!26930 m!349763))

(declare-fun m!349775 () Bool)

(assert (=> bm!26930 m!349775))

(assert (=> b!349971 m!349763))

(assert (=> b!349971 m!349763))

(assert (=> b!349971 m!349765))

(assert (=> b!349828 d!71203))

(declare-fun d!71205 () Bool)

(declare-fun e!214376 () Bool)

(assert (=> d!71205 e!214376))

(declare-fun res!193974 () Bool)

(assert (=> d!71205 (=> res!193974 e!214376)))

(declare-fun lt!164249 () Bool)

(assert (=> d!71205 (= res!193974 (not lt!164249))))

(declare-fun lt!164247 () Bool)

(assert (=> d!71205 (= lt!164249 lt!164247)))

(declare-fun lt!164250 () Unit!10834)

(declare-fun e!214375 () Unit!10834)

(assert (=> d!71205 (= lt!164250 e!214375)))

(declare-fun c!53315 () Bool)

(assert (=> d!71205 (= c!53315 lt!164247)))

(declare-fun containsKey!338 (List!5147 (_ BitVec 64)) Bool)

(assert (=> d!71205 (= lt!164247 (containsKey!338 (toList!2233 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71205 (= (contains!2312 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164249)))

(declare-fun b!349978 () Bool)

(declare-fun lt!164248 () Unit!10834)

(assert (=> b!349978 (= e!214375 lt!164248)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!287 (List!5147 (_ BitVec 64)) Unit!10834)

(assert (=> b!349978 (= lt!164248 (lemmaContainsKeyImpliesGetValueByKeyDefined!287 (toList!2233 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!352 0))(
  ( (Some!351 (v!6038 V!11139)) (None!350) )
))
(declare-fun isDefined!288 (Option!352) Bool)

(declare-fun getValueByKey!346 (List!5147 (_ BitVec 64)) Option!352)

(assert (=> b!349978 (isDefined!288 (getValueByKey!346 (toList!2233 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349979 () Bool)

(declare-fun Unit!10845 () Unit!10834)

(assert (=> b!349979 (= e!214375 Unit!10845)))

(declare-fun b!349980 () Bool)

(assert (=> b!349980 (= e!214376 (isDefined!288 (getValueByKey!346 (toList!2233 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71205 c!53315) b!349978))

(assert (= (and d!71205 (not c!53315)) b!349979))

(assert (= (and d!71205 (not res!193974)) b!349980))

(declare-fun m!349777 () Bool)

(assert (=> d!71205 m!349777))

(declare-fun m!349779 () Bool)

(assert (=> b!349978 m!349779))

(declare-fun m!349781 () Bool)

(assert (=> b!349978 m!349781))

(assert (=> b!349978 m!349781))

(declare-fun m!349783 () Bool)

(assert (=> b!349978 m!349783))

(assert (=> b!349980 m!349781))

(assert (=> b!349980 m!349781))

(assert (=> b!349980 m!349783))

(assert (=> b!349818 d!71205))

(declare-fun call!26948 () ListLongMap!4435)

(declare-fun bm!26945 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!606 (array!18807 array!18809 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 32) Int) ListLongMap!4435)

(assert (=> bm!26945 (= call!26948 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!350023 () Bool)

(declare-fun e!214414 () Bool)

(declare-fun e!214408 () Bool)

(assert (=> b!350023 (= e!214414 e!214408)))

(declare-fun res!193995 () Bool)

(declare-fun call!26951 () Bool)

(assert (=> b!350023 (= res!193995 call!26951)))

(assert (=> b!350023 (=> (not res!193995) (not e!214408))))

(declare-fun b!350024 () Bool)

(declare-fun e!214406 () ListLongMap!4435)

(declare-fun call!26950 () ListLongMap!4435)

(declare-fun +!743 (ListLongMap!4435 tuple2!5532) ListLongMap!4435)

(assert (=> b!350024 (= e!214406 (+!743 call!26950 (tuple2!5533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!350025 () Bool)

(declare-fun e!214412 () ListLongMap!4435)

(assert (=> b!350025 (= e!214406 e!214412)))

(declare-fun c!53333 () Bool)

(assert (=> b!350025 (= c!53333 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!350026 () Bool)

(declare-fun lt!164302 () ListLongMap!4435)

(declare-fun e!214410 () Bool)

(declare-fun apply!290 (ListLongMap!4435 (_ BitVec 64)) V!11139)

(declare-fun get!4770 (ValueCell!3467 V!11139) V!11139)

(declare-fun dynLambda!624 (Int (_ BitVec 64)) V!11139)

(assert (=> b!350026 (= e!214410 (= (apply!290 lt!164302 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)) (get!4770 (select (arr!8911 _values!1525) #b00000000000000000000000000000000) (dynLambda!624 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!350026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9264 _values!1525)))))

(assert (=> b!350026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(declare-fun b!350027 () Bool)

(declare-fun e!214404 () Bool)

(declare-fun e!214407 () Bool)

(assert (=> b!350027 (= e!214404 e!214407)))

(declare-fun c!53329 () Bool)

(assert (=> b!350027 (= c!53329 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!350028 () Bool)

(assert (=> b!350028 (= e!214414 (not call!26951))))

(declare-fun b!350029 () Bool)

(declare-fun e!214409 () Bool)

(assert (=> b!350029 (= e!214409 (validKeyInArray!0 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350031 () Bool)

(assert (=> b!350031 (= e!214408 (= (apply!290 lt!164302 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26946 () Bool)

(declare-fun call!26953 () ListLongMap!4435)

(assert (=> bm!26946 (= call!26953 call!26950)))

(declare-fun b!350032 () Bool)

(assert (=> b!350032 (= e!214412 call!26953)))

(declare-fun b!350033 () Bool)

(declare-fun res!193998 () Bool)

(assert (=> b!350033 (=> (not res!193998) (not e!214404))))

(declare-fun e!214415 () Bool)

(assert (=> b!350033 (= res!193998 e!214415)))

(declare-fun res!194000 () Bool)

(assert (=> b!350033 (=> res!194000 e!214415)))

(declare-fun e!214405 () Bool)

(assert (=> b!350033 (= res!194000 (not e!214405))))

(declare-fun res!193997 () Bool)

(assert (=> b!350033 (=> (not res!193997) (not e!214405))))

(assert (=> b!350033 (= res!193997 (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(declare-fun bm!26947 () Bool)

(declare-fun call!26952 () ListLongMap!4435)

(declare-fun call!26954 () ListLongMap!4435)

(assert (=> bm!26947 (= call!26952 call!26954)))

(declare-fun b!350034 () Bool)

(declare-fun e!214413 () Unit!10834)

(declare-fun Unit!10846 () Unit!10834)

(assert (=> b!350034 (= e!214413 Unit!10846)))

(declare-fun b!350035 () Bool)

(declare-fun e!214411 () Bool)

(assert (=> b!350035 (= e!214407 e!214411)))

(declare-fun res!194001 () Bool)

(declare-fun call!26949 () Bool)

(assert (=> b!350035 (= res!194001 call!26949)))

(assert (=> b!350035 (=> (not res!194001) (not e!214411))))

(declare-fun b!350036 () Bool)

(declare-fun lt!164313 () Unit!10834)

(assert (=> b!350036 (= e!214413 lt!164313)))

(declare-fun lt!164297 () ListLongMap!4435)

(assert (=> b!350036 (= lt!164297 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164311 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164316 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164316 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164309 () Unit!10834)

(declare-fun addStillContains!266 (ListLongMap!4435 (_ BitVec 64) V!11139 (_ BitVec 64)) Unit!10834)

(assert (=> b!350036 (= lt!164309 (addStillContains!266 lt!164297 lt!164311 zeroValue!1467 lt!164316))))

(assert (=> b!350036 (contains!2312 (+!743 lt!164297 (tuple2!5533 lt!164311 zeroValue!1467)) lt!164316)))

(declare-fun lt!164295 () Unit!10834)

(assert (=> b!350036 (= lt!164295 lt!164309)))

(declare-fun lt!164305 () ListLongMap!4435)

(assert (=> b!350036 (= lt!164305 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164306 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164306 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164315 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164315 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164307 () Unit!10834)

(declare-fun addApplyDifferent!266 (ListLongMap!4435 (_ BitVec 64) V!11139 (_ BitVec 64)) Unit!10834)

(assert (=> b!350036 (= lt!164307 (addApplyDifferent!266 lt!164305 lt!164306 minValue!1467 lt!164315))))

(assert (=> b!350036 (= (apply!290 (+!743 lt!164305 (tuple2!5533 lt!164306 minValue!1467)) lt!164315) (apply!290 lt!164305 lt!164315))))

(declare-fun lt!164304 () Unit!10834)

(assert (=> b!350036 (= lt!164304 lt!164307)))

(declare-fun lt!164314 () ListLongMap!4435)

(assert (=> b!350036 (= lt!164314 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164298 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164301 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164301 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164308 () Unit!10834)

(assert (=> b!350036 (= lt!164308 (addApplyDifferent!266 lt!164314 lt!164298 zeroValue!1467 lt!164301))))

(assert (=> b!350036 (= (apply!290 (+!743 lt!164314 (tuple2!5533 lt!164298 zeroValue!1467)) lt!164301) (apply!290 lt!164314 lt!164301))))

(declare-fun lt!164312 () Unit!10834)

(assert (=> b!350036 (= lt!164312 lt!164308)))

(declare-fun lt!164303 () ListLongMap!4435)

(assert (=> b!350036 (= lt!164303 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164310 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164310 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164296 () (_ BitVec 64))

(assert (=> b!350036 (= lt!164296 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!350036 (= lt!164313 (addApplyDifferent!266 lt!164303 lt!164310 minValue!1467 lt!164296))))

(assert (=> b!350036 (= (apply!290 (+!743 lt!164303 (tuple2!5533 lt!164310 minValue!1467)) lt!164296) (apply!290 lt!164303 lt!164296))))

(declare-fun b!350037 () Bool)

(declare-fun e!214403 () ListLongMap!4435)

(assert (=> b!350037 (= e!214403 call!26953)))

(declare-fun b!350038 () Bool)

(assert (=> b!350038 (= e!214407 (not call!26949))))

(declare-fun bm!26948 () Bool)

(assert (=> bm!26948 (= call!26951 (contains!2312 lt!164302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!350039 () Bool)

(assert (=> b!350039 (= e!214415 e!214410)))

(declare-fun res!193999 () Bool)

(assert (=> b!350039 (=> (not res!193999) (not e!214410))))

(assert (=> b!350039 (= res!193999 (contains!2312 lt!164302 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!350039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(declare-fun bm!26949 () Bool)

(assert (=> bm!26949 (= call!26954 call!26948)))

(declare-fun b!350040 () Bool)

(assert (=> b!350040 (= e!214411 (= (apply!290 lt!164302 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun d!71207 () Bool)

(assert (=> d!71207 e!214404))

(declare-fun res!193994 () Bool)

(assert (=> d!71207 (=> (not res!193994) (not e!214404))))

(assert (=> d!71207 (= res!193994 (or (bvsge #b00000000000000000000000000000000 (size!9263 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))))

(declare-fun lt!164299 () ListLongMap!4435)

(assert (=> d!71207 (= lt!164302 lt!164299)))

(declare-fun lt!164300 () Unit!10834)

(assert (=> d!71207 (= lt!164300 e!214413)))

(declare-fun c!53330 () Bool)

(assert (=> d!71207 (= c!53330 e!214409)))

(declare-fun res!193993 () Bool)

(assert (=> d!71207 (=> (not res!193993) (not e!214409))))

(assert (=> d!71207 (= res!193993 (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)))))

(assert (=> d!71207 (= lt!164299 e!214406)))

(declare-fun c!53332 () Bool)

(assert (=> d!71207 (= c!53332 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71207 (validMask!0 mask!2385)))

(assert (=> d!71207 (= (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164302)))

(declare-fun b!350030 () Bool)

(declare-fun c!53328 () Bool)

(assert (=> b!350030 (= c!53328 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!350030 (= e!214412 e!214403)))

(declare-fun b!350041 () Bool)

(assert (=> b!350041 (= e!214403 call!26952)))

(declare-fun b!350042 () Bool)

(declare-fun res!193996 () Bool)

(assert (=> b!350042 (=> (not res!193996) (not e!214404))))

(assert (=> b!350042 (= res!193996 e!214414)))

(declare-fun c!53331 () Bool)

(assert (=> b!350042 (= c!53331 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!350043 () Bool)

(assert (=> b!350043 (= e!214405 (validKeyInArray!0 (select (arr!8910 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26950 () Bool)

(assert (=> bm!26950 (= call!26949 (contains!2312 lt!164302 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26951 () Bool)

(assert (=> bm!26951 (= call!26950 (+!743 (ite c!53332 call!26948 (ite c!53333 call!26954 call!26952)) (ite (or c!53332 c!53333) (tuple2!5533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(assert (= (and d!71207 c!53332) b!350024))

(assert (= (and d!71207 (not c!53332)) b!350025))

(assert (= (and b!350025 c!53333) b!350032))

(assert (= (and b!350025 (not c!53333)) b!350030))

(assert (= (and b!350030 c!53328) b!350037))

(assert (= (and b!350030 (not c!53328)) b!350041))

(assert (= (or b!350037 b!350041) bm!26947))

(assert (= (or b!350032 bm!26947) bm!26949))

(assert (= (or b!350032 b!350037) bm!26946))

(assert (= (or b!350024 bm!26949) bm!26945))

(assert (= (or b!350024 bm!26946) bm!26951))

(assert (= (and d!71207 res!193993) b!350029))

(assert (= (and d!71207 c!53330) b!350036))

(assert (= (and d!71207 (not c!53330)) b!350034))

(assert (= (and d!71207 res!193994) b!350033))

(assert (= (and b!350033 res!193997) b!350043))

(assert (= (and b!350033 (not res!194000)) b!350039))

(assert (= (and b!350039 res!193999) b!350026))

(assert (= (and b!350033 res!193998) b!350042))

(assert (= (and b!350042 c!53331) b!350023))

(assert (= (and b!350042 (not c!53331)) b!350028))

(assert (= (and b!350023 res!193995) b!350031))

(assert (= (or b!350023 b!350028) bm!26948))

(assert (= (and b!350042 res!193996) b!350027))

(assert (= (and b!350027 c!53329) b!350035))

(assert (= (and b!350027 (not c!53329)) b!350038))

(assert (= (and b!350035 res!194001) b!350040))

(assert (= (or b!350035 b!350038) bm!26950))

(declare-fun b_lambda!8481 () Bool)

(assert (=> (not b_lambda!8481) (not b!350026)))

(declare-fun t!10280 () Bool)

(declare-fun tb!3087 () Bool)

(assert (=> (and start!34940 (= defaultEntry!1528 defaultEntry!1528) t!10280) tb!3087))

(declare-fun result!5607 () Bool)

(assert (=> tb!3087 (= result!5607 tp_is_empty!7621)))

(assert (=> b!350026 t!10280))

(declare-fun b_and!14877 () Bool)

(assert (= b_and!14871 (and (=> t!10280 result!5607) b_and!14877)))

(declare-fun m!349785 () Bool)

(assert (=> bm!26950 m!349785))

(declare-fun m!349787 () Bool)

(assert (=> bm!26948 m!349787))

(assert (=> b!350029 m!349763))

(assert (=> b!350029 m!349763))

(assert (=> b!350029 m!349765))

(assert (=> b!350039 m!349763))

(assert (=> b!350039 m!349763))

(declare-fun m!349789 () Bool)

(assert (=> b!350039 m!349789))

(declare-fun m!349791 () Bool)

(assert (=> b!350031 m!349791))

(declare-fun m!349793 () Bool)

(assert (=> b!350036 m!349793))

(declare-fun m!349795 () Bool)

(assert (=> b!350036 m!349795))

(declare-fun m!349797 () Bool)

(assert (=> b!350036 m!349797))

(declare-fun m!349799 () Bool)

(assert (=> b!350036 m!349799))

(declare-fun m!349801 () Bool)

(assert (=> b!350036 m!349801))

(declare-fun m!349803 () Bool)

(assert (=> b!350036 m!349803))

(declare-fun m!349805 () Bool)

(assert (=> b!350036 m!349805))

(declare-fun m!349807 () Bool)

(assert (=> b!350036 m!349807))

(declare-fun m!349809 () Bool)

(assert (=> b!350036 m!349809))

(declare-fun m!349811 () Bool)

(assert (=> b!350036 m!349811))

(declare-fun m!349813 () Bool)

(assert (=> b!350036 m!349813))

(declare-fun m!349815 () Bool)

(assert (=> b!350036 m!349815))

(declare-fun m!349817 () Bool)

(assert (=> b!350036 m!349817))

(assert (=> b!350036 m!349805))

(declare-fun m!349819 () Bool)

(assert (=> b!350036 m!349819))

(declare-fun m!349821 () Bool)

(assert (=> b!350036 m!349821))

(assert (=> b!350036 m!349763))

(assert (=> b!350036 m!349793))

(assert (=> b!350036 m!349801))

(declare-fun m!349823 () Bool)

(assert (=> b!350036 m!349823))

(assert (=> b!350036 m!349809))

(declare-fun m!349825 () Bool)

(assert (=> b!350040 m!349825))

(declare-fun m!349827 () Bool)

(assert (=> b!350024 m!349827))

(assert (=> b!350043 m!349763))

(assert (=> b!350043 m!349763))

(assert (=> b!350043 m!349765))

(assert (=> b!350026 m!349763))

(declare-fun m!349829 () Bool)

(assert (=> b!350026 m!349829))

(declare-fun m!349831 () Bool)

(assert (=> b!350026 m!349831))

(declare-fun m!349833 () Bool)

(assert (=> b!350026 m!349833))

(assert (=> b!350026 m!349829))

(assert (=> b!350026 m!349831))

(assert (=> b!350026 m!349763))

(declare-fun m!349835 () Bool)

(assert (=> b!350026 m!349835))

(assert (=> bm!26945 m!349817))

(declare-fun m!349837 () Bool)

(assert (=> bm!26951 m!349837))

(assert (=> d!71207 m!349669))

(assert (=> b!349818 d!71207))

(declare-fun b!350058 () Bool)

(declare-fun e!214423 () SeekEntryResult!3434)

(declare-fun e!214422 () SeekEntryResult!3434)

(assert (=> b!350058 (= e!214423 e!214422)))

(declare-fun lt!164323 () (_ BitVec 64))

(declare-fun lt!164324 () SeekEntryResult!3434)

(assert (=> b!350058 (= lt!164323 (select (arr!8910 _keys!1895) (index!15917 lt!164324)))))

(declare-fun c!53340 () Bool)

(assert (=> b!350058 (= c!53340 (= lt!164323 k0!1348))))

(declare-fun b!350059 () Bool)

(declare-fun e!214424 () SeekEntryResult!3434)

(assert (=> b!350059 (= e!214424 (MissingZero!3434 (index!15917 lt!164324)))))

(declare-fun b!350060 () Bool)

(assert (=> b!350060 (= e!214422 (Found!3434 (index!15917 lt!164324)))))

(declare-fun b!350062 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18807 (_ BitVec 32)) SeekEntryResult!3434)

(assert (=> b!350062 (= e!214424 (seekKeyOrZeroReturnVacant!0 (x!34851 lt!164324) (index!15917 lt!164324) (index!15917 lt!164324) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350063 () Bool)

(assert (=> b!350063 (= e!214423 Undefined!3434)))

(declare-fun b!350061 () Bool)

(declare-fun c!53342 () Bool)

(assert (=> b!350061 (= c!53342 (= lt!164323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!350061 (= e!214422 e!214424)))

(declare-fun d!71209 () Bool)

(declare-fun lt!164325 () SeekEntryResult!3434)

(assert (=> d!71209 (and (or ((_ is Undefined!3434) lt!164325) (not ((_ is Found!3434) lt!164325)) (and (bvsge (index!15916 lt!164325) #b00000000000000000000000000000000) (bvslt (index!15916 lt!164325) (size!9263 _keys!1895)))) (or ((_ is Undefined!3434) lt!164325) ((_ is Found!3434) lt!164325) (not ((_ is MissingZero!3434) lt!164325)) (and (bvsge (index!15915 lt!164325) #b00000000000000000000000000000000) (bvslt (index!15915 lt!164325) (size!9263 _keys!1895)))) (or ((_ is Undefined!3434) lt!164325) ((_ is Found!3434) lt!164325) ((_ is MissingZero!3434) lt!164325) (not ((_ is MissingVacant!3434) lt!164325)) (and (bvsge (index!15918 lt!164325) #b00000000000000000000000000000000) (bvslt (index!15918 lt!164325) (size!9263 _keys!1895)))) (or ((_ is Undefined!3434) lt!164325) (ite ((_ is Found!3434) lt!164325) (= (select (arr!8910 _keys!1895) (index!15916 lt!164325)) k0!1348) (ite ((_ is MissingZero!3434) lt!164325) (= (select (arr!8910 _keys!1895) (index!15915 lt!164325)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3434) lt!164325) (= (select (arr!8910 _keys!1895) (index!15918 lt!164325)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71209 (= lt!164325 e!214423)))

(declare-fun c!53341 () Bool)

(assert (=> d!71209 (= c!53341 (and ((_ is Intermediate!3434) lt!164324) (undefined!4246 lt!164324)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18807 (_ BitVec 32)) SeekEntryResult!3434)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71209 (= lt!164324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71209 (validMask!0 mask!2385)))

(assert (=> d!71209 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164325)))

(assert (= (and d!71209 c!53341) b!350063))

(assert (= (and d!71209 (not c!53341)) b!350058))

(assert (= (and b!350058 c!53340) b!350060))

(assert (= (and b!350058 (not c!53340)) b!350061))

(assert (= (and b!350061 c!53342) b!350059))

(assert (= (and b!350061 (not c!53342)) b!350062))

(declare-fun m!349839 () Bool)

(assert (=> b!350058 m!349839))

(declare-fun m!349841 () Bool)

(assert (=> b!350062 m!349841))

(declare-fun m!349843 () Bool)

(assert (=> d!71209 m!349843))

(declare-fun m!349845 () Bool)

(assert (=> d!71209 m!349845))

(declare-fun m!349847 () Bool)

(assert (=> d!71209 m!349847))

(declare-fun m!349849 () Bool)

(assert (=> d!71209 m!349849))

(declare-fun m!349851 () Bool)

(assert (=> d!71209 m!349851))

(assert (=> d!71209 m!349845))

(assert (=> d!71209 m!349669))

(assert (=> b!349827 d!71209))

(declare-fun d!71211 () Bool)

(declare-fun res!194006 () Bool)

(declare-fun e!214429 () Bool)

(assert (=> d!71211 (=> res!194006 e!214429)))

(assert (=> d!71211 (= res!194006 (= (select (arr!8910 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71211 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!214429)))

(declare-fun b!350068 () Bool)

(declare-fun e!214430 () Bool)

(assert (=> b!350068 (= e!214429 e!214430)))

(declare-fun res!194007 () Bool)

(assert (=> b!350068 (=> (not res!194007) (not e!214430))))

(assert (=> b!350068 (= res!194007 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9263 _keys!1895)))))

(declare-fun b!350069 () Bool)

(assert (=> b!350069 (= e!214430 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71211 (not res!194006)) b!350068))

(assert (= (and b!350068 res!194007) b!350069))

(assert (=> d!71211 m!349763))

(declare-fun m!349853 () Bool)

(assert (=> b!350069 m!349853))

(assert (=> b!349817 d!71211))

(declare-fun d!71213 () Bool)

(assert (=> d!71213 (contains!2312 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!164328 () Unit!10834)

(declare-fun choose!1314 (array!18807 array!18809 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 64) (_ BitVec 32) Int) Unit!10834)

(assert (=> d!71213 (= lt!164328 (choose!1314 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71213 (validMask!0 mask!2385)))

(assert (=> d!71213 (= (lemmaArrayContainsKeyThenInListMap!326 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!164328)))

(declare-fun bs!11910 () Bool)

(assert (= bs!11910 d!71213))

(assert (=> bs!11910 m!349693))

(assert (=> bs!11910 m!349693))

(assert (=> bs!11910 m!349695))

(assert (=> bs!11910 m!349681))

(declare-fun m!349855 () Bool)

(assert (=> bs!11910 m!349855))

(assert (=> bs!11910 m!349669))

(assert (=> b!349816 d!71213))

(declare-fun d!71215 () Bool)

(declare-fun lt!164331 () (_ BitVec 32))

(assert (=> d!71215 (and (or (bvslt lt!164331 #b00000000000000000000000000000000) (bvsge lt!164331 (size!9263 _keys!1895)) (and (bvsge lt!164331 #b00000000000000000000000000000000) (bvslt lt!164331 (size!9263 _keys!1895)))) (bvsge lt!164331 #b00000000000000000000000000000000) (bvslt lt!164331 (size!9263 _keys!1895)) (= (select (arr!8910 _keys!1895) lt!164331) k0!1348))))

(declare-fun e!214433 () (_ BitVec 32))

(assert (=> d!71215 (= lt!164331 e!214433)))

(declare-fun c!53345 () Bool)

(assert (=> d!71215 (= c!53345 (= (select (arr!8910 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9263 _keys!1895)) (bvslt (size!9263 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71215 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164331)))

(declare-fun b!350074 () Bool)

(assert (=> b!350074 (= e!214433 #b00000000000000000000000000000000)))

(declare-fun b!350075 () Bool)

(assert (=> b!350075 (= e!214433 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71215 c!53345) b!350074))

(assert (= (and d!71215 (not c!53345)) b!350075))

(declare-fun m!349857 () Bool)

(assert (=> d!71215 m!349857))

(assert (=> d!71215 m!349763))

(declare-fun m!349859 () Bool)

(assert (=> b!350075 m!349859))

(assert (=> b!349816 d!71215))

(declare-fun d!71217 () Bool)

(assert (=> d!71217 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34940 d!71217))

(declare-fun d!71219 () Bool)

(assert (=> d!71219 (= (array_inv!6608 _values!1525) (bvsge (size!9264 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34940 d!71219))

(declare-fun d!71221 () Bool)

(assert (=> d!71221 (= (array_inv!6609 _keys!1895) (bvsge (size!9263 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34940 d!71221))

(declare-fun mapIsEmpty!12909 () Bool)

(declare-fun mapRes!12909 () Bool)

(assert (=> mapIsEmpty!12909 mapRes!12909))

(declare-fun b!350082 () Bool)

(declare-fun e!214438 () Bool)

(assert (=> b!350082 (= e!214438 tp_is_empty!7621)))

(declare-fun mapNonEmpty!12909 () Bool)

(declare-fun tp!26598 () Bool)

(assert (=> mapNonEmpty!12909 (= mapRes!12909 (and tp!26598 e!214438))))

(declare-fun mapRest!12909 () (Array (_ BitVec 32) ValueCell!3467))

(declare-fun mapKey!12909 () (_ BitVec 32))

(declare-fun mapValue!12909 () ValueCell!3467)

(assert (=> mapNonEmpty!12909 (= mapRest!12900 (store mapRest!12909 mapKey!12909 mapValue!12909))))

(declare-fun b!350083 () Bool)

(declare-fun e!214439 () Bool)

(assert (=> b!350083 (= e!214439 tp_is_empty!7621)))

(declare-fun condMapEmpty!12909 () Bool)

(declare-fun mapDefault!12909 () ValueCell!3467)

(assert (=> mapNonEmpty!12900 (= condMapEmpty!12909 (= mapRest!12900 ((as const (Array (_ BitVec 32) ValueCell!3467)) mapDefault!12909)))))

(assert (=> mapNonEmpty!12900 (= tp!26582 (and e!214439 mapRes!12909))))

(assert (= (and mapNonEmpty!12900 condMapEmpty!12909) mapIsEmpty!12909))

(assert (= (and mapNonEmpty!12900 (not condMapEmpty!12909)) mapNonEmpty!12909))

(assert (= (and mapNonEmpty!12909 ((_ is ValueCellFull!3467) mapValue!12909)) b!350082))

(assert (= (and mapNonEmpty!12900 ((_ is ValueCellFull!3467) mapDefault!12909)) b!350083))

(declare-fun m!349861 () Bool)

(assert (=> mapNonEmpty!12909 m!349861))

(declare-fun b_lambda!8483 () Bool)

(assert (= b_lambda!8481 (or (and start!34940 b_free!7669) b_lambda!8483)))

(check-sat (not b!350039) (not b!350024) (not b!350043) (not d!71213) (not b!350062) tp_is_empty!7621 (not b!349980) (not bm!26930) (not b!349978) (not bm!26951) (not b!350075) (not b!349971) (not b!349969) (not b_next!7669) (not bm!26950) (not b!350036) (not d!71209) b_and!14877 (not d!71205) (not b!349967) (not b!349956) (not b!350029) (not b!349953) (not b!350069) (not bm!26948) (not bm!26927) (not b!350026) (not bm!26945) (not b_lambda!8483) (not b!350040) (not d!71207) (not mapNonEmpty!12909) (not b!350031))
(check-sat b_and!14877 (not b_next!7669))
