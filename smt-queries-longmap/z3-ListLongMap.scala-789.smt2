; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18802 () Bool)

(assert start!18802)

(declare-fun b!185601 () Bool)

(declare-fun b_free!4573 () Bool)

(declare-fun b_next!4573 () Bool)

(assert (=> b!185601 (= b_free!4573 (not b_next!4573))))

(declare-fun tp!16517 () Bool)

(declare-fun b_and!11149 () Bool)

(assert (=> b!185601 (= tp!16517 b_and!11149)))

(declare-fun mapNonEmpty!7479 () Bool)

(declare-fun mapRes!7479 () Bool)

(declare-fun tp!16518 () Bool)

(declare-fun e!122110 () Bool)

(assert (=> mapNonEmpty!7479 (= mapRes!7479 (and tp!16518 e!122110))))

(declare-datatypes ((V!5441 0))(
  ( (V!5442 (val!2217 Int)) )
))
(declare-datatypes ((ValueCell!1829 0))(
  ( (ValueCellFull!1829 (v!4122 V!5441)) (EmptyCell!1829) )
))
(declare-fun mapValue!7479 () ValueCell!1829)

(declare-fun mapRest!7479 () (Array (_ BitVec 32) ValueCell!1829))

(declare-fun mapKey!7479 () (_ BitVec 32))

(declare-datatypes ((array!7879 0))(
  ( (array!7880 (arr!3718 (Array (_ BitVec 32) (_ BitVec 64))) (size!4035 (_ BitVec 32))) )
))
(declare-datatypes ((array!7881 0))(
  ( (array!7882 (arr!3719 (Array (_ BitVec 32) ValueCell!1829)) (size!4036 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2566 0))(
  ( (LongMapFixedSize!2567 (defaultEntry!3785 Int) (mask!8897 (_ BitVec 32)) (extraKeys!3522 (_ BitVec 32)) (zeroValue!3626 V!5441) (minValue!3626 V!5441) (_size!1332 (_ BitVec 32)) (_keys!5725 array!7879) (_values!3768 array!7881) (_vacant!1332 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2566)

(assert (=> mapNonEmpty!7479 (= (arr!3719 (_values!3768 thiss!1248)) (store mapRest!7479 mapKey!7479 mapValue!7479))))

(declare-fun b!185591 () Bool)

(declare-fun res!87776 () Bool)

(declare-fun e!122112 () Bool)

(assert (=> b!185591 (=> (not res!87776) (not e!122112))))

(assert (=> b!185591 (= res!87776 (and (= (size!4036 (_values!3768 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8897 thiss!1248))) (= (size!4035 (_keys!5725 thiss!1248)) (size!4036 (_values!3768 thiss!1248))) (bvsge (mask!8897 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3522 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3522 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185592 () Bool)

(declare-fun res!87771 () Bool)

(assert (=> b!185592 (=> (not res!87771) (not e!122112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7879 (_ BitVec 32)) Bool)

(assert (=> b!185592 (= res!87771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5725 thiss!1248) (mask!8897 thiss!1248)))))

(declare-fun mapIsEmpty!7479 () Bool)

(assert (=> mapIsEmpty!7479 mapRes!7479))

(declare-fun b!185593 () Bool)

(declare-fun e!122109 () Bool)

(declare-fun tp_is_empty!4345 () Bool)

(assert (=> b!185593 (= e!122109 tp_is_empty!4345)))

(declare-fun b!185594 () Bool)

(declare-fun e!122113 () Bool)

(assert (=> b!185594 (= e!122113 e!122112)))

(declare-fun res!87774 () Bool)

(assert (=> b!185594 (=> (not res!87774) (not e!122112))))

(declare-datatypes ((SeekEntryResult!636 0))(
  ( (MissingZero!636 (index!4714 (_ BitVec 32))) (Found!636 (index!4715 (_ BitVec 32))) (Intermediate!636 (undefined!1448 Bool) (index!4716 (_ BitVec 32)) (x!20165 (_ BitVec 32))) (Undefined!636) (MissingVacant!636 (index!4717 (_ BitVec 32))) )
))
(declare-fun lt!91675 () SeekEntryResult!636)

(get-info :version)

(assert (=> b!185594 (= res!87774 (and (not ((_ is Undefined!636) lt!91675)) (not ((_ is MissingVacant!636) lt!91675)) (not ((_ is MissingZero!636) lt!91675)) ((_ is Found!636) lt!91675)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7879 (_ BitVec 32)) SeekEntryResult!636)

(assert (=> b!185594 (= lt!91675 (seekEntryOrOpen!0 key!828 (_keys!5725 thiss!1248) (mask!8897 thiss!1248)))))

(declare-fun b!185595 () Bool)

(assert (=> b!185595 (= e!122112 false)))

(declare-fun lt!91676 () Bool)

(declare-datatypes ((List!2351 0))(
  ( (Nil!2348) (Cons!2347 (h!2980 (_ BitVec 64)) (t!7226 List!2351)) )
))
(declare-fun arrayNoDuplicates!0 (array!7879 (_ BitVec 32) List!2351) Bool)

(assert (=> b!185595 (= lt!91676 (arrayNoDuplicates!0 (_keys!5725 thiss!1248) #b00000000000000000000000000000000 Nil!2348))))

(declare-fun b!185596 () Bool)

(declare-fun res!87773 () Bool)

(assert (=> b!185596 (=> (not res!87773) (not e!122112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185596 (= res!87773 (validMask!0 (mask!8897 thiss!1248)))))

(declare-fun b!185597 () Bool)

(declare-fun res!87775 () Bool)

(assert (=> b!185597 (=> (not res!87775) (not e!122112))))

(declare-datatypes ((tuple2!3416 0))(
  ( (tuple2!3417 (_1!1719 (_ BitVec 64)) (_2!1719 V!5441)) )
))
(declare-datatypes ((List!2352 0))(
  ( (Nil!2349) (Cons!2348 (h!2981 tuple2!3416) (t!7227 List!2352)) )
))
(declare-datatypes ((ListLongMap!2325 0))(
  ( (ListLongMap!2326 (toList!1178 List!2352)) )
))
(declare-fun contains!1280 (ListLongMap!2325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!811 (array!7879 array!7881 (_ BitVec 32) (_ BitVec 32) V!5441 V!5441 (_ BitVec 32) Int) ListLongMap!2325)

(assert (=> b!185597 (= res!87775 (not (contains!1280 (getCurrentListMap!811 (_keys!5725 thiss!1248) (_values!3768 thiss!1248) (mask!8897 thiss!1248) (extraKeys!3522 thiss!1248) (zeroValue!3626 thiss!1248) (minValue!3626 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3785 thiss!1248)) key!828)))))

(declare-fun b!185598 () Bool)

(assert (=> b!185598 (= e!122110 tp_is_empty!4345)))

(declare-fun b!185599 () Bool)

(declare-fun res!87777 () Bool)

(assert (=> b!185599 (=> (not res!87777) (not e!122113))))

(assert (=> b!185599 (= res!87777 (not (= key!828 (bvneg key!828))))))

(declare-fun res!87772 () Bool)

(assert (=> start!18802 (=> (not res!87772) (not e!122113))))

(declare-fun valid!1077 (LongMapFixedSize!2566) Bool)

(assert (=> start!18802 (= res!87772 (valid!1077 thiss!1248))))

(assert (=> start!18802 e!122113))

(declare-fun e!122114 () Bool)

(assert (=> start!18802 e!122114))

(assert (=> start!18802 true))

(declare-fun b!185600 () Bool)

(declare-fun e!122108 () Bool)

(assert (=> b!185600 (= e!122108 (and e!122109 mapRes!7479))))

(declare-fun condMapEmpty!7479 () Bool)

(declare-fun mapDefault!7479 () ValueCell!1829)

(assert (=> b!185600 (= condMapEmpty!7479 (= (arr!3719 (_values!3768 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1829)) mapDefault!7479)))))

(declare-fun array_inv!2407 (array!7879) Bool)

(declare-fun array_inv!2408 (array!7881) Bool)

(assert (=> b!185601 (= e!122114 (and tp!16517 tp_is_empty!4345 (array_inv!2407 (_keys!5725 thiss!1248)) (array_inv!2408 (_values!3768 thiss!1248)) e!122108))))

(assert (= (and start!18802 res!87772) b!185599))

(assert (= (and b!185599 res!87777) b!185594))

(assert (= (and b!185594 res!87774) b!185597))

(assert (= (and b!185597 res!87775) b!185596))

(assert (= (and b!185596 res!87773) b!185591))

(assert (= (and b!185591 res!87776) b!185592))

(assert (= (and b!185592 res!87771) b!185595))

(assert (= (and b!185600 condMapEmpty!7479) mapIsEmpty!7479))

(assert (= (and b!185600 (not condMapEmpty!7479)) mapNonEmpty!7479))

(assert (= (and mapNonEmpty!7479 ((_ is ValueCellFull!1829) mapValue!7479)) b!185598))

(assert (= (and b!185600 ((_ is ValueCellFull!1829) mapDefault!7479)) b!185593))

(assert (= b!185601 b!185600))

(assert (= start!18802 b!185601))

(declare-fun m!212249 () Bool)

(assert (=> start!18802 m!212249))

(declare-fun m!212251 () Bool)

(assert (=> b!185592 m!212251))

(declare-fun m!212253 () Bool)

(assert (=> b!185594 m!212253))

(declare-fun m!212255 () Bool)

(assert (=> mapNonEmpty!7479 m!212255))

(declare-fun m!212257 () Bool)

(assert (=> b!185597 m!212257))

(assert (=> b!185597 m!212257))

(declare-fun m!212259 () Bool)

(assert (=> b!185597 m!212259))

(declare-fun m!212261 () Bool)

(assert (=> b!185595 m!212261))

(declare-fun m!212263 () Bool)

(assert (=> b!185601 m!212263))

(declare-fun m!212265 () Bool)

(assert (=> b!185601 m!212265))

(declare-fun m!212267 () Bool)

(assert (=> b!185596 m!212267))

(check-sat (not b!185592) tp_is_empty!4345 (not b!185601) (not mapNonEmpty!7479) (not b!185594) b_and!11149 (not b_next!4573) (not b!185596) (not start!18802) (not b!185597) (not b!185595))
(check-sat b_and!11149 (not b_next!4573))
