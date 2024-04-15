; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16102 () Bool)

(assert start!16102)

(declare-fun b!159884 () Bool)

(declare-fun b_free!3559 () Bool)

(declare-fun b_next!3559 () Bool)

(assert (=> b!159884 (= b_free!3559 (not b_next!3559))))

(declare-fun tp!13246 () Bool)

(declare-fun b_and!9947 () Bool)

(assert (=> b!159884 (= tp!13246 b_and!9947)))

(declare-fun b!159876 () Bool)

(declare-fun e!104576 () Bool)

(assert (=> b!159876 (= e!104576 false)))

(declare-fun lt!81870 () Bool)

(declare-datatypes ((V!4129 0))(
  ( (V!4130 (val!1725 Int)) )
))
(declare-datatypes ((ValueCell!1337 0))(
  ( (ValueCellFull!1337 (v!3584 V!4129)) (EmptyCell!1337) )
))
(declare-datatypes ((array!5781 0))(
  ( (array!5782 (arr!2734 (Array (_ BitVec 32) (_ BitVec 64))) (size!3019 (_ BitVec 32))) )
))
(declare-datatypes ((array!5783 0))(
  ( (array!5784 (arr!2735 (Array (_ BitVec 32) ValueCell!1337)) (size!3020 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1582 0))(
  ( (LongMapFixedSize!1583 (defaultEntry!3233 Int) (mask!7794 (_ BitVec 32)) (extraKeys!2974 (_ BitVec 32)) (zeroValue!3076 V!4129) (minValue!3076 V!4129) (_size!840 (_ BitVec 32)) (_keys!5033 array!5781) (_values!3216 array!5783) (_vacant!840 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1582)

(declare-datatypes ((List!1921 0))(
  ( (Nil!1918) (Cons!1917 (h!2530 (_ BitVec 64)) (t!6714 List!1921)) )
))
(declare-fun arrayNoDuplicates!0 (array!5781 (_ BitVec 32) List!1921) Bool)

(assert (=> b!159876 (= lt!81870 (arrayNoDuplicates!0 (_keys!5033 thiss!1248) #b00000000000000000000000000000000 Nil!1918))))

(declare-fun b!159877 () Bool)

(declare-fun e!104580 () Bool)

(declare-fun tp_is_empty!3361 () Bool)

(assert (=> b!159877 (= e!104580 tp_is_empty!3361)))

(declare-fun b!159878 () Bool)

(declare-fun res!75612 () Bool)

(assert (=> b!159878 (=> (not res!75612) (not e!104576))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2868 0))(
  ( (tuple2!2869 (_1!1445 (_ BitVec 64)) (_2!1445 V!4129)) )
))
(declare-datatypes ((List!1922 0))(
  ( (Nil!1919) (Cons!1918 (h!2531 tuple2!2868) (t!6715 List!1922)) )
))
(declare-datatypes ((ListLongMap!1855 0))(
  ( (ListLongMap!1856 (toList!943 List!1922)) )
))
(declare-fun contains!982 (ListLongMap!1855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!593 (array!5781 array!5783 (_ BitVec 32) (_ BitVec 32) V!4129 V!4129 (_ BitVec 32) Int) ListLongMap!1855)

(assert (=> b!159878 (= res!75612 (contains!982 (getCurrentListMap!593 (_keys!5033 thiss!1248) (_values!3216 thiss!1248) (mask!7794 thiss!1248) (extraKeys!2974 thiss!1248) (zeroValue!3076 thiss!1248) (minValue!3076 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3233 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!5729 () Bool)

(declare-fun mapRes!5729 () Bool)

(assert (=> mapIsEmpty!5729 mapRes!5729))

(declare-fun b!159880 () Bool)

(declare-fun res!75606 () Bool)

(assert (=> b!159880 (=> (not res!75606) (not e!104576))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!327 0))(
  ( (MissingZero!327 (index!3476 (_ BitVec 32))) (Found!327 (index!3477 (_ BitVec 32))) (Intermediate!327 (undefined!1139 Bool) (index!3478 (_ BitVec 32)) (x!17670 (_ BitVec 32))) (Undefined!327) (MissingVacant!327 (index!3479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5781 (_ BitVec 32)) SeekEntryResult!327)

(assert (=> b!159880 (= res!75606 ((_ is Undefined!327) (seekEntryOrOpen!0 key!828 (_keys!5033 thiss!1248) (mask!7794 thiss!1248))))))

(declare-fun b!159881 () Bool)

(declare-fun e!104578 () Bool)

(declare-fun e!104581 () Bool)

(assert (=> b!159881 (= e!104578 (and e!104581 mapRes!5729))))

(declare-fun condMapEmpty!5729 () Bool)

(declare-fun mapDefault!5729 () ValueCell!1337)

(assert (=> b!159881 (= condMapEmpty!5729 (= (arr!2735 (_values!3216 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1337)) mapDefault!5729)))))

(declare-fun b!159882 () Bool)

(declare-fun res!75607 () Bool)

(assert (=> b!159882 (=> (not res!75607) (not e!104576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159882 (= res!75607 (validMask!0 (mask!7794 thiss!1248)))))

(declare-fun b!159883 () Bool)

(declare-fun res!75611 () Bool)

(assert (=> b!159883 (=> (not res!75611) (not e!104576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5781 (_ BitVec 32)) Bool)

(assert (=> b!159883 (= res!75611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5033 thiss!1248) (mask!7794 thiss!1248)))))

(declare-fun e!104577 () Bool)

(declare-fun array_inv!1749 (array!5781) Bool)

(declare-fun array_inv!1750 (array!5783) Bool)

(assert (=> b!159884 (= e!104577 (and tp!13246 tp_is_empty!3361 (array_inv!1749 (_keys!5033 thiss!1248)) (array_inv!1750 (_values!3216 thiss!1248)) e!104578))))

(declare-fun b!159885 () Bool)

(assert (=> b!159885 (= e!104581 tp_is_empty!3361)))

(declare-fun b!159886 () Bool)

(declare-fun res!75609 () Bool)

(assert (=> b!159886 (=> (not res!75609) (not e!104576))))

(assert (=> b!159886 (= res!75609 (and (= (size!3020 (_values!3216 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7794 thiss!1248))) (= (size!3019 (_keys!5033 thiss!1248)) (size!3020 (_values!3216 thiss!1248))) (bvsge (mask!7794 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2974 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2974 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5729 () Bool)

(declare-fun tp!13247 () Bool)

(assert (=> mapNonEmpty!5729 (= mapRes!5729 (and tp!13247 e!104580))))

(declare-fun mapValue!5729 () ValueCell!1337)

(declare-fun mapKey!5729 () (_ BitVec 32))

(declare-fun mapRest!5729 () (Array (_ BitVec 32) ValueCell!1337))

(assert (=> mapNonEmpty!5729 (= (arr!2735 (_values!3216 thiss!1248)) (store mapRest!5729 mapKey!5729 mapValue!5729))))

(declare-fun res!75608 () Bool)

(assert (=> start!16102 (=> (not res!75608) (not e!104576))))

(declare-fun valid!737 (LongMapFixedSize!1582) Bool)

(assert (=> start!16102 (= res!75608 (valid!737 thiss!1248))))

(assert (=> start!16102 e!104576))

(assert (=> start!16102 e!104577))

(assert (=> start!16102 true))

(declare-fun b!159879 () Bool)

(declare-fun res!75610 () Bool)

(assert (=> b!159879 (=> (not res!75610) (not e!104576))))

(assert (=> b!159879 (= res!75610 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16102 res!75608) b!159879))

(assert (= (and b!159879 res!75610) b!159880))

(assert (= (and b!159880 res!75606) b!159878))

(assert (= (and b!159878 res!75612) b!159882))

(assert (= (and b!159882 res!75607) b!159886))

(assert (= (and b!159886 res!75609) b!159883))

(assert (= (and b!159883 res!75611) b!159876))

(assert (= (and b!159881 condMapEmpty!5729) mapIsEmpty!5729))

(assert (= (and b!159881 (not condMapEmpty!5729)) mapNonEmpty!5729))

(assert (= (and mapNonEmpty!5729 ((_ is ValueCellFull!1337) mapValue!5729)) b!159877))

(assert (= (and b!159881 ((_ is ValueCellFull!1337) mapDefault!5729)) b!159885))

(assert (= b!159884 b!159881))

(assert (= start!16102 b!159884))

(declare-fun m!191437 () Bool)

(assert (=> b!159878 m!191437))

(assert (=> b!159878 m!191437))

(declare-fun m!191439 () Bool)

(assert (=> b!159878 m!191439))

(declare-fun m!191441 () Bool)

(assert (=> b!159876 m!191441))

(declare-fun m!191443 () Bool)

(assert (=> b!159880 m!191443))

(declare-fun m!191445 () Bool)

(assert (=> mapNonEmpty!5729 m!191445))

(declare-fun m!191447 () Bool)

(assert (=> start!16102 m!191447))

(declare-fun m!191449 () Bool)

(assert (=> b!159884 m!191449))

(declare-fun m!191451 () Bool)

(assert (=> b!159884 m!191451))

(declare-fun m!191453 () Bool)

(assert (=> b!159882 m!191453))

(declare-fun m!191455 () Bool)

(assert (=> b!159883 m!191455))

(check-sat (not mapNonEmpty!5729) (not b!159880) (not start!16102) (not b!159884) tp_is_empty!3361 (not b!159878) (not b!159882) (not b_next!3559) b_and!9947 (not b!159876) (not b!159883))
(check-sat b_and!9947 (not b_next!3559))
