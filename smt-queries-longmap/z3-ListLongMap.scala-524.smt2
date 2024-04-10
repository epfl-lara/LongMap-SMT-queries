; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13136 () Bool)

(assert start!13136)

(declare-fun b!115273 () Bool)

(declare-fun b_free!2681 () Bool)

(declare-fun b_next!2681 () Bool)

(assert (=> b!115273 (= b_free!2681 (not b_next!2681))))

(declare-fun tp!10406 () Bool)

(declare-fun b_and!7151 () Bool)

(assert (=> b!115273 (= tp!10406 b_and!7151)))

(declare-fun b!115275 () Bool)

(declare-fun b_free!2683 () Bool)

(declare-fun b_next!2683 () Bool)

(assert (=> b!115275 (= b_free!2683 (not b_next!2683))))

(declare-fun tp!10407 () Bool)

(declare-fun b_and!7153 () Bool)

(assert (=> b!115275 (= tp!10407 b_and!7153)))

(declare-fun mapIsEmpty!4203 () Bool)

(declare-fun mapRes!4203 () Bool)

(assert (=> mapIsEmpty!4203 mapRes!4203))

(declare-fun mapNonEmpty!4203 () Bool)

(declare-fun tp!10408 () Bool)

(declare-fun e!75127 () Bool)

(assert (=> mapNonEmpty!4203 (= mapRes!4203 (and tp!10408 e!75127))))

(declare-datatypes ((V!3323 0))(
  ( (V!3324 (val!1423 Int)) )
))
(declare-datatypes ((ValueCell!1035 0))(
  ( (ValueCellFull!1035 (v!3015 V!3323)) (EmptyCell!1035) )
))
(declare-fun mapValue!4203 () ValueCell!1035)

(declare-fun mapRest!4204 () (Array (_ BitVec 32) ValueCell!1035))

(declare-datatypes ((array!4517 0))(
  ( (array!4518 (arr!2141 (Array (_ BitVec 32) (_ BitVec 64))) (size!2401 (_ BitVec 32))) )
))
(declare-datatypes ((array!4519 0))(
  ( (array!4520 (arr!2142 (Array (_ BitVec 32) ValueCell!1035)) (size!2402 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!978 0))(
  ( (LongMapFixedSize!979 (defaultEntry!2698 Int) (mask!6902 (_ BitVec 32)) (extraKeys!2487 (_ BitVec 32)) (zeroValue!2565 V!3323) (minValue!2565 V!3323) (_size!538 (_ BitVec 32)) (_keys!4420 array!4517) (_values!2681 array!4519) (_vacant!538 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!778 0))(
  ( (Cell!779 (v!3016 LongMapFixedSize!978)) )
))
(declare-datatypes ((LongMap!778 0))(
  ( (LongMap!779 (underlying!400 Cell!778)) )
))
(declare-fun thiss!992 () LongMap!778)

(declare-fun mapKey!4204 () (_ BitVec 32))

(assert (=> mapNonEmpty!4203 (= (arr!2142 (_values!2681 (v!3016 (underlying!400 thiss!992)))) (store mapRest!4204 mapKey!4204 mapValue!4203))))

(declare-fun mapNonEmpty!4204 () Bool)

(declare-fun mapRes!4204 () Bool)

(declare-fun tp!10405 () Bool)

(declare-fun e!75123 () Bool)

(assert (=> mapNonEmpty!4204 (= mapRes!4204 (and tp!10405 e!75123))))

(declare-fun mapKey!4203 () (_ BitVec 32))

(declare-fun mapValue!4204 () ValueCell!1035)

(declare-fun mapRest!4203 () (Array (_ BitVec 32) ValueCell!1035))

(declare-fun newMap!16 () LongMapFixedSize!978)

(assert (=> mapNonEmpty!4204 (= (arr!2142 (_values!2681 newMap!16)) (store mapRest!4203 mapKey!4203 mapValue!4204))))

(declare-fun b!115267 () Bool)

(declare-fun e!75120 () Bool)

(declare-fun e!75132 () Bool)

(assert (=> b!115267 (= e!75120 e!75132)))

(declare-fun b!115268 () Bool)

(declare-fun res!56598 () Bool)

(declare-fun e!75121 () Bool)

(assert (=> b!115268 (=> (not res!56598) (not e!75121))))

(assert (=> b!115268 (= res!56598 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6902 newMap!16)) (_size!538 (v!3016 (underlying!400 thiss!992)))))))

(declare-fun b!115269 () Bool)

(declare-fun e!75124 () Bool)

(declare-fun tp_is_empty!2757 () Bool)

(assert (=> b!115269 (= e!75124 tp_is_empty!2757)))

(declare-fun b!115270 () Bool)

(declare-fun res!56599 () Bool)

(assert (=> b!115270 (=> (not res!56599) (not e!75121))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2512 0))(
  ( (tuple2!2513 (_1!1267 (_ BitVec 64)) (_2!1267 V!3323)) )
))
(declare-datatypes ((List!1668 0))(
  ( (Nil!1665) (Cons!1664 (h!2264 tuple2!2512) (t!5922 List!1668)) )
))
(declare-datatypes ((ListLongMap!1635 0))(
  ( (ListLongMap!1636 (toList!833 List!1668)) )
))
(declare-fun getCurrentListMap!514 (array!4517 array!4519 (_ BitVec 32) (_ BitVec 32) V!3323 V!3323 (_ BitVec 32) Int) ListLongMap!1635)

(declare-fun map!1337 (LongMapFixedSize!978) ListLongMap!1635)

(assert (=> b!115270 (= res!56599 (= (getCurrentListMap!514 (_keys!4420 (v!3016 (underlying!400 thiss!992))) (_values!2681 (v!3016 (underlying!400 thiss!992))) (mask!6902 (v!3016 (underlying!400 thiss!992))) (extraKeys!2487 (v!3016 (underlying!400 thiss!992))) (zeroValue!2565 (v!3016 (underlying!400 thiss!992))) (minValue!2565 (v!3016 (underlying!400 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2698 (v!3016 (underlying!400 thiss!992)))) (map!1337 newMap!16)))))

(declare-fun mapIsEmpty!4204 () Bool)

(assert (=> mapIsEmpty!4204 mapRes!4204))

(declare-fun b!115271 () Bool)

(declare-fun e!75126 () Bool)

(assert (=> b!115271 (= e!75126 tp_is_empty!2757)))

(declare-fun b!115272 () Bool)

(assert (=> b!115272 (= e!75123 tp_is_empty!2757)))

(declare-fun e!75131 () Bool)

(declare-fun e!75128 () Bool)

(declare-fun array_inv!1347 (array!4517) Bool)

(declare-fun array_inv!1348 (array!4519) Bool)

(assert (=> b!115273 (= e!75131 (and tp!10406 tp_is_empty!2757 (array_inv!1347 (_keys!4420 (v!3016 (underlying!400 thiss!992)))) (array_inv!1348 (_values!2681 (v!3016 (underlying!400 thiss!992)))) e!75128))))

(declare-fun b!115274 () Bool)

(declare-fun e!75125 () Bool)

(assert (=> b!115274 (= e!75125 (and e!75126 mapRes!4204))))

(declare-fun condMapEmpty!4203 () Bool)

(declare-fun mapDefault!4204 () ValueCell!1035)

(assert (=> b!115274 (= condMapEmpty!4203 (= (arr!2142 (_values!2681 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1035)) mapDefault!4204)))))

(declare-fun e!75129 () Bool)

(assert (=> b!115275 (= e!75129 (and tp!10407 tp_is_empty!2757 (array_inv!1347 (_keys!4420 newMap!16)) (array_inv!1348 (_values!2681 newMap!16)) e!75125))))

(declare-fun b!115276 () Bool)

(declare-fun res!56600 () Bool)

(assert (=> b!115276 (=> (not res!56600) (not e!75121))))

(declare-fun valid!463 (LongMapFixedSize!978) Bool)

(assert (=> b!115276 (= res!56600 (valid!463 newMap!16))))

(declare-fun b!115266 () Bool)

(assert (=> b!115266 (= e!75132 e!75131)))

(declare-fun res!56602 () Bool)

(assert (=> start!13136 (=> (not res!56602) (not e!75121))))

(declare-fun valid!464 (LongMap!778) Bool)

(assert (=> start!13136 (= res!56602 (valid!464 thiss!992))))

(assert (=> start!13136 e!75121))

(assert (=> start!13136 e!75120))

(assert (=> start!13136 true))

(assert (=> start!13136 e!75129))

(declare-fun b!115277 () Bool)

(assert (=> b!115277 (= e!75121 (and (or (= (select (arr!2141 (_keys!4420 (v!3016 (underlying!400 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2141 (_keys!4420 (v!3016 (underlying!400 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2401 (_keys!4420 (v!3016 (underlying!400 thiss!992)))))))))

(declare-fun b!115278 () Bool)

(declare-fun res!56601 () Bool)

(assert (=> b!115278 (=> (not res!56601) (not e!75121))))

(assert (=> b!115278 (= res!56601 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2401 (_keys!4420 (v!3016 (underlying!400 thiss!992)))))))))

(declare-fun b!115279 () Bool)

(assert (=> b!115279 (= e!75128 (and e!75124 mapRes!4203))))

(declare-fun condMapEmpty!4204 () Bool)

(declare-fun mapDefault!4203 () ValueCell!1035)

(assert (=> b!115279 (= condMapEmpty!4204 (= (arr!2142 (_values!2681 (v!3016 (underlying!400 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1035)) mapDefault!4203)))))

(declare-fun b!115280 () Bool)

(assert (=> b!115280 (= e!75127 tp_is_empty!2757)))

(assert (= (and start!13136 res!56602) b!115278))

(assert (= (and b!115278 res!56601) b!115276))

(assert (= (and b!115276 res!56600) b!115268))

(assert (= (and b!115268 res!56598) b!115270))

(assert (= (and b!115270 res!56599) b!115277))

(assert (= (and b!115279 condMapEmpty!4204) mapIsEmpty!4203))

(assert (= (and b!115279 (not condMapEmpty!4204)) mapNonEmpty!4203))

(get-info :version)

(assert (= (and mapNonEmpty!4203 ((_ is ValueCellFull!1035) mapValue!4203)) b!115280))

(assert (= (and b!115279 ((_ is ValueCellFull!1035) mapDefault!4203)) b!115269))

(assert (= b!115273 b!115279))

(assert (= b!115266 b!115273))

(assert (= b!115267 b!115266))

(assert (= start!13136 b!115267))

(assert (= (and b!115274 condMapEmpty!4203) mapIsEmpty!4204))

(assert (= (and b!115274 (not condMapEmpty!4203)) mapNonEmpty!4204))

(assert (= (and mapNonEmpty!4204 ((_ is ValueCellFull!1035) mapValue!4204)) b!115272))

(assert (= (and b!115274 ((_ is ValueCellFull!1035) mapDefault!4204)) b!115271))

(assert (= b!115275 b!115274))

(assert (= start!13136 b!115275))

(declare-fun m!131489 () Bool)

(assert (=> b!115276 m!131489))

(declare-fun m!131491 () Bool)

(assert (=> b!115273 m!131491))

(declare-fun m!131493 () Bool)

(assert (=> b!115273 m!131493))

(declare-fun m!131495 () Bool)

(assert (=> mapNonEmpty!4203 m!131495))

(declare-fun m!131497 () Bool)

(assert (=> b!115277 m!131497))

(declare-fun m!131499 () Bool)

(assert (=> b!115270 m!131499))

(declare-fun m!131501 () Bool)

(assert (=> b!115270 m!131501))

(declare-fun m!131503 () Bool)

(assert (=> start!13136 m!131503))

(declare-fun m!131505 () Bool)

(assert (=> b!115275 m!131505))

(declare-fun m!131507 () Bool)

(assert (=> b!115275 m!131507))

(declare-fun m!131509 () Bool)

(assert (=> mapNonEmpty!4204 m!131509))

(check-sat (not mapNonEmpty!4204) (not start!13136) (not mapNonEmpty!4203) b_and!7151 (not b!115275) tp_is_empty!2757 (not b!115276) (not b!115270) (not b_next!2681) (not b_next!2683) b_and!7153 (not b!115273))
(check-sat b_and!7151 b_and!7153 (not b_next!2681) (not b_next!2683))
