; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16150 () Bool)

(assert start!16150)

(declare-fun b!160870 () Bool)

(declare-fun b_free!3607 () Bool)

(declare-fun b_next!3607 () Bool)

(assert (=> b!160870 (= b_free!3607 (not b_next!3607))))

(declare-fun tp!13391 () Bool)

(declare-fun b_and!10035 () Bool)

(assert (=> b!160870 (= tp!13391 b_and!10035)))

(declare-fun res!76231 () Bool)

(declare-fun e!105137 () Bool)

(assert (=> start!16150 (=> (not res!76231) (not e!105137))))

(declare-datatypes ((V!4193 0))(
  ( (V!4194 (val!1749 Int)) )
))
(declare-datatypes ((ValueCell!1361 0))(
  ( (ValueCellFull!1361 (v!3615 V!4193)) (EmptyCell!1361) )
))
(declare-datatypes ((array!5883 0))(
  ( (array!5884 (arr!2786 (Array (_ BitVec 32) (_ BitVec 64))) (size!3070 (_ BitVec 32))) )
))
(declare-datatypes ((array!5885 0))(
  ( (array!5886 (arr!2787 (Array (_ BitVec 32) ValueCell!1361)) (size!3071 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1630 0))(
  ( (LongMapFixedSize!1631 (defaultEntry!3257 Int) (mask!7835 (_ BitVec 32)) (extraKeys!2998 (_ BitVec 32)) (zeroValue!3100 V!4193) (minValue!3100 V!4193) (_size!864 (_ BitVec 32)) (_keys!5058 array!5883) (_values!3240 array!5885) (_vacant!864 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1630)

(declare-fun valid!772 (LongMapFixedSize!1630) Bool)

(assert (=> start!16150 (= res!76231 (valid!772 thiss!1248))))

(assert (=> start!16150 e!105137))

(declare-fun e!105134 () Bool)

(assert (=> start!16150 e!105134))

(assert (=> start!16150 true))

(declare-fun b!160862 () Bool)

(declare-fun res!76230 () Bool)

(assert (=> b!160862 (=> (not res!76230) (not e!105137))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160862 (= res!76230 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5801 () Bool)

(declare-fun mapRes!5801 () Bool)

(assert (=> mapIsEmpty!5801 mapRes!5801))

(declare-fun b!160863 () Bool)

(declare-fun res!76226 () Bool)

(assert (=> b!160863 (=> (not res!76226) (not e!105137))))

(assert (=> b!160863 (= res!76226 (and (= (size!3071 (_values!3240 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7835 thiss!1248))) (= (size!3070 (_keys!5058 thiss!1248)) (size!3071 (_values!3240 thiss!1248))) (bvsge (mask!7835 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2998 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2998 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160864 () Bool)

(declare-fun e!105133 () Bool)

(declare-fun tp_is_empty!3409 () Bool)

(assert (=> b!160864 (= e!105133 tp_is_empty!3409)))

(declare-fun b!160865 () Bool)

(declare-fun res!76232 () Bool)

(assert (=> b!160865 (=> (not res!76232) (not e!105137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160865 (= res!76232 (validMask!0 (mask!7835 thiss!1248)))))

(declare-fun b!160866 () Bool)

(declare-fun e!105138 () Bool)

(assert (=> b!160866 (= e!105138 (and e!105133 mapRes!5801))))

(declare-fun condMapEmpty!5801 () Bool)

(declare-fun mapDefault!5801 () ValueCell!1361)

(assert (=> b!160866 (= condMapEmpty!5801 (= (arr!2787 (_values!3240 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1361)) mapDefault!5801)))))

(declare-fun mapNonEmpty!5801 () Bool)

(declare-fun tp!13390 () Bool)

(declare-fun e!105135 () Bool)

(assert (=> mapNonEmpty!5801 (= mapRes!5801 (and tp!13390 e!105135))))

(declare-fun mapKey!5801 () (_ BitVec 32))

(declare-fun mapValue!5801 () ValueCell!1361)

(declare-fun mapRest!5801 () (Array (_ BitVec 32) ValueCell!1361))

(assert (=> mapNonEmpty!5801 (= (arr!2787 (_values!3240 thiss!1248)) (store mapRest!5801 mapKey!5801 mapValue!5801))))

(declare-fun b!160867 () Bool)

(declare-fun res!76227 () Bool)

(assert (=> b!160867 (=> (not res!76227) (not e!105137))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!333 0))(
  ( (MissingZero!333 (index!3500 (_ BitVec 32))) (Found!333 (index!3501 (_ BitVec 32))) (Intermediate!333 (undefined!1145 Bool) (index!3502 (_ BitVec 32)) (x!17741 (_ BitVec 32))) (Undefined!333) (MissingVacant!333 (index!3503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5883 (_ BitVec 32)) SeekEntryResult!333)

(assert (=> b!160867 (= res!76227 ((_ is Undefined!333) (seekEntryOrOpen!0 key!828 (_keys!5058 thiss!1248) (mask!7835 thiss!1248))))))

(declare-fun b!160868 () Bool)

(declare-fun res!76229 () Bool)

(assert (=> b!160868 (=> (not res!76229) (not e!105137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5883 (_ BitVec 32)) Bool)

(assert (=> b!160868 (= res!76229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5058 thiss!1248) (mask!7835 thiss!1248)))))

(declare-fun b!160869 () Bool)

(declare-fun res!76228 () Bool)

(assert (=> b!160869 (=> (not res!76228) (not e!105137))))

(declare-datatypes ((tuple2!2886 0))(
  ( (tuple2!2887 (_1!1454 (_ BitVec 64)) (_2!1454 V!4193)) )
))
(declare-datatypes ((List!1950 0))(
  ( (Nil!1947) (Cons!1946 (h!2559 tuple2!2886) (t!6744 List!1950)) )
))
(declare-datatypes ((ListLongMap!1885 0))(
  ( (ListLongMap!1886 (toList!958 List!1950)) )
))
(declare-fun contains!1004 (ListLongMap!1885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!625 (array!5883 array!5885 (_ BitVec 32) (_ BitVec 32) V!4193 V!4193 (_ BitVec 32) Int) ListLongMap!1885)

(assert (=> b!160869 (= res!76228 (not (contains!1004 (getCurrentListMap!625 (_keys!5058 thiss!1248) (_values!3240 thiss!1248) (mask!7835 thiss!1248) (extraKeys!2998 thiss!1248) (zeroValue!3100 thiss!1248) (minValue!3100 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3257 thiss!1248)) key!828)))))

(declare-fun array_inv!1783 (array!5883) Bool)

(declare-fun array_inv!1784 (array!5885) Bool)

(assert (=> b!160870 (= e!105134 (and tp!13391 tp_is_empty!3409 (array_inv!1783 (_keys!5058 thiss!1248)) (array_inv!1784 (_values!3240 thiss!1248)) e!105138))))

(declare-fun b!160871 () Bool)

(assert (=> b!160871 (= e!105137 false)))

(declare-fun lt!82182 () Bool)

(declare-datatypes ((List!1951 0))(
  ( (Nil!1948) (Cons!1947 (h!2560 (_ BitVec 64)) (t!6745 List!1951)) )
))
(declare-fun arrayNoDuplicates!0 (array!5883 (_ BitVec 32) List!1951) Bool)

(assert (=> b!160871 (= lt!82182 (arrayNoDuplicates!0 (_keys!5058 thiss!1248) #b00000000000000000000000000000000 Nil!1948))))

(declare-fun b!160872 () Bool)

(assert (=> b!160872 (= e!105135 tp_is_empty!3409)))

(assert (= (and start!16150 res!76231) b!160862))

(assert (= (and b!160862 res!76230) b!160867))

(assert (= (and b!160867 res!76227) b!160869))

(assert (= (and b!160869 res!76228) b!160865))

(assert (= (and b!160865 res!76232) b!160863))

(assert (= (and b!160863 res!76226) b!160868))

(assert (= (and b!160868 res!76229) b!160871))

(assert (= (and b!160866 condMapEmpty!5801) mapIsEmpty!5801))

(assert (= (and b!160866 (not condMapEmpty!5801)) mapNonEmpty!5801))

(assert (= (and mapNonEmpty!5801 ((_ is ValueCellFull!1361) mapValue!5801)) b!160872))

(assert (= (and b!160866 ((_ is ValueCellFull!1361) mapDefault!5801)) b!160864))

(assert (= b!160870 b!160866))

(assert (= start!16150 b!160870))

(declare-fun m!192719 () Bool)

(assert (=> b!160867 m!192719))

(declare-fun m!192721 () Bool)

(assert (=> b!160869 m!192721))

(assert (=> b!160869 m!192721))

(declare-fun m!192723 () Bool)

(assert (=> b!160869 m!192723))

(declare-fun m!192725 () Bool)

(assert (=> mapNonEmpty!5801 m!192725))

(declare-fun m!192727 () Bool)

(assert (=> b!160865 m!192727))

(declare-fun m!192729 () Bool)

(assert (=> b!160871 m!192729))

(declare-fun m!192731 () Bool)

(assert (=> start!16150 m!192731))

(declare-fun m!192733 () Bool)

(assert (=> b!160870 m!192733))

(declare-fun m!192735 () Bool)

(assert (=> b!160870 m!192735))

(declare-fun m!192737 () Bool)

(assert (=> b!160868 m!192737))

(check-sat b_and!10035 (not b!160867) (not mapNonEmpty!5801) (not b!160868) (not b!160869) (not start!16150) tp_is_empty!3409 (not b!160865) (not b!160871) (not b_next!3607) (not b!160870))
(check-sat b_and!10035 (not b_next!3607))
