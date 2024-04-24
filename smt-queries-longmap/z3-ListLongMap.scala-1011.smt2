; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21670 () Bool)

(assert start!21670)

(declare-fun b!217508 () Bool)

(declare-fun b_free!5815 () Bool)

(declare-fun b_next!5815 () Bool)

(assert (=> b!217508 (= b_free!5815 (not b_next!5815))))

(declare-fun tp!20579 () Bool)

(declare-fun b_and!12719 () Bool)

(assert (=> b!217508 (= tp!20579 b_and!12719)))

(declare-fun b!217507 () Bool)

(declare-fun e!141496 () Bool)

(assert (=> b!217507 (= e!141496 false)))

(declare-fun lt!111409 () Bool)

(declare-datatypes ((V!7217 0))(
  ( (V!7218 (val!2883 Int)) )
))
(declare-datatypes ((ValueCell!2495 0))(
  ( (ValueCellFull!2495 (v!4902 V!7217)) (EmptyCell!2495) )
))
(declare-datatypes ((array!10591 0))(
  ( (array!10592 (arr!5017 (Array (_ BitVec 32) ValueCell!2495)) (size!5349 (_ BitVec 32))) )
))
(declare-datatypes ((array!10593 0))(
  ( (array!10594 (arr!5018 (Array (_ BitVec 32) (_ BitVec 64))) (size!5350 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2890 0))(
  ( (LongMapFixedSize!2891 (defaultEntry!4095 Int) (mask!9852 (_ BitVec 32)) (extraKeys!3832 (_ BitVec 32)) (zeroValue!3936 V!7217) (minValue!3936 V!7217) (_size!1494 (_ BitVec 32)) (_keys!6144 array!10593) (_values!4078 array!10591) (_vacant!1494 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2890)

(declare-datatypes ((List!3110 0))(
  ( (Nil!3107) (Cons!3106 (h!3753 (_ BitVec 64)) (t!8057 List!3110)) )
))
(declare-fun arrayNoDuplicates!0 (array!10593 (_ BitVec 32) List!3110) Bool)

(assert (=> b!217507 (= lt!111409 (arrayNoDuplicates!0 (_keys!6144 thiss!1504) #b00000000000000000000000000000000 Nil!3107))))

(declare-fun tp_is_empty!5677 () Bool)

(declare-fun e!141490 () Bool)

(declare-fun e!141493 () Bool)

(declare-fun array_inv!3295 (array!10593) Bool)

(declare-fun array_inv!3296 (array!10591) Bool)

(assert (=> b!217508 (= e!141490 (and tp!20579 tp_is_empty!5677 (array_inv!3295 (_keys!6144 thiss!1504)) (array_inv!3296 (_values!4078 thiss!1504)) e!141493))))

(declare-fun b!217509 () Bool)

(declare-fun e!141494 () Bool)

(assert (=> b!217509 (= e!141494 e!141496)))

(declare-fun res!106503 () Bool)

(assert (=> b!217509 (=> (not res!106503) (not e!141496))))

(declare-datatypes ((SeekEntryResult!748 0))(
  ( (MissingZero!748 (index!5162 (_ BitVec 32))) (Found!748 (index!5163 (_ BitVec 32))) (Intermediate!748 (undefined!1560 Bool) (index!5164 (_ BitVec 32)) (x!22724 (_ BitVec 32))) (Undefined!748) (MissingVacant!748 (index!5165 (_ BitVec 32))) )
))
(declare-fun lt!111410 () SeekEntryResult!748)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217509 (= res!106503 (or (= lt!111410 (MissingZero!748 index!297)) (= lt!111410 (MissingVacant!748 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10593 (_ BitVec 32)) SeekEntryResult!748)

(assert (=> b!217509 (= lt!111410 (seekEntryOrOpen!0 key!932 (_keys!6144 thiss!1504) (mask!9852 thiss!1504)))))

(declare-fun b!217510 () Bool)

(declare-fun res!106507 () Bool)

(assert (=> b!217510 (=> (not res!106507) (not e!141496))))

(assert (=> b!217510 (= res!106507 (and (= (size!5349 (_values!4078 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9852 thiss!1504))) (= (size!5350 (_keys!6144 thiss!1504)) (size!5349 (_values!4078 thiss!1504))) (bvsge (mask!9852 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3832 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3832 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9678 () Bool)

(declare-fun mapRes!9678 () Bool)

(assert (=> mapIsEmpty!9678 mapRes!9678))

(declare-fun b!217506 () Bool)

(declare-fun res!106505 () Bool)

(assert (=> b!217506 (=> (not res!106505) (not e!141496))))

(declare-datatypes ((tuple2!4208 0))(
  ( (tuple2!4209 (_1!2115 (_ BitVec 64)) (_2!2115 V!7217)) )
))
(declare-datatypes ((List!3111 0))(
  ( (Nil!3108) (Cons!3107 (h!3754 tuple2!4208) (t!8058 List!3111)) )
))
(declare-datatypes ((ListLongMap!3123 0))(
  ( (ListLongMap!3124 (toList!1577 List!3111)) )
))
(declare-fun contains!1432 (ListLongMap!3123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1109 (array!10593 array!10591 (_ BitVec 32) (_ BitVec 32) V!7217 V!7217 (_ BitVec 32) Int) ListLongMap!3123)

(assert (=> b!217506 (= res!106505 (not (contains!1432 (getCurrentListMap!1109 (_keys!6144 thiss!1504) (_values!4078 thiss!1504) (mask!9852 thiss!1504) (extraKeys!3832 thiss!1504) (zeroValue!3936 thiss!1504) (minValue!3936 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4095 thiss!1504)) key!932)))))

(declare-fun res!106506 () Bool)

(assert (=> start!21670 (=> (not res!106506) (not e!141494))))

(declare-fun valid!1188 (LongMapFixedSize!2890) Bool)

(assert (=> start!21670 (= res!106506 (valid!1188 thiss!1504))))

(assert (=> start!21670 e!141494))

(assert (=> start!21670 e!141490))

(assert (=> start!21670 true))

(declare-fun b!217511 () Bool)

(declare-fun res!106509 () Bool)

(assert (=> b!217511 (=> (not res!106509) (not e!141496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217511 (= res!106509 (validMask!0 (mask!9852 thiss!1504)))))

(declare-fun mapNonEmpty!9678 () Bool)

(declare-fun tp!20580 () Bool)

(declare-fun e!141495 () Bool)

(assert (=> mapNonEmpty!9678 (= mapRes!9678 (and tp!20580 e!141495))))

(declare-fun mapKey!9678 () (_ BitVec 32))

(declare-fun mapRest!9678 () (Array (_ BitVec 32) ValueCell!2495))

(declare-fun mapValue!9678 () ValueCell!2495)

(assert (=> mapNonEmpty!9678 (= (arr!5017 (_values!4078 thiss!1504)) (store mapRest!9678 mapKey!9678 mapValue!9678))))

(declare-fun b!217512 () Bool)

(declare-fun e!141492 () Bool)

(assert (=> b!217512 (= e!141493 (and e!141492 mapRes!9678))))

(declare-fun condMapEmpty!9678 () Bool)

(declare-fun mapDefault!9678 () ValueCell!2495)

(assert (=> b!217512 (= condMapEmpty!9678 (= (arr!5017 (_values!4078 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2495)) mapDefault!9678)))))

(declare-fun b!217513 () Bool)

(assert (=> b!217513 (= e!141492 tp_is_empty!5677)))

(declare-fun b!217514 () Bool)

(declare-fun res!106508 () Bool)

(assert (=> b!217514 (=> (not res!106508) (not e!141494))))

(assert (=> b!217514 (= res!106508 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217515 () Bool)

(declare-fun res!106504 () Bool)

(assert (=> b!217515 (=> (not res!106504) (not e!141496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10593 (_ BitVec 32)) Bool)

(assert (=> b!217515 (= res!106504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6144 thiss!1504) (mask!9852 thiss!1504)))))

(declare-fun b!217516 () Bool)

(assert (=> b!217516 (= e!141495 tp_is_empty!5677)))

(assert (= (and start!21670 res!106506) b!217514))

(assert (= (and b!217514 res!106508) b!217509))

(assert (= (and b!217509 res!106503) b!217506))

(assert (= (and b!217506 res!106505) b!217511))

(assert (= (and b!217511 res!106509) b!217510))

(assert (= (and b!217510 res!106507) b!217515))

(assert (= (and b!217515 res!106504) b!217507))

(assert (= (and b!217512 condMapEmpty!9678) mapIsEmpty!9678))

(assert (= (and b!217512 (not condMapEmpty!9678)) mapNonEmpty!9678))

(get-info :version)

(assert (= (and mapNonEmpty!9678 ((_ is ValueCellFull!2495) mapValue!9678)) b!217516))

(assert (= (and b!217512 ((_ is ValueCellFull!2495) mapDefault!9678)) b!217513))

(assert (= b!217508 b!217512))

(assert (= start!21670 b!217508))

(declare-fun m!243951 () Bool)

(assert (=> b!217511 m!243951))

(declare-fun m!243953 () Bool)

(assert (=> b!217508 m!243953))

(declare-fun m!243955 () Bool)

(assert (=> b!217508 m!243955))

(declare-fun m!243957 () Bool)

(assert (=> start!21670 m!243957))

(declare-fun m!243959 () Bool)

(assert (=> b!217506 m!243959))

(assert (=> b!217506 m!243959))

(declare-fun m!243961 () Bool)

(assert (=> b!217506 m!243961))

(declare-fun m!243963 () Bool)

(assert (=> b!217507 m!243963))

(declare-fun m!243965 () Bool)

(assert (=> b!217515 m!243965))

(declare-fun m!243967 () Bool)

(assert (=> mapNonEmpty!9678 m!243967))

(declare-fun m!243969 () Bool)

(assert (=> b!217509 m!243969))

(check-sat (not b!217515) (not b_next!5815) (not b!217508) tp_is_empty!5677 (not b!217507) (not mapNonEmpty!9678) (not b!217509) b_and!12719 (not start!21670) (not b!217511) (not b!217506))
(check-sat b_and!12719 (not b_next!5815))
