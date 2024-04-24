; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17694 () Bool)

(assert start!17694)

(declare-fun b!176871 () Bool)

(declare-fun b_free!4363 () Bool)

(declare-fun b_next!4363 () Bool)

(assert (=> b!176871 (= b_free!4363 (not b_next!4363))))

(declare-fun tp!15785 () Bool)

(declare-fun b_and!10875 () Bool)

(assert (=> b!176871 (= tp!15785 b_and!10875)))

(declare-fun b!176870 () Bool)

(declare-fun e!116660 () Bool)

(declare-fun tp_is_empty!4135 () Bool)

(assert (=> b!176870 (= e!116660 tp_is_empty!4135)))

(declare-fun e!116657 () Bool)

(declare-fun e!116655 () Bool)

(declare-datatypes ((V!5161 0))(
  ( (V!5162 (val!2112 Int)) )
))
(declare-datatypes ((ValueCell!1724 0))(
  ( (ValueCellFull!1724 (v!3992 V!5161)) (EmptyCell!1724) )
))
(declare-datatypes ((array!7405 0))(
  ( (array!7406 (arr!3512 (Array (_ BitVec 32) (_ BitVec 64))) (size!3816 (_ BitVec 32))) )
))
(declare-datatypes ((array!7407 0))(
  ( (array!7408 (arr!3513 (Array (_ BitVec 32) ValueCell!1724)) (size!3817 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2356 0))(
  ( (LongMapFixedSize!2357 (defaultEntry!3640 Int) (mask!8567 (_ BitVec 32)) (extraKeys!3377 (_ BitVec 32)) (zeroValue!3481 V!5161) (minValue!3481 V!5161) (_size!1227 (_ BitVec 32)) (_keys!5505 array!7405) (_values!3623 array!7407) (_vacant!1227 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2356)

(declare-fun array_inv!2269 (array!7405) Bool)

(declare-fun array_inv!2270 (array!7407) Bool)

(assert (=> b!176871 (= e!116657 (and tp!15785 tp_is_empty!4135 (array_inv!2269 (_keys!5505 thiss!1248)) (array_inv!2270 (_values!3623 thiss!1248)) e!116655))))

(declare-fun b!176873 () Bool)

(declare-fun e!116658 () Bool)

(assert (=> b!176873 (= e!116658 tp_is_empty!4135)))

(declare-fun b!176874 () Bool)

(declare-fun res!83817 () Bool)

(declare-fun e!116659 () Bool)

(assert (=> b!176874 (=> (not res!83817) (not e!116659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7405 (_ BitVec 32)) Bool)

(assert (=> b!176874 (= res!83817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5505 thiss!1248) (mask!8567 thiss!1248)))))

(declare-fun mapIsEmpty!7062 () Bool)

(declare-fun mapRes!7062 () Bool)

(assert (=> mapIsEmpty!7062 mapRes!7062))

(declare-fun b!176875 () Bool)

(declare-fun res!83822 () Bool)

(assert (=> b!176875 (=> (not res!83822) (not e!116659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176875 (= res!83822 (validMask!0 (mask!8567 thiss!1248)))))

(declare-fun res!83816 () Bool)

(assert (=> start!17694 (=> (not res!83816) (not e!116659))))

(declare-fun valid!1009 (LongMapFixedSize!2356) Bool)

(assert (=> start!17694 (= res!83816 (valid!1009 thiss!1248))))

(assert (=> start!17694 e!116659))

(assert (=> start!17694 e!116657))

(assert (=> start!17694 true))

(declare-fun b!176872 () Bool)

(assert (=> b!176872 (= e!116659 false)))

(declare-fun lt!87533 () Bool)

(declare-datatypes ((List!2218 0))(
  ( (Nil!2215) (Cons!2214 (h!2835 (_ BitVec 64)) (t!7038 List!2218)) )
))
(declare-fun arrayNoDuplicates!0 (array!7405 (_ BitVec 32) List!2218) Bool)

(assert (=> b!176872 (= lt!87533 (arrayNoDuplicates!0 (_keys!5505 thiss!1248) #b00000000000000000000000000000000 Nil!2215))))

(declare-fun b!176876 () Bool)

(assert (=> b!176876 (= e!116655 (and e!116658 mapRes!7062))))

(declare-fun condMapEmpty!7062 () Bool)

(declare-fun mapDefault!7062 () ValueCell!1724)

(assert (=> b!176876 (= condMapEmpty!7062 (= (arr!3513 (_values!3623 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1724)) mapDefault!7062)))))

(declare-fun b!176877 () Bool)

(declare-fun res!83818 () Bool)

(assert (=> b!176877 (=> (not res!83818) (not e!116659))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3242 0))(
  ( (tuple2!3243 (_1!1632 (_ BitVec 64)) (_2!1632 V!5161)) )
))
(declare-datatypes ((List!2219 0))(
  ( (Nil!2216) (Cons!2215 (h!2836 tuple2!3242) (t!7039 List!2219)) )
))
(declare-datatypes ((ListLongMap!2175 0))(
  ( (ListLongMap!2176 (toList!1103 List!2219)) )
))
(declare-fun contains!1179 (ListLongMap!2175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!758 (array!7405 array!7407 (_ BitVec 32) (_ BitVec 32) V!5161 V!5161 (_ BitVec 32) Int) ListLongMap!2175)

(assert (=> b!176877 (= res!83818 (contains!1179 (getCurrentListMap!758 (_keys!5505 thiss!1248) (_values!3623 thiss!1248) (mask!8567 thiss!1248) (extraKeys!3377 thiss!1248) (zeroValue!3481 thiss!1248) (minValue!3481 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3640 thiss!1248)) key!828))))

(declare-fun b!176878 () Bool)

(declare-fun res!83820 () Bool)

(assert (=> b!176878 (=> (not res!83820) (not e!116659))))

(assert (=> b!176878 (= res!83820 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7062 () Bool)

(declare-fun tp!15786 () Bool)

(assert (=> mapNonEmpty!7062 (= mapRes!7062 (and tp!15786 e!116660))))

(declare-fun mapKey!7062 () (_ BitVec 32))

(declare-fun mapRest!7062 () (Array (_ BitVec 32) ValueCell!1724))

(declare-fun mapValue!7062 () ValueCell!1724)

(assert (=> mapNonEmpty!7062 (= (arr!3513 (_values!3623 thiss!1248)) (store mapRest!7062 mapKey!7062 mapValue!7062))))

(declare-fun b!176879 () Bool)

(declare-fun res!83821 () Bool)

(assert (=> b!176879 (=> (not res!83821) (not e!116659))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!555 0))(
  ( (MissingZero!555 (index!4388 (_ BitVec 32))) (Found!555 (index!4389 (_ BitVec 32))) (Intermediate!555 (undefined!1367 Bool) (index!4390 (_ BitVec 32)) (x!19401 (_ BitVec 32))) (Undefined!555) (MissingVacant!555 (index!4391 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7405 (_ BitVec 32)) SeekEntryResult!555)

(assert (=> b!176879 (= res!83821 ((_ is Undefined!555) (seekEntryOrOpen!0 key!828 (_keys!5505 thiss!1248) (mask!8567 thiss!1248))))))

(declare-fun b!176880 () Bool)

(declare-fun res!83819 () Bool)

(assert (=> b!176880 (=> (not res!83819) (not e!116659))))

(assert (=> b!176880 (= res!83819 (and (= (size!3817 (_values!3623 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8567 thiss!1248))) (= (size!3816 (_keys!5505 thiss!1248)) (size!3817 (_values!3623 thiss!1248))) (bvsge (mask!8567 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3377 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3377 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!17694 res!83816) b!176878))

(assert (= (and b!176878 res!83820) b!176879))

(assert (= (and b!176879 res!83821) b!176877))

(assert (= (and b!176877 res!83818) b!176875))

(assert (= (and b!176875 res!83822) b!176880))

(assert (= (and b!176880 res!83819) b!176874))

(assert (= (and b!176874 res!83817) b!176872))

(assert (= (and b!176876 condMapEmpty!7062) mapIsEmpty!7062))

(assert (= (and b!176876 (not condMapEmpty!7062)) mapNonEmpty!7062))

(assert (= (and mapNonEmpty!7062 ((_ is ValueCellFull!1724) mapValue!7062)) b!176870))

(assert (= (and b!176876 ((_ is ValueCellFull!1724) mapDefault!7062)) b!176873))

(assert (= b!176871 b!176876))

(assert (= start!17694 b!176871))

(declare-fun m!205703 () Bool)

(assert (=> start!17694 m!205703))

(declare-fun m!205705 () Bool)

(assert (=> mapNonEmpty!7062 m!205705))

(declare-fun m!205707 () Bool)

(assert (=> b!176875 m!205707))

(declare-fun m!205709 () Bool)

(assert (=> b!176877 m!205709))

(assert (=> b!176877 m!205709))

(declare-fun m!205711 () Bool)

(assert (=> b!176877 m!205711))

(declare-fun m!205713 () Bool)

(assert (=> b!176871 m!205713))

(declare-fun m!205715 () Bool)

(assert (=> b!176871 m!205715))

(declare-fun m!205717 () Bool)

(assert (=> b!176872 m!205717))

(declare-fun m!205719 () Bool)

(assert (=> b!176879 m!205719))

(declare-fun m!205721 () Bool)

(assert (=> b!176874 m!205721))

(check-sat (not b!176879) (not b!176874) (not start!17694) b_and!10875 (not b!176877) (not b!176872) (not mapNonEmpty!7062) tp_is_empty!4135 (not b_next!4363) (not b!176871) (not b!176875))
(check-sat b_and!10875 (not b_next!4363))
