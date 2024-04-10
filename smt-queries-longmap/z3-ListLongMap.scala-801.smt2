; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19256 () Bool)

(assert start!19256)

(declare-fun b!189460 () Bool)

(declare-fun b_free!4647 () Bool)

(declare-fun b_next!4647 () Bool)

(assert (=> b!189460 (= b_free!4647 (not b_next!4647))))

(declare-fun tp!16774 () Bool)

(declare-fun b_and!11285 () Bool)

(assert (=> b!189460 (= tp!16774 b_and!11285)))

(declare-fun mapNonEmpty!7624 () Bool)

(declare-fun mapRes!7624 () Bool)

(declare-fun tp!16773 () Bool)

(declare-fun e!124668 () Bool)

(assert (=> mapNonEmpty!7624 (= mapRes!7624 (and tp!16773 e!124668))))

(declare-datatypes ((V!5539 0))(
  ( (V!5540 (val!2254 Int)) )
))
(declare-datatypes ((ValueCell!1866 0))(
  ( (ValueCellFull!1866 (v!4175 V!5539)) (EmptyCell!1866) )
))
(declare-fun mapRest!7624 () (Array (_ BitVec 32) ValueCell!1866))

(declare-fun mapKey!7624 () (_ BitVec 32))

(declare-fun mapValue!7624 () ValueCell!1866)

(declare-datatypes ((array!8067 0))(
  ( (array!8068 (arr!3803 (Array (_ BitVec 32) (_ BitVec 64))) (size!4123 (_ BitVec 32))) )
))
(declare-datatypes ((array!8069 0))(
  ( (array!8070 (arr!3804 (Array (_ BitVec 32) ValueCell!1866)) (size!4124 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2640 0))(
  ( (LongMapFixedSize!2641 (defaultEntry!3864 Int) (mask!9051 (_ BitVec 32)) (extraKeys!3601 (_ BitVec 32)) (zeroValue!3705 V!5539) (minValue!3705 V!5539) (_size!1369 (_ BitVec 32)) (_keys!5831 array!8067) (_values!3847 array!8069) (_vacant!1369 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2640)

(assert (=> mapNonEmpty!7624 (= (arr!3804 (_values!3847 thiss!1248)) (store mapRest!7624 mapKey!7624 mapValue!7624))))

(declare-fun res!89590 () Bool)

(declare-fun e!124664 () Bool)

(assert (=> start!19256 (=> (not res!89590) (not e!124664))))

(declare-fun valid!1084 (LongMapFixedSize!2640) Bool)

(assert (=> start!19256 (= res!89590 (valid!1084 thiss!1248))))

(assert (=> start!19256 e!124664))

(declare-fun e!124671 () Bool)

(assert (=> start!19256 e!124671))

(assert (=> start!19256 true))

(declare-fun b!189449 () Bool)

(declare-fun tp_is_empty!4419 () Bool)

(assert (=> b!189449 (= e!124668 tp_is_empty!4419)))

(declare-fun b!189450 () Bool)

(declare-fun res!89583 () Bool)

(declare-fun e!124670 () Bool)

(assert (=> b!189450 (=> (not res!89583) (not e!124670))))

(declare-datatypes ((List!2407 0))(
  ( (Nil!2404) (Cons!2403 (h!3040 (_ BitVec 64)) (t!7311 List!2407)) )
))
(declare-fun arrayNoDuplicates!0 (array!8067 (_ BitVec 32) List!2407) Bool)

(assert (=> b!189450 (= res!89583 (arrayNoDuplicates!0 (_keys!5831 thiss!1248) #b00000000000000000000000000000000 Nil!2404))))

(declare-fun b!189451 () Bool)

(declare-datatypes ((Unit!5714 0))(
  ( (Unit!5715) )
))
(declare-fun e!124663 () Unit!5714)

(declare-fun Unit!5716 () Unit!5714)

(assert (=> b!189451 (= e!124663 Unit!5716)))

(declare-fun lt!93761 () Unit!5714)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!167 (array!8067 array!8069 (_ BitVec 32) (_ BitVec 32) V!5539 V!5539 (_ BitVec 64) Int) Unit!5714)

(assert (=> b!189451 (= lt!93761 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!167 (_keys!5831 thiss!1248) (_values!3847 thiss!1248) (mask!9051 thiss!1248) (extraKeys!3601 thiss!1248) (zeroValue!3705 thiss!1248) (minValue!3705 thiss!1248) key!828 (defaultEntry!3864 thiss!1248)))))

(assert (=> b!189451 false))

(declare-datatypes ((SeekEntryResult!663 0))(
  ( (MissingZero!663 (index!4822 (_ BitVec 32))) (Found!663 (index!4823 (_ BitVec 32))) (Intermediate!663 (undefined!1475 Bool) (index!4824 (_ BitVec 32)) (x!20421 (_ BitVec 32))) (Undefined!663) (MissingVacant!663 (index!4825 (_ BitVec 32))) )
))
(declare-fun lt!93760 () SeekEntryResult!663)

(declare-fun b!189452 () Bool)

(assert (=> b!189452 (= e!124670 (not (= (select (arr!3803 (_keys!5831 thiss!1248)) (index!4823 lt!93760)) key!828)))))

(declare-fun b!189453 () Bool)

(declare-fun e!124666 () Bool)

(declare-fun e!124665 () Bool)

(assert (=> b!189453 (= e!124666 (and e!124665 mapRes!7624))))

(declare-fun condMapEmpty!7624 () Bool)

(declare-fun mapDefault!7624 () ValueCell!1866)

(assert (=> b!189453 (= condMapEmpty!7624 (= (arr!3804 (_values!3847 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1866)) mapDefault!7624)))))

(declare-fun b!189454 () Bool)

(assert (=> b!189454 (= e!124665 tp_is_empty!4419)))

(declare-fun b!189455 () Bool)

(declare-fun res!89588 () Bool)

(assert (=> b!189455 (=> (not res!89588) (not e!124664))))

(assert (=> b!189455 (= res!89588 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189456 () Bool)

(declare-fun lt!93759 () Unit!5714)

(assert (=> b!189456 (= e!124663 lt!93759)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!163 (array!8067 array!8069 (_ BitVec 32) (_ BitVec 32) V!5539 V!5539 (_ BitVec 64) Int) Unit!5714)

(assert (=> b!189456 (= lt!93759 (lemmaInListMapThenSeekEntryOrOpenFindsIt!163 (_keys!5831 thiss!1248) (_values!3847 thiss!1248) (mask!9051 thiss!1248) (extraKeys!3601 thiss!1248) (zeroValue!3705 thiss!1248) (minValue!3705 thiss!1248) key!828 (defaultEntry!3864 thiss!1248)))))

(declare-fun res!89581 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189456 (= res!89581 (inRange!0 (index!4823 lt!93760) (mask!9051 thiss!1248)))))

(declare-fun e!124667 () Bool)

(assert (=> b!189456 (=> (not res!89581) (not e!124667))))

(assert (=> b!189456 e!124667))

(declare-fun b!189457 () Bool)

(declare-fun e!124669 () Bool)

(assert (=> b!189457 (= e!124664 e!124669)))

(declare-fun res!89589 () Bool)

(assert (=> b!189457 (=> (not res!89589) (not e!124669))))

(get-info :version)

(assert (=> b!189457 (= res!89589 (and (not ((_ is Undefined!663) lt!93760)) (not ((_ is MissingVacant!663) lt!93760)) (not ((_ is MissingZero!663) lt!93760)) ((_ is Found!663) lt!93760)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8067 (_ BitVec 32)) SeekEntryResult!663)

(assert (=> b!189457 (= lt!93760 (seekEntryOrOpen!0 key!828 (_keys!5831 thiss!1248) (mask!9051 thiss!1248)))))

(declare-fun mapIsEmpty!7624 () Bool)

(assert (=> mapIsEmpty!7624 mapRes!7624))

(declare-fun b!189458 () Bool)

(declare-fun res!89584 () Bool)

(assert (=> b!189458 (=> (not res!89584) (not e!124670))))

(assert (=> b!189458 (= res!89584 (and (= (size!4124 (_values!3847 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9051 thiss!1248))) (= (size!4123 (_keys!5831 thiss!1248)) (size!4124 (_values!3847 thiss!1248))) (bvsge (mask!9051 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3601 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3601 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!189459 () Bool)

(declare-fun res!89586 () Bool)

(assert (=> b!189459 (=> (not res!89586) (not e!124670))))

(assert (=> b!189459 (= res!89586 (and (bvsge (index!4823 lt!93760) #b00000000000000000000000000000000) (bvslt (index!4823 lt!93760) (size!4123 (_keys!5831 thiss!1248)))))))

(declare-fun array_inv!2465 (array!8067) Bool)

(declare-fun array_inv!2466 (array!8069) Bool)

(assert (=> b!189460 (= e!124671 (and tp!16774 tp_is_empty!4419 (array_inv!2465 (_keys!5831 thiss!1248)) (array_inv!2466 (_values!3847 thiss!1248)) e!124666))))

(declare-fun b!189461 () Bool)

(declare-fun res!89587 () Bool)

(assert (=> b!189461 (=> (not res!89587) (not e!124670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189461 (= res!89587 (validKeyInArray!0 key!828))))

(declare-fun b!189462 () Bool)

(assert (=> b!189462 (= e!124667 (= (select (arr!3803 (_keys!5831 thiss!1248)) (index!4823 lt!93760)) key!828))))

(declare-fun b!189463 () Bool)

(declare-fun res!89585 () Bool)

(assert (=> b!189463 (=> (not res!89585) (not e!124670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8067 (_ BitVec 32)) Bool)

(assert (=> b!189463 (= res!89585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5831 thiss!1248) (mask!9051 thiss!1248)))))

(declare-fun b!189464 () Bool)

(assert (=> b!189464 (= e!124669 e!124670)))

(declare-fun res!89582 () Bool)

(assert (=> b!189464 (=> (not res!89582) (not e!124670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189464 (= res!89582 (validMask!0 (mask!9051 thiss!1248)))))

(declare-fun lt!93758 () Unit!5714)

(assert (=> b!189464 (= lt!93758 e!124663)))

(declare-fun c!34043 () Bool)

(declare-datatypes ((tuple2!3508 0))(
  ( (tuple2!3509 (_1!1765 (_ BitVec 64)) (_2!1765 V!5539)) )
))
(declare-datatypes ((List!2408 0))(
  ( (Nil!2405) (Cons!2404 (h!3041 tuple2!3508) (t!7312 List!2408)) )
))
(declare-datatypes ((ListLongMap!2425 0))(
  ( (ListLongMap!2426 (toList!1228 List!2408)) )
))
(declare-fun contains!1335 (ListLongMap!2425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!876 (array!8067 array!8069 (_ BitVec 32) (_ BitVec 32) V!5539 V!5539 (_ BitVec 32) Int) ListLongMap!2425)

(assert (=> b!189464 (= c!34043 (contains!1335 (getCurrentListMap!876 (_keys!5831 thiss!1248) (_values!3847 thiss!1248) (mask!9051 thiss!1248) (extraKeys!3601 thiss!1248) (zeroValue!3705 thiss!1248) (minValue!3705 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3864 thiss!1248)) key!828))))

(assert (= (and start!19256 res!89590) b!189455))

(assert (= (and b!189455 res!89588) b!189457))

(assert (= (and b!189457 res!89589) b!189464))

(assert (= (and b!189464 c!34043) b!189456))

(assert (= (and b!189464 (not c!34043)) b!189451))

(assert (= (and b!189456 res!89581) b!189462))

(assert (= (and b!189464 res!89582) b!189458))

(assert (= (and b!189458 res!89584) b!189463))

(assert (= (and b!189463 res!89585) b!189450))

(assert (= (and b!189450 res!89583) b!189459))

(assert (= (and b!189459 res!89586) b!189461))

(assert (= (and b!189461 res!89587) b!189452))

(assert (= (and b!189453 condMapEmpty!7624) mapIsEmpty!7624))

(assert (= (and b!189453 (not condMapEmpty!7624)) mapNonEmpty!7624))

(assert (= (and mapNonEmpty!7624 ((_ is ValueCellFull!1866) mapValue!7624)) b!189449))

(assert (= (and b!189453 ((_ is ValueCellFull!1866) mapDefault!7624)) b!189454))

(assert (= b!189460 b!189453))

(assert (= start!19256 b!189460))

(declare-fun m!215781 () Bool)

(assert (=> b!189464 m!215781))

(declare-fun m!215783 () Bool)

(assert (=> b!189464 m!215783))

(assert (=> b!189464 m!215783))

(declare-fun m!215785 () Bool)

(assert (=> b!189464 m!215785))

(declare-fun m!215787 () Bool)

(assert (=> b!189456 m!215787))

(declare-fun m!215789 () Bool)

(assert (=> b!189456 m!215789))

(declare-fun m!215791 () Bool)

(assert (=> b!189461 m!215791))

(declare-fun m!215793 () Bool)

(assert (=> b!189451 m!215793))

(declare-fun m!215795 () Bool)

(assert (=> b!189460 m!215795))

(declare-fun m!215797 () Bool)

(assert (=> b!189460 m!215797))

(declare-fun m!215799 () Bool)

(assert (=> b!189463 m!215799))

(declare-fun m!215801 () Bool)

(assert (=> start!19256 m!215801))

(declare-fun m!215803 () Bool)

(assert (=> b!189457 m!215803))

(declare-fun m!215805 () Bool)

(assert (=> b!189462 m!215805))

(declare-fun m!215807 () Bool)

(assert (=> mapNonEmpty!7624 m!215807))

(declare-fun m!215809 () Bool)

(assert (=> b!189450 m!215809))

(assert (=> b!189452 m!215805))

(check-sat (not b!189451) (not b_next!4647) (not b!189464) (not b!189461) (not b!189450) (not b!189456) b_and!11285 (not b!189463) (not start!19256) (not mapNonEmpty!7624) (not b!189457) tp_is_empty!4419 (not b!189460))
(check-sat b_and!11285 (not b_next!4647))
