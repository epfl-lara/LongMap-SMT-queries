; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16688 () Bool)

(assert start!16688)

(declare-fun b!167186 () Bool)

(declare-fun b_free!3993 () Bool)

(declare-fun b_next!3993 () Bool)

(assert (=> b!167186 (= b_free!3993 (not b_next!3993))))

(declare-fun tp!14580 () Bool)

(declare-fun b_and!10407 () Bool)

(assert (=> b!167186 (= tp!14580 b_and!10407)))

(declare-fun b!167175 () Bool)

(declare-datatypes ((Unit!5109 0))(
  ( (Unit!5110) )
))
(declare-fun e!109763 () Unit!5109)

(declare-fun lt!83591 () Unit!5109)

(assert (=> b!167175 (= e!109763 lt!83591)))

(declare-datatypes ((V!4707 0))(
  ( (V!4708 (val!1942 Int)) )
))
(declare-datatypes ((ValueCell!1554 0))(
  ( (ValueCellFull!1554 (v!3807 V!4707)) (EmptyCell!1554) )
))
(declare-datatypes ((array!6687 0))(
  ( (array!6688 (arr!3179 (Array (_ BitVec 32) (_ BitVec 64))) (size!3467 (_ BitVec 32))) )
))
(declare-datatypes ((array!6689 0))(
  ( (array!6690 (arr!3180 (Array (_ BitVec 32) ValueCell!1554)) (size!3468 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2016 0))(
  ( (LongMapFixedSize!2017 (defaultEntry!3450 Int) (mask!8193 (_ BitVec 32)) (extraKeys!3191 (_ BitVec 32)) (zeroValue!3293 V!4707) (minValue!3293 V!4707) (_size!1057 (_ BitVec 32)) (_keys!5275 array!6687) (_values!3433 array!6689) (_vacant!1057 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2016)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!100 (array!6687 array!6689 (_ BitVec 32) (_ BitVec 32) V!4707 V!4707 (_ BitVec 64) Int) Unit!5109)

(assert (=> b!167175 (= lt!83591 (lemmaInListMapThenSeekEntryOrOpenFindsIt!100 (_keys!5275 thiss!1248) (_values!3433 thiss!1248) (mask!8193 thiss!1248) (extraKeys!3191 thiss!1248) (zeroValue!3293 thiss!1248) (minValue!3293 thiss!1248) key!828 (defaultEntry!3450 thiss!1248)))))

(declare-fun res!79500 () Bool)

(declare-datatypes ((SeekEntryResult!473 0))(
  ( (MissingZero!473 (index!4060 (_ BitVec 32))) (Found!473 (index!4061 (_ BitVec 32))) (Intermediate!473 (undefined!1285 Bool) (index!4062 (_ BitVec 32)) (x!18501 (_ BitVec 32))) (Undefined!473) (MissingVacant!473 (index!4063 (_ BitVec 32))) )
))
(declare-fun lt!83590 () SeekEntryResult!473)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167175 (= res!79500 (inRange!0 (index!4061 lt!83590) (mask!8193 thiss!1248)))))

(declare-fun e!109762 () Bool)

(assert (=> b!167175 (=> (not res!79500) (not e!109762))))

(assert (=> b!167175 e!109762))

(declare-fun b!167176 () Bool)

(declare-fun e!109765 () Bool)

(declare-fun e!109767 () Bool)

(assert (=> b!167176 (= e!109765 e!109767)))

(declare-fun res!79502 () Bool)

(assert (=> b!167176 (=> (not res!79502) (not e!109767))))

(get-info :version)

(assert (=> b!167176 (= res!79502 (and (not ((_ is Undefined!473) lt!83590)) (not ((_ is MissingVacant!473) lt!83590)) (not ((_ is MissingZero!473) lt!83590)) ((_ is Found!473) lt!83590)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6687 (_ BitVec 32)) SeekEntryResult!473)

(assert (=> b!167176 (= lt!83590 (seekEntryOrOpen!0 key!828 (_keys!5275 thiss!1248) (mask!8193 thiss!1248)))))

(declare-fun b!167177 () Bool)

(declare-fun e!109764 () Bool)

(declare-fun tp_is_empty!3795 () Bool)

(assert (=> b!167177 (= e!109764 tp_is_empty!3795)))

(declare-fun mapNonEmpty!6411 () Bool)

(declare-fun mapRes!6411 () Bool)

(declare-fun tp!14579 () Bool)

(declare-fun e!109766 () Bool)

(assert (=> mapNonEmpty!6411 (= mapRes!6411 (and tp!14579 e!109766))))

(declare-fun mapValue!6411 () ValueCell!1554)

(declare-fun mapRest!6411 () (Array (_ BitVec 32) ValueCell!1554))

(declare-fun mapKey!6411 () (_ BitVec 32))

(assert (=> mapNonEmpty!6411 (= (arr!3180 (_values!3433 thiss!1248)) (store mapRest!6411 mapKey!6411 mapValue!6411))))

(declare-fun b!167178 () Bool)

(declare-fun res!79501 () Bool)

(declare-fun e!109761 () Bool)

(assert (=> b!167178 (=> (not res!79501) (not e!109761))))

(assert (=> b!167178 (= res!79501 (and (= (size!3468 (_values!3433 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8193 thiss!1248))) (= (size!3467 (_keys!5275 thiss!1248)) (size!3468 (_values!3433 thiss!1248))) (bvsge (mask!8193 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3191 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3191 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6411 () Bool)

(assert (=> mapIsEmpty!6411 mapRes!6411))

(declare-fun b!167180 () Bool)

(declare-fun Unit!5111 () Unit!5109)

(assert (=> b!167180 (= e!109763 Unit!5111)))

(declare-fun lt!83593 () Unit!5109)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!102 (array!6687 array!6689 (_ BitVec 32) (_ BitVec 32) V!4707 V!4707 (_ BitVec 64) Int) Unit!5109)

(assert (=> b!167180 (= lt!83593 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!102 (_keys!5275 thiss!1248) (_values!3433 thiss!1248) (mask!8193 thiss!1248) (extraKeys!3191 thiss!1248) (zeroValue!3293 thiss!1248) (minValue!3293 thiss!1248) key!828 (defaultEntry!3450 thiss!1248)))))

(assert (=> b!167180 false))

(declare-fun b!167181 () Bool)

(assert (=> b!167181 (= e!109761 false)))

(declare-fun lt!83592 () Bool)

(declare-datatypes ((List!2119 0))(
  ( (Nil!2116) (Cons!2115 (h!2732 (_ BitVec 64)) (t!6921 List!2119)) )
))
(declare-fun arrayNoDuplicates!0 (array!6687 (_ BitVec 32) List!2119) Bool)

(assert (=> b!167181 (= lt!83592 (arrayNoDuplicates!0 (_keys!5275 thiss!1248) #b00000000000000000000000000000000 Nil!2116))))

(declare-fun b!167182 () Bool)

(declare-fun e!109769 () Bool)

(assert (=> b!167182 (= e!109769 (and e!109764 mapRes!6411))))

(declare-fun condMapEmpty!6411 () Bool)

(declare-fun mapDefault!6411 () ValueCell!1554)

(assert (=> b!167182 (= condMapEmpty!6411 (= (arr!3180 (_values!3433 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1554)) mapDefault!6411)))))

(declare-fun b!167183 () Bool)

(declare-fun res!79499 () Bool)

(assert (=> b!167183 (=> (not res!79499) (not e!109765))))

(assert (=> b!167183 (= res!79499 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167184 () Bool)

(declare-fun res!79503 () Bool)

(assert (=> b!167184 (=> (not res!79503) (not e!109761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6687 (_ BitVec 32)) Bool)

(assert (=> b!167184 (= res!79503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5275 thiss!1248) (mask!8193 thiss!1248)))))

(declare-fun b!167185 () Bool)

(assert (=> b!167185 (= e!109766 tp_is_empty!3795)))

(declare-fun e!109760 () Bool)

(declare-fun array_inv!2045 (array!6687) Bool)

(declare-fun array_inv!2046 (array!6689) Bool)

(assert (=> b!167186 (= e!109760 (and tp!14580 tp_is_empty!3795 (array_inv!2045 (_keys!5275 thiss!1248)) (array_inv!2046 (_values!3433 thiss!1248)) e!109769))))

(declare-fun b!167187 () Bool)

(assert (=> b!167187 (= e!109762 (= (select (arr!3179 (_keys!5275 thiss!1248)) (index!4061 lt!83590)) key!828))))

(declare-fun res!79498 () Bool)

(assert (=> start!16688 (=> (not res!79498) (not e!109765))))

(declare-fun valid!883 (LongMapFixedSize!2016) Bool)

(assert (=> start!16688 (= res!79498 (valid!883 thiss!1248))))

(assert (=> start!16688 e!109765))

(assert (=> start!16688 e!109760))

(assert (=> start!16688 true))

(declare-fun b!167179 () Bool)

(assert (=> b!167179 (= e!109767 e!109761)))

(declare-fun res!79497 () Bool)

(assert (=> b!167179 (=> (not res!79497) (not e!109761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167179 (= res!79497 (validMask!0 (mask!8193 thiss!1248)))))

(declare-fun lt!83589 () Unit!5109)

(assert (=> b!167179 (= lt!83589 e!109763)))

(declare-fun c!30271 () Bool)

(declare-datatypes ((tuple2!3132 0))(
  ( (tuple2!3133 (_1!1577 (_ BitVec 64)) (_2!1577 V!4707)) )
))
(declare-datatypes ((List!2120 0))(
  ( (Nil!2117) (Cons!2116 (h!2733 tuple2!3132) (t!6922 List!2120)) )
))
(declare-datatypes ((ListLongMap!2087 0))(
  ( (ListLongMap!2088 (toList!1059 List!2120)) )
))
(declare-fun contains!1101 (ListLongMap!2087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!717 (array!6687 array!6689 (_ BitVec 32) (_ BitVec 32) V!4707 V!4707 (_ BitVec 32) Int) ListLongMap!2087)

(assert (=> b!167179 (= c!30271 (contains!1101 (getCurrentListMap!717 (_keys!5275 thiss!1248) (_values!3433 thiss!1248) (mask!8193 thiss!1248) (extraKeys!3191 thiss!1248) (zeroValue!3293 thiss!1248) (minValue!3293 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3450 thiss!1248)) key!828))))

(assert (= (and start!16688 res!79498) b!167183))

(assert (= (and b!167183 res!79499) b!167176))

(assert (= (and b!167176 res!79502) b!167179))

(assert (= (and b!167179 c!30271) b!167175))

(assert (= (and b!167179 (not c!30271)) b!167180))

(assert (= (and b!167175 res!79500) b!167187))

(assert (= (and b!167179 res!79497) b!167178))

(assert (= (and b!167178 res!79501) b!167184))

(assert (= (and b!167184 res!79503) b!167181))

(assert (= (and b!167182 condMapEmpty!6411) mapIsEmpty!6411))

(assert (= (and b!167182 (not condMapEmpty!6411)) mapNonEmpty!6411))

(assert (= (and mapNonEmpty!6411 ((_ is ValueCellFull!1554) mapValue!6411)) b!167185))

(assert (= (and b!167182 ((_ is ValueCellFull!1554) mapDefault!6411)) b!167177))

(assert (= b!167186 b!167182))

(assert (= start!16688 b!167186))

(declare-fun m!196411 () Bool)

(assert (=> b!167176 m!196411))

(declare-fun m!196413 () Bool)

(assert (=> b!167180 m!196413))

(declare-fun m!196415 () Bool)

(assert (=> b!167181 m!196415))

(declare-fun m!196417 () Bool)

(assert (=> mapNonEmpty!6411 m!196417))

(declare-fun m!196419 () Bool)

(assert (=> b!167175 m!196419))

(declare-fun m!196421 () Bool)

(assert (=> b!167175 m!196421))

(declare-fun m!196423 () Bool)

(assert (=> b!167187 m!196423))

(declare-fun m!196425 () Bool)

(assert (=> b!167186 m!196425))

(declare-fun m!196427 () Bool)

(assert (=> b!167186 m!196427))

(declare-fun m!196429 () Bool)

(assert (=> b!167179 m!196429))

(declare-fun m!196431 () Bool)

(assert (=> b!167179 m!196431))

(assert (=> b!167179 m!196431))

(declare-fun m!196433 () Bool)

(assert (=> b!167179 m!196433))

(declare-fun m!196435 () Bool)

(assert (=> start!16688 m!196435))

(declare-fun m!196437 () Bool)

(assert (=> b!167184 m!196437))

(check-sat (not b!167176) b_and!10407 (not start!16688) tp_is_empty!3795 (not b!167179) (not b!167180) (not b!167186) (not b!167175) (not b!167181) (not b!167184) (not b_next!3993) (not mapNonEmpty!6411))
(check-sat b_and!10407 (not b_next!3993))
