; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16084 () Bool)

(assert start!16084)

(declare-fun b!159777 () Bool)

(declare-fun b_free!3541 () Bool)

(declare-fun b_next!3541 () Bool)

(assert (=> b!159777 (= b_free!3541 (not b_next!3541))))

(declare-fun tp!13193 () Bool)

(declare-fun b_and!9969 () Bool)

(assert (=> b!159777 (= tp!13193 b_and!9969)))

(declare-fun b!159773 () Bool)

(declare-fun res!75537 () Bool)

(declare-fun e!104543 () Bool)

(assert (=> b!159773 (=> (not res!75537) (not e!104543))))

(declare-datatypes ((V!4105 0))(
  ( (V!4106 (val!1716 Int)) )
))
(declare-datatypes ((ValueCell!1328 0))(
  ( (ValueCellFull!1328 (v!3582 V!4105)) (EmptyCell!1328) )
))
(declare-datatypes ((array!5751 0))(
  ( (array!5752 (arr!2720 (Array (_ BitVec 32) (_ BitVec 64))) (size!3004 (_ BitVec 32))) )
))
(declare-datatypes ((array!5753 0))(
  ( (array!5754 (arr!2721 (Array (_ BitVec 32) ValueCell!1328)) (size!3005 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1564 0))(
  ( (LongMapFixedSize!1565 (defaultEntry!3224 Int) (mask!7780 (_ BitVec 32)) (extraKeys!2965 (_ BitVec 32)) (zeroValue!3067 V!4105) (minValue!3067 V!4105) (_size!831 (_ BitVec 32)) (_keys!5025 array!5751) (_values!3207 array!5753) (_vacant!831 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1564)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2832 0))(
  ( (tuple2!2833 (_1!1427 (_ BitVec 64)) (_2!1427 V!4105)) )
))
(declare-datatypes ((List!1899 0))(
  ( (Nil!1896) (Cons!1895 (h!2508 tuple2!2832) (t!6693 List!1899)) )
))
(declare-datatypes ((ListLongMap!1831 0))(
  ( (ListLongMap!1832 (toList!931 List!1899)) )
))
(declare-fun contains!977 (ListLongMap!1831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!598 (array!5751 array!5753 (_ BitVec 32) (_ BitVec 32) V!4105 V!4105 (_ BitVec 32) Int) ListLongMap!1831)

(assert (=> b!159773 (= res!75537 (contains!977 (getCurrentListMap!598 (_keys!5025 thiss!1248) (_values!3207 thiss!1248) (mask!7780 thiss!1248) (extraKeys!2965 thiss!1248) (zeroValue!3067 thiss!1248) (minValue!3067 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3224 thiss!1248)) key!828))))

(declare-fun b!159774 () Bool)

(declare-fun res!75534 () Bool)

(assert (=> b!159774 (=> (not res!75534) (not e!104543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159774 (= res!75534 (validMask!0 (mask!7780 thiss!1248)))))

(declare-fun b!159775 () Bool)

(declare-fun res!75539 () Bool)

(assert (=> b!159775 (=> (not res!75539) (not e!104543))))

(assert (=> b!159775 (= res!75539 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5702 () Bool)

(declare-fun mapRes!5702 () Bool)

(assert (=> mapIsEmpty!5702 mapRes!5702))

(declare-fun b!159776 () Bool)

(declare-fun e!104540 () Bool)

(declare-fun tp_is_empty!3343 () Bool)

(assert (=> b!159776 (= e!104540 tp_is_empty!3343)))

(declare-fun e!104544 () Bool)

(declare-fun e!104541 () Bool)

(declare-fun array_inv!1737 (array!5751) Bool)

(declare-fun array_inv!1738 (array!5753) Bool)

(assert (=> b!159777 (= e!104541 (and tp!13193 tp_is_empty!3343 (array_inv!1737 (_keys!5025 thiss!1248)) (array_inv!1738 (_values!3207 thiss!1248)) e!104544))))

(declare-fun res!75536 () Bool)

(assert (=> start!16084 (=> (not res!75536) (not e!104543))))

(declare-fun valid!749 (LongMapFixedSize!1564) Bool)

(assert (=> start!16084 (= res!75536 (valid!749 thiss!1248))))

(assert (=> start!16084 e!104543))

(assert (=> start!16084 e!104541))

(assert (=> start!16084 true))

(declare-fun b!159778 () Bool)

(declare-fun res!75535 () Bool)

(assert (=> b!159778 (=> (not res!75535) (not e!104543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5751 (_ BitVec 32)) Bool)

(assert (=> b!159778 (= res!75535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5025 thiss!1248) (mask!7780 thiss!1248)))))

(declare-fun b!159779 () Bool)

(assert (=> b!159779 (= e!104544 (and e!104540 mapRes!5702))))

(declare-fun condMapEmpty!5702 () Bool)

(declare-fun mapDefault!5702 () ValueCell!1328)

(assert (=> b!159779 (= condMapEmpty!5702 (= (arr!2721 (_values!3207 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1328)) mapDefault!5702)))))

(declare-fun b!159780 () Bool)

(assert (=> b!159780 (= e!104543 false)))

(declare-fun lt!82083 () Bool)

(declare-datatypes ((List!1900 0))(
  ( (Nil!1897) (Cons!1896 (h!2509 (_ BitVec 64)) (t!6694 List!1900)) )
))
(declare-fun arrayNoDuplicates!0 (array!5751 (_ BitVec 32) List!1900) Bool)

(assert (=> b!159780 (= lt!82083 (arrayNoDuplicates!0 (_keys!5025 thiss!1248) #b00000000000000000000000000000000 Nil!1897))))

(declare-fun b!159781 () Bool)

(declare-fun res!75533 () Bool)

(assert (=> b!159781 (=> (not res!75533) (not e!104543))))

(assert (=> b!159781 (= res!75533 (and (= (size!3005 (_values!3207 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7780 thiss!1248))) (= (size!3004 (_keys!5025 thiss!1248)) (size!3005 (_values!3207 thiss!1248))) (bvsge (mask!7780 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2965 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2965 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5702 () Bool)

(declare-fun tp!13192 () Bool)

(declare-fun e!104542 () Bool)

(assert (=> mapNonEmpty!5702 (= mapRes!5702 (and tp!13192 e!104542))))

(declare-fun mapValue!5702 () ValueCell!1328)

(declare-fun mapKey!5702 () (_ BitVec 32))

(declare-fun mapRest!5702 () (Array (_ BitVec 32) ValueCell!1328))

(assert (=> mapNonEmpty!5702 (= (arr!2721 (_values!3207 thiss!1248)) (store mapRest!5702 mapKey!5702 mapValue!5702))))

(declare-fun b!159782 () Bool)

(declare-fun res!75538 () Bool)

(assert (=> b!159782 (=> (not res!75538) (not e!104543))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!312 0))(
  ( (MissingZero!312 (index!3416 (_ BitVec 32))) (Found!312 (index!3417 (_ BitVec 32))) (Intermediate!312 (undefined!1124 Bool) (index!3418 (_ BitVec 32)) (x!17632 (_ BitVec 32))) (Undefined!312) (MissingVacant!312 (index!3419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5751 (_ BitVec 32)) SeekEntryResult!312)

(assert (=> b!159782 (= res!75538 ((_ is Undefined!312) (seekEntryOrOpen!0 key!828 (_keys!5025 thiss!1248) (mask!7780 thiss!1248))))))

(declare-fun b!159783 () Bool)

(assert (=> b!159783 (= e!104542 tp_is_empty!3343)))

(assert (= (and start!16084 res!75536) b!159775))

(assert (= (and b!159775 res!75539) b!159782))

(assert (= (and b!159782 res!75538) b!159773))

(assert (= (and b!159773 res!75537) b!159774))

(assert (= (and b!159774 res!75534) b!159781))

(assert (= (and b!159781 res!75533) b!159778))

(assert (= (and b!159778 res!75535) b!159780))

(assert (= (and b!159779 condMapEmpty!5702) mapIsEmpty!5702))

(assert (= (and b!159779 (not condMapEmpty!5702)) mapNonEmpty!5702))

(assert (= (and mapNonEmpty!5702 ((_ is ValueCellFull!1328) mapValue!5702)) b!159783))

(assert (= (and b!159779 ((_ is ValueCellFull!1328) mapDefault!5702)) b!159776))

(assert (= b!159777 b!159779))

(assert (= start!16084 b!159777))

(declare-fun m!192059 () Bool)

(assert (=> b!159777 m!192059))

(declare-fun m!192061 () Bool)

(assert (=> b!159777 m!192061))

(declare-fun m!192063 () Bool)

(assert (=> start!16084 m!192063))

(declare-fun m!192065 () Bool)

(assert (=> b!159780 m!192065))

(declare-fun m!192067 () Bool)

(assert (=> b!159773 m!192067))

(assert (=> b!159773 m!192067))

(declare-fun m!192069 () Bool)

(assert (=> b!159773 m!192069))

(declare-fun m!192071 () Bool)

(assert (=> b!159782 m!192071))

(declare-fun m!192073 () Bool)

(assert (=> b!159778 m!192073))

(declare-fun m!192075 () Bool)

(assert (=> b!159774 m!192075))

(declare-fun m!192077 () Bool)

(assert (=> mapNonEmpty!5702 m!192077))

(check-sat (not b!159778) tp_is_empty!3343 (not b!159774) (not mapNonEmpty!5702) b_and!9969 (not b!159780) (not start!16084) (not b!159773) (not b_next!3541) (not b!159782) (not b!159777))
(check-sat b_and!9969 (not b_next!3541))
