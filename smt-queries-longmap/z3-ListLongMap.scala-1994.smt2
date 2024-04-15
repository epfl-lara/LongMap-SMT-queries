; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34834 () Bool)

(assert start!34834)

(declare-fun b_free!7633 () Bool)

(declare-fun b_next!7633 () Bool)

(assert (=> start!34834 (= b_free!7633 (not b_next!7633))))

(declare-fun tp!26465 () Bool)

(declare-fun b_and!14829 () Bool)

(assert (=> start!34834 (= tp!26465 b_and!14829)))

(declare-fun b!348729 () Bool)

(declare-fun res!193301 () Bool)

(declare-fun e!213618 () Bool)

(assert (=> b!348729 (=> (not res!193301) (not e!213618))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11091 0))(
  ( (V!11092 (val!3837 Int)) )
))
(declare-datatypes ((ValueCell!3449 0))(
  ( (ValueCellFull!3449 (v!6014 V!11091)) (EmptyCell!3449) )
))
(declare-datatypes ((array!18733 0))(
  ( (array!18734 (arr!8876 (Array (_ BitVec 32) ValueCell!3449)) (size!9229 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18733)

(declare-datatypes ((array!18735 0))(
  ( (array!18736 (arr!8877 (Array (_ BitVec 32) (_ BitVec 64))) (size!9230 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18735)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348729 (= res!193301 (and (= (size!9229 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9230 _keys!1895) (size!9229 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12837 () Bool)

(declare-fun mapRes!12837 () Bool)

(assert (=> mapIsEmpty!12837 mapRes!12837))

(declare-fun res!193298 () Bool)

(assert (=> start!34834 (=> (not res!193298) (not e!213618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34834 (= res!193298 (validMask!0 mask!2385))))

(assert (=> start!34834 e!213618))

(assert (=> start!34834 true))

(declare-fun tp_is_empty!7585 () Bool)

(assert (=> start!34834 tp_is_empty!7585))

(assert (=> start!34834 tp!26465))

(declare-fun e!213615 () Bool)

(declare-fun array_inv!6586 (array!18733) Bool)

(assert (=> start!34834 (and (array_inv!6586 _values!1525) e!213615)))

(declare-fun array_inv!6587 (array!18735) Bool)

(assert (=> start!34834 (array_inv!6587 _keys!1895)))

(declare-fun b!348730 () Bool)

(declare-fun res!193303 () Bool)

(assert (=> b!348730 (=> (not res!193303) (not e!213618))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11091)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11091)

(declare-datatypes ((tuple2!5510 0))(
  ( (tuple2!5511 (_1!2766 (_ BitVec 64)) (_2!2766 V!11091)) )
))
(declare-datatypes ((List!5123 0))(
  ( (Nil!5120) (Cons!5119 (h!5975 tuple2!5510) (t!10244 List!5123)) )
))
(declare-datatypes ((ListLongMap!4413 0))(
  ( (ListLongMap!4414 (toList!2222 List!5123)) )
))
(declare-fun contains!2298 (ListLongMap!4413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1727 (array!18735 array!18733 (_ BitVec 32) (_ BitVec 32) V!11091 V!11091 (_ BitVec 32) Int) ListLongMap!4413)

(assert (=> b!348730 (= res!193303 (not (contains!2298 (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348731 () Bool)

(declare-fun e!213613 () Bool)

(assert (=> b!348731 (= e!213618 e!213613)))

(declare-fun res!193300 () Bool)

(assert (=> b!348731 (=> (not res!193300) (not e!213613))))

(declare-datatypes ((SeekEntryResult!3421 0))(
  ( (MissingZero!3421 (index!15863 (_ BitVec 32))) (Found!3421 (index!15864 (_ BitVec 32))) (Intermediate!3421 (undefined!4233 Bool) (index!15865 (_ BitVec 32)) (x!34760 (_ BitVec 32))) (Undefined!3421) (MissingVacant!3421 (index!15866 (_ BitVec 32))) )
))
(declare-fun lt!163745 () SeekEntryResult!3421)

(get-info :version)

(assert (=> b!348731 (= res!193300 (and (not ((_ is Found!3421) lt!163745)) ((_ is MissingZero!3421) lt!163745)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18735 (_ BitVec 32)) SeekEntryResult!3421)

(assert (=> b!348731 (= lt!163745 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348732 () Bool)

(declare-fun res!193296 () Bool)

(assert (=> b!348732 (=> (not res!193296) (not e!213618))))

(declare-datatypes ((List!5124 0))(
  ( (Nil!5121) (Cons!5120 (h!5976 (_ BitVec 64)) (t!10245 List!5124)) )
))
(declare-fun arrayNoDuplicates!0 (array!18735 (_ BitVec 32) List!5124) Bool)

(assert (=> b!348732 (= res!193296 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5121))))

(declare-fun b!348733 () Bool)

(declare-fun res!193302 () Bool)

(assert (=> b!348733 (=> (not res!193302) (not e!213613))))

(declare-fun arrayContainsKey!0 (array!18735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348733 (= res!193302 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12837 () Bool)

(declare-fun tp!26466 () Bool)

(declare-fun e!213614 () Bool)

(assert (=> mapNonEmpty!12837 (= mapRes!12837 (and tp!26466 e!213614))))

(declare-fun mapKey!12837 () (_ BitVec 32))

(declare-fun mapRest!12837 () (Array (_ BitVec 32) ValueCell!3449))

(declare-fun mapValue!12837 () ValueCell!3449)

(assert (=> mapNonEmpty!12837 (= (arr!8876 _values!1525) (store mapRest!12837 mapKey!12837 mapValue!12837))))

(declare-fun b!348734 () Bool)

(declare-fun res!193299 () Bool)

(assert (=> b!348734 (=> (not res!193299) (not e!213618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348734 (= res!193299 (validKeyInArray!0 k0!1348))))

(declare-fun b!348735 () Bool)

(declare-fun lt!163746 () (_ BitVec 32))

(assert (=> b!348735 (= e!213613 (or (bvslt lt!163746 #b00000000000000000000000000000000) (bvsge lt!163746 (size!9230 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18735 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348735 (= lt!163746 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348736 () Bool)

(declare-fun e!213616 () Bool)

(assert (=> b!348736 (= e!213615 (and e!213616 mapRes!12837))))

(declare-fun condMapEmpty!12837 () Bool)

(declare-fun mapDefault!12837 () ValueCell!3449)

(assert (=> b!348736 (= condMapEmpty!12837 (= (arr!8876 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3449)) mapDefault!12837)))))

(declare-fun b!348737 () Bool)

(assert (=> b!348737 (= e!213614 tp_is_empty!7585)))

(declare-fun b!348738 () Bool)

(assert (=> b!348738 (= e!213616 tp_is_empty!7585)))

(declare-fun b!348739 () Bool)

(declare-fun res!193297 () Bool)

(assert (=> b!348739 (=> (not res!193297) (not e!213618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18735 (_ BitVec 32)) Bool)

(assert (=> b!348739 (= res!193297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34834 res!193298) b!348729))

(assert (= (and b!348729 res!193301) b!348739))

(assert (= (and b!348739 res!193297) b!348732))

(assert (= (and b!348732 res!193296) b!348734))

(assert (= (and b!348734 res!193299) b!348730))

(assert (= (and b!348730 res!193303) b!348731))

(assert (= (and b!348731 res!193300) b!348733))

(assert (= (and b!348733 res!193302) b!348735))

(assert (= (and b!348736 condMapEmpty!12837) mapIsEmpty!12837))

(assert (= (and b!348736 (not condMapEmpty!12837)) mapNonEmpty!12837))

(assert (= (and mapNonEmpty!12837 ((_ is ValueCellFull!3449) mapValue!12837)) b!348737))

(assert (= (and b!348736 ((_ is ValueCellFull!3449) mapDefault!12837)) b!348738))

(assert (= start!34834 b!348736))

(declare-fun m!348891 () Bool)

(assert (=> start!34834 m!348891))

(declare-fun m!348893 () Bool)

(assert (=> start!34834 m!348893))

(declare-fun m!348895 () Bool)

(assert (=> start!34834 m!348895))

(declare-fun m!348897 () Bool)

(assert (=> b!348739 m!348897))

(declare-fun m!348899 () Bool)

(assert (=> b!348730 m!348899))

(assert (=> b!348730 m!348899))

(declare-fun m!348901 () Bool)

(assert (=> b!348730 m!348901))

(declare-fun m!348903 () Bool)

(assert (=> b!348732 m!348903))

(declare-fun m!348905 () Bool)

(assert (=> mapNonEmpty!12837 m!348905))

(declare-fun m!348907 () Bool)

(assert (=> b!348734 m!348907))

(declare-fun m!348909 () Bool)

(assert (=> b!348733 m!348909))

(declare-fun m!348911 () Bool)

(assert (=> b!348735 m!348911))

(declare-fun m!348913 () Bool)

(assert (=> b!348731 m!348913))

(check-sat (not start!34834) (not b!348733) (not b!348730) (not b!348735) (not b!348734) b_and!14829 (not b!348731) (not mapNonEmpty!12837) (not b!348739) (not b_next!7633) (not b!348732) tp_is_empty!7585)
(check-sat b_and!14829 (not b_next!7633))
(get-model)

(declare-fun b!348819 () Bool)

(declare-fun e!213662 () SeekEntryResult!3421)

(declare-fun lt!163766 () SeekEntryResult!3421)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18735 (_ BitVec 32)) SeekEntryResult!3421)

(assert (=> b!348819 (= e!213662 (seekKeyOrZeroReturnVacant!0 (x!34760 lt!163766) (index!15865 lt!163766) (index!15865 lt!163766) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348820 () Bool)

(declare-fun e!213663 () SeekEntryResult!3421)

(assert (=> b!348820 (= e!213663 Undefined!3421)))

(declare-fun b!348821 () Bool)

(declare-fun e!213661 () SeekEntryResult!3421)

(assert (=> b!348821 (= e!213663 e!213661)))

(declare-fun lt!163767 () (_ BitVec 64))

(assert (=> b!348821 (= lt!163767 (select (arr!8877 _keys!1895) (index!15865 lt!163766)))))

(declare-fun c!53144 () Bool)

(assert (=> b!348821 (= c!53144 (= lt!163767 k0!1348))))

(declare-fun b!348822 () Bool)

(declare-fun c!53142 () Bool)

(assert (=> b!348822 (= c!53142 (= lt!163767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!348822 (= e!213661 e!213662)))

(declare-fun b!348823 () Bool)

(assert (=> b!348823 (= e!213662 (MissingZero!3421 (index!15865 lt!163766)))))

(declare-fun d!71113 () Bool)

(declare-fun lt!163765 () SeekEntryResult!3421)

(assert (=> d!71113 (and (or ((_ is Undefined!3421) lt!163765) (not ((_ is Found!3421) lt!163765)) (and (bvsge (index!15864 lt!163765) #b00000000000000000000000000000000) (bvslt (index!15864 lt!163765) (size!9230 _keys!1895)))) (or ((_ is Undefined!3421) lt!163765) ((_ is Found!3421) lt!163765) (not ((_ is MissingZero!3421) lt!163765)) (and (bvsge (index!15863 lt!163765) #b00000000000000000000000000000000) (bvslt (index!15863 lt!163765) (size!9230 _keys!1895)))) (or ((_ is Undefined!3421) lt!163765) ((_ is Found!3421) lt!163765) ((_ is MissingZero!3421) lt!163765) (not ((_ is MissingVacant!3421) lt!163765)) (and (bvsge (index!15866 lt!163765) #b00000000000000000000000000000000) (bvslt (index!15866 lt!163765) (size!9230 _keys!1895)))) (or ((_ is Undefined!3421) lt!163765) (ite ((_ is Found!3421) lt!163765) (= (select (arr!8877 _keys!1895) (index!15864 lt!163765)) k0!1348) (ite ((_ is MissingZero!3421) lt!163765) (= (select (arr!8877 _keys!1895) (index!15863 lt!163765)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3421) lt!163765) (= (select (arr!8877 _keys!1895) (index!15866 lt!163765)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71113 (= lt!163765 e!213663)))

(declare-fun c!53143 () Bool)

(assert (=> d!71113 (= c!53143 (and ((_ is Intermediate!3421) lt!163766) (undefined!4233 lt!163766)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18735 (_ BitVec 32)) SeekEntryResult!3421)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71113 (= lt!163766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71113 (validMask!0 mask!2385)))

(assert (=> d!71113 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163765)))

(declare-fun b!348818 () Bool)

(assert (=> b!348818 (= e!213661 (Found!3421 (index!15865 lt!163766)))))

(assert (= (and d!71113 c!53143) b!348820))

(assert (= (and d!71113 (not c!53143)) b!348821))

(assert (= (and b!348821 c!53144) b!348818))

(assert (= (and b!348821 (not c!53144)) b!348822))

(assert (= (and b!348822 c!53142) b!348823))

(assert (= (and b!348822 (not c!53142)) b!348819))

(declare-fun m!348963 () Bool)

(assert (=> b!348819 m!348963))

(declare-fun m!348965 () Bool)

(assert (=> b!348821 m!348965))

(declare-fun m!348967 () Bool)

(assert (=> d!71113 m!348967))

(declare-fun m!348969 () Bool)

(assert (=> d!71113 m!348969))

(declare-fun m!348971 () Bool)

(assert (=> d!71113 m!348971))

(declare-fun m!348973 () Bool)

(assert (=> d!71113 m!348973))

(assert (=> d!71113 m!348891))

(declare-fun m!348975 () Bool)

(assert (=> d!71113 m!348975))

(assert (=> d!71113 m!348967))

(assert (=> b!348731 d!71113))

(declare-fun bm!26837 () Bool)

(declare-fun call!26840 () Bool)

(declare-fun c!53147 () Bool)

(assert (=> bm!26837 (= call!26840 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53147 (Cons!5120 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000) Nil!5121) Nil!5121)))))

(declare-fun b!348834 () Bool)

(declare-fun e!213672 () Bool)

(declare-fun contains!2300 (List!5124 (_ BitVec 64)) Bool)

(assert (=> b!348834 (= e!213672 (contains!2300 Nil!5121 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!348835 () Bool)

(declare-fun e!213673 () Bool)

(declare-fun e!213674 () Bool)

(assert (=> b!348835 (= e!213673 e!213674)))

(declare-fun res!193359 () Bool)

(assert (=> b!348835 (=> (not res!193359) (not e!213674))))

(assert (=> b!348835 (= res!193359 (not e!213672))))

(declare-fun res!193358 () Bool)

(assert (=> b!348835 (=> (not res!193358) (not e!213672))))

(assert (=> b!348835 (= res!193358 (validKeyInArray!0 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!348836 () Bool)

(declare-fun e!213675 () Bool)

(assert (=> b!348836 (= e!213675 call!26840)))

(declare-fun b!348837 () Bool)

(assert (=> b!348837 (= e!213675 call!26840)))

(declare-fun d!71115 () Bool)

(declare-fun res!193360 () Bool)

(assert (=> d!71115 (=> res!193360 e!213673)))

(assert (=> d!71115 (= res!193360 (bvsge #b00000000000000000000000000000000 (size!9230 _keys!1895)))))

(assert (=> d!71115 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5121) e!213673)))

(declare-fun b!348838 () Bool)

(assert (=> b!348838 (= e!213674 e!213675)))

(assert (=> b!348838 (= c!53147 (validKeyInArray!0 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71115 (not res!193360)) b!348835))

(assert (= (and b!348835 res!193358) b!348834))

(assert (= (and b!348835 res!193359) b!348838))

(assert (= (and b!348838 c!53147) b!348836))

(assert (= (and b!348838 (not c!53147)) b!348837))

(assert (= (or b!348836 b!348837) bm!26837))

(declare-fun m!348977 () Bool)

(assert (=> bm!26837 m!348977))

(declare-fun m!348979 () Bool)

(assert (=> bm!26837 m!348979))

(assert (=> b!348834 m!348977))

(assert (=> b!348834 m!348977))

(declare-fun m!348981 () Bool)

(assert (=> b!348834 m!348981))

(assert (=> b!348835 m!348977))

(assert (=> b!348835 m!348977))

(declare-fun m!348983 () Bool)

(assert (=> b!348835 m!348983))

(assert (=> b!348838 m!348977))

(assert (=> b!348838 m!348977))

(assert (=> b!348838 m!348983))

(assert (=> b!348732 d!71115))

(declare-fun d!71117 () Bool)

(declare-fun e!213680 () Bool)

(assert (=> d!71117 e!213680))

(declare-fun res!193363 () Bool)

(assert (=> d!71117 (=> res!193363 e!213680)))

(declare-fun lt!163777 () Bool)

(assert (=> d!71117 (= res!193363 (not lt!163777))))

(declare-fun lt!163778 () Bool)

(assert (=> d!71117 (= lt!163777 lt!163778)))

(declare-datatypes ((Unit!10792 0))(
  ( (Unit!10793) )
))
(declare-fun lt!163776 () Unit!10792)

(declare-fun e!213681 () Unit!10792)

(assert (=> d!71117 (= lt!163776 e!213681)))

(declare-fun c!53150 () Bool)

(assert (=> d!71117 (= c!53150 lt!163778)))

(declare-fun containsKey!335 (List!5123 (_ BitVec 64)) Bool)

(assert (=> d!71117 (= lt!163778 (containsKey!335 (toList!2222 (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71117 (= (contains!2298 (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163777)))

(declare-fun b!348845 () Bool)

(declare-fun lt!163779 () Unit!10792)

(assert (=> b!348845 (= e!213681 lt!163779)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!284 (List!5123 (_ BitVec 64)) Unit!10792)

(assert (=> b!348845 (= lt!163779 (lemmaContainsKeyImpliesGetValueByKeyDefined!284 (toList!2222 (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!349 0))(
  ( (Some!348 (v!6017 V!11091)) (None!347) )
))
(declare-fun isDefined!285 (Option!349) Bool)

(declare-fun getValueByKey!343 (List!5123 (_ BitVec 64)) Option!349)

(assert (=> b!348845 (isDefined!285 (getValueByKey!343 (toList!2222 (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!348846 () Bool)

(declare-fun Unit!10794 () Unit!10792)

(assert (=> b!348846 (= e!213681 Unit!10794)))

(declare-fun b!348847 () Bool)

(assert (=> b!348847 (= e!213680 (isDefined!285 (getValueByKey!343 (toList!2222 (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71117 c!53150) b!348845))

(assert (= (and d!71117 (not c!53150)) b!348846))

(assert (= (and d!71117 (not res!193363)) b!348847))

(declare-fun m!348985 () Bool)

(assert (=> d!71117 m!348985))

(declare-fun m!348987 () Bool)

(assert (=> b!348845 m!348987))

(declare-fun m!348989 () Bool)

(assert (=> b!348845 m!348989))

(assert (=> b!348845 m!348989))

(declare-fun m!348991 () Bool)

(assert (=> b!348845 m!348991))

(assert (=> b!348847 m!348989))

(assert (=> b!348847 m!348989))

(assert (=> b!348847 m!348991))

(assert (=> b!348730 d!71117))

(declare-fun b!348890 () Bool)

(declare-fun e!213720 () Bool)

(assert (=> b!348890 (= e!213720 (validKeyInArray!0 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!348891 () Bool)

(declare-fun e!213708 () ListLongMap!4413)

(declare-fun e!213715 () ListLongMap!4413)

(assert (=> b!348891 (= e!213708 e!213715)))

(declare-fun c!53164 () Bool)

(assert (=> b!348891 (= c!53164 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26852 () Bool)

(declare-fun call!26860 () Bool)

(declare-fun lt!163843 () ListLongMap!4413)

(assert (=> bm!26852 (= call!26860 (contains!2298 lt!163843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!348892 () Bool)

(declare-fun e!213711 () ListLongMap!4413)

(declare-fun call!26858 () ListLongMap!4413)

(assert (=> b!348892 (= e!213711 call!26858)))

(declare-fun bm!26853 () Bool)

(declare-fun call!26861 () ListLongMap!4413)

(declare-fun call!26857 () ListLongMap!4413)

(assert (=> bm!26853 (= call!26861 call!26857)))

(declare-fun b!348893 () Bool)

(declare-fun e!213716 () Bool)

(declare-fun e!213710 () Bool)

(assert (=> b!348893 (= e!213716 e!213710)))

(declare-fun c!53165 () Bool)

(assert (=> b!348893 (= c!53165 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!348894 () Bool)

(declare-fun e!213713 () Bool)

(declare-fun apply!287 (ListLongMap!4413 (_ BitVec 64)) V!11091)

(assert (=> b!348894 (= e!213713 (= (apply!287 lt!163843 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26854 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!603 (array!18735 array!18733 (_ BitVec 32) (_ BitVec 32) V!11091 V!11091 (_ BitVec 32) Int) ListLongMap!4413)

(assert (=> bm!26854 (= call!26857 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!348895 () Bool)

(declare-fun call!26856 () ListLongMap!4413)

(declare-fun +!740 (ListLongMap!4413 tuple2!5510) ListLongMap!4413)

(assert (=> b!348895 (= e!213708 (+!740 call!26856 (tuple2!5511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!348896 () Bool)

(declare-fun e!213718 () Unit!10792)

(declare-fun Unit!10795 () Unit!10792)

(assert (=> b!348896 (= e!213718 Unit!10795)))

(declare-fun b!348897 () Bool)

(declare-fun res!193382 () Bool)

(assert (=> b!348897 (=> (not res!193382) (not e!213716))))

(declare-fun e!213719 () Bool)

(assert (=> b!348897 (= res!193382 e!213719)))

(declare-fun c!53167 () Bool)

(assert (=> b!348897 (= c!53167 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!348898 () Bool)

(declare-fun e!213717 () Bool)

(assert (=> b!348898 (= e!213710 e!213717)))

(declare-fun res!193385 () Bool)

(declare-fun call!26855 () Bool)

(assert (=> b!348898 (= res!193385 call!26855)))

(assert (=> b!348898 (=> (not res!193385) (not e!213717))))

(declare-fun b!348899 () Bool)

(declare-fun c!53163 () Bool)

(assert (=> b!348899 (= c!53163 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!348899 (= e!213715 e!213711)))

(declare-fun bm!26855 () Bool)

(assert (=> bm!26855 (= call!26855 (contains!2298 lt!163843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!348900 () Bool)

(declare-fun lt!163845 () Unit!10792)

(assert (=> b!348900 (= e!213718 lt!163845)))

(declare-fun lt!163837 () ListLongMap!4413)

(assert (=> b!348900 (= lt!163837 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163838 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163838 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163824 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163824 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163839 () Unit!10792)

(declare-fun addStillContains!263 (ListLongMap!4413 (_ BitVec 64) V!11091 (_ BitVec 64)) Unit!10792)

(assert (=> b!348900 (= lt!163839 (addStillContains!263 lt!163837 lt!163838 zeroValue!1467 lt!163824))))

(assert (=> b!348900 (contains!2298 (+!740 lt!163837 (tuple2!5511 lt!163838 zeroValue!1467)) lt!163824)))

(declare-fun lt!163831 () Unit!10792)

(assert (=> b!348900 (= lt!163831 lt!163839)))

(declare-fun lt!163826 () ListLongMap!4413)

(assert (=> b!348900 (= lt!163826 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163842 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163841 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163841 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163835 () Unit!10792)

(declare-fun addApplyDifferent!263 (ListLongMap!4413 (_ BitVec 64) V!11091 (_ BitVec 64)) Unit!10792)

(assert (=> b!348900 (= lt!163835 (addApplyDifferent!263 lt!163826 lt!163842 minValue!1467 lt!163841))))

(assert (=> b!348900 (= (apply!287 (+!740 lt!163826 (tuple2!5511 lt!163842 minValue!1467)) lt!163841) (apply!287 lt!163826 lt!163841))))

(declare-fun lt!163827 () Unit!10792)

(assert (=> b!348900 (= lt!163827 lt!163835)))

(declare-fun lt!163825 () ListLongMap!4413)

(assert (=> b!348900 (= lt!163825 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163829 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163833 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163833 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163830 () Unit!10792)

(assert (=> b!348900 (= lt!163830 (addApplyDifferent!263 lt!163825 lt!163829 zeroValue!1467 lt!163833))))

(assert (=> b!348900 (= (apply!287 (+!740 lt!163825 (tuple2!5511 lt!163829 zeroValue!1467)) lt!163833) (apply!287 lt!163825 lt!163833))))

(declare-fun lt!163828 () Unit!10792)

(assert (=> b!348900 (= lt!163828 lt!163830)))

(declare-fun lt!163836 () ListLongMap!4413)

(assert (=> b!348900 (= lt!163836 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163832 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163832 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163844 () (_ BitVec 64))

(assert (=> b!348900 (= lt!163844 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!348900 (= lt!163845 (addApplyDifferent!263 lt!163836 lt!163832 minValue!1467 lt!163844))))

(assert (=> b!348900 (= (apply!287 (+!740 lt!163836 (tuple2!5511 lt!163832 minValue!1467)) lt!163844) (apply!287 lt!163836 lt!163844))))

(declare-fun bm!26856 () Bool)

(declare-fun c!53168 () Bool)

(assert (=> bm!26856 (= call!26856 (+!740 (ite c!53168 call!26857 (ite c!53164 call!26861 call!26858)) (ite (or c!53168 c!53164) (tuple2!5511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!348901 () Bool)

(assert (=> b!348901 (= e!213719 e!213713)))

(declare-fun res!193387 () Bool)

(assert (=> b!348901 (= res!193387 call!26860)))

(assert (=> b!348901 (=> (not res!193387) (not e!213713))))

(declare-fun b!348902 () Bool)

(declare-fun call!26859 () ListLongMap!4413)

(assert (=> b!348902 (= e!213711 call!26859)))

(declare-fun b!348903 () Bool)

(declare-fun e!213712 () Bool)

(assert (=> b!348903 (= e!213712 (validKeyInArray!0 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!348904 () Bool)

(declare-fun res!193389 () Bool)

(assert (=> b!348904 (=> (not res!193389) (not e!213716))))

(declare-fun e!213714 () Bool)

(assert (=> b!348904 (= res!193389 e!213714)))

(declare-fun res!193384 () Bool)

(assert (=> b!348904 (=> res!193384 e!213714)))

(assert (=> b!348904 (= res!193384 (not e!213720))))

(declare-fun res!193386 () Bool)

(assert (=> b!348904 (=> (not res!193386) (not e!213720))))

(assert (=> b!348904 (= res!193386 (bvslt #b00000000000000000000000000000000 (size!9230 _keys!1895)))))

(declare-fun b!348905 () Bool)

(declare-fun e!213709 () Bool)

(assert (=> b!348905 (= e!213714 e!213709)))

(declare-fun res!193383 () Bool)

(assert (=> b!348905 (=> (not res!193383) (not e!213709))))

(assert (=> b!348905 (= res!193383 (contains!2298 lt!163843 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!348905 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9230 _keys!1895)))))

(declare-fun bm!26857 () Bool)

(assert (=> bm!26857 (= call!26858 call!26861)))

(declare-fun b!348906 () Bool)

(assert (=> b!348906 (= e!213710 (not call!26855))))

(declare-fun b!348907 () Bool)

(assert (=> b!348907 (= e!213715 call!26859)))

(declare-fun b!348908 () Bool)

(declare-fun get!4755 (ValueCell!3449 V!11091) V!11091)

(declare-fun dynLambda!621 (Int (_ BitVec 64)) V!11091)

(assert (=> b!348908 (= e!213709 (= (apply!287 lt!163843 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)) (get!4755 (select (arr!8876 _values!1525) #b00000000000000000000000000000000) (dynLambda!621 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!348908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9229 _values!1525)))))

(assert (=> b!348908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9230 _keys!1895)))))

(declare-fun d!71119 () Bool)

(assert (=> d!71119 e!213716))

(declare-fun res!193388 () Bool)

(assert (=> d!71119 (=> (not res!193388) (not e!213716))))

(assert (=> d!71119 (= res!193388 (or (bvsge #b00000000000000000000000000000000 (size!9230 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9230 _keys!1895)))))))

(declare-fun lt!163840 () ListLongMap!4413)

(assert (=> d!71119 (= lt!163843 lt!163840)))

(declare-fun lt!163834 () Unit!10792)

(assert (=> d!71119 (= lt!163834 e!213718)))

(declare-fun c!53166 () Bool)

(assert (=> d!71119 (= c!53166 e!213712)))

(declare-fun res!193390 () Bool)

(assert (=> d!71119 (=> (not res!193390) (not e!213712))))

(assert (=> d!71119 (= res!193390 (bvslt #b00000000000000000000000000000000 (size!9230 _keys!1895)))))

(assert (=> d!71119 (= lt!163840 e!213708)))

(assert (=> d!71119 (= c!53168 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71119 (validMask!0 mask!2385)))

(assert (=> d!71119 (= (getCurrentListMap!1727 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163843)))

(declare-fun bm!26858 () Bool)

(assert (=> bm!26858 (= call!26859 call!26856)))

(declare-fun b!348909 () Bool)

(assert (=> b!348909 (= e!213719 (not call!26860))))

(declare-fun b!348910 () Bool)

(assert (=> b!348910 (= e!213717 (= (apply!287 lt!163843 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(assert (= (and d!71119 c!53168) b!348895))

(assert (= (and d!71119 (not c!53168)) b!348891))

(assert (= (and b!348891 c!53164) b!348907))

(assert (= (and b!348891 (not c!53164)) b!348899))

(assert (= (and b!348899 c!53163) b!348902))

(assert (= (and b!348899 (not c!53163)) b!348892))

(assert (= (or b!348902 b!348892) bm!26857))

(assert (= (or b!348907 bm!26857) bm!26853))

(assert (= (or b!348907 b!348902) bm!26858))

(assert (= (or b!348895 bm!26853) bm!26854))

(assert (= (or b!348895 bm!26858) bm!26856))

(assert (= (and d!71119 res!193390) b!348903))

(assert (= (and d!71119 c!53166) b!348900))

(assert (= (and d!71119 (not c!53166)) b!348896))

(assert (= (and d!71119 res!193388) b!348904))

(assert (= (and b!348904 res!193386) b!348890))

(assert (= (and b!348904 (not res!193384)) b!348905))

(assert (= (and b!348905 res!193383) b!348908))

(assert (= (and b!348904 res!193389) b!348897))

(assert (= (and b!348897 c!53167) b!348901))

(assert (= (and b!348897 (not c!53167)) b!348909))

(assert (= (and b!348901 res!193387) b!348894))

(assert (= (or b!348901 b!348909) bm!26852))

(assert (= (and b!348897 res!193382) b!348893))

(assert (= (and b!348893 c!53165) b!348898))

(assert (= (and b!348893 (not c!53165)) b!348906))

(assert (= (and b!348898 res!193385) b!348910))

(assert (= (or b!348898 b!348906) bm!26855))

(declare-fun b_lambda!8469 () Bool)

(assert (=> (not b_lambda!8469) (not b!348908)))

(declare-fun t!10250 () Bool)

(declare-fun tb!3081 () Bool)

(assert (=> (and start!34834 (= defaultEntry!1528 defaultEntry!1528) t!10250) tb!3081))

(declare-fun result!5589 () Bool)

(assert (=> tb!3081 (= result!5589 tp_is_empty!7585)))

(assert (=> b!348908 t!10250))

(declare-fun b_and!14835 () Bool)

(assert (= b_and!14829 (and (=> t!10250 result!5589) b_and!14835)))

(assert (=> b!348890 m!348977))

(assert (=> b!348890 m!348977))

(assert (=> b!348890 m!348983))

(declare-fun m!348993 () Bool)

(assert (=> bm!26855 m!348993))

(declare-fun m!348995 () Bool)

(assert (=> b!348910 m!348995))

(declare-fun m!348997 () Bool)

(assert (=> bm!26854 m!348997))

(assert (=> d!71119 m!348891))

(assert (=> b!348905 m!348977))

(assert (=> b!348905 m!348977))

(declare-fun m!348999 () Bool)

(assert (=> b!348905 m!348999))

(declare-fun m!349001 () Bool)

(assert (=> b!348900 m!349001))

(declare-fun m!349003 () Bool)

(assert (=> b!348900 m!349003))

(declare-fun m!349005 () Bool)

(assert (=> b!348900 m!349005))

(assert (=> b!348900 m!348977))

(assert (=> b!348900 m!348997))

(declare-fun m!349007 () Bool)

(assert (=> b!348900 m!349007))

(declare-fun m!349009 () Bool)

(assert (=> b!348900 m!349009))

(declare-fun m!349011 () Bool)

(assert (=> b!348900 m!349011))

(assert (=> b!348900 m!349005))

(declare-fun m!349013 () Bool)

(assert (=> b!348900 m!349013))

(declare-fun m!349015 () Bool)

(assert (=> b!348900 m!349015))

(declare-fun m!349017 () Bool)

(assert (=> b!348900 m!349017))

(assert (=> b!348900 m!349009))

(declare-fun m!349019 () Bool)

(assert (=> b!348900 m!349019))

(declare-fun m!349021 () Bool)

(assert (=> b!348900 m!349021))

(assert (=> b!348900 m!349021))

(declare-fun m!349023 () Bool)

(assert (=> b!348900 m!349023))

(assert (=> b!348900 m!349001))

(declare-fun m!349025 () Bool)

(assert (=> b!348900 m!349025))

(declare-fun m!349027 () Bool)

(assert (=> b!348900 m!349027))

(declare-fun m!349029 () Bool)

(assert (=> b!348900 m!349029))

(declare-fun m!349031 () Bool)

(assert (=> b!348894 m!349031))

(assert (=> b!348903 m!348977))

(assert (=> b!348903 m!348977))

(assert (=> b!348903 m!348983))

(declare-fun m!349033 () Bool)

(assert (=> bm!26852 m!349033))

(declare-fun m!349035 () Bool)

(assert (=> b!348895 m!349035))

(assert (=> b!348908 m!348977))

(declare-fun m!349037 () Bool)

(assert (=> b!348908 m!349037))

(declare-fun m!349039 () Bool)

(assert (=> b!348908 m!349039))

(assert (=> b!348908 m!348977))

(declare-fun m!349041 () Bool)

(assert (=> b!348908 m!349041))

(assert (=> b!348908 m!349041))

(assert (=> b!348908 m!349039))

(declare-fun m!349043 () Bool)

(assert (=> b!348908 m!349043))

(declare-fun m!349045 () Bool)

(assert (=> bm!26856 m!349045))

(assert (=> b!348730 d!71119))

(declare-fun d!71121 () Bool)

(assert (=> d!71121 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!348734 d!71121))

(declare-fun d!71123 () Bool)

(declare-fun lt!163848 () (_ BitVec 32))

(assert (=> d!71123 (and (or (bvslt lt!163848 #b00000000000000000000000000000000) (bvsge lt!163848 (size!9230 _keys!1895)) (and (bvsge lt!163848 #b00000000000000000000000000000000) (bvslt lt!163848 (size!9230 _keys!1895)))) (bvsge lt!163848 #b00000000000000000000000000000000) (bvslt lt!163848 (size!9230 _keys!1895)) (= (select (arr!8877 _keys!1895) lt!163848) k0!1348))))

(declare-fun e!213723 () (_ BitVec 32))

(assert (=> d!71123 (= lt!163848 e!213723)))

(declare-fun c!53171 () Bool)

(assert (=> d!71123 (= c!53171 (= (select (arr!8877 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9230 _keys!1895)) (bvslt (size!9230 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71123 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!163848)))

(declare-fun b!348917 () Bool)

(assert (=> b!348917 (= e!213723 #b00000000000000000000000000000000)))

(declare-fun b!348918 () Bool)

(assert (=> b!348918 (= e!213723 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71123 c!53171) b!348917))

(assert (= (and d!71123 (not c!53171)) b!348918))

(declare-fun m!349047 () Bool)

(assert (=> d!71123 m!349047))

(assert (=> d!71123 m!348977))

(declare-fun m!349049 () Bool)

(assert (=> b!348918 m!349049))

(assert (=> b!348735 d!71123))

(declare-fun d!71125 () Bool)

(assert (=> d!71125 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34834 d!71125))

(declare-fun d!71127 () Bool)

(assert (=> d!71127 (= (array_inv!6586 _values!1525) (bvsge (size!9229 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34834 d!71127))

(declare-fun d!71129 () Bool)

(assert (=> d!71129 (= (array_inv!6587 _keys!1895) (bvsge (size!9230 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34834 d!71129))

(declare-fun d!71131 () Bool)

(declare-fun res!193395 () Bool)

(declare-fun e!213732 () Bool)

(assert (=> d!71131 (=> res!193395 e!213732)))

(assert (=> d!71131 (= res!193395 (bvsge #b00000000000000000000000000000000 (size!9230 _keys!1895)))))

(assert (=> d!71131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!213732)))

(declare-fun bm!26861 () Bool)

(declare-fun call!26864 () Bool)

(assert (=> bm!26861 (= call!26864 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!348927 () Bool)

(declare-fun e!213731 () Bool)

(declare-fun e!213730 () Bool)

(assert (=> b!348927 (= e!213731 e!213730)))

(declare-fun lt!163855 () (_ BitVec 64))

(assert (=> b!348927 (= lt!163855 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163856 () Unit!10792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18735 (_ BitVec 64) (_ BitVec 32)) Unit!10792)

(assert (=> b!348927 (= lt!163856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163855 #b00000000000000000000000000000000))))

(assert (=> b!348927 (arrayContainsKey!0 _keys!1895 lt!163855 #b00000000000000000000000000000000)))

(declare-fun lt!163857 () Unit!10792)

(assert (=> b!348927 (= lt!163857 lt!163856)))

(declare-fun res!193396 () Bool)

(assert (=> b!348927 (= res!193396 (= (seekEntryOrOpen!0 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3421 #b00000000000000000000000000000000)))))

(assert (=> b!348927 (=> (not res!193396) (not e!213730))))

(declare-fun b!348928 () Bool)

(assert (=> b!348928 (= e!213732 e!213731)))

(declare-fun c!53174 () Bool)

(assert (=> b!348928 (= c!53174 (validKeyInArray!0 (select (arr!8877 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!348929 () Bool)

(assert (=> b!348929 (= e!213730 call!26864)))

(declare-fun b!348930 () Bool)

(assert (=> b!348930 (= e!213731 call!26864)))

(assert (= (and d!71131 (not res!193395)) b!348928))

(assert (= (and b!348928 c!53174) b!348927))

(assert (= (and b!348928 (not c!53174)) b!348930))

(assert (= (and b!348927 res!193396) b!348929))

(assert (= (or b!348929 b!348930) bm!26861))

(declare-fun m!349051 () Bool)

(assert (=> bm!26861 m!349051))

(assert (=> b!348927 m!348977))

(declare-fun m!349053 () Bool)

(assert (=> b!348927 m!349053))

(declare-fun m!349055 () Bool)

(assert (=> b!348927 m!349055))

(assert (=> b!348927 m!348977))

(declare-fun m!349057 () Bool)

(assert (=> b!348927 m!349057))

(assert (=> b!348928 m!348977))

(assert (=> b!348928 m!348977))

(assert (=> b!348928 m!348983))

(assert (=> b!348739 d!71131))

(declare-fun d!71133 () Bool)

(declare-fun res!193401 () Bool)

(declare-fun e!213737 () Bool)

(assert (=> d!71133 (=> res!193401 e!213737)))

(assert (=> d!71133 (= res!193401 (= (select (arr!8877 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71133 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!213737)))

(declare-fun b!348935 () Bool)

(declare-fun e!213738 () Bool)

(assert (=> b!348935 (= e!213737 e!213738)))

(declare-fun res!193402 () Bool)

(assert (=> b!348935 (=> (not res!193402) (not e!213738))))

(assert (=> b!348935 (= res!193402 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9230 _keys!1895)))))

(declare-fun b!348936 () Bool)

(assert (=> b!348936 (= e!213738 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71133 (not res!193401)) b!348935))

(assert (= (and b!348935 res!193402) b!348936))

(assert (=> d!71133 m!348977))

(declare-fun m!349059 () Bool)

(assert (=> b!348936 m!349059))

(assert (=> b!348733 d!71133))

(declare-fun mapNonEmpty!12846 () Bool)

(declare-fun mapRes!12846 () Bool)

(declare-fun tp!26481 () Bool)

(declare-fun e!213743 () Bool)

(assert (=> mapNonEmpty!12846 (= mapRes!12846 (and tp!26481 e!213743))))

(declare-fun mapKey!12846 () (_ BitVec 32))

(declare-fun mapRest!12846 () (Array (_ BitVec 32) ValueCell!3449))

(declare-fun mapValue!12846 () ValueCell!3449)

(assert (=> mapNonEmpty!12846 (= mapRest!12837 (store mapRest!12846 mapKey!12846 mapValue!12846))))

(declare-fun b!348943 () Bool)

(assert (=> b!348943 (= e!213743 tp_is_empty!7585)))

(declare-fun mapIsEmpty!12846 () Bool)

(assert (=> mapIsEmpty!12846 mapRes!12846))

(declare-fun condMapEmpty!12846 () Bool)

(declare-fun mapDefault!12846 () ValueCell!3449)

(assert (=> mapNonEmpty!12837 (= condMapEmpty!12846 (= mapRest!12837 ((as const (Array (_ BitVec 32) ValueCell!3449)) mapDefault!12846)))))

(declare-fun e!213744 () Bool)

(assert (=> mapNonEmpty!12837 (= tp!26466 (and e!213744 mapRes!12846))))

(declare-fun b!348944 () Bool)

(assert (=> b!348944 (= e!213744 tp_is_empty!7585)))

(assert (= (and mapNonEmpty!12837 condMapEmpty!12846) mapIsEmpty!12846))

(assert (= (and mapNonEmpty!12837 (not condMapEmpty!12846)) mapNonEmpty!12846))

(assert (= (and mapNonEmpty!12846 ((_ is ValueCellFull!3449) mapValue!12846)) b!348943))

(assert (= (and mapNonEmpty!12837 ((_ is ValueCellFull!3449) mapDefault!12846)) b!348944))

(declare-fun m!349061 () Bool)

(assert (=> mapNonEmpty!12846 m!349061))

(declare-fun b_lambda!8471 () Bool)

(assert (= b_lambda!8469 (or (and start!34834 b_free!7633) b_lambda!8471)))

(check-sat (not b!348908) (not b_lambda!8471) (not b!348927) (not b!348835) b_and!14835 (not bm!26854) (not d!71119) (not d!71113) (not b!348936) (not b!348903) (not b_next!7633) (not b!348834) (not bm!26855) (not bm!26852) (not b!348890) (not b!348900) (not b!348838) (not bm!26861) (not b!348910) (not b!348819) (not mapNonEmpty!12846) (not b!348905) (not b!348918) tp_is_empty!7585 (not bm!26837) (not b!348895) (not d!71117) (not b!348845) (not b!348894) (not bm!26856) (not b!348928) (not b!348847))
(check-sat b_and!14835 (not b_next!7633))
