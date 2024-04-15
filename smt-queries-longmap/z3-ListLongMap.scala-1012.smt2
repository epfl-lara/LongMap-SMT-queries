; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21676 () Bool)

(assert start!21676)

(declare-fun b!217421 () Bool)

(declare-fun b_free!5821 () Bool)

(declare-fun b_next!5821 () Bool)

(assert (=> b!217421 (= b_free!5821 (not b_next!5821))))

(declare-fun tp!20598 () Bool)

(declare-fun b_and!12685 () Bool)

(assert (=> b!217421 (= tp!20598 b_and!12685)))

(declare-fun b!217411 () Bool)

(declare-fun e!141428 () Bool)

(declare-fun e!141429 () Bool)

(assert (=> b!217411 (= e!141428 e!141429)))

(declare-fun res!106453 () Bool)

(assert (=> b!217411 (=> (not res!106453) (not e!141429))))

(declare-datatypes ((SeekEntryResult!765 0))(
  ( (MissingZero!765 (index!5230 (_ BitVec 32))) (Found!765 (index!5231 (_ BitVec 32))) (Intermediate!765 (undefined!1577 Bool) (index!5232 (_ BitVec 32)) (x!22748 (_ BitVec 32))) (Undefined!765) (MissingVacant!765 (index!5233 (_ BitVec 32))) )
))
(declare-fun lt!111187 () SeekEntryResult!765)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217411 (= res!106453 (or (= lt!111187 (MissingZero!765 index!297)) (= lt!111187 (MissingVacant!765 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7225 0))(
  ( (V!7226 (val!2886 Int)) )
))
(declare-datatypes ((ValueCell!2498 0))(
  ( (ValueCellFull!2498 (v!4898 V!7225)) (EmptyCell!2498) )
))
(declare-datatypes ((array!10597 0))(
  ( (array!10598 (arr!5019 (Array (_ BitVec 32) ValueCell!2498)) (size!5352 (_ BitVec 32))) )
))
(declare-datatypes ((array!10599 0))(
  ( (array!10600 (arr!5020 (Array (_ BitVec 32) (_ BitVec 64))) (size!5353 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2896 0))(
  ( (LongMapFixedSize!2897 (defaultEntry!4098 Int) (mask!9856 (_ BitVec 32)) (extraKeys!3835 (_ BitVec 32)) (zeroValue!3939 V!7225) (minValue!3939 V!7225) (_size!1497 (_ BitVec 32)) (_keys!6146 array!10599) (_values!4081 array!10597) (_vacant!1497 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2896)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10599 (_ BitVec 32)) SeekEntryResult!765)

(assert (=> b!217411 (= lt!111187 (seekEntryOrOpen!0 key!932 (_keys!6146 thiss!1504) (mask!9856 thiss!1504)))))

(declare-fun b!217412 () Bool)

(declare-fun res!106454 () Bool)

(assert (=> b!217412 (=> (not res!106454) (not e!141429))))

(declare-datatypes ((tuple2!4252 0))(
  ( (tuple2!4253 (_1!2137 (_ BitVec 64)) (_2!2137 V!7225)) )
))
(declare-datatypes ((List!3179 0))(
  ( (Nil!3176) (Cons!3175 (h!3822 tuple2!4252) (t!8125 List!3179)) )
))
(declare-datatypes ((ListLongMap!3155 0))(
  ( (ListLongMap!3156 (toList!1593 List!3179)) )
))
(declare-fun contains!1434 (ListLongMap!3155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1102 (array!10599 array!10597 (_ BitVec 32) (_ BitVec 32) V!7225 V!7225 (_ BitVec 32) Int) ListLongMap!3155)

(assert (=> b!217412 (= res!106454 (not (contains!1434 (getCurrentListMap!1102 (_keys!6146 thiss!1504) (_values!4081 thiss!1504) (mask!9856 thiss!1504) (extraKeys!3835 thiss!1504) (zeroValue!3939 thiss!1504) (minValue!3939 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4098 thiss!1504)) key!932)))))

(declare-fun res!106452 () Bool)

(assert (=> start!21676 (=> (not res!106452) (not e!141428))))

(declare-fun valid!1191 (LongMapFixedSize!2896) Bool)

(assert (=> start!21676 (= res!106452 (valid!1191 thiss!1504))))

(assert (=> start!21676 e!141428))

(declare-fun e!141434 () Bool)

(assert (=> start!21676 e!141434))

(assert (=> start!21676 true))

(declare-fun mapIsEmpty!9687 () Bool)

(declare-fun mapRes!9687 () Bool)

(assert (=> mapIsEmpty!9687 mapRes!9687))

(declare-fun b!217413 () Bool)

(assert (=> b!217413 (= e!141429 false)))

(declare-fun lt!111188 () Bool)

(declare-datatypes ((List!3180 0))(
  ( (Nil!3177) (Cons!3176 (h!3823 (_ BitVec 64)) (t!8126 List!3180)) )
))
(declare-fun arrayNoDuplicates!0 (array!10599 (_ BitVec 32) List!3180) Bool)

(assert (=> b!217413 (= lt!111188 (arrayNoDuplicates!0 (_keys!6146 thiss!1504) #b00000000000000000000000000000000 Nil!3177))))

(declare-fun b!217414 () Bool)

(declare-fun res!106451 () Bool)

(assert (=> b!217414 (=> (not res!106451) (not e!141429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217414 (= res!106451 (validMask!0 (mask!9856 thiss!1504)))))

(declare-fun b!217415 () Bool)

(declare-fun e!141430 () Bool)

(declare-fun tp_is_empty!5683 () Bool)

(assert (=> b!217415 (= e!141430 tp_is_empty!5683)))

(declare-fun b!217416 () Bool)

(declare-fun e!141432 () Bool)

(assert (=> b!217416 (= e!141432 (and e!141430 mapRes!9687))))

(declare-fun condMapEmpty!9687 () Bool)

(declare-fun mapDefault!9687 () ValueCell!2498)

(assert (=> b!217416 (= condMapEmpty!9687 (= (arr!5019 (_values!4081 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2498)) mapDefault!9687)))))

(declare-fun b!217417 () Bool)

(declare-fun res!106455 () Bool)

(assert (=> b!217417 (=> (not res!106455) (not e!141429))))

(assert (=> b!217417 (= res!106455 (and (= (size!5352 (_values!4081 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9856 thiss!1504))) (= (size!5353 (_keys!6146 thiss!1504)) (size!5352 (_values!4081 thiss!1504))) (bvsge (mask!9856 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3835 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3835 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217418 () Bool)

(declare-fun e!141433 () Bool)

(assert (=> b!217418 (= e!141433 tp_is_empty!5683)))

(declare-fun b!217419 () Bool)

(declare-fun res!106450 () Bool)

(assert (=> b!217419 (=> (not res!106450) (not e!141428))))

(assert (=> b!217419 (= res!106450 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217420 () Bool)

(declare-fun res!106456 () Bool)

(assert (=> b!217420 (=> (not res!106456) (not e!141429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10599 (_ BitVec 32)) Bool)

(assert (=> b!217420 (= res!106456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6146 thiss!1504) (mask!9856 thiss!1504)))))

(declare-fun mapNonEmpty!9687 () Bool)

(declare-fun tp!20597 () Bool)

(assert (=> mapNonEmpty!9687 (= mapRes!9687 (and tp!20597 e!141433))))

(declare-fun mapKey!9687 () (_ BitVec 32))

(declare-fun mapRest!9687 () (Array (_ BitVec 32) ValueCell!2498))

(declare-fun mapValue!9687 () ValueCell!2498)

(assert (=> mapNonEmpty!9687 (= (arr!5019 (_values!4081 thiss!1504)) (store mapRest!9687 mapKey!9687 mapValue!9687))))

(declare-fun array_inv!3305 (array!10599) Bool)

(declare-fun array_inv!3306 (array!10597) Bool)

(assert (=> b!217421 (= e!141434 (and tp!20598 tp_is_empty!5683 (array_inv!3305 (_keys!6146 thiss!1504)) (array_inv!3306 (_values!4081 thiss!1504)) e!141432))))

(assert (= (and start!21676 res!106452) b!217419))

(assert (= (and b!217419 res!106450) b!217411))

(assert (= (and b!217411 res!106453) b!217412))

(assert (= (and b!217412 res!106454) b!217414))

(assert (= (and b!217414 res!106451) b!217417))

(assert (= (and b!217417 res!106455) b!217420))

(assert (= (and b!217420 res!106456) b!217413))

(assert (= (and b!217416 condMapEmpty!9687) mapIsEmpty!9687))

(assert (= (and b!217416 (not condMapEmpty!9687)) mapNonEmpty!9687))

(get-info :version)

(assert (= (and mapNonEmpty!9687 ((_ is ValueCellFull!2498) mapValue!9687)) b!217418))

(assert (= (and b!217416 ((_ is ValueCellFull!2498) mapDefault!9687)) b!217415))

(assert (= b!217421 b!217416))

(assert (= start!21676 b!217421))

(declare-fun m!243213 () Bool)

(assert (=> b!217421 m!243213))

(declare-fun m!243215 () Bool)

(assert (=> b!217421 m!243215))

(declare-fun m!243217 () Bool)

(assert (=> b!217411 m!243217))

(declare-fun m!243219 () Bool)

(assert (=> mapNonEmpty!9687 m!243219))

(declare-fun m!243221 () Bool)

(assert (=> b!217413 m!243221))

(declare-fun m!243223 () Bool)

(assert (=> b!217414 m!243223))

(declare-fun m!243225 () Bool)

(assert (=> start!21676 m!243225))

(declare-fun m!243227 () Bool)

(assert (=> b!217412 m!243227))

(assert (=> b!217412 m!243227))

(declare-fun m!243229 () Bool)

(assert (=> b!217412 m!243229))

(declare-fun m!243231 () Bool)

(assert (=> b!217420 m!243231))

(check-sat (not b!217414) (not b!217420) (not b!217413) (not start!21676) (not b_next!5821) b_and!12685 (not b!217421) (not mapNonEmpty!9687) (not b!217412) (not b!217411) tp_is_empty!5683)
(check-sat b_and!12685 (not b_next!5821))
