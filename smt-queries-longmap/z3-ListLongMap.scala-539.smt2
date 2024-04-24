; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13822 () Bool)

(assert start!13822)

(declare-fun b!127663 () Bool)

(declare-fun b_free!2857 () Bool)

(declare-fun b_next!2857 () Bool)

(assert (=> b!127663 (= b_free!2857 (not b_next!2857))))

(declare-fun tp!10985 () Bool)

(declare-fun b_and!7865 () Bool)

(assert (=> b!127663 (= tp!10985 b_and!7865)))

(declare-fun b!127660 () Bool)

(declare-fun b_free!2859 () Bool)

(declare-fun b_next!2859 () Bool)

(assert (=> b!127660 (= b_free!2859 (not b_next!2859))))

(declare-fun tp!10987 () Bool)

(declare-fun b_and!7867 () Bool)

(assert (=> b!127660 (= tp!10987 b_and!7867)))

(declare-fun b!127651 () Bool)

(declare-fun res!61687 () Bool)

(declare-fun e!83331 () Bool)

(assert (=> b!127651 (=> (not res!61687) (not e!83331))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3441 0))(
  ( (V!3442 (val!1467 Int)) )
))
(declare-datatypes ((array!4695 0))(
  ( (array!4696 (arr!2222 (Array (_ BitVec 32) (_ BitVec 64))) (size!2487 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1079 0))(
  ( (ValueCellFull!1079 (v!3139 V!3441)) (EmptyCell!1079) )
))
(declare-datatypes ((array!4697 0))(
  ( (array!4698 (arr!2223 (Array (_ BitVec 32) ValueCell!1079)) (size!2488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1066 0))(
  ( (LongMapFixedSize!1067 (defaultEntry!2801 Int) (mask!7067 (_ BitVec 32)) (extraKeys!2578 (_ BitVec 32)) (zeroValue!2662 V!3441) (minValue!2662 V!3441) (_size!582 (_ BitVec 32)) (_keys!4538 array!4695) (_values!2784 array!4697) (_vacant!582 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!862 0))(
  ( (Cell!863 (v!3140 LongMapFixedSize!1066)) )
))
(declare-datatypes ((LongMap!862 0))(
  ( (LongMap!863 (underlying!442 Cell!862)) )
))
(declare-fun thiss!992 () LongMap!862)

(assert (=> b!127651 (= res!61687 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2487 (_keys!4538 (v!3140 (underlying!442 thiss!992)))))))))

(declare-fun b!127652 () Bool)

(declare-fun res!61686 () Bool)

(declare-fun e!83325 () Bool)

(assert (=> b!127652 (=> (not res!61686) (not e!83325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127652 (= res!61686 (validMask!0 (mask!7067 (v!3140 (underlying!442 thiss!992)))))))

(declare-fun b!127653 () Bool)

(declare-fun e!83322 () Bool)

(declare-fun e!83330 () Bool)

(declare-fun mapRes!4520 () Bool)

(assert (=> b!127653 (= e!83322 (and e!83330 mapRes!4520))))

(declare-fun condMapEmpty!4520 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1066)

(declare-fun mapDefault!4519 () ValueCell!1079)

(assert (=> b!127653 (= condMapEmpty!4520 (= (arr!2223 (_values!2784 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1079)) mapDefault!4519)))))

(declare-fun b!127654 () Bool)

(declare-fun e!83326 () Bool)

(declare-fun e!83324 () Bool)

(assert (=> b!127654 (= e!83326 e!83324)))

(declare-fun b!127655 () Bool)

(declare-fun e!83328 () Bool)

(declare-fun tp_is_empty!2845 () Bool)

(assert (=> b!127655 (= e!83328 tp_is_empty!2845)))

(declare-fun mapIsEmpty!4519 () Bool)

(declare-fun mapRes!4519 () Bool)

(assert (=> mapIsEmpty!4519 mapRes!4519))

(declare-fun mapNonEmpty!4519 () Bool)

(declare-fun tp!10988 () Bool)

(declare-fun e!83334 () Bool)

(assert (=> mapNonEmpty!4519 (= mapRes!4519 (and tp!10988 e!83334))))

(declare-fun mapValue!4519 () ValueCell!1079)

(declare-fun mapKey!4520 () (_ BitVec 32))

(declare-fun mapRest!4520 () (Array (_ BitVec 32) ValueCell!1079))

(assert (=> mapNonEmpty!4519 (= (arr!2223 (_values!2784 (v!3140 (underlying!442 thiss!992)))) (store mapRest!4520 mapKey!4520 mapValue!4519))))

(declare-fun b!127656 () Bool)

(declare-fun res!61683 () Bool)

(assert (=> b!127656 (=> (not res!61683) (not e!83331))))

(declare-fun valid!525 (LongMapFixedSize!1066) Bool)

(assert (=> b!127656 (= res!61683 (valid!525 newMap!16))))

(declare-fun mapNonEmpty!4520 () Bool)

(declare-fun tp!10986 () Bool)

(assert (=> mapNonEmpty!4520 (= mapRes!4520 (and tp!10986 e!83328))))

(declare-fun mapValue!4520 () ValueCell!1079)

(declare-fun mapRest!4519 () (Array (_ BitVec 32) ValueCell!1079))

(declare-fun mapKey!4519 () (_ BitVec 32))

(assert (=> mapNonEmpty!4520 (= (arr!2223 (_values!2784 newMap!16)) (store mapRest!4519 mapKey!4519 mapValue!4520))))

(declare-fun b!127657 () Bool)

(declare-fun e!83335 () Bool)

(assert (=> b!127657 (= e!83335 e!83325)))

(declare-fun res!61682 () Bool)

(assert (=> b!127657 (=> (not res!61682) (not e!83325))))

(declare-datatypes ((tuple2!2532 0))(
  ( (tuple2!2533 (_1!1277 (_ BitVec 64)) (_2!1277 V!3441)) )
))
(declare-datatypes ((List!1681 0))(
  ( (Nil!1678) (Cons!1677 (h!2280 tuple2!2532) (t!6040 List!1681)) )
))
(declare-datatypes ((ListLongMap!1637 0))(
  ( (ListLongMap!1638 (toList!834 List!1681)) )
))
(declare-fun lt!66065 () ListLongMap!1637)

(declare-fun contains!868 (ListLongMap!1637 (_ BitVec 64)) Bool)

(assert (=> b!127657 (= res!61682 (contains!868 lt!66065 (select (arr!2222 (_keys!4538 (v!3140 (underlying!442 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2534 0))(
  ( (tuple2!2535 (_1!1278 Bool) (_2!1278 LongMapFixedSize!1066)) )
))
(declare-fun lt!66066 () tuple2!2534)

(declare-fun update!188 (LongMapFixedSize!1066 (_ BitVec 64) V!3441) tuple2!2534)

(declare-fun get!1459 (ValueCell!1079 V!3441) V!3441)

(declare-fun dynLambda!418 (Int (_ BitVec 64)) V!3441)

(assert (=> b!127657 (= lt!66066 (update!188 newMap!16 (select (arr!2222 (_keys!4538 (v!3140 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2223 (_values!2784 (v!3140 (underlying!442 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2801 (v!3140 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127658 () Bool)

(declare-fun e!83333 () Bool)

(assert (=> b!127658 (= e!83333 tp_is_empty!2845)))

(declare-fun b!127659 () Bool)

(assert (=> b!127659 (= e!83331 e!83335)))

(declare-fun res!61684 () Bool)

(assert (=> b!127659 (=> (not res!61684) (not e!83335))))

(declare-fun lt!66064 () ListLongMap!1637)

(assert (=> b!127659 (= res!61684 (and (= lt!66064 lt!66065) (not (= (select (arr!2222 (_keys!4538 (v!3140 (underlying!442 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2222 (_keys!4538 (v!3140 (underlying!442 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1383 (LongMapFixedSize!1066) ListLongMap!1637)

(assert (=> b!127659 (= lt!66065 (map!1383 newMap!16))))

(declare-fun getCurrentListMap!513 (array!4695 array!4697 (_ BitVec 32) (_ BitVec 32) V!3441 V!3441 (_ BitVec 32) Int) ListLongMap!1637)

(assert (=> b!127659 (= lt!66064 (getCurrentListMap!513 (_keys!4538 (v!3140 (underlying!442 thiss!992))) (_values!2784 (v!3140 (underlying!442 thiss!992))) (mask!7067 (v!3140 (underlying!442 thiss!992))) (extraKeys!2578 (v!3140 (underlying!442 thiss!992))) (zeroValue!2662 (v!3140 (underlying!442 thiss!992))) (minValue!2662 (v!3140 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2801 (v!3140 (underlying!442 thiss!992)))))))

(declare-fun e!83329 () Bool)

(declare-fun array_inv!1393 (array!4695) Bool)

(declare-fun array_inv!1394 (array!4697) Bool)

(assert (=> b!127660 (= e!83329 (and tp!10987 tp_is_empty!2845 (array_inv!1393 (_keys!4538 newMap!16)) (array_inv!1394 (_values!2784 newMap!16)) e!83322))))

(declare-fun b!127661 () Bool)

(assert (=> b!127661 (= e!83325 (and (= (size!2488 (_values!2784 (v!3140 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7067 (v!3140 (underlying!442 thiss!992))))) (= (size!2487 (_keys!4538 (v!3140 (underlying!442 thiss!992)))) (size!2488 (_values!2784 (v!3140 (underlying!442 thiss!992))))) (bvslt (mask!7067 (v!3140 (underlying!442 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!4520 () Bool)

(assert (=> mapIsEmpty!4520 mapRes!4520))

(declare-fun b!127662 () Bool)

(declare-fun e!83332 () Bool)

(assert (=> b!127662 (= e!83324 e!83332)))

(declare-fun e!83321 () Bool)

(assert (=> b!127663 (= e!83332 (and tp!10985 tp_is_empty!2845 (array_inv!1393 (_keys!4538 (v!3140 (underlying!442 thiss!992)))) (array_inv!1394 (_values!2784 (v!3140 (underlying!442 thiss!992)))) e!83321))))

(declare-fun b!127664 () Bool)

(assert (=> b!127664 (= e!83330 tp_is_empty!2845)))

(declare-fun b!127665 () Bool)

(assert (=> b!127665 (= e!83321 (and e!83333 mapRes!4519))))

(declare-fun condMapEmpty!4519 () Bool)

(declare-fun mapDefault!4520 () ValueCell!1079)

(assert (=> b!127665 (= condMapEmpty!4519 (= (arr!2223 (_values!2784 (v!3140 (underlying!442 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1079)) mapDefault!4520)))))

(declare-fun b!127666 () Bool)

(declare-fun res!61681 () Bool)

(assert (=> b!127666 (=> (not res!61681) (not e!83331))))

(assert (=> b!127666 (= res!61681 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7067 newMap!16)) (_size!582 (v!3140 (underlying!442 thiss!992)))))))

(declare-fun b!127667 () Bool)

(assert (=> b!127667 (= e!83334 tp_is_empty!2845)))

(declare-fun res!61685 () Bool)

(assert (=> start!13822 (=> (not res!61685) (not e!83331))))

(declare-fun valid!526 (LongMap!862) Bool)

(assert (=> start!13822 (= res!61685 (valid!526 thiss!992))))

(assert (=> start!13822 e!83331))

(assert (=> start!13822 e!83326))

(assert (=> start!13822 true))

(assert (=> start!13822 e!83329))

(assert (= (and start!13822 res!61685) b!127651))

(assert (= (and b!127651 res!61687) b!127656))

(assert (= (and b!127656 res!61683) b!127666))

(assert (= (and b!127666 res!61681) b!127659))

(assert (= (and b!127659 res!61684) b!127657))

(assert (= (and b!127657 res!61682) b!127652))

(assert (= (and b!127652 res!61686) b!127661))

(assert (= (and b!127665 condMapEmpty!4519) mapIsEmpty!4519))

(assert (= (and b!127665 (not condMapEmpty!4519)) mapNonEmpty!4519))

(get-info :version)

(assert (= (and mapNonEmpty!4519 ((_ is ValueCellFull!1079) mapValue!4519)) b!127667))

(assert (= (and b!127665 ((_ is ValueCellFull!1079) mapDefault!4520)) b!127658))

(assert (= b!127663 b!127665))

(assert (= b!127662 b!127663))

(assert (= b!127654 b!127662))

(assert (= start!13822 b!127654))

(assert (= (and b!127653 condMapEmpty!4520) mapIsEmpty!4520))

(assert (= (and b!127653 (not condMapEmpty!4520)) mapNonEmpty!4520))

(assert (= (and mapNonEmpty!4520 ((_ is ValueCellFull!1079) mapValue!4520)) b!127655))

(assert (= (and b!127653 ((_ is ValueCellFull!1079) mapDefault!4519)) b!127664))

(assert (= b!127660 b!127653))

(assert (= start!13822 b!127660))

(declare-fun b_lambda!5655 () Bool)

(assert (=> (not b_lambda!5655) (not b!127657)))

(declare-fun t!6037 () Bool)

(declare-fun tb!2321 () Bool)

(assert (=> (and b!127663 (= (defaultEntry!2801 (v!3140 (underlying!442 thiss!992))) (defaultEntry!2801 (v!3140 (underlying!442 thiss!992)))) t!6037) tb!2321))

(declare-fun result!3851 () Bool)

(assert (=> tb!2321 (= result!3851 tp_is_empty!2845)))

(assert (=> b!127657 t!6037))

(declare-fun b_and!7869 () Bool)

(assert (= b_and!7865 (and (=> t!6037 result!3851) b_and!7869)))

(declare-fun t!6039 () Bool)

(declare-fun tb!2323 () Bool)

(assert (=> (and b!127660 (= (defaultEntry!2801 newMap!16) (defaultEntry!2801 (v!3140 (underlying!442 thiss!992)))) t!6039) tb!2323))

(declare-fun result!3855 () Bool)

(assert (= result!3855 result!3851))

(assert (=> b!127657 t!6039))

(declare-fun b_and!7871 () Bool)

(assert (= b_and!7867 (and (=> t!6039 result!3855) b_and!7871)))

(declare-fun m!149613 () Bool)

(assert (=> b!127657 m!149613))

(declare-fun m!149615 () Bool)

(assert (=> b!127657 m!149615))

(declare-fun m!149617 () Bool)

(assert (=> b!127657 m!149617))

(declare-fun m!149619 () Bool)

(assert (=> b!127657 m!149619))

(declare-fun m!149621 () Bool)

(assert (=> b!127657 m!149621))

(assert (=> b!127657 m!149619))

(assert (=> b!127657 m!149615))

(assert (=> b!127657 m!149619))

(assert (=> b!127657 m!149617))

(declare-fun m!149623 () Bool)

(assert (=> b!127657 m!149623))

(assert (=> b!127657 m!149613))

(assert (=> b!127659 m!149619))

(declare-fun m!149625 () Bool)

(assert (=> b!127659 m!149625))

(declare-fun m!149627 () Bool)

(assert (=> b!127659 m!149627))

(declare-fun m!149629 () Bool)

(assert (=> mapNonEmpty!4520 m!149629))

(declare-fun m!149631 () Bool)

(assert (=> mapNonEmpty!4519 m!149631))

(declare-fun m!149633 () Bool)

(assert (=> start!13822 m!149633))

(declare-fun m!149635 () Bool)

(assert (=> b!127663 m!149635))

(declare-fun m!149637 () Bool)

(assert (=> b!127663 m!149637))

(declare-fun m!149639 () Bool)

(assert (=> b!127660 m!149639))

(declare-fun m!149641 () Bool)

(assert (=> b!127660 m!149641))

(declare-fun m!149643 () Bool)

(assert (=> b!127656 m!149643))

(declare-fun m!149645 () Bool)

(assert (=> b!127652 m!149645))

(check-sat (not b!127659) (not b_lambda!5655) (not b!127660) (not b!127663) (not b!127657) (not b!127652) (not start!13822) b_and!7871 (not b!127656) b_and!7869 (not b_next!2859) (not mapNonEmpty!4520) tp_is_empty!2845 (not mapNonEmpty!4519) (not b_next!2857))
(check-sat b_and!7869 b_and!7871 (not b_next!2857) (not b_next!2859))
