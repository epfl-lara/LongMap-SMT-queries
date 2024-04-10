; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16076 () Bool)

(assert start!16076)

(declare-fun b!159664 () Bool)

(declare-fun b_free!3537 () Bool)

(declare-fun b_next!3537 () Bool)

(assert (=> b!159664 (= b_free!3537 (not b_next!3537))))

(declare-fun tp!13180 () Bool)

(declare-fun b_and!9951 () Bool)

(assert (=> b!159664 (= tp!13180 b_and!9951)))

(declare-fun b!159660 () Bool)

(declare-fun e!104480 () Bool)

(declare-fun tp_is_empty!3339 () Bool)

(assert (=> b!159660 (= e!104480 tp_is_empty!3339)))

(declare-fun b!159661 () Bool)

(declare-fun e!104481 () Bool)

(assert (=> b!159661 (= e!104481 false)))

(declare-fun lt!82018 () Bool)

(declare-datatypes ((V!4099 0))(
  ( (V!4100 (val!1714 Int)) )
))
(declare-datatypes ((ValueCell!1326 0))(
  ( (ValueCellFull!1326 (v!3579 V!4099)) (EmptyCell!1326) )
))
(declare-datatypes ((array!5757 0))(
  ( (array!5758 (arr!2723 (Array (_ BitVec 32) (_ BitVec 64))) (size!3007 (_ BitVec 32))) )
))
(declare-datatypes ((array!5759 0))(
  ( (array!5760 (arr!2724 (Array (_ BitVec 32) ValueCell!1326)) (size!3008 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1560 0))(
  ( (LongMapFixedSize!1561 (defaultEntry!3222 Int) (mask!7776 (_ BitVec 32)) (extraKeys!2963 (_ BitVec 32)) (zeroValue!3065 V!4099) (minValue!3065 V!4099) (_size!829 (_ BitVec 32)) (_keys!5023 array!5757) (_values!3205 array!5759) (_vacant!829 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1560)

(declare-datatypes ((List!1915 0))(
  ( (Nil!1912) (Cons!1911 (h!2524 (_ BitVec 64)) (t!6717 List!1915)) )
))
(declare-fun arrayNoDuplicates!0 (array!5757 (_ BitVec 32) List!1915) Bool)

(assert (=> b!159661 (= lt!82018 (arrayNoDuplicates!0 (_keys!5023 thiss!1248) #b00000000000000000000000000000000 Nil!1912))))

(declare-fun b!159662 () Bool)

(declare-fun e!104483 () Bool)

(assert (=> b!159662 (= e!104483 tp_is_empty!3339)))

(declare-fun b!159663 () Bool)

(declare-fun res!75474 () Bool)

(assert (=> b!159663 (=> (not res!75474) (not e!104481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159663 (= res!75474 (validMask!0 (mask!7776 thiss!1248)))))

(declare-fun e!104482 () Bool)

(declare-fun e!104479 () Bool)

(declare-fun array_inv!1731 (array!5757) Bool)

(declare-fun array_inv!1732 (array!5759) Bool)

(assert (=> b!159664 (= e!104479 (and tp!13180 tp_is_empty!3339 (array_inv!1731 (_keys!5023 thiss!1248)) (array_inv!1732 (_values!3205 thiss!1248)) e!104482))))

(declare-fun res!75472 () Bool)

(assert (=> start!16076 (=> (not res!75472) (not e!104481))))

(declare-fun valid!728 (LongMapFixedSize!1560) Bool)

(assert (=> start!16076 (= res!75472 (valid!728 thiss!1248))))

(assert (=> start!16076 e!104481))

(assert (=> start!16076 e!104479))

(assert (=> start!16076 true))

(declare-fun b!159665 () Bool)

(declare-fun res!75470 () Bool)

(assert (=> b!159665 (=> (not res!75470) (not e!104481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5757 (_ BitVec 32)) Bool)

(assert (=> b!159665 (= res!75470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5023 thiss!1248) (mask!7776 thiss!1248)))))

(declare-fun b!159666 () Bool)

(declare-fun mapRes!5696 () Bool)

(assert (=> b!159666 (= e!104482 (and e!104480 mapRes!5696))))

(declare-fun condMapEmpty!5696 () Bool)

(declare-fun mapDefault!5696 () ValueCell!1326)

(assert (=> b!159666 (= condMapEmpty!5696 (= (arr!2724 (_values!3205 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1326)) mapDefault!5696)))))

(declare-fun b!159667 () Bool)

(declare-fun res!75471 () Bool)

(assert (=> b!159667 (=> (not res!75471) (not e!104481))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!315 0))(
  ( (MissingZero!315 (index!3428 (_ BitVec 32))) (Found!315 (index!3429 (_ BitVec 32))) (Intermediate!315 (undefined!1127 Bool) (index!3430 (_ BitVec 32)) (x!17627 (_ BitVec 32))) (Undefined!315) (MissingVacant!315 (index!3431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5757 (_ BitVec 32)) SeekEntryResult!315)

(assert (=> b!159667 (= res!75471 ((_ is Undefined!315) (seekEntryOrOpen!0 key!828 (_keys!5023 thiss!1248) (mask!7776 thiss!1248))))))

(declare-fun mapNonEmpty!5696 () Bool)

(declare-fun tp!13181 () Bool)

(assert (=> mapNonEmpty!5696 (= mapRes!5696 (and tp!13181 e!104483))))

(declare-fun mapValue!5696 () ValueCell!1326)

(declare-fun mapKey!5696 () (_ BitVec 32))

(declare-fun mapRest!5696 () (Array (_ BitVec 32) ValueCell!1326))

(assert (=> mapNonEmpty!5696 (= (arr!2724 (_values!3205 thiss!1248)) (store mapRest!5696 mapKey!5696 mapValue!5696))))

(declare-fun b!159668 () Bool)

(declare-fun res!75476 () Bool)

(assert (=> b!159668 (=> (not res!75476) (not e!104481))))

(assert (=> b!159668 (= res!75476 (and (= (size!3008 (_values!3205 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7776 thiss!1248))) (= (size!3007 (_keys!5023 thiss!1248)) (size!3008 (_values!3205 thiss!1248))) (bvsge (mask!7776 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2963 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2963 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159669 () Bool)

(declare-fun res!75473 () Bool)

(assert (=> b!159669 (=> (not res!75473) (not e!104481))))

(declare-datatypes ((tuple2!2894 0))(
  ( (tuple2!2895 (_1!1458 (_ BitVec 64)) (_2!1458 V!4099)) )
))
(declare-datatypes ((List!1916 0))(
  ( (Nil!1913) (Cons!1912 (h!2525 tuple2!2894) (t!6718 List!1916)) )
))
(declare-datatypes ((ListLongMap!1881 0))(
  ( (ListLongMap!1882 (toList!956 List!1916)) )
))
(declare-fun contains!992 (ListLongMap!1881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!620 (array!5757 array!5759 (_ BitVec 32) (_ BitVec 32) V!4099 V!4099 (_ BitVec 32) Int) ListLongMap!1881)

(assert (=> b!159669 (= res!75473 (contains!992 (getCurrentListMap!620 (_keys!5023 thiss!1248) (_values!3205 thiss!1248) (mask!7776 thiss!1248) (extraKeys!2963 thiss!1248) (zeroValue!3065 thiss!1248) (minValue!3065 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3222 thiss!1248)) key!828))))

(declare-fun b!159670 () Bool)

(declare-fun res!75475 () Bool)

(assert (=> b!159670 (=> (not res!75475) (not e!104481))))

(assert (=> b!159670 (= res!75475 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5696 () Bool)

(assert (=> mapIsEmpty!5696 mapRes!5696))

(assert (= (and start!16076 res!75472) b!159670))

(assert (= (and b!159670 res!75475) b!159667))

(assert (= (and b!159667 res!75471) b!159669))

(assert (= (and b!159669 res!75473) b!159663))

(assert (= (and b!159663 res!75474) b!159668))

(assert (= (and b!159668 res!75476) b!159665))

(assert (= (and b!159665 res!75470) b!159661))

(assert (= (and b!159666 condMapEmpty!5696) mapIsEmpty!5696))

(assert (= (and b!159666 (not condMapEmpty!5696)) mapNonEmpty!5696))

(assert (= (and mapNonEmpty!5696 ((_ is ValueCellFull!1326) mapValue!5696)) b!159662))

(assert (= (and b!159666 ((_ is ValueCellFull!1326) mapDefault!5696)) b!159660))

(assert (= b!159664 b!159666))

(assert (= start!16076 b!159664))

(declare-fun m!191837 () Bool)

(assert (=> b!159667 m!191837))

(declare-fun m!191839 () Bool)

(assert (=> mapNonEmpty!5696 m!191839))

(declare-fun m!191841 () Bool)

(assert (=> b!159669 m!191841))

(assert (=> b!159669 m!191841))

(declare-fun m!191843 () Bool)

(assert (=> b!159669 m!191843))

(declare-fun m!191845 () Bool)

(assert (=> b!159664 m!191845))

(declare-fun m!191847 () Bool)

(assert (=> b!159664 m!191847))

(declare-fun m!191849 () Bool)

(assert (=> start!16076 m!191849))

(declare-fun m!191851 () Bool)

(assert (=> b!159661 m!191851))

(declare-fun m!191853 () Bool)

(assert (=> b!159663 m!191853))

(declare-fun m!191855 () Bool)

(assert (=> b!159665 m!191855))

(check-sat (not mapNonEmpty!5696) b_and!9951 (not b!159669) (not b!159665) (not b_next!3537) (not b!159667) (not b!159663) (not b!159661) (not b!159664) (not start!16076) tp_is_empty!3339)
(check-sat b_and!9951 (not b_next!3537))
