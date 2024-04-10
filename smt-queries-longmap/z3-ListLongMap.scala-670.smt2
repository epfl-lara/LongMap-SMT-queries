; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16526 () Bool)

(assert start!16526)

(declare-fun b!164350 () Bool)

(declare-fun b_free!3831 () Bool)

(declare-fun b_next!3831 () Bool)

(assert (=> b!164350 (= b_free!3831 (not b_next!3831))))

(declare-fun tp!14094 () Bool)

(declare-fun b_and!10245 () Bool)

(assert (=> b!164350 (= tp!14094 b_and!10245)))

(declare-fun mapIsEmpty!6168 () Bool)

(declare-fun mapRes!6168 () Bool)

(assert (=> mapIsEmpty!6168 mapRes!6168))

(declare-fun b!164348 () Bool)

(declare-fun e!107830 () Bool)

(assert (=> b!164348 (= e!107830 false)))

(declare-fun lt!82872 () Bool)

(declare-datatypes ((V!4491 0))(
  ( (V!4492 (val!1861 Int)) )
))
(declare-datatypes ((ValueCell!1473 0))(
  ( (ValueCellFull!1473 (v!3726 V!4491)) (EmptyCell!1473) )
))
(declare-datatypes ((array!6363 0))(
  ( (array!6364 (arr!3017 (Array (_ BitVec 32) (_ BitVec 64))) (size!3305 (_ BitVec 32))) )
))
(declare-datatypes ((array!6365 0))(
  ( (array!6366 (arr!3018 (Array (_ BitVec 32) ValueCell!1473)) (size!3306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1854 0))(
  ( (LongMapFixedSize!1855 (defaultEntry!3369 Int) (mask!8058 (_ BitVec 32)) (extraKeys!3110 (_ BitVec 32)) (zeroValue!3212 V!4491) (minValue!3212 V!4491) (_size!976 (_ BitVec 32)) (_keys!5194 array!6363) (_values!3352 array!6365) (_vacant!976 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1854)

(declare-datatypes ((List!2002 0))(
  ( (Nil!1999) (Cons!1998 (h!2615 (_ BitVec 64)) (t!6804 List!2002)) )
))
(declare-fun arrayNoDuplicates!0 (array!6363 (_ BitVec 32) List!2002) Bool)

(assert (=> b!164348 (= lt!82872 (arrayNoDuplicates!0 (_keys!5194 thiss!1248) #b00000000000000000000000000000000 Nil!1999))))

(declare-fun b!164349 () Bool)

(declare-fun e!107831 () Bool)

(declare-fun tp_is_empty!3633 () Bool)

(assert (=> b!164349 (= e!107831 tp_is_empty!3633)))

(declare-fun e!107833 () Bool)

(declare-fun e!107829 () Bool)

(declare-fun array_inv!1931 (array!6363) Bool)

(declare-fun array_inv!1932 (array!6365) Bool)

(assert (=> b!164350 (= e!107829 (and tp!14094 tp_is_empty!3633 (array_inv!1931 (_keys!5194 thiss!1248)) (array_inv!1932 (_values!3352 thiss!1248)) e!107833))))

(declare-fun b!164351 () Bool)

(declare-fun res!77799 () Bool)

(assert (=> b!164351 (=> (not res!77799) (not e!107830))))

(assert (=> b!164351 (= res!77799 (and (= (size!3306 (_values!3352 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8058 thiss!1248))) (= (size!3305 (_keys!5194 thiss!1248)) (size!3306 (_values!3352 thiss!1248))) (bvsge (mask!8058 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3110 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3110 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164352 () Bool)

(declare-fun res!77802 () Bool)

(assert (=> b!164352 (=> (not res!77802) (not e!107830))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3020 0))(
  ( (tuple2!3021 (_1!1521 (_ BitVec 64)) (_2!1521 V!4491)) )
))
(declare-datatypes ((List!2003 0))(
  ( (Nil!2000) (Cons!1999 (h!2616 tuple2!3020) (t!6805 List!2003)) )
))
(declare-datatypes ((ListLongMap!1975 0))(
  ( (ListLongMap!1976 (toList!1003 List!2003)) )
))
(declare-fun contains!1045 (ListLongMap!1975 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!661 (array!6363 array!6365 (_ BitVec 32) (_ BitVec 32) V!4491 V!4491 (_ BitVec 32) Int) ListLongMap!1975)

(assert (=> b!164352 (= res!77802 (contains!1045 (getCurrentListMap!661 (_keys!5194 thiss!1248) (_values!3352 thiss!1248) (mask!8058 thiss!1248) (extraKeys!3110 thiss!1248) (zeroValue!3212 thiss!1248) (minValue!3212 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3369 thiss!1248)) key!828))))

(declare-fun b!164353 () Bool)

(declare-fun res!77797 () Bool)

(assert (=> b!164353 (=> (not res!77797) (not e!107830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6363 (_ BitVec 32)) Bool)

(assert (=> b!164353 (= res!77797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5194 thiss!1248) (mask!8058 thiss!1248)))))

(declare-fun mapNonEmpty!6168 () Bool)

(declare-fun tp!14093 () Bool)

(declare-fun e!107832 () Bool)

(assert (=> mapNonEmpty!6168 (= mapRes!6168 (and tp!14093 e!107832))))

(declare-fun mapRest!6168 () (Array (_ BitVec 32) ValueCell!1473))

(declare-fun mapValue!6168 () ValueCell!1473)

(declare-fun mapKey!6168 () (_ BitVec 32))

(assert (=> mapNonEmpty!6168 (= (arr!3018 (_values!3352 thiss!1248)) (store mapRest!6168 mapKey!6168 mapValue!6168))))

(declare-fun b!164354 () Bool)

(assert (=> b!164354 (= e!107832 tp_is_empty!3633)))

(declare-fun b!164355 () Bool)

(declare-fun e!107828 () Bool)

(assert (=> b!164355 (= e!107828 e!107830)))

(declare-fun res!77801 () Bool)

(assert (=> b!164355 (=> (not res!77801) (not e!107830))))

(declare-datatypes ((SeekEntryResult!414 0))(
  ( (MissingZero!414 (index!3824 (_ BitVec 32))) (Found!414 (index!3825 (_ BitVec 32))) (Intermediate!414 (undefined!1226 Bool) (index!3826 (_ BitVec 32)) (x!18226 (_ BitVec 32))) (Undefined!414) (MissingVacant!414 (index!3827 (_ BitVec 32))) )
))
(declare-fun lt!82873 () SeekEntryResult!414)

(get-info :version)

(assert (=> b!164355 (= res!77801 (and (not ((_ is Undefined!414) lt!82873)) (not ((_ is MissingVacant!414) lt!82873)) (not ((_ is MissingZero!414) lt!82873)) ((_ is Found!414) lt!82873)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6363 (_ BitVec 32)) SeekEntryResult!414)

(assert (=> b!164355 (= lt!82873 (seekEntryOrOpen!0 key!828 (_keys!5194 thiss!1248) (mask!8058 thiss!1248)))))

(declare-fun b!164356 () Bool)

(assert (=> b!164356 (= e!107833 (and e!107831 mapRes!6168))))

(declare-fun condMapEmpty!6168 () Bool)

(declare-fun mapDefault!6168 () ValueCell!1473)

(assert (=> b!164356 (= condMapEmpty!6168 (= (arr!3018 (_values!3352 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1473)) mapDefault!6168)))))

(declare-fun b!164357 () Bool)

(declare-fun res!77798 () Bool)

(assert (=> b!164357 (=> (not res!77798) (not e!107828))))

(assert (=> b!164357 (= res!77798 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164358 () Bool)

(declare-fun res!77796 () Bool)

(assert (=> b!164358 (=> (not res!77796) (not e!107830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164358 (= res!77796 (validMask!0 (mask!8058 thiss!1248)))))

(declare-fun res!77800 () Bool)

(assert (=> start!16526 (=> (not res!77800) (not e!107828))))

(declare-fun valid!825 (LongMapFixedSize!1854) Bool)

(assert (=> start!16526 (= res!77800 (valid!825 thiss!1248))))

(assert (=> start!16526 e!107828))

(assert (=> start!16526 e!107829))

(assert (=> start!16526 true))

(assert (= (and start!16526 res!77800) b!164357))

(assert (= (and b!164357 res!77798) b!164355))

(assert (= (and b!164355 res!77801) b!164352))

(assert (= (and b!164352 res!77802) b!164358))

(assert (= (and b!164358 res!77796) b!164351))

(assert (= (and b!164351 res!77799) b!164353))

(assert (= (and b!164353 res!77797) b!164348))

(assert (= (and b!164356 condMapEmpty!6168) mapIsEmpty!6168))

(assert (= (and b!164356 (not condMapEmpty!6168)) mapNonEmpty!6168))

(assert (= (and mapNonEmpty!6168 ((_ is ValueCellFull!1473) mapValue!6168)) b!164354))

(assert (= (and b!164356 ((_ is ValueCellFull!1473) mapDefault!6168)) b!164349))

(assert (= b!164350 b!164356))

(assert (= start!16526 b!164350))

(declare-fun m!194591 () Bool)

(assert (=> b!164355 m!194591))

(declare-fun m!194593 () Bool)

(assert (=> b!164348 m!194593))

(declare-fun m!194595 () Bool)

(assert (=> mapNonEmpty!6168 m!194595))

(declare-fun m!194597 () Bool)

(assert (=> b!164350 m!194597))

(declare-fun m!194599 () Bool)

(assert (=> b!164350 m!194599))

(declare-fun m!194601 () Bool)

(assert (=> b!164358 m!194601))

(declare-fun m!194603 () Bool)

(assert (=> b!164353 m!194603))

(declare-fun m!194605 () Bool)

(assert (=> start!16526 m!194605))

(declare-fun m!194607 () Bool)

(assert (=> b!164352 m!194607))

(assert (=> b!164352 m!194607))

(declare-fun m!194609 () Bool)

(assert (=> b!164352 m!194609))

(check-sat (not b_next!3831) b_and!10245 (not b!164353) (not b!164358) (not mapNonEmpty!6168) (not b!164350) (not b!164348) tp_is_empty!3633 (not start!16526) (not b!164355) (not b!164352))
(check-sat b_and!10245 (not b_next!3831))
