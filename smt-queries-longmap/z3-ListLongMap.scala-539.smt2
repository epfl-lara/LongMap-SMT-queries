; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13822 () Bool)

(assert start!13822)

(declare-fun b!127562 () Bool)

(declare-fun b_free!2857 () Bool)

(declare-fun b_next!2857 () Bool)

(assert (=> b!127562 (= b_free!2857 (not b_next!2857))))

(declare-fun tp!10988 () Bool)

(declare-fun b_and!7845 () Bool)

(assert (=> b!127562 (= tp!10988 b_and!7845)))

(declare-fun b!127565 () Bool)

(declare-fun b_free!2859 () Bool)

(declare-fun b_next!2859 () Bool)

(assert (=> b!127565 (= b_free!2859 (not b_next!2859))))

(declare-fun tp!10985 () Bool)

(declare-fun b_and!7847 () Bool)

(assert (=> b!127565 (= tp!10985 b_and!7847)))

(declare-fun e!83269 () Bool)

(declare-fun tp_is_empty!2845 () Bool)

(declare-fun e!83264 () Bool)

(declare-datatypes ((V!3441 0))(
  ( (V!3442 (val!1467 Int)) )
))
(declare-datatypes ((array!4689 0))(
  ( (array!4690 (arr!2218 (Array (_ BitVec 32) (_ BitVec 64))) (size!2484 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1079 0))(
  ( (ValueCellFull!1079 (v!3131 V!3441)) (EmptyCell!1079) )
))
(declare-datatypes ((array!4691 0))(
  ( (array!4692 (arr!2219 (Array (_ BitVec 32) ValueCell!1079)) (size!2485 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1066 0))(
  ( (LongMapFixedSize!1067 (defaultEntry!2801 Int) (mask!7066 (_ BitVec 32)) (extraKeys!2578 (_ BitVec 32)) (zeroValue!2662 V!3441) (minValue!2662 V!3441) (_size!582 (_ BitVec 32)) (_keys!4537 array!4689) (_values!2784 array!4691) (_vacant!582 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!852 0))(
  ( (Cell!853 (v!3132 LongMapFixedSize!1066)) )
))
(declare-datatypes ((LongMap!852 0))(
  ( (LongMap!853 (underlying!437 Cell!852)) )
))
(declare-fun thiss!992 () LongMap!852)

(declare-fun array_inv!1411 (array!4689) Bool)

(declare-fun array_inv!1412 (array!4691) Bool)

(assert (=> b!127562 (= e!83264 (and tp!10988 tp_is_empty!2845 (array_inv!1411 (_keys!4537 (v!3132 (underlying!437 thiss!992)))) (array_inv!1412 (_values!2784 (v!3132 (underlying!437 thiss!992)))) e!83269))))

(declare-fun b!127563 () Bool)

(declare-fun e!83272 () Bool)

(declare-fun e!83270 () Bool)

(assert (=> b!127563 (= e!83272 e!83270)))

(declare-fun res!61626 () Bool)

(assert (=> b!127563 (=> (not res!61626) (not e!83270))))

(declare-datatypes ((tuple2!2550 0))(
  ( (tuple2!2551 (_1!1286 (_ BitVec 64)) (_2!1286 V!3441)) )
))
(declare-datatypes ((List!1695 0))(
  ( (Nil!1692) (Cons!1691 (h!2294 tuple2!2550) (t!6053 List!1695)) )
))
(declare-datatypes ((ListLongMap!1651 0))(
  ( (ListLongMap!1652 (toList!841 List!1695)) )
))
(declare-fun lt!65955 () ListLongMap!1651)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!871 (ListLongMap!1651 (_ BitVec 64)) Bool)

(assert (=> b!127563 (= res!61626 (contains!871 lt!65955 (select (arr!2218 (_keys!4537 (v!3132 (underlying!437 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2552 0))(
  ( (tuple2!2553 (_1!1287 Bool) (_2!1287 LongMapFixedSize!1066)) )
))
(declare-fun lt!65954 () tuple2!2552)

(declare-fun newMap!16 () LongMapFixedSize!1066)

(declare-fun update!185 (LongMapFixedSize!1066 (_ BitVec 64) V!3441) tuple2!2552)

(declare-fun get!1449 (ValueCell!1079 V!3441) V!3441)

(declare-fun dynLambda!411 (Int (_ BitVec 64)) V!3441)

(assert (=> b!127563 (= lt!65954 (update!185 newMap!16 (select (arr!2218 (_keys!4537 (v!3132 (underlying!437 thiss!992)))) from!355) (get!1449 (select (arr!2219 (_values!2784 (v!3132 (underlying!437 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2801 (v!3132 (underlying!437 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127564 () Bool)

(declare-fun e!83262 () Bool)

(declare-fun mapRes!4520 () Bool)

(assert (=> b!127564 (= e!83269 (and e!83262 mapRes!4520))))

(declare-fun condMapEmpty!4519 () Bool)

(declare-fun mapDefault!4519 () ValueCell!1079)

(assert (=> b!127564 (= condMapEmpty!4519 (= (arr!2219 (_values!2784 (v!3132 (underlying!437 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1079)) mapDefault!4519)))))

(declare-fun e!83265 () Bool)

(declare-fun e!83268 () Bool)

(assert (=> b!127565 (= e!83265 (and tp!10985 tp_is_empty!2845 (array_inv!1411 (_keys!4537 newMap!16)) (array_inv!1412 (_values!2784 newMap!16)) e!83268))))

(declare-fun b!127566 () Bool)

(assert (=> b!127566 (= e!83270 (and (= (size!2485 (_values!2784 (v!3132 (underlying!437 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7066 (v!3132 (underlying!437 thiss!992))))) (= (size!2484 (_keys!4537 (v!3132 (underlying!437 thiss!992)))) (size!2485 (_values!2784 (v!3132 (underlying!437 thiss!992))))) (bvslt (mask!7066 (v!3132 (underlying!437 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!127567 () Bool)

(declare-fun res!61627 () Bool)

(assert (=> b!127567 (=> (not res!61627) (not e!83270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127567 (= res!61627 (validMask!0 (mask!7066 (v!3132 (underlying!437 thiss!992)))))))

(declare-fun b!127568 () Bool)

(declare-fun e!83276 () Bool)

(declare-fun e!83274 () Bool)

(assert (=> b!127568 (= e!83276 e!83274)))

(declare-fun b!127569 () Bool)

(declare-fun res!61628 () Bool)

(declare-fun e!83267 () Bool)

(assert (=> b!127569 (=> (not res!61628) (not e!83267))))

(assert (=> b!127569 (= res!61628 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2484 (_keys!4537 (v!3132 (underlying!437 thiss!992)))))))))

(declare-fun b!127570 () Bool)

(declare-fun e!83271 () Bool)

(assert (=> b!127570 (= e!83271 tp_is_empty!2845)))

(declare-fun b!127571 () Bool)

(assert (=> b!127571 (= e!83274 e!83264)))

(declare-fun mapNonEmpty!4519 () Bool)

(declare-fun tp!10986 () Bool)

(declare-fun e!83263 () Bool)

(assert (=> mapNonEmpty!4519 (= mapRes!4520 (and tp!10986 e!83263))))

(declare-fun mapRest!4519 () (Array (_ BitVec 32) ValueCell!1079))

(declare-fun mapKey!4520 () (_ BitVec 32))

(declare-fun mapValue!4520 () ValueCell!1079)

(assert (=> mapNonEmpty!4519 (= (arr!2219 (_values!2784 (v!3132 (underlying!437 thiss!992)))) (store mapRest!4519 mapKey!4520 mapValue!4520))))

(declare-fun b!127572 () Bool)

(assert (=> b!127572 (= e!83267 e!83272)))

(declare-fun res!61629 () Bool)

(assert (=> b!127572 (=> (not res!61629) (not e!83272))))

(declare-fun lt!65953 () ListLongMap!1651)

(assert (=> b!127572 (= res!61629 (and (= lt!65953 lt!65955) (not (= (select (arr!2218 (_keys!4537 (v!3132 (underlying!437 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2218 (_keys!4537 (v!3132 (underlying!437 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1373 (LongMapFixedSize!1066) ListLongMap!1651)

(assert (=> b!127572 (= lt!65955 (map!1373 newMap!16))))

(declare-fun getCurrentListMap!511 (array!4689 array!4691 (_ BitVec 32) (_ BitVec 32) V!3441 V!3441 (_ BitVec 32) Int) ListLongMap!1651)

(assert (=> b!127572 (= lt!65953 (getCurrentListMap!511 (_keys!4537 (v!3132 (underlying!437 thiss!992))) (_values!2784 (v!3132 (underlying!437 thiss!992))) (mask!7066 (v!3132 (underlying!437 thiss!992))) (extraKeys!2578 (v!3132 (underlying!437 thiss!992))) (zeroValue!2662 (v!3132 (underlying!437 thiss!992))) (minValue!2662 (v!3132 (underlying!437 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2801 (v!3132 (underlying!437 thiss!992)))))))

(declare-fun res!61624 () Bool)

(assert (=> start!13822 (=> (not res!61624) (not e!83267))))

(declare-fun valid!513 (LongMap!852) Bool)

(assert (=> start!13822 (= res!61624 (valid!513 thiss!992))))

(assert (=> start!13822 e!83267))

(assert (=> start!13822 e!83276))

(assert (=> start!13822 true))

(assert (=> start!13822 e!83265))

(declare-fun b!127573 () Bool)

(assert (=> b!127573 (= e!83262 tp_is_empty!2845)))

(declare-fun mapNonEmpty!4520 () Bool)

(declare-fun mapRes!4519 () Bool)

(declare-fun tp!10987 () Bool)

(declare-fun e!83273 () Bool)

(assert (=> mapNonEmpty!4520 (= mapRes!4519 (and tp!10987 e!83273))))

(declare-fun mapValue!4519 () ValueCell!1079)

(declare-fun mapRest!4520 () (Array (_ BitVec 32) ValueCell!1079))

(declare-fun mapKey!4519 () (_ BitVec 32))

(assert (=> mapNonEmpty!4520 (= (arr!2219 (_values!2784 newMap!16)) (store mapRest!4520 mapKey!4519 mapValue!4519))))

(declare-fun b!127574 () Bool)

(assert (=> b!127574 (= e!83268 (and e!83271 mapRes!4519))))

(declare-fun condMapEmpty!4520 () Bool)

(declare-fun mapDefault!4520 () ValueCell!1079)

(assert (=> b!127574 (= condMapEmpty!4520 (= (arr!2219 (_values!2784 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1079)) mapDefault!4520)))))

(declare-fun b!127575 () Bool)

(assert (=> b!127575 (= e!83273 tp_is_empty!2845)))

(declare-fun mapIsEmpty!4519 () Bool)

(assert (=> mapIsEmpty!4519 mapRes!4519))

(declare-fun b!127576 () Bool)

(declare-fun res!61625 () Bool)

(assert (=> b!127576 (=> (not res!61625) (not e!83267))))

(declare-fun valid!514 (LongMapFixedSize!1066) Bool)

(assert (=> b!127576 (= res!61625 (valid!514 newMap!16))))

(declare-fun mapIsEmpty!4520 () Bool)

(assert (=> mapIsEmpty!4520 mapRes!4520))

(declare-fun b!127577 () Bool)

(declare-fun res!61630 () Bool)

(assert (=> b!127577 (=> (not res!61630) (not e!83267))))

(assert (=> b!127577 (= res!61630 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7066 newMap!16)) (_size!582 (v!3132 (underlying!437 thiss!992)))))))

(declare-fun b!127578 () Bool)

(assert (=> b!127578 (= e!83263 tp_is_empty!2845)))

(assert (= (and start!13822 res!61624) b!127569))

(assert (= (and b!127569 res!61628) b!127576))

(assert (= (and b!127576 res!61625) b!127577))

(assert (= (and b!127577 res!61630) b!127572))

(assert (= (and b!127572 res!61629) b!127563))

(assert (= (and b!127563 res!61626) b!127567))

(assert (= (and b!127567 res!61627) b!127566))

(assert (= (and b!127564 condMapEmpty!4519) mapIsEmpty!4520))

(assert (= (and b!127564 (not condMapEmpty!4519)) mapNonEmpty!4519))

(get-info :version)

(assert (= (and mapNonEmpty!4519 ((_ is ValueCellFull!1079) mapValue!4520)) b!127578))

(assert (= (and b!127564 ((_ is ValueCellFull!1079) mapDefault!4519)) b!127573))

(assert (= b!127562 b!127564))

(assert (= b!127571 b!127562))

(assert (= b!127568 b!127571))

(assert (= start!13822 b!127568))

(assert (= (and b!127574 condMapEmpty!4520) mapIsEmpty!4519))

(assert (= (and b!127574 (not condMapEmpty!4520)) mapNonEmpty!4520))

(assert (= (and mapNonEmpty!4520 ((_ is ValueCellFull!1079) mapValue!4519)) b!127575))

(assert (= (and b!127574 ((_ is ValueCellFull!1079) mapDefault!4520)) b!127570))

(assert (= b!127565 b!127574))

(assert (= start!13822 b!127565))

(declare-fun b_lambda!5635 () Bool)

(assert (=> (not b_lambda!5635) (not b!127563)))

(declare-fun t!6050 () Bool)

(declare-fun tb!2321 () Bool)

(assert (=> (and b!127562 (= (defaultEntry!2801 (v!3132 (underlying!437 thiss!992))) (defaultEntry!2801 (v!3132 (underlying!437 thiss!992)))) t!6050) tb!2321))

(declare-fun result!3851 () Bool)

(assert (=> tb!2321 (= result!3851 tp_is_empty!2845)))

(assert (=> b!127563 t!6050))

(declare-fun b_and!7849 () Bool)

(assert (= b_and!7845 (and (=> t!6050 result!3851) b_and!7849)))

(declare-fun t!6052 () Bool)

(declare-fun tb!2323 () Bool)

(assert (=> (and b!127565 (= (defaultEntry!2801 newMap!16) (defaultEntry!2801 (v!3132 (underlying!437 thiss!992)))) t!6052) tb!2323))

(declare-fun result!3855 () Bool)

(assert (= result!3855 result!3851))

(assert (=> b!127563 t!6052))

(declare-fun b_and!7851 () Bool)

(assert (= b_and!7847 (and (=> t!6052 result!3855) b_and!7851)))

(declare-fun m!149233 () Bool)

(assert (=> b!127567 m!149233))

(declare-fun m!149235 () Bool)

(assert (=> b!127565 m!149235))

(declare-fun m!149237 () Bool)

(assert (=> b!127565 m!149237))

(declare-fun m!149239 () Bool)

(assert (=> mapNonEmpty!4520 m!149239))

(declare-fun m!149241 () Bool)

(assert (=> b!127576 m!149241))

(declare-fun m!149243 () Bool)

(assert (=> b!127563 m!149243))

(declare-fun m!149245 () Bool)

(assert (=> b!127563 m!149245))

(declare-fun m!149247 () Bool)

(assert (=> b!127563 m!149247))

(declare-fun m!149249 () Bool)

(assert (=> b!127563 m!149249))

(declare-fun m!149251 () Bool)

(assert (=> b!127563 m!149251))

(assert (=> b!127563 m!149249))

(assert (=> b!127563 m!149245))

(assert (=> b!127563 m!149249))

(assert (=> b!127563 m!149247))

(declare-fun m!149253 () Bool)

(assert (=> b!127563 m!149253))

(assert (=> b!127563 m!149243))

(assert (=> b!127572 m!149249))

(declare-fun m!149255 () Bool)

(assert (=> b!127572 m!149255))

(declare-fun m!149257 () Bool)

(assert (=> b!127572 m!149257))

(declare-fun m!149259 () Bool)

(assert (=> b!127562 m!149259))

(declare-fun m!149261 () Bool)

(assert (=> b!127562 m!149261))

(declare-fun m!149263 () Bool)

(assert (=> start!13822 m!149263))

(declare-fun m!149265 () Bool)

(assert (=> mapNonEmpty!4519 m!149265))

(check-sat (not b_next!2857) (not b!127563) (not b!127576) (not b_next!2859) (not mapNonEmpty!4519) (not start!13822) (not b!127567) b_and!7849 (not mapNonEmpty!4520) (not b!127562) (not b!127572) tp_is_empty!2845 (not b_lambda!5635) b_and!7851 (not b!127565))
(check-sat b_and!7849 b_and!7851 (not b_next!2857) (not b_next!2859))
