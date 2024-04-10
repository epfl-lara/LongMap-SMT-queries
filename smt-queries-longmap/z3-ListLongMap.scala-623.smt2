; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16088 () Bool)

(assert start!16088)

(declare-fun b!159867 () Bool)

(declare-fun b_free!3549 () Bool)

(declare-fun b_next!3549 () Bool)

(assert (=> b!159867 (= b_free!3549 (not b_next!3549))))

(declare-fun tp!13217 () Bool)

(declare-fun b_and!9963 () Bool)

(assert (=> b!159867 (= tp!13217 b_and!9963)))

(declare-fun b!159858 () Bool)

(declare-fun e!104587 () Bool)

(declare-fun e!104590 () Bool)

(declare-fun mapRes!5714 () Bool)

(assert (=> b!159858 (= e!104587 (and e!104590 mapRes!5714))))

(declare-fun condMapEmpty!5714 () Bool)

(declare-datatypes ((V!4115 0))(
  ( (V!4116 (val!1720 Int)) )
))
(declare-datatypes ((ValueCell!1332 0))(
  ( (ValueCellFull!1332 (v!3585 V!4115)) (EmptyCell!1332) )
))
(declare-datatypes ((array!5781 0))(
  ( (array!5782 (arr!2735 (Array (_ BitVec 32) (_ BitVec 64))) (size!3019 (_ BitVec 32))) )
))
(declare-datatypes ((array!5783 0))(
  ( (array!5784 (arr!2736 (Array (_ BitVec 32) ValueCell!1332)) (size!3020 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1572 0))(
  ( (LongMapFixedSize!1573 (defaultEntry!3228 Int) (mask!7786 (_ BitVec 32)) (extraKeys!2969 (_ BitVec 32)) (zeroValue!3071 V!4115) (minValue!3071 V!4115) (_size!835 (_ BitVec 32)) (_keys!5029 array!5781) (_values!3211 array!5783) (_vacant!835 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1572)

(declare-fun mapDefault!5714 () ValueCell!1332)

(assert (=> b!159858 (= condMapEmpty!5714 (= (arr!2736 (_values!3211 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1332)) mapDefault!5714)))))

(declare-fun b!159860 () Bool)

(declare-fun tp_is_empty!3351 () Bool)

(assert (=> b!159860 (= e!104590 tp_is_empty!3351)))

(declare-fun b!159861 () Bool)

(declare-fun e!104591 () Bool)

(assert (=> b!159861 (= e!104591 tp_is_empty!3351)))

(declare-fun mapIsEmpty!5714 () Bool)

(assert (=> mapIsEmpty!5714 mapRes!5714))

(declare-fun b!159862 () Bool)

(declare-fun res!75598 () Bool)

(declare-fun e!104592 () Bool)

(assert (=> b!159862 (=> (not res!75598) (not e!104592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159862 (= res!75598 (validMask!0 (mask!7786 thiss!1248)))))

(declare-fun mapNonEmpty!5714 () Bool)

(declare-fun tp!13216 () Bool)

(assert (=> mapNonEmpty!5714 (= mapRes!5714 (and tp!13216 e!104591))))

(declare-fun mapKey!5714 () (_ BitVec 32))

(declare-fun mapValue!5714 () ValueCell!1332)

(declare-fun mapRest!5714 () (Array (_ BitVec 32) ValueCell!1332))

(assert (=> mapNonEmpty!5714 (= (arr!2736 (_values!3211 thiss!1248)) (store mapRest!5714 mapKey!5714 mapValue!5714))))

(declare-fun b!159863 () Bool)

(declare-fun res!75602 () Bool)

(assert (=> b!159863 (=> (not res!75602) (not e!104592))))

(assert (=> b!159863 (= res!75602 (and (= (size!3020 (_values!3211 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7786 thiss!1248))) (= (size!3019 (_keys!5029 thiss!1248)) (size!3020 (_values!3211 thiss!1248))) (bvsge (mask!7786 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2969 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2969 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159864 () Bool)

(declare-fun res!75601 () Bool)

(assert (=> b!159864 (=> (not res!75601) (not e!104592))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159864 (= res!75601 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159865 () Bool)

(declare-fun res!75600 () Bool)

(assert (=> b!159865 (=> (not res!75600) (not e!104592))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!318 0))(
  ( (MissingZero!318 (index!3440 (_ BitVec 32))) (Found!318 (index!3441 (_ BitVec 32))) (Intermediate!318 (undefined!1130 Bool) (index!3442 (_ BitVec 32)) (x!17646 (_ BitVec 32))) (Undefined!318) (MissingVacant!318 (index!3443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5781 (_ BitVec 32)) SeekEntryResult!318)

(assert (=> b!159865 (= res!75600 ((_ is Undefined!318) (seekEntryOrOpen!0 key!828 (_keys!5029 thiss!1248) (mask!7786 thiss!1248))))))

(declare-fun res!75599 () Bool)

(assert (=> start!16088 (=> (not res!75599) (not e!104592))))

(declare-fun valid!733 (LongMapFixedSize!1572) Bool)

(assert (=> start!16088 (= res!75599 (valid!733 thiss!1248))))

(assert (=> start!16088 e!104592))

(declare-fun e!104588 () Bool)

(assert (=> start!16088 e!104588))

(assert (=> start!16088 true))

(declare-fun b!159859 () Bool)

(assert (=> b!159859 (= e!104592 false)))

(declare-fun lt!82036 () Bool)

(declare-datatypes ((List!1921 0))(
  ( (Nil!1918) (Cons!1917 (h!2530 (_ BitVec 64)) (t!6723 List!1921)) )
))
(declare-fun arrayNoDuplicates!0 (array!5781 (_ BitVec 32) List!1921) Bool)

(assert (=> b!159859 (= lt!82036 (arrayNoDuplicates!0 (_keys!5029 thiss!1248) #b00000000000000000000000000000000 Nil!1918))))

(declare-fun b!159866 () Bool)

(declare-fun res!75597 () Bool)

(assert (=> b!159866 (=> (not res!75597) (not e!104592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5781 (_ BitVec 32)) Bool)

(assert (=> b!159866 (= res!75597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5029 thiss!1248) (mask!7786 thiss!1248)))))

(declare-fun array_inv!1739 (array!5781) Bool)

(declare-fun array_inv!1740 (array!5783) Bool)

(assert (=> b!159867 (= e!104588 (and tp!13217 tp_is_empty!3351 (array_inv!1739 (_keys!5029 thiss!1248)) (array_inv!1740 (_values!3211 thiss!1248)) e!104587))))

(declare-fun b!159868 () Bool)

(declare-fun res!75596 () Bool)

(assert (=> b!159868 (=> (not res!75596) (not e!104592))))

(declare-datatypes ((tuple2!2900 0))(
  ( (tuple2!2901 (_1!1461 (_ BitVec 64)) (_2!1461 V!4115)) )
))
(declare-datatypes ((List!1922 0))(
  ( (Nil!1919) (Cons!1918 (h!2531 tuple2!2900) (t!6724 List!1922)) )
))
(declare-datatypes ((ListLongMap!1887 0))(
  ( (ListLongMap!1888 (toList!959 List!1922)) )
))
(declare-fun contains!995 (ListLongMap!1887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!623 (array!5781 array!5783 (_ BitVec 32) (_ BitVec 32) V!4115 V!4115 (_ BitVec 32) Int) ListLongMap!1887)

(assert (=> b!159868 (= res!75596 (contains!995 (getCurrentListMap!623 (_keys!5029 thiss!1248) (_values!3211 thiss!1248) (mask!7786 thiss!1248) (extraKeys!2969 thiss!1248) (zeroValue!3071 thiss!1248) (minValue!3071 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3228 thiss!1248)) key!828))))

(assert (= (and start!16088 res!75599) b!159864))

(assert (= (and b!159864 res!75601) b!159865))

(assert (= (and b!159865 res!75600) b!159868))

(assert (= (and b!159868 res!75596) b!159862))

(assert (= (and b!159862 res!75598) b!159863))

(assert (= (and b!159863 res!75602) b!159866))

(assert (= (and b!159866 res!75597) b!159859))

(assert (= (and b!159858 condMapEmpty!5714) mapIsEmpty!5714))

(assert (= (and b!159858 (not condMapEmpty!5714)) mapNonEmpty!5714))

(assert (= (and mapNonEmpty!5714 ((_ is ValueCellFull!1332) mapValue!5714)) b!159861))

(assert (= (and b!159858 ((_ is ValueCellFull!1332) mapDefault!5714)) b!159860))

(assert (= b!159867 b!159858))

(assert (= start!16088 b!159867))

(declare-fun m!191957 () Bool)

(assert (=> mapNonEmpty!5714 m!191957))

(declare-fun m!191959 () Bool)

(assert (=> b!159862 m!191959))

(declare-fun m!191961 () Bool)

(assert (=> start!16088 m!191961))

(declare-fun m!191963 () Bool)

(assert (=> b!159859 m!191963))

(declare-fun m!191965 () Bool)

(assert (=> b!159865 m!191965))

(declare-fun m!191967 () Bool)

(assert (=> b!159868 m!191967))

(assert (=> b!159868 m!191967))

(declare-fun m!191969 () Bool)

(assert (=> b!159868 m!191969))

(declare-fun m!191971 () Bool)

(assert (=> b!159866 m!191971))

(declare-fun m!191973 () Bool)

(assert (=> b!159867 m!191973))

(declare-fun m!191975 () Bool)

(assert (=> b!159867 m!191975))

(check-sat (not b!159867) (not mapNonEmpty!5714) (not b!159862) tp_is_empty!3351 (not b_next!3549) (not b!159859) (not b!159866) (not b!159865) b_and!9963 (not b!159868) (not start!16088))
(check-sat b_and!9963 (not b_next!3549))
