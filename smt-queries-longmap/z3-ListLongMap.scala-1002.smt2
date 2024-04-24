; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21616 () Bool)

(assert start!21616)

(declare-fun b!216625 () Bool)

(declare-fun b_free!5761 () Bool)

(declare-fun b_next!5761 () Bool)

(assert (=> b!216625 (= b_free!5761 (not b_next!5761))))

(declare-fun tp!20417 () Bool)

(declare-fun b_and!12665 () Bool)

(assert (=> b!216625 (= tp!20417 b_and!12665)))

(declare-fun res!105942 () Bool)

(declare-fun e!140929 () Bool)

(assert (=> start!21616 (=> (not res!105942) (not e!140929))))

(declare-datatypes ((V!7145 0))(
  ( (V!7146 (val!2856 Int)) )
))
(declare-datatypes ((ValueCell!2468 0))(
  ( (ValueCellFull!2468 (v!4875 V!7145)) (EmptyCell!2468) )
))
(declare-datatypes ((array!10483 0))(
  ( (array!10484 (arr!4963 (Array (_ BitVec 32) ValueCell!2468)) (size!5295 (_ BitVec 32))) )
))
(declare-datatypes ((array!10485 0))(
  ( (array!10486 (arr!4964 (Array (_ BitVec 32) (_ BitVec 64))) (size!5296 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2836 0))(
  ( (LongMapFixedSize!2837 (defaultEntry!4068 Int) (mask!9807 (_ BitVec 32)) (extraKeys!3805 (_ BitVec 32)) (zeroValue!3909 V!7145) (minValue!3909 V!7145) (_size!1467 (_ BitVec 32)) (_keys!6117 array!10485) (_values!4051 array!10483) (_vacant!1467 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2836)

(declare-fun valid!1172 (LongMapFixedSize!2836) Bool)

(assert (=> start!21616 (= res!105942 (valid!1172 thiss!1504))))

(assert (=> start!21616 e!140929))

(declare-fun e!140923 () Bool)

(assert (=> start!21616 e!140923))

(assert (=> start!21616 true))

(declare-fun b!216615 () Bool)

(declare-fun res!105937 () Bool)

(declare-fun e!140925 () Bool)

(assert (=> b!216615 (=> (not res!105937) (not e!140925))))

(assert (=> b!216615 (= res!105937 (and (= (size!5295 (_values!4051 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9807 thiss!1504))) (= (size!5296 (_keys!6117 thiss!1504)) (size!5295 (_values!4051 thiss!1504))) (bvsge (mask!9807 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3805 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3805 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216616 () Bool)

(assert (=> b!216616 (= e!140929 e!140925)))

(declare-fun res!105939 () Bool)

(assert (=> b!216616 (=> (not res!105939) (not e!140925))))

(declare-datatypes ((SeekEntryResult!732 0))(
  ( (MissingZero!732 (index!5098 (_ BitVec 32))) (Found!732 (index!5099 (_ BitVec 32))) (Intermediate!732 (undefined!1544 Bool) (index!5100 (_ BitVec 32)) (x!22636 (_ BitVec 32))) (Undefined!732) (MissingVacant!732 (index!5101 (_ BitVec 32))) )
))
(declare-fun lt!111248 () SeekEntryResult!732)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216616 (= res!105939 (or (= lt!111248 (MissingZero!732 index!297)) (= lt!111248 (MissingVacant!732 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10485 (_ BitVec 32)) SeekEntryResult!732)

(assert (=> b!216616 (= lt!111248 (seekEntryOrOpen!0 key!932 (_keys!6117 thiss!1504) (mask!9807 thiss!1504)))))

(declare-fun mapNonEmpty!9597 () Bool)

(declare-fun mapRes!9597 () Bool)

(declare-fun tp!20418 () Bool)

(declare-fun e!140924 () Bool)

(assert (=> mapNonEmpty!9597 (= mapRes!9597 (and tp!20418 e!140924))))

(declare-fun mapValue!9597 () ValueCell!2468)

(declare-fun mapKey!9597 () (_ BitVec 32))

(declare-fun mapRest!9597 () (Array (_ BitVec 32) ValueCell!2468))

(assert (=> mapNonEmpty!9597 (= (arr!4963 (_values!4051 thiss!1504)) (store mapRest!9597 mapKey!9597 mapValue!9597))))

(declare-fun b!216617 () Bool)

(declare-fun e!140927 () Bool)

(declare-fun tp_is_empty!5623 () Bool)

(assert (=> b!216617 (= e!140927 tp_is_empty!5623)))

(declare-fun b!216618 () Bool)

(assert (=> b!216618 (= e!140925 false)))

(declare-fun lt!111247 () Bool)

(declare-datatypes ((List!3081 0))(
  ( (Nil!3078) (Cons!3077 (h!3724 (_ BitVec 64)) (t!8028 List!3081)) )
))
(declare-fun arrayNoDuplicates!0 (array!10485 (_ BitVec 32) List!3081) Bool)

(assert (=> b!216618 (= lt!111247 (arrayNoDuplicates!0 (_keys!6117 thiss!1504) #b00000000000000000000000000000000 Nil!3078))))

(declare-fun b!216619 () Bool)

(declare-fun res!105938 () Bool)

(assert (=> b!216619 (=> (not res!105938) (not e!140925))))

(declare-datatypes ((tuple2!4180 0))(
  ( (tuple2!4181 (_1!2101 (_ BitVec 64)) (_2!2101 V!7145)) )
))
(declare-datatypes ((List!3082 0))(
  ( (Nil!3079) (Cons!3078 (h!3725 tuple2!4180) (t!8029 List!3082)) )
))
(declare-datatypes ((ListLongMap!3095 0))(
  ( (ListLongMap!3096 (toList!1563 List!3082)) )
))
(declare-fun contains!1418 (ListLongMap!3095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1095 (array!10485 array!10483 (_ BitVec 32) (_ BitVec 32) V!7145 V!7145 (_ BitVec 32) Int) ListLongMap!3095)

(assert (=> b!216619 (= res!105938 (contains!1418 (getCurrentListMap!1095 (_keys!6117 thiss!1504) (_values!4051 thiss!1504) (mask!9807 thiss!1504) (extraKeys!3805 thiss!1504) (zeroValue!3909 thiss!1504) (minValue!3909 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4068 thiss!1504)) key!932))))

(declare-fun b!216620 () Bool)

(declare-fun res!105941 () Bool)

(assert (=> b!216620 (=> (not res!105941) (not e!140925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10485 (_ BitVec 32)) Bool)

(assert (=> b!216620 (= res!105941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6117 thiss!1504) (mask!9807 thiss!1504)))))

(declare-fun mapIsEmpty!9597 () Bool)

(assert (=> mapIsEmpty!9597 mapRes!9597))

(declare-fun b!216621 () Bool)

(declare-fun res!105940 () Bool)

(assert (=> b!216621 (=> (not res!105940) (not e!140925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216621 (= res!105940 (validMask!0 (mask!9807 thiss!1504)))))

(declare-fun b!216622 () Bool)

(assert (=> b!216622 (= e!140924 tp_is_empty!5623)))

(declare-fun b!216623 () Bool)

(declare-fun res!105936 () Bool)

(assert (=> b!216623 (=> (not res!105936) (not e!140929))))

(assert (=> b!216623 (= res!105936 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216624 () Bool)

(declare-fun e!140928 () Bool)

(assert (=> b!216624 (= e!140928 (and e!140927 mapRes!9597))))

(declare-fun condMapEmpty!9597 () Bool)

(declare-fun mapDefault!9597 () ValueCell!2468)

(assert (=> b!216624 (= condMapEmpty!9597 (= (arr!4963 (_values!4051 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2468)) mapDefault!9597)))))

(declare-fun array_inv!3259 (array!10485) Bool)

(declare-fun array_inv!3260 (array!10483) Bool)

(assert (=> b!216625 (= e!140923 (and tp!20417 tp_is_empty!5623 (array_inv!3259 (_keys!6117 thiss!1504)) (array_inv!3260 (_values!4051 thiss!1504)) e!140928))))

(assert (= (and start!21616 res!105942) b!216623))

(assert (= (and b!216623 res!105936) b!216616))

(assert (= (and b!216616 res!105939) b!216619))

(assert (= (and b!216619 res!105938) b!216621))

(assert (= (and b!216621 res!105940) b!216615))

(assert (= (and b!216615 res!105937) b!216620))

(assert (= (and b!216620 res!105941) b!216618))

(assert (= (and b!216624 condMapEmpty!9597) mapIsEmpty!9597))

(assert (= (and b!216624 (not condMapEmpty!9597)) mapNonEmpty!9597))

(get-info :version)

(assert (= (and mapNonEmpty!9597 ((_ is ValueCellFull!2468) mapValue!9597)) b!216622))

(assert (= (and b!216624 ((_ is ValueCellFull!2468) mapDefault!9597)) b!216617))

(assert (= b!216625 b!216624))

(assert (= start!21616 b!216625))

(declare-fun m!243411 () Bool)

(assert (=> b!216616 m!243411))

(declare-fun m!243413 () Bool)

(assert (=> start!21616 m!243413))

(declare-fun m!243415 () Bool)

(assert (=> b!216618 m!243415))

(declare-fun m!243417 () Bool)

(assert (=> b!216619 m!243417))

(assert (=> b!216619 m!243417))

(declare-fun m!243419 () Bool)

(assert (=> b!216619 m!243419))

(declare-fun m!243421 () Bool)

(assert (=> b!216620 m!243421))

(declare-fun m!243423 () Bool)

(assert (=> b!216621 m!243423))

(declare-fun m!243425 () Bool)

(assert (=> b!216625 m!243425))

(declare-fun m!243427 () Bool)

(assert (=> b!216625 m!243427))

(declare-fun m!243429 () Bool)

(assert (=> mapNonEmpty!9597 m!243429))

(check-sat (not b!216619) tp_is_empty!5623 (not b!216625) (not mapNonEmpty!9597) (not b!216618) (not b!216621) (not b!216620) (not b_next!5761) (not b!216616) (not start!21616) b_and!12665)
(check-sat b_and!12665 (not b_next!5761))
