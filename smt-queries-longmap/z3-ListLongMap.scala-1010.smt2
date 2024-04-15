; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21664 () Bool)

(assert start!21664)

(declare-fun b!217214 () Bool)

(declare-fun b_free!5809 () Bool)

(declare-fun b_next!5809 () Bool)

(assert (=> b!217214 (= b_free!5809 (not b_next!5809))))

(declare-fun tp!20561 () Bool)

(declare-fun b_and!12673 () Bool)

(assert (=> b!217214 (= tp!20561 b_and!12673)))

(declare-fun b!217213 () Bool)

(declare-fun e!141307 () Bool)

(declare-fun e!141302 () Bool)

(assert (=> b!217213 (= e!141307 e!141302)))

(declare-fun res!106325 () Bool)

(assert (=> b!217213 (=> (not res!106325) (not e!141302))))

(declare-datatypes ((SeekEntryResult!760 0))(
  ( (MissingZero!760 (index!5210 (_ BitVec 32))) (Found!760 (index!5211 (_ BitVec 32))) (Intermediate!760 (undefined!1572 Bool) (index!5212 (_ BitVec 32)) (x!22727 (_ BitVec 32))) (Undefined!760) (MissingVacant!760 (index!5213 (_ BitVec 32))) )
))
(declare-fun lt!111151 () SeekEntryResult!760)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217213 (= res!106325 (or (= lt!111151 (MissingZero!760 index!297)) (= lt!111151 (MissingVacant!760 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7209 0))(
  ( (V!7210 (val!2880 Int)) )
))
(declare-datatypes ((ValueCell!2492 0))(
  ( (ValueCellFull!2492 (v!4892 V!7209)) (EmptyCell!2492) )
))
(declare-datatypes ((array!10573 0))(
  ( (array!10574 (arr!5007 (Array (_ BitVec 32) ValueCell!2492)) (size!5340 (_ BitVec 32))) )
))
(declare-datatypes ((array!10575 0))(
  ( (array!10576 (arr!5008 (Array (_ BitVec 32) (_ BitVec 64))) (size!5341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2884 0))(
  ( (LongMapFixedSize!2885 (defaultEntry!4092 Int) (mask!9846 (_ BitVec 32)) (extraKeys!3829 (_ BitVec 32)) (zeroValue!3933 V!7209) (minValue!3933 V!7209) (_size!1491 (_ BitVec 32)) (_keys!6140 array!10575) (_values!4075 array!10573) (_vacant!1491 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2884)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10575 (_ BitVec 32)) SeekEntryResult!760)

(assert (=> b!217213 (= lt!111151 (seekEntryOrOpen!0 key!932 (_keys!6140 thiss!1504) (mask!9846 thiss!1504)))))

(declare-fun res!106326 () Bool)

(assert (=> start!21664 (=> (not res!106326) (not e!141307))))

(declare-fun valid!1186 (LongMapFixedSize!2884) Bool)

(assert (=> start!21664 (= res!106326 (valid!1186 thiss!1504))))

(assert (=> start!21664 e!141307))

(declare-fun e!141305 () Bool)

(assert (=> start!21664 e!141305))

(assert (=> start!21664 true))

(declare-fun e!141306 () Bool)

(declare-fun tp_is_empty!5671 () Bool)

(declare-fun array_inv!3297 (array!10575) Bool)

(declare-fun array_inv!3298 (array!10573) Bool)

(assert (=> b!217214 (= e!141305 (and tp!20561 tp_is_empty!5671 (array_inv!3297 (_keys!6140 thiss!1504)) (array_inv!3298 (_values!4075 thiss!1504)) e!141306))))

(declare-fun b!217215 () Bool)

(declare-fun res!106324 () Bool)

(assert (=> b!217215 (=> (not res!106324) (not e!141302))))

(declare-datatypes ((tuple2!4244 0))(
  ( (tuple2!4245 (_1!2133 (_ BitVec 64)) (_2!2133 V!7209)) )
))
(declare-datatypes ((List!3171 0))(
  ( (Nil!3168) (Cons!3167 (h!3814 tuple2!4244) (t!8117 List!3171)) )
))
(declare-datatypes ((ListLongMap!3147 0))(
  ( (ListLongMap!3148 (toList!1589 List!3171)) )
))
(declare-fun contains!1430 (ListLongMap!3147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1098 (array!10575 array!10573 (_ BitVec 32) (_ BitVec 32) V!7209 V!7209 (_ BitVec 32) Int) ListLongMap!3147)

(assert (=> b!217215 (= res!106324 (contains!1430 (getCurrentListMap!1098 (_keys!6140 thiss!1504) (_values!4075 thiss!1504) (mask!9846 thiss!1504) (extraKeys!3829 thiss!1504) (zeroValue!3933 thiss!1504) (minValue!3933 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4092 thiss!1504)) key!932))))

(declare-fun b!217216 () Bool)

(declare-fun e!141303 () Bool)

(declare-fun mapRes!9669 () Bool)

(assert (=> b!217216 (= e!141306 (and e!141303 mapRes!9669))))

(declare-fun condMapEmpty!9669 () Bool)

(declare-fun mapDefault!9669 () ValueCell!2492)

(assert (=> b!217216 (= condMapEmpty!9669 (= (arr!5007 (_values!4075 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2492)) mapDefault!9669)))))

(declare-fun b!217217 () Bool)

(declare-fun res!106327 () Bool)

(assert (=> b!217217 (=> (not res!106327) (not e!141302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217217 (= res!106327 (validMask!0 (mask!9846 thiss!1504)))))

(declare-fun b!217218 () Bool)

(declare-fun e!141308 () Bool)

(assert (=> b!217218 (= e!141308 tp_is_empty!5671)))

(declare-fun b!217219 () Bool)

(assert (=> b!217219 (= e!141302 false)))

(declare-fun lt!111152 () Bool)

(declare-datatypes ((List!3172 0))(
  ( (Nil!3169) (Cons!3168 (h!3815 (_ BitVec 64)) (t!8118 List!3172)) )
))
(declare-fun arrayNoDuplicates!0 (array!10575 (_ BitVec 32) List!3172) Bool)

(assert (=> b!217219 (= lt!111152 (arrayNoDuplicates!0 (_keys!6140 thiss!1504) #b00000000000000000000000000000000 Nil!3169))))

(declare-fun b!217220 () Bool)

(declare-fun res!106330 () Bool)

(assert (=> b!217220 (=> (not res!106330) (not e!141307))))

(assert (=> b!217220 (= res!106330 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217221 () Bool)

(assert (=> b!217221 (= e!141303 tp_is_empty!5671)))

(declare-fun mapNonEmpty!9669 () Bool)

(declare-fun tp!20562 () Bool)

(assert (=> mapNonEmpty!9669 (= mapRes!9669 (and tp!20562 e!141308))))

(declare-fun mapKey!9669 () (_ BitVec 32))

(declare-fun mapValue!9669 () ValueCell!2492)

(declare-fun mapRest!9669 () (Array (_ BitVec 32) ValueCell!2492))

(assert (=> mapNonEmpty!9669 (= (arr!5007 (_values!4075 thiss!1504)) (store mapRest!9669 mapKey!9669 mapValue!9669))))

(declare-fun b!217222 () Bool)

(declare-fun res!106328 () Bool)

(assert (=> b!217222 (=> (not res!106328) (not e!141302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10575 (_ BitVec 32)) Bool)

(assert (=> b!217222 (= res!106328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6140 thiss!1504) (mask!9846 thiss!1504)))))

(declare-fun b!217223 () Bool)

(declare-fun res!106329 () Bool)

(assert (=> b!217223 (=> (not res!106329) (not e!141302))))

(assert (=> b!217223 (= res!106329 (and (= (size!5340 (_values!4075 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9846 thiss!1504))) (= (size!5341 (_keys!6140 thiss!1504)) (size!5340 (_values!4075 thiss!1504))) (bvsge (mask!9846 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3829 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3829 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9669 () Bool)

(assert (=> mapIsEmpty!9669 mapRes!9669))

(assert (= (and start!21664 res!106326) b!217220))

(assert (= (and b!217220 res!106330) b!217213))

(assert (= (and b!217213 res!106325) b!217215))

(assert (= (and b!217215 res!106324) b!217217))

(assert (= (and b!217217 res!106327) b!217223))

(assert (= (and b!217223 res!106329) b!217222))

(assert (= (and b!217222 res!106328) b!217219))

(assert (= (and b!217216 condMapEmpty!9669) mapIsEmpty!9669))

(assert (= (and b!217216 (not condMapEmpty!9669)) mapNonEmpty!9669))

(get-info :version)

(assert (= (and mapNonEmpty!9669 ((_ is ValueCellFull!2492) mapValue!9669)) b!217218))

(assert (= (and b!217216 ((_ is ValueCellFull!2492) mapDefault!9669)) b!217221))

(assert (= b!217214 b!217216))

(assert (= start!21664 b!217214))

(declare-fun m!243093 () Bool)

(assert (=> b!217215 m!243093))

(assert (=> b!217215 m!243093))

(declare-fun m!243095 () Bool)

(assert (=> b!217215 m!243095))

(declare-fun m!243097 () Bool)

(assert (=> b!217219 m!243097))

(declare-fun m!243099 () Bool)

(assert (=> b!217214 m!243099))

(declare-fun m!243101 () Bool)

(assert (=> b!217214 m!243101))

(declare-fun m!243103 () Bool)

(assert (=> mapNonEmpty!9669 m!243103))

(declare-fun m!243105 () Bool)

(assert (=> b!217213 m!243105))

(declare-fun m!243107 () Bool)

(assert (=> b!217217 m!243107))

(declare-fun m!243109 () Bool)

(assert (=> start!21664 m!243109))

(declare-fun m!243111 () Bool)

(assert (=> b!217222 m!243111))

(check-sat (not b!217219) b_and!12673 (not b!217217) (not b!217222) (not start!21664) (not mapNonEmpty!9669) tp_is_empty!5671 (not b_next!5809) (not b!217213) (not b!217215) (not b!217214))
(check-sat b_and!12673 (not b_next!5809))
