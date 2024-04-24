; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16054 () Bool)

(assert start!16054)

(declare-fun b!159288 () Bool)

(declare-fun b_free!3511 () Bool)

(declare-fun b_next!3511 () Bool)

(assert (=> b!159288 (= b_free!3511 (not b_next!3511))))

(declare-fun tp!13102 () Bool)

(declare-fun b_and!9939 () Bool)

(assert (=> b!159288 (= tp!13102 b_and!9939)))

(declare-fun mapIsEmpty!5657 () Bool)

(declare-fun mapRes!5657 () Bool)

(assert (=> mapIsEmpty!5657 mapRes!5657))

(declare-fun res!75219 () Bool)

(declare-fun e!104274 () Bool)

(assert (=> start!16054 (=> (not res!75219) (not e!104274))))

(declare-datatypes ((V!4065 0))(
  ( (V!4066 (val!1701 Int)) )
))
(declare-datatypes ((ValueCell!1313 0))(
  ( (ValueCellFull!1313 (v!3567 V!4065)) (EmptyCell!1313) )
))
(declare-datatypes ((array!5691 0))(
  ( (array!5692 (arr!2690 (Array (_ BitVec 32) (_ BitVec 64))) (size!2974 (_ BitVec 32))) )
))
(declare-datatypes ((array!5693 0))(
  ( (array!5694 (arr!2691 (Array (_ BitVec 32) ValueCell!1313)) (size!2975 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1534 0))(
  ( (LongMapFixedSize!1535 (defaultEntry!3209 Int) (mask!7755 (_ BitVec 32)) (extraKeys!2950 (_ BitVec 32)) (zeroValue!3052 V!4065) (minValue!3052 V!4065) (_size!816 (_ BitVec 32)) (_keys!5010 array!5691) (_values!3192 array!5693) (_vacant!816 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1534)

(declare-fun valid!739 (LongMapFixedSize!1534) Bool)

(assert (=> start!16054 (= res!75219 (valid!739 thiss!1248))))

(assert (=> start!16054 e!104274))

(declare-fun e!104272 () Bool)

(assert (=> start!16054 e!104272))

(assert (=> start!16054 true))

(declare-fun b!159278 () Bool)

(declare-fun res!75222 () Bool)

(assert (=> b!159278 (=> (not res!75222) (not e!104274))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!302 0))(
  ( (MissingZero!302 (index!3376 (_ BitVec 32))) (Found!302 (index!3377 (_ BitVec 32))) (Intermediate!302 (undefined!1114 Bool) (index!3378 (_ BitVec 32)) (x!17582 (_ BitVec 32))) (Undefined!302) (MissingVacant!302 (index!3379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5691 (_ BitVec 32)) SeekEntryResult!302)

(assert (=> b!159278 (= res!75222 ((_ is Undefined!302) (seekEntryOrOpen!0 key!828 (_keys!5010 thiss!1248) (mask!7755 thiss!1248))))))

(declare-fun b!159279 () Bool)

(declare-fun res!75224 () Bool)

(assert (=> b!159279 (=> (not res!75224) (not e!104274))))

(assert (=> b!159279 (= res!75224 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159280 () Bool)

(declare-fun res!75221 () Bool)

(assert (=> b!159280 (=> (not res!75221) (not e!104274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5691 (_ BitVec 32)) Bool)

(assert (=> b!159280 (= res!75221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5010 thiss!1248) (mask!7755 thiss!1248)))))

(declare-fun b!159281 () Bool)

(declare-fun res!75218 () Bool)

(assert (=> b!159281 (=> (not res!75218) (not e!104274))))

(declare-datatypes ((tuple2!2814 0))(
  ( (tuple2!2815 (_1!1418 (_ BitVec 64)) (_2!1418 V!4065)) )
))
(declare-datatypes ((List!1880 0))(
  ( (Nil!1877) (Cons!1876 (h!2489 tuple2!2814) (t!6674 List!1880)) )
))
(declare-datatypes ((ListLongMap!1813 0))(
  ( (ListLongMap!1814 (toList!922 List!1880)) )
))
(declare-fun contains!968 (ListLongMap!1813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!589 (array!5691 array!5693 (_ BitVec 32) (_ BitVec 32) V!4065 V!4065 (_ BitVec 32) Int) ListLongMap!1813)

(assert (=> b!159281 (= res!75218 (contains!968 (getCurrentListMap!589 (_keys!5010 thiss!1248) (_values!3192 thiss!1248) (mask!7755 thiss!1248) (extraKeys!2950 thiss!1248) (zeroValue!3052 thiss!1248) (minValue!3052 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3209 thiss!1248)) key!828))))

(declare-fun b!159282 () Bool)

(assert (=> b!159282 (= e!104274 false)))

(declare-fun lt!82038 () Bool)

(declare-datatypes ((List!1881 0))(
  ( (Nil!1878) (Cons!1877 (h!2490 (_ BitVec 64)) (t!6675 List!1881)) )
))
(declare-fun arrayNoDuplicates!0 (array!5691 (_ BitVec 32) List!1881) Bool)

(assert (=> b!159282 (= lt!82038 (arrayNoDuplicates!0 (_keys!5010 thiss!1248) #b00000000000000000000000000000000 Nil!1878))))

(declare-fun b!159283 () Bool)

(declare-fun e!104273 () Bool)

(declare-fun tp_is_empty!3313 () Bool)

(assert (=> b!159283 (= e!104273 tp_is_empty!3313)))

(declare-fun b!159284 () Bool)

(declare-fun res!75223 () Bool)

(assert (=> b!159284 (=> (not res!75223) (not e!104274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159284 (= res!75223 (validMask!0 (mask!7755 thiss!1248)))))

(declare-fun b!159285 () Bool)

(declare-fun e!104270 () Bool)

(assert (=> b!159285 (= e!104270 tp_is_empty!3313)))

(declare-fun b!159286 () Bool)

(declare-fun e!104269 () Bool)

(assert (=> b!159286 (= e!104269 (and e!104270 mapRes!5657))))

(declare-fun condMapEmpty!5657 () Bool)

(declare-fun mapDefault!5657 () ValueCell!1313)

(assert (=> b!159286 (= condMapEmpty!5657 (= (arr!2691 (_values!3192 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1313)) mapDefault!5657)))))

(declare-fun mapNonEmpty!5657 () Bool)

(declare-fun tp!13103 () Bool)

(assert (=> mapNonEmpty!5657 (= mapRes!5657 (and tp!13103 e!104273))))

(declare-fun mapRest!5657 () (Array (_ BitVec 32) ValueCell!1313))

(declare-fun mapValue!5657 () ValueCell!1313)

(declare-fun mapKey!5657 () (_ BitVec 32))

(assert (=> mapNonEmpty!5657 (= (arr!2691 (_values!3192 thiss!1248)) (store mapRest!5657 mapKey!5657 mapValue!5657))))

(declare-fun b!159287 () Bool)

(declare-fun res!75220 () Bool)

(assert (=> b!159287 (=> (not res!75220) (not e!104274))))

(assert (=> b!159287 (= res!75220 (and (= (size!2975 (_values!3192 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7755 thiss!1248))) (= (size!2974 (_keys!5010 thiss!1248)) (size!2975 (_values!3192 thiss!1248))) (bvsge (mask!7755 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2950 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2950 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun array_inv!1715 (array!5691) Bool)

(declare-fun array_inv!1716 (array!5693) Bool)

(assert (=> b!159288 (= e!104272 (and tp!13102 tp_is_empty!3313 (array_inv!1715 (_keys!5010 thiss!1248)) (array_inv!1716 (_values!3192 thiss!1248)) e!104269))))

(assert (= (and start!16054 res!75219) b!159279))

(assert (= (and b!159279 res!75224) b!159278))

(assert (= (and b!159278 res!75222) b!159281))

(assert (= (and b!159281 res!75218) b!159284))

(assert (= (and b!159284 res!75223) b!159287))

(assert (= (and b!159287 res!75220) b!159280))

(assert (= (and b!159280 res!75221) b!159282))

(assert (= (and b!159286 condMapEmpty!5657) mapIsEmpty!5657))

(assert (= (and b!159286 (not condMapEmpty!5657)) mapNonEmpty!5657))

(assert (= (and mapNonEmpty!5657 ((_ is ValueCellFull!1313) mapValue!5657)) b!159283))

(assert (= (and b!159286 ((_ is ValueCellFull!1313) mapDefault!5657)) b!159285))

(assert (= b!159288 b!159286))

(assert (= start!16054 b!159288))

(declare-fun m!191759 () Bool)

(assert (=> b!159284 m!191759))

(declare-fun m!191761 () Bool)

(assert (=> b!159281 m!191761))

(assert (=> b!159281 m!191761))

(declare-fun m!191763 () Bool)

(assert (=> b!159281 m!191763))

(declare-fun m!191765 () Bool)

(assert (=> start!16054 m!191765))

(declare-fun m!191767 () Bool)

(assert (=> b!159282 m!191767))

(declare-fun m!191769 () Bool)

(assert (=> mapNonEmpty!5657 m!191769))

(declare-fun m!191771 () Bool)

(assert (=> b!159280 m!191771))

(declare-fun m!191773 () Bool)

(assert (=> b!159278 m!191773))

(declare-fun m!191775 () Bool)

(assert (=> b!159288 m!191775))

(declare-fun m!191777 () Bool)

(assert (=> b!159288 m!191777))

(check-sat (not b!159280) (not b!159281) (not start!16054) (not b!159288) (not mapNonEmpty!5657) tp_is_empty!3313 b_and!9939 (not b!159278) (not b_next!3511) (not b!159282) (not b!159284))
(check-sat b_and!9939 (not b_next!3511))
