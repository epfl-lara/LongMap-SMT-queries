; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34254 () Bool)

(assert start!34254)

(declare-fun b_free!7267 () Bool)

(declare-fun b_next!7267 () Bool)

(assert (=> start!34254 (= b_free!7267 (not b_next!7267))))

(declare-fun tp!25337 () Bool)

(declare-fun b_and!14443 () Bool)

(assert (=> start!34254 (= tp!25337 b_and!14443)))

(declare-fun b!341633 () Bool)

(declare-datatypes ((Unit!10591 0))(
  ( (Unit!10592) )
))
(declare-fun e!209497 () Unit!10591)

(declare-fun Unit!10593 () Unit!10591)

(assert (=> b!341633 (= e!209497 Unit!10593)))

(declare-fun mapNonEmpty!12258 () Bool)

(declare-fun mapRes!12258 () Bool)

(declare-fun tp!25338 () Bool)

(declare-fun e!209503 () Bool)

(assert (=> mapNonEmpty!12258 (= mapRes!12258 (and tp!25338 e!209503))))

(declare-datatypes ((V!10603 0))(
  ( (V!10604 (val!3654 Int)) )
))
(declare-datatypes ((ValueCell!3266 0))(
  ( (ValueCellFull!3266 (v!5821 V!10603)) (EmptyCell!3266) )
))
(declare-fun mapRest!12258 () (Array (_ BitVec 32) ValueCell!3266))

(declare-datatypes ((array!18015 0))(
  ( (array!18016 (arr!8527 (Array (_ BitVec 32) ValueCell!3266)) (size!8880 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18015)

(declare-fun mapValue!12258 () ValueCell!3266)

(declare-fun mapKey!12258 () (_ BitVec 32))

(assert (=> mapNonEmpty!12258 (= (arr!8527 _values!1525) (store mapRest!12258 mapKey!12258 mapValue!12258))))

(declare-fun b!341634 () Bool)

(declare-fun res!188885 () Bool)

(declare-fun e!209502 () Bool)

(assert (=> b!341634 (=> (not res!188885) (not e!209502))))

(declare-datatypes ((array!18017 0))(
  ( (array!18018 (arr!8528 (Array (_ BitVec 32) (_ BitVec 64))) (size!8881 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18017)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18017 (_ BitVec 32)) Bool)

(assert (=> b!341634 (= res!188885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341635 () Bool)

(declare-fun tp_is_empty!7219 () Bool)

(assert (=> b!341635 (= e!209503 tp_is_empty!7219)))

(declare-fun res!188883 () Bool)

(assert (=> start!34254 (=> (not res!188883) (not e!209502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34254 (= res!188883 (validMask!0 mask!2385))))

(assert (=> start!34254 e!209502))

(assert (=> start!34254 true))

(assert (=> start!34254 tp_is_empty!7219))

(assert (=> start!34254 tp!25337))

(declare-fun e!209498 () Bool)

(declare-fun array_inv!6344 (array!18015) Bool)

(assert (=> start!34254 (and (array_inv!6344 _values!1525) e!209498)))

(declare-fun array_inv!6345 (array!18017) Bool)

(assert (=> start!34254 (array_inv!6345 _keys!1895)))

(declare-fun b!341636 () Bool)

(declare-fun e!209500 () Bool)

(assert (=> b!341636 (= e!209500 (and (bvslt #b00000000000000000000000000000000 (size!8881 _keys!1895)) (bvsge (size!8881 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun lt!161713 () Unit!10591)

(assert (=> b!341636 (= lt!161713 e!209497)))

(declare-fun c!52670 () Bool)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341636 (= c!52670 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341637 () Bool)

(declare-fun res!188880 () Bool)

(assert (=> b!341637 (=> (not res!188880) (not e!209502))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341637 (= res!188880 (and (= (size!8880 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8881 _keys!1895) (size!8880 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341638 () Bool)

(declare-fun Unit!10594 () Unit!10591)

(assert (=> b!341638 (= e!209497 Unit!10594)))

(declare-fun zeroValue!1467 () V!10603)

(declare-fun minValue!1467 () V!10603)

(declare-fun lt!161715 () Unit!10591)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lemmaArrayContainsKeyThenInListMap!292 (array!18017 array!18015 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 64) (_ BitVec 32) Int) Unit!10591)

(declare-fun arrayScanForKey!0 (array!18017 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341638 (= lt!161715 (lemmaArrayContainsKeyThenInListMap!292 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341638 false))

(declare-fun b!341639 () Bool)

(declare-fun e!209501 () Bool)

(assert (=> b!341639 (= e!209501 tp_is_empty!7219)))

(declare-fun b!341640 () Bool)

(declare-fun res!188884 () Bool)

(assert (=> b!341640 (=> (not res!188884) (not e!209502))))

(declare-datatypes ((tuple2!5244 0))(
  ( (tuple2!5245 (_1!2633 (_ BitVec 64)) (_2!2633 V!10603)) )
))
(declare-datatypes ((List!4867 0))(
  ( (Nil!4864) (Cons!4863 (h!5719 tuple2!5244) (t!9968 List!4867)) )
))
(declare-datatypes ((ListLongMap!4147 0))(
  ( (ListLongMap!4148 (toList!2089 List!4867)) )
))
(declare-fun contains!2155 (ListLongMap!4147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1595 (array!18017 array!18015 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 32) Int) ListLongMap!4147)

(assert (=> b!341640 (= res!188884 (not (contains!2155 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341641 () Bool)

(declare-fun res!188881 () Bool)

(assert (=> b!341641 (=> (not res!188881) (not e!209502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341641 (= res!188881 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12258 () Bool)

(assert (=> mapIsEmpty!12258 mapRes!12258))

(declare-fun b!341642 () Bool)

(declare-fun res!188879 () Bool)

(assert (=> b!341642 (=> (not res!188879) (not e!209502))))

(declare-datatypes ((List!4868 0))(
  ( (Nil!4865) (Cons!4864 (h!5720 (_ BitVec 64)) (t!9969 List!4868)) )
))
(declare-fun arrayNoDuplicates!0 (array!18017 (_ BitVec 32) List!4868) Bool)

(assert (=> b!341642 (= res!188879 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4865))))

(declare-fun b!341643 () Bool)

(assert (=> b!341643 (= e!209498 (and e!209501 mapRes!12258))))

(declare-fun condMapEmpty!12258 () Bool)

(declare-fun mapDefault!12258 () ValueCell!3266)

(assert (=> b!341643 (= condMapEmpty!12258 (= (arr!8527 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3266)) mapDefault!12258)))))

(declare-fun b!341644 () Bool)

(assert (=> b!341644 (= e!209502 e!209500)))

(declare-fun res!188882 () Bool)

(assert (=> b!341644 (=> (not res!188882) (not e!209500))))

(declare-datatypes ((SeekEntryResult!3285 0))(
  ( (MissingZero!3285 (index!15319 (_ BitVec 32))) (Found!3285 (index!15320 (_ BitVec 32))) (Intermediate!3285 (undefined!4097 Bool) (index!15321 (_ BitVec 32)) (x!34036 (_ BitVec 32))) (Undefined!3285) (MissingVacant!3285 (index!15322 (_ BitVec 32))) )
))
(declare-fun lt!161714 () SeekEntryResult!3285)

(get-info :version)

(assert (=> b!341644 (= res!188882 (and (not ((_ is Found!3285) lt!161714)) (not ((_ is MissingZero!3285) lt!161714)) ((_ is MissingVacant!3285) lt!161714)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18017 (_ BitVec 32)) SeekEntryResult!3285)

(assert (=> b!341644 (= lt!161714 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34254 res!188883) b!341637))

(assert (= (and b!341637 res!188880) b!341634))

(assert (= (and b!341634 res!188885) b!341642))

(assert (= (and b!341642 res!188879) b!341641))

(assert (= (and b!341641 res!188881) b!341640))

(assert (= (and b!341640 res!188884) b!341644))

(assert (= (and b!341644 res!188882) b!341636))

(assert (= (and b!341636 c!52670) b!341638))

(assert (= (and b!341636 (not c!52670)) b!341633))

(assert (= (and b!341643 condMapEmpty!12258) mapIsEmpty!12258))

(assert (= (and b!341643 (not condMapEmpty!12258)) mapNonEmpty!12258))

(assert (= (and mapNonEmpty!12258 ((_ is ValueCellFull!3266) mapValue!12258)) b!341635))

(assert (= (and b!341643 ((_ is ValueCellFull!3266) mapDefault!12258)) b!341639))

(assert (= start!34254 b!341643))

(declare-fun m!343479 () Bool)

(assert (=> b!341642 m!343479))

(declare-fun m!343481 () Bool)

(assert (=> b!341636 m!343481))

(declare-fun m!343483 () Bool)

(assert (=> mapNonEmpty!12258 m!343483))

(declare-fun m!343485 () Bool)

(assert (=> b!341634 m!343485))

(declare-fun m!343487 () Bool)

(assert (=> b!341638 m!343487))

(assert (=> b!341638 m!343487))

(declare-fun m!343489 () Bool)

(assert (=> b!341638 m!343489))

(declare-fun m!343491 () Bool)

(assert (=> b!341644 m!343491))

(declare-fun m!343493 () Bool)

(assert (=> b!341640 m!343493))

(assert (=> b!341640 m!343493))

(declare-fun m!343495 () Bool)

(assert (=> b!341640 m!343495))

(declare-fun m!343497 () Bool)

(assert (=> start!34254 m!343497))

(declare-fun m!343499 () Bool)

(assert (=> start!34254 m!343499))

(declare-fun m!343501 () Bool)

(assert (=> start!34254 m!343501))

(declare-fun m!343503 () Bool)

(assert (=> b!341641 m!343503))

(check-sat (not b!341636) tp_is_empty!7219 (not b!341641) (not b!341642) (not b_next!7267) (not b!341634) (not b!341644) (not b!341638) b_and!14443 (not start!34254) (not b!341640) (not mapNonEmpty!12258))
(check-sat b_and!14443 (not b_next!7267))
(get-model)

(declare-fun d!70775 () Bool)

(assert (=> d!70775 (contains!2155 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!161736 () Unit!10591)

(declare-fun choose!1310 (array!18017 array!18015 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 64) (_ BitVec 32) Int) Unit!10591)

(assert (=> d!70775 (= lt!161736 (choose!1310 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70775 (validMask!0 mask!2385)))

(assert (=> d!70775 (= (lemmaArrayContainsKeyThenInListMap!292 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!161736)))

(declare-fun bs!11704 () Bool)

(assert (= bs!11704 d!70775))

(assert (=> bs!11704 m!343493))

(assert (=> bs!11704 m!343493))

(assert (=> bs!11704 m!343495))

(assert (=> bs!11704 m!343487))

(declare-fun m!343557 () Bool)

(assert (=> bs!11704 m!343557))

(assert (=> bs!11704 m!343497))

(assert (=> b!341638 d!70775))

(declare-fun d!70777 () Bool)

(declare-fun lt!161739 () (_ BitVec 32))

(assert (=> d!70777 (and (or (bvslt lt!161739 #b00000000000000000000000000000000) (bvsge lt!161739 (size!8881 _keys!1895)) (and (bvsge lt!161739 #b00000000000000000000000000000000) (bvslt lt!161739 (size!8881 _keys!1895)))) (bvsge lt!161739 #b00000000000000000000000000000000) (bvslt lt!161739 (size!8881 _keys!1895)) (= (select (arr!8528 _keys!1895) lt!161739) k0!1348))))

(declare-fun e!209548 () (_ BitVec 32))

(assert (=> d!70777 (= lt!161739 e!209548)))

(declare-fun c!52679 () Bool)

(assert (=> d!70777 (= c!52679 (= (select (arr!8528 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8881 _keys!1895)) (bvslt (size!8881 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70777 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!161739)))

(declare-fun b!341721 () Bool)

(assert (=> b!341721 (= e!209548 #b00000000000000000000000000000000)))

(declare-fun b!341722 () Bool)

(assert (=> b!341722 (= e!209548 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70777 c!52679) b!341721))

(assert (= (and d!70777 (not c!52679)) b!341722))

(declare-fun m!343559 () Bool)

(assert (=> d!70777 m!343559))

(declare-fun m!343561 () Bool)

(assert (=> d!70777 m!343561))

(declare-fun m!343563 () Bool)

(assert (=> b!341722 m!343563))

(assert (=> b!341638 d!70777))

(declare-fun b!341733 () Bool)

(declare-fun e!209558 () Bool)

(declare-fun e!209557 () Bool)

(assert (=> b!341733 (= e!209558 e!209557)))

(declare-fun c!52682 () Bool)

(assert (=> b!341733 (= c!52682 (validKeyInArray!0 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341734 () Bool)

(declare-fun e!209559 () Bool)

(declare-fun contains!2157 (List!4868 (_ BitVec 64)) Bool)

(assert (=> b!341734 (= e!209559 (contains!2157 Nil!4865 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341735 () Bool)

(declare-fun call!26570 () Bool)

(assert (=> b!341735 (= e!209557 call!26570)))

(declare-fun b!341736 () Bool)

(assert (=> b!341736 (= e!209557 call!26570)))

(declare-fun b!341737 () Bool)

(declare-fun e!209560 () Bool)

(assert (=> b!341737 (= e!209560 e!209558)))

(declare-fun res!188936 () Bool)

(assert (=> b!341737 (=> (not res!188936) (not e!209558))))

(assert (=> b!341737 (= res!188936 (not e!209559))))

(declare-fun res!188935 () Bool)

(assert (=> b!341737 (=> (not res!188935) (not e!209559))))

(assert (=> b!341737 (= res!188935 (validKeyInArray!0 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70779 () Bool)

(declare-fun res!188934 () Bool)

(assert (=> d!70779 (=> res!188934 e!209560)))

(assert (=> d!70779 (= res!188934 (bvsge #b00000000000000000000000000000000 (size!8881 _keys!1895)))))

(assert (=> d!70779 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4865) e!209560)))

(declare-fun bm!26567 () Bool)

(assert (=> bm!26567 (= call!26570 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52682 (Cons!4864 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000) Nil!4865) Nil!4865)))))

(assert (= (and d!70779 (not res!188934)) b!341737))

(assert (= (and b!341737 res!188935) b!341734))

(assert (= (and b!341737 res!188936) b!341733))

(assert (= (and b!341733 c!52682) b!341735))

(assert (= (and b!341733 (not c!52682)) b!341736))

(assert (= (or b!341735 b!341736) bm!26567))

(assert (=> b!341733 m!343561))

(assert (=> b!341733 m!343561))

(declare-fun m!343565 () Bool)

(assert (=> b!341733 m!343565))

(assert (=> b!341734 m!343561))

(assert (=> b!341734 m!343561))

(declare-fun m!343567 () Bool)

(assert (=> b!341734 m!343567))

(assert (=> b!341737 m!343561))

(assert (=> b!341737 m!343561))

(assert (=> b!341737 m!343565))

(assert (=> bm!26567 m!343561))

(declare-fun m!343569 () Bool)

(assert (=> bm!26567 m!343569))

(assert (=> b!341642 d!70779))

(declare-fun d!70781 () Bool)

(declare-fun e!209566 () Bool)

(assert (=> d!70781 e!209566))

(declare-fun res!188939 () Bool)

(assert (=> d!70781 (=> res!188939 e!209566)))

(declare-fun lt!161748 () Bool)

(assert (=> d!70781 (= res!188939 (not lt!161748))))

(declare-fun lt!161750 () Bool)

(assert (=> d!70781 (= lt!161748 lt!161750)))

(declare-fun lt!161751 () Unit!10591)

(declare-fun e!209565 () Unit!10591)

(assert (=> d!70781 (= lt!161751 e!209565)))

(declare-fun c!52685 () Bool)

(assert (=> d!70781 (= c!52685 lt!161750)))

(declare-fun containsKey!325 (List!4867 (_ BitVec 64)) Bool)

(assert (=> d!70781 (= lt!161750 (containsKey!325 (toList!2089 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70781 (= (contains!2155 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161748)))

(declare-fun b!341744 () Bool)

(declare-fun lt!161749 () Unit!10591)

(assert (=> b!341744 (= e!209565 lt!161749)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!274 (List!4867 (_ BitVec 64)) Unit!10591)

(assert (=> b!341744 (= lt!161749 (lemmaContainsKeyImpliesGetValueByKeyDefined!274 (toList!2089 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!339 0))(
  ( (Some!338 (v!5824 V!10603)) (None!337) )
))
(declare-fun isDefined!275 (Option!339) Bool)

(declare-fun getValueByKey!333 (List!4867 (_ BitVec 64)) Option!339)

(assert (=> b!341744 (isDefined!275 (getValueByKey!333 (toList!2089 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!341745 () Bool)

(declare-fun Unit!10601 () Unit!10591)

(assert (=> b!341745 (= e!209565 Unit!10601)))

(declare-fun b!341746 () Bool)

(assert (=> b!341746 (= e!209566 (isDefined!275 (getValueByKey!333 (toList!2089 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70781 c!52685) b!341744))

(assert (= (and d!70781 (not c!52685)) b!341745))

(assert (= (and d!70781 (not res!188939)) b!341746))

(declare-fun m!343571 () Bool)

(assert (=> d!70781 m!343571))

(declare-fun m!343573 () Bool)

(assert (=> b!341744 m!343573))

(declare-fun m!343575 () Bool)

(assert (=> b!341744 m!343575))

(assert (=> b!341744 m!343575))

(declare-fun m!343577 () Bool)

(assert (=> b!341744 m!343577))

(assert (=> b!341746 m!343575))

(assert (=> b!341746 m!343575))

(assert (=> b!341746 m!343577))

(assert (=> b!341640 d!70781))

(declare-fun b!341789 () Bool)

(declare-fun e!209600 () Bool)

(assert (=> b!341789 (= e!209600 (validKeyInArray!0 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341790 () Bool)

(declare-fun e!209603 () Bool)

(declare-fun call!26590 () Bool)

(assert (=> b!341790 (= e!209603 (not call!26590))))

(declare-fun bm!26582 () Bool)

(declare-fun call!26585 () ListLongMap!4147)

(declare-fun call!26589 () ListLongMap!4147)

(assert (=> bm!26582 (= call!26585 call!26589)))

(declare-fun b!341791 () Bool)

(declare-fun c!52699 () Bool)

(assert (=> b!341791 (= c!52699 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!209595 () ListLongMap!4147)

(declare-fun e!209593 () ListLongMap!4147)

(assert (=> b!341791 (= e!209595 e!209593)))

(declare-fun b!341792 () Bool)

(declare-fun e!209602 () Bool)

(declare-fun call!26586 () Bool)

(assert (=> b!341792 (= e!209602 (not call!26586))))

(declare-fun b!341793 () Bool)

(assert (=> b!341793 (= e!209593 call!26585)))

(declare-fun b!341794 () Bool)

(declare-fun e!209605 () Bool)

(assert (=> b!341794 (= e!209605 e!209602)))

(declare-fun c!52703 () Bool)

(assert (=> b!341794 (= c!52703 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!341795 () Bool)

(declare-fun e!209601 () Unit!10591)

(declare-fun lt!161809 () Unit!10591)

(assert (=> b!341795 (= e!209601 lt!161809)))

(declare-fun lt!161810 () ListLongMap!4147)

(declare-fun getCurrentListMapNoExtraKeys!593 (array!18017 array!18015 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 32) Int) ListLongMap!4147)

(assert (=> b!341795 (= lt!161810 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161811 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161808 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161808 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161816 () Unit!10591)

(declare-fun addStillContains!253 (ListLongMap!4147 (_ BitVec 64) V!10603 (_ BitVec 64)) Unit!10591)

(assert (=> b!341795 (= lt!161816 (addStillContains!253 lt!161810 lt!161811 zeroValue!1467 lt!161808))))

(declare-fun +!730 (ListLongMap!4147 tuple2!5244) ListLongMap!4147)

(assert (=> b!341795 (contains!2155 (+!730 lt!161810 (tuple2!5245 lt!161811 zeroValue!1467)) lt!161808)))

(declare-fun lt!161813 () Unit!10591)

(assert (=> b!341795 (= lt!161813 lt!161816)))

(declare-fun lt!161801 () ListLongMap!4147)

(assert (=> b!341795 (= lt!161801 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161807 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161812 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161812 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161797 () Unit!10591)

(declare-fun addApplyDifferent!253 (ListLongMap!4147 (_ BitVec 64) V!10603 (_ BitVec 64)) Unit!10591)

(assert (=> b!341795 (= lt!161797 (addApplyDifferent!253 lt!161801 lt!161807 minValue!1467 lt!161812))))

(declare-fun apply!277 (ListLongMap!4147 (_ BitVec 64)) V!10603)

(assert (=> b!341795 (= (apply!277 (+!730 lt!161801 (tuple2!5245 lt!161807 minValue!1467)) lt!161812) (apply!277 lt!161801 lt!161812))))

(declare-fun lt!161815 () Unit!10591)

(assert (=> b!341795 (= lt!161815 lt!161797)))

(declare-fun lt!161802 () ListLongMap!4147)

(assert (=> b!341795 (= lt!161802 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161799 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161805 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161805 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161804 () Unit!10591)

(assert (=> b!341795 (= lt!161804 (addApplyDifferent!253 lt!161802 lt!161799 zeroValue!1467 lt!161805))))

(assert (=> b!341795 (= (apply!277 (+!730 lt!161802 (tuple2!5245 lt!161799 zeroValue!1467)) lt!161805) (apply!277 lt!161802 lt!161805))))

(declare-fun lt!161817 () Unit!10591)

(assert (=> b!341795 (= lt!161817 lt!161804)))

(declare-fun lt!161800 () ListLongMap!4147)

(assert (=> b!341795 (= lt!161800 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161796 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161796 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161814 () (_ BitVec 64))

(assert (=> b!341795 (= lt!161814 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!341795 (= lt!161809 (addApplyDifferent!253 lt!161800 lt!161796 minValue!1467 lt!161814))))

(assert (=> b!341795 (= (apply!277 (+!730 lt!161800 (tuple2!5245 lt!161796 minValue!1467)) lt!161814) (apply!277 lt!161800 lt!161814))))

(declare-fun lt!161806 () ListLongMap!4147)

(declare-fun e!209598 () Bool)

(declare-fun b!341796 () Bool)

(declare-fun get!4623 (ValueCell!3266 V!10603) V!10603)

(declare-fun dynLambda!611 (Int (_ BitVec 64)) V!10603)

(assert (=> b!341796 (= e!209598 (= (apply!277 lt!161806 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)) (get!4623 (select (arr!8527 _values!1525) #b00000000000000000000000000000000) (dynLambda!611 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8880 _values!1525)))))

(assert (=> b!341796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8881 _keys!1895)))))

(declare-fun b!341797 () Bool)

(declare-fun Unit!10602 () Unit!10591)

(assert (=> b!341797 (= e!209601 Unit!10602)))

(declare-fun bm!26583 () Bool)

(assert (=> bm!26583 (= call!26586 (contains!2155 lt!161806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341798 () Bool)

(declare-fun e!209599 () ListLongMap!4147)

(assert (=> b!341798 (= e!209599 (+!730 call!26589 (tuple2!5245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!341799 () Bool)

(declare-fun e!209597 () Bool)

(assert (=> b!341799 (= e!209597 e!209598)))

(declare-fun res!188959 () Bool)

(assert (=> b!341799 (=> (not res!188959) (not e!209598))))

(assert (=> b!341799 (= res!188959 (contains!2155 lt!161806 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!341799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8881 _keys!1895)))))

(declare-fun b!341800 () Bool)

(assert (=> b!341800 (= e!209595 call!26585)))

(declare-fun bm!26584 () Bool)

(assert (=> bm!26584 (= call!26590 (contains!2155 lt!161806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341801 () Bool)

(declare-fun call!26591 () ListLongMap!4147)

(assert (=> b!341801 (= e!209593 call!26591)))

(declare-fun d!70783 () Bool)

(assert (=> d!70783 e!209605))

(declare-fun res!188966 () Bool)

(assert (=> d!70783 (=> (not res!188966) (not e!209605))))

(assert (=> d!70783 (= res!188966 (or (bvsge #b00000000000000000000000000000000 (size!8881 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8881 _keys!1895)))))))

(declare-fun lt!161798 () ListLongMap!4147)

(assert (=> d!70783 (= lt!161806 lt!161798)))

(declare-fun lt!161803 () Unit!10591)

(assert (=> d!70783 (= lt!161803 e!209601)))

(declare-fun c!52700 () Bool)

(declare-fun e!209594 () Bool)

(assert (=> d!70783 (= c!52700 e!209594)))

(declare-fun res!188962 () Bool)

(assert (=> d!70783 (=> (not res!188962) (not e!209594))))

(assert (=> d!70783 (= res!188962 (bvslt #b00000000000000000000000000000000 (size!8881 _keys!1895)))))

(assert (=> d!70783 (= lt!161798 e!209599)))

(declare-fun c!52702 () Bool)

(assert (=> d!70783 (= c!52702 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70783 (validMask!0 mask!2385)))

(assert (=> d!70783 (= (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161806)))

(declare-fun b!341802 () Bool)

(declare-fun e!209596 () Bool)

(assert (=> b!341802 (= e!209596 (= (apply!277 lt!161806 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26585 () Bool)

(declare-fun call!26588 () ListLongMap!4147)

(assert (=> bm!26585 (= call!26588 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!341803 () Bool)

(assert (=> b!341803 (= e!209594 (validKeyInArray!0 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341804 () Bool)

(assert (=> b!341804 (= e!209599 e!209595)))

(declare-fun c!52698 () Bool)

(assert (=> b!341804 (= c!52698 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26586 () Bool)

(declare-fun call!26587 () ListLongMap!4147)

(assert (=> bm!26586 (= call!26591 call!26587)))

(declare-fun bm!26587 () Bool)

(assert (=> bm!26587 (= call!26587 call!26588)))

(declare-fun bm!26588 () Bool)

(assert (=> bm!26588 (= call!26589 (+!730 (ite c!52702 call!26588 (ite c!52698 call!26587 call!26591)) (ite (or c!52702 c!52698) (tuple2!5245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!341805 () Bool)

(declare-fun e!209604 () Bool)

(assert (=> b!341805 (= e!209604 (= (apply!277 lt!161806 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!341806 () Bool)

(assert (=> b!341806 (= e!209602 e!209604)))

(declare-fun res!188960 () Bool)

(assert (=> b!341806 (= res!188960 call!26586)))

(assert (=> b!341806 (=> (not res!188960) (not e!209604))))

(declare-fun b!341807 () Bool)

(declare-fun res!188963 () Bool)

(assert (=> b!341807 (=> (not res!188963) (not e!209605))))

(assert (=> b!341807 (= res!188963 e!209603)))

(declare-fun c!52701 () Bool)

(assert (=> b!341807 (= c!52701 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!341808 () Bool)

(assert (=> b!341808 (= e!209603 e!209596)))

(declare-fun res!188964 () Bool)

(assert (=> b!341808 (= res!188964 call!26590)))

(assert (=> b!341808 (=> (not res!188964) (not e!209596))))

(declare-fun b!341809 () Bool)

(declare-fun res!188958 () Bool)

(assert (=> b!341809 (=> (not res!188958) (not e!209605))))

(assert (=> b!341809 (= res!188958 e!209597)))

(declare-fun res!188961 () Bool)

(assert (=> b!341809 (=> res!188961 e!209597)))

(assert (=> b!341809 (= res!188961 (not e!209600))))

(declare-fun res!188965 () Bool)

(assert (=> b!341809 (=> (not res!188965) (not e!209600))))

(assert (=> b!341809 (= res!188965 (bvslt #b00000000000000000000000000000000 (size!8881 _keys!1895)))))

(assert (= (and d!70783 c!52702) b!341798))

(assert (= (and d!70783 (not c!52702)) b!341804))

(assert (= (and b!341804 c!52698) b!341800))

(assert (= (and b!341804 (not c!52698)) b!341791))

(assert (= (and b!341791 c!52699) b!341793))

(assert (= (and b!341791 (not c!52699)) b!341801))

(assert (= (or b!341793 b!341801) bm!26586))

(assert (= (or b!341800 bm!26586) bm!26587))

(assert (= (or b!341800 b!341793) bm!26582))

(assert (= (or b!341798 bm!26587) bm!26585))

(assert (= (or b!341798 bm!26582) bm!26588))

(assert (= (and d!70783 res!188962) b!341803))

(assert (= (and d!70783 c!52700) b!341795))

(assert (= (and d!70783 (not c!52700)) b!341797))

(assert (= (and d!70783 res!188966) b!341809))

(assert (= (and b!341809 res!188965) b!341789))

(assert (= (and b!341809 (not res!188961)) b!341799))

(assert (= (and b!341799 res!188959) b!341796))

(assert (= (and b!341809 res!188958) b!341807))

(assert (= (and b!341807 c!52701) b!341808))

(assert (= (and b!341807 (not c!52701)) b!341790))

(assert (= (and b!341808 res!188964) b!341802))

(assert (= (or b!341808 b!341790) bm!26584))

(assert (= (and b!341807 res!188963) b!341794))

(assert (= (and b!341794 c!52703) b!341806))

(assert (= (and b!341794 (not c!52703)) b!341792))

(assert (= (and b!341806 res!188960) b!341805))

(assert (= (or b!341806 b!341792) bm!26583))

(declare-fun b_lambda!8429 () Bool)

(assert (=> (not b_lambda!8429) (not b!341796)))

(declare-fun t!9973 () Bool)

(declare-fun tb!3061 () Bool)

(assert (=> (and start!34254 (= defaultEntry!1528 defaultEntry!1528) t!9973) tb!3061))

(declare-fun result!5529 () Bool)

(assert (=> tb!3061 (= result!5529 tp_is_empty!7219)))

(assert (=> b!341796 t!9973))

(declare-fun b_and!14449 () Bool)

(assert (= b_and!14443 (and (=> t!9973 result!5529) b_and!14449)))

(declare-fun m!343579 () Bool)

(assert (=> bm!26585 m!343579))

(assert (=> b!341796 m!343561))

(declare-fun m!343581 () Bool)

(assert (=> b!341796 m!343581))

(declare-fun m!343583 () Bool)

(assert (=> b!341796 m!343583))

(declare-fun m!343585 () Bool)

(assert (=> b!341796 m!343585))

(assert (=> b!341796 m!343583))

(assert (=> b!341796 m!343561))

(declare-fun m!343587 () Bool)

(assert (=> b!341796 m!343587))

(assert (=> b!341796 m!343581))

(assert (=> b!341799 m!343561))

(assert (=> b!341799 m!343561))

(declare-fun m!343589 () Bool)

(assert (=> b!341799 m!343589))

(assert (=> b!341789 m!343561))

(assert (=> b!341789 m!343561))

(assert (=> b!341789 m!343565))

(declare-fun m!343591 () Bool)

(assert (=> bm!26583 m!343591))

(assert (=> b!341803 m!343561))

(assert (=> b!341803 m!343561))

(assert (=> b!341803 m!343565))

(assert (=> d!70783 m!343497))

(declare-fun m!343593 () Bool)

(assert (=> bm!26588 m!343593))

(declare-fun m!343595 () Bool)

(assert (=> b!341805 m!343595))

(declare-fun m!343597 () Bool)

(assert (=> b!341798 m!343597))

(declare-fun m!343599 () Bool)

(assert (=> b!341795 m!343599))

(declare-fun m!343601 () Bool)

(assert (=> b!341795 m!343601))

(declare-fun m!343603 () Bool)

(assert (=> b!341795 m!343603))

(assert (=> b!341795 m!343561))

(assert (=> b!341795 m!343599))

(assert (=> b!341795 m!343579))

(declare-fun m!343605 () Bool)

(assert (=> b!341795 m!343605))

(declare-fun m!343607 () Bool)

(assert (=> b!341795 m!343607))

(declare-fun m!343609 () Bool)

(assert (=> b!341795 m!343609))

(assert (=> b!341795 m!343605))

(assert (=> b!341795 m!343603))

(declare-fun m!343611 () Bool)

(assert (=> b!341795 m!343611))

(declare-fun m!343613 () Bool)

(assert (=> b!341795 m!343613))

(declare-fun m!343615 () Bool)

(assert (=> b!341795 m!343615))

(declare-fun m!343617 () Bool)

(assert (=> b!341795 m!343617))

(declare-fun m!343619 () Bool)

(assert (=> b!341795 m!343619))

(declare-fun m!343621 () Bool)

(assert (=> b!341795 m!343621))

(declare-fun m!343623 () Bool)

(assert (=> b!341795 m!343623))

(declare-fun m!343625 () Bool)

(assert (=> b!341795 m!343625))

(assert (=> b!341795 m!343625))

(declare-fun m!343627 () Bool)

(assert (=> b!341795 m!343627))

(declare-fun m!343629 () Bool)

(assert (=> bm!26584 m!343629))

(declare-fun m!343631 () Bool)

(assert (=> b!341802 m!343631))

(assert (=> b!341640 d!70783))

(declare-fun b!341824 () Bool)

(declare-fun e!209612 () SeekEntryResult!3285)

(declare-fun e!209614 () SeekEntryResult!3285)

(assert (=> b!341824 (= e!209612 e!209614)))

(declare-fun lt!161825 () (_ BitVec 64))

(declare-fun lt!161826 () SeekEntryResult!3285)

(assert (=> b!341824 (= lt!161825 (select (arr!8528 _keys!1895) (index!15321 lt!161826)))))

(declare-fun c!52712 () Bool)

(assert (=> b!341824 (= c!52712 (= lt!161825 k0!1348))))

(declare-fun e!209613 () SeekEntryResult!3285)

(declare-fun b!341825 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18017 (_ BitVec 32)) SeekEntryResult!3285)

(assert (=> b!341825 (= e!209613 (seekKeyOrZeroReturnVacant!0 (x!34036 lt!161826) (index!15321 lt!161826) (index!15321 lt!161826) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341826 () Bool)

(declare-fun c!52710 () Bool)

(assert (=> b!341826 (= c!52710 (= lt!161825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!341826 (= e!209614 e!209613)))

(declare-fun b!341827 () Bool)

(assert (=> b!341827 (= e!209612 Undefined!3285)))

(declare-fun d!70785 () Bool)

(declare-fun lt!161824 () SeekEntryResult!3285)

(assert (=> d!70785 (and (or ((_ is Undefined!3285) lt!161824) (not ((_ is Found!3285) lt!161824)) (and (bvsge (index!15320 lt!161824) #b00000000000000000000000000000000) (bvslt (index!15320 lt!161824) (size!8881 _keys!1895)))) (or ((_ is Undefined!3285) lt!161824) ((_ is Found!3285) lt!161824) (not ((_ is MissingZero!3285) lt!161824)) (and (bvsge (index!15319 lt!161824) #b00000000000000000000000000000000) (bvslt (index!15319 lt!161824) (size!8881 _keys!1895)))) (or ((_ is Undefined!3285) lt!161824) ((_ is Found!3285) lt!161824) ((_ is MissingZero!3285) lt!161824) (not ((_ is MissingVacant!3285) lt!161824)) (and (bvsge (index!15322 lt!161824) #b00000000000000000000000000000000) (bvslt (index!15322 lt!161824) (size!8881 _keys!1895)))) (or ((_ is Undefined!3285) lt!161824) (ite ((_ is Found!3285) lt!161824) (= (select (arr!8528 _keys!1895) (index!15320 lt!161824)) k0!1348) (ite ((_ is MissingZero!3285) lt!161824) (= (select (arr!8528 _keys!1895) (index!15319 lt!161824)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3285) lt!161824) (= (select (arr!8528 _keys!1895) (index!15322 lt!161824)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70785 (= lt!161824 e!209612)))

(declare-fun c!52711 () Bool)

(assert (=> d!70785 (= c!52711 (and ((_ is Intermediate!3285) lt!161826) (undefined!4097 lt!161826)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18017 (_ BitVec 32)) SeekEntryResult!3285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70785 (= lt!161826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70785 (validMask!0 mask!2385)))

(assert (=> d!70785 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161824)))

(declare-fun b!341828 () Bool)

(assert (=> b!341828 (= e!209614 (Found!3285 (index!15321 lt!161826)))))

(declare-fun b!341829 () Bool)

(assert (=> b!341829 (= e!209613 (MissingZero!3285 (index!15321 lt!161826)))))

(assert (= (and d!70785 c!52711) b!341827))

(assert (= (and d!70785 (not c!52711)) b!341824))

(assert (= (and b!341824 c!52712) b!341828))

(assert (= (and b!341824 (not c!52712)) b!341826))

(assert (= (and b!341826 c!52710) b!341829))

(assert (= (and b!341826 (not c!52710)) b!341825))

(declare-fun m!343633 () Bool)

(assert (=> b!341824 m!343633))

(declare-fun m!343635 () Bool)

(assert (=> b!341825 m!343635))

(declare-fun m!343637 () Bool)

(assert (=> d!70785 m!343637))

(declare-fun m!343639 () Bool)

(assert (=> d!70785 m!343639))

(declare-fun m!343641 () Bool)

(assert (=> d!70785 m!343641))

(assert (=> d!70785 m!343497))

(declare-fun m!343643 () Bool)

(assert (=> d!70785 m!343643))

(assert (=> d!70785 m!343639))

(declare-fun m!343645 () Bool)

(assert (=> d!70785 m!343645))

(assert (=> b!341644 d!70785))

(declare-fun bm!26591 () Bool)

(declare-fun call!26594 () Bool)

(assert (=> bm!26591 (= call!26594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70787 () Bool)

(declare-fun res!188972 () Bool)

(declare-fun e!209623 () Bool)

(assert (=> d!70787 (=> res!188972 e!209623)))

(assert (=> d!70787 (= res!188972 (bvsge #b00000000000000000000000000000000 (size!8881 _keys!1895)))))

(assert (=> d!70787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!209623)))

(declare-fun b!341838 () Bool)

(declare-fun e!209621 () Bool)

(assert (=> b!341838 (= e!209621 call!26594)))

(declare-fun b!341839 () Bool)

(declare-fun e!209622 () Bool)

(assert (=> b!341839 (= e!209622 call!26594)))

(declare-fun b!341840 () Bool)

(assert (=> b!341840 (= e!209623 e!209622)))

(declare-fun c!52715 () Bool)

(assert (=> b!341840 (= c!52715 (validKeyInArray!0 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341841 () Bool)

(assert (=> b!341841 (= e!209622 e!209621)))

(declare-fun lt!161834 () (_ BitVec 64))

(assert (=> b!341841 (= lt!161834 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161833 () Unit!10591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18017 (_ BitVec 64) (_ BitVec 32)) Unit!10591)

(assert (=> b!341841 (= lt!161833 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161834 #b00000000000000000000000000000000))))

(assert (=> b!341841 (arrayContainsKey!0 _keys!1895 lt!161834 #b00000000000000000000000000000000)))

(declare-fun lt!161835 () Unit!10591)

(assert (=> b!341841 (= lt!161835 lt!161833)))

(declare-fun res!188971 () Bool)

(assert (=> b!341841 (= res!188971 (= (seekEntryOrOpen!0 (select (arr!8528 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3285 #b00000000000000000000000000000000)))))

(assert (=> b!341841 (=> (not res!188971) (not e!209621))))

(assert (= (and d!70787 (not res!188972)) b!341840))

(assert (= (and b!341840 c!52715) b!341841))

(assert (= (and b!341840 (not c!52715)) b!341839))

(assert (= (and b!341841 res!188971) b!341838))

(assert (= (or b!341838 b!341839) bm!26591))

(declare-fun m!343647 () Bool)

(assert (=> bm!26591 m!343647))

(assert (=> b!341840 m!343561))

(assert (=> b!341840 m!343561))

(assert (=> b!341840 m!343565))

(assert (=> b!341841 m!343561))

(declare-fun m!343649 () Bool)

(assert (=> b!341841 m!343649))

(declare-fun m!343651 () Bool)

(assert (=> b!341841 m!343651))

(assert (=> b!341841 m!343561))

(declare-fun m!343653 () Bool)

(assert (=> b!341841 m!343653))

(assert (=> b!341634 d!70787))

(declare-fun d!70789 () Bool)

(declare-fun res!188977 () Bool)

(declare-fun e!209628 () Bool)

(assert (=> d!70789 (=> res!188977 e!209628)))

(assert (=> d!70789 (= res!188977 (= (select (arr!8528 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70789 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!209628)))

(declare-fun b!341846 () Bool)

(declare-fun e!209629 () Bool)

(assert (=> b!341846 (= e!209628 e!209629)))

(declare-fun res!188978 () Bool)

(assert (=> b!341846 (=> (not res!188978) (not e!209629))))

(assert (=> b!341846 (= res!188978 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8881 _keys!1895)))))

(declare-fun b!341847 () Bool)

(assert (=> b!341847 (= e!209629 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70789 (not res!188977)) b!341846))

(assert (= (and b!341846 res!188978) b!341847))

(assert (=> d!70789 m!343561))

(declare-fun m!343655 () Bool)

(assert (=> b!341847 m!343655))

(assert (=> b!341636 d!70789))

(declare-fun d!70791 () Bool)

(assert (=> d!70791 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341641 d!70791))

(declare-fun d!70793 () Bool)

(assert (=> d!70793 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34254 d!70793))

(declare-fun d!70795 () Bool)

(assert (=> d!70795 (= (array_inv!6344 _values!1525) (bvsge (size!8880 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34254 d!70795))

(declare-fun d!70797 () Bool)

(assert (=> d!70797 (= (array_inv!6345 _keys!1895) (bvsge (size!8881 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34254 d!70797))

(declare-fun b!341854 () Bool)

(declare-fun e!209634 () Bool)

(assert (=> b!341854 (= e!209634 tp_is_empty!7219)))

(declare-fun mapNonEmpty!12267 () Bool)

(declare-fun mapRes!12267 () Bool)

(declare-fun tp!25353 () Bool)

(assert (=> mapNonEmpty!12267 (= mapRes!12267 (and tp!25353 e!209634))))

(declare-fun mapValue!12267 () ValueCell!3266)

(declare-fun mapKey!12267 () (_ BitVec 32))

(declare-fun mapRest!12267 () (Array (_ BitVec 32) ValueCell!3266))

(assert (=> mapNonEmpty!12267 (= mapRest!12258 (store mapRest!12267 mapKey!12267 mapValue!12267))))

(declare-fun b!341855 () Bool)

(declare-fun e!209635 () Bool)

(assert (=> b!341855 (= e!209635 tp_is_empty!7219)))

(declare-fun condMapEmpty!12267 () Bool)

(declare-fun mapDefault!12267 () ValueCell!3266)

(assert (=> mapNonEmpty!12258 (= condMapEmpty!12267 (= mapRest!12258 ((as const (Array (_ BitVec 32) ValueCell!3266)) mapDefault!12267)))))

(assert (=> mapNonEmpty!12258 (= tp!25338 (and e!209635 mapRes!12267))))

(declare-fun mapIsEmpty!12267 () Bool)

(assert (=> mapIsEmpty!12267 mapRes!12267))

(assert (= (and mapNonEmpty!12258 condMapEmpty!12267) mapIsEmpty!12267))

(assert (= (and mapNonEmpty!12258 (not condMapEmpty!12267)) mapNonEmpty!12267))

(assert (= (and mapNonEmpty!12267 ((_ is ValueCellFull!3266) mapValue!12267)) b!341854))

(assert (= (and mapNonEmpty!12258 ((_ is ValueCellFull!3266) mapDefault!12267)) b!341855))

(declare-fun m!343657 () Bool)

(assert (=> mapNonEmpty!12267 m!343657))

(declare-fun b_lambda!8431 () Bool)

(assert (= b_lambda!8429 (or (and start!34254 b_free!7267) b_lambda!8431)))

(check-sat (not b!341841) (not b!341734) (not b!341796) (not bm!26591) (not d!70783) (not b!341795) (not b!341733) (not b!341789) (not b!341847) tp_is_empty!7219 (not b!341825) (not b_lambda!8431) b_and!14449 (not d!70781) (not d!70785) (not b!341805) (not b!341802) (not b!341799) (not b!341722) (not b!341803) (not bm!26584) (not bm!26588) (not b!341798) (not b!341840) (not b!341746) (not mapNonEmpty!12267) (not bm!26567) (not b!341737) (not bm!26583) (not bm!26585) (not b_next!7267) (not d!70775) (not b!341744))
(check-sat b_and!14449 (not b_next!7267))
