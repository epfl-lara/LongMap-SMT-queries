; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18908 () Bool)

(assert start!18908)

(declare-fun b!186664 () Bool)

(declare-fun b_free!4597 () Bool)

(declare-fun b_next!4597 () Bool)

(assert (=> b!186664 (= b_free!4597 (not b_next!4597))))

(declare-fun tp!16597 () Bool)

(declare-fun b_and!11221 () Bool)

(assert (=> b!186664 (= tp!16597 b_and!11221)))

(declare-fun b!186655 () Bool)

(declare-fun e!122830 () Bool)

(declare-fun e!122831 () Bool)

(assert (=> b!186655 (= e!122830 e!122831)))

(declare-fun res!88284 () Bool)

(assert (=> b!186655 (=> (not res!88284) (not e!122831))))

(declare-datatypes ((SeekEntryResult!634 0))(
  ( (MissingZero!634 (index!4706 (_ BitVec 32))) (Found!634 (index!4707 (_ BitVec 32))) (Intermediate!634 (undefined!1446 Bool) (index!4708 (_ BitVec 32)) (x!20224 (_ BitVec 32))) (Undefined!634) (MissingVacant!634 (index!4709 (_ BitVec 32))) )
))
(declare-fun lt!92342 () SeekEntryResult!634)

(get-info :version)

(assert (=> b!186655 (= res!88284 (and (not ((_ is Undefined!634) lt!92342)) (not ((_ is MissingVacant!634) lt!92342)) (not ((_ is MissingZero!634) lt!92342)) ((_ is Found!634) lt!92342)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5473 0))(
  ( (V!5474 (val!2229 Int)) )
))
(declare-datatypes ((ValueCell!1841 0))(
  ( (ValueCellFull!1841 (v!4143 V!5473)) (EmptyCell!1841) )
))
(declare-datatypes ((array!7937 0))(
  ( (array!7938 (arr!3746 (Array (_ BitVec 32) (_ BitVec 64))) (size!4063 (_ BitVec 32))) )
))
(declare-datatypes ((array!7939 0))(
  ( (array!7940 (arr!3747 (Array (_ BitVec 32) ValueCell!1841)) (size!4064 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2590 0))(
  ( (LongMapFixedSize!2591 (defaultEntry!3806 Int) (mask!8937 (_ BitVec 32)) (extraKeys!3543 (_ BitVec 32)) (zeroValue!3647 V!5473) (minValue!3647 V!5473) (_size!1344 (_ BitVec 32)) (_keys!5752 array!7937) (_values!3789 array!7939) (_vacant!1344 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2590)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7937 (_ BitVec 32)) SeekEntryResult!634)

(assert (=> b!186655 (= lt!92342 (seekEntryOrOpen!0 key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(declare-fun b!186656 () Bool)

(declare-fun e!122836 () Bool)

(assert (=> b!186656 (= e!122836 (and (= (size!4064 (_values!3789 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8937 thiss!1248))) (not (= (size!4063 (_keys!5752 thiss!1248)) (size!4064 (_values!3789 thiss!1248))))))))

(declare-fun b!186657 () Bool)

(assert (=> b!186657 (= e!122831 e!122836)))

(declare-fun res!88286 () Bool)

(assert (=> b!186657 (=> (not res!88286) (not e!122836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!186657 (= res!88286 (validMask!0 (mask!8937 thiss!1248)))))

(declare-datatypes ((Unit!5628 0))(
  ( (Unit!5629) )
))
(declare-fun lt!92343 () Unit!5628)

(declare-fun e!122838 () Unit!5628)

(assert (=> b!186657 (= lt!92343 e!122838)))

(declare-fun c!33489 () Bool)

(declare-datatypes ((tuple2!3420 0))(
  ( (tuple2!3421 (_1!1721 (_ BitVec 64)) (_2!1721 V!5473)) )
))
(declare-datatypes ((List!2344 0))(
  ( (Nil!2341) (Cons!2340 (h!2974 tuple2!3420) (t!7224 List!2344)) )
))
(declare-datatypes ((ListLongMap!2341 0))(
  ( (ListLongMap!2342 (toList!1186 List!2344)) )
))
(declare-fun contains!1296 (ListLongMap!2341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!838 (array!7937 array!7939 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 32) Int) ListLongMap!2341)

(assert (=> b!186657 (= c!33489 (contains!1296 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) key!828))))

(declare-fun b!186658 () Bool)

(declare-fun lt!92341 () Unit!5628)

(assert (=> b!186658 (= e!122838 lt!92341)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!150 (array!7937 array!7939 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5628)

(assert (=> b!186658 (= lt!92341 (lemmaInListMapThenSeekEntryOrOpenFindsIt!150 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(declare-fun res!88288 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186658 (= res!88288 (inRange!0 (index!4707 lt!92342) (mask!8937 thiss!1248)))))

(declare-fun e!122829 () Bool)

(assert (=> b!186658 (=> (not res!88288) (not e!122829))))

(assert (=> b!186658 e!122829))

(declare-fun b!186659 () Bool)

(declare-fun e!122833 () Bool)

(declare-fun tp_is_empty!4369 () Bool)

(assert (=> b!186659 (= e!122833 tp_is_empty!4369)))

(declare-fun mapIsEmpty!7522 () Bool)

(declare-fun mapRes!7522 () Bool)

(assert (=> mapIsEmpty!7522 mapRes!7522))

(declare-fun b!186660 () Bool)

(declare-fun e!122832 () Bool)

(assert (=> b!186660 (= e!122832 (and e!122833 mapRes!7522))))

(declare-fun condMapEmpty!7522 () Bool)

(declare-fun mapDefault!7522 () ValueCell!1841)

(assert (=> b!186660 (= condMapEmpty!7522 (= (arr!3747 (_values!3789 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1841)) mapDefault!7522)))))

(declare-fun b!186661 () Bool)

(declare-fun e!122837 () Bool)

(assert (=> b!186661 (= e!122837 tp_is_empty!4369)))

(declare-fun b!186662 () Bool)

(declare-fun Unit!5630 () Unit!5628)

(assert (=> b!186662 (= e!122838 Unit!5630)))

(declare-fun lt!92344 () Unit!5628)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (array!7937 array!7939 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5628)

(assert (=> b!186662 (= lt!92344 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(assert (=> b!186662 false))

(declare-fun b!186663 () Bool)

(declare-fun res!88285 () Bool)

(assert (=> b!186663 (=> (not res!88285) (not e!122830))))

(assert (=> b!186663 (= res!88285 (not (= key!828 (bvneg key!828))))))

(declare-fun e!122835 () Bool)

(declare-fun array_inv!2415 (array!7937) Bool)

(declare-fun array_inv!2416 (array!7939) Bool)

(assert (=> b!186664 (= e!122835 (and tp!16597 tp_is_empty!4369 (array_inv!2415 (_keys!5752 thiss!1248)) (array_inv!2416 (_values!3789 thiss!1248)) e!122832))))

(declare-fun b!186665 () Bool)

(assert (=> b!186665 (= e!122829 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4707 lt!92342)) key!828))))

(declare-fun res!88287 () Bool)

(assert (=> start!18908 (=> (not res!88287) (not e!122830))))

(declare-fun valid!1091 (LongMapFixedSize!2590) Bool)

(assert (=> start!18908 (= res!88287 (valid!1091 thiss!1248))))

(assert (=> start!18908 e!122830))

(assert (=> start!18908 e!122835))

(assert (=> start!18908 true))

(declare-fun mapNonEmpty!7522 () Bool)

(declare-fun tp!16596 () Bool)

(assert (=> mapNonEmpty!7522 (= mapRes!7522 (and tp!16596 e!122837))))

(declare-fun mapValue!7522 () ValueCell!1841)

(declare-fun mapKey!7522 () (_ BitVec 32))

(declare-fun mapRest!7522 () (Array (_ BitVec 32) ValueCell!1841))

(assert (=> mapNonEmpty!7522 (= (arr!3747 (_values!3789 thiss!1248)) (store mapRest!7522 mapKey!7522 mapValue!7522))))

(assert (= (and start!18908 res!88287) b!186663))

(assert (= (and b!186663 res!88285) b!186655))

(assert (= (and b!186655 res!88284) b!186657))

(assert (= (and b!186657 c!33489) b!186658))

(assert (= (and b!186657 (not c!33489)) b!186662))

(assert (= (and b!186658 res!88288) b!186665))

(assert (= (and b!186657 res!88286) b!186656))

(assert (= (and b!186660 condMapEmpty!7522) mapIsEmpty!7522))

(assert (= (and b!186660 (not condMapEmpty!7522)) mapNonEmpty!7522))

(assert (= (and mapNonEmpty!7522 ((_ is ValueCellFull!1841) mapValue!7522)) b!186661))

(assert (= (and b!186660 ((_ is ValueCellFull!1841) mapDefault!7522)) b!186659))

(assert (= b!186664 b!186660))

(assert (= start!18908 b!186664))

(declare-fun m!213741 () Bool)

(assert (=> b!186657 m!213741))

(declare-fun m!213743 () Bool)

(assert (=> b!186657 m!213743))

(assert (=> b!186657 m!213743))

(declare-fun m!213745 () Bool)

(assert (=> b!186657 m!213745))

(declare-fun m!213747 () Bool)

(assert (=> b!186665 m!213747))

(declare-fun m!213749 () Bool)

(assert (=> b!186658 m!213749))

(declare-fun m!213751 () Bool)

(assert (=> b!186658 m!213751))

(declare-fun m!213753 () Bool)

(assert (=> b!186664 m!213753))

(declare-fun m!213755 () Bool)

(assert (=> b!186664 m!213755))

(declare-fun m!213757 () Bool)

(assert (=> b!186662 m!213757))

(declare-fun m!213759 () Bool)

(assert (=> mapNonEmpty!7522 m!213759))

(declare-fun m!213761 () Bool)

(assert (=> b!186655 m!213761))

(declare-fun m!213763 () Bool)

(assert (=> start!18908 m!213763))

(check-sat (not b!186664) (not b_next!4597) (not b!186662) (not b!186658) b_and!11221 tp_is_empty!4369 (not start!18908) (not b!186655) (not mapNonEmpty!7522) (not b!186657))
(check-sat b_and!11221 (not b_next!4597))
(get-model)

(declare-fun bm!18801 () Bool)

(declare-fun c!33501 () Bool)

(declare-fun lt!92374 () SeekEntryResult!634)

(declare-fun call!18804 () Bool)

(assert (=> bm!18801 (= call!18804 (inRange!0 (ite c!33501 (index!4706 lt!92374) (index!4709 lt!92374)) (mask!8937 thiss!1248)))))

(declare-fun b!186748 () Bool)

(declare-fun e!122908 () Bool)

(declare-fun call!18805 () Bool)

(assert (=> b!186748 (= e!122908 (not call!18805))))

(declare-fun b!186749 () Bool)

(assert (=> b!186749 (and (bvsge (index!4706 lt!92374) #b00000000000000000000000000000000) (bvslt (index!4706 lt!92374) (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun res!88328 () Bool)

(assert (=> b!186749 (= res!88328 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4706 lt!92374)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186749 (=> (not res!88328) (not e!122908))))

(declare-fun bm!18802 () Bool)

(declare-fun arrayContainsKey!0 (array!7937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18802 (= call!18805 (arrayContainsKey!0 (_keys!5752 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186750 () Bool)

(declare-fun e!122910 () Bool)

(declare-fun e!122907 () Bool)

(assert (=> b!186750 (= e!122910 e!122907)))

(declare-fun c!33500 () Bool)

(assert (=> b!186750 (= c!33500 ((_ is MissingVacant!634) lt!92374))))

(declare-fun b!186751 () Bool)

(declare-fun res!88329 () Bool)

(declare-fun e!122909 () Bool)

(assert (=> b!186751 (=> (not res!88329) (not e!122909))))

(assert (=> b!186751 (= res!88329 call!18804)))

(assert (=> b!186751 (= e!122907 e!122909)))

(declare-fun d!55345 () Bool)

(assert (=> d!55345 e!122910))

(assert (=> d!55345 (= c!33501 ((_ is MissingZero!634) lt!92374))))

(assert (=> d!55345 (= lt!92374 (seekEntryOrOpen!0 key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(declare-fun lt!92373 () Unit!5628)

(declare-fun choose!996 (array!7937 array!7939 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5628)

(assert (=> d!55345 (= lt!92373 (choose!996 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(assert (=> d!55345 (validMask!0 (mask!8937 thiss!1248))))

(assert (=> d!55345 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) lt!92373)))

(declare-fun b!186752 () Bool)

(assert (=> b!186752 (= e!122909 (not call!18805))))

(declare-fun b!186753 () Bool)

(declare-fun res!88327 () Bool)

(assert (=> b!186753 (=> (not res!88327) (not e!122909))))

(assert (=> b!186753 (= res!88327 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4709 lt!92374)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186753 (and (bvsge (index!4709 lt!92374) #b00000000000000000000000000000000) (bvslt (index!4709 lt!92374) (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun b!186754 () Bool)

(assert (=> b!186754 (= e!122910 e!122908)))

(declare-fun res!88330 () Bool)

(assert (=> b!186754 (= res!88330 call!18804)))

(assert (=> b!186754 (=> (not res!88330) (not e!122908))))

(declare-fun b!186755 () Bool)

(assert (=> b!186755 (= e!122907 ((_ is Undefined!634) lt!92374))))

(assert (= (and d!55345 c!33501) b!186754))

(assert (= (and d!55345 (not c!33501)) b!186750))

(assert (= (and b!186754 res!88330) b!186749))

(assert (= (and b!186749 res!88328) b!186748))

(assert (= (and b!186750 c!33500) b!186751))

(assert (= (and b!186750 (not c!33500)) b!186755))

(assert (= (and b!186751 res!88329) b!186753))

(assert (= (and b!186753 res!88327) b!186752))

(assert (= (or b!186754 b!186751) bm!18801))

(assert (= (or b!186748 b!186752) bm!18802))

(declare-fun m!213813 () Bool)

(assert (=> bm!18801 m!213813))

(declare-fun m!213815 () Bool)

(assert (=> bm!18802 m!213815))

(assert (=> d!55345 m!213761))

(declare-fun m!213817 () Bool)

(assert (=> d!55345 m!213817))

(assert (=> d!55345 m!213741))

(declare-fun m!213819 () Bool)

(assert (=> b!186749 m!213819))

(declare-fun m!213821 () Bool)

(assert (=> b!186753 m!213821))

(assert (=> b!186662 d!55345))

(declare-fun d!55347 () Bool)

(declare-fun e!122913 () Bool)

(assert (=> d!55347 e!122913))

(declare-fun res!88335 () Bool)

(assert (=> d!55347 (=> (not res!88335) (not e!122913))))

(declare-fun lt!92379 () SeekEntryResult!634)

(assert (=> d!55347 (= res!88335 ((_ is Found!634) lt!92379))))

(assert (=> d!55347 (= lt!92379 (seekEntryOrOpen!0 key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(declare-fun lt!92380 () Unit!5628)

(declare-fun choose!997 (array!7937 array!7939 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5628)

(assert (=> d!55347 (= lt!92380 (choose!997 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(assert (=> d!55347 (validMask!0 (mask!8937 thiss!1248))))

(assert (=> d!55347 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!150 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) lt!92380)))

(declare-fun b!186760 () Bool)

(declare-fun res!88336 () Bool)

(assert (=> b!186760 (=> (not res!88336) (not e!122913))))

(assert (=> b!186760 (= res!88336 (inRange!0 (index!4707 lt!92379) (mask!8937 thiss!1248)))))

(declare-fun b!186761 () Bool)

(assert (=> b!186761 (= e!122913 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4707 lt!92379)) key!828))))

(assert (=> b!186761 (and (bvsge (index!4707 lt!92379) #b00000000000000000000000000000000) (bvslt (index!4707 lt!92379) (size!4063 (_keys!5752 thiss!1248))))))

(assert (= (and d!55347 res!88335) b!186760))

(assert (= (and b!186760 res!88336) b!186761))

(assert (=> d!55347 m!213761))

(declare-fun m!213823 () Bool)

(assert (=> d!55347 m!213823))

(assert (=> d!55347 m!213741))

(declare-fun m!213825 () Bool)

(assert (=> b!186760 m!213825))

(declare-fun m!213827 () Bool)

(assert (=> b!186761 m!213827))

(assert (=> b!186658 d!55347))

(declare-fun d!55349 () Bool)

(assert (=> d!55349 (= (inRange!0 (index!4707 lt!92342) (mask!8937 thiss!1248)) (and (bvsge (index!4707 lt!92342) #b00000000000000000000000000000000) (bvslt (index!4707 lt!92342) (bvadd (mask!8937 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186658 d!55349))

(declare-fun d!55351 () Bool)

(assert (=> d!55351 (= (validMask!0 (mask!8937 thiss!1248)) (and (or (= (mask!8937 thiss!1248) #b00000000000000000000000000000111) (= (mask!8937 thiss!1248) #b00000000000000000000000000001111) (= (mask!8937 thiss!1248) #b00000000000000000000000000011111) (= (mask!8937 thiss!1248) #b00000000000000000000000000111111) (= (mask!8937 thiss!1248) #b00000000000000000000000001111111) (= (mask!8937 thiss!1248) #b00000000000000000000000011111111) (= (mask!8937 thiss!1248) #b00000000000000000000000111111111) (= (mask!8937 thiss!1248) #b00000000000000000000001111111111) (= (mask!8937 thiss!1248) #b00000000000000000000011111111111) (= (mask!8937 thiss!1248) #b00000000000000000000111111111111) (= (mask!8937 thiss!1248) #b00000000000000000001111111111111) (= (mask!8937 thiss!1248) #b00000000000000000011111111111111) (= (mask!8937 thiss!1248) #b00000000000000000111111111111111) (= (mask!8937 thiss!1248) #b00000000000000001111111111111111) (= (mask!8937 thiss!1248) #b00000000000000011111111111111111) (= (mask!8937 thiss!1248) #b00000000000000111111111111111111) (= (mask!8937 thiss!1248) #b00000000000001111111111111111111) (= (mask!8937 thiss!1248) #b00000000000011111111111111111111) (= (mask!8937 thiss!1248) #b00000000000111111111111111111111) (= (mask!8937 thiss!1248) #b00000000001111111111111111111111) (= (mask!8937 thiss!1248) #b00000000011111111111111111111111) (= (mask!8937 thiss!1248) #b00000000111111111111111111111111) (= (mask!8937 thiss!1248) #b00000001111111111111111111111111) (= (mask!8937 thiss!1248) #b00000011111111111111111111111111) (= (mask!8937 thiss!1248) #b00000111111111111111111111111111) (= (mask!8937 thiss!1248) #b00001111111111111111111111111111) (= (mask!8937 thiss!1248) #b00011111111111111111111111111111) (= (mask!8937 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8937 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!186657 d!55351))

(declare-fun d!55353 () Bool)

(declare-fun e!122919 () Bool)

(assert (=> d!55353 e!122919))

(declare-fun res!88339 () Bool)

(assert (=> d!55353 (=> res!88339 e!122919)))

(declare-fun lt!92391 () Bool)

(assert (=> d!55353 (= res!88339 (not lt!92391))))

(declare-fun lt!92389 () Bool)

(assert (=> d!55353 (= lt!92391 lt!92389)))

(declare-fun lt!92390 () Unit!5628)

(declare-fun e!122918 () Unit!5628)

(assert (=> d!55353 (= lt!92390 e!122918)))

(declare-fun c!33504 () Bool)

(assert (=> d!55353 (= c!33504 lt!92389)))

(declare-fun containsKey!230 (List!2344 (_ BitVec 64)) Bool)

(assert (=> d!55353 (= lt!92389 (containsKey!230 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(assert (=> d!55353 (= (contains!1296 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) key!828) lt!92391)))

(declare-fun b!186768 () Bool)

(declare-fun lt!92392 () Unit!5628)

(assert (=> b!186768 (= e!122918 lt!92392)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!178 (List!2344 (_ BitVec 64)) Unit!5628)

(assert (=> b!186768 (= lt!92392 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-datatypes ((Option!233 0))(
  ( (Some!232 (v!4146 V!5473)) (None!231) )
))
(declare-fun isDefined!179 (Option!233) Bool)

(declare-fun getValueByKey!227 (List!2344 (_ BitVec 64)) Option!233)

(assert (=> b!186768 (isDefined!179 (getValueByKey!227 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-fun b!186769 () Bool)

(declare-fun Unit!5634 () Unit!5628)

(assert (=> b!186769 (= e!122918 Unit!5634)))

(declare-fun b!186770 () Bool)

(assert (=> b!186770 (= e!122919 (isDefined!179 (getValueByKey!227 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828)))))

(assert (= (and d!55353 c!33504) b!186768))

(assert (= (and d!55353 (not c!33504)) b!186769))

(assert (= (and d!55353 (not res!88339)) b!186770))

(declare-fun m!213829 () Bool)

(assert (=> d!55353 m!213829))

(declare-fun m!213831 () Bool)

(assert (=> b!186768 m!213831))

(declare-fun m!213833 () Bool)

(assert (=> b!186768 m!213833))

(assert (=> b!186768 m!213833))

(declare-fun m!213835 () Bool)

(assert (=> b!186768 m!213835))

(assert (=> b!186770 m!213833))

(assert (=> b!186770 m!213833))

(assert (=> b!186770 m!213835))

(assert (=> b!186657 d!55353))

(declare-fun b!186813 () Bool)

(declare-fun e!122956 () ListLongMap!2341)

(declare-fun call!18825 () ListLongMap!2341)

(assert (=> b!186813 (= e!122956 call!18825)))

(declare-fun b!186814 () Bool)

(declare-fun e!122955 () Bool)

(declare-fun e!122951 () Bool)

(assert (=> b!186814 (= e!122955 e!122951)))

(declare-fun c!33519 () Bool)

(assert (=> b!186814 (= c!33519 (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186815 () Bool)

(declare-fun e!122954 () Bool)

(declare-fun e!122950 () Bool)

(assert (=> b!186815 (= e!122954 e!122950)))

(declare-fun res!88359 () Bool)

(declare-fun call!18824 () Bool)

(assert (=> b!186815 (= res!88359 call!18824)))

(assert (=> b!186815 (=> (not res!88359) (not e!122950))))

(declare-fun b!186816 () Bool)

(declare-fun res!88363 () Bool)

(assert (=> b!186816 (=> (not res!88363) (not e!122955))))

(assert (=> b!186816 (= res!88363 e!122954)))

(declare-fun c!33521 () Bool)

(assert (=> b!186816 (= c!33521 (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186817 () Bool)

(declare-fun e!122958 () Bool)

(declare-fun lt!92451 () ListLongMap!2341)

(declare-fun apply!169 (ListLongMap!2341 (_ BitVec 64)) V!5473)

(declare-fun get!2163 (ValueCell!1841 V!5473) V!5473)

(declare-fun dynLambda!512 (Int (_ BitVec 64)) V!5473)

(assert (=> b!186817 (= e!122958 (= (apply!169 lt!92451 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)) (get!2163 (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4064 (_values!3789 thiss!1248))))))

(assert (=> b!186817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun b!186818 () Bool)

(declare-fun e!122953 () Bool)

(assert (=> b!186818 (= e!122953 e!122958)))

(declare-fun res!88365 () Bool)

(assert (=> b!186818 (=> (not res!88365) (not e!122958))))

(assert (=> b!186818 (= res!88365 (contains!1296 lt!92451 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186818 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun b!186819 () Bool)

(declare-fun e!122948 () ListLongMap!2341)

(assert (=> b!186819 (= e!122948 e!122956)))

(declare-fun c!33518 () Bool)

(assert (=> b!186819 (= c!33518 (and (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18818 () Bool)

(declare-fun call!18820 () ListLongMap!2341)

(assert (=> bm!18818 (= call!18825 call!18820)))

(declare-fun b!186820 () Bool)

(declare-fun e!122949 () ListLongMap!2341)

(declare-fun call!18826 () ListLongMap!2341)

(assert (=> b!186820 (= e!122949 call!18826)))

(declare-fun bm!18819 () Bool)

(declare-fun call!18822 () ListLongMap!2341)

(declare-fun c!33517 () Bool)

(declare-fun call!18823 () ListLongMap!2341)

(declare-fun +!289 (ListLongMap!2341 tuple2!3420) ListLongMap!2341)

(assert (=> bm!18819 (= call!18820 (+!289 (ite c!33517 call!18823 (ite c!33518 call!18822 call!18826)) (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(declare-fun b!186821 () Bool)

(declare-fun c!33520 () Bool)

(assert (=> b!186821 (= c!33520 (and (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!186821 (= e!122956 e!122949)))

(declare-fun bm!18820 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!200 (array!7937 array!7939 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 32) Int) ListLongMap!2341)

(assert (=> bm!18820 (= call!18823 (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun b!186822 () Bool)

(declare-fun e!122947 () Unit!5628)

(declare-fun lt!92458 () Unit!5628)

(assert (=> b!186822 (= e!122947 lt!92458)))

(declare-fun lt!92453 () ListLongMap!2341)

(assert (=> b!186822 (= lt!92453 (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92455 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92455 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92447 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92447 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92438 () Unit!5628)

(declare-fun addStillContains!145 (ListLongMap!2341 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5628)

(assert (=> b!186822 (= lt!92438 (addStillContains!145 lt!92453 lt!92455 (zeroValue!3647 thiss!1248) lt!92447))))

(assert (=> b!186822 (contains!1296 (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))) lt!92447)))

(declare-fun lt!92442 () Unit!5628)

(assert (=> b!186822 (= lt!92442 lt!92438)))

(declare-fun lt!92457 () ListLongMap!2341)

(assert (=> b!186822 (= lt!92457 (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92445 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92446 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92446 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92449 () Unit!5628)

(declare-fun addApplyDifferent!145 (ListLongMap!2341 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5628)

(assert (=> b!186822 (= lt!92449 (addApplyDifferent!145 lt!92457 lt!92445 (minValue!3647 thiss!1248) lt!92446))))

(assert (=> b!186822 (= (apply!169 (+!289 lt!92457 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))) lt!92446) (apply!169 lt!92457 lt!92446))))

(declare-fun lt!92450 () Unit!5628)

(assert (=> b!186822 (= lt!92450 lt!92449)))

(declare-fun lt!92452 () ListLongMap!2341)

(assert (=> b!186822 (= lt!92452 (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92437 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92437 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92440 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92440 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92444 () Unit!5628)

(assert (=> b!186822 (= lt!92444 (addApplyDifferent!145 lt!92452 lt!92437 (zeroValue!3647 thiss!1248) lt!92440))))

(assert (=> b!186822 (= (apply!169 (+!289 lt!92452 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))) lt!92440) (apply!169 lt!92452 lt!92440))))

(declare-fun lt!92456 () Unit!5628)

(assert (=> b!186822 (= lt!92456 lt!92444)))

(declare-fun lt!92448 () ListLongMap!2341)

(assert (=> b!186822 (= lt!92448 (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92441 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92441 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92454 () (_ BitVec 64))

(assert (=> b!186822 (= lt!92454 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186822 (= lt!92458 (addApplyDifferent!145 lt!92448 lt!92441 (minValue!3647 thiss!1248) lt!92454))))

(assert (=> b!186822 (= (apply!169 (+!289 lt!92448 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))) lt!92454) (apply!169 lt!92448 lt!92454))))

(declare-fun b!186823 () Bool)

(declare-fun call!18821 () Bool)

(assert (=> b!186823 (= e!122951 (not call!18821))))

(declare-fun b!186824 () Bool)

(assert (=> b!186824 (= e!122950 (= (apply!169 lt!92451 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3647 thiss!1248)))))

(declare-fun b!186825 () Bool)

(declare-fun Unit!5635 () Unit!5628)

(assert (=> b!186825 (= e!122947 Unit!5635)))

(declare-fun bm!18821 () Bool)

(assert (=> bm!18821 (= call!18821 (contains!1296 lt!92451 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186826 () Bool)

(declare-fun e!122957 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186826 (= e!122957 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186827 () Bool)

(declare-fun res!88358 () Bool)

(assert (=> b!186827 (=> (not res!88358) (not e!122955))))

(assert (=> b!186827 (= res!88358 e!122953)))

(declare-fun res!88361 () Bool)

(assert (=> b!186827 (=> res!88361 e!122953)))

(declare-fun e!122952 () Bool)

(assert (=> b!186827 (= res!88361 (not e!122952))))

(declare-fun res!88366 () Bool)

(assert (=> b!186827 (=> (not res!88366) (not e!122952))))

(assert (=> b!186827 (= res!88366 (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun b!186828 () Bool)

(declare-fun e!122946 () Bool)

(assert (=> b!186828 (= e!122946 (= (apply!169 lt!92451 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3647 thiss!1248)))))

(declare-fun bm!18822 () Bool)

(assert (=> bm!18822 (= call!18824 (contains!1296 lt!92451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186829 () Bool)

(assert (=> b!186829 (= e!122952 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186830 () Bool)

(assert (=> b!186830 (= e!122951 e!122946)))

(declare-fun res!88362 () Bool)

(assert (=> b!186830 (= res!88362 call!18821)))

(assert (=> b!186830 (=> (not res!88362) (not e!122946))))

(declare-fun b!186831 () Bool)

(assert (=> b!186831 (= e!122949 call!18825)))

(declare-fun b!186832 () Bool)

(assert (=> b!186832 (= e!122954 (not call!18824))))

(declare-fun b!186833 () Bool)

(assert (=> b!186833 (= e!122948 (+!289 call!18820 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))

(declare-fun bm!18823 () Bool)

(assert (=> bm!18823 (= call!18826 call!18822)))

(declare-fun bm!18817 () Bool)

(assert (=> bm!18817 (= call!18822 call!18823)))

(declare-fun d!55355 () Bool)

(assert (=> d!55355 e!122955))

(declare-fun res!88360 () Bool)

(assert (=> d!55355 (=> (not res!88360) (not e!122955))))

(assert (=> d!55355 (= res!88360 (or (bvsge #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))))

(declare-fun lt!92443 () ListLongMap!2341)

(assert (=> d!55355 (= lt!92451 lt!92443)))

(declare-fun lt!92439 () Unit!5628)

(assert (=> d!55355 (= lt!92439 e!122947)))

(declare-fun c!33522 () Bool)

(assert (=> d!55355 (= c!33522 e!122957)))

(declare-fun res!88364 () Bool)

(assert (=> d!55355 (=> (not res!88364) (not e!122957))))

(assert (=> d!55355 (= res!88364 (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> d!55355 (= lt!92443 e!122948)))

(assert (=> d!55355 (= c!33517 (and (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55355 (validMask!0 (mask!8937 thiss!1248))))

(assert (=> d!55355 (= (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) lt!92451)))

(assert (= (and d!55355 c!33517) b!186833))

(assert (= (and d!55355 (not c!33517)) b!186819))

(assert (= (and b!186819 c!33518) b!186813))

(assert (= (and b!186819 (not c!33518)) b!186821))

(assert (= (and b!186821 c!33520) b!186831))

(assert (= (and b!186821 (not c!33520)) b!186820))

(assert (= (or b!186831 b!186820) bm!18823))

(assert (= (or b!186813 bm!18823) bm!18817))

(assert (= (or b!186813 b!186831) bm!18818))

(assert (= (or b!186833 bm!18817) bm!18820))

(assert (= (or b!186833 bm!18818) bm!18819))

(assert (= (and d!55355 res!88364) b!186826))

(assert (= (and d!55355 c!33522) b!186822))

(assert (= (and d!55355 (not c!33522)) b!186825))

(assert (= (and d!55355 res!88360) b!186827))

(assert (= (and b!186827 res!88366) b!186829))

(assert (= (and b!186827 (not res!88361)) b!186818))

(assert (= (and b!186818 res!88365) b!186817))

(assert (= (and b!186827 res!88358) b!186816))

(assert (= (and b!186816 c!33521) b!186815))

(assert (= (and b!186816 (not c!33521)) b!186832))

(assert (= (and b!186815 res!88359) b!186824))

(assert (= (or b!186815 b!186832) bm!18822))

(assert (= (and b!186816 res!88363) b!186814))

(assert (= (and b!186814 c!33519) b!186830))

(assert (= (and b!186814 (not c!33519)) b!186823))

(assert (= (and b!186830 res!88362) b!186828))

(assert (= (or b!186830 b!186823) bm!18821))

(declare-fun b_lambda!7293 () Bool)

(assert (=> (not b_lambda!7293) (not b!186817)))

(declare-fun t!7227 () Bool)

(declare-fun tb!2841 () Bool)

(assert (=> (and b!186664 (= (defaultEntry!3806 thiss!1248) (defaultEntry!3806 thiss!1248)) t!7227) tb!2841))

(declare-fun result!4817 () Bool)

(assert (=> tb!2841 (= result!4817 tp_is_empty!4369)))

(assert (=> b!186817 t!7227))

(declare-fun b_and!11227 () Bool)

(assert (= b_and!11221 (and (=> t!7227 result!4817) b_and!11227)))

(declare-fun m!213837 () Bool)

(assert (=> bm!18822 m!213837))

(assert (=> d!55355 m!213741))

(declare-fun m!213839 () Bool)

(assert (=> b!186828 m!213839))

(declare-fun m!213841 () Bool)

(assert (=> b!186833 m!213841))

(declare-fun m!213843 () Bool)

(assert (=> bm!18820 m!213843))

(declare-fun m!213845 () Bool)

(assert (=> bm!18819 m!213845))

(declare-fun m!213847 () Bool)

(assert (=> bm!18821 m!213847))

(declare-fun m!213849 () Bool)

(assert (=> b!186824 m!213849))

(declare-fun m!213851 () Bool)

(assert (=> b!186822 m!213851))

(declare-fun m!213853 () Bool)

(assert (=> b!186822 m!213853))

(declare-fun m!213855 () Bool)

(assert (=> b!186822 m!213855))

(declare-fun m!213857 () Bool)

(assert (=> b!186822 m!213857))

(declare-fun m!213859 () Bool)

(assert (=> b!186822 m!213859))

(declare-fun m!213861 () Bool)

(assert (=> b!186822 m!213861))

(assert (=> b!186822 m!213855))

(declare-fun m!213863 () Bool)

(assert (=> b!186822 m!213863))

(declare-fun m!213865 () Bool)

(assert (=> b!186822 m!213865))

(declare-fun m!213867 () Bool)

(assert (=> b!186822 m!213867))

(declare-fun m!213869 () Bool)

(assert (=> b!186822 m!213869))

(declare-fun m!213871 () Bool)

(assert (=> b!186822 m!213871))

(assert (=> b!186822 m!213859))

(declare-fun m!213873 () Bool)

(assert (=> b!186822 m!213873))

(assert (=> b!186822 m!213851))

(declare-fun m!213875 () Bool)

(assert (=> b!186822 m!213875))

(declare-fun m!213877 () Bool)

(assert (=> b!186822 m!213877))

(declare-fun m!213879 () Bool)

(assert (=> b!186822 m!213879))

(assert (=> b!186822 m!213867))

(declare-fun m!213881 () Bool)

(assert (=> b!186822 m!213881))

(assert (=> b!186822 m!213843))

(assert (=> b!186829 m!213861))

(assert (=> b!186829 m!213861))

(declare-fun m!213883 () Bool)

(assert (=> b!186829 m!213883))

(assert (=> b!186826 m!213861))

(assert (=> b!186826 m!213861))

(assert (=> b!186826 m!213883))

(assert (=> b!186818 m!213861))

(assert (=> b!186818 m!213861))

(declare-fun m!213885 () Bool)

(assert (=> b!186818 m!213885))

(declare-fun m!213887 () Bool)

(assert (=> b!186817 m!213887))

(declare-fun m!213889 () Bool)

(assert (=> b!186817 m!213889))

(assert (=> b!186817 m!213889))

(assert (=> b!186817 m!213887))

(declare-fun m!213891 () Bool)

(assert (=> b!186817 m!213891))

(assert (=> b!186817 m!213861))

(declare-fun m!213893 () Bool)

(assert (=> b!186817 m!213893))

(assert (=> b!186817 m!213861))

(assert (=> b!186657 d!55355))

(declare-fun b!186848 () Bool)

(declare-fun e!122967 () SeekEntryResult!634)

(declare-fun lt!92466 () SeekEntryResult!634)

(assert (=> b!186848 (= e!122967 (MissingZero!634 (index!4708 lt!92466)))))

(declare-fun b!186849 () Bool)

(declare-fun e!122966 () SeekEntryResult!634)

(assert (=> b!186849 (= e!122966 Undefined!634)))

(declare-fun b!186850 () Bool)

(declare-fun e!122965 () SeekEntryResult!634)

(assert (=> b!186850 (= e!122965 (Found!634 (index!4708 lt!92466)))))

(declare-fun d!55357 () Bool)

(declare-fun lt!92467 () SeekEntryResult!634)

(assert (=> d!55357 (and (or ((_ is Undefined!634) lt!92467) (not ((_ is Found!634) lt!92467)) (and (bvsge (index!4707 lt!92467) #b00000000000000000000000000000000) (bvslt (index!4707 lt!92467) (size!4063 (_keys!5752 thiss!1248))))) (or ((_ is Undefined!634) lt!92467) ((_ is Found!634) lt!92467) (not ((_ is MissingZero!634) lt!92467)) (and (bvsge (index!4706 lt!92467) #b00000000000000000000000000000000) (bvslt (index!4706 lt!92467) (size!4063 (_keys!5752 thiss!1248))))) (or ((_ is Undefined!634) lt!92467) ((_ is Found!634) lt!92467) ((_ is MissingZero!634) lt!92467) (not ((_ is MissingVacant!634) lt!92467)) (and (bvsge (index!4709 lt!92467) #b00000000000000000000000000000000) (bvslt (index!4709 lt!92467) (size!4063 (_keys!5752 thiss!1248))))) (or ((_ is Undefined!634) lt!92467) (ite ((_ is Found!634) lt!92467) (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4707 lt!92467)) key!828) (ite ((_ is MissingZero!634) lt!92467) (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4706 lt!92467)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!634) lt!92467) (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4709 lt!92467)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55357 (= lt!92467 e!122966)))

(declare-fun c!33531 () Bool)

(assert (=> d!55357 (= c!33531 (and ((_ is Intermediate!634) lt!92466) (undefined!1446 lt!92466)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7937 (_ BitVec 32)) SeekEntryResult!634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55357 (= lt!92466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8937 thiss!1248)) key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(assert (=> d!55357 (validMask!0 (mask!8937 thiss!1248))))

(assert (=> d!55357 (= (seekEntryOrOpen!0 key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)) lt!92467)))

(declare-fun b!186851 () Bool)

(assert (=> b!186851 (= e!122966 e!122965)))

(declare-fun lt!92465 () (_ BitVec 64))

(assert (=> b!186851 (= lt!92465 (select (arr!3746 (_keys!5752 thiss!1248)) (index!4708 lt!92466)))))

(declare-fun c!33529 () Bool)

(assert (=> b!186851 (= c!33529 (= lt!92465 key!828))))

(declare-fun b!186852 () Bool)

(declare-fun c!33530 () Bool)

(assert (=> b!186852 (= c!33530 (= lt!92465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186852 (= e!122965 e!122967)))

(declare-fun b!186853 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7937 (_ BitVec 32)) SeekEntryResult!634)

(assert (=> b!186853 (= e!122967 (seekKeyOrZeroReturnVacant!0 (x!20224 lt!92466) (index!4708 lt!92466) (index!4708 lt!92466) key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(assert (= (and d!55357 c!33531) b!186849))

(assert (= (and d!55357 (not c!33531)) b!186851))

(assert (= (and b!186851 c!33529) b!186850))

(assert (= (and b!186851 (not c!33529)) b!186852))

(assert (= (and b!186852 c!33530) b!186848))

(assert (= (and b!186852 (not c!33530)) b!186853))

(declare-fun m!213895 () Bool)

(assert (=> d!55357 m!213895))

(declare-fun m!213897 () Bool)

(assert (=> d!55357 m!213897))

(declare-fun m!213899 () Bool)

(assert (=> d!55357 m!213899))

(declare-fun m!213901 () Bool)

(assert (=> d!55357 m!213901))

(assert (=> d!55357 m!213741))

(assert (=> d!55357 m!213895))

(declare-fun m!213903 () Bool)

(assert (=> d!55357 m!213903))

(declare-fun m!213905 () Bool)

(assert (=> b!186851 m!213905))

(declare-fun m!213907 () Bool)

(assert (=> b!186853 m!213907))

(assert (=> b!186655 d!55357))

(declare-fun d!55359 () Bool)

(declare-fun res!88373 () Bool)

(declare-fun e!122970 () Bool)

(assert (=> d!55359 (=> (not res!88373) (not e!122970))))

(declare-fun simpleValid!185 (LongMapFixedSize!2590) Bool)

(assert (=> d!55359 (= res!88373 (simpleValid!185 thiss!1248))))

(assert (=> d!55359 (= (valid!1091 thiss!1248) e!122970)))

(declare-fun b!186860 () Bool)

(declare-fun res!88374 () Bool)

(assert (=> b!186860 (=> (not res!88374) (not e!122970))))

(declare-fun arrayCountValidKeys!0 (array!7937 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186860 (= res!88374 (= (arrayCountValidKeys!0 (_keys!5752 thiss!1248) #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))) (_size!1344 thiss!1248)))))

(declare-fun b!186861 () Bool)

(declare-fun res!88375 () Bool)

(assert (=> b!186861 (=> (not res!88375) (not e!122970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7937 (_ BitVec 32)) Bool)

(assert (=> b!186861 (= res!88375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(declare-fun b!186862 () Bool)

(declare-datatypes ((List!2346 0))(
  ( (Nil!2343) (Cons!2342 (h!2976 (_ BitVec 64)) (t!7228 List!2346)) )
))
(declare-fun arrayNoDuplicates!0 (array!7937 (_ BitVec 32) List!2346) Bool)

(assert (=> b!186862 (= e!122970 (arrayNoDuplicates!0 (_keys!5752 thiss!1248) #b00000000000000000000000000000000 Nil!2343))))

(assert (= (and d!55359 res!88373) b!186860))

(assert (= (and b!186860 res!88374) b!186861))

(assert (= (and b!186861 res!88375) b!186862))

(declare-fun m!213909 () Bool)

(assert (=> d!55359 m!213909))

(declare-fun m!213911 () Bool)

(assert (=> b!186860 m!213911))

(declare-fun m!213913 () Bool)

(assert (=> b!186861 m!213913))

(declare-fun m!213915 () Bool)

(assert (=> b!186862 m!213915))

(assert (=> start!18908 d!55359))

(declare-fun d!55361 () Bool)

(assert (=> d!55361 (= (array_inv!2415 (_keys!5752 thiss!1248)) (bvsge (size!4063 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186664 d!55361))

(declare-fun d!55363 () Bool)

(assert (=> d!55363 (= (array_inv!2416 (_values!3789 thiss!1248)) (bvsge (size!4064 (_values!3789 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186664 d!55363))

(declare-fun mapNonEmpty!7531 () Bool)

(declare-fun mapRes!7531 () Bool)

(declare-fun tp!16612 () Bool)

(declare-fun e!122975 () Bool)

(assert (=> mapNonEmpty!7531 (= mapRes!7531 (and tp!16612 e!122975))))

(declare-fun mapKey!7531 () (_ BitVec 32))

(declare-fun mapRest!7531 () (Array (_ BitVec 32) ValueCell!1841))

(declare-fun mapValue!7531 () ValueCell!1841)

(assert (=> mapNonEmpty!7531 (= mapRest!7522 (store mapRest!7531 mapKey!7531 mapValue!7531))))

(declare-fun b!186870 () Bool)

(declare-fun e!122976 () Bool)

(assert (=> b!186870 (= e!122976 tp_is_empty!4369)))

(declare-fun mapIsEmpty!7531 () Bool)

(assert (=> mapIsEmpty!7531 mapRes!7531))

(declare-fun b!186869 () Bool)

(assert (=> b!186869 (= e!122975 tp_is_empty!4369)))

(declare-fun condMapEmpty!7531 () Bool)

(declare-fun mapDefault!7531 () ValueCell!1841)

(assert (=> mapNonEmpty!7522 (= condMapEmpty!7531 (= mapRest!7522 ((as const (Array (_ BitVec 32) ValueCell!1841)) mapDefault!7531)))))

(assert (=> mapNonEmpty!7522 (= tp!16596 (and e!122976 mapRes!7531))))

(assert (= (and mapNonEmpty!7522 condMapEmpty!7531) mapIsEmpty!7531))

(assert (= (and mapNonEmpty!7522 (not condMapEmpty!7531)) mapNonEmpty!7531))

(assert (= (and mapNonEmpty!7531 ((_ is ValueCellFull!1841) mapValue!7531)) b!186869))

(assert (= (and mapNonEmpty!7522 ((_ is ValueCellFull!1841) mapDefault!7531)) b!186870))

(declare-fun m!213917 () Bool)

(assert (=> mapNonEmpty!7531 m!213917))

(declare-fun b_lambda!7295 () Bool)

(assert (= b_lambda!7293 (or (and b!186664 b_free!4597) b_lambda!7295)))

(check-sat (not d!55357) (not b!186861) (not b!186770) (not b_lambda!7295) (not d!55353) (not b!186826) (not mapNonEmpty!7531) (not b!186833) (not bm!18801) (not b!186860) (not bm!18819) (not bm!18821) (not b!186862) (not b!186817) (not bm!18822) (not d!55347) (not d!55345) (not b!186818) (not b_next!4597) b_and!11227 (not bm!18820) (not b!186822) (not b!186824) (not bm!18802) (not b!186829) (not b!186828) tp_is_empty!4369 (not d!55355) (not d!55359) (not b!186768) (not b!186760) (not b!186853))
(check-sat b_and!11227 (not b_next!4597))
(get-model)

(declare-fun d!55365 () Bool)

(declare-fun get!2164 (Option!233) V!5473)

(assert (=> d!55365 (= (apply!169 lt!92457 lt!92446) (get!2164 (getValueByKey!227 (toList!1186 lt!92457) lt!92446)))))

(declare-fun bs!7564 () Bool)

(assert (= bs!7564 d!55365))

(declare-fun m!213919 () Bool)

(assert (=> bs!7564 m!213919))

(assert (=> bs!7564 m!213919))

(declare-fun m!213921 () Bool)

(assert (=> bs!7564 m!213921))

(assert (=> b!186822 d!55365))

(declare-fun b!186895 () Bool)

(declare-fun e!122994 () Bool)

(declare-fun lt!92483 () ListLongMap!2341)

(declare-fun isEmpty!479 (ListLongMap!2341) Bool)

(assert (=> b!186895 (= e!122994 (isEmpty!479 lt!92483))))

(declare-fun b!186896 () Bool)

(declare-fun lt!92482 () Unit!5628)

(declare-fun lt!92484 () Unit!5628)

(assert (=> b!186896 (= lt!92482 lt!92484)))

(declare-fun lt!92486 () (_ BitVec 64))

(declare-fun lt!92487 () (_ BitVec 64))

(declare-fun lt!92488 () ListLongMap!2341)

(declare-fun lt!92485 () V!5473)

(assert (=> b!186896 (not (contains!1296 (+!289 lt!92488 (tuple2!3421 lt!92487 lt!92485)) lt!92486))))

(declare-fun addStillNotContains!92 (ListLongMap!2341 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5628)

(assert (=> b!186896 (= lt!92484 (addStillNotContains!92 lt!92488 lt!92487 lt!92485 lt!92486))))

(assert (=> b!186896 (= lt!92486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!186896 (= lt!92485 (get!2163 (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186896 (= lt!92487 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18829 () ListLongMap!2341)

(assert (=> b!186896 (= lt!92488 call!18829)))

(declare-fun e!122997 () ListLongMap!2341)

(assert (=> b!186896 (= e!122997 (+!289 call!18829 (tuple2!3421 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000) (get!2163 (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!186897 () Bool)

(declare-fun e!122995 () Bool)

(declare-fun e!122993 () Bool)

(assert (=> b!186897 (= e!122995 e!122993)))

(declare-fun c!33543 () Bool)

(declare-fun e!122996 () Bool)

(assert (=> b!186897 (= c!33543 e!122996)))

(declare-fun res!88386 () Bool)

(assert (=> b!186897 (=> (not res!88386) (not e!122996))))

(assert (=> b!186897 (= res!88386 (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun b!186898 () Bool)

(assert (=> b!186898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> b!186898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4064 (_values!3789 thiss!1248))))))

(declare-fun e!122991 () Bool)

(assert (=> b!186898 (= e!122991 (= (apply!169 lt!92483 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)) (get!2163 (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!186899 () Bool)

(declare-fun res!88385 () Bool)

(assert (=> b!186899 (=> (not res!88385) (not e!122995))))

(assert (=> b!186899 (= res!88385 (not (contains!1296 lt!92483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186900 () Bool)

(declare-fun e!122992 () ListLongMap!2341)

(assert (=> b!186900 (= e!122992 e!122997)))

(declare-fun c!33542 () Bool)

(assert (=> b!186900 (= c!33542 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186901 () Bool)

(assert (=> b!186901 (= e!122992 (ListLongMap!2342 Nil!2341))))

(declare-fun b!186902 () Bool)

(assert (=> b!186902 (= e!122994 (= lt!92483 (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3806 thiss!1248))))))

(declare-fun b!186903 () Bool)

(assert (=> b!186903 (= e!122997 call!18829)))

(declare-fun bm!18826 () Bool)

(assert (=> bm!18826 (= call!18829 (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3806 thiss!1248)))))

(declare-fun d!55367 () Bool)

(assert (=> d!55367 e!122995))

(declare-fun res!88387 () Bool)

(assert (=> d!55367 (=> (not res!88387) (not e!122995))))

(assert (=> d!55367 (= res!88387 (not (contains!1296 lt!92483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55367 (= lt!92483 e!122992)))

(declare-fun c!33540 () Bool)

(assert (=> d!55367 (= c!33540 (bvsge #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> d!55367 (validMask!0 (mask!8937 thiss!1248))))

(assert (=> d!55367 (= (getCurrentListMapNoExtraKeys!200 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) lt!92483)))

(declare-fun b!186904 () Bool)

(assert (=> b!186904 (= e!122993 e!122994)))

(declare-fun c!33541 () Bool)

(assert (=> b!186904 (= c!33541 (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun b!186905 () Bool)

(assert (=> b!186905 (= e!122993 e!122991)))

(assert (=> b!186905 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun res!88384 () Bool)

(assert (=> b!186905 (= res!88384 (contains!1296 lt!92483 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186905 (=> (not res!88384) (not e!122991))))

(declare-fun b!186906 () Bool)

(assert (=> b!186906 (= e!122996 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186906 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!55367 c!33540) b!186901))

(assert (= (and d!55367 (not c!33540)) b!186900))

(assert (= (and b!186900 c!33542) b!186896))

(assert (= (and b!186900 (not c!33542)) b!186903))

(assert (= (or b!186896 b!186903) bm!18826))

(assert (= (and d!55367 res!88387) b!186899))

(assert (= (and b!186899 res!88385) b!186897))

(assert (= (and b!186897 res!88386) b!186906))

(assert (= (and b!186897 c!33543) b!186905))

(assert (= (and b!186897 (not c!33543)) b!186904))

(assert (= (and b!186905 res!88384) b!186898))

(assert (= (and b!186904 c!33541) b!186902))

(assert (= (and b!186904 (not c!33541)) b!186895))

(declare-fun b_lambda!7297 () Bool)

(assert (=> (not b_lambda!7297) (not b!186896)))

(assert (=> b!186896 t!7227))

(declare-fun b_and!11229 () Bool)

(assert (= b_and!11227 (and (=> t!7227 result!4817) b_and!11229)))

(declare-fun b_lambda!7299 () Bool)

(assert (=> (not b_lambda!7299) (not b!186898)))

(assert (=> b!186898 t!7227))

(declare-fun b_and!11231 () Bool)

(assert (= b_and!11229 (and (=> t!7227 result!4817) b_and!11231)))

(declare-fun m!213923 () Bool)

(assert (=> bm!18826 m!213923))

(assert (=> b!186905 m!213861))

(assert (=> b!186905 m!213861))

(declare-fun m!213925 () Bool)

(assert (=> b!186905 m!213925))

(assert (=> b!186898 m!213889))

(assert (=> b!186898 m!213889))

(assert (=> b!186898 m!213887))

(assert (=> b!186898 m!213891))

(assert (=> b!186898 m!213887))

(assert (=> b!186898 m!213861))

(declare-fun m!213927 () Bool)

(assert (=> b!186898 m!213927))

(assert (=> b!186898 m!213861))

(assert (=> b!186900 m!213861))

(assert (=> b!186900 m!213861))

(assert (=> b!186900 m!213883))

(assert (=> b!186906 m!213861))

(assert (=> b!186906 m!213861))

(assert (=> b!186906 m!213883))

(assert (=> b!186902 m!213923))

(declare-fun m!213929 () Bool)

(assert (=> b!186896 m!213929))

(declare-fun m!213931 () Bool)

(assert (=> b!186896 m!213931))

(assert (=> b!186896 m!213889))

(assert (=> b!186896 m!213889))

(assert (=> b!186896 m!213887))

(assert (=> b!186896 m!213891))

(assert (=> b!186896 m!213887))

(assert (=> b!186896 m!213931))

(declare-fun m!213933 () Bool)

(assert (=> b!186896 m!213933))

(assert (=> b!186896 m!213861))

(declare-fun m!213935 () Bool)

(assert (=> b!186896 m!213935))

(declare-fun m!213937 () Bool)

(assert (=> b!186895 m!213937))

(declare-fun m!213939 () Bool)

(assert (=> d!55367 m!213939))

(assert (=> d!55367 m!213741))

(declare-fun m!213941 () Bool)

(assert (=> b!186899 m!213941))

(assert (=> b!186822 d!55367))

(declare-fun d!55369 () Bool)

(assert (=> d!55369 (= (apply!169 (+!289 lt!92448 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))) lt!92454) (apply!169 lt!92448 lt!92454))))

(declare-fun lt!92491 () Unit!5628)

(declare-fun choose!998 (ListLongMap!2341 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5628)

(assert (=> d!55369 (= lt!92491 (choose!998 lt!92448 lt!92441 (minValue!3647 thiss!1248) lt!92454))))

(declare-fun e!123000 () Bool)

(assert (=> d!55369 e!123000))

(declare-fun res!88390 () Bool)

(assert (=> d!55369 (=> (not res!88390) (not e!123000))))

(assert (=> d!55369 (= res!88390 (contains!1296 lt!92448 lt!92454))))

(assert (=> d!55369 (= (addApplyDifferent!145 lt!92448 lt!92441 (minValue!3647 thiss!1248) lt!92454) lt!92491)))

(declare-fun b!186910 () Bool)

(assert (=> b!186910 (= e!123000 (not (= lt!92454 lt!92441)))))

(assert (= (and d!55369 res!88390) b!186910))

(declare-fun m!213943 () Bool)

(assert (=> d!55369 m!213943))

(declare-fun m!213945 () Bool)

(assert (=> d!55369 m!213945))

(assert (=> d!55369 m!213851))

(assert (=> d!55369 m!213875))

(assert (=> d!55369 m!213879))

(assert (=> d!55369 m!213851))

(assert (=> b!186822 d!55369))

(declare-fun d!55371 () Bool)

(assert (=> d!55371 (= (apply!169 lt!92452 lt!92440) (get!2164 (getValueByKey!227 (toList!1186 lt!92452) lt!92440)))))

(declare-fun bs!7565 () Bool)

(assert (= bs!7565 d!55371))

(declare-fun m!213947 () Bool)

(assert (=> bs!7565 m!213947))

(assert (=> bs!7565 m!213947))

(declare-fun m!213949 () Bool)

(assert (=> bs!7565 m!213949))

(assert (=> b!186822 d!55371))

(declare-fun d!55373 () Bool)

(assert (=> d!55373 (= (apply!169 (+!289 lt!92452 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))) lt!92440) (apply!169 lt!92452 lt!92440))))

(declare-fun lt!92492 () Unit!5628)

(assert (=> d!55373 (= lt!92492 (choose!998 lt!92452 lt!92437 (zeroValue!3647 thiss!1248) lt!92440))))

(declare-fun e!123001 () Bool)

(assert (=> d!55373 e!123001))

(declare-fun res!88391 () Bool)

(assert (=> d!55373 (=> (not res!88391) (not e!123001))))

(assert (=> d!55373 (= res!88391 (contains!1296 lt!92452 lt!92440))))

(assert (=> d!55373 (= (addApplyDifferent!145 lt!92452 lt!92437 (zeroValue!3647 thiss!1248) lt!92440) lt!92492)))

(declare-fun b!186911 () Bool)

(assert (=> b!186911 (= e!123001 (not (= lt!92440 lt!92437)))))

(assert (= (and d!55373 res!88391) b!186911))

(declare-fun m!213951 () Bool)

(assert (=> d!55373 m!213951))

(declare-fun m!213953 () Bool)

(assert (=> d!55373 m!213953))

(assert (=> d!55373 m!213859))

(assert (=> d!55373 m!213873))

(assert (=> d!55373 m!213877))

(assert (=> d!55373 m!213859))

(assert (=> b!186822 d!55373))

(declare-fun d!55375 () Bool)

(declare-fun e!123004 () Bool)

(assert (=> d!55375 e!123004))

(declare-fun res!88396 () Bool)

(assert (=> d!55375 (=> (not res!88396) (not e!123004))))

(declare-fun lt!92504 () ListLongMap!2341)

(assert (=> d!55375 (= res!88396 (contains!1296 lt!92504 (_1!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248)))))))

(declare-fun lt!92503 () List!2344)

(assert (=> d!55375 (= lt!92504 (ListLongMap!2342 lt!92503))))

(declare-fun lt!92502 () Unit!5628)

(declare-fun lt!92501 () Unit!5628)

(assert (=> d!55375 (= lt!92502 lt!92501)))

(assert (=> d!55375 (= (getValueByKey!227 lt!92503 (_1!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!119 (List!2344 (_ BitVec 64) V!5473) Unit!5628)

(assert (=> d!55375 (= lt!92501 (lemmaContainsTupThenGetReturnValue!119 lt!92503 (_1!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248)))))))

(declare-fun insertStrictlySorted!122 (List!2344 (_ BitVec 64) V!5473) List!2344)

(assert (=> d!55375 (= lt!92503 (insertStrictlySorted!122 (toList!1186 lt!92452) (_1!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55375 (= (+!289 lt!92452 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))) lt!92504)))

(declare-fun b!186916 () Bool)

(declare-fun res!88397 () Bool)

(assert (=> b!186916 (=> (not res!88397) (not e!123004))))

(assert (=> b!186916 (= res!88397 (= (getValueByKey!227 (toList!1186 lt!92504) (_1!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))))))))

(declare-fun b!186917 () Bool)

(declare-fun contains!1298 (List!2344 tuple2!3420) Bool)

(assert (=> b!186917 (= e!123004 (contains!1298 (toList!1186 lt!92504) (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))))))

(assert (= (and d!55375 res!88396) b!186916))

(assert (= (and b!186916 res!88397) b!186917))

(declare-fun m!213955 () Bool)

(assert (=> d!55375 m!213955))

(declare-fun m!213957 () Bool)

(assert (=> d!55375 m!213957))

(declare-fun m!213959 () Bool)

(assert (=> d!55375 m!213959))

(declare-fun m!213961 () Bool)

(assert (=> d!55375 m!213961))

(declare-fun m!213963 () Bool)

(assert (=> b!186916 m!213963))

(declare-fun m!213965 () Bool)

(assert (=> b!186917 m!213965))

(assert (=> b!186822 d!55375))

(declare-fun d!55377 () Bool)

(assert (=> d!55377 (contains!1296 (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))) lt!92447)))

(declare-fun lt!92507 () Unit!5628)

(declare-fun choose!999 (ListLongMap!2341 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5628)

(assert (=> d!55377 (= lt!92507 (choose!999 lt!92453 lt!92455 (zeroValue!3647 thiss!1248) lt!92447))))

(assert (=> d!55377 (contains!1296 lt!92453 lt!92447)))

(assert (=> d!55377 (= (addStillContains!145 lt!92453 lt!92455 (zeroValue!3647 thiss!1248) lt!92447) lt!92507)))

(declare-fun bs!7566 () Bool)

(assert (= bs!7566 d!55377))

(assert (=> bs!7566 m!213855))

(assert (=> bs!7566 m!213855))

(assert (=> bs!7566 m!213863))

(declare-fun m!213967 () Bool)

(assert (=> bs!7566 m!213967))

(declare-fun m!213969 () Bool)

(assert (=> bs!7566 m!213969))

(assert (=> b!186822 d!55377))

(declare-fun d!55379 () Bool)

(assert (=> d!55379 (= (apply!169 lt!92448 lt!92454) (get!2164 (getValueByKey!227 (toList!1186 lt!92448) lt!92454)))))

(declare-fun bs!7567 () Bool)

(assert (= bs!7567 d!55379))

(declare-fun m!213971 () Bool)

(assert (=> bs!7567 m!213971))

(assert (=> bs!7567 m!213971))

(declare-fun m!213973 () Bool)

(assert (=> bs!7567 m!213973))

(assert (=> b!186822 d!55379))

(declare-fun d!55381 () Bool)

(assert (=> d!55381 (= (apply!169 (+!289 lt!92448 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))) lt!92454) (get!2164 (getValueByKey!227 (toList!1186 (+!289 lt!92448 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248)))) lt!92454)))))

(declare-fun bs!7568 () Bool)

(assert (= bs!7568 d!55381))

(declare-fun m!213975 () Bool)

(assert (=> bs!7568 m!213975))

(assert (=> bs!7568 m!213975))

(declare-fun m!213977 () Bool)

(assert (=> bs!7568 m!213977))

(assert (=> b!186822 d!55381))

(declare-fun d!55383 () Bool)

(assert (=> d!55383 (= (apply!169 (+!289 lt!92452 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248))) lt!92440) (get!2164 (getValueByKey!227 (toList!1186 (+!289 lt!92452 (tuple2!3421 lt!92437 (zeroValue!3647 thiss!1248)))) lt!92440)))))

(declare-fun bs!7569 () Bool)

(assert (= bs!7569 d!55383))

(declare-fun m!213979 () Bool)

(assert (=> bs!7569 m!213979))

(assert (=> bs!7569 m!213979))

(declare-fun m!213981 () Bool)

(assert (=> bs!7569 m!213981))

(assert (=> b!186822 d!55383))

(declare-fun d!55385 () Bool)

(declare-fun e!123005 () Bool)

(assert (=> d!55385 e!123005))

(declare-fun res!88398 () Bool)

(assert (=> d!55385 (=> (not res!88398) (not e!123005))))

(declare-fun lt!92511 () ListLongMap!2341)

(assert (=> d!55385 (= res!88398 (contains!1296 lt!92511 (_1!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))))))

(declare-fun lt!92510 () List!2344)

(assert (=> d!55385 (= lt!92511 (ListLongMap!2342 lt!92510))))

(declare-fun lt!92509 () Unit!5628)

(declare-fun lt!92508 () Unit!5628)

(assert (=> d!55385 (= lt!92509 lt!92508)))

(assert (=> d!55385 (= (getValueByKey!227 lt!92510 (_1!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55385 (= lt!92508 (lemmaContainsTupThenGetReturnValue!119 lt!92510 (_1!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55385 (= lt!92510 (insertStrictlySorted!122 (toList!1186 lt!92453) (_1!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55385 (= (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))) lt!92511)))

(declare-fun b!186919 () Bool)

(declare-fun res!88399 () Bool)

(assert (=> b!186919 (=> (not res!88399) (not e!123005))))

(assert (=> b!186919 (= res!88399 (= (getValueByKey!227 (toList!1186 lt!92511) (_1!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))))))))

(declare-fun b!186920 () Bool)

(assert (=> b!186920 (= e!123005 (contains!1298 (toList!1186 lt!92511) (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))))))

(assert (= (and d!55385 res!88398) b!186919))

(assert (= (and b!186919 res!88399) b!186920))

(declare-fun m!213983 () Bool)

(assert (=> d!55385 m!213983))

(declare-fun m!213985 () Bool)

(assert (=> d!55385 m!213985))

(declare-fun m!213987 () Bool)

(assert (=> d!55385 m!213987))

(declare-fun m!213989 () Bool)

(assert (=> d!55385 m!213989))

(declare-fun m!213991 () Bool)

(assert (=> b!186919 m!213991))

(declare-fun m!213993 () Bool)

(assert (=> b!186920 m!213993))

(assert (=> b!186822 d!55385))

(declare-fun d!55387 () Bool)

(assert (=> d!55387 (= (apply!169 (+!289 lt!92457 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))) lt!92446) (get!2164 (getValueByKey!227 (toList!1186 (+!289 lt!92457 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248)))) lt!92446)))))

(declare-fun bs!7570 () Bool)

(assert (= bs!7570 d!55387))

(declare-fun m!213995 () Bool)

(assert (=> bs!7570 m!213995))

(assert (=> bs!7570 m!213995))

(declare-fun m!213997 () Bool)

(assert (=> bs!7570 m!213997))

(assert (=> b!186822 d!55387))

(declare-fun d!55389 () Bool)

(declare-fun e!123006 () Bool)

(assert (=> d!55389 e!123006))

(declare-fun res!88400 () Bool)

(assert (=> d!55389 (=> (not res!88400) (not e!123006))))

(declare-fun lt!92515 () ListLongMap!2341)

(assert (=> d!55389 (= res!88400 (contains!1296 lt!92515 (_1!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248)))))))

(declare-fun lt!92514 () List!2344)

(assert (=> d!55389 (= lt!92515 (ListLongMap!2342 lt!92514))))

(declare-fun lt!92513 () Unit!5628)

(declare-fun lt!92512 () Unit!5628)

(assert (=> d!55389 (= lt!92513 lt!92512)))

(assert (=> d!55389 (= (getValueByKey!227 lt!92514 (_1!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248)))))))

(assert (=> d!55389 (= lt!92512 (lemmaContainsTupThenGetReturnValue!119 lt!92514 (_1!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248)))))))

(assert (=> d!55389 (= lt!92514 (insertStrictlySorted!122 (toList!1186 lt!92448) (_1!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248)))))))

(assert (=> d!55389 (= (+!289 lt!92448 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))) lt!92515)))

(declare-fun b!186921 () Bool)

(declare-fun res!88401 () Bool)

(assert (=> b!186921 (=> (not res!88401) (not e!123006))))

(assert (=> b!186921 (= res!88401 (= (getValueByKey!227 (toList!1186 lt!92515) (_1!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))))))))

(declare-fun b!186922 () Bool)

(assert (=> b!186922 (= e!123006 (contains!1298 (toList!1186 lt!92515) (tuple2!3421 lt!92441 (minValue!3647 thiss!1248))))))

(assert (= (and d!55389 res!88400) b!186921))

(assert (= (and b!186921 res!88401) b!186922))

(declare-fun m!213999 () Bool)

(assert (=> d!55389 m!213999))

(declare-fun m!214001 () Bool)

(assert (=> d!55389 m!214001))

(declare-fun m!214003 () Bool)

(assert (=> d!55389 m!214003))

(declare-fun m!214005 () Bool)

(assert (=> d!55389 m!214005))

(declare-fun m!214007 () Bool)

(assert (=> b!186921 m!214007))

(declare-fun m!214009 () Bool)

(assert (=> b!186922 m!214009))

(assert (=> b!186822 d!55389))

(declare-fun d!55391 () Bool)

(declare-fun e!123008 () Bool)

(assert (=> d!55391 e!123008))

(declare-fun res!88402 () Bool)

(assert (=> d!55391 (=> res!88402 e!123008)))

(declare-fun lt!92518 () Bool)

(assert (=> d!55391 (= res!88402 (not lt!92518))))

(declare-fun lt!92516 () Bool)

(assert (=> d!55391 (= lt!92518 lt!92516)))

(declare-fun lt!92517 () Unit!5628)

(declare-fun e!123007 () Unit!5628)

(assert (=> d!55391 (= lt!92517 e!123007)))

(declare-fun c!33544 () Bool)

(assert (=> d!55391 (= c!33544 lt!92516)))

(assert (=> d!55391 (= lt!92516 (containsKey!230 (toList!1186 (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))) lt!92447))))

(assert (=> d!55391 (= (contains!1296 (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248))) lt!92447) lt!92518)))

(declare-fun b!186923 () Bool)

(declare-fun lt!92519 () Unit!5628)

(assert (=> b!186923 (= e!123007 lt!92519)))

(assert (=> b!186923 (= lt!92519 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1186 (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))) lt!92447))))

(assert (=> b!186923 (isDefined!179 (getValueByKey!227 (toList!1186 (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))) lt!92447))))

(declare-fun b!186924 () Bool)

(declare-fun Unit!5636 () Unit!5628)

(assert (=> b!186924 (= e!123007 Unit!5636)))

(declare-fun b!186925 () Bool)

(assert (=> b!186925 (= e!123008 (isDefined!179 (getValueByKey!227 (toList!1186 (+!289 lt!92453 (tuple2!3421 lt!92455 (zeroValue!3647 thiss!1248)))) lt!92447)))))

(assert (= (and d!55391 c!33544) b!186923))

(assert (= (and d!55391 (not c!33544)) b!186924))

(assert (= (and d!55391 (not res!88402)) b!186925))

(declare-fun m!214011 () Bool)

(assert (=> d!55391 m!214011))

(declare-fun m!214013 () Bool)

(assert (=> b!186923 m!214013))

(declare-fun m!214015 () Bool)

(assert (=> b!186923 m!214015))

(assert (=> b!186923 m!214015))

(declare-fun m!214017 () Bool)

(assert (=> b!186923 m!214017))

(assert (=> b!186925 m!214015))

(assert (=> b!186925 m!214015))

(assert (=> b!186925 m!214017))

(assert (=> b!186822 d!55391))

(declare-fun d!55393 () Bool)

(assert (=> d!55393 (= (apply!169 (+!289 lt!92457 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))) lt!92446) (apply!169 lt!92457 lt!92446))))

(declare-fun lt!92520 () Unit!5628)

(assert (=> d!55393 (= lt!92520 (choose!998 lt!92457 lt!92445 (minValue!3647 thiss!1248) lt!92446))))

(declare-fun e!123009 () Bool)

(assert (=> d!55393 e!123009))

(declare-fun res!88403 () Bool)

(assert (=> d!55393 (=> (not res!88403) (not e!123009))))

(assert (=> d!55393 (= res!88403 (contains!1296 lt!92457 lt!92446))))

(assert (=> d!55393 (= (addApplyDifferent!145 lt!92457 lt!92445 (minValue!3647 thiss!1248) lt!92446) lt!92520)))

(declare-fun b!186926 () Bool)

(assert (=> b!186926 (= e!123009 (not (= lt!92446 lt!92445)))))

(assert (= (and d!55393 res!88403) b!186926))

(declare-fun m!214019 () Bool)

(assert (=> d!55393 m!214019))

(declare-fun m!214021 () Bool)

(assert (=> d!55393 m!214021))

(assert (=> d!55393 m!213867))

(assert (=> d!55393 m!213881))

(assert (=> d!55393 m!213865))

(assert (=> d!55393 m!213867))

(assert (=> b!186822 d!55393))

(declare-fun d!55395 () Bool)

(declare-fun e!123010 () Bool)

(assert (=> d!55395 e!123010))

(declare-fun res!88404 () Bool)

(assert (=> d!55395 (=> (not res!88404) (not e!123010))))

(declare-fun lt!92524 () ListLongMap!2341)

(assert (=> d!55395 (= res!88404 (contains!1296 lt!92524 (_1!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248)))))))

(declare-fun lt!92523 () List!2344)

(assert (=> d!55395 (= lt!92524 (ListLongMap!2342 lt!92523))))

(declare-fun lt!92522 () Unit!5628)

(declare-fun lt!92521 () Unit!5628)

(assert (=> d!55395 (= lt!92522 lt!92521)))

(assert (=> d!55395 (= (getValueByKey!227 lt!92523 (_1!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248)))))))

(assert (=> d!55395 (= lt!92521 (lemmaContainsTupThenGetReturnValue!119 lt!92523 (_1!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248)))))))

(assert (=> d!55395 (= lt!92523 (insertStrictlySorted!122 (toList!1186 lt!92457) (_1!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248)))))))

(assert (=> d!55395 (= (+!289 lt!92457 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))) lt!92524)))

(declare-fun b!186927 () Bool)

(declare-fun res!88405 () Bool)

(assert (=> b!186927 (=> (not res!88405) (not e!123010))))

(assert (=> b!186927 (= res!88405 (= (getValueByKey!227 (toList!1186 lt!92524) (_1!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))))))))

(declare-fun b!186928 () Bool)

(assert (=> b!186928 (= e!123010 (contains!1298 (toList!1186 lt!92524) (tuple2!3421 lt!92445 (minValue!3647 thiss!1248))))))

(assert (= (and d!55395 res!88404) b!186927))

(assert (= (and b!186927 res!88405) b!186928))

(declare-fun m!214023 () Bool)

(assert (=> d!55395 m!214023))

(declare-fun m!214025 () Bool)

(assert (=> d!55395 m!214025))

(declare-fun m!214027 () Bool)

(assert (=> d!55395 m!214027))

(declare-fun m!214029 () Bool)

(assert (=> d!55395 m!214029))

(declare-fun m!214031 () Bool)

(assert (=> b!186927 m!214031))

(declare-fun m!214033 () Bool)

(assert (=> b!186928 m!214033))

(assert (=> b!186822 d!55395))

(declare-fun d!55397 () Bool)

(declare-fun res!88410 () Bool)

(declare-fun e!123015 () Bool)

(assert (=> d!55397 (=> res!88410 e!123015)))

(assert (=> d!55397 (= res!88410 (and ((_ is Cons!2340) (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (= (_1!1721 (h!2974 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)))))

(assert (=> d!55397 (= (containsKey!230 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828) e!123015)))

(declare-fun b!186933 () Bool)

(declare-fun e!123016 () Bool)

(assert (=> b!186933 (= e!123015 e!123016)))

(declare-fun res!88411 () Bool)

(assert (=> b!186933 (=> (not res!88411) (not e!123016))))

(assert (=> b!186933 (= res!88411 (and (or (not ((_ is Cons!2340) (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) (bvsle (_1!1721 (h!2974 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)) ((_ is Cons!2340) (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (bvslt (_1!1721 (h!2974 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)))))

(declare-fun b!186934 () Bool)

(assert (=> b!186934 (= e!123016 (containsKey!230 (t!7224 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) key!828))))

(assert (= (and d!55397 (not res!88410)) b!186933))

(assert (= (and b!186933 res!88411) b!186934))

(declare-fun m!214035 () Bool)

(assert (=> b!186934 m!214035))

(assert (=> d!55353 d!55397))

(assert (=> bm!18820 d!55367))

(declare-fun d!55399 () Bool)

(declare-fun e!123017 () Bool)

(assert (=> d!55399 e!123017))

(declare-fun res!88412 () Bool)

(assert (=> d!55399 (=> (not res!88412) (not e!123017))))

(declare-fun lt!92528 () ListLongMap!2341)

(assert (=> d!55399 (= res!88412 (contains!1296 lt!92528 (_1!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(declare-fun lt!92527 () List!2344)

(assert (=> d!55399 (= lt!92528 (ListLongMap!2342 lt!92527))))

(declare-fun lt!92526 () Unit!5628)

(declare-fun lt!92525 () Unit!5628)

(assert (=> d!55399 (= lt!92526 lt!92525)))

(assert (=> d!55399 (= (getValueByKey!227 lt!92527 (_1!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))) (Some!232 (_2!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(assert (=> d!55399 (= lt!92525 (lemmaContainsTupThenGetReturnValue!119 lt!92527 (_1!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (_2!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(assert (=> d!55399 (= lt!92527 (insertStrictlySorted!122 (toList!1186 (ite c!33517 call!18823 (ite c!33518 call!18822 call!18826))) (_1!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (_2!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(assert (=> d!55399 (= (+!289 (ite c!33517 call!18823 (ite c!33518 call!18822 call!18826)) (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) lt!92528)))

(declare-fun b!186935 () Bool)

(declare-fun res!88413 () Bool)

(assert (=> b!186935 (=> (not res!88413) (not e!123017))))

(assert (=> b!186935 (= res!88413 (= (getValueByKey!227 (toList!1186 lt!92528) (_1!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))) (Some!232 (_2!1721 (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))))

(declare-fun b!186936 () Bool)

(assert (=> b!186936 (= e!123017 (contains!1298 (toList!1186 lt!92528) (ite (or c!33517 c!33518) (tuple2!3421 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (= (and d!55399 res!88412) b!186935))

(assert (= (and b!186935 res!88413) b!186936))

(declare-fun m!214037 () Bool)

(assert (=> d!55399 m!214037))

(declare-fun m!214039 () Bool)

(assert (=> d!55399 m!214039))

(declare-fun m!214041 () Bool)

(assert (=> d!55399 m!214041))

(declare-fun m!214043 () Bool)

(assert (=> d!55399 m!214043))

(declare-fun m!214045 () Bool)

(assert (=> b!186935 m!214045))

(declare-fun m!214047 () Bool)

(assert (=> b!186936 m!214047))

(assert (=> bm!18819 d!55399))

(declare-fun d!55401 () Bool)

(declare-fun res!88418 () Bool)

(declare-fun e!123022 () Bool)

(assert (=> d!55401 (=> res!88418 e!123022)))

(assert (=> d!55401 (= res!88418 (= (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55401 (= (arrayContainsKey!0 (_keys!5752 thiss!1248) key!828 #b00000000000000000000000000000000) e!123022)))

(declare-fun b!186941 () Bool)

(declare-fun e!123023 () Bool)

(assert (=> b!186941 (= e!123022 e!123023)))

(declare-fun res!88419 () Bool)

(assert (=> b!186941 (=> (not res!88419) (not e!123023))))

(assert (=> b!186941 (= res!88419 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun b!186942 () Bool)

(assert (=> b!186942 (= e!123023 (arrayContainsKey!0 (_keys!5752 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55401 (not res!88418)) b!186941))

(assert (= (and b!186941 res!88419) b!186942))

(assert (=> d!55401 m!213861))

(declare-fun m!214049 () Bool)

(assert (=> b!186942 m!214049))

(assert (=> bm!18802 d!55401))

(assert (=> d!55345 d!55357))

(declare-fun b!186959 () Bool)

(declare-fun res!88428 () Bool)

(declare-fun e!123033 () Bool)

(assert (=> b!186959 (=> (not res!88428) (not e!123033))))

(declare-fun call!18835 () Bool)

(assert (=> b!186959 (= res!88428 call!18835)))

(declare-fun e!123035 () Bool)

(assert (=> b!186959 (= e!123035 e!123033)))

(declare-fun b!186960 () Bool)

(declare-fun e!123032 () Bool)

(declare-fun call!18834 () Bool)

(assert (=> b!186960 (= e!123032 (not call!18834))))

(declare-fun b!186961 () Bool)

(declare-fun e!123034 () Bool)

(assert (=> b!186961 (= e!123034 e!123035)))

(declare-fun c!33550 () Bool)

(declare-fun lt!92531 () SeekEntryResult!634)

(assert (=> b!186961 (= c!33550 ((_ is MissingVacant!634) lt!92531))))

(declare-fun b!186962 () Bool)

(declare-fun res!88429 () Bool)

(assert (=> b!186962 (=> (not res!88429) (not e!123033))))

(assert (=> b!186962 (= res!88429 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4709 lt!92531)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186963 () Bool)

(declare-fun res!88430 () Bool)

(assert (=> b!186963 (= res!88430 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4706 lt!92531)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186963 (=> (not res!88430) (not e!123032))))

(declare-fun d!55403 () Bool)

(assert (=> d!55403 e!123034))

(declare-fun c!33549 () Bool)

(assert (=> d!55403 (= c!33549 ((_ is MissingZero!634) lt!92531))))

(assert (=> d!55403 (= lt!92531 (seekEntryOrOpen!0 key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(assert (=> d!55403 true))

(declare-fun _$34!1066 () Unit!5628)

(assert (=> d!55403 (= (choose!996 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) _$34!1066)))

(declare-fun b!186964 () Bool)

(assert (=> b!186964 (= e!123034 e!123032)))

(declare-fun res!88431 () Bool)

(assert (=> b!186964 (= res!88431 call!18835)))

(assert (=> b!186964 (=> (not res!88431) (not e!123032))))

(declare-fun b!186965 () Bool)

(assert (=> b!186965 (= e!123035 ((_ is Undefined!634) lt!92531))))

(declare-fun bm!18831 () Bool)

(assert (=> bm!18831 (= call!18834 (arrayContainsKey!0 (_keys!5752 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186966 () Bool)

(assert (=> b!186966 (= e!123033 (not call!18834))))

(declare-fun bm!18832 () Bool)

(assert (=> bm!18832 (= call!18835 (inRange!0 (ite c!33549 (index!4706 lt!92531) (index!4709 lt!92531)) (mask!8937 thiss!1248)))))

(assert (= (and d!55403 c!33549) b!186964))

(assert (= (and d!55403 (not c!33549)) b!186961))

(assert (= (and b!186964 res!88431) b!186963))

(assert (= (and b!186963 res!88430) b!186960))

(assert (= (and b!186961 c!33550) b!186959))

(assert (= (and b!186961 (not c!33550)) b!186965))

(assert (= (and b!186959 res!88428) b!186962))

(assert (= (and b!186962 res!88429) b!186966))

(assert (= (or b!186964 b!186959) bm!18832))

(assert (= (or b!186960 b!186966) bm!18831))

(assert (=> d!55403 m!213761))

(declare-fun m!214051 () Bool)

(assert (=> bm!18832 m!214051))

(declare-fun m!214053 () Bool)

(assert (=> b!186962 m!214053))

(declare-fun m!214055 () Bool)

(assert (=> b!186963 m!214055))

(assert (=> bm!18831 m!213815))

(assert (=> d!55345 d!55403))

(assert (=> d!55345 d!55351))

(declare-fun d!55405 () Bool)

(declare-fun e!123037 () Bool)

(assert (=> d!55405 e!123037))

(declare-fun res!88432 () Bool)

(assert (=> d!55405 (=> res!88432 e!123037)))

(declare-fun lt!92534 () Bool)

(assert (=> d!55405 (= res!88432 (not lt!92534))))

(declare-fun lt!92532 () Bool)

(assert (=> d!55405 (= lt!92534 lt!92532)))

(declare-fun lt!92533 () Unit!5628)

(declare-fun e!123036 () Unit!5628)

(assert (=> d!55405 (= lt!92533 e!123036)))

(declare-fun c!33551 () Bool)

(assert (=> d!55405 (= c!33551 lt!92532)))

(assert (=> d!55405 (= lt!92532 (containsKey!230 (toList!1186 lt!92451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55405 (= (contains!1296 lt!92451 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92534)))

(declare-fun b!186967 () Bool)

(declare-fun lt!92535 () Unit!5628)

(assert (=> b!186967 (= e!123036 lt!92535)))

(assert (=> b!186967 (= lt!92535 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1186 lt!92451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186967 (isDefined!179 (getValueByKey!227 (toList!1186 lt!92451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186968 () Bool)

(declare-fun Unit!5637 () Unit!5628)

(assert (=> b!186968 (= e!123036 Unit!5637)))

(declare-fun b!186969 () Bool)

(assert (=> b!186969 (= e!123037 (isDefined!179 (getValueByKey!227 (toList!1186 lt!92451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55405 c!33551) b!186967))

(assert (= (and d!55405 (not c!33551)) b!186968))

(assert (= (and d!55405 (not res!88432)) b!186969))

(declare-fun m!214057 () Bool)

(assert (=> d!55405 m!214057))

(declare-fun m!214059 () Bool)

(assert (=> b!186967 m!214059))

(declare-fun m!214061 () Bool)

(assert (=> b!186967 m!214061))

(assert (=> b!186967 m!214061))

(declare-fun m!214063 () Bool)

(assert (=> b!186967 m!214063))

(assert (=> b!186969 m!214061))

(assert (=> b!186969 m!214061))

(assert (=> b!186969 m!214063))

(assert (=> bm!18821 d!55405))

(declare-fun d!55407 () Bool)

(assert (=> d!55407 (= (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186826 d!55407))

(assert (=> d!55355 d!55351))

(declare-fun d!55409 () Bool)

(declare-fun e!123052 () Bool)

(assert (=> d!55409 e!123052))

(declare-fun c!33559 () Bool)

(declare-fun lt!92540 () SeekEntryResult!634)

(assert (=> d!55409 (= c!33559 (and ((_ is Intermediate!634) lt!92540) (undefined!1446 lt!92540)))))

(declare-fun e!123050 () SeekEntryResult!634)

(assert (=> d!55409 (= lt!92540 e!123050)))

(declare-fun c!33560 () Bool)

(assert (=> d!55409 (= c!33560 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!92541 () (_ BitVec 64))

(assert (=> d!55409 (= lt!92541 (select (arr!3746 (_keys!5752 thiss!1248)) (toIndex!0 key!828 (mask!8937 thiss!1248))))))

(assert (=> d!55409 (validMask!0 (mask!8937 thiss!1248))))

(assert (=> d!55409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8937 thiss!1248)) key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)) lt!92540)))

(declare-fun b!186988 () Bool)

(assert (=> b!186988 (and (bvsge (index!4708 lt!92540) #b00000000000000000000000000000000) (bvslt (index!4708 lt!92540) (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun res!88440 () Bool)

(assert (=> b!186988 (= res!88440 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4708 lt!92540)) key!828))))

(declare-fun e!123049 () Bool)

(assert (=> b!186988 (=> res!88440 e!123049)))

(declare-fun e!123051 () Bool)

(assert (=> b!186988 (= e!123051 e!123049)))

(declare-fun b!186989 () Bool)

(assert (=> b!186989 (and (bvsge (index!4708 lt!92540) #b00000000000000000000000000000000) (bvslt (index!4708 lt!92540) (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> b!186989 (= e!123049 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4708 lt!92540)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186990 () Bool)

(declare-fun e!123048 () SeekEntryResult!634)

(assert (=> b!186990 (= e!123050 e!123048)))

(declare-fun c!33558 () Bool)

(assert (=> b!186990 (= c!33558 (or (= lt!92541 key!828) (= (bvadd lt!92541 lt!92541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186991 () Bool)

(assert (=> b!186991 (= e!123052 (bvsge (x!20224 lt!92540) #b01111111111111111111111111111110))))

(declare-fun b!186992 () Bool)

(assert (=> b!186992 (= e!123052 e!123051)))

(declare-fun res!88439 () Bool)

(assert (=> b!186992 (= res!88439 (and ((_ is Intermediate!634) lt!92540) (not (undefined!1446 lt!92540)) (bvslt (x!20224 lt!92540) #b01111111111111111111111111111110) (bvsge (x!20224 lt!92540) #b00000000000000000000000000000000) (bvsge (x!20224 lt!92540) #b00000000000000000000000000000000)))))

(assert (=> b!186992 (=> (not res!88439) (not e!123051))))

(declare-fun b!186993 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186993 (= e!123048 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8937 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8937 thiss!1248)) key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(declare-fun b!186994 () Bool)

(assert (=> b!186994 (= e!123048 (Intermediate!634 false (toIndex!0 key!828 (mask!8937 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186995 () Bool)

(assert (=> b!186995 (and (bvsge (index!4708 lt!92540) #b00000000000000000000000000000000) (bvslt (index!4708 lt!92540) (size!4063 (_keys!5752 thiss!1248))))))

(declare-fun res!88441 () Bool)

(assert (=> b!186995 (= res!88441 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4708 lt!92540)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186995 (=> res!88441 e!123049)))

(declare-fun b!186996 () Bool)

(assert (=> b!186996 (= e!123050 (Intermediate!634 true (toIndex!0 key!828 (mask!8937 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!55409 c!33560) b!186996))

(assert (= (and d!55409 (not c!33560)) b!186990))

(assert (= (and b!186990 c!33558) b!186994))

(assert (= (and b!186990 (not c!33558)) b!186993))

(assert (= (and d!55409 c!33559) b!186991))

(assert (= (and d!55409 (not c!33559)) b!186992))

(assert (= (and b!186992 res!88439) b!186988))

(assert (= (and b!186988 (not res!88440)) b!186995))

(assert (= (and b!186995 (not res!88441)) b!186989))

(declare-fun m!214065 () Bool)

(assert (=> b!186988 m!214065))

(assert (=> b!186989 m!214065))

(assert (=> b!186993 m!213895))

(declare-fun m!214067 () Bool)

(assert (=> b!186993 m!214067))

(assert (=> b!186993 m!214067))

(declare-fun m!214069 () Bool)

(assert (=> b!186993 m!214069))

(assert (=> b!186995 m!214065))

(assert (=> d!55409 m!213895))

(declare-fun m!214071 () Bool)

(assert (=> d!55409 m!214071))

(assert (=> d!55409 m!213741))

(assert (=> d!55357 d!55409))

(declare-fun d!55411 () Bool)

(declare-fun lt!92547 () (_ BitVec 32))

(declare-fun lt!92546 () (_ BitVec 32))

(assert (=> d!55411 (= lt!92547 (bvmul (bvxor lt!92546 (bvlshr lt!92546 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55411 (= lt!92546 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55411 (and (bvsge (mask!8937 thiss!1248) #b00000000000000000000000000000000) (let ((res!88442 (let ((h!2977 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20242 (bvmul (bvxor h!2977 (bvlshr h!2977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20242 (bvlshr x!20242 #b00000000000000000000000000001101)) (mask!8937 thiss!1248)))))) (and (bvslt res!88442 (bvadd (mask!8937 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88442 #b00000000000000000000000000000000))))))

(assert (=> d!55411 (= (toIndex!0 key!828 (mask!8937 thiss!1248)) (bvand (bvxor lt!92547 (bvlshr lt!92547 #b00000000000000000000000000001101)) (mask!8937 thiss!1248)))))

(assert (=> d!55357 d!55411))

(assert (=> d!55357 d!55351))

(declare-fun d!55413 () Bool)

(assert (=> d!55413 (= (apply!169 lt!92451 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2164 (getValueByKey!227 (toList!1186 lt!92451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7571 () Bool)

(assert (= bs!7571 d!55413))

(declare-fun m!214073 () Bool)

(assert (=> bs!7571 m!214073))

(assert (=> bs!7571 m!214073))

(declare-fun m!214075 () Bool)

(assert (=> bs!7571 m!214075))

(assert (=> b!186824 d!55413))

(declare-fun d!55415 () Bool)

(assert (=> d!55415 (= (inRange!0 (index!4707 lt!92379) (mask!8937 thiss!1248)) (and (bvsge (index!4707 lt!92379) #b00000000000000000000000000000000) (bvslt (index!4707 lt!92379) (bvadd (mask!8937 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186760 d!55415))

(declare-fun b!187005 () Bool)

(declare-fun e!123061 () Bool)

(declare-fun call!18838 () Bool)

(assert (=> b!187005 (= e!123061 call!18838)))

(declare-fun b!187006 () Bool)

(declare-fun e!123059 () Bool)

(assert (=> b!187006 (= e!123061 e!123059)))

(declare-fun lt!92554 () (_ BitVec 64))

(assert (=> b!187006 (= lt!92554 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92556 () Unit!5628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7937 (_ BitVec 64) (_ BitVec 32)) Unit!5628)

(assert (=> b!187006 (= lt!92556 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5752 thiss!1248) lt!92554 #b00000000000000000000000000000000))))

(assert (=> b!187006 (arrayContainsKey!0 (_keys!5752 thiss!1248) lt!92554 #b00000000000000000000000000000000)))

(declare-fun lt!92555 () Unit!5628)

(assert (=> b!187006 (= lt!92555 lt!92556)))

(declare-fun res!88448 () Bool)

(assert (=> b!187006 (= res!88448 (= (seekEntryOrOpen!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000) (_keys!5752 thiss!1248) (mask!8937 thiss!1248)) (Found!634 #b00000000000000000000000000000000)))))

(assert (=> b!187006 (=> (not res!88448) (not e!123059))))

(declare-fun bm!18835 () Bool)

(assert (=> bm!18835 (= call!18838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(declare-fun d!55417 () Bool)

(declare-fun res!88447 () Bool)

(declare-fun e!123060 () Bool)

(assert (=> d!55417 (=> res!88447 e!123060)))

(assert (=> d!55417 (= res!88447 (bvsge #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> d!55417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)) e!123060)))

(declare-fun b!187007 () Bool)

(assert (=> b!187007 (= e!123059 call!18838)))

(declare-fun b!187008 () Bool)

(assert (=> b!187008 (= e!123060 e!123061)))

(declare-fun c!33563 () Bool)

(assert (=> b!187008 (= c!33563 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55417 (not res!88447)) b!187008))

(assert (= (and b!187008 c!33563) b!187006))

(assert (= (and b!187008 (not c!33563)) b!187005))

(assert (= (and b!187006 res!88448) b!187007))

(assert (= (or b!187007 b!187005) bm!18835))

(assert (=> b!187006 m!213861))

(declare-fun m!214077 () Bool)

(assert (=> b!187006 m!214077))

(declare-fun m!214079 () Bool)

(assert (=> b!187006 m!214079))

(assert (=> b!187006 m!213861))

(declare-fun m!214081 () Bool)

(assert (=> b!187006 m!214081))

(declare-fun m!214083 () Bool)

(assert (=> bm!18835 m!214083))

(assert (=> b!187008 m!213861))

(assert (=> b!187008 m!213861))

(assert (=> b!187008 m!213883))

(assert (=> b!186861 d!55417))

(declare-fun b!187019 () Bool)

(declare-fun res!88459 () Bool)

(declare-fun e!123064 () Bool)

(assert (=> b!187019 (=> (not res!88459) (not e!123064))))

(declare-fun size!4069 (LongMapFixedSize!2590) (_ BitVec 32))

(assert (=> b!187019 (= res!88459 (= (size!4069 thiss!1248) (bvadd (_size!1344 thiss!1248) (bvsdiv (bvadd (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!187020 () Bool)

(assert (=> b!187020 (= e!123064 (and (bvsge (extraKeys!3543 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3543 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1344 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!187018 () Bool)

(declare-fun res!88457 () Bool)

(assert (=> b!187018 (=> (not res!88457) (not e!123064))))

(assert (=> b!187018 (= res!88457 (bvsge (size!4069 thiss!1248) (_size!1344 thiss!1248)))))

(declare-fun b!187017 () Bool)

(declare-fun res!88458 () Bool)

(assert (=> b!187017 (=> (not res!88458) (not e!123064))))

(assert (=> b!187017 (= res!88458 (and (= (size!4064 (_values!3789 thiss!1248)) (bvadd (mask!8937 thiss!1248) #b00000000000000000000000000000001)) (= (size!4063 (_keys!5752 thiss!1248)) (size!4064 (_values!3789 thiss!1248))) (bvsge (_size!1344 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1344 thiss!1248) (bvadd (mask!8937 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!55419 () Bool)

(declare-fun res!88460 () Bool)

(assert (=> d!55419 (=> (not res!88460) (not e!123064))))

(assert (=> d!55419 (= res!88460 (validMask!0 (mask!8937 thiss!1248)))))

(assert (=> d!55419 (= (simpleValid!185 thiss!1248) e!123064)))

(assert (= (and d!55419 res!88460) b!187017))

(assert (= (and b!187017 res!88458) b!187018))

(assert (= (and b!187018 res!88457) b!187019))

(assert (= (and b!187019 res!88459) b!187020))

(declare-fun m!214085 () Bool)

(assert (=> b!187019 m!214085))

(assert (=> b!187018 m!214085))

(assert (=> d!55419 m!213741))

(assert (=> d!55359 d!55419))

(declare-fun b!187029 () Bool)

(declare-fun e!123070 () (_ BitVec 32))

(declare-fun call!18841 () (_ BitVec 32))

(assert (=> b!187029 (= e!123070 call!18841)))

(declare-fun d!55421 () Bool)

(declare-fun lt!92559 () (_ BitVec 32))

(assert (=> d!55421 (and (bvsge lt!92559 #b00000000000000000000000000000000) (bvsle lt!92559 (bvsub (size!4063 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123069 () (_ BitVec 32))

(assert (=> d!55421 (= lt!92559 e!123069)))

(declare-fun c!33569 () Bool)

(assert (=> d!55421 (= c!33569 (bvsge #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> d!55421 (and (bvsle #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4063 (_keys!5752 thiss!1248)) (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> d!55421 (= (arrayCountValidKeys!0 (_keys!5752 thiss!1248) #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))) lt!92559)))

(declare-fun b!187030 () Bool)

(assert (=> b!187030 (= e!123069 e!123070)))

(declare-fun c!33568 () Bool)

(assert (=> b!187030 (= c!33568 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187031 () Bool)

(assert (=> b!187031 (= e!123069 #b00000000000000000000000000000000)))

(declare-fun b!187032 () Bool)

(assert (=> b!187032 (= e!123070 (bvadd #b00000000000000000000000000000001 call!18841))))

(declare-fun bm!18838 () Bool)

(assert (=> bm!18838 (= call!18841 (arrayCountValidKeys!0 (_keys!5752 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4063 (_keys!5752 thiss!1248))))))

(assert (= (and d!55421 c!33569) b!187031))

(assert (= (and d!55421 (not c!33569)) b!187030))

(assert (= (and b!187030 c!33568) b!187032))

(assert (= (and b!187030 (not c!33568)) b!187029))

(assert (= (or b!187032 b!187029) bm!18838))

(assert (=> b!187030 m!213861))

(assert (=> b!187030 m!213861))

(assert (=> b!187030 m!213883))

(declare-fun m!214087 () Bool)

(assert (=> bm!18838 m!214087))

(assert (=> b!186860 d!55421))

(declare-fun d!55423 () Bool)

(declare-fun e!123072 () Bool)

(assert (=> d!55423 e!123072))

(declare-fun res!88461 () Bool)

(assert (=> d!55423 (=> res!88461 e!123072)))

(declare-fun lt!92562 () Bool)

(assert (=> d!55423 (= res!88461 (not lt!92562))))

(declare-fun lt!92560 () Bool)

(assert (=> d!55423 (= lt!92562 lt!92560)))

(declare-fun lt!92561 () Unit!5628)

(declare-fun e!123071 () Unit!5628)

(assert (=> d!55423 (= lt!92561 e!123071)))

(declare-fun c!33570 () Bool)

(assert (=> d!55423 (= c!33570 lt!92560)))

(assert (=> d!55423 (= lt!92560 (containsKey!230 (toList!1186 lt!92451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55423 (= (contains!1296 lt!92451 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92562)))

(declare-fun b!187033 () Bool)

(declare-fun lt!92563 () Unit!5628)

(assert (=> b!187033 (= e!123071 lt!92563)))

(assert (=> b!187033 (= lt!92563 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1186 lt!92451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187033 (isDefined!179 (getValueByKey!227 (toList!1186 lt!92451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187034 () Bool)

(declare-fun Unit!5638 () Unit!5628)

(assert (=> b!187034 (= e!123071 Unit!5638)))

(declare-fun b!187035 () Bool)

(assert (=> b!187035 (= e!123072 (isDefined!179 (getValueByKey!227 (toList!1186 lt!92451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55423 c!33570) b!187033))

(assert (= (and d!55423 (not c!33570)) b!187034))

(assert (= (and d!55423 (not res!88461)) b!187035))

(declare-fun m!214089 () Bool)

(assert (=> d!55423 m!214089))

(declare-fun m!214091 () Bool)

(assert (=> b!187033 m!214091))

(assert (=> b!187033 m!214073))

(assert (=> b!187033 m!214073))

(declare-fun m!214093 () Bool)

(assert (=> b!187033 m!214093))

(assert (=> b!187035 m!214073))

(assert (=> b!187035 m!214073))

(assert (=> b!187035 m!214093))

(assert (=> bm!18822 d!55423))

(assert (=> b!186829 d!55407))

(declare-fun d!55425 () Bool)

(assert (=> d!55425 (= (apply!169 lt!92451 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2164 (getValueByKey!227 (toList!1186 lt!92451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7572 () Bool)

(assert (= bs!7572 d!55425))

(assert (=> bs!7572 m!214061))

(assert (=> bs!7572 m!214061))

(declare-fun m!214095 () Bool)

(assert (=> bs!7572 m!214095))

(assert (=> b!186828 d!55425))

(declare-fun d!55427 () Bool)

(declare-fun isEmpty!480 (Option!233) Bool)

(assert (=> d!55427 (= (isDefined!179 (getValueByKey!227 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828)) (not (isEmpty!480 (getValueByKey!227 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))))

(declare-fun bs!7573 () Bool)

(assert (= bs!7573 d!55427))

(assert (=> bs!7573 m!213833))

(declare-fun m!214097 () Bool)

(assert (=> bs!7573 m!214097))

(assert (=> b!186770 d!55427))

(declare-fun b!187044 () Bool)

(declare-fun e!123077 () Option!233)

(assert (=> b!187044 (= e!123077 (Some!232 (_2!1721 (h!2974 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))))))

(declare-fun b!187046 () Bool)

(declare-fun e!123078 () Option!233)

(assert (=> b!187046 (= e!123078 (getValueByKey!227 (t!7224 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) key!828))))

(declare-fun b!187045 () Bool)

(assert (=> b!187045 (= e!123077 e!123078)))

(declare-fun c!33576 () Bool)

(assert (=> b!187045 (= c!33576 (and ((_ is Cons!2340) (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (not (= (_1!1721 (h!2974 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828))))))

(declare-fun d!55429 () Bool)

(declare-fun c!33575 () Bool)

(assert (=> d!55429 (= c!33575 (and ((_ is Cons!2340) (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (= (_1!1721 (h!2974 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)))))

(assert (=> d!55429 (= (getValueByKey!227 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828) e!123077)))

(declare-fun b!187047 () Bool)

(assert (=> b!187047 (= e!123078 None!231)))

(assert (= (and d!55429 c!33575) b!187044))

(assert (= (and d!55429 (not c!33575)) b!187045))

(assert (= (and b!187045 c!33576) b!187046))

(assert (= (and b!187045 (not c!33576)) b!187047))

(declare-fun m!214099 () Bool)

(assert (=> b!187046 m!214099))

(assert (=> b!186770 d!55429))

(declare-fun d!55431 () Bool)

(assert (=> d!55431 (= (inRange!0 (ite c!33501 (index!4706 lt!92374) (index!4709 lt!92374)) (mask!8937 thiss!1248)) (and (bvsge (ite c!33501 (index!4706 lt!92374) (index!4709 lt!92374)) #b00000000000000000000000000000000) (bvslt (ite c!33501 (index!4706 lt!92374) (index!4709 lt!92374)) (bvadd (mask!8937 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18801 d!55431))

(assert (=> d!55347 d!55357))

(declare-fun d!55433 () Bool)

(declare-fun e!123081 () Bool)

(assert (=> d!55433 e!123081))

(declare-fun res!88467 () Bool)

(assert (=> d!55433 (=> (not res!88467) (not e!123081))))

(declare-fun lt!92566 () SeekEntryResult!634)

(assert (=> d!55433 (= res!88467 ((_ is Found!634) lt!92566))))

(assert (=> d!55433 (= lt!92566 (seekEntryOrOpen!0 key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(assert (=> d!55433 true))

(declare-fun _$33!129 () Unit!5628)

(assert (=> d!55433 (= (choose!997 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) _$33!129)))

(declare-fun b!187052 () Bool)

(declare-fun res!88466 () Bool)

(assert (=> b!187052 (=> (not res!88466) (not e!123081))))

(assert (=> b!187052 (= res!88466 (inRange!0 (index!4707 lt!92566) (mask!8937 thiss!1248)))))

(declare-fun b!187053 () Bool)

(assert (=> b!187053 (= e!123081 (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4707 lt!92566)) key!828))))

(assert (= (and d!55433 res!88467) b!187052))

(assert (= (and b!187052 res!88466) b!187053))

(assert (=> d!55433 m!213761))

(declare-fun m!214101 () Bool)

(assert (=> b!187052 m!214101))

(declare-fun m!214103 () Bool)

(assert (=> b!187053 m!214103))

(assert (=> d!55347 d!55433))

(assert (=> d!55347 d!55351))

(declare-fun b!187066 () Bool)

(declare-fun c!33584 () Bool)

(declare-fun lt!92572 () (_ BitVec 64))

(assert (=> b!187066 (= c!33584 (= lt!92572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123089 () SeekEntryResult!634)

(declare-fun e!123088 () SeekEntryResult!634)

(assert (=> b!187066 (= e!123089 e!123088)))

(declare-fun d!55435 () Bool)

(declare-fun lt!92571 () SeekEntryResult!634)

(assert (=> d!55435 (and (or ((_ is Undefined!634) lt!92571) (not ((_ is Found!634) lt!92571)) (and (bvsge (index!4707 lt!92571) #b00000000000000000000000000000000) (bvslt (index!4707 lt!92571) (size!4063 (_keys!5752 thiss!1248))))) (or ((_ is Undefined!634) lt!92571) ((_ is Found!634) lt!92571) (not ((_ is MissingVacant!634) lt!92571)) (not (= (index!4709 lt!92571) (index!4708 lt!92466))) (and (bvsge (index!4709 lt!92571) #b00000000000000000000000000000000) (bvslt (index!4709 lt!92571) (size!4063 (_keys!5752 thiss!1248))))) (or ((_ is Undefined!634) lt!92571) (ite ((_ is Found!634) lt!92571) (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4707 lt!92571)) key!828) (and ((_ is MissingVacant!634) lt!92571) (= (index!4709 lt!92571) (index!4708 lt!92466)) (= (select (arr!3746 (_keys!5752 thiss!1248)) (index!4709 lt!92571)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!123090 () SeekEntryResult!634)

(assert (=> d!55435 (= lt!92571 e!123090)))

(declare-fun c!33585 () Bool)

(assert (=> d!55435 (= c!33585 (bvsge (x!20224 lt!92466) #b01111111111111111111111111111110))))

(assert (=> d!55435 (= lt!92572 (select (arr!3746 (_keys!5752 thiss!1248)) (index!4708 lt!92466)))))

(assert (=> d!55435 (validMask!0 (mask!8937 thiss!1248))))

(assert (=> d!55435 (= (seekKeyOrZeroReturnVacant!0 (x!20224 lt!92466) (index!4708 lt!92466) (index!4708 lt!92466) key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)) lt!92571)))

(declare-fun b!187067 () Bool)

(assert (=> b!187067 (= e!123090 Undefined!634)))

(declare-fun b!187068 () Bool)

(assert (=> b!187068 (= e!123088 (MissingVacant!634 (index!4708 lt!92466)))))

(declare-fun b!187069 () Bool)

(assert (=> b!187069 (= e!123089 (Found!634 (index!4708 lt!92466)))))

(declare-fun b!187070 () Bool)

(assert (=> b!187070 (= e!123090 e!123089)))

(declare-fun c!33583 () Bool)

(assert (=> b!187070 (= c!33583 (= lt!92572 key!828))))

(declare-fun b!187071 () Bool)

(assert (=> b!187071 (= e!123088 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20224 lt!92466) #b00000000000000000000000000000001) (nextIndex!0 (index!4708 lt!92466) (bvadd (x!20224 lt!92466) #b00000000000000000000000000000001) (mask!8937 thiss!1248)) (index!4708 lt!92466) key!828 (_keys!5752 thiss!1248) (mask!8937 thiss!1248)))))

(assert (= (and d!55435 c!33585) b!187067))

(assert (= (and d!55435 (not c!33585)) b!187070))

(assert (= (and b!187070 c!33583) b!187069))

(assert (= (and b!187070 (not c!33583)) b!187066))

(assert (= (and b!187066 c!33584) b!187068))

(assert (= (and b!187066 (not c!33584)) b!187071))

(declare-fun m!214105 () Bool)

(assert (=> d!55435 m!214105))

(declare-fun m!214107 () Bool)

(assert (=> d!55435 m!214107))

(assert (=> d!55435 m!213905))

(assert (=> d!55435 m!213741))

(declare-fun m!214109 () Bool)

(assert (=> b!187071 m!214109))

(assert (=> b!187071 m!214109))

(declare-fun m!214111 () Bool)

(assert (=> b!187071 m!214111))

(assert (=> b!186853 d!55435))

(declare-fun d!55437 () Bool)

(declare-fun e!123092 () Bool)

(assert (=> d!55437 e!123092))

(declare-fun res!88468 () Bool)

(assert (=> d!55437 (=> res!88468 e!123092)))

(declare-fun lt!92575 () Bool)

(assert (=> d!55437 (= res!88468 (not lt!92575))))

(declare-fun lt!92573 () Bool)

(assert (=> d!55437 (= lt!92575 lt!92573)))

(declare-fun lt!92574 () Unit!5628)

(declare-fun e!123091 () Unit!5628)

(assert (=> d!55437 (= lt!92574 e!123091)))

(declare-fun c!33586 () Bool)

(assert (=> d!55437 (= c!33586 lt!92573)))

(assert (=> d!55437 (= lt!92573 (containsKey!230 (toList!1186 lt!92451) (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55437 (= (contains!1296 lt!92451 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)) lt!92575)))

(declare-fun b!187072 () Bool)

(declare-fun lt!92576 () Unit!5628)

(assert (=> b!187072 (= e!123091 lt!92576)))

(assert (=> b!187072 (= lt!92576 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1186 lt!92451) (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187072 (isDefined!179 (getValueByKey!227 (toList!1186 lt!92451) (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187073 () Bool)

(declare-fun Unit!5639 () Unit!5628)

(assert (=> b!187073 (= e!123091 Unit!5639)))

(declare-fun b!187074 () Bool)

(assert (=> b!187074 (= e!123092 (isDefined!179 (getValueByKey!227 (toList!1186 lt!92451) (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55437 c!33586) b!187072))

(assert (= (and d!55437 (not c!33586)) b!187073))

(assert (= (and d!55437 (not res!88468)) b!187074))

(assert (=> d!55437 m!213861))

(declare-fun m!214113 () Bool)

(assert (=> d!55437 m!214113))

(assert (=> b!187072 m!213861))

(declare-fun m!214115 () Bool)

(assert (=> b!187072 m!214115))

(assert (=> b!187072 m!213861))

(declare-fun m!214117 () Bool)

(assert (=> b!187072 m!214117))

(assert (=> b!187072 m!214117))

(declare-fun m!214119 () Bool)

(assert (=> b!187072 m!214119))

(assert (=> b!187074 m!213861))

(assert (=> b!187074 m!214117))

(assert (=> b!187074 m!214117))

(assert (=> b!187074 m!214119))

(assert (=> b!186818 d!55437))

(declare-fun d!55439 () Bool)

(assert (=> d!55439 (isDefined!179 (getValueByKey!227 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-fun lt!92579 () Unit!5628)

(declare-fun choose!1000 (List!2344 (_ BitVec 64)) Unit!5628)

(assert (=> d!55439 (= lt!92579 (choose!1000 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-fun e!123095 () Bool)

(assert (=> d!55439 e!123095))

(declare-fun res!88471 () Bool)

(assert (=> d!55439 (=> (not res!88471) (not e!123095))))

(declare-fun isStrictlySorted!337 (List!2344) Bool)

(assert (=> d!55439 (= res!88471 (isStrictlySorted!337 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))))

(assert (=> d!55439 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828) lt!92579)))

(declare-fun b!187077 () Bool)

(assert (=> b!187077 (= e!123095 (containsKey!230 (toList!1186 (getCurrentListMap!838 (_keys!5752 thiss!1248) (_values!3789 thiss!1248) (mask!8937 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(assert (= (and d!55439 res!88471) b!187077))

(assert (=> d!55439 m!213833))

(assert (=> d!55439 m!213833))

(assert (=> d!55439 m!213835))

(declare-fun m!214121 () Bool)

(assert (=> d!55439 m!214121))

(declare-fun m!214123 () Bool)

(assert (=> d!55439 m!214123))

(assert (=> b!187077 m!213829))

(assert (=> b!186768 d!55439))

(assert (=> b!186768 d!55427))

(assert (=> b!186768 d!55429))

(declare-fun d!55441 () Bool)

(assert (=> d!55441 (= (apply!169 lt!92451 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)) (get!2164 (getValueByKey!227 (toList!1186 lt!92451) (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7574 () Bool)

(assert (= bs!7574 d!55441))

(assert (=> bs!7574 m!213861))

(assert (=> bs!7574 m!214117))

(assert (=> bs!7574 m!214117))

(declare-fun m!214125 () Bool)

(assert (=> bs!7574 m!214125))

(assert (=> b!186817 d!55441))

(declare-fun d!55443 () Bool)

(declare-fun c!33589 () Bool)

(assert (=> d!55443 (= c!33589 ((_ is ValueCellFull!1841) (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123098 () V!5473)

(assert (=> d!55443 (= (get!2163 (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123098)))

(declare-fun b!187082 () Bool)

(declare-fun get!2165 (ValueCell!1841 V!5473) V!5473)

(assert (=> b!187082 (= e!123098 (get!2165 (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187083 () Bool)

(declare-fun get!2166 (ValueCell!1841 V!5473) V!5473)

(assert (=> b!187083 (= e!123098 (get!2166 (select (arr!3747 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55443 c!33589) b!187082))

(assert (= (and d!55443 (not c!33589)) b!187083))

(assert (=> b!187082 m!213889))

(assert (=> b!187082 m!213887))

(declare-fun m!214127 () Bool)

(assert (=> b!187082 m!214127))

(assert (=> b!187083 m!213889))

(assert (=> b!187083 m!213887))

(declare-fun m!214129 () Bool)

(assert (=> b!187083 m!214129))

(assert (=> b!186817 d!55443))

(declare-fun b!187094 () Bool)

(declare-fun e!123110 () Bool)

(declare-fun e!123108 () Bool)

(assert (=> b!187094 (= e!123110 e!123108)))

(declare-fun res!88479 () Bool)

(assert (=> b!187094 (=> (not res!88479) (not e!123108))))

(declare-fun e!123107 () Bool)

(assert (=> b!187094 (= res!88479 (not e!123107))))

(declare-fun res!88480 () Bool)

(assert (=> b!187094 (=> (not res!88480) (not e!123107))))

(assert (=> b!187094 (= res!88480 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187095 () Bool)

(declare-fun e!123109 () Bool)

(assert (=> b!187095 (= e!123108 e!123109)))

(declare-fun c!33592 () Bool)

(assert (=> b!187095 (= c!33592 (validKeyInArray!0 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55445 () Bool)

(declare-fun res!88478 () Bool)

(assert (=> d!55445 (=> res!88478 e!123110)))

(assert (=> d!55445 (= res!88478 (bvsge #b00000000000000000000000000000000 (size!4063 (_keys!5752 thiss!1248))))))

(assert (=> d!55445 (= (arrayNoDuplicates!0 (_keys!5752 thiss!1248) #b00000000000000000000000000000000 Nil!2343) e!123110)))

(declare-fun b!187096 () Bool)

(declare-fun contains!1299 (List!2346 (_ BitVec 64)) Bool)

(assert (=> b!187096 (= e!123107 (contains!1299 Nil!2343 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18841 () Bool)

(declare-fun call!18844 () Bool)

(assert (=> bm!18841 (= call!18844 (arrayNoDuplicates!0 (_keys!5752 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33592 (Cons!2342 (select (arr!3746 (_keys!5752 thiss!1248)) #b00000000000000000000000000000000) Nil!2343) Nil!2343)))))

(declare-fun b!187097 () Bool)

(assert (=> b!187097 (= e!123109 call!18844)))

(declare-fun b!187098 () Bool)

(assert (=> b!187098 (= e!123109 call!18844)))

(assert (= (and d!55445 (not res!88478)) b!187094))

(assert (= (and b!187094 res!88480) b!187096))

(assert (= (and b!187094 res!88479) b!187095))

(assert (= (and b!187095 c!33592) b!187097))

(assert (= (and b!187095 (not c!33592)) b!187098))

(assert (= (or b!187097 b!187098) bm!18841))

(assert (=> b!187094 m!213861))

(assert (=> b!187094 m!213861))

(assert (=> b!187094 m!213883))

(assert (=> b!187095 m!213861))

(assert (=> b!187095 m!213861))

(assert (=> b!187095 m!213883))

(assert (=> b!187096 m!213861))

(assert (=> b!187096 m!213861))

(declare-fun m!214131 () Bool)

(assert (=> b!187096 m!214131))

(assert (=> bm!18841 m!213861))

(declare-fun m!214133 () Bool)

(assert (=> bm!18841 m!214133))

(assert (=> b!186862 d!55445))

(declare-fun d!55447 () Bool)

(declare-fun e!123111 () Bool)

(assert (=> d!55447 e!123111))

(declare-fun res!88481 () Bool)

(assert (=> d!55447 (=> (not res!88481) (not e!123111))))

(declare-fun lt!92583 () ListLongMap!2341)

(assert (=> d!55447 (= res!88481 (contains!1296 lt!92583 (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(declare-fun lt!92582 () List!2344)

(assert (=> d!55447 (= lt!92583 (ListLongMap!2342 lt!92582))))

(declare-fun lt!92581 () Unit!5628)

(declare-fun lt!92580 () Unit!5628)

(assert (=> d!55447 (= lt!92581 lt!92580)))

(assert (=> d!55447 (= (getValueByKey!227 lt!92582 (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (=> d!55447 (= lt!92580 (lemmaContainsTupThenGetReturnValue!119 lt!92582 (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (=> d!55447 (= lt!92582 (insertStrictlySorted!122 (toList!1186 call!18820) (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))) (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (=> d!55447 (= (+!289 call!18820 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))) lt!92583)))

(declare-fun b!187099 () Bool)

(declare-fun res!88482 () Bool)

(assert (=> b!187099 (=> (not res!88482) (not e!123111))))

(assert (=> b!187099 (= res!88482 (= (getValueByKey!227 (toList!1186 lt!92583) (_1!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (Some!232 (_2!1721 (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(declare-fun b!187100 () Bool)

(assert (=> b!187100 (= e!123111 (contains!1298 (toList!1186 lt!92583) (tuple2!3421 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))

(assert (= (and d!55447 res!88481) b!187099))

(assert (= (and b!187099 res!88482) b!187100))

(declare-fun m!214135 () Bool)

(assert (=> d!55447 m!214135))

(declare-fun m!214137 () Bool)

(assert (=> d!55447 m!214137))

(declare-fun m!214139 () Bool)

(assert (=> d!55447 m!214139))

(declare-fun m!214141 () Bool)

(assert (=> d!55447 m!214141))

(declare-fun m!214143 () Bool)

(assert (=> b!187099 m!214143))

(declare-fun m!214145 () Bool)

(assert (=> b!187100 m!214145))

(assert (=> b!186833 d!55447))

(declare-fun mapNonEmpty!7532 () Bool)

(declare-fun mapRes!7532 () Bool)

(declare-fun tp!16613 () Bool)

(declare-fun e!123112 () Bool)

(assert (=> mapNonEmpty!7532 (= mapRes!7532 (and tp!16613 e!123112))))

(declare-fun mapValue!7532 () ValueCell!1841)

(declare-fun mapRest!7532 () (Array (_ BitVec 32) ValueCell!1841))

(declare-fun mapKey!7532 () (_ BitVec 32))

(assert (=> mapNonEmpty!7532 (= mapRest!7531 (store mapRest!7532 mapKey!7532 mapValue!7532))))

(declare-fun b!187102 () Bool)

(declare-fun e!123113 () Bool)

(assert (=> b!187102 (= e!123113 tp_is_empty!4369)))

(declare-fun mapIsEmpty!7532 () Bool)

(assert (=> mapIsEmpty!7532 mapRes!7532))

(declare-fun b!187101 () Bool)

(assert (=> b!187101 (= e!123112 tp_is_empty!4369)))

(declare-fun condMapEmpty!7532 () Bool)

(declare-fun mapDefault!7532 () ValueCell!1841)

(assert (=> mapNonEmpty!7531 (= condMapEmpty!7532 (= mapRest!7531 ((as const (Array (_ BitVec 32) ValueCell!1841)) mapDefault!7532)))))

(assert (=> mapNonEmpty!7531 (= tp!16612 (and e!123113 mapRes!7532))))

(assert (= (and mapNonEmpty!7531 condMapEmpty!7532) mapIsEmpty!7532))

(assert (= (and mapNonEmpty!7531 (not condMapEmpty!7532)) mapNonEmpty!7532))

(assert (= (and mapNonEmpty!7532 ((_ is ValueCellFull!1841) mapValue!7532)) b!187101))

(assert (= (and mapNonEmpty!7531 ((_ is ValueCellFull!1841) mapDefault!7532)) b!187102))

(declare-fun m!214147 () Bool)

(assert (=> mapNonEmpty!7532 m!214147))

(declare-fun b_lambda!7301 () Bool)

(assert (= b_lambda!7297 (or (and b!186664 b_free!4597) b_lambda!7301)))

(declare-fun b_lambda!7303 () Bool)

(assert (= b_lambda!7299 (or (and b!186664 b_free!4597) b_lambda!7303)))

(check-sat (not b!186905) (not b!187052) (not b!187094) (not b!186993) (not bm!18835) (not d!55433) (not bm!18831) (not b!187046) (not b!186917) (not b!186942) (not b!186967) (not d!55409) (not d!55395) (not b!186920) (not b!186916) (not b!187072) (not b!187008) (not d!55447) (not b!187006) (not b!186895) (not b!186922) b_and!11231 (not b!186898) (not d!55389) (not b_next!4597) (not d!55385) (not d!55387) (not b!187033) (not b!186928) (not d!55381) (not d!55391) (not d!55423) (not b!186936) (not b!187095) (not b!186923) (not b!187099) (not d!55403) (not bm!18838) (not b!186934) (not b!187082) (not d!55365) (not b!186900) (not bm!18841) (not d!55439) (not b!186919) (not b!186902) (not b!186927) (not d!55413) (not d!55405) (not b!186906) (not b_lambda!7295) (not b_lambda!7301) (not b!186969) (not d!55393) (not d!55441) (not d!55383) (not b!187083) (not d!55399) (not b!186921) (not b!187100) (not d!55371) (not mapNonEmpty!7532) (not b!187035) (not b!187077) (not b!187071) (not d!55379) (not bm!18826) (not d!55369) (not b!187030) (not b!187096) (not d!55373) (not bm!18832) (not d!55425) tp_is_empty!4369 (not b!187019) (not b!186896) (not d!55419) (not b!186935) (not d!55427) (not b!186925) (not b!187074) (not d!55377) (not d!55375) (not b!187018) (not d!55435) (not b_lambda!7303) (not d!55367) (not b!186899) (not d!55437))
(check-sat b_and!11231 (not b_next!4597))
