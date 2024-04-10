; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16142 () Bool)

(assert start!16142)

(declare-fun b!160753 () Bool)

(declare-fun b_free!3603 () Bool)

(declare-fun b_next!3603 () Bool)

(assert (=> b!160753 (= b_free!3603 (not b_next!3603))))

(declare-fun tp!13379 () Bool)

(declare-fun b_and!10017 () Bool)

(assert (=> b!160753 (= tp!13379 b_and!10017)))

(declare-fun b!160749 () Bool)

(declare-fun res!76164 () Bool)

(declare-fun e!105077 () Bool)

(assert (=> b!160749 (=> (not res!76164) (not e!105077))))

(declare-datatypes ((V!4187 0))(
  ( (V!4188 (val!1747 Int)) )
))
(declare-datatypes ((ValueCell!1359 0))(
  ( (ValueCellFull!1359 (v!3612 V!4187)) (EmptyCell!1359) )
))
(declare-datatypes ((array!5889 0))(
  ( (array!5890 (arr!2789 (Array (_ BitVec 32) (_ BitVec 64))) (size!3073 (_ BitVec 32))) )
))
(declare-datatypes ((array!5891 0))(
  ( (array!5892 (arr!2790 (Array (_ BitVec 32) ValueCell!1359)) (size!3074 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1626 0))(
  ( (LongMapFixedSize!1627 (defaultEntry!3255 Int) (mask!7831 (_ BitVec 32)) (extraKeys!2996 (_ BitVec 32)) (zeroValue!3098 V!4187) (minValue!3098 V!4187) (_size!862 (_ BitVec 32)) (_keys!5056 array!5889) (_values!3238 array!5891) (_vacant!862 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1626)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160749 (= res!76164 (validMask!0 (mask!7831 thiss!1248)))))

(declare-fun b!160750 () Bool)

(declare-fun res!76169 () Bool)

(assert (=> b!160750 (=> (not res!76169) (not e!105077))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160750 (= res!76169 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160751 () Bool)

(declare-fun e!105073 () Bool)

(declare-fun e!105076 () Bool)

(declare-fun mapRes!5795 () Bool)

(assert (=> b!160751 (= e!105073 (and e!105076 mapRes!5795))))

(declare-fun condMapEmpty!5795 () Bool)

(declare-fun mapDefault!5795 () ValueCell!1359)

(assert (=> b!160751 (= condMapEmpty!5795 (= (arr!2790 (_values!3238 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1359)) mapDefault!5795)))))

(declare-fun res!76163 () Bool)

(assert (=> start!16142 (=> (not res!76163) (not e!105077))))

(declare-fun valid!752 (LongMapFixedSize!1626) Bool)

(assert (=> start!16142 (= res!76163 (valid!752 thiss!1248))))

(assert (=> start!16142 e!105077))

(declare-fun e!105075 () Bool)

(assert (=> start!16142 e!105075))

(assert (=> start!16142 true))

(declare-fun b!160752 () Bool)

(declare-fun e!105078 () Bool)

(declare-fun tp_is_empty!3405 () Bool)

(assert (=> b!160752 (= e!105078 tp_is_empty!3405)))

(declare-fun array_inv!1781 (array!5889) Bool)

(declare-fun array_inv!1782 (array!5891) Bool)

(assert (=> b!160753 (= e!105075 (and tp!13379 tp_is_empty!3405 (array_inv!1781 (_keys!5056 thiss!1248)) (array_inv!1782 (_values!3238 thiss!1248)) e!105073))))

(declare-fun b!160754 () Bool)

(declare-fun res!76166 () Bool)

(assert (=> b!160754 (=> (not res!76166) (not e!105077))))

(assert (=> b!160754 (= res!76166 (and (= (size!3074 (_values!3238 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7831 thiss!1248))) (= (size!3073 (_keys!5056 thiss!1248)) (size!3074 (_values!3238 thiss!1248))) (bvsge (mask!7831 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2996 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2996 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5795 () Bool)

(declare-fun tp!13378 () Bool)

(assert (=> mapNonEmpty!5795 (= mapRes!5795 (and tp!13378 e!105078))))

(declare-fun mapKey!5795 () (_ BitVec 32))

(declare-fun mapRest!5795 () (Array (_ BitVec 32) ValueCell!1359))

(declare-fun mapValue!5795 () ValueCell!1359)

(assert (=> mapNonEmpty!5795 (= (arr!2790 (_values!3238 thiss!1248)) (store mapRest!5795 mapKey!5795 mapValue!5795))))

(declare-fun b!160755 () Bool)

(declare-fun res!76167 () Bool)

(assert (=> b!160755 (=> (not res!76167) (not e!105077))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!339 0))(
  ( (MissingZero!339 (index!3524 (_ BitVec 32))) (Found!339 (index!3525 (_ BitVec 32))) (Intermediate!339 (undefined!1151 Bool) (index!3526 (_ BitVec 32)) (x!17739 (_ BitVec 32))) (Undefined!339) (MissingVacant!339 (index!3527 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5889 (_ BitVec 32)) SeekEntryResult!339)

(assert (=> b!160755 (= res!76167 ((_ is Undefined!339) (seekEntryOrOpen!0 key!828 (_keys!5056 thiss!1248) (mask!7831 thiss!1248))))))

(declare-fun b!160756 () Bool)

(declare-fun res!76165 () Bool)

(assert (=> b!160756 (=> (not res!76165) (not e!105077))))

(declare-datatypes ((tuple2!2932 0))(
  ( (tuple2!2933 (_1!1477 (_ BitVec 64)) (_2!1477 V!4187)) )
))
(declare-datatypes ((List!1954 0))(
  ( (Nil!1951) (Cons!1950 (h!2563 tuple2!2932) (t!6756 List!1954)) )
))
(declare-datatypes ((ListLongMap!1919 0))(
  ( (ListLongMap!1920 (toList!975 List!1954)) )
))
(declare-fun contains!1011 (ListLongMap!1919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!639 (array!5889 array!5891 (_ BitVec 32) (_ BitVec 32) V!4187 V!4187 (_ BitVec 32) Int) ListLongMap!1919)

(assert (=> b!160756 (= res!76165 (not (contains!1011 (getCurrentListMap!639 (_keys!5056 thiss!1248) (_values!3238 thiss!1248) (mask!7831 thiss!1248) (extraKeys!2996 thiss!1248) (zeroValue!3098 thiss!1248) (minValue!3098 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3255 thiss!1248)) key!828)))))

(declare-fun b!160757 () Bool)

(assert (=> b!160757 (= e!105077 false)))

(declare-fun lt!82117 () Bool)

(declare-datatypes ((List!1955 0))(
  ( (Nil!1952) (Cons!1951 (h!2564 (_ BitVec 64)) (t!6757 List!1955)) )
))
(declare-fun arrayNoDuplicates!0 (array!5889 (_ BitVec 32) List!1955) Bool)

(assert (=> b!160757 (= lt!82117 (arrayNoDuplicates!0 (_keys!5056 thiss!1248) #b00000000000000000000000000000000 Nil!1952))))

(declare-fun b!160758 () Bool)

(assert (=> b!160758 (= e!105076 tp_is_empty!3405)))

(declare-fun b!160759 () Bool)

(declare-fun res!76168 () Bool)

(assert (=> b!160759 (=> (not res!76168) (not e!105077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5889 (_ BitVec 32)) Bool)

(assert (=> b!160759 (= res!76168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5056 thiss!1248) (mask!7831 thiss!1248)))))

(declare-fun mapIsEmpty!5795 () Bool)

(assert (=> mapIsEmpty!5795 mapRes!5795))

(assert (= (and start!16142 res!76163) b!160750))

(assert (= (and b!160750 res!76169) b!160755))

(assert (= (and b!160755 res!76167) b!160756))

(assert (= (and b!160756 res!76165) b!160749))

(assert (= (and b!160749 res!76164) b!160754))

(assert (= (and b!160754 res!76166) b!160759))

(assert (= (and b!160759 res!76168) b!160757))

(assert (= (and b!160751 condMapEmpty!5795) mapIsEmpty!5795))

(assert (= (and b!160751 (not condMapEmpty!5795)) mapNonEmpty!5795))

(assert (= (and mapNonEmpty!5795 ((_ is ValueCellFull!1359) mapValue!5795)) b!160752))

(assert (= (and b!160751 ((_ is ValueCellFull!1359) mapDefault!5795)) b!160758))

(assert (= b!160753 b!160751))

(assert (= start!16142 b!160753))

(declare-fun m!192497 () Bool)

(assert (=> mapNonEmpty!5795 m!192497))

(declare-fun m!192499 () Bool)

(assert (=> b!160755 m!192499))

(declare-fun m!192501 () Bool)

(assert (=> start!16142 m!192501))

(declare-fun m!192503 () Bool)

(assert (=> b!160759 m!192503))

(declare-fun m!192505 () Bool)

(assert (=> b!160756 m!192505))

(assert (=> b!160756 m!192505))

(declare-fun m!192507 () Bool)

(assert (=> b!160756 m!192507))

(declare-fun m!192509 () Bool)

(assert (=> b!160757 m!192509))

(declare-fun m!192511 () Bool)

(assert (=> b!160749 m!192511))

(declare-fun m!192513 () Bool)

(assert (=> b!160753 m!192513))

(declare-fun m!192515 () Bool)

(assert (=> b!160753 m!192515))

(check-sat (not b!160759) (not b!160756) b_and!10017 (not b!160755) (not b!160749) (not b_next!3603) (not b!160753) (not mapNonEmpty!5795) (not start!16142) tp_is_empty!3405 (not b!160757))
(check-sat b_and!10017 (not b_next!3603))
