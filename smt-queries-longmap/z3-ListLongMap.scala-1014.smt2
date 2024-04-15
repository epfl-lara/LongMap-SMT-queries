; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21688 () Bool)

(assert start!21688)

(declare-fun b!217609 () Bool)

(declare-fun b_free!5833 () Bool)

(declare-fun b_next!5833 () Bool)

(assert (=> b!217609 (= b_free!5833 (not b_next!5833))))

(declare-fun tp!20633 () Bool)

(declare-fun b_and!12697 () Bool)

(assert (=> b!217609 (= tp!20633 b_and!12697)))

(declare-datatypes ((V!7241 0))(
  ( (V!7242 (val!2892 Int)) )
))
(declare-datatypes ((ValueCell!2504 0))(
  ( (ValueCellFull!2504 (v!4904 V!7241)) (EmptyCell!2504) )
))
(declare-datatypes ((array!10621 0))(
  ( (array!10622 (arr!5031 (Array (_ BitVec 32) ValueCell!2504)) (size!5364 (_ BitVec 32))) )
))
(declare-datatypes ((array!10623 0))(
  ( (array!10624 (arr!5032 (Array (_ BitVec 32) (_ BitVec 64))) (size!5365 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2908 0))(
  ( (LongMapFixedSize!2909 (defaultEntry!4104 Int) (mask!9866 (_ BitVec 32)) (extraKeys!3841 (_ BitVec 32)) (zeroValue!3945 V!7241) (minValue!3945 V!7241) (_size!1503 (_ BitVec 32)) (_keys!6152 array!10623) (_values!4087 array!10621) (_vacant!1503 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2908)

(declare-fun e!141560 () Bool)

(declare-fun tp_is_empty!5695 () Bool)

(declare-fun e!141555 () Bool)

(declare-fun array_inv!3315 (array!10623) Bool)

(declare-fun array_inv!3316 (array!10621) Bool)

(assert (=> b!217609 (= e!141555 (and tp!20633 tp_is_empty!5695 (array_inv!3315 (_keys!6152 thiss!1504)) (array_inv!3316 (_values!4087 thiss!1504)) e!141560))))

(declare-fun b!217610 () Bool)

(declare-fun e!141556 () Bool)

(assert (=> b!217610 (= e!141556 tp_is_empty!5695)))

(declare-fun b!217611 () Bool)

(declare-fun res!106578 () Bool)

(declare-fun e!141558 () Bool)

(assert (=> b!217611 (=> (not res!106578) (not e!141558))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4264 0))(
  ( (tuple2!4265 (_1!2143 (_ BitVec 64)) (_2!2143 V!7241)) )
))
(declare-datatypes ((List!3188 0))(
  ( (Nil!3185) (Cons!3184 (h!3831 tuple2!4264) (t!8134 List!3188)) )
))
(declare-datatypes ((ListLongMap!3167 0))(
  ( (ListLongMap!3168 (toList!1599 List!3188)) )
))
(declare-fun contains!1440 (ListLongMap!3167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1108 (array!10623 array!10621 (_ BitVec 32) (_ BitVec 32) V!7241 V!7241 (_ BitVec 32) Int) ListLongMap!3167)

(assert (=> b!217611 (= res!106578 (not (contains!1440 (getCurrentListMap!1108 (_keys!6152 thiss!1504) (_values!4087 thiss!1504) (mask!9866 thiss!1504) (extraKeys!3841 thiss!1504) (zeroValue!3945 thiss!1504) (minValue!3945 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4104 thiss!1504)) key!932)))))

(declare-fun b!217612 () Bool)

(declare-fun e!141557 () Bool)

(assert (=> b!217612 (= e!141557 e!141558)))

(declare-fun res!106580 () Bool)

(assert (=> b!217612 (=> (not res!106580) (not e!141558))))

(declare-datatypes ((SeekEntryResult!770 0))(
  ( (MissingZero!770 (index!5250 (_ BitVec 32))) (Found!770 (index!5251 (_ BitVec 32))) (Intermediate!770 (undefined!1582 Bool) (index!5252 (_ BitVec 32)) (x!22769 (_ BitVec 32))) (Undefined!770) (MissingVacant!770 (index!5253 (_ BitVec 32))) )
))
(declare-fun lt!111224 () SeekEntryResult!770)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217612 (= res!106580 (or (= lt!111224 (MissingZero!770 index!297)) (= lt!111224 (MissingVacant!770 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10623 (_ BitVec 32)) SeekEntryResult!770)

(assert (=> b!217612 (= lt!111224 (seekEntryOrOpen!0 key!932 (_keys!6152 thiss!1504) (mask!9866 thiss!1504)))))

(declare-fun mapIsEmpty!9705 () Bool)

(declare-fun mapRes!9705 () Bool)

(assert (=> mapIsEmpty!9705 mapRes!9705))

(declare-fun b!217613 () Bool)

(assert (=> b!217613 (= e!141558 false)))

(declare-fun lt!111223 () Bool)

(declare-datatypes ((List!3189 0))(
  ( (Nil!3186) (Cons!3185 (h!3832 (_ BitVec 64)) (t!8135 List!3189)) )
))
(declare-fun arrayNoDuplicates!0 (array!10623 (_ BitVec 32) List!3189) Bool)

(assert (=> b!217613 (= lt!111223 (arrayNoDuplicates!0 (_keys!6152 thiss!1504) #b00000000000000000000000000000000 Nil!3186))))

(declare-fun b!217614 () Bool)

(declare-fun e!141559 () Bool)

(assert (=> b!217614 (= e!141560 (and e!141559 mapRes!9705))))

(declare-fun condMapEmpty!9705 () Bool)

(declare-fun mapDefault!9705 () ValueCell!2504)

(assert (=> b!217614 (= condMapEmpty!9705 (= (arr!5031 (_values!4087 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2504)) mapDefault!9705)))))

(declare-fun b!217615 () Bool)

(assert (=> b!217615 (= e!141559 tp_is_empty!5695)))

(declare-fun res!106582 () Bool)

(assert (=> start!21688 (=> (not res!106582) (not e!141557))))

(declare-fun valid!1196 (LongMapFixedSize!2908) Bool)

(assert (=> start!21688 (= res!106582 (valid!1196 thiss!1504))))

(assert (=> start!21688 e!141557))

(assert (=> start!21688 e!141555))

(assert (=> start!21688 true))

(declare-fun b!217616 () Bool)

(declare-fun res!106581 () Bool)

(assert (=> b!217616 (=> (not res!106581) (not e!141558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10623 (_ BitVec 32)) Bool)

(assert (=> b!217616 (= res!106581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6152 thiss!1504) (mask!9866 thiss!1504)))))

(declare-fun b!217617 () Bool)

(declare-fun res!106579 () Bool)

(assert (=> b!217617 (=> (not res!106579) (not e!141557))))

(assert (=> b!217617 (= res!106579 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217618 () Bool)

(declare-fun res!106577 () Bool)

(assert (=> b!217618 (=> (not res!106577) (not e!141558))))

(assert (=> b!217618 (= res!106577 (and (= (size!5364 (_values!4087 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9866 thiss!1504))) (= (size!5365 (_keys!6152 thiss!1504)) (size!5364 (_values!4087 thiss!1504))) (bvsge (mask!9866 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3841 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3841 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9705 () Bool)

(declare-fun tp!20634 () Bool)

(assert (=> mapNonEmpty!9705 (= mapRes!9705 (and tp!20634 e!141556))))

(declare-fun mapValue!9705 () ValueCell!2504)

(declare-fun mapKey!9705 () (_ BitVec 32))

(declare-fun mapRest!9705 () (Array (_ BitVec 32) ValueCell!2504))

(assert (=> mapNonEmpty!9705 (= (arr!5031 (_values!4087 thiss!1504)) (store mapRest!9705 mapKey!9705 mapValue!9705))))

(declare-fun b!217619 () Bool)

(declare-fun res!106576 () Bool)

(assert (=> b!217619 (=> (not res!106576) (not e!141558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217619 (= res!106576 (validMask!0 (mask!9866 thiss!1504)))))

(assert (= (and start!21688 res!106582) b!217617))

(assert (= (and b!217617 res!106579) b!217612))

(assert (= (and b!217612 res!106580) b!217611))

(assert (= (and b!217611 res!106578) b!217619))

(assert (= (and b!217619 res!106576) b!217618))

(assert (= (and b!217618 res!106577) b!217616))

(assert (= (and b!217616 res!106581) b!217613))

(assert (= (and b!217614 condMapEmpty!9705) mapIsEmpty!9705))

(assert (= (and b!217614 (not condMapEmpty!9705)) mapNonEmpty!9705))

(get-info :version)

(assert (= (and mapNonEmpty!9705 ((_ is ValueCellFull!2504) mapValue!9705)) b!217610))

(assert (= (and b!217614 ((_ is ValueCellFull!2504) mapDefault!9705)) b!217615))

(assert (= b!217609 b!217614))

(assert (= start!21688 b!217609))

(declare-fun m!243333 () Bool)

(assert (=> b!217612 m!243333))

(declare-fun m!243335 () Bool)

(assert (=> start!21688 m!243335))

(declare-fun m!243337 () Bool)

(assert (=> b!217611 m!243337))

(assert (=> b!217611 m!243337))

(declare-fun m!243339 () Bool)

(assert (=> b!217611 m!243339))

(declare-fun m!243341 () Bool)

(assert (=> b!217616 m!243341))

(declare-fun m!243343 () Bool)

(assert (=> b!217613 m!243343))

(declare-fun m!243345 () Bool)

(assert (=> b!217619 m!243345))

(declare-fun m!243347 () Bool)

(assert (=> b!217609 m!243347))

(declare-fun m!243349 () Bool)

(assert (=> b!217609 m!243349))

(declare-fun m!243351 () Bool)

(assert (=> mapNonEmpty!9705 m!243351))

(check-sat (not b!217619) (not b!217612) (not mapNonEmpty!9705) (not start!21688) b_and!12697 (not b!217611) tp_is_empty!5695 (not b!217609) (not b_next!5833) (not b!217616) (not b!217613))
(check-sat b_and!12697 (not b_next!5833))
