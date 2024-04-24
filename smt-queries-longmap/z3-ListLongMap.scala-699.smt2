; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16702 () Bool)

(assert start!16702)

(declare-fun b!167420 () Bool)

(declare-fun b_free!4003 () Bool)

(declare-fun b_next!4003 () Bool)

(assert (=> b!167420 (= b_free!4003 (not b_next!4003))))

(declare-fun tp!14610 () Bool)

(declare-fun b_and!10431 () Bool)

(assert (=> b!167420 (= tp!14610 b_and!10431)))

(declare-fun b!167417 () Bool)

(declare-fun e!109935 () Bool)

(declare-fun e!109943 () Bool)

(assert (=> b!167417 (= e!109935 e!109943)))

(declare-fun res!79627 () Bool)

(assert (=> b!167417 (=> (not res!79627) (not e!109943))))

(declare-datatypes ((SeekEntryResult!471 0))(
  ( (MissingZero!471 (index!4052 (_ BitVec 32))) (Found!471 (index!4053 (_ BitVec 32))) (Intermediate!471 (undefined!1283 Bool) (index!4054 (_ BitVec 32)) (x!18515 (_ BitVec 32))) (Undefined!471) (MissingVacant!471 (index!4055 (_ BitVec 32))) )
))
(declare-fun lt!83725 () SeekEntryResult!471)

(get-info :version)

(assert (=> b!167417 (= res!79627 (and (not ((_ is Undefined!471) lt!83725)) (not ((_ is MissingVacant!471) lt!83725)) (not ((_ is MissingZero!471) lt!83725)) ((_ is Found!471) lt!83725)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4721 0))(
  ( (V!4722 (val!1947 Int)) )
))
(declare-datatypes ((ValueCell!1559 0))(
  ( (ValueCellFull!1559 (v!3813 V!4721)) (EmptyCell!1559) )
))
(declare-datatypes ((array!6693 0))(
  ( (array!6694 (arr!3182 (Array (_ BitVec 32) (_ BitVec 64))) (size!3470 (_ BitVec 32))) )
))
(declare-datatypes ((array!6695 0))(
  ( (array!6696 (arr!3183 (Array (_ BitVec 32) ValueCell!1559)) (size!3471 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2026 0))(
  ( (LongMapFixedSize!2027 (defaultEntry!3455 Int) (mask!8202 (_ BitVec 32)) (extraKeys!3196 (_ BitVec 32)) (zeroValue!3298 V!4721) (minValue!3298 V!4721) (_size!1062 (_ BitVec 32)) (_keys!5280 array!6693) (_values!3438 array!6695) (_vacant!1062 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2026)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6693 (_ BitVec 32)) SeekEntryResult!471)

(assert (=> b!167417 (= lt!83725 (seekEntryOrOpen!0 key!828 (_keys!5280 thiss!1248) (mask!8202 thiss!1248)))))

(declare-fun b!167418 () Bool)

(declare-fun res!79626 () Bool)

(declare-fun e!109937 () Bool)

(assert (=> b!167418 (=> (not res!79626) (not e!109937))))

(assert (=> b!167418 (= res!79626 (and (= (size!3471 (_values!3438 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8202 thiss!1248))) (= (size!3470 (_keys!5280 thiss!1248)) (size!3471 (_values!3438 thiss!1248))) (bvsge (mask!8202 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3196 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3196 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167419 () Bool)

(declare-fun e!109938 () Bool)

(assert (=> b!167419 (= e!109938 (= (select (arr!3182 (_keys!5280 thiss!1248)) (index!4053 lt!83725)) key!828))))

(declare-fun e!109940 () Bool)

(declare-fun tp_is_empty!3805 () Bool)

(declare-fun e!109936 () Bool)

(declare-fun array_inv!2033 (array!6693) Bool)

(declare-fun array_inv!2034 (array!6695) Bool)

(assert (=> b!167420 (= e!109936 (and tp!14610 tp_is_empty!3805 (array_inv!2033 (_keys!5280 thiss!1248)) (array_inv!2034 (_values!3438 thiss!1248)) e!109940))))

(declare-fun b!167421 () Bool)

(declare-fun e!109942 () Bool)

(assert (=> b!167421 (= e!109942 tp_is_empty!3805)))

(declare-fun b!167422 () Bool)

(declare-fun res!79629 () Bool)

(assert (=> b!167422 (=> (not res!79629) (not e!109937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6693 (_ BitVec 32)) Bool)

(assert (=> b!167422 (= res!79629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5280 thiss!1248) (mask!8202 thiss!1248)))))

(declare-fun mapIsEmpty!6426 () Bool)

(declare-fun mapRes!6426 () Bool)

(assert (=> mapIsEmpty!6426 mapRes!6426))

(declare-fun b!167423 () Bool)

(declare-datatypes ((Unit!5134 0))(
  ( (Unit!5135) )
))
(declare-fun e!109934 () Unit!5134)

(declare-fun lt!83724 () Unit!5134)

(assert (=> b!167423 (= e!109934 lt!83724)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!107 (array!6693 array!6695 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 64) Int) Unit!5134)

(assert (=> b!167423 (= lt!83724 (lemmaInListMapThenSeekEntryOrOpenFindsIt!107 (_keys!5280 thiss!1248) (_values!3438 thiss!1248) (mask!8202 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) key!828 (defaultEntry!3455 thiss!1248)))))

(declare-fun res!79628 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167423 (= res!79628 (inRange!0 (index!4053 lt!83725) (mask!8202 thiss!1248)))))

(assert (=> b!167423 (=> (not res!79628) (not e!109938))))

(assert (=> b!167423 e!109938))

(declare-fun b!167424 () Bool)

(assert (=> b!167424 (= e!109943 e!109937)))

(declare-fun res!79623 () Bool)

(assert (=> b!167424 (=> (not res!79623) (not e!109937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167424 (= res!79623 (validMask!0 (mask!8202 thiss!1248)))))

(declare-fun lt!83727 () Unit!5134)

(assert (=> b!167424 (= lt!83727 e!109934)))

(declare-fun c!30299 () Bool)

(declare-datatypes ((tuple2!3098 0))(
  ( (tuple2!3099 (_1!1560 (_ BitVec 64)) (_2!1560 V!4721)) )
))
(declare-datatypes ((List!2112 0))(
  ( (Nil!2109) (Cons!2108 (h!2725 tuple2!3098) (t!6906 List!2112)) )
))
(declare-datatypes ((ListLongMap!2059 0))(
  ( (ListLongMap!2060 (toList!1045 List!2112)) )
))
(declare-fun contains!1097 (ListLongMap!2059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!707 (array!6693 array!6695 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 32) Int) ListLongMap!2059)

(assert (=> b!167424 (= c!30299 (contains!1097 (getCurrentListMap!707 (_keys!5280 thiss!1248) (_values!3438 thiss!1248) (mask!8202 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3455 thiss!1248)) key!828))))

(declare-fun b!167426 () Bool)

(declare-fun Unit!5136 () Unit!5134)

(assert (=> b!167426 (= e!109934 Unit!5136)))

(declare-fun lt!83726 () Unit!5134)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!102 (array!6693 array!6695 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 64) Int) Unit!5134)

(assert (=> b!167426 (= lt!83726 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!102 (_keys!5280 thiss!1248) (_values!3438 thiss!1248) (mask!8202 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) key!828 (defaultEntry!3455 thiss!1248)))))

(assert (=> b!167426 false))

(declare-fun b!167427 () Bool)

(assert (=> b!167427 (= e!109937 false)))

(declare-fun lt!83723 () Bool)

(declare-datatypes ((List!2113 0))(
  ( (Nil!2110) (Cons!2109 (h!2726 (_ BitVec 64)) (t!6907 List!2113)) )
))
(declare-fun arrayNoDuplicates!0 (array!6693 (_ BitVec 32) List!2113) Bool)

(assert (=> b!167427 (= lt!83723 (arrayNoDuplicates!0 (_keys!5280 thiss!1248) #b00000000000000000000000000000000 Nil!2110))))

(declare-fun mapNonEmpty!6426 () Bool)

(declare-fun tp!14609 () Bool)

(assert (=> mapNonEmpty!6426 (= mapRes!6426 (and tp!14609 e!109942))))

(declare-fun mapRest!6426 () (Array (_ BitVec 32) ValueCell!1559))

(declare-fun mapKey!6426 () (_ BitVec 32))

(declare-fun mapValue!6426 () ValueCell!1559)

(assert (=> mapNonEmpty!6426 (= (arr!3183 (_values!3438 thiss!1248)) (store mapRest!6426 mapKey!6426 mapValue!6426))))

(declare-fun b!167428 () Bool)

(declare-fun e!109941 () Bool)

(assert (=> b!167428 (= e!109940 (and e!109941 mapRes!6426))))

(declare-fun condMapEmpty!6426 () Bool)

(declare-fun mapDefault!6426 () ValueCell!1559)

(assert (=> b!167428 (= condMapEmpty!6426 (= (arr!3183 (_values!3438 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1559)) mapDefault!6426)))))

(declare-fun b!167429 () Bool)

(declare-fun res!79625 () Bool)

(assert (=> b!167429 (=> (not res!79625) (not e!109935))))

(assert (=> b!167429 (= res!79625 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167425 () Bool)

(assert (=> b!167425 (= e!109941 tp_is_empty!3805)))

(declare-fun res!79624 () Bool)

(assert (=> start!16702 (=> (not res!79624) (not e!109935))))

(declare-fun valid!894 (LongMapFixedSize!2026) Bool)

(assert (=> start!16702 (= res!79624 (valid!894 thiss!1248))))

(assert (=> start!16702 e!109935))

(assert (=> start!16702 e!109936))

(assert (=> start!16702 true))

(assert (= (and start!16702 res!79624) b!167429))

(assert (= (and b!167429 res!79625) b!167417))

(assert (= (and b!167417 res!79627) b!167424))

(assert (= (and b!167424 c!30299) b!167423))

(assert (= (and b!167424 (not c!30299)) b!167426))

(assert (= (and b!167423 res!79628) b!167419))

(assert (= (and b!167424 res!79623) b!167418))

(assert (= (and b!167418 res!79626) b!167422))

(assert (= (and b!167422 res!79629) b!167427))

(assert (= (and b!167428 condMapEmpty!6426) mapIsEmpty!6426))

(assert (= (and b!167428 (not condMapEmpty!6426)) mapNonEmpty!6426))

(assert (= (and mapNonEmpty!6426 ((_ is ValueCellFull!1559) mapValue!6426)) b!167421))

(assert (= (and b!167428 ((_ is ValueCellFull!1559) mapDefault!6426)) b!167425))

(assert (= b!167420 b!167428))

(assert (= start!16702 b!167420))

(declare-fun m!196733 () Bool)

(assert (=> b!167420 m!196733))

(declare-fun m!196735 () Bool)

(assert (=> b!167420 m!196735))

(declare-fun m!196737 () Bool)

(assert (=> mapNonEmpty!6426 m!196737))

(declare-fun m!196739 () Bool)

(assert (=> b!167419 m!196739))

(declare-fun m!196741 () Bool)

(assert (=> b!167424 m!196741))

(declare-fun m!196743 () Bool)

(assert (=> b!167424 m!196743))

(assert (=> b!167424 m!196743))

(declare-fun m!196745 () Bool)

(assert (=> b!167424 m!196745))

(declare-fun m!196747 () Bool)

(assert (=> b!167426 m!196747))

(declare-fun m!196749 () Bool)

(assert (=> b!167427 m!196749))

(declare-fun m!196751 () Bool)

(assert (=> b!167423 m!196751))

(declare-fun m!196753 () Bool)

(assert (=> b!167423 m!196753))

(declare-fun m!196755 () Bool)

(assert (=> start!16702 m!196755))

(declare-fun m!196757 () Bool)

(assert (=> b!167417 m!196757))

(declare-fun m!196759 () Bool)

(assert (=> b!167422 m!196759))

(check-sat (not mapNonEmpty!6426) (not b!167427) (not b!167417) (not b!167422) tp_is_empty!3805 (not b!167423) (not b!167424) (not start!16702) (not b!167426) (not b_next!4003) (not b!167420) b_and!10431)
(check-sat b_and!10431 (not b_next!4003))
