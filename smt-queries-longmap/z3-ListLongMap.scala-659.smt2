; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16306 () Bool)

(assert start!16306)

(declare-fun b!162537 () Bool)

(declare-fun b_free!3763 () Bool)

(declare-fun b_next!3763 () Bool)

(assert (=> b!162537 (= b_free!3763 (not b_next!3763))))

(declare-fun tp!13858 () Bool)

(declare-fun b_and!10151 () Bool)

(assert (=> b!162537 (= tp!13858 b_and!10151)))

(declare-fun b!162532 () Bool)

(declare-fun e!106581 () Bool)

(declare-fun e!106576 () Bool)

(declare-fun mapRes!6035 () Bool)

(assert (=> b!162532 (= e!106581 (and e!106576 mapRes!6035))))

(declare-fun condMapEmpty!6035 () Bool)

(declare-datatypes ((V!4401 0))(
  ( (V!4402 (val!1827 Int)) )
))
(declare-datatypes ((ValueCell!1439 0))(
  ( (ValueCellFull!1439 (v!3686 V!4401)) (EmptyCell!1439) )
))
(declare-datatypes ((array!6189 0))(
  ( (array!6190 (arr!2938 (Array (_ BitVec 32) (_ BitVec 64))) (size!3223 (_ BitVec 32))) )
))
(declare-datatypes ((array!6191 0))(
  ( (array!6192 (arr!2939 (Array (_ BitVec 32) ValueCell!1439)) (size!3224 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1786 0))(
  ( (LongMapFixedSize!1787 (defaultEntry!3335 Int) (mask!7964 (_ BitVec 32)) (extraKeys!3076 (_ BitVec 32)) (zeroValue!3178 V!4401) (minValue!3178 V!4401) (_size!942 (_ BitVec 32)) (_keys!5135 array!6189) (_values!3318 array!6191) (_vacant!942 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1786)

(declare-fun mapDefault!6035 () ValueCell!1439)

(assert (=> b!162532 (= condMapEmpty!6035 (= (arr!2939 (_values!3318 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1439)) mapDefault!6035)))))

(declare-fun b!162533 () Bool)

(declare-fun e!106577 () Bool)

(declare-fun e!106578 () Bool)

(assert (=> b!162533 (= e!106577 e!106578)))

(declare-fun res!76950 () Bool)

(assert (=> b!162533 (=> (not res!76950) (not e!106578))))

(declare-datatypes ((SeekEntryResult!400 0))(
  ( (MissingZero!400 (index!3768 (_ BitVec 32))) (Found!400 (index!3769 (_ BitVec 32))) (Intermediate!400 (undefined!1212 Bool) (index!3770 (_ BitVec 32)) (x!18015 (_ BitVec 32))) (Undefined!400) (MissingVacant!400 (index!3771 (_ BitVec 32))) )
))
(declare-fun lt!82341 () SeekEntryResult!400)

(get-info :version)

(assert (=> b!162533 (= res!76950 (and (not ((_ is Undefined!400) lt!82341)) (not ((_ is MissingVacant!400) lt!82341)) ((_ is MissingZero!400) lt!82341)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6189 (_ BitVec 32)) SeekEntryResult!400)

(assert (=> b!162533 (= lt!82341 (seekEntryOrOpen!0 key!828 (_keys!5135 thiss!1248) (mask!7964 thiss!1248)))))

(declare-fun b!162534 () Bool)

(declare-fun res!76949 () Bool)

(assert (=> b!162534 (=> (not res!76949) (not e!106577))))

(assert (=> b!162534 (= res!76949 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6035 () Bool)

(assert (=> mapIsEmpty!6035 mapRes!6035))

(declare-fun b!162535 () Bool)

(declare-fun tp_is_empty!3565 () Bool)

(assert (=> b!162535 (= e!106576 tp_is_empty!3565)))

(declare-fun mapNonEmpty!6035 () Bool)

(declare-fun tp!13859 () Bool)

(declare-fun e!106579 () Bool)

(assert (=> mapNonEmpty!6035 (= mapRes!6035 (and tp!13859 e!106579))))

(declare-fun mapValue!6035 () ValueCell!1439)

(declare-fun mapKey!6035 () (_ BitVec 32))

(declare-fun mapRest!6035 () (Array (_ BitVec 32) ValueCell!1439))

(assert (=> mapNonEmpty!6035 (= (arr!2939 (_values!3318 thiss!1248)) (store mapRest!6035 mapKey!6035 mapValue!6035))))

(declare-fun b!162536 () Bool)

(assert (=> b!162536 (= e!106578 false)))

(declare-fun lt!82340 () Bool)

(declare-fun v!309 () V!4401)

(declare-fun valid!809 (LongMapFixedSize!1786) Bool)

(declare-datatypes ((tuple2!3000 0))(
  ( (tuple2!3001 (_1!1511 Bool) (_2!1511 LongMapFixedSize!1786)) )
))
(declare-fun updateHelperNewKey!90 (LongMapFixedSize!1786 (_ BitVec 64) V!4401 (_ BitVec 32)) tuple2!3000)

(assert (=> b!162536 (= lt!82340 (valid!809 (_2!1511 (updateHelperNewKey!90 thiss!1248 key!828 v!309 (index!3768 lt!82341)))))))

(declare-fun e!106580 () Bool)

(declare-fun array_inv!1891 (array!6189) Bool)

(declare-fun array_inv!1892 (array!6191) Bool)

(assert (=> b!162537 (= e!106580 (and tp!13858 tp_is_empty!3565 (array_inv!1891 (_keys!5135 thiss!1248)) (array_inv!1892 (_values!3318 thiss!1248)) e!106581))))

(declare-fun b!162538 () Bool)

(assert (=> b!162538 (= e!106579 tp_is_empty!3565)))

(declare-fun res!76948 () Bool)

(assert (=> start!16306 (=> (not res!76948) (not e!106577))))

(assert (=> start!16306 (= res!76948 (valid!809 thiss!1248))))

(assert (=> start!16306 e!106577))

(assert (=> start!16306 e!106580))

(assert (=> start!16306 true))

(assert (=> start!16306 tp_is_empty!3565))

(assert (= (and start!16306 res!76948) b!162534))

(assert (= (and b!162534 res!76949) b!162533))

(assert (= (and b!162533 res!76950) b!162536))

(assert (= (and b!162532 condMapEmpty!6035) mapIsEmpty!6035))

(assert (= (and b!162532 (not condMapEmpty!6035)) mapNonEmpty!6035))

(assert (= (and mapNonEmpty!6035 ((_ is ValueCellFull!1439) mapValue!6035)) b!162538))

(assert (= (and b!162532 ((_ is ValueCellFull!1439) mapDefault!6035)) b!162535))

(assert (= b!162537 b!162532))

(assert (= start!16306 b!162537))

(declare-fun m!193093 () Bool)

(assert (=> b!162533 m!193093))

(declare-fun m!193095 () Bool)

(assert (=> b!162537 m!193095))

(declare-fun m!193097 () Bool)

(assert (=> b!162537 m!193097))

(declare-fun m!193099 () Bool)

(assert (=> mapNonEmpty!6035 m!193099))

(declare-fun m!193101 () Bool)

(assert (=> start!16306 m!193101))

(declare-fun m!193103 () Bool)

(assert (=> b!162536 m!193103))

(declare-fun m!193105 () Bool)

(assert (=> b!162536 m!193105))

(check-sat (not start!16306) (not mapNonEmpty!6035) b_and!10151 tp_is_empty!3565 (not b!162536) (not b!162533) (not b_next!3763) (not b!162537))
(check-sat b_and!10151 (not b_next!3763))
