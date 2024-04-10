; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16796 () Bool)

(assert start!16796)

(declare-fun b!169158 () Bool)

(declare-fun b_free!4103 () Bool)

(declare-fun b_next!4103 () Bool)

(assert (=> b!169158 (= b_free!4103 (not b_next!4103))))

(declare-fun tp!14915 () Bool)

(declare-fun b_and!10517 () Bool)

(assert (=> b!169158 (= tp!14915 b_and!10517)))

(declare-fun b!169163 () Bool)

(declare-fun b_free!4105 () Bool)

(declare-fun b_next!4105 () Bool)

(assert (=> b!169163 (= b_free!4105 (not b_next!4105))))

(declare-fun tp!14914 () Bool)

(declare-fun b_and!10519 () Bool)

(assert (=> b!169163 (= tp!14914 b_and!10519)))

(declare-fun b!169154 () Bool)

(declare-fun e!111366 () Bool)

(declare-fun tp_is_empty!3903 () Bool)

(assert (=> b!169154 (= e!111366 tp_is_empty!3903)))

(declare-fun b!169155 () Bool)

(declare-fun res!80494 () Bool)

(declare-fun e!111368 () Bool)

(assert (=> b!169155 (=> (not res!80494) (not e!111368))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169155 (= res!80494 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6578 () Bool)

(declare-fun mapRes!6578 () Bool)

(declare-fun tp!14913 () Bool)

(declare-fun e!111367 () Bool)

(assert (=> mapNonEmpty!6578 (= mapRes!6578 (and tp!14913 e!111367))))

(declare-datatypes ((V!4851 0))(
  ( (V!4852 (val!1996 Int)) )
))
(declare-datatypes ((ValueCell!1608 0))(
  ( (ValueCellFull!1608 (v!3861 V!4851)) (EmptyCell!1608) )
))
(declare-fun mapValue!6579 () ValueCell!1608)

(declare-datatypes ((array!6903 0))(
  ( (array!6904 (arr!3287 (Array (_ BitVec 32) (_ BitVec 64))) (size!3575 (_ BitVec 32))) )
))
(declare-datatypes ((array!6905 0))(
  ( (array!6906 (arr!3288 (Array (_ BitVec 32) ValueCell!1608)) (size!3576 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2124 0))(
  ( (LongMapFixedSize!2125 (defaultEntry!3504 Int) (mask!8283 (_ BitVec 32)) (extraKeys!3245 (_ BitVec 32)) (zeroValue!3347 V!4851) (minValue!3347 V!4851) (_size!1111 (_ BitVec 32)) (_keys!5329 array!6903) (_values!3487 array!6905) (_vacant!1111 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3196 0))(
  ( (tuple2!3197 (_1!1609 Bool) (_2!1609 LongMapFixedSize!2124)) )
))
(declare-fun err!43 () tuple2!3196)

(declare-fun mapRest!6578 () (Array (_ BitVec 32) ValueCell!1608))

(declare-fun mapKey!6578 () (_ BitVec 32))

(assert (=> mapNonEmpty!6578 (= (arr!3288 (_values!3487 (_2!1609 err!43))) (store mapRest!6578 mapKey!6578 mapValue!6579))))

(declare-fun res!80496 () Bool)

(assert (=> start!16796 (=> (not res!80496) (not e!111368))))

(declare-fun thiss!1248 () LongMapFixedSize!2124)

(declare-fun valid!919 (LongMapFixedSize!2124) Bool)

(assert (=> start!16796 (= res!80496 (valid!919 thiss!1248))))

(assert (=> start!16796 e!111368))

(declare-fun e!111363 () Bool)

(assert (=> start!16796 e!111363))

(assert (=> start!16796 true))

(declare-fun b!169156 () Bool)

(declare-fun e!111372 () Bool)

(assert (=> b!169156 (= e!111368 e!111372)))

(declare-fun res!80495 () Bool)

(assert (=> b!169156 (=> (not res!80495) (not e!111372))))

(declare-datatypes ((SeekEntryResult!519 0))(
  ( (MissingZero!519 (index!4244 (_ BitVec 32))) (Found!519 (index!4245 (_ BitVec 32))) (Intermediate!519 (undefined!1331 Bool) (index!4246 (_ BitVec 32)) (x!18691 (_ BitVec 32))) (Undefined!519) (MissingVacant!519 (index!4247 (_ BitVec 32))) )
))
(declare-fun lt!84852 () SeekEntryResult!519)

(get-info :version)

(assert (=> b!169156 (= res!80495 (and (not ((_ is Undefined!519) lt!84852)) (not ((_ is MissingVacant!519) lt!84852)) (not ((_ is MissingZero!519) lt!84852)) (not ((_ is Found!519) lt!84852))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6903 (_ BitVec 32)) SeekEntryResult!519)

(assert (=> b!169156 (= lt!84852 (seekEntryOrOpen!0 key!828 (_keys!5329 thiss!1248) (mask!8283 thiss!1248)))))

(declare-fun b!169157 () Bool)

(assert (=> b!169157 (= e!111372 false)))

(declare-fun lt!84853 () Bool)

(assert (=> b!169157 (= lt!84853 (valid!919 (_2!1609 err!43)))))

(assert (=> b!169157 true))

(declare-fun e!111373 () Bool)

(assert (=> b!169157 e!111373))

(declare-fun mapNonEmpty!6579 () Bool)

(declare-fun mapRes!6579 () Bool)

(declare-fun tp!14916 () Bool)

(declare-fun e!111371 () Bool)

(assert (=> mapNonEmpty!6579 (= mapRes!6579 (and tp!14916 e!111371))))

(declare-fun mapKey!6579 () (_ BitVec 32))

(declare-fun mapValue!6578 () ValueCell!1608)

(declare-fun mapRest!6579 () (Array (_ BitVec 32) ValueCell!1608))

(assert (=> mapNonEmpty!6579 (= (arr!3288 (_values!3487 thiss!1248)) (store mapRest!6579 mapKey!6579 mapValue!6578))))

(declare-fun e!111365 () Bool)

(declare-fun array_inv!2113 (array!6903) Bool)

(declare-fun array_inv!2114 (array!6905) Bool)

(assert (=> b!169158 (= e!111373 (and tp!14915 tp_is_empty!3903 (array_inv!2113 (_keys!5329 (_2!1609 err!43))) (array_inv!2114 (_values!3487 (_2!1609 err!43))) e!111365))))

(declare-fun b!169159 () Bool)

(assert (=> b!169159 (= e!111371 tp_is_empty!3903)))

(declare-fun mapIsEmpty!6578 () Bool)

(assert (=> mapIsEmpty!6578 mapRes!6579))

(declare-fun b!169160 () Bool)

(assert (=> b!169160 (= e!111367 tp_is_empty!3903)))

(declare-fun b!169161 () Bool)

(declare-fun e!111369 () Bool)

(assert (=> b!169161 (= e!111369 tp_is_empty!3903)))

(declare-fun b!169162 () Bool)

(declare-fun e!111370 () Bool)

(assert (=> b!169162 (= e!111370 (and e!111369 mapRes!6579))))

(declare-fun condMapEmpty!6578 () Bool)

(declare-fun mapDefault!6579 () ValueCell!1608)

(assert (=> b!169162 (= condMapEmpty!6578 (= (arr!3288 (_values!3487 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1608)) mapDefault!6579)))))

(declare-fun mapIsEmpty!6579 () Bool)

(assert (=> mapIsEmpty!6579 mapRes!6578))

(assert (=> b!169163 (= e!111363 (and tp!14914 tp_is_empty!3903 (array_inv!2113 (_keys!5329 thiss!1248)) (array_inv!2114 (_values!3487 thiss!1248)) e!111370))))

(declare-fun b!169164 () Bool)

(assert (=> b!169164 (= e!111365 (and e!111366 mapRes!6578))))

(declare-fun condMapEmpty!6579 () Bool)

(declare-fun mapDefault!6578 () ValueCell!1608)

(assert (=> b!169164 (= condMapEmpty!6579 (= (arr!3288 (_values!3487 (_2!1609 err!43))) ((as const (Array (_ BitVec 32) ValueCell!1608)) mapDefault!6578)))))

(assert (= (and start!16796 res!80496) b!169155))

(assert (= (and b!169155 res!80494) b!169156))

(assert (= (and b!169156 res!80495) b!169157))

(assert (= (and b!169164 condMapEmpty!6579) mapIsEmpty!6579))

(assert (= (and b!169164 (not condMapEmpty!6579)) mapNonEmpty!6578))

(assert (= (and mapNonEmpty!6578 ((_ is ValueCellFull!1608) mapValue!6579)) b!169160))

(assert (= (and b!169164 ((_ is ValueCellFull!1608) mapDefault!6578)) b!169154))

(assert (= b!169158 b!169164))

(assert (= b!169157 b!169158))

(assert (= (and b!169162 condMapEmpty!6578) mapIsEmpty!6578))

(assert (= (and b!169162 (not condMapEmpty!6578)) mapNonEmpty!6579))

(assert (= (and mapNonEmpty!6579 ((_ is ValueCellFull!1608) mapValue!6578)) b!169159))

(assert (= (and b!169162 ((_ is ValueCellFull!1608) mapDefault!6579)) b!169161))

(assert (= b!169163 b!169162))

(assert (= start!16796 b!169163))

(declare-fun m!198297 () Bool)

(assert (=> mapNonEmpty!6578 m!198297))

(declare-fun m!198299 () Bool)

(assert (=> b!169158 m!198299))

(declare-fun m!198301 () Bool)

(assert (=> b!169158 m!198301))

(declare-fun m!198303 () Bool)

(assert (=> b!169163 m!198303))

(declare-fun m!198305 () Bool)

(assert (=> b!169163 m!198305))

(declare-fun m!198307 () Bool)

(assert (=> b!169156 m!198307))

(declare-fun m!198309 () Bool)

(assert (=> b!169157 m!198309))

(declare-fun m!198311 () Bool)

(assert (=> start!16796 m!198311))

(declare-fun m!198313 () Bool)

(assert (=> mapNonEmpty!6579 m!198313))

(check-sat (not mapNonEmpty!6579) b_and!10519 (not mapNonEmpty!6578) (not b!169163) tp_is_empty!3903 (not b!169158) b_and!10517 (not b!169156) (not start!16796) (not b!169157) (not b_next!4105) (not b_next!4103))
(check-sat b_and!10517 b_and!10519 (not b_next!4105) (not b_next!4103))
