; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16618 () Bool)

(assert start!16618)

(declare-fun b!165852 () Bool)

(declare-fun b_free!3919 () Bool)

(declare-fun b_next!3919 () Bool)

(assert (=> b!165852 (= b_free!3919 (not b_next!3919))))

(declare-fun tp!14357 () Bool)

(declare-fun b_and!10347 () Bool)

(assert (=> b!165852 (= tp!14357 b_and!10347)))

(declare-fun b!165847 () Bool)

(declare-fun res!78741 () Bool)

(declare-fun e!108780 () Bool)

(assert (=> b!165847 (=> (not res!78741) (not e!108780))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165847 (= res!78741 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6300 () Bool)

(declare-fun mapRes!6300 () Bool)

(declare-fun tp!14358 () Bool)

(declare-fun e!108782 () Bool)

(assert (=> mapNonEmpty!6300 (= mapRes!6300 (and tp!14358 e!108782))))

(declare-datatypes ((V!4609 0))(
  ( (V!4610 (val!1905 Int)) )
))
(declare-datatypes ((ValueCell!1517 0))(
  ( (ValueCellFull!1517 (v!3771 V!4609)) (EmptyCell!1517) )
))
(declare-fun mapValue!6300 () ValueCell!1517)

(declare-fun mapRest!6300 () (Array (_ BitVec 32) ValueCell!1517))

(declare-datatypes ((array!6525 0))(
  ( (array!6526 (arr!3098 (Array (_ BitVec 32) (_ BitVec 64))) (size!3386 (_ BitVec 32))) )
))
(declare-datatypes ((array!6527 0))(
  ( (array!6528 (arr!3099 (Array (_ BitVec 32) ValueCell!1517)) (size!3387 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1942 0))(
  ( (LongMapFixedSize!1943 (defaultEntry!3413 Int) (mask!8132 (_ BitVec 32)) (extraKeys!3154 (_ BitVec 32)) (zeroValue!3256 V!4609) (minValue!3256 V!4609) (_size!1020 (_ BitVec 32)) (_keys!5238 array!6525) (_values!3396 array!6527) (_vacant!1020 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1942)

(declare-fun mapKey!6300 () (_ BitVec 32))

(assert (=> mapNonEmpty!6300 (= (arr!3099 (_values!3396 thiss!1248)) (store mapRest!6300 mapKey!6300 mapValue!6300))))

(declare-fun b!165848 () Bool)

(declare-fun e!108776 () Bool)

(declare-fun tp_is_empty!3721 () Bool)

(assert (=> b!165848 (= e!108776 tp_is_empty!3721)))

(declare-fun b!165849 () Bool)

(declare-fun e!108777 () Bool)

(assert (=> b!165849 (= e!108777 (and e!108776 mapRes!6300))))

(declare-fun condMapEmpty!6300 () Bool)

(declare-fun mapDefault!6300 () ValueCell!1517)

(assert (=> b!165849 (= condMapEmpty!6300 (= (arr!3099 (_values!3396 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1517)) mapDefault!6300)))))

(declare-fun mapIsEmpty!6300 () Bool)

(assert (=> mapIsEmpty!6300 mapRes!6300))

(declare-fun res!78745 () Bool)

(assert (=> start!16618 (=> (not res!78745) (not e!108780))))

(declare-fun valid!871 (LongMapFixedSize!1942) Bool)

(assert (=> start!16618 (= res!78745 (valid!871 thiss!1248))))

(assert (=> start!16618 e!108780))

(declare-fun e!108779 () Bool)

(assert (=> start!16618 e!108779))

(assert (=> start!16618 true))

(declare-fun b!165850 () Bool)

(declare-fun e!108781 () Bool)

(assert (=> b!165850 (= e!108781 false)))

(declare-fun lt!83195 () Bool)

(declare-datatypes ((List!2057 0))(
  ( (Nil!2054) (Cons!2053 (h!2670 (_ BitVec 64)) (t!6851 List!2057)) )
))
(declare-fun arrayNoDuplicates!0 (array!6525 (_ BitVec 32) List!2057) Bool)

(assert (=> b!165850 (= lt!83195 (arrayNoDuplicates!0 (_keys!5238 thiss!1248) #b00000000000000000000000000000000 Nil!2054))))

(declare-fun b!165851 () Bool)

(assert (=> b!165851 (= e!108782 tp_is_empty!3721)))

(declare-fun array_inv!1987 (array!6525) Bool)

(declare-fun array_inv!1988 (array!6527) Bool)

(assert (=> b!165852 (= e!108779 (and tp!14357 tp_is_empty!3721 (array_inv!1987 (_keys!5238 thiss!1248)) (array_inv!1988 (_values!3396 thiss!1248)) e!108777))))

(declare-fun b!165853 () Bool)

(declare-fun res!78743 () Bool)

(assert (=> b!165853 (=> (not res!78743) (not e!108781))))

(declare-datatypes ((tuple2!3038 0))(
  ( (tuple2!3039 (_1!1530 (_ BitVec 64)) (_2!1530 V!4609)) )
))
(declare-datatypes ((List!2058 0))(
  ( (Nil!2055) (Cons!2054 (h!2671 tuple2!3038) (t!6852 List!2058)) )
))
(declare-datatypes ((ListLongMap!1999 0))(
  ( (ListLongMap!2000 (toList!1015 List!2058)) )
))
(declare-fun contains!1067 (ListLongMap!1999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!677 (array!6525 array!6527 (_ BitVec 32) (_ BitVec 32) V!4609 V!4609 (_ BitVec 32) Int) ListLongMap!1999)

(assert (=> b!165853 (= res!78743 (not (contains!1067 (getCurrentListMap!677 (_keys!5238 thiss!1248) (_values!3396 thiss!1248) (mask!8132 thiss!1248) (extraKeys!3154 thiss!1248) (zeroValue!3256 thiss!1248) (minValue!3256 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3413 thiss!1248)) key!828)))))

(declare-fun b!165854 () Bool)

(assert (=> b!165854 (= e!108780 e!108781)))

(declare-fun res!78742 () Bool)

(assert (=> b!165854 (=> (not res!78742) (not e!108781))))

(declare-datatypes ((SeekEntryResult!439 0))(
  ( (MissingZero!439 (index!3924 (_ BitVec 32))) (Found!439 (index!3925 (_ BitVec 32))) (Intermediate!439 (undefined!1251 Bool) (index!3926 (_ BitVec 32)) (x!18371 (_ BitVec 32))) (Undefined!439) (MissingVacant!439 (index!3927 (_ BitVec 32))) )
))
(declare-fun lt!83196 () SeekEntryResult!439)

(get-info :version)

(assert (=> b!165854 (= res!78742 (and (not ((_ is Undefined!439) lt!83196)) (not ((_ is MissingVacant!439) lt!83196)) (not ((_ is MissingZero!439) lt!83196)) ((_ is Found!439) lt!83196)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6525 (_ BitVec 32)) SeekEntryResult!439)

(assert (=> b!165854 (= lt!83196 (seekEntryOrOpen!0 key!828 (_keys!5238 thiss!1248) (mask!8132 thiss!1248)))))

(declare-fun b!165855 () Bool)

(declare-fun res!78747 () Bool)

(assert (=> b!165855 (=> (not res!78747) (not e!108781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165855 (= res!78747 (validMask!0 (mask!8132 thiss!1248)))))

(declare-fun b!165856 () Bool)

(declare-fun res!78744 () Bool)

(assert (=> b!165856 (=> (not res!78744) (not e!108781))))

(assert (=> b!165856 (= res!78744 (and (= (size!3387 (_values!3396 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8132 thiss!1248))) (= (size!3386 (_keys!5238 thiss!1248)) (size!3387 (_values!3396 thiss!1248))) (bvsge (mask!8132 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3154 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3154 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165857 () Bool)

(declare-fun res!78746 () Bool)

(assert (=> b!165857 (=> (not res!78746) (not e!108781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6525 (_ BitVec 32)) Bool)

(assert (=> b!165857 (= res!78746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5238 thiss!1248) (mask!8132 thiss!1248)))))

(assert (= (and start!16618 res!78745) b!165847))

(assert (= (and b!165847 res!78741) b!165854))

(assert (= (and b!165854 res!78742) b!165853))

(assert (= (and b!165853 res!78743) b!165855))

(assert (= (and b!165855 res!78747) b!165856))

(assert (= (and b!165856 res!78744) b!165857))

(assert (= (and b!165857 res!78746) b!165850))

(assert (= (and b!165849 condMapEmpty!6300) mapIsEmpty!6300))

(assert (= (and b!165849 (not condMapEmpty!6300)) mapNonEmpty!6300))

(assert (= (and mapNonEmpty!6300 ((_ is ValueCellFull!1517) mapValue!6300)) b!165851))

(assert (= (and b!165849 ((_ is ValueCellFull!1517) mapDefault!6300)) b!165848))

(assert (= b!165852 b!165849))

(assert (= start!16618 b!165852))

(declare-fun m!195653 () Bool)

(assert (=> start!16618 m!195653))

(declare-fun m!195655 () Bool)

(assert (=> b!165852 m!195655))

(declare-fun m!195657 () Bool)

(assert (=> b!165852 m!195657))

(declare-fun m!195659 () Bool)

(assert (=> b!165857 m!195659))

(declare-fun m!195661 () Bool)

(assert (=> b!165853 m!195661))

(assert (=> b!165853 m!195661))

(declare-fun m!195663 () Bool)

(assert (=> b!165853 m!195663))

(declare-fun m!195665 () Bool)

(assert (=> b!165850 m!195665))

(declare-fun m!195667 () Bool)

(assert (=> mapNonEmpty!6300 m!195667))

(declare-fun m!195669 () Bool)

(assert (=> b!165855 m!195669))

(declare-fun m!195671 () Bool)

(assert (=> b!165854 m!195671))

(check-sat (not b!165852) tp_is_empty!3721 (not b_next!3919) (not b!165850) (not b!165855) b_and!10347 (not b!165857) (not b!165854) (not b!165853) (not start!16618) (not mapNonEmpty!6300))
(check-sat b_and!10347 (not b_next!3919))
