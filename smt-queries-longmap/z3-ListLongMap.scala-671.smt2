; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16532 () Bool)

(assert start!16532)

(declare-fun b!164452 () Bool)

(declare-fun b_free!3837 () Bool)

(declare-fun b_next!3837 () Bool)

(assert (=> b!164452 (= b_free!3837 (not b_next!3837))))

(declare-fun tp!14111 () Bool)

(declare-fun b_and!10251 () Bool)

(assert (=> b!164452 (= tp!14111 b_and!10251)))

(declare-fun mapIsEmpty!6177 () Bool)

(declare-fun mapRes!6177 () Bool)

(assert (=> mapIsEmpty!6177 mapRes!6177))

(declare-fun b!164447 () Bool)

(declare-fun e!107895 () Bool)

(declare-fun e!107894 () Bool)

(assert (=> b!164447 (= e!107895 e!107894)))

(declare-fun res!77862 () Bool)

(assert (=> b!164447 (=> (not res!77862) (not e!107894))))

(declare-datatypes ((SeekEntryResult!416 0))(
  ( (MissingZero!416 (index!3832 (_ BitVec 32))) (Found!416 (index!3833 (_ BitVec 32))) (Intermediate!416 (undefined!1228 Bool) (index!3834 (_ BitVec 32)) (x!18236 (_ BitVec 32))) (Undefined!416) (MissingVacant!416 (index!3835 (_ BitVec 32))) )
))
(declare-fun lt!82890 () SeekEntryResult!416)

(get-info :version)

(assert (=> b!164447 (= res!77862 (and (not ((_ is Undefined!416) lt!82890)) (not ((_ is MissingVacant!416) lt!82890)) (not ((_ is MissingZero!416) lt!82890)) ((_ is Found!416) lt!82890)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4499 0))(
  ( (V!4500 (val!1864 Int)) )
))
(declare-datatypes ((ValueCell!1476 0))(
  ( (ValueCellFull!1476 (v!3729 V!4499)) (EmptyCell!1476) )
))
(declare-datatypes ((array!6375 0))(
  ( (array!6376 (arr!3023 (Array (_ BitVec 32) (_ BitVec 64))) (size!3311 (_ BitVec 32))) )
))
(declare-datatypes ((array!6377 0))(
  ( (array!6378 (arr!3024 (Array (_ BitVec 32) ValueCell!1476)) (size!3312 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1860 0))(
  ( (LongMapFixedSize!1861 (defaultEntry!3372 Int) (mask!8063 (_ BitVec 32)) (extraKeys!3113 (_ BitVec 32)) (zeroValue!3215 V!4499) (minValue!3215 V!4499) (_size!979 (_ BitVec 32)) (_keys!5197 array!6375) (_values!3355 array!6377) (_vacant!979 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1860)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6375 (_ BitVec 32)) SeekEntryResult!416)

(assert (=> b!164447 (= lt!82890 (seekEntryOrOpen!0 key!828 (_keys!5197 thiss!1248) (mask!8063 thiss!1248)))))

(declare-fun res!77860 () Bool)

(assert (=> start!16532 (=> (not res!77860) (not e!107895))))

(declare-fun valid!828 (LongMapFixedSize!1860) Bool)

(assert (=> start!16532 (= res!77860 (valid!828 thiss!1248))))

(assert (=> start!16532 e!107895))

(declare-fun e!107891 () Bool)

(assert (=> start!16532 e!107891))

(assert (=> start!16532 true))

(declare-fun b!164448 () Bool)

(declare-fun e!107896 () Bool)

(declare-fun tp_is_empty!3639 () Bool)

(assert (=> b!164448 (= e!107896 tp_is_empty!3639)))

(declare-fun b!164449 () Bool)

(assert (=> b!164449 (= e!107894 false)))

(declare-fun lt!82891 () Bool)

(declare-datatypes ((List!2008 0))(
  ( (Nil!2005) (Cons!2004 (h!2621 (_ BitVec 64)) (t!6810 List!2008)) )
))
(declare-fun arrayNoDuplicates!0 (array!6375 (_ BitVec 32) List!2008) Bool)

(assert (=> b!164449 (= lt!82891 (arrayNoDuplicates!0 (_keys!5197 thiss!1248) #b00000000000000000000000000000000 Nil!2005))))

(declare-fun b!164450 () Bool)

(declare-fun res!77863 () Bool)

(assert (=> b!164450 (=> (not res!77863) (not e!107894))))

(assert (=> b!164450 (= res!77863 (and (= (size!3312 (_values!3355 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8063 thiss!1248))) (= (size!3311 (_keys!5197 thiss!1248)) (size!3312 (_values!3355 thiss!1248))) (bvsge (mask!8063 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3113 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3113 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164451 () Bool)

(declare-fun e!107892 () Bool)

(assert (=> b!164451 (= e!107892 (and e!107896 mapRes!6177))))

(declare-fun condMapEmpty!6177 () Bool)

(declare-fun mapDefault!6177 () ValueCell!1476)

(assert (=> b!164451 (= condMapEmpty!6177 (= (arr!3024 (_values!3355 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1476)) mapDefault!6177)))))

(declare-fun array_inv!1937 (array!6375) Bool)

(declare-fun array_inv!1938 (array!6377) Bool)

(assert (=> b!164452 (= e!107891 (and tp!14111 tp_is_empty!3639 (array_inv!1937 (_keys!5197 thiss!1248)) (array_inv!1938 (_values!3355 thiss!1248)) e!107892))))

(declare-fun b!164453 () Bool)

(declare-fun res!77861 () Bool)

(assert (=> b!164453 (=> (not res!77861) (not e!107894))))

(declare-datatypes ((tuple2!3026 0))(
  ( (tuple2!3027 (_1!1524 (_ BitVec 64)) (_2!1524 V!4499)) )
))
(declare-datatypes ((List!2009 0))(
  ( (Nil!2006) (Cons!2005 (h!2622 tuple2!3026) (t!6811 List!2009)) )
))
(declare-datatypes ((ListLongMap!1981 0))(
  ( (ListLongMap!1982 (toList!1006 List!2009)) )
))
(declare-fun contains!1048 (ListLongMap!1981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!664 (array!6375 array!6377 (_ BitVec 32) (_ BitVec 32) V!4499 V!4499 (_ BitVec 32) Int) ListLongMap!1981)

(assert (=> b!164453 (= res!77861 (contains!1048 (getCurrentListMap!664 (_keys!5197 thiss!1248) (_values!3355 thiss!1248) (mask!8063 thiss!1248) (extraKeys!3113 thiss!1248) (zeroValue!3215 thiss!1248) (minValue!3215 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3372 thiss!1248)) key!828))))

(declare-fun b!164454 () Bool)

(declare-fun res!77864 () Bool)

(assert (=> b!164454 (=> (not res!77864) (not e!107895))))

(assert (=> b!164454 (= res!77864 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164455 () Bool)

(declare-fun res!77859 () Bool)

(assert (=> b!164455 (=> (not res!77859) (not e!107894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6375 (_ BitVec 32)) Bool)

(assert (=> b!164455 (= res!77859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5197 thiss!1248) (mask!8063 thiss!1248)))))

(declare-fun b!164456 () Bool)

(declare-fun e!107897 () Bool)

(assert (=> b!164456 (= e!107897 tp_is_empty!3639)))

(declare-fun b!164457 () Bool)

(declare-fun res!77865 () Bool)

(assert (=> b!164457 (=> (not res!77865) (not e!107894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164457 (= res!77865 (validMask!0 (mask!8063 thiss!1248)))))

(declare-fun mapNonEmpty!6177 () Bool)

(declare-fun tp!14112 () Bool)

(assert (=> mapNonEmpty!6177 (= mapRes!6177 (and tp!14112 e!107897))))

(declare-fun mapValue!6177 () ValueCell!1476)

(declare-fun mapRest!6177 () (Array (_ BitVec 32) ValueCell!1476))

(declare-fun mapKey!6177 () (_ BitVec 32))

(assert (=> mapNonEmpty!6177 (= (arr!3024 (_values!3355 thiss!1248)) (store mapRest!6177 mapKey!6177 mapValue!6177))))

(assert (= (and start!16532 res!77860) b!164454))

(assert (= (and b!164454 res!77864) b!164447))

(assert (= (and b!164447 res!77862) b!164453))

(assert (= (and b!164453 res!77861) b!164457))

(assert (= (and b!164457 res!77865) b!164450))

(assert (= (and b!164450 res!77863) b!164455))

(assert (= (and b!164455 res!77859) b!164449))

(assert (= (and b!164451 condMapEmpty!6177) mapIsEmpty!6177))

(assert (= (and b!164451 (not condMapEmpty!6177)) mapNonEmpty!6177))

(assert (= (and mapNonEmpty!6177 ((_ is ValueCellFull!1476) mapValue!6177)) b!164456))

(assert (= (and b!164451 ((_ is ValueCellFull!1476) mapDefault!6177)) b!164448))

(assert (= b!164452 b!164451))

(assert (= start!16532 b!164452))

(declare-fun m!194651 () Bool)

(assert (=> b!164447 m!194651))

(declare-fun m!194653 () Bool)

(assert (=> b!164455 m!194653))

(declare-fun m!194655 () Bool)

(assert (=> b!164453 m!194655))

(assert (=> b!164453 m!194655))

(declare-fun m!194657 () Bool)

(assert (=> b!164453 m!194657))

(declare-fun m!194659 () Bool)

(assert (=> b!164449 m!194659))

(declare-fun m!194661 () Bool)

(assert (=> mapNonEmpty!6177 m!194661))

(declare-fun m!194663 () Bool)

(assert (=> b!164457 m!194663))

(declare-fun m!194665 () Bool)

(assert (=> b!164452 m!194665))

(declare-fun m!194667 () Bool)

(assert (=> b!164452 m!194667))

(declare-fun m!194669 () Bool)

(assert (=> start!16532 m!194669))

(check-sat (not mapNonEmpty!6177) (not b_next!3837) (not b!164455) tp_is_empty!3639 b_and!10251 (not b!164447) (not b!164457) (not b!164452) (not b!164449) (not start!16532) (not b!164453))
(check-sat b_and!10251 (not b_next!3837))
