; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16138 () Bool)

(assert start!16138)

(declare-fun b!160471 () Bool)

(declare-fun b_free!3595 () Bool)

(declare-fun b_next!3595 () Bool)

(assert (=> b!160471 (= b_free!3595 (not b_next!3595))))

(declare-fun tp!13354 () Bool)

(declare-fun b_and!9983 () Bool)

(assert (=> b!160471 (= tp!13354 b_and!9983)))

(declare-fun b!160470 () Bool)

(declare-fun res!75988 () Bool)

(declare-fun e!104900 () Bool)

(assert (=> b!160470 (=> (not res!75988) (not e!104900))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160470 (= res!75988 (not (= key!828 (bvneg key!828))))))

(declare-fun e!104905 () Bool)

(declare-fun e!104903 () Bool)

(declare-fun tp_is_empty!3397 () Bool)

(declare-datatypes ((V!4177 0))(
  ( (V!4178 (val!1743 Int)) )
))
(declare-datatypes ((ValueCell!1355 0))(
  ( (ValueCellFull!1355 (v!3602 V!4177)) (EmptyCell!1355) )
))
(declare-datatypes ((array!5853 0))(
  ( (array!5854 (arr!2770 (Array (_ BitVec 32) (_ BitVec 64))) (size!3055 (_ BitVec 32))) )
))
(declare-datatypes ((array!5855 0))(
  ( (array!5856 (arr!2771 (Array (_ BitVec 32) ValueCell!1355)) (size!3056 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1618 0))(
  ( (LongMapFixedSize!1619 (defaultEntry!3251 Int) (mask!7824 (_ BitVec 32)) (extraKeys!2992 (_ BitVec 32)) (zeroValue!3094 V!4177) (minValue!3094 V!4177) (_size!858 (_ BitVec 32)) (_keys!5051 array!5853) (_values!3234 array!5855) (_vacant!858 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1618)

(declare-fun array_inv!1781 (array!5853) Bool)

(declare-fun array_inv!1782 (array!5855) Bool)

(assert (=> b!160471 (= e!104905 (and tp!13354 tp_is_empty!3397 (array_inv!1781 (_keys!5051 thiss!1248)) (array_inv!1782 (_values!3234 thiss!1248)) e!104903))))

(declare-fun mapIsEmpty!5783 () Bool)

(declare-fun mapRes!5783 () Bool)

(assert (=> mapIsEmpty!5783 mapRes!5783))

(declare-fun b!160472 () Bool)

(assert (=> b!160472 (= e!104900 false)))

(declare-fun lt!81924 () Bool)

(declare-datatypes ((List!1951 0))(
  ( (Nil!1948) (Cons!1947 (h!2560 (_ BitVec 64)) (t!6744 List!1951)) )
))
(declare-fun arrayNoDuplicates!0 (array!5853 (_ BitVec 32) List!1951) Bool)

(assert (=> b!160472 (= lt!81924 (arrayNoDuplicates!0 (_keys!5051 thiss!1248) #b00000000000000000000000000000000 Nil!1948))))

(declare-fun b!160473 () Bool)

(declare-fun res!75986 () Bool)

(assert (=> b!160473 (=> (not res!75986) (not e!104900))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!343 0))(
  ( (MissingZero!343 (index!3540 (_ BitVec 32))) (Found!343 (index!3541 (_ BitVec 32))) (Intermediate!343 (undefined!1155 Bool) (index!3542 (_ BitVec 32)) (x!17734 (_ BitVec 32))) (Undefined!343) (MissingVacant!343 (index!3543 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5853 (_ BitVec 32)) SeekEntryResult!343)

(assert (=> b!160473 (= res!75986 ((_ is Undefined!343) (seekEntryOrOpen!0 key!828 (_keys!5051 thiss!1248) (mask!7824 thiss!1248))))))

(declare-fun b!160474 () Bool)

(declare-fun res!75989 () Bool)

(assert (=> b!160474 (=> (not res!75989) (not e!104900))))

(assert (=> b!160474 (= res!75989 (and (= (size!3056 (_values!3234 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7824 thiss!1248))) (= (size!3055 (_keys!5051 thiss!1248)) (size!3056 (_values!3234 thiss!1248))) (bvsge (mask!7824 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2992 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2992 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160475 () Bool)

(declare-fun res!75984 () Bool)

(assert (=> b!160475 (=> (not res!75984) (not e!104900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5853 (_ BitVec 32)) Bool)

(assert (=> b!160475 (= res!75984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5051 thiss!1248) (mask!7824 thiss!1248)))))

(declare-fun b!160476 () Bool)

(declare-fun res!75987 () Bool)

(assert (=> b!160476 (=> (not res!75987) (not e!104900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160476 (= res!75987 (validMask!0 (mask!7824 thiss!1248)))))

(declare-fun res!75985 () Bool)

(assert (=> start!16138 (=> (not res!75985) (not e!104900))))

(declare-fun valid!749 (LongMapFixedSize!1618) Bool)

(assert (=> start!16138 (= res!75985 (valid!749 thiss!1248))))

(assert (=> start!16138 e!104900))

(assert (=> start!16138 e!104905))

(assert (=> start!16138 true))

(declare-fun b!160477 () Bool)

(declare-fun e!104902 () Bool)

(assert (=> b!160477 (= e!104902 tp_is_empty!3397)))

(declare-fun b!160478 () Bool)

(declare-fun res!75990 () Bool)

(assert (=> b!160478 (=> (not res!75990) (not e!104900))))

(declare-datatypes ((tuple2!2900 0))(
  ( (tuple2!2901 (_1!1461 (_ BitVec 64)) (_2!1461 V!4177)) )
))
(declare-datatypes ((List!1952 0))(
  ( (Nil!1949) (Cons!1948 (h!2561 tuple2!2900) (t!6745 List!1952)) )
))
(declare-datatypes ((ListLongMap!1887 0))(
  ( (ListLongMap!1888 (toList!959 List!1952)) )
))
(declare-fun contains!998 (ListLongMap!1887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!609 (array!5853 array!5855 (_ BitVec 32) (_ BitVec 32) V!4177 V!4177 (_ BitVec 32) Int) ListLongMap!1887)

(assert (=> b!160478 (= res!75990 (not (contains!998 (getCurrentListMap!609 (_keys!5051 thiss!1248) (_values!3234 thiss!1248) (mask!7824 thiss!1248) (extraKeys!2992 thiss!1248) (zeroValue!3094 thiss!1248) (minValue!3094 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3251 thiss!1248)) key!828)))))

(declare-fun b!160479 () Bool)

(declare-fun e!104901 () Bool)

(assert (=> b!160479 (= e!104903 (and e!104901 mapRes!5783))))

(declare-fun condMapEmpty!5783 () Bool)

(declare-fun mapDefault!5783 () ValueCell!1355)

(assert (=> b!160479 (= condMapEmpty!5783 (= (arr!2771 (_values!3234 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1355)) mapDefault!5783)))))

(declare-fun mapNonEmpty!5783 () Bool)

(declare-fun tp!13355 () Bool)

(assert (=> mapNonEmpty!5783 (= mapRes!5783 (and tp!13355 e!104902))))

(declare-fun mapValue!5783 () ValueCell!1355)

(declare-fun mapRest!5783 () (Array (_ BitVec 32) ValueCell!1355))

(declare-fun mapKey!5783 () (_ BitVec 32))

(assert (=> mapNonEmpty!5783 (= (arr!2771 (_values!3234 thiss!1248)) (store mapRest!5783 mapKey!5783 mapValue!5783))))

(declare-fun b!160480 () Bool)

(assert (=> b!160480 (= e!104901 tp_is_empty!3397)))

(assert (= (and start!16138 res!75985) b!160470))

(assert (= (and b!160470 res!75988) b!160473))

(assert (= (and b!160473 res!75986) b!160478))

(assert (= (and b!160478 res!75990) b!160476))

(assert (= (and b!160476 res!75987) b!160474))

(assert (= (and b!160474 res!75989) b!160475))

(assert (= (and b!160475 res!75984) b!160472))

(assert (= (and b!160479 condMapEmpty!5783) mapIsEmpty!5783))

(assert (= (and b!160479 (not condMapEmpty!5783)) mapNonEmpty!5783))

(assert (= (and mapNonEmpty!5783 ((_ is ValueCellFull!1355) mapValue!5783)) b!160477))

(assert (= (and b!160479 ((_ is ValueCellFull!1355) mapDefault!5783)) b!160480))

(assert (= b!160471 b!160479))

(assert (= start!16138 b!160471))

(declare-fun m!191797 () Bool)

(assert (=> b!160478 m!191797))

(assert (=> b!160478 m!191797))

(declare-fun m!191799 () Bool)

(assert (=> b!160478 m!191799))

(declare-fun m!191801 () Bool)

(assert (=> b!160476 m!191801))

(declare-fun m!191803 () Bool)

(assert (=> b!160475 m!191803))

(declare-fun m!191805 () Bool)

(assert (=> start!16138 m!191805))

(declare-fun m!191807 () Bool)

(assert (=> b!160473 m!191807))

(declare-fun m!191809 () Bool)

(assert (=> mapNonEmpty!5783 m!191809))

(declare-fun m!191811 () Bool)

(assert (=> b!160471 m!191811))

(declare-fun m!191813 () Bool)

(assert (=> b!160471 m!191813))

(declare-fun m!191815 () Bool)

(assert (=> b!160472 m!191815))

(check-sat (not b_next!3595) (not b!160473) (not mapNonEmpty!5783) (not start!16138) tp_is_empty!3397 (not b!160475) (not b!160478) (not b!160472) (not b!160471) (not b!160476) b_and!9983)
(check-sat b_and!9983 (not b_next!3595))
