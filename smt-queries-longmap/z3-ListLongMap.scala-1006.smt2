; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21640 () Bool)

(assert start!21640)

(declare-fun b!217017 () Bool)

(declare-fun b_free!5785 () Bool)

(declare-fun b_next!5785 () Bool)

(assert (=> b!217017 (= b_free!5785 (not b_next!5785))))

(declare-fun tp!20489 () Bool)

(declare-fun b_and!12689 () Bool)

(assert (=> b!217017 (= tp!20489 b_and!12689)))

(declare-fun b!217011 () Bool)

(declare-fun res!106192 () Bool)

(declare-fun e!141175 () Bool)

(assert (=> b!217011 (=> (not res!106192) (not e!141175))))

(declare-datatypes ((V!7177 0))(
  ( (V!7178 (val!2868 Int)) )
))
(declare-datatypes ((ValueCell!2480 0))(
  ( (ValueCellFull!2480 (v!4887 V!7177)) (EmptyCell!2480) )
))
(declare-datatypes ((array!10531 0))(
  ( (array!10532 (arr!4987 (Array (_ BitVec 32) ValueCell!2480)) (size!5319 (_ BitVec 32))) )
))
(declare-datatypes ((array!10533 0))(
  ( (array!10534 (arr!4988 (Array (_ BitVec 32) (_ BitVec 64))) (size!5320 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2860 0))(
  ( (LongMapFixedSize!2861 (defaultEntry!4080 Int) (mask!9827 (_ BitVec 32)) (extraKeys!3817 (_ BitVec 32)) (zeroValue!3921 V!7177) (minValue!3921 V!7177) (_size!1479 (_ BitVec 32)) (_keys!6129 array!10533) (_values!4063 array!10531) (_vacant!1479 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2860)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10533 (_ BitVec 32)) Bool)

(assert (=> b!217011 (= res!106192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6129 thiss!1504) (mask!9827 thiss!1504)))))

(declare-fun b!217012 () Bool)

(assert (=> b!217012 (= e!141175 false)))

(declare-fun lt!111320 () Bool)

(declare-datatypes ((List!3090 0))(
  ( (Nil!3087) (Cons!3086 (h!3733 (_ BitVec 64)) (t!8037 List!3090)) )
))
(declare-fun arrayNoDuplicates!0 (array!10533 (_ BitVec 32) List!3090) Bool)

(assert (=> b!217012 (= lt!111320 (arrayNoDuplicates!0 (_keys!6129 thiss!1504) #b00000000000000000000000000000000 Nil!3087))))

(declare-fun b!217013 () Bool)

(declare-fun res!106194 () Bool)

(assert (=> b!217013 (=> (not res!106194) (not e!141175))))

(assert (=> b!217013 (= res!106194 (and (= (size!5319 (_values!4063 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9827 thiss!1504))) (= (size!5320 (_keys!6129 thiss!1504)) (size!5319 (_values!4063 thiss!1504))) (bvsge (mask!9827 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3817 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3817 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217014 () Bool)

(declare-fun e!141178 () Bool)

(declare-fun tp_is_empty!5647 () Bool)

(assert (=> b!217014 (= e!141178 tp_is_empty!5647)))

(declare-fun mapIsEmpty!9633 () Bool)

(declare-fun mapRes!9633 () Bool)

(assert (=> mapIsEmpty!9633 mapRes!9633))

(declare-fun b!217015 () Bool)

(declare-fun e!141180 () Bool)

(assert (=> b!217015 (= e!141180 tp_is_empty!5647)))

(declare-fun b!217016 () Bool)

(declare-fun e!141176 () Bool)

(assert (=> b!217016 (= e!141176 e!141175)))

(declare-fun res!106191 () Bool)

(assert (=> b!217016 (=> (not res!106191) (not e!141175))))

(declare-datatypes ((SeekEntryResult!738 0))(
  ( (MissingZero!738 (index!5122 (_ BitVec 32))) (Found!738 (index!5123 (_ BitVec 32))) (Intermediate!738 (undefined!1550 Bool) (index!5124 (_ BitVec 32)) (x!22674 (_ BitVec 32))) (Undefined!738) (MissingVacant!738 (index!5125 (_ BitVec 32))) )
))
(declare-fun lt!111319 () SeekEntryResult!738)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217016 (= res!106191 (or (= lt!111319 (MissingZero!738 index!297)) (= lt!111319 (MissingVacant!738 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10533 (_ BitVec 32)) SeekEntryResult!738)

(assert (=> b!217016 (= lt!111319 (seekEntryOrOpen!0 key!932 (_keys!6129 thiss!1504) (mask!9827 thiss!1504)))))

(declare-fun mapNonEmpty!9633 () Bool)

(declare-fun tp!20490 () Bool)

(assert (=> mapNonEmpty!9633 (= mapRes!9633 (and tp!20490 e!141180))))

(declare-fun mapValue!9633 () ValueCell!2480)

(declare-fun mapRest!9633 () (Array (_ BitVec 32) ValueCell!2480))

(declare-fun mapKey!9633 () (_ BitVec 32))

(assert (=> mapNonEmpty!9633 (= (arr!4987 (_values!4063 thiss!1504)) (store mapRest!9633 mapKey!9633 mapValue!9633))))

(declare-fun e!141179 () Bool)

(declare-fun e!141181 () Bool)

(declare-fun array_inv!3273 (array!10533) Bool)

(declare-fun array_inv!3274 (array!10531) Bool)

(assert (=> b!217017 (= e!141181 (and tp!20489 tp_is_empty!5647 (array_inv!3273 (_keys!6129 thiss!1504)) (array_inv!3274 (_values!4063 thiss!1504)) e!141179))))

(declare-fun res!106190 () Bool)

(assert (=> start!21640 (=> (not res!106190) (not e!141176))))

(declare-fun valid!1180 (LongMapFixedSize!2860) Bool)

(assert (=> start!21640 (= res!106190 (valid!1180 thiss!1504))))

(assert (=> start!21640 e!141176))

(assert (=> start!21640 e!141181))

(assert (=> start!21640 true))

(declare-fun b!217018 () Bool)

(declare-fun res!106188 () Bool)

(assert (=> b!217018 (=> (not res!106188) (not e!141175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217018 (= res!106188 (validMask!0 (mask!9827 thiss!1504)))))

(declare-fun b!217019 () Bool)

(assert (=> b!217019 (= e!141179 (and e!141178 mapRes!9633))))

(declare-fun condMapEmpty!9633 () Bool)

(declare-fun mapDefault!9633 () ValueCell!2480)

(assert (=> b!217019 (= condMapEmpty!9633 (= (arr!4987 (_values!4063 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2480)) mapDefault!9633)))))

(declare-fun b!217020 () Bool)

(declare-fun res!106193 () Bool)

(assert (=> b!217020 (=> (not res!106193) (not e!141176))))

(assert (=> b!217020 (= res!106193 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217021 () Bool)

(declare-fun res!106189 () Bool)

(assert (=> b!217021 (=> (not res!106189) (not e!141175))))

(declare-datatypes ((tuple2!4188 0))(
  ( (tuple2!4189 (_1!2105 (_ BitVec 64)) (_2!2105 V!7177)) )
))
(declare-datatypes ((List!3091 0))(
  ( (Nil!3088) (Cons!3087 (h!3734 tuple2!4188) (t!8038 List!3091)) )
))
(declare-datatypes ((ListLongMap!3103 0))(
  ( (ListLongMap!3104 (toList!1567 List!3091)) )
))
(declare-fun contains!1422 (ListLongMap!3103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1099 (array!10533 array!10531 (_ BitVec 32) (_ BitVec 32) V!7177 V!7177 (_ BitVec 32) Int) ListLongMap!3103)

(assert (=> b!217021 (= res!106189 (contains!1422 (getCurrentListMap!1099 (_keys!6129 thiss!1504) (_values!4063 thiss!1504) (mask!9827 thiss!1504) (extraKeys!3817 thiss!1504) (zeroValue!3921 thiss!1504) (minValue!3921 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4080 thiss!1504)) key!932))))

(assert (= (and start!21640 res!106190) b!217020))

(assert (= (and b!217020 res!106193) b!217016))

(assert (= (and b!217016 res!106191) b!217021))

(assert (= (and b!217021 res!106189) b!217018))

(assert (= (and b!217018 res!106188) b!217013))

(assert (= (and b!217013 res!106194) b!217011))

(assert (= (and b!217011 res!106192) b!217012))

(assert (= (and b!217019 condMapEmpty!9633) mapIsEmpty!9633))

(assert (= (and b!217019 (not condMapEmpty!9633)) mapNonEmpty!9633))

(get-info :version)

(assert (= (and mapNonEmpty!9633 ((_ is ValueCellFull!2480) mapValue!9633)) b!217015))

(assert (= (and b!217019 ((_ is ValueCellFull!2480) mapDefault!9633)) b!217014))

(assert (= b!217017 b!217019))

(assert (= start!21640 b!217017))

(declare-fun m!243651 () Bool)

(assert (=> mapNonEmpty!9633 m!243651))

(declare-fun m!243653 () Bool)

(assert (=> b!217011 m!243653))

(declare-fun m!243655 () Bool)

(assert (=> b!217021 m!243655))

(assert (=> b!217021 m!243655))

(declare-fun m!243657 () Bool)

(assert (=> b!217021 m!243657))

(declare-fun m!243659 () Bool)

(assert (=> b!217017 m!243659))

(declare-fun m!243661 () Bool)

(assert (=> b!217017 m!243661))

(declare-fun m!243663 () Bool)

(assert (=> b!217018 m!243663))

(declare-fun m!243665 () Bool)

(assert (=> start!21640 m!243665))

(declare-fun m!243667 () Bool)

(assert (=> b!217012 m!243667))

(declare-fun m!243669 () Bool)

(assert (=> b!217016 m!243669))

(check-sat (not b!217018) (not start!21640) (not b!217021) b_and!12689 tp_is_empty!5647 (not b!217016) (not b_next!5785) (not b!217017) (not mapNonEmpty!9633) (not b!217012) (not b!217011))
(check-sat b_and!12689 (not b_next!5785))
