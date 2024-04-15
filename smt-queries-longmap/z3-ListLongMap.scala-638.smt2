; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16180 () Bool)

(assert start!16180)

(declare-fun b!161149 () Bool)

(declare-fun b_free!3637 () Bool)

(declare-fun b_next!3637 () Bool)

(assert (=> b!161149 (= b_free!3637 (not b_next!3637))))

(declare-fun tp!13480 () Bool)

(declare-fun b_and!10025 () Bool)

(assert (=> b!161149 (= tp!13480 b_and!10025)))

(declare-fun b!161141 () Bool)

(declare-fun res!76383 () Bool)

(declare-fun e!105291 () Bool)

(assert (=> b!161141 (=> (not res!76383) (not e!105291))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161141 (= res!76383 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161142 () Bool)

(assert (=> b!161142 (= e!105291 false)))

(declare-datatypes ((Unit!4980 0))(
  ( (Unit!4981) )
))
(declare-fun lt!81999 () Unit!4980)

(declare-fun e!105290 () Unit!4980)

(assert (=> b!161142 (= lt!81999 e!105290)))

(declare-fun c!29918 () Bool)

(declare-datatypes ((V!4233 0))(
  ( (V!4234 (val!1764 Int)) )
))
(declare-datatypes ((ValueCell!1376 0))(
  ( (ValueCellFull!1376 (v!3623 V!4233)) (EmptyCell!1376) )
))
(declare-datatypes ((array!5937 0))(
  ( (array!5938 (arr!2812 (Array (_ BitVec 32) (_ BitVec 64))) (size!3097 (_ BitVec 32))) )
))
(declare-datatypes ((array!5939 0))(
  ( (array!5940 (arr!2813 (Array (_ BitVec 32) ValueCell!1376)) (size!3098 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1660 0))(
  ( (LongMapFixedSize!1661 (defaultEntry!3272 Int) (mask!7859 (_ BitVec 32)) (extraKeys!3013 (_ BitVec 32)) (zeroValue!3115 V!4233) (minValue!3115 V!4233) (_size!879 (_ BitVec 32)) (_keys!5072 array!5937) (_values!3255 array!5939) (_vacant!879 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1660)

(declare-datatypes ((tuple2!2926 0))(
  ( (tuple2!2927 (_1!1474 (_ BitVec 64)) (_2!1474 V!4233)) )
))
(declare-datatypes ((List!1976 0))(
  ( (Nil!1973) (Cons!1972 (h!2585 tuple2!2926) (t!6769 List!1976)) )
))
(declare-datatypes ((ListLongMap!1913 0))(
  ( (ListLongMap!1914 (toList!972 List!1976)) )
))
(declare-fun contains!1011 (ListLongMap!1913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!622 (array!5937 array!5939 (_ BitVec 32) (_ BitVec 32) V!4233 V!4233 (_ BitVec 32) Int) ListLongMap!1913)

(assert (=> b!161142 (= c!29918 (contains!1011 (getCurrentListMap!622 (_keys!5072 thiss!1248) (_values!3255 thiss!1248) (mask!7859 thiss!1248) (extraKeys!3013 thiss!1248) (zeroValue!3115 thiss!1248) (minValue!3115 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3272 thiss!1248)) key!828))))

(declare-fun b!161143 () Bool)

(declare-fun res!76382 () Bool)

(assert (=> b!161143 (=> (not res!76382) (not e!105291))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!357 0))(
  ( (MissingZero!357 (index!3596 (_ BitVec 32))) (Found!357 (index!3597 (_ BitVec 32))) (Intermediate!357 (undefined!1169 Bool) (index!3598 (_ BitVec 32)) (x!17804 (_ BitVec 32))) (Undefined!357) (MissingVacant!357 (index!3599 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5937 (_ BitVec 32)) SeekEntryResult!357)

(assert (=> b!161143 (= res!76382 ((_ is Undefined!357) (seekEntryOrOpen!0 key!828 (_keys!5072 thiss!1248) (mask!7859 thiss!1248))))))

(declare-fun res!76381 () Bool)

(assert (=> start!16180 (=> (not res!76381) (not e!105291))))

(declare-fun valid!762 (LongMapFixedSize!1660) Bool)

(assert (=> start!16180 (= res!76381 (valid!762 thiss!1248))))

(assert (=> start!16180 e!105291))

(declare-fun e!105289 () Bool)

(assert (=> start!16180 e!105289))

(assert (=> start!16180 true))

(declare-fun mapIsEmpty!5846 () Bool)

(declare-fun mapRes!5846 () Bool)

(assert (=> mapIsEmpty!5846 mapRes!5846))

(declare-fun b!161144 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!74 (array!5937 array!5939 (_ BitVec 32) (_ BitVec 32) V!4233 V!4233 (_ BitVec 64) Int) Unit!4980)

(assert (=> b!161144 (= e!105290 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!74 (_keys!5072 thiss!1248) (_values!3255 thiss!1248) (mask!7859 thiss!1248) (extraKeys!3013 thiss!1248) (zeroValue!3115 thiss!1248) (minValue!3115 thiss!1248) key!828 (defaultEntry!3272 thiss!1248)))))

(declare-fun b!161145 () Bool)

(declare-fun e!105292 () Bool)

(declare-fun tp_is_empty!3439 () Bool)

(assert (=> b!161145 (= e!105292 tp_is_empty!3439)))

(declare-fun b!161146 () Bool)

(declare-fun e!105295 () Bool)

(assert (=> b!161146 (= e!105295 tp_is_empty!3439)))

(declare-fun b!161147 () Bool)

(declare-fun e!105293 () Bool)

(assert (=> b!161147 (= e!105293 (and e!105292 mapRes!5846))))

(declare-fun condMapEmpty!5846 () Bool)

(declare-fun mapDefault!5846 () ValueCell!1376)

(assert (=> b!161147 (= condMapEmpty!5846 (= (arr!2813 (_values!3255 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1376)) mapDefault!5846)))))

(declare-fun b!161148 () Bool)

(declare-fun Unit!4982 () Unit!4980)

(assert (=> b!161148 (= e!105290 Unit!4982)))

(declare-fun lt!81998 () Unit!4980)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!74 (array!5937 array!5939 (_ BitVec 32) (_ BitVec 32) V!4233 V!4233 (_ BitVec 64) Int) Unit!4980)

(assert (=> b!161148 (= lt!81998 (lemmaInListMapThenSeekEntryOrOpenFindsIt!74 (_keys!5072 thiss!1248) (_values!3255 thiss!1248) (mask!7859 thiss!1248) (extraKeys!3013 thiss!1248) (zeroValue!3115 thiss!1248) (minValue!3115 thiss!1248) key!828 (defaultEntry!3272 thiss!1248)))))

(assert (=> b!161148 false))

(declare-fun mapNonEmpty!5846 () Bool)

(declare-fun tp!13481 () Bool)

(assert (=> mapNonEmpty!5846 (= mapRes!5846 (and tp!13481 e!105295))))

(declare-fun mapValue!5846 () ValueCell!1376)

(declare-fun mapRest!5846 () (Array (_ BitVec 32) ValueCell!1376))

(declare-fun mapKey!5846 () (_ BitVec 32))

(assert (=> mapNonEmpty!5846 (= (arr!2813 (_values!3255 thiss!1248)) (store mapRest!5846 mapKey!5846 mapValue!5846))))

(declare-fun array_inv!1811 (array!5937) Bool)

(declare-fun array_inv!1812 (array!5939) Bool)

(assert (=> b!161149 (= e!105289 (and tp!13480 tp_is_empty!3439 (array_inv!1811 (_keys!5072 thiss!1248)) (array_inv!1812 (_values!3255 thiss!1248)) e!105293))))

(assert (= (and start!16180 res!76381) b!161141))

(assert (= (and b!161141 res!76383) b!161143))

(assert (= (and b!161143 res!76382) b!161142))

(assert (= (and b!161142 c!29918) b!161148))

(assert (= (and b!161142 (not c!29918)) b!161144))

(assert (= (and b!161147 condMapEmpty!5846) mapIsEmpty!5846))

(assert (= (and b!161147 (not condMapEmpty!5846)) mapNonEmpty!5846))

(assert (= (and mapNonEmpty!5846 ((_ is ValueCellFull!1376) mapValue!5846)) b!161146))

(assert (= (and b!161147 ((_ is ValueCellFull!1376) mapDefault!5846)) b!161145))

(assert (= b!161149 b!161147))

(assert (= start!16180 b!161149))

(declare-fun m!192211 () Bool)

(assert (=> b!161149 m!192211))

(declare-fun m!192213 () Bool)

(assert (=> b!161149 m!192213))

(declare-fun m!192215 () Bool)

(assert (=> start!16180 m!192215))

(declare-fun m!192217 () Bool)

(assert (=> b!161148 m!192217))

(declare-fun m!192219 () Bool)

(assert (=> b!161142 m!192219))

(assert (=> b!161142 m!192219))

(declare-fun m!192221 () Bool)

(assert (=> b!161142 m!192221))

(declare-fun m!192223 () Bool)

(assert (=> b!161143 m!192223))

(declare-fun m!192225 () Bool)

(assert (=> mapNonEmpty!5846 m!192225))

(declare-fun m!192227 () Bool)

(assert (=> b!161144 m!192227))

(check-sat (not b!161149) (not b!161144) b_and!10025 (not start!16180) (not mapNonEmpty!5846) (not b!161143) tp_is_empty!3439 (not b!161148) (not b!161142) (not b_next!3637))
(check-sat b_and!10025 (not b_next!3637))
