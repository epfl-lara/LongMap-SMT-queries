; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16538 () Bool)

(assert start!16538)

(declare-fun b!164547 () Bool)

(declare-fun b_free!3843 () Bool)

(declare-fun b_next!3843 () Bool)

(assert (=> b!164547 (= b_free!3843 (not b_next!3843))))

(declare-fun tp!14130 () Bool)

(declare-fun b_and!10257 () Bool)

(assert (=> b!164547 (= tp!14130 b_and!10257)))

(declare-fun b!164546 () Bool)

(declare-fun res!77922 () Bool)

(declare-fun e!107955 () Bool)

(assert (=> b!164546 (=> (not res!77922) (not e!107955))))

(declare-datatypes ((V!4507 0))(
  ( (V!4508 (val!1867 Int)) )
))
(declare-datatypes ((ValueCell!1479 0))(
  ( (ValueCellFull!1479 (v!3732 V!4507)) (EmptyCell!1479) )
))
(declare-datatypes ((array!6387 0))(
  ( (array!6388 (arr!3029 (Array (_ BitVec 32) (_ BitVec 64))) (size!3317 (_ BitVec 32))) )
))
(declare-datatypes ((array!6389 0))(
  ( (array!6390 (arr!3030 (Array (_ BitVec 32) ValueCell!1479)) (size!3318 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1866 0))(
  ( (LongMapFixedSize!1867 (defaultEntry!3375 Int) (mask!8068 (_ BitVec 32)) (extraKeys!3116 (_ BitVec 32)) (zeroValue!3218 V!4507) (minValue!3218 V!4507) (_size!982 (_ BitVec 32)) (_keys!5200 array!6387) (_values!3358 array!6389) (_vacant!982 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1866)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164546 (= res!77922 (validMask!0 (mask!8068 thiss!1248)))))

(declare-fun mapNonEmpty!6186 () Bool)

(declare-fun mapRes!6186 () Bool)

(declare-fun tp!14129 () Bool)

(declare-fun e!107959 () Bool)

(assert (=> mapNonEmpty!6186 (= mapRes!6186 (and tp!14129 e!107959))))

(declare-fun mapRest!6186 () (Array (_ BitVec 32) ValueCell!1479))

(declare-fun mapKey!6186 () (_ BitVec 32))

(declare-fun mapValue!6186 () ValueCell!1479)

(assert (=> mapNonEmpty!6186 (= (arr!3030 (_values!3358 thiss!1248)) (store mapRest!6186 mapKey!6186 mapValue!6186))))

(declare-fun e!107956 () Bool)

(declare-fun tp_is_empty!3645 () Bool)

(declare-fun e!107954 () Bool)

(declare-fun array_inv!1943 (array!6387) Bool)

(declare-fun array_inv!1944 (array!6389) Bool)

(assert (=> b!164547 (= e!107956 (and tp!14130 tp_is_empty!3645 (array_inv!1943 (_keys!5200 thiss!1248)) (array_inv!1944 (_values!3358 thiss!1248)) e!107954))))

(declare-fun mapIsEmpty!6186 () Bool)

(assert (=> mapIsEmpty!6186 mapRes!6186))

(declare-fun b!164548 () Bool)

(declare-fun res!77928 () Bool)

(declare-fun e!107958 () Bool)

(assert (=> b!164548 (=> (not res!77928) (not e!107958))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164548 (= res!77928 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164549 () Bool)

(declare-fun res!77927 () Bool)

(assert (=> b!164549 (=> (not res!77927) (not e!107955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6387 (_ BitVec 32)) Bool)

(assert (=> b!164549 (= res!77927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5200 thiss!1248) (mask!8068 thiss!1248)))))

(declare-fun b!164550 () Bool)

(assert (=> b!164550 (= e!107959 tp_is_empty!3645)))

(declare-fun b!164551 () Bool)

(declare-fun res!77923 () Bool)

(assert (=> b!164551 (=> (not res!77923) (not e!107955))))

(declare-datatypes ((tuple2!3032 0))(
  ( (tuple2!3033 (_1!1527 (_ BitVec 64)) (_2!1527 V!4507)) )
))
(declare-datatypes ((List!2014 0))(
  ( (Nil!2011) (Cons!2010 (h!2627 tuple2!3032) (t!6816 List!2014)) )
))
(declare-datatypes ((ListLongMap!1987 0))(
  ( (ListLongMap!1988 (toList!1009 List!2014)) )
))
(declare-fun contains!1051 (ListLongMap!1987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!667 (array!6387 array!6389 (_ BitVec 32) (_ BitVec 32) V!4507 V!4507 (_ BitVec 32) Int) ListLongMap!1987)

(assert (=> b!164551 (= res!77923 (contains!1051 (getCurrentListMap!667 (_keys!5200 thiss!1248) (_values!3358 thiss!1248) (mask!8068 thiss!1248) (extraKeys!3116 thiss!1248) (zeroValue!3218 thiss!1248) (minValue!3218 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3375 thiss!1248)) key!828))))

(declare-fun b!164552 () Bool)

(assert (=> b!164552 (= e!107958 e!107955)))

(declare-fun res!77924 () Bool)

(assert (=> b!164552 (=> (not res!77924) (not e!107955))))

(declare-datatypes ((SeekEntryResult!419 0))(
  ( (MissingZero!419 (index!3844 (_ BitVec 32))) (Found!419 (index!3845 (_ BitVec 32))) (Intermediate!419 (undefined!1231 Bool) (index!3846 (_ BitVec 32)) (x!18247 (_ BitVec 32))) (Undefined!419) (MissingVacant!419 (index!3847 (_ BitVec 32))) )
))
(declare-fun lt!82909 () SeekEntryResult!419)

(get-info :version)

(assert (=> b!164552 (= res!77924 (and (not ((_ is Undefined!419) lt!82909)) (not ((_ is MissingVacant!419) lt!82909)) (not ((_ is MissingZero!419) lt!82909)) ((_ is Found!419) lt!82909)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6387 (_ BitVec 32)) SeekEntryResult!419)

(assert (=> b!164552 (= lt!82909 (seekEntryOrOpen!0 key!828 (_keys!5200 thiss!1248) (mask!8068 thiss!1248)))))

(declare-fun b!164554 () Bool)

(declare-fun e!107960 () Bool)

(assert (=> b!164554 (= e!107960 tp_is_empty!3645)))

(declare-fun b!164555 () Bool)

(assert (=> b!164555 (= e!107954 (and e!107960 mapRes!6186))))

(declare-fun condMapEmpty!6186 () Bool)

(declare-fun mapDefault!6186 () ValueCell!1479)

(assert (=> b!164555 (= condMapEmpty!6186 (= (arr!3030 (_values!3358 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1479)) mapDefault!6186)))))

(declare-fun b!164556 () Bool)

(declare-fun res!77926 () Bool)

(assert (=> b!164556 (=> (not res!77926) (not e!107955))))

(assert (=> b!164556 (= res!77926 (and (= (size!3318 (_values!3358 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8068 thiss!1248))) (= (size!3317 (_keys!5200 thiss!1248)) (size!3318 (_values!3358 thiss!1248))) (bvsge (mask!8068 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3116 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3116 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!77925 () Bool)

(assert (=> start!16538 (=> (not res!77925) (not e!107958))))

(declare-fun valid!831 (LongMapFixedSize!1866) Bool)

(assert (=> start!16538 (= res!77925 (valid!831 thiss!1248))))

(assert (=> start!16538 e!107958))

(assert (=> start!16538 e!107956))

(assert (=> start!16538 true))

(declare-fun b!164553 () Bool)

(assert (=> b!164553 (= e!107955 false)))

(declare-fun lt!82908 () Bool)

(declare-datatypes ((List!2015 0))(
  ( (Nil!2012) (Cons!2011 (h!2628 (_ BitVec 64)) (t!6817 List!2015)) )
))
(declare-fun arrayNoDuplicates!0 (array!6387 (_ BitVec 32) List!2015) Bool)

(assert (=> b!164553 (= lt!82908 (arrayNoDuplicates!0 (_keys!5200 thiss!1248) #b00000000000000000000000000000000 Nil!2012))))

(assert (= (and start!16538 res!77925) b!164548))

(assert (= (and b!164548 res!77928) b!164552))

(assert (= (and b!164552 res!77924) b!164551))

(assert (= (and b!164551 res!77923) b!164546))

(assert (= (and b!164546 res!77922) b!164556))

(assert (= (and b!164556 res!77926) b!164549))

(assert (= (and b!164549 res!77927) b!164553))

(assert (= (and b!164555 condMapEmpty!6186) mapIsEmpty!6186))

(assert (= (and b!164555 (not condMapEmpty!6186)) mapNonEmpty!6186))

(assert (= (and mapNonEmpty!6186 ((_ is ValueCellFull!1479) mapValue!6186)) b!164550))

(assert (= (and b!164555 ((_ is ValueCellFull!1479) mapDefault!6186)) b!164554))

(assert (= b!164547 b!164555))

(assert (= start!16538 b!164547))

(declare-fun m!194711 () Bool)

(assert (=> b!164546 m!194711))

(declare-fun m!194713 () Bool)

(assert (=> b!164551 m!194713))

(assert (=> b!164551 m!194713))

(declare-fun m!194715 () Bool)

(assert (=> b!164551 m!194715))

(declare-fun m!194717 () Bool)

(assert (=> b!164549 m!194717))

(declare-fun m!194719 () Bool)

(assert (=> start!16538 m!194719))

(declare-fun m!194721 () Bool)

(assert (=> b!164547 m!194721))

(declare-fun m!194723 () Bool)

(assert (=> b!164547 m!194723))

(declare-fun m!194725 () Bool)

(assert (=> b!164552 m!194725))

(declare-fun m!194727 () Bool)

(assert (=> mapNonEmpty!6186 m!194727))

(declare-fun m!194729 () Bool)

(assert (=> b!164553 m!194729))

(check-sat (not b!164553) (not b!164552) (not b!164549) b_and!10257 (not start!16538) (not b_next!3843) (not b!164546) tp_is_empty!3645 (not mapNonEmpty!6186) (not b!164551) (not b!164547))
(check-sat b_and!10257 (not b_next!3843))
