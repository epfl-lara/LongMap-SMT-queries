; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80358 () Bool)

(assert start!80358)

(declare-fun b!943726 () Bool)

(declare-fun b_free!18019 () Bool)

(declare-fun b_next!18019 () Bool)

(assert (=> b!943726 (= b_free!18019 (not b_next!18019))))

(declare-fun tp!62568 () Bool)

(declare-fun b_and!29411 () Bool)

(assert (=> b!943726 (= tp!62568 b_and!29411)))

(declare-fun mapNonEmpty!32616 () Bool)

(declare-fun mapRes!32616 () Bool)

(declare-fun tp!62567 () Bool)

(declare-fun e!530634 () Bool)

(assert (=> mapNonEmpty!32616 (= mapRes!32616 (and tp!62567 e!530634))))

(declare-fun mapKey!32616 () (_ BitVec 32))

(declare-datatypes ((V!32335 0))(
  ( (V!32336 (val!10314 Int)) )
))
(declare-datatypes ((ValueCell!9782 0))(
  ( (ValueCellFull!9782 (v!12845 V!32335)) (EmptyCell!9782) )
))
(declare-datatypes ((array!56987 0))(
  ( (array!56988 (arr!27419 (Array (_ BitVec 32) ValueCell!9782)) (size!27887 (_ BitVec 32))) )
))
(declare-datatypes ((array!56989 0))(
  ( (array!56990 (arr!27420 (Array (_ BitVec 32) (_ BitVec 64))) (size!27888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4714 0))(
  ( (LongMapFixedSize!4715 (defaultEntry!5652 Int) (mask!27285 (_ BitVec 32)) (extraKeys!5384 (_ BitVec 32)) (zeroValue!5488 V!32335) (minValue!5488 V!32335) (_size!2412 (_ BitVec 32)) (_keys!10525 array!56989) (_values!5675 array!56987) (_vacant!2412 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4714)

(declare-fun mapRest!32616 () (Array (_ BitVec 32) ValueCell!9782))

(declare-fun mapValue!32616 () ValueCell!9782)

(assert (=> mapNonEmpty!32616 (= (arr!27419 (_values!5675 thiss!1141)) (store mapRest!32616 mapKey!32616 mapValue!32616))))

(declare-fun mapIsEmpty!32616 () Bool)

(assert (=> mapIsEmpty!32616 mapRes!32616))

(declare-fun res!634056 () Bool)

(declare-fun e!530631 () Bool)

(assert (=> start!80358 (=> (not res!634056) (not e!530631))))

(declare-fun valid!1806 (LongMapFixedSize!4714) Bool)

(assert (=> start!80358 (= res!634056 (valid!1806 thiss!1141))))

(assert (=> start!80358 e!530631))

(declare-fun e!530632 () Bool)

(assert (=> start!80358 e!530632))

(assert (=> start!80358 true))

(declare-fun tp_is_empty!20527 () Bool)

(declare-fun e!530633 () Bool)

(declare-fun array_inv!21360 (array!56989) Bool)

(declare-fun array_inv!21361 (array!56987) Bool)

(assert (=> b!943726 (= e!530632 (and tp!62568 tp_is_empty!20527 (array_inv!21360 (_keys!10525 thiss!1141)) (array_inv!21361 (_values!5675 thiss!1141)) e!530633))))

(declare-fun b!943727 () Bool)

(declare-fun res!634053 () Bool)

(assert (=> b!943727 (=> (not res!634053) (not e!530631))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13504 0))(
  ( (tuple2!13505 (_1!6763 (_ BitVec 64)) (_2!6763 V!32335)) )
))
(declare-datatypes ((List!19267 0))(
  ( (Nil!19264) (Cons!19263 (h!20414 tuple2!13504) (t!27575 List!19267)) )
))
(declare-datatypes ((ListLongMap!12191 0))(
  ( (ListLongMap!12192 (toList!6111 List!19267)) )
))
(declare-fun contains!5126 (ListLongMap!12191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3274 (array!56989 array!56987 (_ BitVec 32) (_ BitVec 32) V!32335 V!32335 (_ BitVec 32) Int) ListLongMap!12191)

(assert (=> b!943727 (= res!634053 (contains!5126 (getCurrentListMap!3274 (_keys!10525 thiss!1141) (_values!5675 thiss!1141) (mask!27285 thiss!1141) (extraKeys!5384 thiss!1141) (zeroValue!5488 thiss!1141) (minValue!5488 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5652 thiss!1141)) key!756))))

(declare-fun b!943728 () Bool)

(assert (=> b!943728 (= e!530634 tp_is_empty!20527)))

(declare-fun b!943729 () Bool)

(declare-fun res!634052 () Bool)

(assert (=> b!943729 (=> (not res!634052) (not e!530631))))

(assert (=> b!943729 (= res!634052 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943730 () Bool)

(declare-fun res!634054 () Bool)

(declare-fun e!530629 () Bool)

(assert (=> b!943730 (=> res!634054 e!530629)))

(declare-fun lt!425250 () (_ BitVec 32))

(assert (=> b!943730 (= res!634054 (or (not (= (size!27888 (_keys!10525 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27285 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27888 (_keys!10525 thiss!1141))) (bvslt lt!425250 #b00000000000000000000000000000000) (bvsgt lt!425250 (size!27888 (_keys!10525 thiss!1141)))))))

(declare-fun b!943731 () Bool)

(declare-fun res!634055 () Bool)

(assert (=> b!943731 (=> (not res!634055) (not e!530631))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9055 0))(
  ( (MissingZero!9055 (index!38591 (_ BitVec 32))) (Found!9055 (index!38592 (_ BitVec 32))) (Intermediate!9055 (undefined!9867 Bool) (index!38593 (_ BitVec 32)) (x!81061 (_ BitVec 32))) (Undefined!9055) (MissingVacant!9055 (index!38594 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56989 (_ BitVec 32)) SeekEntryResult!9055)

(assert (=> b!943731 (= res!634055 (not ((_ is Found!9055) (seekEntry!0 key!756 (_keys!10525 thiss!1141) (mask!27285 thiss!1141)))))))

(declare-fun b!943732 () Bool)

(declare-fun e!530630 () Bool)

(assert (=> b!943732 (= e!530633 (and e!530630 mapRes!32616))))

(declare-fun condMapEmpty!32616 () Bool)

(declare-fun mapDefault!32616 () ValueCell!9782)

(assert (=> b!943732 (= condMapEmpty!32616 (= (arr!27419 (_values!5675 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9782)) mapDefault!32616)))))

(declare-fun b!943733 () Bool)

(assert (=> b!943733 (= e!530630 tp_is_empty!20527)))

(declare-fun b!943734 () Bool)

(assert (=> b!943734 (= e!530629 true)))

(declare-fun lt!425249 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56989 (_ BitVec 32)) Bool)

(assert (=> b!943734 (= lt!425249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10525 thiss!1141) (mask!27285 thiss!1141)))))

(declare-fun b!943735 () Bool)

(assert (=> b!943735 (= e!530631 (not e!530629))))

(declare-fun res!634057 () Bool)

(assert (=> b!943735 (=> res!634057 e!530629)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943735 (= res!634057 (not (validMask!0 (mask!27285 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!56989 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943735 (= lt!425250 (arrayScanForKey!0 (_keys!10525 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943735 (arrayContainsKey!0 (_keys!10525 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31709 0))(
  ( (Unit!31710) )
))
(declare-fun lt!425251 () Unit!31709)

(declare-fun lemmaKeyInListMapIsInArray!283 (array!56989 array!56987 (_ BitVec 32) (_ BitVec 32) V!32335 V!32335 (_ BitVec 64) Int) Unit!31709)

(assert (=> b!943735 (= lt!425251 (lemmaKeyInListMapIsInArray!283 (_keys!10525 thiss!1141) (_values!5675 thiss!1141) (mask!27285 thiss!1141) (extraKeys!5384 thiss!1141) (zeroValue!5488 thiss!1141) (minValue!5488 thiss!1141) key!756 (defaultEntry!5652 thiss!1141)))))

(assert (= (and start!80358 res!634056) b!943729))

(assert (= (and b!943729 res!634052) b!943731))

(assert (= (and b!943731 res!634055) b!943727))

(assert (= (and b!943727 res!634053) b!943735))

(assert (= (and b!943735 (not res!634057)) b!943730))

(assert (= (and b!943730 (not res!634054)) b!943734))

(assert (= (and b!943732 condMapEmpty!32616) mapIsEmpty!32616))

(assert (= (and b!943732 (not condMapEmpty!32616)) mapNonEmpty!32616))

(assert (= (and mapNonEmpty!32616 ((_ is ValueCellFull!9782) mapValue!32616)) b!943728))

(assert (= (and b!943732 ((_ is ValueCellFull!9782) mapDefault!32616)) b!943733))

(assert (= b!943726 b!943732))

(assert (= start!80358 b!943726))

(declare-fun m!877303 () Bool)

(assert (=> b!943731 m!877303))

(declare-fun m!877305 () Bool)

(assert (=> start!80358 m!877305))

(declare-fun m!877307 () Bool)

(assert (=> b!943734 m!877307))

(declare-fun m!877309 () Bool)

(assert (=> b!943735 m!877309))

(declare-fun m!877311 () Bool)

(assert (=> b!943735 m!877311))

(declare-fun m!877313 () Bool)

(assert (=> b!943735 m!877313))

(declare-fun m!877315 () Bool)

(assert (=> b!943735 m!877315))

(declare-fun m!877317 () Bool)

(assert (=> b!943727 m!877317))

(assert (=> b!943727 m!877317))

(declare-fun m!877319 () Bool)

(assert (=> b!943727 m!877319))

(declare-fun m!877321 () Bool)

(assert (=> mapNonEmpty!32616 m!877321))

(declare-fun m!877323 () Bool)

(assert (=> b!943726 m!877323))

(declare-fun m!877325 () Bool)

(assert (=> b!943726 m!877325))

(check-sat (not b!943726) (not b!943731) (not b!943734) b_and!29411 tp_is_empty!20527 (not start!80358) (not mapNonEmpty!32616) (not b!943727) (not b_next!18019) (not b!943735))
(check-sat b_and!29411 (not b_next!18019))
