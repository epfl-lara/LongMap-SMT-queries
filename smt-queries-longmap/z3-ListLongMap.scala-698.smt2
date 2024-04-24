; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16696 () Bool)

(assert start!16696)

(declare-fun b!167302 () Bool)

(declare-fun b_free!3997 () Bool)

(declare-fun b_next!3997 () Bool)

(assert (=> b!167302 (= b_free!3997 (not b_next!3997))))

(declare-fun tp!14591 () Bool)

(declare-fun b_and!10425 () Bool)

(assert (=> b!167302 (= tp!14591 b_and!10425)))

(declare-fun b!167301 () Bool)

(declare-datatypes ((Unit!5127 0))(
  ( (Unit!5128) )
))
(declare-fun e!109849 () Unit!5127)

(declare-fun Unit!5129 () Unit!5127)

(assert (=> b!167301 (= e!109849 Unit!5129)))

(declare-fun lt!83679 () Unit!5127)

(declare-datatypes ((V!4713 0))(
  ( (V!4714 (val!1944 Int)) )
))
(declare-datatypes ((ValueCell!1556 0))(
  ( (ValueCellFull!1556 (v!3810 V!4713)) (EmptyCell!1556) )
))
(declare-datatypes ((array!6681 0))(
  ( (array!6682 (arr!3176 (Array (_ BitVec 32) (_ BitVec 64))) (size!3464 (_ BitVec 32))) )
))
(declare-datatypes ((array!6683 0))(
  ( (array!6684 (arr!3177 (Array (_ BitVec 32) ValueCell!1556)) (size!3465 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2020 0))(
  ( (LongMapFixedSize!2021 (defaultEntry!3452 Int) (mask!8197 (_ BitVec 32)) (extraKeys!3193 (_ BitVec 32)) (zeroValue!3295 V!4713) (minValue!3295 V!4713) (_size!1059 (_ BitVec 32)) (_keys!5277 array!6681) (_values!3435 array!6683) (_vacant!1059 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2020)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!101 (array!6681 array!6683 (_ BitVec 32) (_ BitVec 32) V!4713 V!4713 (_ BitVec 64) Int) Unit!5127)

(assert (=> b!167301 (= lt!83679 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!101 (_keys!5277 thiss!1248) (_values!3435 thiss!1248) (mask!8197 thiss!1248) (extraKeys!3193 thiss!1248) (zeroValue!3295 thiss!1248) (minValue!3295 thiss!1248) key!828 (defaultEntry!3452 thiss!1248)))))

(assert (=> b!167301 false))

(declare-fun tp_is_empty!3799 () Bool)

(declare-fun e!109851 () Bool)

(declare-fun e!109844 () Bool)

(declare-fun array_inv!2029 (array!6681) Bool)

(declare-fun array_inv!2030 (array!6683) Bool)

(assert (=> b!167302 (= e!109844 (and tp!14591 tp_is_empty!3799 (array_inv!2029 (_keys!5277 thiss!1248)) (array_inv!2030 (_values!3435 thiss!1248)) e!109851))))

(declare-fun b!167303 () Bool)

(declare-fun e!109846 () Bool)

(declare-datatypes ((SeekEntryResult!468 0))(
  ( (MissingZero!468 (index!4040 (_ BitVec 32))) (Found!468 (index!4041 (_ BitVec 32))) (Intermediate!468 (undefined!1280 Bool) (index!4042 (_ BitVec 32)) (x!18504 (_ BitVec 32))) (Undefined!468) (MissingVacant!468 (index!4043 (_ BitVec 32))) )
))
(declare-fun lt!83681 () SeekEntryResult!468)

(assert (=> b!167303 (= e!109846 (= (select (arr!3176 (_keys!5277 thiss!1248)) (index!4041 lt!83681)) key!828))))

(declare-fun b!167304 () Bool)

(declare-fun lt!83682 () Unit!5127)

(assert (=> b!167304 (= e!109849 lt!83682)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!105 (array!6681 array!6683 (_ BitVec 32) (_ BitVec 32) V!4713 V!4713 (_ BitVec 64) Int) Unit!5127)

(assert (=> b!167304 (= lt!83682 (lemmaInListMapThenSeekEntryOrOpenFindsIt!105 (_keys!5277 thiss!1248) (_values!3435 thiss!1248) (mask!8197 thiss!1248) (extraKeys!3193 thiss!1248) (zeroValue!3295 thiss!1248) (minValue!3295 thiss!1248) key!828 (defaultEntry!3452 thiss!1248)))))

(declare-fun res!79565 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167304 (= res!79565 (inRange!0 (index!4041 lt!83681) (mask!8197 thiss!1248)))))

(assert (=> b!167304 (=> (not res!79565) (not e!109846))))

(assert (=> b!167304 e!109846))

(declare-fun b!167305 () Bool)

(declare-fun e!109848 () Bool)

(declare-fun mapRes!6417 () Bool)

(assert (=> b!167305 (= e!109851 (and e!109848 mapRes!6417))))

(declare-fun condMapEmpty!6417 () Bool)

(declare-fun mapDefault!6417 () ValueCell!1556)

(assert (=> b!167305 (= condMapEmpty!6417 (= (arr!3177 (_values!3435 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1556)) mapDefault!6417)))))

(declare-fun b!167306 () Bool)

(declare-fun res!79564 () Bool)

(declare-fun e!109852 () Bool)

(assert (=> b!167306 (=> (not res!79564) (not e!109852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6681 (_ BitVec 32)) Bool)

(assert (=> b!167306 (= res!79564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5277 thiss!1248) (mask!8197 thiss!1248)))))

(declare-fun b!167307 () Bool)

(declare-fun e!109847 () Bool)

(assert (=> b!167307 (= e!109847 e!109852)))

(declare-fun res!79560 () Bool)

(assert (=> b!167307 (=> (not res!79560) (not e!109852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167307 (= res!79560 (validMask!0 (mask!8197 thiss!1248)))))

(declare-fun lt!83678 () Unit!5127)

(assert (=> b!167307 (= lt!83678 e!109849)))

(declare-fun c!30290 () Bool)

(declare-datatypes ((tuple2!3092 0))(
  ( (tuple2!3093 (_1!1557 (_ BitVec 64)) (_2!1557 V!4713)) )
))
(declare-datatypes ((List!2107 0))(
  ( (Nil!2104) (Cons!2103 (h!2720 tuple2!3092) (t!6901 List!2107)) )
))
(declare-datatypes ((ListLongMap!2053 0))(
  ( (ListLongMap!2054 (toList!1042 List!2107)) )
))
(declare-fun contains!1094 (ListLongMap!2053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!704 (array!6681 array!6683 (_ BitVec 32) (_ BitVec 32) V!4713 V!4713 (_ BitVec 32) Int) ListLongMap!2053)

(assert (=> b!167307 (= c!30290 (contains!1094 (getCurrentListMap!704 (_keys!5277 thiss!1248) (_values!3435 thiss!1248) (mask!8197 thiss!1248) (extraKeys!3193 thiss!1248) (zeroValue!3295 thiss!1248) (minValue!3295 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3452 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!6417 () Bool)

(assert (=> mapIsEmpty!6417 mapRes!6417))

(declare-fun b!167300 () Bool)

(declare-fun e!109853 () Bool)

(assert (=> b!167300 (= e!109853 tp_is_empty!3799)))

(declare-fun res!79562 () Bool)

(declare-fun e!109845 () Bool)

(assert (=> start!16696 (=> (not res!79562) (not e!109845))))

(declare-fun valid!893 (LongMapFixedSize!2020) Bool)

(assert (=> start!16696 (= res!79562 (valid!893 thiss!1248))))

(assert (=> start!16696 e!109845))

(assert (=> start!16696 e!109844))

(assert (=> start!16696 true))

(declare-fun b!167308 () Bool)

(assert (=> b!167308 (= e!109845 e!109847)))

(declare-fun res!79566 () Bool)

(assert (=> b!167308 (=> (not res!79566) (not e!109847))))

(get-info :version)

(assert (=> b!167308 (= res!79566 (and (not ((_ is Undefined!468) lt!83681)) (not ((_ is MissingVacant!468) lt!83681)) (not ((_ is MissingZero!468) lt!83681)) ((_ is Found!468) lt!83681)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6681 (_ BitVec 32)) SeekEntryResult!468)

(assert (=> b!167308 (= lt!83681 (seekEntryOrOpen!0 key!828 (_keys!5277 thiss!1248) (mask!8197 thiss!1248)))))

(declare-fun mapNonEmpty!6417 () Bool)

(declare-fun tp!14592 () Bool)

(assert (=> mapNonEmpty!6417 (= mapRes!6417 (and tp!14592 e!109853))))

(declare-fun mapKey!6417 () (_ BitVec 32))

(declare-fun mapValue!6417 () ValueCell!1556)

(declare-fun mapRest!6417 () (Array (_ BitVec 32) ValueCell!1556))

(assert (=> mapNonEmpty!6417 (= (arr!3177 (_values!3435 thiss!1248)) (store mapRest!6417 mapKey!6417 mapValue!6417))))

(declare-fun b!167309 () Bool)

(assert (=> b!167309 (= e!109848 tp_is_empty!3799)))

(declare-fun b!167310 () Bool)

(declare-fun res!79561 () Bool)

(assert (=> b!167310 (=> (not res!79561) (not e!109852))))

(assert (=> b!167310 (= res!79561 (and (= (size!3465 (_values!3435 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8197 thiss!1248))) (= (size!3464 (_keys!5277 thiss!1248)) (size!3465 (_values!3435 thiss!1248))) (bvsge (mask!8197 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3193 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3193 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167311 () Bool)

(assert (=> b!167311 (= e!109852 false)))

(declare-fun lt!83680 () Bool)

(declare-datatypes ((List!2108 0))(
  ( (Nil!2105) (Cons!2104 (h!2721 (_ BitVec 64)) (t!6902 List!2108)) )
))
(declare-fun arrayNoDuplicates!0 (array!6681 (_ BitVec 32) List!2108) Bool)

(assert (=> b!167311 (= lt!83680 (arrayNoDuplicates!0 (_keys!5277 thiss!1248) #b00000000000000000000000000000000 Nil!2105))))

(declare-fun b!167312 () Bool)

(declare-fun res!79563 () Bool)

(assert (=> b!167312 (=> (not res!79563) (not e!109845))))

(assert (=> b!167312 (= res!79563 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16696 res!79562) b!167312))

(assert (= (and b!167312 res!79563) b!167308))

(assert (= (and b!167308 res!79566) b!167307))

(assert (= (and b!167307 c!30290) b!167304))

(assert (= (and b!167307 (not c!30290)) b!167301))

(assert (= (and b!167304 res!79565) b!167303))

(assert (= (and b!167307 res!79560) b!167310))

(assert (= (and b!167310 res!79561) b!167306))

(assert (= (and b!167306 res!79564) b!167311))

(assert (= (and b!167305 condMapEmpty!6417) mapIsEmpty!6417))

(assert (= (and b!167305 (not condMapEmpty!6417)) mapNonEmpty!6417))

(assert (= (and mapNonEmpty!6417 ((_ is ValueCellFull!1556) mapValue!6417)) b!167300))

(assert (= (and b!167305 ((_ is ValueCellFull!1556) mapDefault!6417)) b!167309))

(assert (= b!167302 b!167305))

(assert (= start!16696 b!167302))

(declare-fun m!196649 () Bool)

(assert (=> b!167301 m!196649))

(declare-fun m!196651 () Bool)

(assert (=> mapNonEmpty!6417 m!196651))

(declare-fun m!196653 () Bool)

(assert (=> b!167306 m!196653))

(declare-fun m!196655 () Bool)

(assert (=> b!167304 m!196655))

(declare-fun m!196657 () Bool)

(assert (=> b!167304 m!196657))

(declare-fun m!196659 () Bool)

(assert (=> b!167303 m!196659))

(declare-fun m!196661 () Bool)

(assert (=> b!167307 m!196661))

(declare-fun m!196663 () Bool)

(assert (=> b!167307 m!196663))

(assert (=> b!167307 m!196663))

(declare-fun m!196665 () Bool)

(assert (=> b!167307 m!196665))

(declare-fun m!196667 () Bool)

(assert (=> b!167308 m!196667))

(declare-fun m!196669 () Bool)

(assert (=> start!16696 m!196669))

(declare-fun m!196671 () Bool)

(assert (=> b!167302 m!196671))

(declare-fun m!196673 () Bool)

(assert (=> b!167302 m!196673))

(declare-fun m!196675 () Bool)

(assert (=> b!167311 m!196675))

(check-sat tp_is_empty!3799 (not b!167301) (not mapNonEmpty!6417) (not start!16696) (not b!167302) (not b!167304) (not b!167311) (not b_next!3997) (not b!167307) (not b!167308) (not b!167306) b_and!10425)
(check-sat b_and!10425 (not b_next!3997))
