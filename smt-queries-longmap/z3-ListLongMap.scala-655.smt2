; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16282 () Bool)

(assert start!16282)

(declare-fun b!162250 () Bool)

(declare-fun b_free!3739 () Bool)

(declare-fun b_next!3739 () Bool)

(assert (=> b!162250 (= b_free!3739 (not b_next!3739))))

(declare-fun tp!13786 () Bool)

(declare-fun b_and!10127 () Bool)

(assert (=> b!162250 (= tp!13786 b_and!10127)))

(declare-fun b!162244 () Bool)

(declare-fun e!106306 () Bool)

(declare-fun e!106308 () Bool)

(assert (=> b!162244 (= e!106306 e!106308)))

(declare-fun res!76804 () Bool)

(assert (=> b!162244 (=> (not res!76804) (not e!106308))))

(declare-datatypes ((SeekEntryResult!389 0))(
  ( (MissingZero!389 (index!3724 (_ BitVec 32))) (Found!389 (index!3725 (_ BitVec 32))) (Intermediate!389 (undefined!1201 Bool) (index!3726 (_ BitVec 32)) (x!17972 (_ BitVec 32))) (Undefined!389) (MissingVacant!389 (index!3727 (_ BitVec 32))) )
))
(declare-fun lt!82251 () SeekEntryResult!389)

(get-info :version)

(assert (=> b!162244 (= res!76804 (and (not ((_ is Undefined!389) lt!82251)) (not ((_ is MissingVacant!389) lt!82251)) ((_ is MissingZero!389) lt!82251)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4369 0))(
  ( (V!4370 (val!1815 Int)) )
))
(declare-datatypes ((ValueCell!1427 0))(
  ( (ValueCellFull!1427 (v!3674 V!4369)) (EmptyCell!1427) )
))
(declare-datatypes ((array!6141 0))(
  ( (array!6142 (arr!2914 (Array (_ BitVec 32) (_ BitVec 64))) (size!3199 (_ BitVec 32))) )
))
(declare-datatypes ((array!6143 0))(
  ( (array!6144 (arr!2915 (Array (_ BitVec 32) ValueCell!1427)) (size!3200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1762 0))(
  ( (LongMapFixedSize!1763 (defaultEntry!3323 Int) (mask!7944 (_ BitVec 32)) (extraKeys!3064 (_ BitVec 32)) (zeroValue!3166 V!4369) (minValue!3166 V!4369) (_size!930 (_ BitVec 32)) (_keys!5123 array!6141) (_values!3306 array!6143) (_vacant!930 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1762)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6141 (_ BitVec 32)) SeekEntryResult!389)

(assert (=> b!162244 (= lt!82251 (seekEntryOrOpen!0 key!828 (_keys!5123 thiss!1248) (mask!7944 thiss!1248)))))

(declare-fun b!162245 () Bool)

(declare-fun e!106309 () Bool)

(declare-fun tp_is_empty!3541 () Bool)

(assert (=> b!162245 (= e!106309 tp_is_empty!3541)))

(declare-fun res!76806 () Bool)

(assert (=> start!16282 (=> (not res!76806) (not e!106306))))

(declare-fun valid!798 (LongMapFixedSize!1762) Bool)

(assert (=> start!16282 (= res!76806 (valid!798 thiss!1248))))

(assert (=> start!16282 e!106306))

(declare-fun e!106310 () Bool)

(assert (=> start!16282 e!106310))

(assert (=> start!16282 true))

(assert (=> start!16282 tp_is_empty!3541))

(declare-fun b!162246 () Bool)

(declare-fun e!106311 () Bool)

(declare-fun e!106312 () Bool)

(declare-fun mapRes!5999 () Bool)

(assert (=> b!162246 (= e!106311 (and e!106312 mapRes!5999))))

(declare-fun condMapEmpty!5999 () Bool)

(declare-fun mapDefault!5999 () ValueCell!1427)

(assert (=> b!162246 (= condMapEmpty!5999 (= (arr!2915 (_values!3306 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1427)) mapDefault!5999)))))

(declare-fun mapIsEmpty!5999 () Bool)

(assert (=> mapIsEmpty!5999 mapRes!5999))

(declare-fun b!162247 () Bool)

(assert (=> b!162247 (= e!106308 false)))

(declare-fun v!309 () V!4369)

(declare-fun lt!82250 () Bool)

(declare-datatypes ((tuple2!2970 0))(
  ( (tuple2!2971 (_1!1496 Bool) (_2!1496 LongMapFixedSize!1762)) )
))
(declare-fun updateHelperNewKey!81 (LongMapFixedSize!1762 (_ BitVec 64) V!4369 (_ BitVec 32)) tuple2!2970)

(assert (=> b!162247 (= lt!82250 (valid!798 (_2!1496 (updateHelperNewKey!81 thiss!1248 key!828 v!309 (index!3724 lt!82251)))))))

(declare-fun b!162248 () Bool)

(assert (=> b!162248 (= e!106312 tp_is_empty!3541)))

(declare-fun b!162249 () Bool)

(declare-fun res!76805 () Bool)

(assert (=> b!162249 (=> (not res!76805) (not e!106306))))

(assert (=> b!162249 (= res!76805 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5999 () Bool)

(declare-fun tp!13787 () Bool)

(assert (=> mapNonEmpty!5999 (= mapRes!5999 (and tp!13787 e!106309))))

(declare-fun mapKey!5999 () (_ BitVec 32))

(declare-fun mapRest!5999 () (Array (_ BitVec 32) ValueCell!1427))

(declare-fun mapValue!5999 () ValueCell!1427)

(assert (=> mapNonEmpty!5999 (= (arr!2915 (_values!3306 thiss!1248)) (store mapRest!5999 mapKey!5999 mapValue!5999))))

(declare-fun array_inv!1879 (array!6141) Bool)

(declare-fun array_inv!1880 (array!6143) Bool)

(assert (=> b!162250 (= e!106310 (and tp!13786 tp_is_empty!3541 (array_inv!1879 (_keys!5123 thiss!1248)) (array_inv!1880 (_values!3306 thiss!1248)) e!106311))))

(assert (= (and start!16282 res!76806) b!162249))

(assert (= (and b!162249 res!76805) b!162244))

(assert (= (and b!162244 res!76804) b!162247))

(assert (= (and b!162246 condMapEmpty!5999) mapIsEmpty!5999))

(assert (= (and b!162246 (not condMapEmpty!5999)) mapNonEmpty!5999))

(assert (= (and mapNonEmpty!5999 ((_ is ValueCellFull!1427) mapValue!5999)) b!162245))

(assert (= (and b!162246 ((_ is ValueCellFull!1427) mapDefault!5999)) b!162248))

(assert (= b!162250 b!162246))

(assert (= start!16282 b!162250))

(declare-fun m!192901 () Bool)

(assert (=> mapNonEmpty!5999 m!192901))

(declare-fun m!192903 () Bool)

(assert (=> b!162244 m!192903))

(declare-fun m!192905 () Bool)

(assert (=> b!162250 m!192905))

(declare-fun m!192907 () Bool)

(assert (=> b!162250 m!192907))

(declare-fun m!192909 () Bool)

(assert (=> b!162247 m!192909))

(declare-fun m!192911 () Bool)

(assert (=> b!162247 m!192911))

(declare-fun m!192913 () Bool)

(assert (=> start!16282 m!192913))

(check-sat b_and!10127 (not start!16282) (not b!162247) tp_is_empty!3541 (not b_next!3739) (not b!162244) (not b!162250) (not mapNonEmpty!5999))
(check-sat b_and!10127 (not b_next!3739))
