; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34112 () Bool)

(assert start!34112)

(declare-fun b_free!7173 () Bool)

(declare-fun b_next!7173 () Bool)

(assert (=> start!34112 (= b_free!7173 (not b_next!7173))))

(declare-fun tp!25046 () Bool)

(declare-fun b_and!14369 () Bool)

(assert (=> start!34112 (= tp!25046 b_and!14369)))

(declare-fun b!339964 () Bool)

(declare-fun e!208563 () Bool)

(declare-fun tp_is_empty!7125 () Bool)

(assert (=> b!339964 (= e!208563 tp_is_empty!7125)))

(declare-fun b!339965 () Bool)

(declare-fun res!187780 () Bool)

(declare-fun e!208564 () Bool)

(assert (=> b!339965 (=> (not res!187780) (not e!208564))))

(declare-datatypes ((array!17851 0))(
  ( (array!17852 (arr!8448 (Array (_ BitVec 32) (_ BitVec 64))) (size!8800 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17851)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17851 (_ BitVec 32)) Bool)

(assert (=> b!339965 (= res!187780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12108 () Bool)

(declare-fun mapRes!12108 () Bool)

(assert (=> mapIsEmpty!12108 mapRes!12108))

(declare-fun b!339966 () Bool)

(declare-fun res!187783 () Bool)

(assert (=> b!339966 (=> (not res!187783) (not e!208564))))

(declare-datatypes ((List!4855 0))(
  ( (Nil!4852) (Cons!4851 (h!5707 (_ BitVec 64)) (t!9959 List!4855)) )
))
(declare-fun arrayNoDuplicates!0 (array!17851 (_ BitVec 32) List!4855) Bool)

(assert (=> b!339966 (= res!187783 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4852))))

(declare-fun b!339967 () Bool)

(declare-fun e!208562 () Bool)

(assert (=> b!339967 (= e!208562 tp_is_empty!7125)))

(declare-fun b!339968 () Bool)

(declare-fun res!187781 () Bool)

(assert (=> b!339968 (=> (not res!187781) (not e!208564))))

(declare-datatypes ((V!10477 0))(
  ( (V!10478 (val!3607 Int)) )
))
(declare-datatypes ((ValueCell!3219 0))(
  ( (ValueCellFull!3219 (v!5777 V!10477)) (EmptyCell!3219) )
))
(declare-datatypes ((array!17853 0))(
  ( (array!17854 (arr!8449 (Array (_ BitVec 32) ValueCell!3219)) (size!8801 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17853)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339968 (= res!187781 (and (= (size!8801 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8800 _keys!1895) (size!8801 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12108 () Bool)

(declare-fun tp!25047 () Bool)

(assert (=> mapNonEmpty!12108 (= mapRes!12108 (and tp!25047 e!208562))))

(declare-fun mapValue!12108 () ValueCell!3219)

(declare-fun mapRest!12108 () (Array (_ BitVec 32) ValueCell!3219))

(declare-fun mapKey!12108 () (_ BitVec 32))

(assert (=> mapNonEmpty!12108 (= (arr!8449 _values!1525) (store mapRest!12108 mapKey!12108 mapValue!12108))))

(declare-fun b!339969 () Bool)

(declare-datatypes ((SeekEntryResult!3264 0))(
  ( (MissingZero!3264 (index!15235 (_ BitVec 32))) (Found!3264 (index!15236 (_ BitVec 32))) (Intermediate!3264 (undefined!4076 Bool) (index!15237 (_ BitVec 32)) (x!33862 (_ BitVec 32))) (Undefined!3264) (MissingVacant!3264 (index!15238 (_ BitVec 32))) )
))
(declare-fun lt!161374 () SeekEntryResult!3264)

(get-info :version)

(assert (=> b!339969 (= e!208564 (and (not ((_ is Found!3264) lt!161374)) (not ((_ is MissingZero!3264) lt!161374)) ((_ is MissingVacant!3264) lt!161374) (bvslt #b00000000000000000000000000000000 (size!8800 _keys!1895)) (bvsge (size!8800 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17851 (_ BitVec 32)) SeekEntryResult!3264)

(assert (=> b!339969 (= lt!161374 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339970 () Bool)

(declare-fun res!187782 () Bool)

(assert (=> b!339970 (=> (not res!187782) (not e!208564))))

(declare-fun zeroValue!1467 () V!10477)

(declare-fun minValue!1467 () V!10477)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5236 0))(
  ( (tuple2!5237 (_1!2629 (_ BitVec 64)) (_2!2629 V!10477)) )
))
(declare-datatypes ((List!4856 0))(
  ( (Nil!4853) (Cons!4852 (h!5708 tuple2!5236) (t!9960 List!4856)) )
))
(declare-datatypes ((ListLongMap!4149 0))(
  ( (ListLongMap!4150 (toList!2090 List!4856)) )
))
(declare-fun contains!2142 (ListLongMap!4149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1611 (array!17851 array!17853 (_ BitVec 32) (_ BitVec 32) V!10477 V!10477 (_ BitVec 32) Int) ListLongMap!4149)

(assert (=> b!339970 (= res!187782 (not (contains!2142 (getCurrentListMap!1611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!187784 () Bool)

(assert (=> start!34112 (=> (not res!187784) (not e!208564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34112 (= res!187784 (validMask!0 mask!2385))))

(assert (=> start!34112 e!208564))

(assert (=> start!34112 true))

(assert (=> start!34112 tp_is_empty!7125))

(assert (=> start!34112 tp!25046))

(declare-fun e!208566 () Bool)

(declare-fun array_inv!6260 (array!17853) Bool)

(assert (=> start!34112 (and (array_inv!6260 _values!1525) e!208566)))

(declare-fun array_inv!6261 (array!17851) Bool)

(assert (=> start!34112 (array_inv!6261 _keys!1895)))

(declare-fun b!339971 () Bool)

(assert (=> b!339971 (= e!208566 (and e!208563 mapRes!12108))))

(declare-fun condMapEmpty!12108 () Bool)

(declare-fun mapDefault!12108 () ValueCell!3219)

(assert (=> b!339971 (= condMapEmpty!12108 (= (arr!8449 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3219)) mapDefault!12108)))))

(declare-fun b!339972 () Bool)

(declare-fun res!187779 () Bool)

(assert (=> b!339972 (=> (not res!187779) (not e!208564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339972 (= res!187779 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34112 res!187784) b!339968))

(assert (= (and b!339968 res!187781) b!339965))

(assert (= (and b!339965 res!187780) b!339966))

(assert (= (and b!339966 res!187783) b!339972))

(assert (= (and b!339972 res!187779) b!339970))

(assert (= (and b!339970 res!187782) b!339969))

(assert (= (and b!339971 condMapEmpty!12108) mapIsEmpty!12108))

(assert (= (and b!339971 (not condMapEmpty!12108)) mapNonEmpty!12108))

(assert (= (and mapNonEmpty!12108 ((_ is ValueCellFull!3219) mapValue!12108)) b!339967))

(assert (= (and b!339971 ((_ is ValueCellFull!3219) mapDefault!12108)) b!339964))

(assert (= start!34112 b!339971))

(declare-fun m!342803 () Bool)

(assert (=> b!339972 m!342803))

(declare-fun m!342805 () Bool)

(assert (=> b!339965 m!342805))

(declare-fun m!342807 () Bool)

(assert (=> b!339966 m!342807))

(declare-fun m!342809 () Bool)

(assert (=> b!339969 m!342809))

(declare-fun m!342811 () Bool)

(assert (=> start!34112 m!342811))

(declare-fun m!342813 () Bool)

(assert (=> start!34112 m!342813))

(declare-fun m!342815 () Bool)

(assert (=> start!34112 m!342815))

(declare-fun m!342817 () Bool)

(assert (=> b!339970 m!342817))

(assert (=> b!339970 m!342817))

(declare-fun m!342819 () Bool)

(assert (=> b!339970 m!342819))

(declare-fun m!342821 () Bool)

(assert (=> mapNonEmpty!12108 m!342821))

(check-sat (not b!339969) (not b!339965) (not b_next!7173) (not mapNonEmpty!12108) (not start!34112) (not b!339972) (not b!339966) tp_is_empty!7125 (not b!339970) b_and!14369)
(check-sat b_and!14369 (not b_next!7173))
(get-model)

(declare-fun d!70887 () Bool)

(assert (=> d!70887 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339972 d!70887))

(declare-fun d!70889 () Bool)

(declare-fun e!208587 () Bool)

(assert (=> d!70889 e!208587))

(declare-fun res!187805 () Bool)

(assert (=> d!70889 (=> res!187805 e!208587)))

(declare-fun lt!161386 () Bool)

(assert (=> d!70889 (= res!187805 (not lt!161386))))

(declare-fun lt!161388 () Bool)

(assert (=> d!70889 (= lt!161386 lt!161388)))

(declare-datatypes ((Unit!10597 0))(
  ( (Unit!10598) )
))
(declare-fun lt!161389 () Unit!10597)

(declare-fun e!208586 () Unit!10597)

(assert (=> d!70889 (= lt!161389 e!208586)))

(declare-fun c!52614 () Bool)

(assert (=> d!70889 (= c!52614 lt!161388)))

(declare-fun containsKey!324 (List!4856 (_ BitVec 64)) Bool)

(assert (=> d!70889 (= lt!161388 (containsKey!324 (toList!2090 (getCurrentListMap!1611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70889 (= (contains!2142 (getCurrentListMap!1611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161386)))

(declare-fun b!340006 () Bool)

(declare-fun lt!161387 () Unit!10597)

(assert (=> b!340006 (= e!208586 lt!161387)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!272 (List!4856 (_ BitVec 64)) Unit!10597)

(assert (=> b!340006 (= lt!161387 (lemmaContainsKeyImpliesGetValueByKeyDefined!272 (toList!2090 (getCurrentListMap!1611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!338 0))(
  ( (Some!337 (v!5779 V!10477)) (None!336) )
))
(declare-fun isDefined!273 (Option!338) Bool)

(declare-fun getValueByKey!332 (List!4856 (_ BitVec 64)) Option!338)

(assert (=> b!340006 (isDefined!273 (getValueByKey!332 (toList!2090 (getCurrentListMap!1611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!340007 () Bool)

(declare-fun Unit!10599 () Unit!10597)

(assert (=> b!340007 (= e!208586 Unit!10599)))

(declare-fun b!340008 () Bool)

(assert (=> b!340008 (= e!208587 (isDefined!273 (getValueByKey!332 (toList!2090 (getCurrentListMap!1611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70889 c!52614) b!340006))

(assert (= (and d!70889 (not c!52614)) b!340007))

(assert (= (and d!70889 (not res!187805)) b!340008))

(declare-fun m!342843 () Bool)

(assert (=> d!70889 m!342843))

(declare-fun m!342845 () Bool)

(assert (=> b!340006 m!342845))

(declare-fun m!342847 () Bool)

(assert (=> b!340006 m!342847))

(assert (=> b!340006 m!342847))

(declare-fun m!342849 () Bool)

(assert (=> b!340006 m!342849))

(assert (=> b!340008 m!342847))

(assert (=> b!340008 m!342847))

(assert (=> b!340008 m!342849))

(assert (=> b!339970 d!70889))

(declare-fun bm!26524 () Bool)

(declare-fun call!26529 () Bool)

(declare-fun lt!161448 () ListLongMap!4149)

(assert (=> bm!26524 (= call!26529 (contains!2142 lt!161448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26525 () Bool)

(declare-fun call!26527 () ListLongMap!4149)

(declare-fun call!26532 () ListLongMap!4149)

(assert (=> bm!26525 (= call!26527 call!26532)))

(declare-fun b!340051 () Bool)

(declare-fun e!208623 () Bool)

(declare-fun apply!274 (ListLongMap!4149 (_ BitVec 64)) V!10477)

(assert (=> b!340051 (= e!208623 (= (apply!274 lt!161448 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun call!26533 () ListLongMap!4149)

(declare-fun bm!26526 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!596 (array!17851 array!17853 (_ BitVec 32) (_ BitVec 32) V!10477 V!10477 (_ BitVec 32) Int) ListLongMap!4149)

(assert (=> bm!26526 (= call!26533 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!340052 () Bool)

(declare-fun e!208622 () Bool)

(assert (=> b!340052 (= e!208622 e!208623)))

(declare-fun res!187831 () Bool)

(assert (=> b!340052 (= res!187831 call!26529)))

(assert (=> b!340052 (=> (not res!187831) (not e!208623))))

(declare-fun b!340053 () Bool)

(declare-fun res!187829 () Bool)

(declare-fun e!208614 () Bool)

(assert (=> b!340053 (=> (not res!187829) (not e!208614))))

(declare-fun e!208625 () Bool)

(assert (=> b!340053 (= res!187829 e!208625)))

(declare-fun res!187824 () Bool)

(assert (=> b!340053 (=> res!187824 e!208625)))

(declare-fun e!208615 () Bool)

(assert (=> b!340053 (= res!187824 (not e!208615))))

(declare-fun res!187825 () Bool)

(assert (=> b!340053 (=> (not res!187825) (not e!208615))))

(assert (=> b!340053 (= res!187825 (bvslt #b00000000000000000000000000000000 (size!8800 _keys!1895)))))

(declare-fun b!340054 () Bool)

(declare-fun e!208618 () Bool)

(assert (=> b!340054 (= e!208618 (validKeyInArray!0 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340055 () Bool)

(declare-fun c!52629 () Bool)

(assert (=> b!340055 (= c!52629 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!208626 () ListLongMap!4149)

(declare-fun e!208616 () ListLongMap!4149)

(assert (=> b!340055 (= e!208626 e!208616)))

(declare-fun b!340056 () Bool)

(declare-fun e!208624 () ListLongMap!4149)

(assert (=> b!340056 (= e!208624 e!208626)))

(declare-fun c!52628 () Bool)

(assert (=> b!340056 (= c!52628 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!340057 () Bool)

(assert (=> b!340057 (= e!208626 call!26527)))

(declare-fun bm!26527 () Bool)

(declare-fun call!26531 () ListLongMap!4149)

(declare-fun call!26530 () ListLongMap!4149)

(assert (=> bm!26527 (= call!26531 call!26530)))

(declare-fun b!340058 () Bool)

(assert (=> b!340058 (= e!208616 call!26531)))

(declare-fun b!340059 () Bool)

(declare-fun e!208619 () Bool)

(declare-fun get!4594 (ValueCell!3219 V!10477) V!10477)

(declare-fun dynLambda!617 (Int (_ BitVec 64)) V!10477)

(assert (=> b!340059 (= e!208619 (= (apply!274 lt!161448 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)) (get!4594 (select (arr!8449 _values!1525) #b00000000000000000000000000000000) (dynLambda!617 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!340059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8801 _values!1525)))))

(assert (=> b!340059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8800 _keys!1895)))))

(declare-fun b!340060 () Bool)

(declare-fun +!723 (ListLongMap!4149 tuple2!5236) ListLongMap!4149)

(assert (=> b!340060 (= e!208624 (+!723 call!26532 (tuple2!5237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!340061 () Bool)

(declare-fun e!208620 () Unit!10597)

(declare-fun Unit!10600 () Unit!10597)

(assert (=> b!340061 (= e!208620 Unit!10600)))

(declare-fun b!340062 () Bool)

(declare-fun e!208621 () Bool)

(declare-fun e!208617 () Bool)

(assert (=> b!340062 (= e!208621 e!208617)))

(declare-fun res!187826 () Bool)

(declare-fun call!26528 () Bool)

(assert (=> b!340062 (= res!187826 call!26528)))

(assert (=> b!340062 (=> (not res!187826) (not e!208617))))

(declare-fun b!340063 () Bool)

(assert (=> b!340063 (= e!208616 call!26527)))

(declare-fun b!340064 () Bool)

(assert (=> b!340064 (= e!208617 (= (apply!274 lt!161448 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!340065 () Bool)

(declare-fun lt!161455 () Unit!10597)

(assert (=> b!340065 (= e!208620 lt!161455)))

(declare-fun lt!161451 () ListLongMap!4149)

(assert (=> b!340065 (= lt!161451 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161449 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161440 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161440 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161436 () Unit!10597)

(declare-fun addStillContains!250 (ListLongMap!4149 (_ BitVec 64) V!10477 (_ BitVec 64)) Unit!10597)

(assert (=> b!340065 (= lt!161436 (addStillContains!250 lt!161451 lt!161449 zeroValue!1467 lt!161440))))

(assert (=> b!340065 (contains!2142 (+!723 lt!161451 (tuple2!5237 lt!161449 zeroValue!1467)) lt!161440)))

(declare-fun lt!161434 () Unit!10597)

(assert (=> b!340065 (= lt!161434 lt!161436)))

(declare-fun lt!161447 () ListLongMap!4149)

(assert (=> b!340065 (= lt!161447 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161444 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161444 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161437 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161437 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161446 () Unit!10597)

(declare-fun addApplyDifferent!250 (ListLongMap!4149 (_ BitVec 64) V!10477 (_ BitVec 64)) Unit!10597)

(assert (=> b!340065 (= lt!161446 (addApplyDifferent!250 lt!161447 lt!161444 minValue!1467 lt!161437))))

(assert (=> b!340065 (= (apply!274 (+!723 lt!161447 (tuple2!5237 lt!161444 minValue!1467)) lt!161437) (apply!274 lt!161447 lt!161437))))

(declare-fun lt!161438 () Unit!10597)

(assert (=> b!340065 (= lt!161438 lt!161446)))

(declare-fun lt!161439 () ListLongMap!4149)

(assert (=> b!340065 (= lt!161439 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161445 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161453 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161453 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161454 () Unit!10597)

(assert (=> b!340065 (= lt!161454 (addApplyDifferent!250 lt!161439 lt!161445 zeroValue!1467 lt!161453))))

(assert (=> b!340065 (= (apply!274 (+!723 lt!161439 (tuple2!5237 lt!161445 zeroValue!1467)) lt!161453) (apply!274 lt!161439 lt!161453))))

(declare-fun lt!161441 () Unit!10597)

(assert (=> b!340065 (= lt!161441 lt!161454)))

(declare-fun lt!161450 () ListLongMap!4149)

(assert (=> b!340065 (= lt!161450 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161443 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161443 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161452 () (_ BitVec 64))

(assert (=> b!340065 (= lt!161452 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!340065 (= lt!161455 (addApplyDifferent!250 lt!161450 lt!161443 minValue!1467 lt!161452))))

(assert (=> b!340065 (= (apply!274 (+!723 lt!161450 (tuple2!5237 lt!161443 minValue!1467)) lt!161452) (apply!274 lt!161450 lt!161452))))

(declare-fun bm!26528 () Bool)

(assert (=> bm!26528 (= call!26530 call!26533)))

(declare-fun b!340066 () Bool)

(assert (=> b!340066 (= e!208615 (validKeyInArray!0 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70891 () Bool)

(assert (=> d!70891 e!208614))

(declare-fun res!187832 () Bool)

(assert (=> d!70891 (=> (not res!187832) (not e!208614))))

(assert (=> d!70891 (= res!187832 (or (bvsge #b00000000000000000000000000000000 (size!8800 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8800 _keys!1895)))))))

(declare-fun lt!161435 () ListLongMap!4149)

(assert (=> d!70891 (= lt!161448 lt!161435)))

(declare-fun lt!161442 () Unit!10597)

(assert (=> d!70891 (= lt!161442 e!208620)))

(declare-fun c!52630 () Bool)

(assert (=> d!70891 (= c!52630 e!208618)))

(declare-fun res!187828 () Bool)

(assert (=> d!70891 (=> (not res!187828) (not e!208618))))

(assert (=> d!70891 (= res!187828 (bvslt #b00000000000000000000000000000000 (size!8800 _keys!1895)))))

(assert (=> d!70891 (= lt!161435 e!208624)))

(declare-fun c!52631 () Bool)

(assert (=> d!70891 (= c!52631 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70891 (validMask!0 mask!2385)))

(assert (=> d!70891 (= (getCurrentListMap!1611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161448)))

(declare-fun b!340067 () Bool)

(assert (=> b!340067 (= e!208614 e!208621)))

(declare-fun c!52627 () Bool)

(assert (=> b!340067 (= c!52627 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26529 () Bool)

(assert (=> bm!26529 (= call!26532 (+!723 (ite c!52631 call!26533 (ite c!52628 call!26530 call!26531)) (ite (or c!52631 c!52628) (tuple2!5237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26530 () Bool)

(assert (=> bm!26530 (= call!26528 (contains!2142 lt!161448 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!340068 () Bool)

(assert (=> b!340068 (= e!208622 (not call!26529))))

(declare-fun b!340069 () Bool)

(declare-fun res!187830 () Bool)

(assert (=> b!340069 (=> (not res!187830) (not e!208614))))

(assert (=> b!340069 (= res!187830 e!208622)))

(declare-fun c!52632 () Bool)

(assert (=> b!340069 (= c!52632 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!340070 () Bool)

(assert (=> b!340070 (= e!208621 (not call!26528))))

(declare-fun b!340071 () Bool)

(assert (=> b!340071 (= e!208625 e!208619)))

(declare-fun res!187827 () Bool)

(assert (=> b!340071 (=> (not res!187827) (not e!208619))))

(assert (=> b!340071 (= res!187827 (contains!2142 lt!161448 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!340071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8800 _keys!1895)))))

(assert (= (and d!70891 c!52631) b!340060))

(assert (= (and d!70891 (not c!52631)) b!340056))

(assert (= (and b!340056 c!52628) b!340057))

(assert (= (and b!340056 (not c!52628)) b!340055))

(assert (= (and b!340055 c!52629) b!340063))

(assert (= (and b!340055 (not c!52629)) b!340058))

(assert (= (or b!340063 b!340058) bm!26527))

(assert (= (or b!340057 bm!26527) bm!26528))

(assert (= (or b!340057 b!340063) bm!26525))

(assert (= (or b!340060 bm!26528) bm!26526))

(assert (= (or b!340060 bm!26525) bm!26529))

(assert (= (and d!70891 res!187828) b!340054))

(assert (= (and d!70891 c!52630) b!340065))

(assert (= (and d!70891 (not c!52630)) b!340061))

(assert (= (and d!70891 res!187832) b!340053))

(assert (= (and b!340053 res!187825) b!340066))

(assert (= (and b!340053 (not res!187824)) b!340071))

(assert (= (and b!340071 res!187827) b!340059))

(assert (= (and b!340053 res!187829) b!340069))

(assert (= (and b!340069 c!52632) b!340052))

(assert (= (and b!340069 (not c!52632)) b!340068))

(assert (= (and b!340052 res!187831) b!340051))

(assert (= (or b!340052 b!340068) bm!26524))

(assert (= (and b!340069 res!187830) b!340067))

(assert (= (and b!340067 c!52627) b!340062))

(assert (= (and b!340067 (not c!52627)) b!340070))

(assert (= (and b!340062 res!187826) b!340064))

(assert (= (or b!340062 b!340070) bm!26530))

(declare-fun b_lambda!8435 () Bool)

(assert (=> (not b_lambda!8435) (not b!340059)))

(declare-fun t!9964 () Bool)

(declare-fun tb!3063 () Bool)

(assert (=> (and start!34112 (= defaultEntry!1528 defaultEntry!1528) t!9964) tb!3063))

(declare-fun result!5519 () Bool)

(assert (=> tb!3063 (= result!5519 tp_is_empty!7125)))

(assert (=> b!340059 t!9964))

(declare-fun b_and!14373 () Bool)

(assert (= b_and!14369 (and (=> t!9964 result!5519) b_and!14373)))

(declare-fun m!342851 () Bool)

(assert (=> bm!26524 m!342851))

(declare-fun m!342853 () Bool)

(assert (=> b!340051 m!342853))

(declare-fun m!342855 () Bool)

(assert (=> bm!26529 m!342855))

(assert (=> d!70891 m!342811))

(declare-fun m!342857 () Bool)

(assert (=> b!340066 m!342857))

(assert (=> b!340066 m!342857))

(declare-fun m!342859 () Bool)

(assert (=> b!340066 m!342859))

(declare-fun m!342861 () Bool)

(assert (=> bm!26526 m!342861))

(assert (=> b!340071 m!342857))

(assert (=> b!340071 m!342857))

(declare-fun m!342863 () Bool)

(assert (=> b!340071 m!342863))

(declare-fun m!342865 () Bool)

(assert (=> b!340060 m!342865))

(declare-fun m!342867 () Bool)

(assert (=> b!340059 m!342867))

(assert (=> b!340059 m!342857))

(assert (=> b!340059 m!342867))

(declare-fun m!342869 () Bool)

(assert (=> b!340059 m!342869))

(declare-fun m!342871 () Bool)

(assert (=> b!340059 m!342871))

(assert (=> b!340059 m!342857))

(declare-fun m!342873 () Bool)

(assert (=> b!340059 m!342873))

(assert (=> b!340059 m!342869))

(declare-fun m!342875 () Bool)

(assert (=> b!340064 m!342875))

(declare-fun m!342877 () Bool)

(assert (=> bm!26530 m!342877))

(assert (=> b!340054 m!342857))

(assert (=> b!340054 m!342857))

(assert (=> b!340054 m!342859))

(declare-fun m!342879 () Bool)

(assert (=> b!340065 m!342879))

(declare-fun m!342881 () Bool)

(assert (=> b!340065 m!342881))

(declare-fun m!342883 () Bool)

(assert (=> b!340065 m!342883))

(assert (=> b!340065 m!342857))

(declare-fun m!342885 () Bool)

(assert (=> b!340065 m!342885))

(declare-fun m!342887 () Bool)

(assert (=> b!340065 m!342887))

(declare-fun m!342889 () Bool)

(assert (=> b!340065 m!342889))

(assert (=> b!340065 m!342879))

(declare-fun m!342891 () Bool)

(assert (=> b!340065 m!342891))

(declare-fun m!342893 () Bool)

(assert (=> b!340065 m!342893))

(declare-fun m!342895 () Bool)

(assert (=> b!340065 m!342895))

(declare-fun m!342897 () Bool)

(assert (=> b!340065 m!342897))

(assert (=> b!340065 m!342861))

(declare-fun m!342899 () Bool)

(assert (=> b!340065 m!342899))

(declare-fun m!342901 () Bool)

(assert (=> b!340065 m!342901))

(declare-fun m!342903 () Bool)

(assert (=> b!340065 m!342903))

(declare-fun m!342905 () Bool)

(assert (=> b!340065 m!342905))

(assert (=> b!340065 m!342901))

(assert (=> b!340065 m!342899))

(declare-fun m!342907 () Bool)

(assert (=> b!340065 m!342907))

(assert (=> b!340065 m!342885))

(assert (=> b!339970 d!70891))

(declare-fun d!70893 () Bool)

(declare-fun res!187841 () Bool)

(declare-fun e!208635 () Bool)

(assert (=> d!70893 (=> res!187841 e!208635)))

(assert (=> d!70893 (= res!187841 (bvsge #b00000000000000000000000000000000 (size!8800 _keys!1895)))))

(assert (=> d!70893 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4852) e!208635)))

(declare-fun b!340084 () Bool)

(declare-fun e!208636 () Bool)

(declare-fun call!26536 () Bool)

(assert (=> b!340084 (= e!208636 call!26536)))

(declare-fun b!340085 () Bool)

(declare-fun e!208637 () Bool)

(declare-fun contains!2144 (List!4855 (_ BitVec 64)) Bool)

(assert (=> b!340085 (= e!208637 (contains!2144 Nil!4852 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340086 () Bool)

(declare-fun e!208638 () Bool)

(assert (=> b!340086 (= e!208638 e!208636)))

(declare-fun c!52635 () Bool)

(assert (=> b!340086 (= c!52635 (validKeyInArray!0 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340087 () Bool)

(assert (=> b!340087 (= e!208635 e!208638)))

(declare-fun res!187840 () Bool)

(assert (=> b!340087 (=> (not res!187840) (not e!208638))))

(assert (=> b!340087 (= res!187840 (not e!208637))))

(declare-fun res!187839 () Bool)

(assert (=> b!340087 (=> (not res!187839) (not e!208637))))

(assert (=> b!340087 (= res!187839 (validKeyInArray!0 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340088 () Bool)

(assert (=> b!340088 (= e!208636 call!26536)))

(declare-fun bm!26533 () Bool)

(assert (=> bm!26533 (= call!26536 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52635 (Cons!4851 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000) Nil!4852) Nil!4852)))))

(assert (= (and d!70893 (not res!187841)) b!340087))

(assert (= (and b!340087 res!187839) b!340085))

(assert (= (and b!340087 res!187840) b!340086))

(assert (= (and b!340086 c!52635) b!340084))

(assert (= (and b!340086 (not c!52635)) b!340088))

(assert (= (or b!340084 b!340088) bm!26533))

(assert (=> b!340085 m!342857))

(assert (=> b!340085 m!342857))

(declare-fun m!342909 () Bool)

(assert (=> b!340085 m!342909))

(assert (=> b!340086 m!342857))

(assert (=> b!340086 m!342857))

(assert (=> b!340086 m!342859))

(assert (=> b!340087 m!342857))

(assert (=> b!340087 m!342857))

(assert (=> b!340087 m!342859))

(assert (=> bm!26533 m!342857))

(declare-fun m!342911 () Bool)

(assert (=> bm!26533 m!342911))

(assert (=> b!339966 d!70893))

(declare-fun b!340101 () Bool)

(declare-fun e!208646 () SeekEntryResult!3264)

(declare-fun lt!161463 () SeekEntryResult!3264)

(assert (=> b!340101 (= e!208646 (Found!3264 (index!15237 lt!161463)))))

(declare-fun b!340102 () Bool)

(declare-fun c!52644 () Bool)

(declare-fun lt!161464 () (_ BitVec 64))

(assert (=> b!340102 (= c!52644 (= lt!161464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!208647 () SeekEntryResult!3264)

(assert (=> b!340102 (= e!208646 e!208647)))

(declare-fun b!340103 () Bool)

(declare-fun e!208645 () SeekEntryResult!3264)

(assert (=> b!340103 (= e!208645 Undefined!3264)))

(declare-fun b!340104 () Bool)

(assert (=> b!340104 (= e!208647 (MissingZero!3264 (index!15237 lt!161463)))))

(declare-fun d!70895 () Bool)

(declare-fun lt!161462 () SeekEntryResult!3264)

(assert (=> d!70895 (and (or ((_ is Undefined!3264) lt!161462) (not ((_ is Found!3264) lt!161462)) (and (bvsge (index!15236 lt!161462) #b00000000000000000000000000000000) (bvslt (index!15236 lt!161462) (size!8800 _keys!1895)))) (or ((_ is Undefined!3264) lt!161462) ((_ is Found!3264) lt!161462) (not ((_ is MissingZero!3264) lt!161462)) (and (bvsge (index!15235 lt!161462) #b00000000000000000000000000000000) (bvslt (index!15235 lt!161462) (size!8800 _keys!1895)))) (or ((_ is Undefined!3264) lt!161462) ((_ is Found!3264) lt!161462) ((_ is MissingZero!3264) lt!161462) (not ((_ is MissingVacant!3264) lt!161462)) (and (bvsge (index!15238 lt!161462) #b00000000000000000000000000000000) (bvslt (index!15238 lt!161462) (size!8800 _keys!1895)))) (or ((_ is Undefined!3264) lt!161462) (ite ((_ is Found!3264) lt!161462) (= (select (arr!8448 _keys!1895) (index!15236 lt!161462)) k0!1348) (ite ((_ is MissingZero!3264) lt!161462) (= (select (arr!8448 _keys!1895) (index!15235 lt!161462)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3264) lt!161462) (= (select (arr!8448 _keys!1895) (index!15238 lt!161462)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70895 (= lt!161462 e!208645)))

(declare-fun c!52643 () Bool)

(assert (=> d!70895 (= c!52643 (and ((_ is Intermediate!3264) lt!161463) (undefined!4076 lt!161463)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17851 (_ BitVec 32)) SeekEntryResult!3264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70895 (= lt!161463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70895 (validMask!0 mask!2385)))

(assert (=> d!70895 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161462)))

(declare-fun b!340105 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17851 (_ BitVec 32)) SeekEntryResult!3264)

(assert (=> b!340105 (= e!208647 (seekKeyOrZeroReturnVacant!0 (x!33862 lt!161463) (index!15237 lt!161463) (index!15237 lt!161463) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340106 () Bool)

(assert (=> b!340106 (= e!208645 e!208646)))

(assert (=> b!340106 (= lt!161464 (select (arr!8448 _keys!1895) (index!15237 lt!161463)))))

(declare-fun c!52642 () Bool)

(assert (=> b!340106 (= c!52642 (= lt!161464 k0!1348))))

(assert (= (and d!70895 c!52643) b!340103))

(assert (= (and d!70895 (not c!52643)) b!340106))

(assert (= (and b!340106 c!52642) b!340101))

(assert (= (and b!340106 (not c!52642)) b!340102))

(assert (= (and b!340102 c!52644) b!340104))

(assert (= (and b!340102 (not c!52644)) b!340105))

(declare-fun m!342913 () Bool)

(assert (=> d!70895 m!342913))

(declare-fun m!342915 () Bool)

(assert (=> d!70895 m!342915))

(declare-fun m!342917 () Bool)

(assert (=> d!70895 m!342917))

(declare-fun m!342919 () Bool)

(assert (=> d!70895 m!342919))

(assert (=> d!70895 m!342811))

(declare-fun m!342921 () Bool)

(assert (=> d!70895 m!342921))

(assert (=> d!70895 m!342915))

(declare-fun m!342923 () Bool)

(assert (=> b!340105 m!342923))

(declare-fun m!342925 () Bool)

(assert (=> b!340106 m!342925))

(assert (=> b!339969 d!70895))

(declare-fun d!70897 () Bool)

(assert (=> d!70897 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34112 d!70897))

(declare-fun d!70899 () Bool)

(assert (=> d!70899 (= (array_inv!6260 _values!1525) (bvsge (size!8801 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34112 d!70899))

(declare-fun d!70901 () Bool)

(assert (=> d!70901 (= (array_inv!6261 _keys!1895) (bvsge (size!8800 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34112 d!70901))

(declare-fun b!340115 () Bool)

(declare-fun e!208654 () Bool)

(declare-fun call!26539 () Bool)

(assert (=> b!340115 (= e!208654 call!26539)))

(declare-fun b!340116 () Bool)

(declare-fun e!208656 () Bool)

(declare-fun e!208655 () Bool)

(assert (=> b!340116 (= e!208656 e!208655)))

(declare-fun c!52647 () Bool)

(assert (=> b!340116 (= c!52647 (validKeyInArray!0 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70903 () Bool)

(declare-fun res!187846 () Bool)

(assert (=> d!70903 (=> res!187846 e!208656)))

(assert (=> d!70903 (= res!187846 (bvsge #b00000000000000000000000000000000 (size!8800 _keys!1895)))))

(assert (=> d!70903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208656)))

(declare-fun b!340117 () Bool)

(assert (=> b!340117 (= e!208655 call!26539)))

(declare-fun bm!26536 () Bool)

(assert (=> bm!26536 (= call!26539 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!340118 () Bool)

(assert (=> b!340118 (= e!208655 e!208654)))

(declare-fun lt!161473 () (_ BitVec 64))

(assert (=> b!340118 (= lt!161473 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161471 () Unit!10597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17851 (_ BitVec 64) (_ BitVec 32)) Unit!10597)

(assert (=> b!340118 (= lt!161471 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161473 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340118 (arrayContainsKey!0 _keys!1895 lt!161473 #b00000000000000000000000000000000)))

(declare-fun lt!161472 () Unit!10597)

(assert (=> b!340118 (= lt!161472 lt!161471)))

(declare-fun res!187847 () Bool)

(assert (=> b!340118 (= res!187847 (= (seekEntryOrOpen!0 (select (arr!8448 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3264 #b00000000000000000000000000000000)))))

(assert (=> b!340118 (=> (not res!187847) (not e!208654))))

(assert (= (and d!70903 (not res!187846)) b!340116))

(assert (= (and b!340116 c!52647) b!340118))

(assert (= (and b!340116 (not c!52647)) b!340117))

(assert (= (and b!340118 res!187847) b!340115))

(assert (= (or b!340115 b!340117) bm!26536))

(assert (=> b!340116 m!342857))

(assert (=> b!340116 m!342857))

(assert (=> b!340116 m!342859))

(declare-fun m!342927 () Bool)

(assert (=> bm!26536 m!342927))

(assert (=> b!340118 m!342857))

(declare-fun m!342929 () Bool)

(assert (=> b!340118 m!342929))

(declare-fun m!342931 () Bool)

(assert (=> b!340118 m!342931))

(assert (=> b!340118 m!342857))

(declare-fun m!342933 () Bool)

(assert (=> b!340118 m!342933))

(assert (=> b!339965 d!70903))

(declare-fun b!340125 () Bool)

(declare-fun e!208662 () Bool)

(assert (=> b!340125 (= e!208662 tp_is_empty!7125)))

(declare-fun mapIsEmpty!12114 () Bool)

(declare-fun mapRes!12114 () Bool)

(assert (=> mapIsEmpty!12114 mapRes!12114))

(declare-fun b!340126 () Bool)

(declare-fun e!208661 () Bool)

(assert (=> b!340126 (= e!208661 tp_is_empty!7125)))

(declare-fun mapNonEmpty!12114 () Bool)

(declare-fun tp!25056 () Bool)

(assert (=> mapNonEmpty!12114 (= mapRes!12114 (and tp!25056 e!208662))))

(declare-fun mapValue!12114 () ValueCell!3219)

(declare-fun mapRest!12114 () (Array (_ BitVec 32) ValueCell!3219))

(declare-fun mapKey!12114 () (_ BitVec 32))

(assert (=> mapNonEmpty!12114 (= mapRest!12108 (store mapRest!12114 mapKey!12114 mapValue!12114))))

(declare-fun condMapEmpty!12114 () Bool)

(declare-fun mapDefault!12114 () ValueCell!3219)

(assert (=> mapNonEmpty!12108 (= condMapEmpty!12114 (= mapRest!12108 ((as const (Array (_ BitVec 32) ValueCell!3219)) mapDefault!12114)))))

(assert (=> mapNonEmpty!12108 (= tp!25047 (and e!208661 mapRes!12114))))

(assert (= (and mapNonEmpty!12108 condMapEmpty!12114) mapIsEmpty!12114))

(assert (= (and mapNonEmpty!12108 (not condMapEmpty!12114)) mapNonEmpty!12114))

(assert (= (and mapNonEmpty!12114 ((_ is ValueCellFull!3219) mapValue!12114)) b!340125))

(assert (= (and mapNonEmpty!12108 ((_ is ValueCellFull!3219) mapDefault!12114)) b!340126))

(declare-fun m!342935 () Bool)

(assert (=> mapNonEmpty!12114 m!342935))

(declare-fun b_lambda!8437 () Bool)

(assert (= b_lambda!8435 (or (and start!34112 b_free!7173) b_lambda!8437)))

(check-sat (not b!340006) (not b_next!7173) (not bm!26533) (not d!70891) (not b!340008) (not b!340085) (not b!340105) (not b_lambda!8437) (not b!340066) (not bm!26530) (not b!340071) (not b!340065) (not b!340059) (not bm!26536) (not b!340054) (not d!70895) (not bm!26529) (not mapNonEmpty!12114) (not b!340087) (not b!340060) (not b!340051) tp_is_empty!7125 (not b!340086) (not b!340064) (not b!340118) (not b!340116) b_and!14373 (not bm!26524) (not bm!26526) (not d!70889))
(check-sat b_and!14373 (not b_next!7173))
