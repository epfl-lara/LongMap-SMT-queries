; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21668 () Bool)

(assert start!21668)

(declare-fun b!217494 () Bool)

(declare-fun b_free!5817 () Bool)

(declare-fun b_next!5817 () Bool)

(assert (=> b!217494 (= b_free!5817 (not b_next!5817))))

(declare-fun tp!20586 () Bool)

(declare-fun b_and!12707 () Bool)

(assert (=> b!217494 (= tp!20586 b_and!12707)))

(declare-fun b!217493 () Bool)

(declare-fun e!141492 () Bool)

(declare-fun tp_is_empty!5679 () Bool)

(assert (=> b!217493 (= e!141492 tp_is_empty!5679)))

(declare-fun e!141490 () Bool)

(declare-fun e!141487 () Bool)

(declare-datatypes ((V!7219 0))(
  ( (V!7220 (val!2884 Int)) )
))
(declare-datatypes ((ValueCell!2496 0))(
  ( (ValueCellFull!2496 (v!4902 V!7219)) (EmptyCell!2496) )
))
(declare-datatypes ((array!10597 0))(
  ( (array!10598 (arr!5020 (Array (_ BitVec 32) ValueCell!2496)) (size!5352 (_ BitVec 32))) )
))
(declare-datatypes ((array!10599 0))(
  ( (array!10600 (arr!5021 (Array (_ BitVec 32) (_ BitVec 64))) (size!5353 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2892 0))(
  ( (LongMapFixedSize!2893 (defaultEntry!4096 Int) (mask!9853 (_ BitVec 32)) (extraKeys!3833 (_ BitVec 32)) (zeroValue!3937 V!7219) (minValue!3937 V!7219) (_size!1495 (_ BitVec 32)) (_keys!6145 array!10599) (_values!4079 array!10597) (_vacant!1495 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2892)

(declare-fun array_inv!3325 (array!10599) Bool)

(declare-fun array_inv!3326 (array!10597) Bool)

(assert (=> b!217494 (= e!141490 (and tp!20586 tp_is_empty!5679 (array_inv!3325 (_keys!6145 thiss!1504)) (array_inv!3326 (_values!4079 thiss!1504)) e!141487))))

(declare-fun mapIsEmpty!9681 () Bool)

(declare-fun mapRes!9681 () Bool)

(assert (=> mapIsEmpty!9681 mapRes!9681))

(declare-fun b!217495 () Bool)

(declare-fun e!141489 () Bool)

(assert (=> b!217495 (= e!141489 tp_is_empty!5679)))

(declare-fun b!217496 () Bool)

(declare-fun res!106506 () Bool)

(declare-fun e!141493 () Bool)

(assert (=> b!217496 (=> (not res!106506) (not e!141493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217496 (= res!106506 (validMask!0 (mask!9853 thiss!1504)))))

(declare-fun b!217497 () Bool)

(declare-fun res!106503 () Bool)

(declare-fun e!141488 () Bool)

(assert (=> b!217497 (=> (not res!106503) (not e!141488))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217497 (= res!106503 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217498 () Bool)

(assert (=> b!217498 (= e!141493 false)))

(declare-fun lt!111356 () Bool)

(declare-datatypes ((List!3193 0))(
  ( (Nil!3190) (Cons!3189 (h!3836 (_ BitVec 64)) (t!8148 List!3193)) )
))
(declare-fun arrayNoDuplicates!0 (array!10599 (_ BitVec 32) List!3193) Bool)

(assert (=> b!217498 (= lt!111356 (arrayNoDuplicates!0 (_keys!6145 thiss!1504) #b00000000000000000000000000000000 Nil!3190))))

(declare-fun b!217499 () Bool)

(declare-fun res!106504 () Bool)

(assert (=> b!217499 (=> (not res!106504) (not e!141493))))

(declare-datatypes ((tuple2!4288 0))(
  ( (tuple2!4289 (_1!2155 (_ BitVec 64)) (_2!2155 V!7219)) )
))
(declare-datatypes ((List!3194 0))(
  ( (Nil!3191) (Cons!3190 (h!3837 tuple2!4288) (t!8149 List!3194)) )
))
(declare-datatypes ((ListLongMap!3201 0))(
  ( (ListLongMap!3202 (toList!1616 List!3194)) )
))
(declare-fun contains!1457 (ListLongMap!3201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1144 (array!10599 array!10597 (_ BitVec 32) (_ BitVec 32) V!7219 V!7219 (_ BitVec 32) Int) ListLongMap!3201)

(assert (=> b!217499 (= res!106504 (not (contains!1457 (getCurrentListMap!1144 (_keys!6145 thiss!1504) (_values!4079 thiss!1504) (mask!9853 thiss!1504) (extraKeys!3833 thiss!1504) (zeroValue!3937 thiss!1504) (minValue!3937 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4096 thiss!1504)) key!932)))))

(declare-fun res!106507 () Bool)

(assert (=> start!21668 (=> (not res!106507) (not e!141488))))

(declare-fun valid!1174 (LongMapFixedSize!2892) Bool)

(assert (=> start!21668 (= res!106507 (valid!1174 thiss!1504))))

(assert (=> start!21668 e!141488))

(assert (=> start!21668 e!141490))

(assert (=> start!21668 true))

(declare-fun b!217492 () Bool)

(declare-fun res!106509 () Bool)

(assert (=> b!217492 (=> (not res!106509) (not e!141493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10599 (_ BitVec 32)) Bool)

(assert (=> b!217492 (= res!106509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6145 thiss!1504) (mask!9853 thiss!1504)))))

(declare-fun mapNonEmpty!9681 () Bool)

(declare-fun tp!20585 () Bool)

(assert (=> mapNonEmpty!9681 (= mapRes!9681 (and tp!20585 e!141492))))

(declare-fun mapKey!9681 () (_ BitVec 32))

(declare-fun mapValue!9681 () ValueCell!2496)

(declare-fun mapRest!9681 () (Array (_ BitVec 32) ValueCell!2496))

(assert (=> mapNonEmpty!9681 (= (arr!5020 (_values!4079 thiss!1504)) (store mapRest!9681 mapKey!9681 mapValue!9681))))

(declare-fun b!217500 () Bool)

(assert (=> b!217500 (= e!141488 e!141493)))

(declare-fun res!106505 () Bool)

(assert (=> b!217500 (=> (not res!106505) (not e!141493))))

(declare-datatypes ((SeekEntryResult!768 0))(
  ( (MissingZero!768 (index!5242 (_ BitVec 32))) (Found!768 (index!5243 (_ BitVec 32))) (Intermediate!768 (undefined!1580 Bool) (index!5244 (_ BitVec 32)) (x!22744 (_ BitVec 32))) (Undefined!768) (MissingVacant!768 (index!5245 (_ BitVec 32))) )
))
(declare-fun lt!111357 () SeekEntryResult!768)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217500 (= res!106505 (or (= lt!111357 (MissingZero!768 index!297)) (= lt!111357 (MissingVacant!768 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10599 (_ BitVec 32)) SeekEntryResult!768)

(assert (=> b!217500 (= lt!111357 (seekEntryOrOpen!0 key!932 (_keys!6145 thiss!1504) (mask!9853 thiss!1504)))))

(declare-fun b!217501 () Bool)

(declare-fun res!106508 () Bool)

(assert (=> b!217501 (=> (not res!106508) (not e!141493))))

(assert (=> b!217501 (= res!106508 (and (= (size!5352 (_values!4079 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9853 thiss!1504))) (= (size!5353 (_keys!6145 thiss!1504)) (size!5352 (_values!4079 thiss!1504))) (bvsge (mask!9853 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3833 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3833 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217502 () Bool)

(assert (=> b!217502 (= e!141487 (and e!141489 mapRes!9681))))

(declare-fun condMapEmpty!9681 () Bool)

(declare-fun mapDefault!9681 () ValueCell!2496)

(assert (=> b!217502 (= condMapEmpty!9681 (= (arr!5020 (_values!4079 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2496)) mapDefault!9681)))))

(assert (= (and start!21668 res!106507) b!217497))

(assert (= (and b!217497 res!106503) b!217500))

(assert (= (and b!217500 res!106505) b!217499))

(assert (= (and b!217499 res!106504) b!217496))

(assert (= (and b!217496 res!106506) b!217501))

(assert (= (and b!217501 res!106508) b!217492))

(assert (= (and b!217492 res!106509) b!217498))

(assert (= (and b!217502 condMapEmpty!9681) mapIsEmpty!9681))

(assert (= (and b!217502 (not condMapEmpty!9681)) mapNonEmpty!9681))

(get-info :version)

(assert (= (and mapNonEmpty!9681 ((_ is ValueCellFull!2496) mapValue!9681)) b!217493))

(assert (= (and b!217502 ((_ is ValueCellFull!2496) mapDefault!9681)) b!217495))

(assert (= b!217494 b!217502))

(assert (= start!21668 b!217494))

(declare-fun m!243789 () Bool)

(assert (=> mapNonEmpty!9681 m!243789))

(declare-fun m!243791 () Bool)

(assert (=> b!217498 m!243791))

(declare-fun m!243793 () Bool)

(assert (=> start!21668 m!243793))

(declare-fun m!243795 () Bool)

(assert (=> b!217499 m!243795))

(assert (=> b!217499 m!243795))

(declare-fun m!243797 () Bool)

(assert (=> b!217499 m!243797))

(declare-fun m!243799 () Bool)

(assert (=> b!217494 m!243799))

(declare-fun m!243801 () Bool)

(assert (=> b!217494 m!243801))

(declare-fun m!243803 () Bool)

(assert (=> b!217492 m!243803))

(declare-fun m!243805 () Bool)

(assert (=> b!217496 m!243805))

(declare-fun m!243807 () Bool)

(assert (=> b!217500 m!243807))

(check-sat (not b!217500) tp_is_empty!5679 (not b_next!5817) (not b!217498) (not start!21668) (not b!217494) b_and!12707 (not mapNonEmpty!9681) (not b!217496) (not b!217492) (not b!217499))
(check-sat b_and!12707 (not b_next!5817))
