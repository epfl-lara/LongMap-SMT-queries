; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21644 () Bool)

(assert start!21644)

(declare-fun b!217100 () Bool)

(declare-fun b_free!5793 () Bool)

(declare-fun b_next!5793 () Bool)

(assert (=> b!217100 (= b_free!5793 (not b_next!5793))))

(declare-fun tp!20513 () Bool)

(declare-fun b_and!12683 () Bool)

(assert (=> b!217100 (= tp!20513 b_and!12683)))

(declare-fun mapIsEmpty!9645 () Bool)

(declare-fun mapRes!9645 () Bool)

(assert (=> mapIsEmpty!9645 mapRes!9645))

(declare-fun b!217096 () Bool)

(declare-fun res!106257 () Bool)

(declare-fun e!141240 () Bool)

(assert (=> b!217096 (=> (not res!106257) (not e!141240))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217096 (= res!106257 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217097 () Bool)

(declare-fun e!141235 () Bool)

(declare-fun tp_is_empty!5655 () Bool)

(assert (=> b!217097 (= e!141235 tp_is_empty!5655)))

(declare-fun b!217098 () Bool)

(declare-fun res!106256 () Bool)

(declare-fun e!141236 () Bool)

(assert (=> b!217098 (=> (not res!106256) (not e!141236))))

(declare-datatypes ((V!7187 0))(
  ( (V!7188 (val!2872 Int)) )
))
(declare-datatypes ((ValueCell!2484 0))(
  ( (ValueCellFull!2484 (v!4890 V!7187)) (EmptyCell!2484) )
))
(declare-datatypes ((array!10549 0))(
  ( (array!10550 (arr!4996 (Array (_ BitVec 32) ValueCell!2484)) (size!5328 (_ BitVec 32))) )
))
(declare-datatypes ((array!10551 0))(
  ( (array!10552 (arr!4997 (Array (_ BitVec 32) (_ BitVec 64))) (size!5329 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2868 0))(
  ( (LongMapFixedSize!2869 (defaultEntry!4084 Int) (mask!9833 (_ BitVec 32)) (extraKeys!3821 (_ BitVec 32)) (zeroValue!3925 V!7187) (minValue!3925 V!7187) (_size!1483 (_ BitVec 32)) (_keys!6133 array!10551) (_values!4067 array!10549) (_vacant!1483 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2868)

(assert (=> b!217098 (= res!106256 (and (= (size!5328 (_values!4067 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9833 thiss!1504))) (= (size!5329 (_keys!6133 thiss!1504)) (size!5328 (_values!4067 thiss!1504))) (bvsge (mask!9833 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3821 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3821 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217099 () Bool)

(assert (=> b!217099 (= e!141240 e!141236)))

(declare-fun res!106252 () Bool)

(assert (=> b!217099 (=> (not res!106252) (not e!141236))))

(declare-datatypes ((SeekEntryResult!760 0))(
  ( (MissingZero!760 (index!5210 (_ BitVec 32))) (Found!760 (index!5211 (_ BitVec 32))) (Intermediate!760 (undefined!1572 Bool) (index!5212 (_ BitVec 32)) (x!22704 (_ BitVec 32))) (Undefined!760) (MissingVacant!760 (index!5213 (_ BitVec 32))) )
))
(declare-fun lt!111285 () SeekEntryResult!760)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217099 (= res!106252 (or (= lt!111285 (MissingZero!760 index!297)) (= lt!111285 (MissingVacant!760 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10551 (_ BitVec 32)) SeekEntryResult!760)

(assert (=> b!217099 (= lt!111285 (seekEntryOrOpen!0 key!932 (_keys!6133 thiss!1504) (mask!9833 thiss!1504)))))

(declare-fun e!141237 () Bool)

(declare-fun e!141238 () Bool)

(declare-fun array_inv!3307 (array!10551) Bool)

(declare-fun array_inv!3308 (array!10549) Bool)

(assert (=> b!217100 (= e!141237 (and tp!20513 tp_is_empty!5655 (array_inv!3307 (_keys!6133 thiss!1504)) (array_inv!3308 (_values!4067 thiss!1504)) e!141238))))

(declare-fun b!217101 () Bool)

(declare-fun res!106255 () Bool)

(assert (=> b!217101 (=> (not res!106255) (not e!141236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217101 (= res!106255 (validMask!0 (mask!9833 thiss!1504)))))

(declare-fun res!106253 () Bool)

(assert (=> start!21644 (=> (not res!106253) (not e!141240))))

(declare-fun valid!1166 (LongMapFixedSize!2868) Bool)

(assert (=> start!21644 (= res!106253 (valid!1166 thiss!1504))))

(assert (=> start!21644 e!141240))

(assert (=> start!21644 e!141237))

(assert (=> start!21644 true))

(declare-fun b!217102 () Bool)

(declare-fun res!106251 () Bool)

(assert (=> b!217102 (=> (not res!106251) (not e!141236))))

(declare-datatypes ((tuple2!4274 0))(
  ( (tuple2!4275 (_1!2148 (_ BitVec 64)) (_2!2148 V!7187)) )
))
(declare-datatypes ((List!3177 0))(
  ( (Nil!3174) (Cons!3173 (h!3820 tuple2!4274) (t!8132 List!3177)) )
))
(declare-datatypes ((ListLongMap!3187 0))(
  ( (ListLongMap!3188 (toList!1609 List!3177)) )
))
(declare-fun contains!1450 (ListLongMap!3187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1137 (array!10551 array!10549 (_ BitVec 32) (_ BitVec 32) V!7187 V!7187 (_ BitVec 32) Int) ListLongMap!3187)

(assert (=> b!217102 (= res!106251 (contains!1450 (getCurrentListMap!1137 (_keys!6133 thiss!1504) (_values!4067 thiss!1504) (mask!9833 thiss!1504) (extraKeys!3821 thiss!1504) (zeroValue!3925 thiss!1504) (minValue!3925 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4084 thiss!1504)) key!932))))

(declare-fun b!217103 () Bool)

(assert (=> b!217103 (= e!141236 false)))

(declare-fun lt!111284 () Bool)

(declare-datatypes ((List!3178 0))(
  ( (Nil!3175) (Cons!3174 (h!3821 (_ BitVec 64)) (t!8133 List!3178)) )
))
(declare-fun arrayNoDuplicates!0 (array!10551 (_ BitVec 32) List!3178) Bool)

(assert (=> b!217103 (= lt!111284 (arrayNoDuplicates!0 (_keys!6133 thiss!1504) #b00000000000000000000000000000000 Nil!3175))))

(declare-fun b!217104 () Bool)

(assert (=> b!217104 (= e!141238 (and e!141235 mapRes!9645))))

(declare-fun condMapEmpty!9645 () Bool)

(declare-fun mapDefault!9645 () ValueCell!2484)

(assert (=> b!217104 (= condMapEmpty!9645 (= (arr!4996 (_values!4067 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2484)) mapDefault!9645)))))

(declare-fun mapNonEmpty!9645 () Bool)

(declare-fun tp!20514 () Bool)

(declare-fun e!141241 () Bool)

(assert (=> mapNonEmpty!9645 (= mapRes!9645 (and tp!20514 e!141241))))

(declare-fun mapRest!9645 () (Array (_ BitVec 32) ValueCell!2484))

(declare-fun mapKey!9645 () (_ BitVec 32))

(declare-fun mapValue!9645 () ValueCell!2484)

(assert (=> mapNonEmpty!9645 (= (arr!4996 (_values!4067 thiss!1504)) (store mapRest!9645 mapKey!9645 mapValue!9645))))

(declare-fun b!217105 () Bool)

(assert (=> b!217105 (= e!141241 tp_is_empty!5655)))

(declare-fun b!217106 () Bool)

(declare-fun res!106254 () Bool)

(assert (=> b!217106 (=> (not res!106254) (not e!141236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10551 (_ BitVec 32)) Bool)

(assert (=> b!217106 (= res!106254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6133 thiss!1504) (mask!9833 thiss!1504)))))

(assert (= (and start!21644 res!106253) b!217096))

(assert (= (and b!217096 res!106257) b!217099))

(assert (= (and b!217099 res!106252) b!217102))

(assert (= (and b!217102 res!106251) b!217101))

(assert (= (and b!217101 res!106255) b!217098))

(assert (= (and b!217098 res!106256) b!217106))

(assert (= (and b!217106 res!106254) b!217103))

(assert (= (and b!217104 condMapEmpty!9645) mapIsEmpty!9645))

(assert (= (and b!217104 (not condMapEmpty!9645)) mapNonEmpty!9645))

(get-info :version)

(assert (= (and mapNonEmpty!9645 ((_ is ValueCellFull!2484) mapValue!9645)) b!217105))

(assert (= (and b!217104 ((_ is ValueCellFull!2484) mapDefault!9645)) b!217097))

(assert (= b!217100 b!217104))

(assert (= start!21644 b!217100))

(declare-fun m!243549 () Bool)

(assert (=> b!217099 m!243549))

(declare-fun m!243551 () Bool)

(assert (=> b!217103 m!243551))

(declare-fun m!243553 () Bool)

(assert (=> mapNonEmpty!9645 m!243553))

(declare-fun m!243555 () Bool)

(assert (=> b!217100 m!243555))

(declare-fun m!243557 () Bool)

(assert (=> b!217100 m!243557))

(declare-fun m!243559 () Bool)

(assert (=> start!21644 m!243559))

(declare-fun m!243561 () Bool)

(assert (=> b!217106 m!243561))

(declare-fun m!243563 () Bool)

(assert (=> b!217102 m!243563))

(assert (=> b!217102 m!243563))

(declare-fun m!243565 () Bool)

(assert (=> b!217102 m!243565))

(declare-fun m!243567 () Bool)

(assert (=> b!217101 m!243567))

(check-sat (not b!217100) (not b!217106) (not start!21644) b_and!12683 (not b!217101) (not b!217103) tp_is_empty!5655 (not b!217099) (not b_next!5793) (not b!217102) (not mapNonEmpty!9645))
(check-sat b_and!12683 (not b_next!5793))
