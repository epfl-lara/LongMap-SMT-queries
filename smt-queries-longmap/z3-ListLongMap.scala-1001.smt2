; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21610 () Bool)

(assert start!21610)

(declare-fun b!216523 () Bool)

(declare-fun b_free!5755 () Bool)

(declare-fun b_next!5755 () Bool)

(assert (=> b!216523 (= b_free!5755 (not b_next!5755))))

(declare-fun tp!20399 () Bool)

(declare-fun b_and!12659 () Bool)

(assert (=> b!216523 (= tp!20399 b_and!12659)))

(declare-fun b!216516 () Bool)

(declare-fun res!105879 () Bool)

(declare-fun e!140865 () Bool)

(assert (=> b!216516 (=> (not res!105879) (not e!140865))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216516 (= res!105879 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216517 () Bool)

(declare-fun res!105877 () Bool)

(declare-fun e!140862 () Bool)

(assert (=> b!216517 (=> (not res!105877) (not e!140862))))

(declare-datatypes ((V!7137 0))(
  ( (V!7138 (val!2853 Int)) )
))
(declare-datatypes ((ValueCell!2465 0))(
  ( (ValueCellFull!2465 (v!4872 V!7137)) (EmptyCell!2465) )
))
(declare-datatypes ((array!10471 0))(
  ( (array!10472 (arr!4957 (Array (_ BitVec 32) ValueCell!2465)) (size!5289 (_ BitVec 32))) )
))
(declare-datatypes ((array!10473 0))(
  ( (array!10474 (arr!4958 (Array (_ BitVec 32) (_ BitVec 64))) (size!5290 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2830 0))(
  ( (LongMapFixedSize!2831 (defaultEntry!4065 Int) (mask!9802 (_ BitVec 32)) (extraKeys!3802 (_ BitVec 32)) (zeroValue!3906 V!7137) (minValue!3906 V!7137) (_size!1464 (_ BitVec 32)) (_keys!6114 array!10473) (_values!4048 array!10471) (_vacant!1464 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2830)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216517 (= res!105877 (validMask!0 (mask!9802 thiss!1504)))))

(declare-fun b!216518 () Bool)

(declare-fun e!140861 () Bool)

(declare-fun tp_is_empty!5617 () Bool)

(assert (=> b!216518 (= e!140861 tp_is_empty!5617)))

(declare-fun b!216519 () Bool)

(declare-fun e!140860 () Bool)

(declare-fun mapRes!9588 () Bool)

(assert (=> b!216519 (= e!140860 (and e!140861 mapRes!9588))))

(declare-fun condMapEmpty!9588 () Bool)

(declare-fun mapDefault!9588 () ValueCell!2465)

(assert (=> b!216519 (= condMapEmpty!9588 (= (arr!4957 (_values!4048 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2465)) mapDefault!9588)))))

(declare-fun res!105875 () Bool)

(assert (=> start!21610 (=> (not res!105875) (not e!140865))))

(declare-fun valid!1170 (LongMapFixedSize!2830) Bool)

(assert (=> start!21610 (= res!105875 (valid!1170 thiss!1504))))

(assert (=> start!21610 e!140865))

(declare-fun e!140863 () Bool)

(assert (=> start!21610 e!140863))

(assert (=> start!21610 true))

(declare-fun b!216520 () Bool)

(assert (=> b!216520 (= e!140865 e!140862)))

(declare-fun res!105876 () Bool)

(assert (=> b!216520 (=> (not res!105876) (not e!140862))))

(declare-datatypes ((SeekEntryResult!731 0))(
  ( (MissingZero!731 (index!5094 (_ BitVec 32))) (Found!731 (index!5095 (_ BitVec 32))) (Intermediate!731 (undefined!1543 Bool) (index!5096 (_ BitVec 32)) (x!22627 (_ BitVec 32))) (Undefined!731) (MissingVacant!731 (index!5097 (_ BitVec 32))) )
))
(declare-fun lt!111230 () SeekEntryResult!731)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216520 (= res!105876 (or (= lt!111230 (MissingZero!731 index!297)) (= lt!111230 (MissingVacant!731 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10473 (_ BitVec 32)) SeekEntryResult!731)

(assert (=> b!216520 (= lt!111230 (seekEntryOrOpen!0 key!932 (_keys!6114 thiss!1504) (mask!9802 thiss!1504)))))

(declare-fun b!216521 () Bool)

(declare-fun res!105878 () Bool)

(assert (=> b!216521 (=> (not res!105878) (not e!140862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10473 (_ BitVec 32)) Bool)

(assert (=> b!216521 (= res!105878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6114 thiss!1504) (mask!9802 thiss!1504)))))

(declare-fun mapNonEmpty!9588 () Bool)

(declare-fun tp!20400 () Bool)

(declare-fun e!140864 () Bool)

(assert (=> mapNonEmpty!9588 (= mapRes!9588 (and tp!20400 e!140864))))

(declare-fun mapRest!9588 () (Array (_ BitVec 32) ValueCell!2465))

(declare-fun mapValue!9588 () ValueCell!2465)

(declare-fun mapKey!9588 () (_ BitVec 32))

(assert (=> mapNonEmpty!9588 (= (arr!4957 (_values!4048 thiss!1504)) (store mapRest!9588 mapKey!9588 mapValue!9588))))

(declare-fun b!216522 () Bool)

(declare-fun res!105873 () Bool)

(assert (=> b!216522 (=> (not res!105873) (not e!140862))))

(assert (=> b!216522 (= res!105873 (and (= (size!5289 (_values!4048 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9802 thiss!1504))) (= (size!5290 (_keys!6114 thiss!1504)) (size!5289 (_values!4048 thiss!1504))) (bvsge (mask!9802 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3802 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3802 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun array_inv!3255 (array!10473) Bool)

(declare-fun array_inv!3256 (array!10471) Bool)

(assert (=> b!216523 (= e!140863 (and tp!20399 tp_is_empty!5617 (array_inv!3255 (_keys!6114 thiss!1504)) (array_inv!3256 (_values!4048 thiss!1504)) e!140860))))

(declare-fun b!216524 () Bool)

(declare-fun res!105874 () Bool)

(assert (=> b!216524 (=> (not res!105874) (not e!140862))))

(declare-datatypes ((tuple2!4178 0))(
  ( (tuple2!4179 (_1!2100 (_ BitVec 64)) (_2!2100 V!7137)) )
))
(declare-datatypes ((List!3078 0))(
  ( (Nil!3075) (Cons!3074 (h!3721 tuple2!4178) (t!8025 List!3078)) )
))
(declare-datatypes ((ListLongMap!3093 0))(
  ( (ListLongMap!3094 (toList!1562 List!3078)) )
))
(declare-fun contains!1417 (ListLongMap!3093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1094 (array!10473 array!10471 (_ BitVec 32) (_ BitVec 32) V!7137 V!7137 (_ BitVec 32) Int) ListLongMap!3093)

(assert (=> b!216524 (= res!105874 (contains!1417 (getCurrentListMap!1094 (_keys!6114 thiss!1504) (_values!4048 thiss!1504) (mask!9802 thiss!1504) (extraKeys!3802 thiss!1504) (zeroValue!3906 thiss!1504) (minValue!3906 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4065 thiss!1504)) key!932))))

(declare-fun b!216525 () Bool)

(assert (=> b!216525 (= e!140862 false)))

(declare-fun lt!111229 () Bool)

(declare-datatypes ((List!3079 0))(
  ( (Nil!3076) (Cons!3075 (h!3722 (_ BitVec 64)) (t!8026 List!3079)) )
))
(declare-fun arrayNoDuplicates!0 (array!10473 (_ BitVec 32) List!3079) Bool)

(assert (=> b!216525 (= lt!111229 (arrayNoDuplicates!0 (_keys!6114 thiss!1504) #b00000000000000000000000000000000 Nil!3076))))

(declare-fun b!216526 () Bool)

(assert (=> b!216526 (= e!140864 tp_is_empty!5617)))

(declare-fun mapIsEmpty!9588 () Bool)

(assert (=> mapIsEmpty!9588 mapRes!9588))

(assert (= (and start!21610 res!105875) b!216516))

(assert (= (and b!216516 res!105879) b!216520))

(assert (= (and b!216520 res!105876) b!216524))

(assert (= (and b!216524 res!105874) b!216517))

(assert (= (and b!216517 res!105877) b!216522))

(assert (= (and b!216522 res!105873) b!216521))

(assert (= (and b!216521 res!105878) b!216525))

(assert (= (and b!216519 condMapEmpty!9588) mapIsEmpty!9588))

(assert (= (and b!216519 (not condMapEmpty!9588)) mapNonEmpty!9588))

(get-info :version)

(assert (= (and mapNonEmpty!9588 ((_ is ValueCellFull!2465) mapValue!9588)) b!216526))

(assert (= (and b!216519 ((_ is ValueCellFull!2465) mapDefault!9588)) b!216518))

(assert (= b!216523 b!216519))

(assert (= start!21610 b!216523))

(declare-fun m!243351 () Bool)

(assert (=> b!216520 m!243351))

(declare-fun m!243353 () Bool)

(assert (=> b!216525 m!243353))

(declare-fun m!243355 () Bool)

(assert (=> mapNonEmpty!9588 m!243355))

(declare-fun m!243357 () Bool)

(assert (=> b!216521 m!243357))

(declare-fun m!243359 () Bool)

(assert (=> start!21610 m!243359))

(declare-fun m!243361 () Bool)

(assert (=> b!216517 m!243361))

(declare-fun m!243363 () Bool)

(assert (=> b!216524 m!243363))

(assert (=> b!216524 m!243363))

(declare-fun m!243365 () Bool)

(assert (=> b!216524 m!243365))

(declare-fun m!243367 () Bool)

(assert (=> b!216523 m!243367))

(declare-fun m!243369 () Bool)

(assert (=> b!216523 m!243369))

(check-sat tp_is_empty!5617 (not b!216524) (not b!216523) (not start!21610) (not b!216520) (not b!216525) (not b!216517) (not b_next!5755) (not mapNonEmpty!9588) b_and!12659 (not b!216521))
(check-sat b_and!12659 (not b_next!5755))
