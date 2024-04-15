; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33924 () Bool)

(assert start!33924)

(declare-fun b_free!7093 () Bool)

(declare-fun b_next!7093 () Bool)

(assert (=> start!33924 (= b_free!7093 (not b_next!7093))))

(declare-fun tp!24794 () Bool)

(declare-fun b_and!14255 () Bool)

(assert (=> start!33924 (= tp!24794 b_and!14255)))

(declare-fun b!337738 () Bool)

(declare-datatypes ((Unit!10468 0))(
  ( (Unit!10469) )
))
(declare-fun e!207227 () Unit!10468)

(declare-fun Unit!10470 () Unit!10468)

(assert (=> b!337738 (= e!207227 Unit!10470)))

(declare-fun mapIsEmpty!11976 () Bool)

(declare-fun mapRes!11976 () Bool)

(assert (=> mapIsEmpty!11976 mapRes!11976))

(declare-fun b!337740 () Bool)

(declare-fun e!207224 () Bool)

(declare-fun tp_is_empty!7045 () Bool)

(assert (=> b!337740 (= e!207224 tp_is_empty!7045)))

(declare-fun b!337741 () Bool)

(declare-fun res!186605 () Bool)

(declare-fun e!207228 () Bool)

(assert (=> b!337741 (=> (not res!186605) (not e!207228))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10371 0))(
  ( (V!10372 (val!3567 Int)) )
))
(declare-datatypes ((ValueCell!3179 0))(
  ( (ValueCellFull!3179 (v!5727 V!10371)) (EmptyCell!3179) )
))
(declare-datatypes ((array!17665 0))(
  ( (array!17666 (arr!8359 (Array (_ BitVec 32) ValueCell!3179)) (size!8712 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17665)

(declare-datatypes ((array!17667 0))(
  ( (array!17668 (arr!8360 (Array (_ BitVec 32) (_ BitVec 64))) (size!8713 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17667)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337741 (= res!186605 (and (= (size!8712 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8713 _keys!1895) (size!8712 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337742 () Bool)

(declare-fun e!207225 () Bool)

(assert (=> b!337742 (= e!207228 e!207225)))

(declare-fun res!186601 () Bool)

(assert (=> b!337742 (=> (not res!186601) (not e!207225))))

(declare-datatypes ((SeekEntryResult!3230 0))(
  ( (MissingZero!3230 (index!15099 (_ BitVec 32))) (Found!3230 (index!15100 (_ BitVec 32))) (Intermediate!3230 (undefined!4042 Bool) (index!15101 (_ BitVec 32)) (x!33679 (_ BitVec 32))) (Undefined!3230) (MissingVacant!3230 (index!15102 (_ BitVec 32))) )
))
(declare-fun lt!160398 () SeekEntryResult!3230)

(get-info :version)

(assert (=> b!337742 (= res!186601 (and (not ((_ is Found!3230) lt!160398)) ((_ is MissingZero!3230) lt!160398)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17667 (_ BitVec 32)) SeekEntryResult!3230)

(assert (=> b!337742 (= lt!160398 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337743 () Bool)

(assert (=> b!337743 (= e!207225 (and (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)) (bvsge (size!8713 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun lt!160397 () Unit!10468)

(assert (=> b!337743 (= lt!160397 e!207227)))

(declare-fun c!52289 () Bool)

(declare-fun arrayContainsKey!0 (array!17667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337743 (= c!52289 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337744 () Bool)

(declare-fun e!207223 () Bool)

(declare-fun e!207229 () Bool)

(assert (=> b!337744 (= e!207223 (and e!207229 mapRes!11976))))

(declare-fun condMapEmpty!11976 () Bool)

(declare-fun mapDefault!11976 () ValueCell!3179)

(assert (=> b!337744 (= condMapEmpty!11976 (= (arr!8359 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3179)) mapDefault!11976)))))

(declare-fun b!337745 () Bool)

(declare-fun res!186602 () Bool)

(assert (=> b!337745 (=> (not res!186602) (not e!207228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17667 (_ BitVec 32)) Bool)

(assert (=> b!337745 (= res!186602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337746 () Bool)

(declare-fun res!186603 () Bool)

(assert (=> b!337746 (=> (not res!186603) (not e!207228))))

(declare-datatypes ((List!4754 0))(
  ( (Nil!4751) (Cons!4750 (h!5606 (_ BitVec 64)) (t!9841 List!4754)) )
))
(declare-fun arrayNoDuplicates!0 (array!17667 (_ BitVec 32) List!4754) Bool)

(assert (=> b!337746 (= res!186603 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4751))))

(declare-fun mapNonEmpty!11976 () Bool)

(declare-fun tp!24795 () Bool)

(assert (=> mapNonEmpty!11976 (= mapRes!11976 (and tp!24795 e!207224))))

(declare-fun mapRest!11976 () (Array (_ BitVec 32) ValueCell!3179))

(declare-fun mapValue!11976 () ValueCell!3179)

(declare-fun mapKey!11976 () (_ BitVec 32))

(assert (=> mapNonEmpty!11976 (= (arr!8359 _values!1525) (store mapRest!11976 mapKey!11976 mapValue!11976))))

(declare-fun b!337747 () Bool)

(declare-fun res!186600 () Bool)

(assert (=> b!337747 (=> (not res!186600) (not e!207228))))

(declare-fun zeroValue!1467 () V!10371)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10371)

(declare-datatypes ((tuple2!5120 0))(
  ( (tuple2!5121 (_1!2571 (_ BitVec 64)) (_2!2571 V!10371)) )
))
(declare-datatypes ((List!4755 0))(
  ( (Nil!4752) (Cons!4751 (h!5607 tuple2!5120) (t!9842 List!4755)) )
))
(declare-datatypes ((ListLongMap!4023 0))(
  ( (ListLongMap!4024 (toList!2027 List!4755)) )
))
(declare-fun contains!2086 (ListLongMap!4023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1533 (array!17667 array!17665 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 32) Int) ListLongMap!4023)

(assert (=> b!337747 (= res!186600 (not (contains!2086 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337739 () Bool)

(assert (=> b!337739 (= e!207229 tp_is_empty!7045)))

(declare-fun res!186604 () Bool)

(assert (=> start!33924 (=> (not res!186604) (not e!207228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33924 (= res!186604 (validMask!0 mask!2385))))

(assert (=> start!33924 e!207228))

(assert (=> start!33924 true))

(assert (=> start!33924 tp_is_empty!7045))

(assert (=> start!33924 tp!24794))

(declare-fun array_inv!6232 (array!17665) Bool)

(assert (=> start!33924 (and (array_inv!6232 _values!1525) e!207223)))

(declare-fun array_inv!6233 (array!17667) Bool)

(assert (=> start!33924 (array_inv!6233 _keys!1895)))

(declare-fun b!337748 () Bool)

(declare-fun res!186599 () Bool)

(assert (=> b!337748 (=> (not res!186599) (not e!207228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337748 (= res!186599 (validKeyInArray!0 k0!1348))))

(declare-fun b!337749 () Bool)

(declare-fun Unit!10471 () Unit!10468)

(assert (=> b!337749 (= e!207227 Unit!10471)))

(declare-fun lt!160396 () Unit!10468)

(declare-fun lemmaArrayContainsKeyThenInListMap!270 (array!17667 array!17665 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 64) (_ BitVec 32) Int) Unit!10468)

(declare-fun arrayScanForKey!0 (array!17667 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337749 (= lt!160396 (lemmaArrayContainsKeyThenInListMap!270 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337749 false))

(assert (= (and start!33924 res!186604) b!337741))

(assert (= (and b!337741 res!186605) b!337745))

(assert (= (and b!337745 res!186602) b!337746))

(assert (= (and b!337746 res!186603) b!337748))

(assert (= (and b!337748 res!186599) b!337747))

(assert (= (and b!337747 res!186600) b!337742))

(assert (= (and b!337742 res!186601) b!337743))

(assert (= (and b!337743 c!52289) b!337749))

(assert (= (and b!337743 (not c!52289)) b!337738))

(assert (= (and b!337744 condMapEmpty!11976) mapIsEmpty!11976))

(assert (= (and b!337744 (not condMapEmpty!11976)) mapNonEmpty!11976))

(assert (= (and mapNonEmpty!11976 ((_ is ValueCellFull!3179) mapValue!11976)) b!337740))

(assert (= (and b!337744 ((_ is ValueCellFull!3179) mapDefault!11976)) b!337739))

(assert (= start!33924 b!337744))

(declare-fun m!340651 () Bool)

(assert (=> b!337742 m!340651))

(declare-fun m!340653 () Bool)

(assert (=> b!337743 m!340653))

(declare-fun m!340655 () Bool)

(assert (=> b!337749 m!340655))

(assert (=> b!337749 m!340655))

(declare-fun m!340657 () Bool)

(assert (=> b!337749 m!340657))

(declare-fun m!340659 () Bool)

(assert (=> b!337747 m!340659))

(assert (=> b!337747 m!340659))

(declare-fun m!340661 () Bool)

(assert (=> b!337747 m!340661))

(declare-fun m!340663 () Bool)

(assert (=> mapNonEmpty!11976 m!340663))

(declare-fun m!340665 () Bool)

(assert (=> b!337748 m!340665))

(declare-fun m!340667 () Bool)

(assert (=> b!337745 m!340667))

(declare-fun m!340669 () Bool)

(assert (=> b!337746 m!340669))

(declare-fun m!340671 () Bool)

(assert (=> start!33924 m!340671))

(declare-fun m!340673 () Bool)

(assert (=> start!33924 m!340673))

(declare-fun m!340675 () Bool)

(assert (=> start!33924 m!340675))

(check-sat (not mapNonEmpty!11976) (not b!337748) (not b!337742) (not b!337745) (not b_next!7093) (not b!337747) (not b!337746) (not b!337749) b_and!14255 (not start!33924) tp_is_empty!7045 (not b!337743))
(check-sat b_and!14255 (not b_next!7093))
(get-model)

(declare-fun b!337831 () Bool)

(declare-fun e!207280 () Bool)

(declare-fun call!26381 () Bool)

(assert (=> b!337831 (= e!207280 call!26381)))

(declare-fun b!337832 () Bool)

(declare-fun e!207279 () Bool)

(assert (=> b!337832 (= e!207279 e!207280)))

(declare-fun c!52298 () Bool)

(assert (=> b!337832 (= c!52298 (validKeyInArray!0 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26378 () Bool)

(assert (=> bm!26378 (= call!26381 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!337833 () Bool)

(declare-fun e!207278 () Bool)

(assert (=> b!337833 (= e!207280 e!207278)))

(declare-fun lt!160425 () (_ BitVec 64))

(assert (=> b!337833 (= lt!160425 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160423 () Unit!10468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17667 (_ BitVec 64) (_ BitVec 32)) Unit!10468)

(assert (=> b!337833 (= lt!160423 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160425 #b00000000000000000000000000000000))))

(assert (=> b!337833 (arrayContainsKey!0 _keys!1895 lt!160425 #b00000000000000000000000000000000)))

(declare-fun lt!160424 () Unit!10468)

(assert (=> b!337833 (= lt!160424 lt!160423)))

(declare-fun res!186652 () Bool)

(assert (=> b!337833 (= res!186652 (= (seekEntryOrOpen!0 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3230 #b00000000000000000000000000000000)))))

(assert (=> b!337833 (=> (not res!186652) (not e!207278))))

(declare-fun b!337830 () Bool)

(assert (=> b!337830 (= e!207278 call!26381)))

(declare-fun d!70561 () Bool)

(declare-fun res!186653 () Bool)

(assert (=> d!70561 (=> res!186653 e!207279)))

(assert (=> d!70561 (= res!186653 (bvsge #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(assert (=> d!70561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207279)))

(assert (= (and d!70561 (not res!186653)) b!337832))

(assert (= (and b!337832 c!52298) b!337833))

(assert (= (and b!337832 (not c!52298)) b!337831))

(assert (= (and b!337833 res!186652) b!337830))

(assert (= (or b!337830 b!337831) bm!26378))

(declare-fun m!340729 () Bool)

(assert (=> b!337832 m!340729))

(assert (=> b!337832 m!340729))

(declare-fun m!340731 () Bool)

(assert (=> b!337832 m!340731))

(declare-fun m!340733 () Bool)

(assert (=> bm!26378 m!340733))

(assert (=> b!337833 m!340729))

(declare-fun m!340735 () Bool)

(assert (=> b!337833 m!340735))

(declare-fun m!340737 () Bool)

(assert (=> b!337833 m!340737))

(assert (=> b!337833 m!340729))

(declare-fun m!340739 () Bool)

(assert (=> b!337833 m!340739))

(assert (=> b!337745 d!70561))

(declare-fun d!70563 () Bool)

(assert (=> d!70563 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33924 d!70563))

(declare-fun d!70565 () Bool)

(assert (=> d!70565 (= (array_inv!6232 _values!1525) (bvsge (size!8712 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33924 d!70565))

(declare-fun d!70567 () Bool)

(assert (=> d!70567 (= (array_inv!6233 _keys!1895) (bvsge (size!8713 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33924 d!70567))

(declare-fun d!70569 () Bool)

(assert (=> d!70569 (contains!2086 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160428 () Unit!10468)

(declare-fun choose!1306 (array!17667 array!17665 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 64) (_ BitVec 32) Int) Unit!10468)

(assert (=> d!70569 (= lt!160428 (choose!1306 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70569 (validMask!0 mask!2385)))

(assert (=> d!70569 (= (lemmaArrayContainsKeyThenInListMap!270 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160428)))

(declare-fun bs!11613 () Bool)

(assert (= bs!11613 d!70569))

(assert (=> bs!11613 m!340659))

(assert (=> bs!11613 m!340659))

(assert (=> bs!11613 m!340661))

(assert (=> bs!11613 m!340655))

(declare-fun m!340741 () Bool)

(assert (=> bs!11613 m!340741))

(assert (=> bs!11613 m!340671))

(assert (=> b!337749 d!70569))

(declare-fun d!70571 () Bool)

(declare-fun lt!160431 () (_ BitVec 32))

(assert (=> d!70571 (and (or (bvslt lt!160431 #b00000000000000000000000000000000) (bvsge lt!160431 (size!8713 _keys!1895)) (and (bvsge lt!160431 #b00000000000000000000000000000000) (bvslt lt!160431 (size!8713 _keys!1895)))) (bvsge lt!160431 #b00000000000000000000000000000000) (bvslt lt!160431 (size!8713 _keys!1895)) (= (select (arr!8360 _keys!1895) lt!160431) k0!1348))))

(declare-fun e!207283 () (_ BitVec 32))

(assert (=> d!70571 (= lt!160431 e!207283)))

(declare-fun c!52301 () Bool)

(assert (=> d!70571 (= c!52301 (= (select (arr!8360 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)) (bvslt (size!8713 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70571 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160431)))

(declare-fun b!337838 () Bool)

(assert (=> b!337838 (= e!207283 #b00000000000000000000000000000000)))

(declare-fun b!337839 () Bool)

(assert (=> b!337839 (= e!207283 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70571 c!52301) b!337838))

(assert (= (and d!70571 (not c!52301)) b!337839))

(declare-fun m!340743 () Bool)

(assert (=> d!70571 m!340743))

(assert (=> d!70571 m!340729))

(declare-fun m!340745 () Bool)

(assert (=> b!337839 m!340745))

(assert (=> b!337749 d!70571))

(declare-fun b!337850 () Bool)

(declare-fun e!207293 () Bool)

(declare-fun e!207295 () Bool)

(assert (=> b!337850 (= e!207293 e!207295)))

(declare-fun c!52304 () Bool)

(assert (=> b!337850 (= c!52304 (validKeyInArray!0 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70573 () Bool)

(declare-fun res!186660 () Bool)

(declare-fun e!207292 () Bool)

(assert (=> d!70573 (=> res!186660 e!207292)))

(assert (=> d!70573 (= res!186660 (bvsge #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(assert (=> d!70573 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4751) e!207292)))

(declare-fun b!337851 () Bool)

(declare-fun call!26384 () Bool)

(assert (=> b!337851 (= e!207295 call!26384)))

(declare-fun bm!26381 () Bool)

(assert (=> bm!26381 (= call!26384 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52304 (Cons!4750 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000) Nil!4751) Nil!4751)))))

(declare-fun b!337852 () Bool)

(assert (=> b!337852 (= e!207292 e!207293)))

(declare-fun res!186662 () Bool)

(assert (=> b!337852 (=> (not res!186662) (not e!207293))))

(declare-fun e!207294 () Bool)

(assert (=> b!337852 (= res!186662 (not e!207294))))

(declare-fun res!186661 () Bool)

(assert (=> b!337852 (=> (not res!186661) (not e!207294))))

(assert (=> b!337852 (= res!186661 (validKeyInArray!0 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337853 () Bool)

(declare-fun contains!2089 (List!4754 (_ BitVec 64)) Bool)

(assert (=> b!337853 (= e!207294 (contains!2089 Nil!4751 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337854 () Bool)

(assert (=> b!337854 (= e!207295 call!26384)))

(assert (= (and d!70573 (not res!186660)) b!337852))

(assert (= (and b!337852 res!186661) b!337853))

(assert (= (and b!337852 res!186662) b!337850))

(assert (= (and b!337850 c!52304) b!337851))

(assert (= (and b!337850 (not c!52304)) b!337854))

(assert (= (or b!337851 b!337854) bm!26381))

(assert (=> b!337850 m!340729))

(assert (=> b!337850 m!340729))

(assert (=> b!337850 m!340731))

(assert (=> bm!26381 m!340729))

(declare-fun m!340747 () Bool)

(assert (=> bm!26381 m!340747))

(assert (=> b!337852 m!340729))

(assert (=> b!337852 m!340729))

(assert (=> b!337852 m!340731))

(assert (=> b!337853 m!340729))

(assert (=> b!337853 m!340729))

(declare-fun m!340749 () Bool)

(assert (=> b!337853 m!340749))

(assert (=> b!337746 d!70573))

(declare-fun d!70575 () Bool)

(declare-fun e!207300 () Bool)

(assert (=> d!70575 e!207300))

(declare-fun res!186665 () Bool)

(assert (=> d!70575 (=> res!186665 e!207300)))

(declare-fun lt!160442 () Bool)

(assert (=> d!70575 (= res!186665 (not lt!160442))))

(declare-fun lt!160441 () Bool)

(assert (=> d!70575 (= lt!160442 lt!160441)))

(declare-fun lt!160443 () Unit!10468)

(declare-fun e!207301 () Unit!10468)

(assert (=> d!70575 (= lt!160443 e!207301)))

(declare-fun c!52307 () Bool)

(assert (=> d!70575 (= c!52307 lt!160441)))

(declare-fun containsKey!318 (List!4755 (_ BitVec 64)) Bool)

(assert (=> d!70575 (= lt!160441 (containsKey!318 (toList!2027 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70575 (= (contains!2086 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160442)))

(declare-fun b!337861 () Bool)

(declare-fun lt!160440 () Unit!10468)

(assert (=> b!337861 (= e!207301 lt!160440)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!267 (List!4755 (_ BitVec 64)) Unit!10468)

(assert (=> b!337861 (= lt!160440 (lemmaContainsKeyImpliesGetValueByKeyDefined!267 (toList!2027 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!332 0))(
  ( (Some!331 (v!5730 V!10371)) (None!330) )
))
(declare-fun isDefined!268 (Option!332) Bool)

(declare-fun getValueByKey!326 (List!4755 (_ BitVec 64)) Option!332)

(assert (=> b!337861 (isDefined!268 (getValueByKey!326 (toList!2027 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!337862 () Bool)

(declare-fun Unit!10475 () Unit!10468)

(assert (=> b!337862 (= e!207301 Unit!10475)))

(declare-fun b!337863 () Bool)

(assert (=> b!337863 (= e!207300 (isDefined!268 (getValueByKey!326 (toList!2027 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70575 c!52307) b!337861))

(assert (= (and d!70575 (not c!52307)) b!337862))

(assert (= (and d!70575 (not res!186665)) b!337863))

(declare-fun m!340751 () Bool)

(assert (=> d!70575 m!340751))

(declare-fun m!340753 () Bool)

(assert (=> b!337861 m!340753))

(declare-fun m!340755 () Bool)

(assert (=> b!337861 m!340755))

(assert (=> b!337861 m!340755))

(declare-fun m!340757 () Bool)

(assert (=> b!337861 m!340757))

(assert (=> b!337863 m!340755))

(assert (=> b!337863 m!340755))

(assert (=> b!337863 m!340757))

(assert (=> b!337747 d!70575))

(declare-fun bm!26396 () Bool)

(declare-fun call!26403 () ListLongMap!4023)

(declare-fun getCurrentListMapNoExtraKeys!586 (array!17667 array!17665 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 32) Int) ListLongMap!4023)

(assert (=> bm!26396 (= call!26403 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!337906 () Bool)

(declare-fun e!207337 () Bool)

(declare-fun call!26400 () Bool)

(assert (=> b!337906 (= e!207337 (not call!26400))))

(declare-fun b!337907 () Bool)

(declare-fun res!186686 () Bool)

(declare-fun e!207333 () Bool)

(assert (=> b!337907 (=> (not res!186686) (not e!207333))))

(declare-fun e!207339 () Bool)

(assert (=> b!337907 (= res!186686 e!207339)))

(declare-fun res!186692 () Bool)

(assert (=> b!337907 (=> res!186692 e!207339)))

(declare-fun e!207330 () Bool)

(assert (=> b!337907 (= res!186692 (not e!207330))))

(declare-fun res!186688 () Bool)

(assert (=> b!337907 (=> (not res!186688) (not e!207330))))

(assert (=> b!337907 (= res!186688 (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(declare-fun b!337908 () Bool)

(declare-fun e!207335 () Unit!10468)

(declare-fun Unit!10476 () Unit!10468)

(assert (=> b!337908 (= e!207335 Unit!10476)))

(declare-fun b!337909 () Bool)

(declare-fun e!207338 () Bool)

(assert (=> b!337909 (= e!207339 e!207338)))

(declare-fun res!186690 () Bool)

(assert (=> b!337909 (=> (not res!186690) (not e!207338))))

(declare-fun lt!160493 () ListLongMap!4023)

(assert (=> b!337909 (= res!186690 (contains!2086 lt!160493 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!337909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(declare-fun b!337911 () Bool)

(declare-fun e!207329 () ListLongMap!4023)

(declare-fun e!207332 () ListLongMap!4023)

(assert (=> b!337911 (= e!207329 e!207332)))

(declare-fun c!52323 () Bool)

(assert (=> b!337911 (= c!52323 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!337912 () Bool)

(declare-fun e!207340 () Bool)

(assert (=> b!337912 (= e!207337 e!207340)))

(declare-fun res!186687 () Bool)

(assert (=> b!337912 (= res!186687 call!26400)))

(assert (=> b!337912 (=> (not res!186687) (not e!207340))))

(declare-fun b!337913 () Bool)

(declare-fun call!26399 () ListLongMap!4023)

(assert (=> b!337913 (= e!207332 call!26399)))

(declare-fun b!337914 () Bool)

(declare-fun apply!270 (ListLongMap!4023 (_ BitVec 64)) V!10371)

(declare-fun get!4558 (ValueCell!3179 V!10371) V!10371)

(declare-fun dynLambda!604 (Int (_ BitVec 64)) V!10371)

(assert (=> b!337914 (= e!207338 (= (apply!270 lt!160493 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)) (get!4558 (select (arr!8359 _values!1525) #b00000000000000000000000000000000) (dynLambda!604 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337914 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8712 _values!1525)))))

(assert (=> b!337914 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(declare-fun b!337915 () Bool)

(declare-fun e!207334 () ListLongMap!4023)

(assert (=> b!337915 (= e!207334 call!26399)))

(declare-fun b!337910 () Bool)

(declare-fun lt!160497 () Unit!10468)

(assert (=> b!337910 (= e!207335 lt!160497)))

(declare-fun lt!160495 () ListLongMap!4023)

(assert (=> b!337910 (= lt!160495 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160491 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160509 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160509 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160492 () Unit!10468)

(declare-fun addStillContains!246 (ListLongMap!4023 (_ BitVec 64) V!10371 (_ BitVec 64)) Unit!10468)

(assert (=> b!337910 (= lt!160492 (addStillContains!246 lt!160495 lt!160491 zeroValue!1467 lt!160509))))

(declare-fun +!723 (ListLongMap!4023 tuple2!5120) ListLongMap!4023)

(assert (=> b!337910 (contains!2086 (+!723 lt!160495 (tuple2!5121 lt!160491 zeroValue!1467)) lt!160509)))

(declare-fun lt!160496 () Unit!10468)

(assert (=> b!337910 (= lt!160496 lt!160492)))

(declare-fun lt!160488 () ListLongMap!4023)

(assert (=> b!337910 (= lt!160488 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160498 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160498 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160503 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160503 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160489 () Unit!10468)

(declare-fun addApplyDifferent!246 (ListLongMap!4023 (_ BitVec 64) V!10371 (_ BitVec 64)) Unit!10468)

(assert (=> b!337910 (= lt!160489 (addApplyDifferent!246 lt!160488 lt!160498 minValue!1467 lt!160503))))

(assert (=> b!337910 (= (apply!270 (+!723 lt!160488 (tuple2!5121 lt!160498 minValue!1467)) lt!160503) (apply!270 lt!160488 lt!160503))))

(declare-fun lt!160507 () Unit!10468)

(assert (=> b!337910 (= lt!160507 lt!160489)))

(declare-fun lt!160500 () ListLongMap!4023)

(assert (=> b!337910 (= lt!160500 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160494 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160508 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160508 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160506 () Unit!10468)

(assert (=> b!337910 (= lt!160506 (addApplyDifferent!246 lt!160500 lt!160494 zeroValue!1467 lt!160508))))

(assert (=> b!337910 (= (apply!270 (+!723 lt!160500 (tuple2!5121 lt!160494 zeroValue!1467)) lt!160508) (apply!270 lt!160500 lt!160508))))

(declare-fun lt!160501 () Unit!10468)

(assert (=> b!337910 (= lt!160501 lt!160506)))

(declare-fun lt!160504 () ListLongMap!4023)

(assert (=> b!337910 (= lt!160504 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160505 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160490 () (_ BitVec 64))

(assert (=> b!337910 (= lt!160490 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!337910 (= lt!160497 (addApplyDifferent!246 lt!160504 lt!160505 minValue!1467 lt!160490))))

(assert (=> b!337910 (= (apply!270 (+!723 lt!160504 (tuple2!5121 lt!160505 minValue!1467)) lt!160490) (apply!270 lt!160504 lt!160490))))

(declare-fun d!70577 () Bool)

(assert (=> d!70577 e!207333))

(declare-fun res!186684 () Bool)

(assert (=> d!70577 (=> (not res!186684) (not e!207333))))

(assert (=> d!70577 (= res!186684 (or (bvsge #b00000000000000000000000000000000 (size!8713 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))))

(declare-fun lt!160502 () ListLongMap!4023)

(assert (=> d!70577 (= lt!160493 lt!160502)))

(declare-fun lt!160499 () Unit!10468)

(assert (=> d!70577 (= lt!160499 e!207335)))

(declare-fun c!52325 () Bool)

(declare-fun e!207336 () Bool)

(assert (=> d!70577 (= c!52325 e!207336)))

(declare-fun res!186689 () Bool)

(assert (=> d!70577 (=> (not res!186689) (not e!207336))))

(assert (=> d!70577 (= res!186689 (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(assert (=> d!70577 (= lt!160502 e!207329)))

(declare-fun c!52321 () Bool)

(assert (=> d!70577 (= c!52321 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70577 (validMask!0 mask!2385)))

(assert (=> d!70577 (= (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160493)))

(declare-fun b!337916 () Bool)

(assert (=> b!337916 (= e!207340 (= (apply!270 lt!160493 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun call!26402 () ListLongMap!4023)

(declare-fun bm!26397 () Bool)

(declare-fun call!26404 () ListLongMap!4023)

(declare-fun call!26405 () ListLongMap!4023)

(assert (=> bm!26397 (= call!26405 (+!723 (ite c!52321 call!26403 (ite c!52323 call!26404 call!26402)) (ite (or c!52321 c!52323) (tuple2!5121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!337917 () Bool)

(assert (=> b!337917 (= e!207329 (+!723 call!26405 (tuple2!5121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26398 () Bool)

(assert (=> bm!26398 (= call!26402 call!26404)))

(declare-fun b!337918 () Bool)

(declare-fun e!207331 () Bool)

(declare-fun e!207328 () Bool)

(assert (=> b!337918 (= e!207331 e!207328)))

(declare-fun res!186685 () Bool)

(declare-fun call!26401 () Bool)

(assert (=> b!337918 (= res!186685 call!26401)))

(assert (=> b!337918 (=> (not res!186685) (not e!207328))))

(declare-fun bm!26399 () Bool)

(assert (=> bm!26399 (= call!26400 (contains!2086 lt!160493 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!337919 () Bool)

(declare-fun c!52322 () Bool)

(assert (=> b!337919 (= c!52322 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!337919 (= e!207332 e!207334)))

(declare-fun b!337920 () Bool)

(assert (=> b!337920 (= e!207333 e!207337)))

(declare-fun c!52320 () Bool)

(assert (=> b!337920 (= c!52320 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!337921 () Bool)

(declare-fun res!186691 () Bool)

(assert (=> b!337921 (=> (not res!186691) (not e!207333))))

(assert (=> b!337921 (= res!186691 e!207331)))

(declare-fun c!52324 () Bool)

(assert (=> b!337921 (= c!52324 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!337922 () Bool)

(assert (=> b!337922 (= e!207328 (= (apply!270 lt!160493 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26400 () Bool)

(assert (=> bm!26400 (= call!26401 (contains!2086 lt!160493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26401 () Bool)

(assert (=> bm!26401 (= call!26404 call!26403)))

(declare-fun b!337923 () Bool)

(assert (=> b!337923 (= e!207334 call!26402)))

(declare-fun b!337924 () Bool)

(assert (=> b!337924 (= e!207331 (not call!26401))))

(declare-fun b!337925 () Bool)

(assert (=> b!337925 (= e!207336 (validKeyInArray!0 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26402 () Bool)

(assert (=> bm!26402 (= call!26399 call!26405)))

(declare-fun b!337926 () Bool)

(assert (=> b!337926 (= e!207330 (validKeyInArray!0 (select (arr!8360 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70577 c!52321) b!337917))

(assert (= (and d!70577 (not c!52321)) b!337911))

(assert (= (and b!337911 c!52323) b!337913))

(assert (= (and b!337911 (not c!52323)) b!337919))

(assert (= (and b!337919 c!52322) b!337915))

(assert (= (and b!337919 (not c!52322)) b!337923))

(assert (= (or b!337915 b!337923) bm!26398))

(assert (= (or b!337913 bm!26398) bm!26401))

(assert (= (or b!337913 b!337915) bm!26402))

(assert (= (or b!337917 bm!26401) bm!26396))

(assert (= (or b!337917 bm!26402) bm!26397))

(assert (= (and d!70577 res!186689) b!337925))

(assert (= (and d!70577 c!52325) b!337910))

(assert (= (and d!70577 (not c!52325)) b!337908))

(assert (= (and d!70577 res!186684) b!337907))

(assert (= (and b!337907 res!186688) b!337926))

(assert (= (and b!337907 (not res!186692)) b!337909))

(assert (= (and b!337909 res!186690) b!337914))

(assert (= (and b!337907 res!186686) b!337921))

(assert (= (and b!337921 c!52324) b!337918))

(assert (= (and b!337921 (not c!52324)) b!337924))

(assert (= (and b!337918 res!186685) b!337922))

(assert (= (or b!337918 b!337924) bm!26400))

(assert (= (and b!337921 res!186691) b!337920))

(assert (= (and b!337920 c!52320) b!337912))

(assert (= (and b!337920 (not c!52320)) b!337906))

(assert (= (and b!337912 res!186687) b!337916))

(assert (= (or b!337912 b!337906) bm!26399))

(declare-fun b_lambda!8401 () Bool)

(assert (=> (not b_lambda!8401) (not b!337914)))

(declare-fun t!9847 () Bool)

(declare-fun tb!3047 () Bool)

(assert (=> (and start!33924 (= defaultEntry!1528 defaultEntry!1528) t!9847) tb!3047))

(declare-fun result!5487 () Bool)

(assert (=> tb!3047 (= result!5487 tp_is_empty!7045)))

(assert (=> b!337914 t!9847))

(declare-fun b_and!14261 () Bool)

(assert (= b_and!14255 (and (=> t!9847 result!5487) b_and!14261)))

(declare-fun m!340759 () Bool)

(assert (=> bm!26399 m!340759))

(assert (=> b!337926 m!340729))

(assert (=> b!337926 m!340729))

(assert (=> b!337926 m!340731))

(assert (=> b!337925 m!340729))

(assert (=> b!337925 m!340729))

(assert (=> b!337925 m!340731))

(declare-fun m!340761 () Bool)

(assert (=> bm!26396 m!340761))

(declare-fun m!340763 () Bool)

(assert (=> bm!26400 m!340763))

(declare-fun m!340765 () Bool)

(assert (=> b!337917 m!340765))

(assert (=> d!70577 m!340671))

(assert (=> b!337909 m!340729))

(assert (=> b!337909 m!340729))

(declare-fun m!340767 () Bool)

(assert (=> b!337909 m!340767))

(declare-fun m!340769 () Bool)

(assert (=> bm!26397 m!340769))

(assert (=> b!337914 m!340729))

(declare-fun m!340771 () Bool)

(assert (=> b!337914 m!340771))

(assert (=> b!337914 m!340771))

(declare-fun m!340773 () Bool)

(assert (=> b!337914 m!340773))

(declare-fun m!340775 () Bool)

(assert (=> b!337914 m!340775))

(assert (=> b!337914 m!340773))

(assert (=> b!337914 m!340729))

(declare-fun m!340777 () Bool)

(assert (=> b!337914 m!340777))

(declare-fun m!340779 () Bool)

(assert (=> b!337916 m!340779))

(declare-fun m!340781 () Bool)

(assert (=> b!337910 m!340781))

(declare-fun m!340783 () Bool)

(assert (=> b!337910 m!340783))

(declare-fun m!340785 () Bool)

(assert (=> b!337910 m!340785))

(declare-fun m!340787 () Bool)

(assert (=> b!337910 m!340787))

(declare-fun m!340789 () Bool)

(assert (=> b!337910 m!340789))

(declare-fun m!340791 () Bool)

(assert (=> b!337910 m!340791))

(assert (=> b!337910 m!340787))

(declare-fun m!340793 () Bool)

(assert (=> b!337910 m!340793))

(declare-fun m!340795 () Bool)

(assert (=> b!337910 m!340795))

(declare-fun m!340797 () Bool)

(assert (=> b!337910 m!340797))

(assert (=> b!337910 m!340793))

(declare-fun m!340799 () Bool)

(assert (=> b!337910 m!340799))

(declare-fun m!340801 () Bool)

(assert (=> b!337910 m!340801))

(declare-fun m!340803 () Bool)

(assert (=> b!337910 m!340803))

(assert (=> b!337910 m!340729))

(assert (=> b!337910 m!340801))

(declare-fun m!340805 () Bool)

(assert (=> b!337910 m!340805))

(declare-fun m!340807 () Bool)

(assert (=> b!337910 m!340807))

(declare-fun m!340809 () Bool)

(assert (=> b!337910 m!340809))

(assert (=> b!337910 m!340761))

(assert (=> b!337910 m!340781))

(declare-fun m!340811 () Bool)

(assert (=> b!337922 m!340811))

(assert (=> b!337747 d!70577))

(declare-fun d!70579 () Bool)

(declare-fun lt!160518 () SeekEntryResult!3230)

(assert (=> d!70579 (and (or ((_ is Undefined!3230) lt!160518) (not ((_ is Found!3230) lt!160518)) (and (bvsge (index!15100 lt!160518) #b00000000000000000000000000000000) (bvslt (index!15100 lt!160518) (size!8713 _keys!1895)))) (or ((_ is Undefined!3230) lt!160518) ((_ is Found!3230) lt!160518) (not ((_ is MissingZero!3230) lt!160518)) (and (bvsge (index!15099 lt!160518) #b00000000000000000000000000000000) (bvslt (index!15099 lt!160518) (size!8713 _keys!1895)))) (or ((_ is Undefined!3230) lt!160518) ((_ is Found!3230) lt!160518) ((_ is MissingZero!3230) lt!160518) (not ((_ is MissingVacant!3230) lt!160518)) (and (bvsge (index!15102 lt!160518) #b00000000000000000000000000000000) (bvslt (index!15102 lt!160518) (size!8713 _keys!1895)))) (or ((_ is Undefined!3230) lt!160518) (ite ((_ is Found!3230) lt!160518) (= (select (arr!8360 _keys!1895) (index!15100 lt!160518)) k0!1348) (ite ((_ is MissingZero!3230) lt!160518) (= (select (arr!8360 _keys!1895) (index!15099 lt!160518)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3230) lt!160518) (= (select (arr!8360 _keys!1895) (index!15102 lt!160518)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!207347 () SeekEntryResult!3230)

(assert (=> d!70579 (= lt!160518 e!207347)))

(declare-fun c!52334 () Bool)

(declare-fun lt!160517 () SeekEntryResult!3230)

(assert (=> d!70579 (= c!52334 (and ((_ is Intermediate!3230) lt!160517) (undefined!4042 lt!160517)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17667 (_ BitVec 32)) SeekEntryResult!3230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70579 (= lt!160517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70579 (validMask!0 mask!2385)))

(assert (=> d!70579 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160518)))

(declare-fun b!337941 () Bool)

(assert (=> b!337941 (= e!207347 Undefined!3230)))

(declare-fun b!337942 () Bool)

(declare-fun c!52332 () Bool)

(declare-fun lt!160516 () (_ BitVec 64))

(assert (=> b!337942 (= c!52332 (= lt!160516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!207348 () SeekEntryResult!3230)

(declare-fun e!207349 () SeekEntryResult!3230)

(assert (=> b!337942 (= e!207348 e!207349)))

(declare-fun b!337943 () Bool)

(assert (=> b!337943 (= e!207348 (Found!3230 (index!15101 lt!160517)))))

(declare-fun b!337944 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17667 (_ BitVec 32)) SeekEntryResult!3230)

(assert (=> b!337944 (= e!207349 (seekKeyOrZeroReturnVacant!0 (x!33679 lt!160517) (index!15101 lt!160517) (index!15101 lt!160517) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337945 () Bool)

(assert (=> b!337945 (= e!207349 (MissingZero!3230 (index!15101 lt!160517)))))

(declare-fun b!337946 () Bool)

(assert (=> b!337946 (= e!207347 e!207348)))

(assert (=> b!337946 (= lt!160516 (select (arr!8360 _keys!1895) (index!15101 lt!160517)))))

(declare-fun c!52333 () Bool)

(assert (=> b!337946 (= c!52333 (= lt!160516 k0!1348))))

(assert (= (and d!70579 c!52334) b!337941))

(assert (= (and d!70579 (not c!52334)) b!337946))

(assert (= (and b!337946 c!52333) b!337943))

(assert (= (and b!337946 (not c!52333)) b!337942))

(assert (= (and b!337942 c!52332) b!337945))

(assert (= (and b!337942 (not c!52332)) b!337944))

(declare-fun m!340813 () Bool)

(assert (=> d!70579 m!340813))

(declare-fun m!340815 () Bool)

(assert (=> d!70579 m!340815))

(assert (=> d!70579 m!340671))

(declare-fun m!340817 () Bool)

(assert (=> d!70579 m!340817))

(assert (=> d!70579 m!340813))

(declare-fun m!340819 () Bool)

(assert (=> d!70579 m!340819))

(declare-fun m!340821 () Bool)

(assert (=> d!70579 m!340821))

(declare-fun m!340823 () Bool)

(assert (=> b!337944 m!340823))

(declare-fun m!340825 () Bool)

(assert (=> b!337946 m!340825))

(assert (=> b!337742 d!70579))

(declare-fun d!70581 () Bool)

(assert (=> d!70581 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337748 d!70581))

(declare-fun d!70583 () Bool)

(declare-fun res!186697 () Bool)

(declare-fun e!207354 () Bool)

(assert (=> d!70583 (=> res!186697 e!207354)))

(assert (=> d!70583 (= res!186697 (= (select (arr!8360 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70583 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207354)))

(declare-fun b!337951 () Bool)

(declare-fun e!207355 () Bool)

(assert (=> b!337951 (= e!207354 e!207355)))

(declare-fun res!186698 () Bool)

(assert (=> b!337951 (=> (not res!186698) (not e!207355))))

(assert (=> b!337951 (= res!186698 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8713 _keys!1895)))))

(declare-fun b!337952 () Bool)

(assert (=> b!337952 (= e!207355 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70583 (not res!186697)) b!337951))

(assert (= (and b!337951 res!186698) b!337952))

(assert (=> d!70583 m!340729))

(declare-fun m!340827 () Bool)

(assert (=> b!337952 m!340827))

(assert (=> b!337743 d!70583))

(declare-fun b!337959 () Bool)

(declare-fun e!207360 () Bool)

(assert (=> b!337959 (= e!207360 tp_is_empty!7045)))

(declare-fun b!337960 () Bool)

(declare-fun e!207361 () Bool)

(assert (=> b!337960 (= e!207361 tp_is_empty!7045)))

(declare-fun mapNonEmpty!11985 () Bool)

(declare-fun mapRes!11985 () Bool)

(declare-fun tp!24810 () Bool)

(assert (=> mapNonEmpty!11985 (= mapRes!11985 (and tp!24810 e!207360))))

(declare-fun mapValue!11985 () ValueCell!3179)

(declare-fun mapKey!11985 () (_ BitVec 32))

(declare-fun mapRest!11985 () (Array (_ BitVec 32) ValueCell!3179))

(assert (=> mapNonEmpty!11985 (= mapRest!11976 (store mapRest!11985 mapKey!11985 mapValue!11985))))

(declare-fun condMapEmpty!11985 () Bool)

(declare-fun mapDefault!11985 () ValueCell!3179)

(assert (=> mapNonEmpty!11976 (= condMapEmpty!11985 (= mapRest!11976 ((as const (Array (_ BitVec 32) ValueCell!3179)) mapDefault!11985)))))

(assert (=> mapNonEmpty!11976 (= tp!24795 (and e!207361 mapRes!11985))))

(declare-fun mapIsEmpty!11985 () Bool)

(assert (=> mapIsEmpty!11985 mapRes!11985))

(assert (= (and mapNonEmpty!11976 condMapEmpty!11985) mapIsEmpty!11985))

(assert (= (and mapNonEmpty!11976 (not condMapEmpty!11985)) mapNonEmpty!11985))

(assert (= (and mapNonEmpty!11985 ((_ is ValueCellFull!3179) mapValue!11985)) b!337959))

(assert (= (and mapNonEmpty!11976 ((_ is ValueCellFull!3179) mapDefault!11985)) b!337960))

(declare-fun m!340829 () Bool)

(assert (=> mapNonEmpty!11985 m!340829))

(declare-fun b_lambda!8403 () Bool)

(assert (= b_lambda!8401 (or (and start!33924 b_free!7093) b_lambda!8403)))

(check-sat (not b_next!7093) (not b!337916) (not d!70575) (not d!70579) (not d!70577) (not bm!26400) (not b!337833) (not b!337917) (not bm!26378) (not bm!26396) (not b!337944) (not bm!26397) (not b!337926) (not bm!26381) (not b!337850) (not mapNonEmpty!11985) (not b!337839) (not b!337863) (not b!337852) (not b!337910) (not b!337861) (not b!337952) (not b_lambda!8403) (not d!70569) b_and!14261 tp_is_empty!7045 (not b!337832) (not bm!26399) (not b!337914) (not b!337853) (not b!337909) (not b!337925) (not b!337922))
(check-sat b_and!14261 (not b_next!7093))
