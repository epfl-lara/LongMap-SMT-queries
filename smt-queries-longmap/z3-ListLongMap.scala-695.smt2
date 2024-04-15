; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16678 () Bool)

(assert start!16678)

(declare-fun b!166759 () Bool)

(declare-fun b_free!3979 () Bool)

(declare-fun b_next!3979 () Bool)

(assert (=> b!166759 (= b_free!3979 (not b_next!3979))))

(declare-fun tp!14538 () Bool)

(declare-fun b_and!10367 () Bool)

(assert (=> b!166759 (= tp!14538 b_and!10367)))

(declare-fun b!166755 () Bool)

(declare-fun e!109453 () Bool)

(declare-fun tp_is_empty!3781 () Bool)

(assert (=> b!166755 (= e!109453 tp_is_empty!3781)))

(declare-fun res!79261 () Bool)

(declare-fun e!109449 () Bool)

(assert (=> start!16678 (=> (not res!79261) (not e!109449))))

(declare-datatypes ((V!4689 0))(
  ( (V!4690 (val!1935 Int)) )
))
(declare-datatypes ((ValueCell!1547 0))(
  ( (ValueCellFull!1547 (v!3794 V!4689)) (EmptyCell!1547) )
))
(declare-datatypes ((array!6639 0))(
  ( (array!6640 (arr!3154 (Array (_ BitVec 32) (_ BitVec 64))) (size!3443 (_ BitVec 32))) )
))
(declare-datatypes ((array!6641 0))(
  ( (array!6642 (arr!3155 (Array (_ BitVec 32) ValueCell!1547)) (size!3444 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2002 0))(
  ( (LongMapFixedSize!2003 (defaultEntry!3443 Int) (mask!8181 (_ BitVec 32)) (extraKeys!3184 (_ BitVec 32)) (zeroValue!3286 V!4689) (minValue!3286 V!4689) (_size!1050 (_ BitVec 32)) (_keys!5267 array!6639) (_values!3426 array!6641) (_vacant!1050 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2002)

(declare-fun valid!884 (LongMapFixedSize!2002) Bool)

(assert (=> start!16678 (= res!79261 (valid!884 thiss!1248))))

(assert (=> start!16678 e!109449))

(declare-fun e!109458 () Bool)

(assert (=> start!16678 e!109458))

(assert (=> start!16678 true))

(declare-fun b!166756 () Bool)

(declare-fun e!109451 () Bool)

(declare-fun e!109450 () Bool)

(declare-fun mapRes!6390 () Bool)

(assert (=> b!166756 (= e!109451 (and e!109450 mapRes!6390))))

(declare-fun condMapEmpty!6390 () Bool)

(declare-fun mapDefault!6390 () ValueCell!1547)

(assert (=> b!166756 (= condMapEmpty!6390 (= (arr!3155 (_values!3426 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1547)) mapDefault!6390)))))

(declare-fun b!166757 () Bool)

(declare-fun res!79260 () Bool)

(declare-fun e!109456 () Bool)

(assert (=> b!166757 (=> (not res!79260) (not e!109456))))

(assert (=> b!166757 (= res!79260 (and (= (size!3444 (_values!3426 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8181 thiss!1248))) (= (size!3443 (_keys!5267 thiss!1248)) (size!3444 (_values!3426 thiss!1248))) (bvsge (mask!8181 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3184 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3184 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166758 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!475 0))(
  ( (MissingZero!475 (index!4068 (_ BitVec 32))) (Found!475 (index!4069 (_ BitVec 32))) (Intermediate!475 (undefined!1287 Bool) (index!4070 (_ BitVec 32)) (x!18486 (_ BitVec 32))) (Undefined!475) (MissingVacant!475 (index!4071 (_ BitVec 32))) )
))
(declare-fun lt!83304 () SeekEntryResult!475)

(declare-fun e!109457 () Bool)

(assert (=> b!166758 (= e!109457 (= (select (arr!3154 (_keys!5267 thiss!1248)) (index!4069 lt!83304)) key!828))))

(declare-fun array_inv!2031 (array!6639) Bool)

(declare-fun array_inv!2032 (array!6641) Bool)

(assert (=> b!166759 (= e!109458 (and tp!14538 tp_is_empty!3781 (array_inv!2031 (_keys!5267 thiss!1248)) (array_inv!2032 (_values!3426 thiss!1248)) e!109451))))

(declare-fun mapNonEmpty!6390 () Bool)

(declare-fun tp!14537 () Bool)

(assert (=> mapNonEmpty!6390 (= mapRes!6390 (and tp!14537 e!109453))))

(declare-fun mapRest!6390 () (Array (_ BitVec 32) ValueCell!1547))

(declare-fun mapKey!6390 () (_ BitVec 32))

(declare-fun mapValue!6390 () ValueCell!1547)

(assert (=> mapNonEmpty!6390 (= (arr!3155 (_values!3426 thiss!1248)) (store mapRest!6390 mapKey!6390 mapValue!6390))))

(declare-fun b!166760 () Bool)

(declare-datatypes ((Unit!5060 0))(
  ( (Unit!5061) )
))
(declare-fun e!109454 () Unit!5060)

(declare-fun Unit!5062 () Unit!5060)

(assert (=> b!166760 (= e!109454 Unit!5062)))

(declare-fun lt!83306 () Unit!5060)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!90 (array!6639 array!6641 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 64) Int) Unit!5060)

(assert (=> b!166760 (= lt!83306 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!90 (_keys!5267 thiss!1248) (_values!3426 thiss!1248) (mask!8181 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) key!828 (defaultEntry!3443 thiss!1248)))))

(assert (=> b!166760 false))

(declare-fun b!166761 () Bool)

(declare-fun e!109455 () Bool)

(assert (=> b!166761 (= e!109455 e!109456)))

(declare-fun res!79256 () Bool)

(assert (=> b!166761 (=> (not res!79256) (not e!109456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166761 (= res!79256 (validMask!0 (mask!8181 thiss!1248)))))

(declare-fun lt!83307 () Unit!5060)

(assert (=> b!166761 (= lt!83307 e!109454)))

(declare-fun c!30224 () Bool)

(declare-datatypes ((tuple2!3106 0))(
  ( (tuple2!3107 (_1!1564 (_ BitVec 64)) (_2!1564 V!4689)) )
))
(declare-datatypes ((List!2110 0))(
  ( (Nil!2107) (Cons!2106 (h!2723 tuple2!3106) (t!6903 List!2110)) )
))
(declare-datatypes ((ListLongMap!2049 0))(
  ( (ListLongMap!2050 (toList!1040 List!2110)) )
))
(declare-fun contains!1085 (ListLongMap!2049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!682 (array!6639 array!6641 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 32) Int) ListLongMap!2049)

(assert (=> b!166761 (= c!30224 (contains!1085 (getCurrentListMap!682 (_keys!5267 thiss!1248) (_values!3426 thiss!1248) (mask!8181 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3443 thiss!1248)) key!828))))

(declare-fun b!166762 () Bool)

(assert (=> b!166762 (= e!109449 e!109455)))

(declare-fun res!79258 () Bool)

(assert (=> b!166762 (=> (not res!79258) (not e!109455))))

(get-info :version)

(assert (=> b!166762 (= res!79258 (and (not ((_ is Undefined!475) lt!83304)) (not ((_ is MissingVacant!475) lt!83304)) (not ((_ is MissingZero!475) lt!83304)) ((_ is Found!475) lt!83304)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6639 (_ BitVec 32)) SeekEntryResult!475)

(assert (=> b!166762 (= lt!83304 (seekEntryOrOpen!0 key!828 (_keys!5267 thiss!1248) (mask!8181 thiss!1248)))))

(declare-fun b!166763 () Bool)

(declare-fun res!79255 () Bool)

(assert (=> b!166763 (=> (not res!79255) (not e!109456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6639 (_ BitVec 32)) Bool)

(assert (=> b!166763 (= res!79255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5267 thiss!1248) (mask!8181 thiss!1248)))))

(declare-fun b!166764 () Bool)

(declare-fun res!79259 () Bool)

(assert (=> b!166764 (=> (not res!79259) (not e!109449))))

(assert (=> b!166764 (= res!79259 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6390 () Bool)

(assert (=> mapIsEmpty!6390 mapRes!6390))

(declare-fun b!166765 () Bool)

(assert (=> b!166765 (= e!109456 false)))

(declare-fun lt!83305 () Bool)

(declare-datatypes ((List!2111 0))(
  ( (Nil!2108) (Cons!2107 (h!2724 (_ BitVec 64)) (t!6904 List!2111)) )
))
(declare-fun arrayNoDuplicates!0 (array!6639 (_ BitVec 32) List!2111) Bool)

(assert (=> b!166765 (= lt!83305 (arrayNoDuplicates!0 (_keys!5267 thiss!1248) #b00000000000000000000000000000000 Nil!2108))))

(declare-fun b!166766 () Bool)

(assert (=> b!166766 (= e!109450 tp_is_empty!3781)))

(declare-fun b!166767 () Bool)

(declare-fun lt!83303 () Unit!5060)

(assert (=> b!166767 (= e!109454 lt!83303)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!93 (array!6639 array!6641 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 64) Int) Unit!5060)

(assert (=> b!166767 (= lt!83303 (lemmaInListMapThenSeekEntryOrOpenFindsIt!93 (_keys!5267 thiss!1248) (_values!3426 thiss!1248) (mask!8181 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) key!828 (defaultEntry!3443 thiss!1248)))))

(declare-fun res!79257 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166767 (= res!79257 (inRange!0 (index!4069 lt!83304) (mask!8181 thiss!1248)))))

(assert (=> b!166767 (=> (not res!79257) (not e!109457))))

(assert (=> b!166767 e!109457))

(assert (= (and start!16678 res!79261) b!166764))

(assert (= (and b!166764 res!79259) b!166762))

(assert (= (and b!166762 res!79258) b!166761))

(assert (= (and b!166761 c!30224) b!166767))

(assert (= (and b!166761 (not c!30224)) b!166760))

(assert (= (and b!166767 res!79257) b!166758))

(assert (= (and b!166761 res!79256) b!166757))

(assert (= (and b!166757 res!79260) b!166763))

(assert (= (and b!166763 res!79255) b!166765))

(assert (= (and b!166756 condMapEmpty!6390) mapIsEmpty!6390))

(assert (= (and b!166756 (not condMapEmpty!6390)) mapNonEmpty!6390))

(assert (= (and mapNonEmpty!6390 ((_ is ValueCellFull!1547) mapValue!6390)) b!166755))

(assert (= (and b!166756 ((_ is ValueCellFull!1547) mapDefault!6390)) b!166766))

(assert (= b!166759 b!166756))

(assert (= start!16678 b!166759))

(declare-fun m!195595 () Bool)

(assert (=> b!166762 m!195595))

(declare-fun m!195597 () Bool)

(assert (=> b!166765 m!195597))

(declare-fun m!195599 () Bool)

(assert (=> b!166760 m!195599))

(declare-fun m!195601 () Bool)

(assert (=> b!166761 m!195601))

(declare-fun m!195603 () Bool)

(assert (=> b!166761 m!195603))

(assert (=> b!166761 m!195603))

(declare-fun m!195605 () Bool)

(assert (=> b!166761 m!195605))

(declare-fun m!195607 () Bool)

(assert (=> b!166763 m!195607))

(declare-fun m!195609 () Bool)

(assert (=> b!166758 m!195609))

(declare-fun m!195611 () Bool)

(assert (=> mapNonEmpty!6390 m!195611))

(declare-fun m!195613 () Bool)

(assert (=> start!16678 m!195613))

(declare-fun m!195615 () Bool)

(assert (=> b!166767 m!195615))

(declare-fun m!195617 () Bool)

(assert (=> b!166767 m!195617))

(declare-fun m!195619 () Bool)

(assert (=> b!166759 m!195619))

(declare-fun m!195621 () Bool)

(assert (=> b!166759 m!195621))

(check-sat b_and!10367 (not b!166762) (not b_next!3979) (not b!166767) (not b!166761) (not b!166759) (not mapNonEmpty!6390) (not b!166760) tp_is_empty!3781 (not b!166765) (not start!16678) (not b!166763))
(check-sat b_and!10367 (not b_next!3979))
