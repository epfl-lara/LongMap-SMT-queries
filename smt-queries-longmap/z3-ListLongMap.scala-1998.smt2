; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34902 () Bool)

(assert start!34902)

(declare-fun b_free!7657 () Bool)

(declare-fun b_next!7657 () Bool)

(assert (=> start!34902 (= b_free!7657 (not b_next!7657))))

(declare-fun tp!26544 () Bool)

(declare-fun b_and!14897 () Bool)

(assert (=> start!34902 (= tp!26544 b_and!14897)))

(declare-fun mapIsEmpty!12879 () Bool)

(declare-fun mapRes!12879 () Bool)

(assert (=> mapIsEmpty!12879 mapRes!12879))

(declare-fun b!349651 () Bool)

(declare-fun res!193820 () Bool)

(declare-fun e!214182 () Bool)

(assert (=> b!349651 (=> (not res!193820) (not e!214182))))

(declare-datatypes ((array!18792 0))(
  ( (array!18793 (arr!8903 (Array (_ BitVec 32) (_ BitVec 64))) (size!9255 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18792)

(declare-datatypes ((List!5080 0))(
  ( (Nil!5077) (Cons!5076 (h!5932 (_ BitVec 64)) (t!10206 List!5080)) )
))
(declare-fun arrayNoDuplicates!0 (array!18792 (_ BitVec 32) List!5080) Bool)

(assert (=> b!349651 (= res!193820 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5077))))

(declare-fun b!349652 () Bool)

(declare-fun e!214175 () Bool)

(declare-fun tp_is_empty!7609 () Bool)

(assert (=> b!349652 (= e!214175 tp_is_empty!7609)))

(declare-fun b!349653 () Bool)

(declare-fun res!193818 () Bool)

(declare-fun e!214180 () Bool)

(assert (=> b!349653 (=> (not res!193818) (not e!214180))))

(declare-datatypes ((SeekEntryResult!3384 0))(
  ( (MissingZero!3384 (index!15715 (_ BitVec 32))) (Found!3384 (index!15716 (_ BitVec 32))) (Intermediate!3384 (undefined!4196 Bool) (index!15717 (_ BitVec 32)) (x!34777 (_ BitVec 32))) (Undefined!3384) (MissingVacant!3384 (index!15718 (_ BitVec 32))) )
))
(declare-fun lt!164292 () SeekEntryResult!3384)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!349653 (= res!193818 (inRange!0 (index!15715 lt!164292) mask!2385))))

(declare-fun res!193822 () Bool)

(assert (=> start!34902 (=> (not res!193822) (not e!214182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34902 (= res!193822 (validMask!0 mask!2385))))

(assert (=> start!34902 e!214182))

(assert (=> start!34902 true))

(assert (=> start!34902 tp_is_empty!7609))

(assert (=> start!34902 tp!26544))

(declare-datatypes ((V!11123 0))(
  ( (V!11124 (val!3849 Int)) )
))
(declare-datatypes ((ValueCell!3461 0))(
  ( (ValueCellFull!3461 (v!6035 V!11123)) (EmptyCell!3461) )
))
(declare-datatypes ((array!18794 0))(
  ( (array!18795 (arr!8904 (Array (_ BitVec 32) ValueCell!3461)) (size!9256 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18794)

(declare-fun e!214178 () Bool)

(declare-fun array_inv!6580 (array!18794) Bool)

(assert (=> start!34902 (and (array_inv!6580 _values!1525) e!214178)))

(declare-fun array_inv!6581 (array!18792) Bool)

(assert (=> start!34902 (array_inv!6581 _keys!1895)))

(declare-fun b!349654 () Bool)

(declare-fun e!214181 () Bool)

(assert (=> b!349654 (= e!214178 (and e!214181 mapRes!12879))))

(declare-fun condMapEmpty!12879 () Bool)

(declare-fun mapDefault!12879 () ValueCell!3461)

(assert (=> b!349654 (= condMapEmpty!12879 (= (arr!8904 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3461)) mapDefault!12879)))))

(declare-fun b!349655 () Bool)

(assert (=> b!349655 (= e!214180 (or (bvslt (index!15715 lt!164292) #b00000000000000000000000000000000) (bvsge (index!15715 lt!164292) (size!9255 _keys!1895))))))

(declare-fun b!349656 () Bool)

(declare-fun e!214177 () Bool)

(assert (=> b!349656 (= e!214177 e!214180)))

(declare-fun res!193823 () Bool)

(assert (=> b!349656 (=> (not res!193823) (not e!214180))))

(declare-fun lt!164293 () Bool)

(assert (=> b!349656 (= res!193823 (not lt!164293))))

(declare-datatypes ((Unit!10800 0))(
  ( (Unit!10801) )
))
(declare-fun lt!164290 () Unit!10800)

(declare-fun e!214179 () Unit!10800)

(assert (=> b!349656 (= lt!164290 e!214179)))

(declare-fun c!53273 () Bool)

(assert (=> b!349656 (= c!53273 lt!164293)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349656 (= lt!164293 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12879 () Bool)

(declare-fun tp!26543 () Bool)

(assert (=> mapNonEmpty!12879 (= mapRes!12879 (and tp!26543 e!214175))))

(declare-fun mapKey!12879 () (_ BitVec 32))

(declare-fun mapRest!12879 () (Array (_ BitVec 32) ValueCell!3461))

(declare-fun mapValue!12879 () ValueCell!3461)

(assert (=> mapNonEmpty!12879 (= (arr!8904 _values!1525) (store mapRest!12879 mapKey!12879 mapValue!12879))))

(declare-fun b!349657 () Bool)

(assert (=> b!349657 (= e!214181 tp_is_empty!7609)))

(declare-fun b!349658 () Bool)

(declare-fun res!193824 () Bool)

(assert (=> b!349658 (=> (not res!193824) (not e!214182))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!349658 (= res!193824 (and (= (size!9256 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9255 _keys!1895) (size!9256 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349659 () Bool)

(assert (=> b!349659 (= e!214182 e!214177)))

(declare-fun res!193816 () Bool)

(assert (=> b!349659 (=> (not res!193816) (not e!214177))))

(get-info :version)

(assert (=> b!349659 (= res!193816 (and (not ((_ is Found!3384) lt!164292)) ((_ is MissingZero!3384) lt!164292)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18792 (_ BitVec 32)) SeekEntryResult!3384)

(assert (=> b!349659 (= lt!164292 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349660 () Bool)

(declare-fun res!193821 () Bool)

(assert (=> b!349660 (=> (not res!193821) (not e!214182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349660 (= res!193821 (validKeyInArray!0 k0!1348))))

(declare-fun b!349661 () Bool)

(declare-fun res!193817 () Bool)

(assert (=> b!349661 (=> (not res!193817) (not e!214182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18792 (_ BitVec 32)) Bool)

(assert (=> b!349661 (= res!193817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349662 () Bool)

(declare-fun Unit!10802 () Unit!10800)

(assert (=> b!349662 (= e!214179 Unit!10802)))

(declare-fun zeroValue!1467 () V!11123)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!164291 () Unit!10800)

(declare-fun minValue!1467 () V!11123)

(declare-fun lemmaArrayContainsKeyThenInListMap!328 (array!18792 array!18794 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 64) (_ BitVec 32) Int) Unit!10800)

(declare-fun arrayScanForKey!0 (array!18792 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349662 (= lt!164291 (lemmaArrayContainsKeyThenInListMap!328 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349662 false))

(declare-fun b!349663 () Bool)

(declare-fun res!193819 () Bool)

(assert (=> b!349663 (=> (not res!193819) (not e!214182))))

(declare-datatypes ((tuple2!5474 0))(
  ( (tuple2!5475 (_1!2748 (_ BitVec 64)) (_2!2748 V!11123)) )
))
(declare-datatypes ((List!5081 0))(
  ( (Nil!5078) (Cons!5077 (h!5933 tuple2!5474) (t!10207 List!5081)) )
))
(declare-datatypes ((ListLongMap!4389 0))(
  ( (ListLongMap!4390 (toList!2210 List!5081)) )
))
(declare-fun contains!2296 (ListLongMap!4389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1738 (array!18792 array!18794 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 32) Int) ListLongMap!4389)

(assert (=> b!349663 (= res!193819 (not (contains!2296 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349664 () Bool)

(declare-fun Unit!10803 () Unit!10800)

(assert (=> b!349664 (= e!214179 Unit!10803)))

(assert (= (and start!34902 res!193822) b!349658))

(assert (= (and b!349658 res!193824) b!349661))

(assert (= (and b!349661 res!193817) b!349651))

(assert (= (and b!349651 res!193820) b!349660))

(assert (= (and b!349660 res!193821) b!349663))

(assert (= (and b!349663 res!193819) b!349659))

(assert (= (and b!349659 res!193816) b!349656))

(assert (= (and b!349656 c!53273) b!349662))

(assert (= (and b!349656 (not c!53273)) b!349664))

(assert (= (and b!349656 res!193823) b!349653))

(assert (= (and b!349653 res!193818) b!349655))

(assert (= (and b!349654 condMapEmpty!12879) mapIsEmpty!12879))

(assert (= (and b!349654 (not condMapEmpty!12879)) mapNonEmpty!12879))

(assert (= (and mapNonEmpty!12879 ((_ is ValueCellFull!3461) mapValue!12879)) b!349652))

(assert (= (and b!349654 ((_ is ValueCellFull!3461) mapDefault!12879)) b!349657))

(assert (= start!34902 b!349654))

(declare-fun m!350355 () Bool)

(assert (=> b!349659 m!350355))

(declare-fun m!350357 () Bool)

(assert (=> b!349663 m!350357))

(assert (=> b!349663 m!350357))

(declare-fun m!350359 () Bool)

(assert (=> b!349663 m!350359))

(declare-fun m!350361 () Bool)

(assert (=> b!349661 m!350361))

(declare-fun m!350363 () Bool)

(assert (=> b!349662 m!350363))

(assert (=> b!349662 m!350363))

(declare-fun m!350365 () Bool)

(assert (=> b!349662 m!350365))

(declare-fun m!350367 () Bool)

(assert (=> b!349651 m!350367))

(declare-fun m!350369 () Bool)

(assert (=> b!349656 m!350369))

(declare-fun m!350371 () Bool)

(assert (=> mapNonEmpty!12879 m!350371))

(declare-fun m!350373 () Bool)

(assert (=> b!349660 m!350373))

(declare-fun m!350375 () Bool)

(assert (=> start!34902 m!350375))

(declare-fun m!350377 () Bool)

(assert (=> start!34902 m!350377))

(declare-fun m!350379 () Bool)

(assert (=> start!34902 m!350379))

(declare-fun m!350381 () Bool)

(assert (=> b!349653 m!350381))

(check-sat tp_is_empty!7609 (not b!349663) (not b!349653) (not b!349651) (not b!349662) (not start!34902) (not b!349656) (not b!349659) (not b_next!7657) (not b!349661) b_and!14897 (not mapNonEmpty!12879) (not b!349660))
(check-sat b_and!14897 (not b_next!7657))
(get-model)

(declare-fun d!71401 () Bool)

(assert (=> d!71401 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349660 d!71401))

(declare-fun d!71403 () Bool)

(declare-fun res!193883 () Bool)

(declare-fun e!214235 () Bool)

(assert (=> d!71403 (=> res!193883 e!214235)))

(assert (=> d!71403 (= res!193883 (= (select (arr!8903 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71403 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!214235)))

(declare-fun b!349753 () Bool)

(declare-fun e!214236 () Bool)

(assert (=> b!349753 (= e!214235 e!214236)))

(declare-fun res!193884 () Bool)

(assert (=> b!349753 (=> (not res!193884) (not e!214236))))

(assert (=> b!349753 (= res!193884 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9255 _keys!1895)))))

(declare-fun b!349754 () Bool)

(assert (=> b!349754 (= e!214236 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71403 (not res!193883)) b!349753))

(assert (= (and b!349753 res!193884) b!349754))

(declare-fun m!350439 () Bool)

(assert (=> d!71403 m!350439))

(declare-fun m!350441 () Bool)

(assert (=> b!349754 m!350441))

(assert (=> b!349656 d!71403))

(declare-fun d!71405 () Bool)

(declare-fun res!193891 () Bool)

(declare-fun e!214245 () Bool)

(assert (=> d!71405 (=> res!193891 e!214245)))

(assert (=> d!71405 (= res!193891 (bvsge #b00000000000000000000000000000000 (size!9255 _keys!1895)))))

(assert (=> d!71405 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5077) e!214245)))

(declare-fun b!349765 () Bool)

(declare-fun e!214248 () Bool)

(assert (=> b!349765 (= e!214245 e!214248)))

(declare-fun res!193892 () Bool)

(assert (=> b!349765 (=> (not res!193892) (not e!214248))))

(declare-fun e!214247 () Bool)

(assert (=> b!349765 (= res!193892 (not e!214247))))

(declare-fun res!193893 () Bool)

(assert (=> b!349765 (=> (not res!193893) (not e!214247))))

(assert (=> b!349765 (= res!193893 (validKeyInArray!0 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26903 () Bool)

(declare-fun call!26906 () Bool)

(declare-fun c!53282 () Bool)

(assert (=> bm!26903 (= call!26906 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53282 (Cons!5076 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000) Nil!5077) Nil!5077)))))

(declare-fun b!349766 () Bool)

(declare-fun contains!2298 (List!5080 (_ BitVec 64)) Bool)

(assert (=> b!349766 (= e!214247 (contains!2298 Nil!5077 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349767 () Bool)

(declare-fun e!214246 () Bool)

(assert (=> b!349767 (= e!214248 e!214246)))

(assert (=> b!349767 (= c!53282 (validKeyInArray!0 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349768 () Bool)

(assert (=> b!349768 (= e!214246 call!26906)))

(declare-fun b!349769 () Bool)

(assert (=> b!349769 (= e!214246 call!26906)))

(assert (= (and d!71405 (not res!193891)) b!349765))

(assert (= (and b!349765 res!193893) b!349766))

(assert (= (and b!349765 res!193892) b!349767))

(assert (= (and b!349767 c!53282) b!349768))

(assert (= (and b!349767 (not c!53282)) b!349769))

(assert (= (or b!349768 b!349769) bm!26903))

(assert (=> b!349765 m!350439))

(assert (=> b!349765 m!350439))

(declare-fun m!350443 () Bool)

(assert (=> b!349765 m!350443))

(assert (=> bm!26903 m!350439))

(declare-fun m!350445 () Bool)

(assert (=> bm!26903 m!350445))

(assert (=> b!349766 m!350439))

(assert (=> b!349766 m!350439))

(declare-fun m!350447 () Bool)

(assert (=> b!349766 m!350447))

(assert (=> b!349767 m!350439))

(assert (=> b!349767 m!350439))

(assert (=> b!349767 m!350443))

(assert (=> b!349651 d!71405))

(declare-fun b!349778 () Bool)

(declare-fun e!214256 () Bool)

(declare-fun call!26909 () Bool)

(assert (=> b!349778 (= e!214256 call!26909)))

(declare-fun b!349779 () Bool)

(declare-fun e!214255 () Bool)

(assert (=> b!349779 (= e!214255 call!26909)))

(declare-fun b!349780 () Bool)

(assert (=> b!349780 (= e!214256 e!214255)))

(declare-fun lt!164326 () (_ BitVec 64))

(assert (=> b!349780 (= lt!164326 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164324 () Unit!10800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18792 (_ BitVec 64) (_ BitVec 32)) Unit!10800)

(assert (=> b!349780 (= lt!164324 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164326 #b00000000000000000000000000000000))))

(assert (=> b!349780 (arrayContainsKey!0 _keys!1895 lt!164326 #b00000000000000000000000000000000)))

(declare-fun lt!164325 () Unit!10800)

(assert (=> b!349780 (= lt!164325 lt!164324)))

(declare-fun res!193898 () Bool)

(assert (=> b!349780 (= res!193898 (= (seekEntryOrOpen!0 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3384 #b00000000000000000000000000000000)))))

(assert (=> b!349780 (=> (not res!193898) (not e!214255))))

(declare-fun b!349781 () Bool)

(declare-fun e!214257 () Bool)

(assert (=> b!349781 (= e!214257 e!214256)))

(declare-fun c!53285 () Bool)

(assert (=> b!349781 (= c!53285 (validKeyInArray!0 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71407 () Bool)

(declare-fun res!193899 () Bool)

(assert (=> d!71407 (=> res!193899 e!214257)))

(assert (=> d!71407 (= res!193899 (bvsge #b00000000000000000000000000000000 (size!9255 _keys!1895)))))

(assert (=> d!71407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!214257)))

(declare-fun bm!26906 () Bool)

(assert (=> bm!26906 (= call!26909 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71407 (not res!193899)) b!349781))

(assert (= (and b!349781 c!53285) b!349780))

(assert (= (and b!349781 (not c!53285)) b!349778))

(assert (= (and b!349780 res!193898) b!349779))

(assert (= (or b!349779 b!349778) bm!26906))

(assert (=> b!349780 m!350439))

(declare-fun m!350449 () Bool)

(assert (=> b!349780 m!350449))

(declare-fun m!350451 () Bool)

(assert (=> b!349780 m!350451))

(assert (=> b!349780 m!350439))

(declare-fun m!350453 () Bool)

(assert (=> b!349780 m!350453))

(assert (=> b!349781 m!350439))

(assert (=> b!349781 m!350439))

(assert (=> b!349781 m!350443))

(declare-fun m!350455 () Bool)

(assert (=> bm!26906 m!350455))

(assert (=> b!349661 d!71407))

(declare-fun d!71409 () Bool)

(assert (=> d!71409 (contains!2296 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!164329 () Unit!10800)

(declare-fun choose!1313 (array!18792 array!18794 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 64) (_ BitVec 32) Int) Unit!10800)

(assert (=> d!71409 (= lt!164329 (choose!1313 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71409 (validMask!0 mask!2385)))

(assert (=> d!71409 (= (lemmaArrayContainsKeyThenInListMap!328 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!164329)))

(declare-fun bs!11949 () Bool)

(assert (= bs!11949 d!71409))

(assert (=> bs!11949 m!350357))

(assert (=> bs!11949 m!350357))

(assert (=> bs!11949 m!350359))

(assert (=> bs!11949 m!350363))

(declare-fun m!350457 () Bool)

(assert (=> bs!11949 m!350457))

(assert (=> bs!11949 m!350375))

(assert (=> b!349662 d!71409))

(declare-fun d!71411 () Bool)

(declare-fun lt!164332 () (_ BitVec 32))

(assert (=> d!71411 (and (or (bvslt lt!164332 #b00000000000000000000000000000000) (bvsge lt!164332 (size!9255 _keys!1895)) (and (bvsge lt!164332 #b00000000000000000000000000000000) (bvslt lt!164332 (size!9255 _keys!1895)))) (bvsge lt!164332 #b00000000000000000000000000000000) (bvslt lt!164332 (size!9255 _keys!1895)) (= (select (arr!8903 _keys!1895) lt!164332) k0!1348))))

(declare-fun e!214260 () (_ BitVec 32))

(assert (=> d!71411 (= lt!164332 e!214260)))

(declare-fun c!53288 () Bool)

(assert (=> d!71411 (= c!53288 (= (select (arr!8903 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71411 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9255 _keys!1895)) (bvslt (size!9255 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71411 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164332)))

(declare-fun b!349786 () Bool)

(assert (=> b!349786 (= e!214260 #b00000000000000000000000000000000)))

(declare-fun b!349787 () Bool)

(assert (=> b!349787 (= e!214260 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71411 c!53288) b!349786))

(assert (= (and d!71411 (not c!53288)) b!349787))

(declare-fun m!350459 () Bool)

(assert (=> d!71411 m!350459))

(assert (=> d!71411 m!350439))

(declare-fun m!350461 () Bool)

(assert (=> b!349787 m!350461))

(assert (=> b!349662 d!71411))

(declare-fun d!71413 () Bool)

(assert (=> d!71413 (= (inRange!0 (index!15715 lt!164292) mask!2385) (and (bvsge (index!15715 lt!164292) #b00000000000000000000000000000000) (bvslt (index!15715 lt!164292) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!349653 d!71413))

(declare-fun d!71415 () Bool)

(assert (=> d!71415 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34902 d!71415))

(declare-fun d!71417 () Bool)

(assert (=> d!71417 (= (array_inv!6580 _values!1525) (bvsge (size!9256 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34902 d!71417))

(declare-fun d!71419 () Bool)

(assert (=> d!71419 (= (array_inv!6581 _keys!1895) (bvsge (size!9255 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34902 d!71419))

(declare-fun d!71421 () Bool)

(declare-fun e!214265 () Bool)

(assert (=> d!71421 e!214265))

(declare-fun res!193902 () Bool)

(assert (=> d!71421 (=> res!193902 e!214265)))

(declare-fun lt!164343 () Bool)

(assert (=> d!71421 (= res!193902 (not lt!164343))))

(declare-fun lt!164344 () Bool)

(assert (=> d!71421 (= lt!164343 lt!164344)))

(declare-fun lt!164342 () Unit!10800)

(declare-fun e!214266 () Unit!10800)

(assert (=> d!71421 (= lt!164342 e!214266)))

(declare-fun c!53291 () Bool)

(assert (=> d!71421 (= c!53291 lt!164344)))

(declare-fun containsKey!339 (List!5081 (_ BitVec 64)) Bool)

(assert (=> d!71421 (= lt!164344 (containsKey!339 (toList!2210 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71421 (= (contains!2296 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164343)))

(declare-fun b!349794 () Bool)

(declare-fun lt!164341 () Unit!10800)

(assert (=> b!349794 (= e!214266 lt!164341)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!287 (List!5081 (_ BitVec 64)) Unit!10800)

(assert (=> b!349794 (= lt!164341 (lemmaContainsKeyImpliesGetValueByKeyDefined!287 (toList!2210 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!354 0))(
  ( (Some!353 (v!6038 V!11123)) (None!352) )
))
(declare-fun isDefined!288 (Option!354) Bool)

(declare-fun getValueByKey!348 (List!5081 (_ BitVec 64)) Option!354)

(assert (=> b!349794 (isDefined!288 (getValueByKey!348 (toList!2210 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349795 () Bool)

(declare-fun Unit!10808 () Unit!10800)

(assert (=> b!349795 (= e!214266 Unit!10808)))

(declare-fun b!349796 () Bool)

(assert (=> b!349796 (= e!214265 (isDefined!288 (getValueByKey!348 (toList!2210 (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71421 c!53291) b!349794))

(assert (= (and d!71421 (not c!53291)) b!349795))

(assert (= (and d!71421 (not res!193902)) b!349796))

(declare-fun m!350463 () Bool)

(assert (=> d!71421 m!350463))

(declare-fun m!350465 () Bool)

(assert (=> b!349794 m!350465))

(declare-fun m!350467 () Bool)

(assert (=> b!349794 m!350467))

(assert (=> b!349794 m!350467))

(declare-fun m!350469 () Bool)

(assert (=> b!349794 m!350469))

(assert (=> b!349796 m!350467))

(assert (=> b!349796 m!350467))

(assert (=> b!349796 m!350469))

(assert (=> b!349663 d!71421))

(declare-fun b!349839 () Bool)

(declare-fun e!214305 () Bool)

(declare-fun e!214303 () Bool)

(assert (=> b!349839 (= e!214305 e!214303)))

(declare-fun res!193921 () Bool)

(assert (=> b!349839 (=> (not res!193921) (not e!214303))))

(declare-fun lt!164407 () ListLongMap!4389)

(assert (=> b!349839 (= res!193921 (contains!2296 lt!164407 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9255 _keys!1895)))))

(declare-fun b!349840 () Bool)

(declare-fun e!214297 () Bool)

(declare-fun apply!289 (ListLongMap!4389 (_ BitVec 64)) V!11123)

(assert (=> b!349840 (= e!214297 (= (apply!289 lt!164407 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun d!71423 () Bool)

(declare-fun e!214294 () Bool)

(assert (=> d!71423 e!214294))

(declare-fun res!193928 () Bool)

(assert (=> d!71423 (=> (not res!193928) (not e!214294))))

(assert (=> d!71423 (= res!193928 (or (bvsge #b00000000000000000000000000000000 (size!9255 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9255 _keys!1895)))))))

(declare-fun lt!164397 () ListLongMap!4389)

(assert (=> d!71423 (= lt!164407 lt!164397)))

(declare-fun lt!164394 () Unit!10800)

(declare-fun e!214298 () Unit!10800)

(assert (=> d!71423 (= lt!164394 e!214298)))

(declare-fun c!53308 () Bool)

(declare-fun e!214299 () Bool)

(assert (=> d!71423 (= c!53308 e!214299)))

(declare-fun res!193927 () Bool)

(assert (=> d!71423 (=> (not res!193927) (not e!214299))))

(assert (=> d!71423 (= res!193927 (bvslt #b00000000000000000000000000000000 (size!9255 _keys!1895)))))

(declare-fun e!214296 () ListLongMap!4389)

(assert (=> d!71423 (= lt!164397 e!214296)))

(declare-fun c!53305 () Bool)

(assert (=> d!71423 (= c!53305 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71423 (validMask!0 mask!2385)))

(assert (=> d!71423 (= (getCurrentListMap!1738 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164407)))

(declare-fun bm!26921 () Bool)

(declare-fun call!26929 () ListLongMap!4389)

(declare-fun call!26924 () ListLongMap!4389)

(assert (=> bm!26921 (= call!26929 call!26924)))

(declare-fun b!349841 () Bool)

(declare-fun e!214301 () Bool)

(assert (=> b!349841 (= e!214301 e!214297)))

(declare-fun res!193924 () Bool)

(declare-fun call!26927 () Bool)

(assert (=> b!349841 (= res!193924 call!26927)))

(assert (=> b!349841 (=> (not res!193924) (not e!214297))))

(declare-fun b!349842 () Bool)

(declare-fun e!214293 () Bool)

(assert (=> b!349842 (= e!214293 (validKeyInArray!0 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349843 () Bool)

(declare-fun e!214304 () ListLongMap!4389)

(declare-fun call!26925 () ListLongMap!4389)

(assert (=> b!349843 (= e!214304 call!26925)))

(declare-fun b!349844 () Bool)

(assert (=> b!349844 (= e!214296 e!214304)))

(declare-fun c!53309 () Bool)

(assert (=> b!349844 (= c!53309 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26922 () Bool)

(assert (=> bm!26922 (= call!26927 (contains!2296 lt!164407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349845 () Bool)

(declare-fun c!53306 () Bool)

(assert (=> b!349845 (= c!53306 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!214302 () ListLongMap!4389)

(assert (=> b!349845 (= e!214304 e!214302)))

(declare-fun bm!26923 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!605 (array!18792 array!18794 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 32) Int) ListLongMap!4389)

(assert (=> bm!26923 (= call!26924 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!349846 () Bool)

(assert (=> b!349846 (= e!214299 (validKeyInArray!0 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349847 () Bool)

(declare-fun e!214300 () Bool)

(declare-fun e!214295 () Bool)

(assert (=> b!349847 (= e!214300 e!214295)))

(declare-fun res!193926 () Bool)

(declare-fun call!26926 () Bool)

(assert (=> b!349847 (= res!193926 call!26926)))

(assert (=> b!349847 (=> (not res!193926) (not e!214295))))

(declare-fun bm!26924 () Bool)

(assert (=> bm!26924 (= call!26926 (contains!2296 lt!164407 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349848 () Bool)

(assert (=> b!349848 (= e!214295 (= (apply!289 lt!164407 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!349849 () Bool)

(declare-fun get!4777 (ValueCell!3461 V!11123) V!11123)

(declare-fun dynLambda!632 (Int (_ BitVec 64)) V!11123)

(assert (=> b!349849 (= e!214303 (= (apply!289 lt!164407 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000)) (get!4777 (select (arr!8904 _values!1525) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9256 _values!1525)))))

(assert (=> b!349849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9255 _keys!1895)))))

(declare-fun b!349850 () Bool)

(declare-fun call!26930 () ListLongMap!4389)

(assert (=> b!349850 (= e!214302 call!26930)))

(declare-fun b!349851 () Bool)

(assert (=> b!349851 (= e!214300 (not call!26926))))

(declare-fun b!349852 () Bool)

(assert (=> b!349852 (= e!214301 (not call!26927))))

(declare-fun bm!26925 () Bool)

(declare-fun call!26928 () ListLongMap!4389)

(assert (=> bm!26925 (= call!26925 call!26928)))

(declare-fun b!349853 () Bool)

(assert (=> b!349853 (= e!214294 e!214300)))

(declare-fun c!53307 () Bool)

(assert (=> b!349853 (= c!53307 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349854 () Bool)

(declare-fun res!193922 () Bool)

(assert (=> b!349854 (=> (not res!193922) (not e!214294))))

(assert (=> b!349854 (= res!193922 e!214301)))

(declare-fun c!53304 () Bool)

(assert (=> b!349854 (= c!53304 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26926 () Bool)

(assert (=> bm!26926 (= call!26930 call!26929)))

(declare-fun b!349855 () Bool)

(declare-fun res!193925 () Bool)

(assert (=> b!349855 (=> (not res!193925) (not e!214294))))

(assert (=> b!349855 (= res!193925 e!214305)))

(declare-fun res!193929 () Bool)

(assert (=> b!349855 (=> res!193929 e!214305)))

(assert (=> b!349855 (= res!193929 (not e!214293))))

(declare-fun res!193923 () Bool)

(assert (=> b!349855 (=> (not res!193923) (not e!214293))))

(assert (=> b!349855 (= res!193923 (bvslt #b00000000000000000000000000000000 (size!9255 _keys!1895)))))

(declare-fun b!349856 () Bool)

(declare-fun +!740 (ListLongMap!4389 tuple2!5474) ListLongMap!4389)

(assert (=> b!349856 (= e!214296 (+!740 call!26928 (tuple2!5475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26927 () Bool)

(assert (=> bm!26927 (= call!26928 (+!740 (ite c!53305 call!26924 (ite c!53309 call!26929 call!26930)) (ite (or c!53305 c!53309) (tuple2!5475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!349857 () Bool)

(declare-fun Unit!10809 () Unit!10800)

(assert (=> b!349857 (= e!214298 Unit!10809)))

(declare-fun b!349858 () Bool)

(declare-fun lt!164403 () Unit!10800)

(assert (=> b!349858 (= e!214298 lt!164403)))

(declare-fun lt!164401 () ListLongMap!4389)

(assert (=> b!349858 (= lt!164401 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164395 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164395 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164409 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164409 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164404 () Unit!10800)

(declare-fun addStillContains!265 (ListLongMap!4389 (_ BitVec 64) V!11123 (_ BitVec 64)) Unit!10800)

(assert (=> b!349858 (= lt!164404 (addStillContains!265 lt!164401 lt!164395 zeroValue!1467 lt!164409))))

(assert (=> b!349858 (contains!2296 (+!740 lt!164401 (tuple2!5475 lt!164395 zeroValue!1467)) lt!164409)))

(declare-fun lt!164408 () Unit!10800)

(assert (=> b!349858 (= lt!164408 lt!164404)))

(declare-fun lt!164410 () ListLongMap!4389)

(assert (=> b!349858 (= lt!164410 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164402 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164402 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164392 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164392 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164400 () Unit!10800)

(declare-fun addApplyDifferent!265 (ListLongMap!4389 (_ BitVec 64) V!11123 (_ BitVec 64)) Unit!10800)

(assert (=> b!349858 (= lt!164400 (addApplyDifferent!265 lt!164410 lt!164402 minValue!1467 lt!164392))))

(assert (=> b!349858 (= (apply!289 (+!740 lt!164410 (tuple2!5475 lt!164402 minValue!1467)) lt!164392) (apply!289 lt!164410 lt!164392))))

(declare-fun lt!164405 () Unit!10800)

(assert (=> b!349858 (= lt!164405 lt!164400)))

(declare-fun lt!164406 () ListLongMap!4389)

(assert (=> b!349858 (= lt!164406 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164398 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164399 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164399 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164389 () Unit!10800)

(assert (=> b!349858 (= lt!164389 (addApplyDifferent!265 lt!164406 lt!164398 zeroValue!1467 lt!164399))))

(assert (=> b!349858 (= (apply!289 (+!740 lt!164406 (tuple2!5475 lt!164398 zeroValue!1467)) lt!164399) (apply!289 lt!164406 lt!164399))))

(declare-fun lt!164390 () Unit!10800)

(assert (=> b!349858 (= lt!164390 lt!164389)))

(declare-fun lt!164393 () ListLongMap!4389)

(assert (=> b!349858 (= lt!164393 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164396 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164396 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164391 () (_ BitVec 64))

(assert (=> b!349858 (= lt!164391 (select (arr!8903 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349858 (= lt!164403 (addApplyDifferent!265 lt!164393 lt!164396 minValue!1467 lt!164391))))

(assert (=> b!349858 (= (apply!289 (+!740 lt!164393 (tuple2!5475 lt!164396 minValue!1467)) lt!164391) (apply!289 lt!164393 lt!164391))))

(declare-fun b!349859 () Bool)

(assert (=> b!349859 (= e!214302 call!26925)))

(assert (= (and d!71423 c!53305) b!349856))

(assert (= (and d!71423 (not c!53305)) b!349844))

(assert (= (and b!349844 c!53309) b!349843))

(assert (= (and b!349844 (not c!53309)) b!349845))

(assert (= (and b!349845 c!53306) b!349859))

(assert (= (and b!349845 (not c!53306)) b!349850))

(assert (= (or b!349859 b!349850) bm!26926))

(assert (= (or b!349843 bm!26926) bm!26921))

(assert (= (or b!349843 b!349859) bm!26925))

(assert (= (or b!349856 bm!26921) bm!26923))

(assert (= (or b!349856 bm!26925) bm!26927))

(assert (= (and d!71423 res!193927) b!349846))

(assert (= (and d!71423 c!53308) b!349858))

(assert (= (and d!71423 (not c!53308)) b!349857))

(assert (= (and d!71423 res!193928) b!349855))

(assert (= (and b!349855 res!193923) b!349842))

(assert (= (and b!349855 (not res!193929)) b!349839))

(assert (= (and b!349839 res!193921) b!349849))

(assert (= (and b!349855 res!193925) b!349854))

(assert (= (and b!349854 c!53304) b!349841))

(assert (= (and b!349854 (not c!53304)) b!349852))

(assert (= (and b!349841 res!193924) b!349840))

(assert (= (or b!349841 b!349852) bm!26922))

(assert (= (and b!349854 res!193922) b!349853))

(assert (= (and b!349853 c!53307) b!349847))

(assert (= (and b!349853 (not c!53307)) b!349851))

(assert (= (and b!349847 res!193926) b!349848))

(assert (= (or b!349847 b!349851) bm!26924))

(declare-fun b_lambda!8517 () Bool)

(assert (=> (not b_lambda!8517) (not b!349849)))

(declare-fun t!10212 () Bool)

(declare-fun tb!3085 () Bool)

(assert (=> (and start!34902 (= defaultEntry!1528 defaultEntry!1528) t!10212) tb!3085))

(declare-fun result!5601 () Bool)

(assert (=> tb!3085 (= result!5601 tp_is_empty!7609)))

(assert (=> b!349849 t!10212))

(declare-fun b_and!14903 () Bool)

(assert (= b_and!14897 (and (=> t!10212 result!5601) b_and!14903)))

(declare-fun m!350471 () Bool)

(assert (=> b!349840 m!350471))

(assert (=> d!71423 m!350375))

(assert (=> b!349849 m!350439))

(assert (=> b!349849 m!350439))

(declare-fun m!350473 () Bool)

(assert (=> b!349849 m!350473))

(declare-fun m!350475 () Bool)

(assert (=> b!349849 m!350475))

(declare-fun m!350477 () Bool)

(assert (=> b!349849 m!350477))

(assert (=> b!349849 m!350477))

(assert (=> b!349849 m!350475))

(declare-fun m!350479 () Bool)

(assert (=> b!349849 m!350479))

(assert (=> b!349842 m!350439))

(assert (=> b!349842 m!350439))

(assert (=> b!349842 m!350443))

(declare-fun m!350481 () Bool)

(assert (=> bm!26924 m!350481))

(assert (=> b!349846 m!350439))

(assert (=> b!349846 m!350439))

(assert (=> b!349846 m!350443))

(declare-fun m!350483 () Bool)

(assert (=> b!349856 m!350483))

(declare-fun m!350485 () Bool)

(assert (=> bm!26927 m!350485))

(declare-fun m!350487 () Bool)

(assert (=> bm!26923 m!350487))

(assert (=> b!349839 m!350439))

(assert (=> b!349839 m!350439))

(declare-fun m!350489 () Bool)

(assert (=> b!349839 m!350489))

(declare-fun m!350491 () Bool)

(assert (=> bm!26922 m!350491))

(declare-fun m!350493 () Bool)

(assert (=> b!349848 m!350493))

(assert (=> b!349858 m!350439))

(declare-fun m!350495 () Bool)

(assert (=> b!349858 m!350495))

(declare-fun m!350497 () Bool)

(assert (=> b!349858 m!350497))

(assert (=> b!349858 m!350487))

(assert (=> b!349858 m!350495))

(declare-fun m!350499 () Bool)

(assert (=> b!349858 m!350499))

(declare-fun m!350501 () Bool)

(assert (=> b!349858 m!350501))

(declare-fun m!350503 () Bool)

(assert (=> b!349858 m!350503))

(declare-fun m!350505 () Bool)

(assert (=> b!349858 m!350505))

(declare-fun m!350507 () Bool)

(assert (=> b!349858 m!350507))

(declare-fun m!350509 () Bool)

(assert (=> b!349858 m!350509))

(declare-fun m!350511 () Bool)

(assert (=> b!349858 m!350511))

(declare-fun m!350513 () Bool)

(assert (=> b!349858 m!350513))

(assert (=> b!349858 m!350509))

(declare-fun m!350515 () Bool)

(assert (=> b!349858 m!350515))

(assert (=> b!349858 m!350503))

(declare-fun m!350517 () Bool)

(assert (=> b!349858 m!350517))

(declare-fun m!350519 () Bool)

(assert (=> b!349858 m!350519))

(declare-fun m!350521 () Bool)

(assert (=> b!349858 m!350521))

(assert (=> b!349858 m!350517))

(declare-fun m!350523 () Bool)

(assert (=> b!349858 m!350523))

(assert (=> b!349663 d!71423))

(declare-fun b!349875 () Bool)

(declare-fun e!214312 () SeekEntryResult!3384)

(assert (=> b!349875 (= e!214312 Undefined!3384)))

(declare-fun b!349876 () Bool)

(declare-fun e!214314 () SeekEntryResult!3384)

(assert (=> b!349876 (= e!214312 e!214314)))

(declare-fun lt!164418 () (_ BitVec 64))

(declare-fun lt!164417 () SeekEntryResult!3384)

(assert (=> b!349876 (= lt!164418 (select (arr!8903 _keys!1895) (index!15717 lt!164417)))))

(declare-fun c!53316 () Bool)

(assert (=> b!349876 (= c!53316 (= lt!164418 k0!1348))))

(declare-fun b!349877 () Bool)

(declare-fun e!214313 () SeekEntryResult!3384)

(assert (=> b!349877 (= e!214313 (MissingZero!3384 (index!15717 lt!164417)))))

(declare-fun d!71425 () Bool)

(declare-fun lt!164419 () SeekEntryResult!3384)

(assert (=> d!71425 (and (or ((_ is Undefined!3384) lt!164419) (not ((_ is Found!3384) lt!164419)) (and (bvsge (index!15716 lt!164419) #b00000000000000000000000000000000) (bvslt (index!15716 lt!164419) (size!9255 _keys!1895)))) (or ((_ is Undefined!3384) lt!164419) ((_ is Found!3384) lt!164419) (not ((_ is MissingZero!3384) lt!164419)) (and (bvsge (index!15715 lt!164419) #b00000000000000000000000000000000) (bvslt (index!15715 lt!164419) (size!9255 _keys!1895)))) (or ((_ is Undefined!3384) lt!164419) ((_ is Found!3384) lt!164419) ((_ is MissingZero!3384) lt!164419) (not ((_ is MissingVacant!3384) lt!164419)) (and (bvsge (index!15718 lt!164419) #b00000000000000000000000000000000) (bvslt (index!15718 lt!164419) (size!9255 _keys!1895)))) (or ((_ is Undefined!3384) lt!164419) (ite ((_ is Found!3384) lt!164419) (= (select (arr!8903 _keys!1895) (index!15716 lt!164419)) k0!1348) (ite ((_ is MissingZero!3384) lt!164419) (= (select (arr!8903 _keys!1895) (index!15715 lt!164419)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3384) lt!164419) (= (select (arr!8903 _keys!1895) (index!15718 lt!164419)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71425 (= lt!164419 e!214312)))

(declare-fun c!53317 () Bool)

(assert (=> d!71425 (= c!53317 (and ((_ is Intermediate!3384) lt!164417) (undefined!4196 lt!164417)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18792 (_ BitVec 32)) SeekEntryResult!3384)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71425 (= lt!164417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71425 (validMask!0 mask!2385)))

(assert (=> d!71425 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164419)))

(declare-fun b!349874 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18792 (_ BitVec 32)) SeekEntryResult!3384)

(assert (=> b!349874 (= e!214313 (seekKeyOrZeroReturnVacant!0 (x!34777 lt!164417) (index!15717 lt!164417) (index!15717 lt!164417) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349878 () Bool)

(declare-fun c!53318 () Bool)

(assert (=> b!349878 (= c!53318 (= lt!164418 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!349878 (= e!214314 e!214313)))

(declare-fun b!349879 () Bool)

(assert (=> b!349879 (= e!214314 (Found!3384 (index!15717 lt!164417)))))

(assert (= (and d!71425 c!53317) b!349875))

(assert (= (and d!71425 (not c!53317)) b!349876))

(assert (= (and b!349876 c!53316) b!349879))

(assert (= (and b!349876 (not c!53316)) b!349878))

(assert (= (and b!349878 c!53318) b!349877))

(assert (= (and b!349878 (not c!53318)) b!349874))

(declare-fun m!350525 () Bool)

(assert (=> b!349876 m!350525))

(declare-fun m!350527 () Bool)

(assert (=> d!71425 m!350527))

(declare-fun m!350529 () Bool)

(assert (=> d!71425 m!350529))

(declare-fun m!350531 () Bool)

(assert (=> d!71425 m!350531))

(declare-fun m!350533 () Bool)

(assert (=> d!71425 m!350533))

(assert (=> d!71425 m!350531))

(assert (=> d!71425 m!350375))

(declare-fun m!350535 () Bool)

(assert (=> d!71425 m!350535))

(declare-fun m!350537 () Bool)

(assert (=> b!349874 m!350537))

(assert (=> b!349659 d!71425))

(declare-fun condMapEmpty!12888 () Bool)

(declare-fun mapDefault!12888 () ValueCell!3461)

(assert (=> mapNonEmpty!12879 (= condMapEmpty!12888 (= mapRest!12879 ((as const (Array (_ BitVec 32) ValueCell!3461)) mapDefault!12888)))))

(declare-fun e!214319 () Bool)

(declare-fun mapRes!12888 () Bool)

(assert (=> mapNonEmpty!12879 (= tp!26543 (and e!214319 mapRes!12888))))

(declare-fun mapNonEmpty!12888 () Bool)

(declare-fun tp!26559 () Bool)

(declare-fun e!214320 () Bool)

(assert (=> mapNonEmpty!12888 (= mapRes!12888 (and tp!26559 e!214320))))

(declare-fun mapRest!12888 () (Array (_ BitVec 32) ValueCell!3461))

(declare-fun mapValue!12888 () ValueCell!3461)

(declare-fun mapKey!12888 () (_ BitVec 32))

(assert (=> mapNonEmpty!12888 (= mapRest!12879 (store mapRest!12888 mapKey!12888 mapValue!12888))))

(declare-fun b!349887 () Bool)

(assert (=> b!349887 (= e!214319 tp_is_empty!7609)))

(declare-fun b!349886 () Bool)

(assert (=> b!349886 (= e!214320 tp_is_empty!7609)))

(declare-fun mapIsEmpty!12888 () Bool)

(assert (=> mapIsEmpty!12888 mapRes!12888))

(assert (= (and mapNonEmpty!12879 condMapEmpty!12888) mapIsEmpty!12888))

(assert (= (and mapNonEmpty!12879 (not condMapEmpty!12888)) mapNonEmpty!12888))

(assert (= (and mapNonEmpty!12888 ((_ is ValueCellFull!3461) mapValue!12888)) b!349886))

(assert (= (and mapNonEmpty!12879 ((_ is ValueCellFull!3461) mapDefault!12888)) b!349887))

(declare-fun m!350539 () Bool)

(assert (=> mapNonEmpty!12888 m!350539))

(declare-fun b_lambda!8519 () Bool)

(assert (= b_lambda!8517 (or (and start!34902 b_free!7657) b_lambda!8519)))

(check-sat (not b!349754) (not d!71409) (not b!349767) (not b!349765) (not b!349766) (not b!349874) (not d!71421) (not b!349846) (not bm!26922) (not bm!26906) (not b!349787) (not b!349780) (not bm!26927) (not bm!26923) tp_is_empty!7609 (not d!71423) (not b!349839) (not b!349848) (not b!349849) b_and!14903 (not mapNonEmpty!12888) (not b!349856) (not d!71425) (not b_lambda!8519) (not b!349794) (not b!349858) (not bm!26903) (not b!349796) (not b_next!7657) (not b!349781) (not bm!26924) (not b!349840) (not b!349842))
(check-sat b_and!14903 (not b_next!7657))
