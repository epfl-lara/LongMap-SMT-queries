; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13230 () Bool)

(assert start!13230)

(declare-fun b!116680 () Bool)

(declare-fun b_free!2765 () Bool)

(declare-fun b_next!2765 () Bool)

(assert (=> b!116680 (= b_free!2765 (not b_next!2765))))

(declare-fun tp!10669 () Bool)

(declare-fun b_and!7271 () Bool)

(assert (=> b!116680 (= tp!10669 b_and!7271)))

(declare-fun b!116682 () Bool)

(declare-fun b_free!2767 () Bool)

(declare-fun b_next!2767 () Bool)

(assert (=> b!116682 (= b_free!2767 (not b_next!2767))))

(declare-fun tp!10668 () Bool)

(declare-fun b_and!7273 () Bool)

(assert (=> b!116682 (= tp!10668 b_and!7273)))

(declare-fun mapNonEmpty!4339 () Bool)

(declare-fun mapRes!4340 () Bool)

(declare-fun tp!10667 () Bool)

(declare-fun e!76238 () Bool)

(assert (=> mapNonEmpty!4339 (= mapRes!4340 (and tp!10667 e!76238))))

(declare-fun mapKey!4339 () (_ BitVec 32))

(declare-datatypes ((V!3379 0))(
  ( (V!3380 (val!1444 Int)) )
))
(declare-datatypes ((array!4605 0))(
  ( (array!4606 (arr!2183 (Array (_ BitVec 32) (_ BitVec 64))) (size!2444 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1056 0))(
  ( (ValueCellFull!1056 (v!3057 V!3379)) (EmptyCell!1056) )
))
(declare-datatypes ((array!4607 0))(
  ( (array!4608 (arr!2184 (Array (_ BitVec 32) ValueCell!1056)) (size!2445 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1020 0))(
  ( (LongMapFixedSize!1021 (defaultEntry!2722 Int) (mask!6942 (_ BitVec 32)) (extraKeys!2511 (_ BitVec 32)) (zeroValue!2589 V!3379) (minValue!2589 V!3379) (_size!559 (_ BitVec 32)) (_keys!4445 array!4605) (_values!2705 array!4607) (_vacant!559 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1020)

(declare-fun mapValue!4340 () ValueCell!1056)

(declare-fun mapRest!4339 () (Array (_ BitVec 32) ValueCell!1056))

(assert (=> mapNonEmpty!4339 (= (arr!2184 (_values!2705 newMap!16)) (store mapRest!4339 mapKey!4339 mapValue!4340))))

(declare-fun b!116674 () Bool)

(declare-fun e!76235 () Bool)

(declare-fun e!76228 () Bool)

(assert (=> b!116674 (= e!76235 e!76228)))

(declare-fun b!116675 () Bool)

(declare-fun e!76236 () Bool)

(declare-fun tp_is_empty!2799 () Bool)

(assert (=> b!116675 (= e!76236 tp_is_empty!2799)))

(declare-fun mapIsEmpty!4339 () Bool)

(declare-fun mapRes!4339 () Bool)

(assert (=> mapIsEmpty!4339 mapRes!4339))

(declare-fun b!116676 () Bool)

(declare-fun e!76233 () Bool)

(assert (=> b!116676 (= e!76233 e!76235)))

(declare-fun b!116677 () Bool)

(declare-fun e!76232 () Bool)

(declare-fun e!76229 () Bool)

(assert (=> b!116677 (= e!76232 (and e!76229 mapRes!4339))))

(declare-fun condMapEmpty!4340 () Bool)

(declare-datatypes ((Cell!818 0))(
  ( (Cell!819 (v!3058 LongMapFixedSize!1020)) )
))
(declare-datatypes ((LongMap!818 0))(
  ( (LongMap!819 (underlying!420 Cell!818)) )
))
(declare-fun thiss!992 () LongMap!818)

(declare-fun mapDefault!4340 () ValueCell!1056)

(assert (=> b!116677 (= condMapEmpty!4340 (= (arr!2184 (_values!2705 (v!3058 (underlying!420 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1056)) mapDefault!4340)))))

(declare-fun b!116678 () Bool)

(declare-fun e!76237 () Bool)

(assert (=> b!116678 (= e!76237 tp_is_empty!2799)))

(declare-fun b!116679 () Bool)

(declare-fun e!76230 () Bool)

(declare-fun valid!484 (LongMapFixedSize!1020) Bool)

(assert (=> b!116679 (= e!76230 (not (valid!484 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun res!57132 () Bool)

(assert (=> start!13230 (=> (not res!57132) (not e!76230))))

(declare-fun valid!485 (LongMap!818) Bool)

(assert (=> start!13230 (= res!57132 (valid!485 thiss!992))))

(assert (=> start!13230 e!76230))

(assert (=> start!13230 e!76233))

(assert (=> start!13230 true))

(declare-fun e!76239 () Bool)

(assert (=> start!13230 e!76239))

(declare-fun array_inv!1375 (array!4605) Bool)

(declare-fun array_inv!1376 (array!4607) Bool)

(assert (=> b!116680 (= e!76228 (and tp!10669 tp_is_empty!2799 (array_inv!1375 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (array_inv!1376 (_values!2705 (v!3058 (underlying!420 thiss!992)))) e!76232))))

(declare-fun b!116681 () Bool)

(declare-fun e!76227 () Bool)

(assert (=> b!116681 (= e!76227 (and e!76236 mapRes!4340))))

(declare-fun condMapEmpty!4339 () Bool)

(declare-fun mapDefault!4339 () ValueCell!1056)

(assert (=> b!116681 (= condMapEmpty!4339 (= (arr!2184 (_values!2705 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1056)) mapDefault!4339)))))

(assert (=> b!116682 (= e!76239 (and tp!10668 tp_is_empty!2799 (array_inv!1375 (_keys!4445 newMap!16)) (array_inv!1376 (_values!2705 newMap!16)) e!76227))))

(declare-fun b!116683 () Bool)

(assert (=> b!116683 (= e!76238 tp_is_empty!2799)))

(declare-fun b!116684 () Bool)

(declare-fun res!57134 () Bool)

(assert (=> b!116684 (=> (not res!57134) (not e!76230))))

(assert (=> b!116684 (= res!57134 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6942 newMap!16)) (_size!559 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun mapIsEmpty!4340 () Bool)

(assert (=> mapIsEmpty!4340 mapRes!4340))

(declare-fun b!116685 () Bool)

(declare-fun res!57135 () Bool)

(assert (=> b!116685 (=> (not res!57135) (not e!76230))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2544 0))(
  ( (tuple2!2545 (_1!1283 (_ BitVec 64)) (_2!1283 V!3379)) )
))
(declare-datatypes ((List!1682 0))(
  ( (Nil!1679) (Cons!1678 (h!2278 tuple2!2544) (t!5948 List!1682)) )
))
(declare-datatypes ((ListLongMap!1659 0))(
  ( (ListLongMap!1660 (toList!845 List!1682)) )
))
(declare-fun getCurrentListMap!526 (array!4605 array!4607 (_ BitVec 32) (_ BitVec 32) V!3379 V!3379 (_ BitVec 32) Int) ListLongMap!1659)

(declare-fun map!1363 (LongMapFixedSize!1020) ListLongMap!1659)

(assert (=> b!116685 (= res!57135 (= (getCurrentListMap!526 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (_values!2705 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992))) (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) (minValue!2589 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))) (map!1363 newMap!16)))))

(declare-fun b!116686 () Bool)

(declare-fun res!57130 () Bool)

(assert (=> b!116686 (=> (not res!57130) (not e!76230))))

(assert (=> b!116686 (= res!57130 (valid!484 newMap!16))))

(declare-fun b!116687 () Bool)

(declare-fun res!57131 () Bool)

(assert (=> b!116687 (=> (not res!57131) (not e!76230))))

(assert (=> b!116687 (= res!57131 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992)))))))))

(declare-fun mapNonEmpty!4340 () Bool)

(declare-fun tp!10670 () Bool)

(assert (=> mapNonEmpty!4340 (= mapRes!4339 (and tp!10670 e!76237))))

(declare-fun mapValue!4339 () ValueCell!1056)

(declare-fun mapKey!4340 () (_ BitVec 32))

(declare-fun mapRest!4340 () (Array (_ BitVec 32) ValueCell!1056))

(assert (=> mapNonEmpty!4340 (= (arr!2184 (_values!2705 (v!3058 (underlying!420 thiss!992)))) (store mapRest!4340 mapKey!4340 mapValue!4339))))

(declare-fun b!116688 () Bool)

(assert (=> b!116688 (= e!76229 tp_is_empty!2799)))

(declare-fun b!116689 () Bool)

(declare-fun res!57133 () Bool)

(assert (=> b!116689 (=> (not res!57133) (not e!76230))))

(assert (=> b!116689 (= res!57133 (and (or (= (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(assert (= (and start!13230 res!57132) b!116687))

(assert (= (and b!116687 res!57131) b!116686))

(assert (= (and b!116686 res!57130) b!116684))

(assert (= (and b!116684 res!57134) b!116685))

(assert (= (and b!116685 res!57135) b!116689))

(assert (= (and b!116689 res!57133) b!116679))

(assert (= (and b!116677 condMapEmpty!4340) mapIsEmpty!4339))

(assert (= (and b!116677 (not condMapEmpty!4340)) mapNonEmpty!4340))

(get-info :version)

(assert (= (and mapNonEmpty!4340 ((_ is ValueCellFull!1056) mapValue!4339)) b!116678))

(assert (= (and b!116677 ((_ is ValueCellFull!1056) mapDefault!4340)) b!116688))

(assert (= b!116680 b!116677))

(assert (= b!116674 b!116680))

(assert (= b!116676 b!116674))

(assert (= start!13230 b!116676))

(assert (= (and b!116681 condMapEmpty!4339) mapIsEmpty!4340))

(assert (= (and b!116681 (not condMapEmpty!4339)) mapNonEmpty!4339))

(assert (= (and mapNonEmpty!4339 ((_ is ValueCellFull!1056) mapValue!4340)) b!116683))

(assert (= (and b!116681 ((_ is ValueCellFull!1056) mapDefault!4339)) b!116675))

(assert (= b!116682 b!116681))

(assert (= start!13230 b!116682))

(declare-fun m!132683 () Bool)

(assert (=> b!116680 m!132683))

(declare-fun m!132685 () Bool)

(assert (=> b!116680 m!132685))

(declare-fun m!132687 () Bool)

(assert (=> b!116689 m!132687))

(declare-fun m!132689 () Bool)

(assert (=> b!116685 m!132689))

(declare-fun m!132691 () Bool)

(assert (=> b!116685 m!132691))

(declare-fun m!132693 () Bool)

(assert (=> b!116682 m!132693))

(declare-fun m!132695 () Bool)

(assert (=> b!116682 m!132695))

(declare-fun m!132697 () Bool)

(assert (=> mapNonEmpty!4340 m!132697))

(declare-fun m!132699 () Bool)

(assert (=> b!116686 m!132699))

(declare-fun m!132701 () Bool)

(assert (=> mapNonEmpty!4339 m!132701))

(declare-fun m!132703 () Bool)

(assert (=> b!116679 m!132703))

(declare-fun m!132705 () Bool)

(assert (=> start!13230 m!132705))

(check-sat (not start!13230) (not b_next!2765) (not b!116686) b_and!7271 tp_is_empty!2799 (not mapNonEmpty!4340) b_and!7273 (not b!116685) (not mapNonEmpty!4339) (not b!116682) (not b_next!2767) (not b!116680) (not b!116679))
(check-sat b_and!7271 b_and!7273 (not b_next!2765) (not b_next!2767))
(get-model)

(declare-fun d!32613 () Bool)

(assert (=> d!32613 (= (array_inv!1375 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvsge (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116680 d!32613))

(declare-fun d!32615 () Bool)

(assert (=> d!32615 (= (array_inv!1376 (_values!2705 (v!3058 (underlying!420 thiss!992)))) (bvsge (size!2445 (_values!2705 (v!3058 (underlying!420 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116680 d!32615))

(declare-fun d!32617 () Bool)

(declare-fun res!57160 () Bool)

(declare-fun e!76281 () Bool)

(assert (=> d!32617 (=> (not res!57160) (not e!76281))))

(declare-fun simpleValid!82 (LongMapFixedSize!1020) Bool)

(assert (=> d!32617 (= res!57160 (simpleValid!82 (v!3058 (underlying!420 thiss!992))))))

(assert (=> d!32617 (= (valid!484 (v!3058 (underlying!420 thiss!992))) e!76281)))

(declare-fun b!116744 () Bool)

(declare-fun res!57161 () Bool)

(assert (=> b!116744 (=> (not res!57161) (not e!76281))))

(declare-fun arrayCountValidKeys!0 (array!4605 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!116744 (= res!57161 (= (arrayCountValidKeys!0 (_keys!4445 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000000 (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992))))) (_size!559 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116745 () Bool)

(declare-fun res!57162 () Bool)

(assert (=> b!116745 (=> (not res!57162) (not e!76281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4605 (_ BitVec 32)) Bool)

(assert (=> b!116745 (= res!57162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116746 () Bool)

(declare-datatypes ((List!1684 0))(
  ( (Nil!1681) (Cons!1680 (h!2280 (_ BitVec 64)) (t!5954 List!1684)) )
))
(declare-fun arrayNoDuplicates!0 (array!4605 (_ BitVec 32) List!1684) Bool)

(assert (=> b!116746 (= e!76281 (arrayNoDuplicates!0 (_keys!4445 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000000 Nil!1681))))

(assert (= (and d!32617 res!57160) b!116744))

(assert (= (and b!116744 res!57161) b!116745))

(assert (= (and b!116745 res!57162) b!116746))

(declare-fun m!132731 () Bool)

(assert (=> d!32617 m!132731))

(declare-fun m!132733 () Bool)

(assert (=> b!116744 m!132733))

(declare-fun m!132735 () Bool)

(assert (=> b!116745 m!132735))

(declare-fun m!132737 () Bool)

(assert (=> b!116746 m!132737))

(assert (=> b!116679 d!32617))

(declare-fun d!32619 () Bool)

(assert (=> d!32619 (= (valid!485 thiss!992) (valid!484 (v!3058 (underlying!420 thiss!992))))))

(declare-fun bs!4742 () Bool)

(assert (= bs!4742 d!32619))

(assert (=> bs!4742 m!132703))

(assert (=> start!13230 d!32619))

(declare-fun d!32621 () Bool)

(assert (=> d!32621 (= (array_inv!1375 (_keys!4445 newMap!16)) (bvsge (size!2444 (_keys!4445 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116682 d!32621))

(declare-fun d!32623 () Bool)

(assert (=> d!32623 (= (array_inv!1376 (_values!2705 newMap!16)) (bvsge (size!2445 (_values!2705 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116682 d!32623))

(declare-fun d!32625 () Bool)

(declare-fun res!57163 () Bool)

(declare-fun e!76282 () Bool)

(assert (=> d!32625 (=> (not res!57163) (not e!76282))))

(assert (=> d!32625 (= res!57163 (simpleValid!82 newMap!16))))

(assert (=> d!32625 (= (valid!484 newMap!16) e!76282)))

(declare-fun b!116747 () Bool)

(declare-fun res!57164 () Bool)

(assert (=> b!116747 (=> (not res!57164) (not e!76282))))

(assert (=> b!116747 (= res!57164 (= (arrayCountValidKeys!0 (_keys!4445 newMap!16) #b00000000000000000000000000000000 (size!2444 (_keys!4445 newMap!16))) (_size!559 newMap!16)))))

(declare-fun b!116748 () Bool)

(declare-fun res!57165 () Bool)

(assert (=> b!116748 (=> (not res!57165) (not e!76282))))

(assert (=> b!116748 (= res!57165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4445 newMap!16) (mask!6942 newMap!16)))))

(declare-fun b!116749 () Bool)

(assert (=> b!116749 (= e!76282 (arrayNoDuplicates!0 (_keys!4445 newMap!16) #b00000000000000000000000000000000 Nil!1681))))

(assert (= (and d!32625 res!57163) b!116747))

(assert (= (and b!116747 res!57164) b!116748))

(assert (= (and b!116748 res!57165) b!116749))

(declare-fun m!132739 () Bool)

(assert (=> d!32625 m!132739))

(declare-fun m!132741 () Bool)

(assert (=> b!116747 m!132741))

(declare-fun m!132743 () Bool)

(assert (=> b!116748 m!132743))

(declare-fun m!132745 () Bool)

(assert (=> b!116749 m!132745))

(assert (=> b!116686 d!32625))

(declare-fun b!116792 () Bool)

(declare-fun e!76314 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!116792 (= e!76314 (validKeyInArray!0 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116793 () Bool)

(declare-fun e!76320 () Bool)

(declare-fun lt!60549 () ListLongMap!1659)

(declare-fun apply!106 (ListLongMap!1659 (_ BitVec 64)) V!3379)

(assert (=> b!116793 (= e!76320 (= (apply!106 lt!60549 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2589 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116794 () Bool)

(declare-fun e!76317 () Bool)

(declare-fun e!76321 () Bool)

(assert (=> b!116794 (= e!76317 e!76321)))

(declare-fun res!57191 () Bool)

(declare-fun call!12498 () Bool)

(assert (=> b!116794 (= res!57191 call!12498)))

(assert (=> b!116794 (=> (not res!57191) (not e!76321))))

(declare-fun c!20651 () Bool)

(declare-fun call!12495 () ListLongMap!1659)

(declare-fun c!20648 () Bool)

(declare-fun call!12493 () ListLongMap!1659)

(declare-fun call!12497 () ListLongMap!1659)

(declare-fun call!12496 () ListLongMap!1659)

(declare-fun bm!12490 () Bool)

(declare-fun +!164 (ListLongMap!1659 tuple2!2544) ListLongMap!1659)

(assert (=> bm!12490 (= call!12495 (+!164 (ite c!20648 call!12493 (ite c!20651 call!12497 call!12496)) (ite (or c!20648 c!20651) (tuple2!2545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2589 (v!3058 (underlying!420 thiss!992)))) (tuple2!2545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2589 (v!3058 (underlying!420 thiss!992)))))))))

(declare-fun bm!12491 () Bool)

(assert (=> bm!12491 (= call!12497 call!12493)))

(declare-fun b!116795 () Bool)

(declare-fun e!76319 () Bool)

(assert (=> b!116795 (= e!76319 (validKeyInArray!0 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116796 () Bool)

(declare-datatypes ((Unit!3620 0))(
  ( (Unit!3621) )
))
(declare-fun e!76312 () Unit!3620)

(declare-fun lt!60550 () Unit!3620)

(assert (=> b!116796 (= e!76312 lt!60550)))

(declare-fun lt!60560 () ListLongMap!1659)

(declare-fun getCurrentListMapNoExtraKeys!130 (array!4605 array!4607 (_ BitVec 32) (_ BitVec 32) V!3379 V!3379 (_ BitVec 32) Int) ListLongMap!1659)

(assert (=> b!116796 (= lt!60560 (getCurrentListMapNoExtraKeys!130 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (_values!2705 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992))) (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) (minValue!2589 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60542 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60547 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60547 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60558 () Unit!3620)

(declare-fun addStillContains!82 (ListLongMap!1659 (_ BitVec 64) V!3379 (_ BitVec 64)) Unit!3620)

(assert (=> b!116796 (= lt!60558 (addStillContains!82 lt!60560 lt!60542 (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) lt!60547))))

(declare-fun contains!865 (ListLongMap!1659 (_ BitVec 64)) Bool)

(assert (=> b!116796 (contains!865 (+!164 lt!60560 (tuple2!2545 lt!60542 (zeroValue!2589 (v!3058 (underlying!420 thiss!992))))) lt!60547)))

(declare-fun lt!60559 () Unit!3620)

(assert (=> b!116796 (= lt!60559 lt!60558)))

(declare-fun lt!60544 () ListLongMap!1659)

(assert (=> b!116796 (= lt!60544 (getCurrentListMapNoExtraKeys!130 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (_values!2705 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992))) (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) (minValue!2589 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60561 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60561 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60555 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60555 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60557 () Unit!3620)

(declare-fun addApplyDifferent!82 (ListLongMap!1659 (_ BitVec 64) V!3379 (_ BitVec 64)) Unit!3620)

(assert (=> b!116796 (= lt!60557 (addApplyDifferent!82 lt!60544 lt!60561 (minValue!2589 (v!3058 (underlying!420 thiss!992))) lt!60555))))

(assert (=> b!116796 (= (apply!106 (+!164 lt!60544 (tuple2!2545 lt!60561 (minValue!2589 (v!3058 (underlying!420 thiss!992))))) lt!60555) (apply!106 lt!60544 lt!60555))))

(declare-fun lt!60554 () Unit!3620)

(assert (=> b!116796 (= lt!60554 lt!60557)))

(declare-fun lt!60553 () ListLongMap!1659)

(assert (=> b!116796 (= lt!60553 (getCurrentListMapNoExtraKeys!130 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (_values!2705 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992))) (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) (minValue!2589 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60545 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60545 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60541 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60541 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60543 () Unit!3620)

(assert (=> b!116796 (= lt!60543 (addApplyDifferent!82 lt!60553 lt!60545 (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) lt!60541))))

(assert (=> b!116796 (= (apply!106 (+!164 lt!60553 (tuple2!2545 lt!60545 (zeroValue!2589 (v!3058 (underlying!420 thiss!992))))) lt!60541) (apply!106 lt!60553 lt!60541))))

(declare-fun lt!60540 () Unit!3620)

(assert (=> b!116796 (= lt!60540 lt!60543)))

(declare-fun lt!60551 () ListLongMap!1659)

(assert (=> b!116796 (= lt!60551 (getCurrentListMapNoExtraKeys!130 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (_values!2705 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992))) (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) (minValue!2589 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60548 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60548 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60552 () (_ BitVec 64))

(assert (=> b!116796 (= lt!60552 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!116796 (= lt!60550 (addApplyDifferent!82 lt!60551 lt!60548 (minValue!2589 (v!3058 (underlying!420 thiss!992))) lt!60552))))

(assert (=> b!116796 (= (apply!106 (+!164 lt!60551 (tuple2!2545 lt!60548 (minValue!2589 (v!3058 (underlying!420 thiss!992))))) lt!60552) (apply!106 lt!60551 lt!60552))))

(declare-fun b!116797 () Bool)

(assert (=> b!116797 (= e!76321 (= (apply!106 lt!60549 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2589 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun d!32627 () Bool)

(declare-fun e!76309 () Bool)

(assert (=> d!32627 e!76309))

(declare-fun res!57185 () Bool)

(assert (=> d!32627 (=> (not res!57185) (not e!76309))))

(assert (=> d!32627 (= res!57185 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992))))))))))

(declare-fun lt!60546 () ListLongMap!1659)

(assert (=> d!32627 (= lt!60549 lt!60546)))

(declare-fun lt!60556 () Unit!3620)

(assert (=> d!32627 (= lt!60556 e!76312)))

(declare-fun c!20646 () Bool)

(assert (=> d!32627 (= c!20646 e!76314)))

(declare-fun res!57189 () Bool)

(assert (=> d!32627 (=> (not res!57189) (not e!76314))))

(assert (=> d!32627 (= res!57189 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun e!76310 () ListLongMap!1659)

(assert (=> d!32627 (= lt!60546 e!76310)))

(assert (=> d!32627 (= c!20648 (and (not (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32627 (validMask!0 (mask!6942 (v!3058 (underlying!420 thiss!992))))))

(assert (=> d!32627 (= (getCurrentListMap!526 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (_values!2705 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992))) (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) (minValue!2589 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))) lt!60549)))

(declare-fun b!116798 () Bool)

(assert (=> b!116798 (= e!76317 (not call!12498))))

(declare-fun e!76318 () Bool)

(declare-fun b!116799 () Bool)

(declare-fun get!1411 (ValueCell!1056 V!3379) V!3379)

(declare-fun dynLambda!406 (Int (_ BitVec 64)) V!3379)

(assert (=> b!116799 (= e!76318 (= (apply!106 lt!60549 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1411 (select (arr!2184 (_values!2705 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!406 (defaultEntry!2722 (v!3058 (underlying!420 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!116799 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2445 (_values!2705 (v!3058 (underlying!420 thiss!992))))))))

(assert (=> b!116799 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun b!116800 () Bool)

(declare-fun e!76316 () Bool)

(assert (=> b!116800 (= e!76316 e!76318)))

(declare-fun res!57190 () Bool)

(assert (=> b!116800 (=> (not res!57190) (not e!76318))))

(assert (=> b!116800 (= res!57190 (contains!865 lt!60549 (select (arr!2183 (_keys!4445 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!116800 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun b!116801 () Bool)

(declare-fun e!76315 () Bool)

(assert (=> b!116801 (= e!76315 e!76320)))

(declare-fun res!57188 () Bool)

(declare-fun call!12499 () Bool)

(assert (=> b!116801 (= res!57188 call!12499)))

(assert (=> b!116801 (=> (not res!57188) (not e!76320))))

(declare-fun bm!12492 () Bool)

(assert (=> bm!12492 (= call!12498 (contains!865 lt!60549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12493 () Bool)

(assert (=> bm!12493 (= call!12493 (getCurrentListMapNoExtraKeys!130 (_keys!4445 (v!3058 (underlying!420 thiss!992))) (_values!2705 (v!3058 (underlying!420 thiss!992))) (mask!6942 (v!3058 (underlying!420 thiss!992))) (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) (zeroValue!2589 (v!3058 (underlying!420 thiss!992))) (minValue!2589 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116802 () Bool)

(declare-fun res!57186 () Bool)

(assert (=> b!116802 (=> (not res!57186) (not e!76309))))

(assert (=> b!116802 (= res!57186 e!76316)))

(declare-fun res!57192 () Bool)

(assert (=> b!116802 (=> res!57192 e!76316)))

(assert (=> b!116802 (= res!57192 (not e!76319))))

(declare-fun res!57184 () Bool)

(assert (=> b!116802 (=> (not res!57184) (not e!76319))))

(assert (=> b!116802 (= res!57184 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2444 (_keys!4445 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun bm!12494 () Bool)

(declare-fun call!12494 () ListLongMap!1659)

(assert (=> bm!12494 (= call!12494 call!12495)))

(declare-fun b!116803 () Bool)

(declare-fun e!76313 () ListLongMap!1659)

(assert (=> b!116803 (= e!76313 call!12494)))

(declare-fun b!116804 () Bool)

(assert (=> b!116804 (= e!76310 (+!164 call!12495 (tuple2!2545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2589 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun b!116805 () Bool)

(declare-fun e!76311 () ListLongMap!1659)

(assert (=> b!116805 (= e!76311 call!12496)))

(declare-fun b!116806 () Bool)

(assert (=> b!116806 (= e!76310 e!76313)))

(assert (=> b!116806 (= c!20651 (and (not (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116807 () Bool)

(declare-fun c!20649 () Bool)

(assert (=> b!116807 (= c!20649 (and (not (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!116807 (= e!76313 e!76311)))

(declare-fun bm!12495 () Bool)

(assert (=> bm!12495 (= call!12496 call!12497)))

(declare-fun b!116808 () Bool)

(declare-fun res!57187 () Bool)

(assert (=> b!116808 (=> (not res!57187) (not e!76309))))

(assert (=> b!116808 (= res!57187 e!76317)))

(declare-fun c!20650 () Bool)

(assert (=> b!116808 (= c!20650 (not (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!116809 () Bool)

(declare-fun Unit!3622 () Unit!3620)

(assert (=> b!116809 (= e!76312 Unit!3622)))

(declare-fun bm!12496 () Bool)

(assert (=> bm!12496 (= call!12499 (contains!865 lt!60549 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!116810 () Bool)

(assert (=> b!116810 (= e!76309 e!76315)))

(declare-fun c!20647 () Bool)

(assert (=> b!116810 (= c!20647 (not (= (bvand (extraKeys!2511 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116811 () Bool)

(assert (=> b!116811 (= e!76311 call!12494)))

(declare-fun b!116812 () Bool)

(assert (=> b!116812 (= e!76315 (not call!12499))))

(assert (= (and d!32627 c!20648) b!116804))

(assert (= (and d!32627 (not c!20648)) b!116806))

(assert (= (and b!116806 c!20651) b!116803))

(assert (= (and b!116806 (not c!20651)) b!116807))

(assert (= (and b!116807 c!20649) b!116811))

(assert (= (and b!116807 (not c!20649)) b!116805))

(assert (= (or b!116811 b!116805) bm!12495))

(assert (= (or b!116803 bm!12495) bm!12491))

(assert (= (or b!116803 b!116811) bm!12494))

(assert (= (or b!116804 bm!12491) bm!12493))

(assert (= (or b!116804 bm!12494) bm!12490))

(assert (= (and d!32627 res!57189) b!116792))

(assert (= (and d!32627 c!20646) b!116796))

(assert (= (and d!32627 (not c!20646)) b!116809))

(assert (= (and d!32627 res!57185) b!116802))

(assert (= (and b!116802 res!57184) b!116795))

(assert (= (and b!116802 (not res!57192)) b!116800))

(assert (= (and b!116800 res!57190) b!116799))

(assert (= (and b!116802 res!57186) b!116808))

(assert (= (and b!116808 c!20650) b!116794))

(assert (= (and b!116808 (not c!20650)) b!116798))

(assert (= (and b!116794 res!57191) b!116797))

(assert (= (or b!116794 b!116798) bm!12492))

(assert (= (and b!116808 res!57187) b!116810))

(assert (= (and b!116810 c!20647) b!116801))

(assert (= (and b!116810 (not c!20647)) b!116812))

(assert (= (and b!116801 res!57188) b!116793))

(assert (= (or b!116801 b!116812) bm!12496))

(declare-fun b_lambda!5179 () Bool)

(assert (=> (not b_lambda!5179) (not b!116799)))

(declare-fun t!5951 () Bool)

(declare-fun tb!2233 () Bool)

(assert (=> (and b!116680 (= (defaultEntry!2722 (v!3058 (underlying!420 thiss!992))) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))) t!5951) tb!2233))

(declare-fun result!3723 () Bool)

(assert (=> tb!2233 (= result!3723 tp_is_empty!2799)))

(assert (=> b!116799 t!5951))

(declare-fun b_and!7279 () Bool)

(assert (= b_and!7271 (and (=> t!5951 result!3723) b_and!7279)))

(declare-fun t!5953 () Bool)

(declare-fun tb!2235 () Bool)

(assert (=> (and b!116682 (= (defaultEntry!2722 newMap!16) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992)))) t!5953) tb!2235))

(declare-fun result!3727 () Bool)

(assert (= result!3727 result!3723))

(assert (=> b!116799 t!5953))

(declare-fun b_and!7281 () Bool)

(assert (= b_and!7273 (and (=> t!5953 result!3727) b_and!7281)))

(declare-fun m!132747 () Bool)

(assert (=> bm!12492 m!132747))

(declare-fun m!132749 () Bool)

(assert (=> b!116799 m!132749))

(declare-fun m!132751 () Bool)

(assert (=> b!116799 m!132751))

(declare-fun m!132753 () Bool)

(assert (=> b!116799 m!132753))

(declare-fun m!132755 () Bool)

(assert (=> b!116799 m!132755))

(assert (=> b!116799 m!132749))

(declare-fun m!132757 () Bool)

(assert (=> b!116799 m!132757))

(assert (=> b!116799 m!132753))

(assert (=> b!116799 m!132751))

(assert (=> b!116792 m!132749))

(assert (=> b!116792 m!132749))

(declare-fun m!132759 () Bool)

(assert (=> b!116792 m!132759))

(assert (=> b!116800 m!132749))

(assert (=> b!116800 m!132749))

(declare-fun m!132761 () Bool)

(assert (=> b!116800 m!132761))

(assert (=> b!116796 m!132749))

(declare-fun m!132763 () Bool)

(assert (=> b!116796 m!132763))

(declare-fun m!132765 () Bool)

(assert (=> b!116796 m!132765))

(declare-fun m!132767 () Bool)

(assert (=> b!116796 m!132767))

(assert (=> b!116796 m!132763))

(declare-fun m!132769 () Bool)

(assert (=> b!116796 m!132769))

(declare-fun m!132771 () Bool)

(assert (=> b!116796 m!132771))

(declare-fun m!132773 () Bool)

(assert (=> b!116796 m!132773))

(declare-fun m!132775 () Bool)

(assert (=> b!116796 m!132775))

(assert (=> b!116796 m!132767))

(declare-fun m!132777 () Bool)

(assert (=> b!116796 m!132777))

(declare-fun m!132779 () Bool)

(assert (=> b!116796 m!132779))

(declare-fun m!132781 () Bool)

(assert (=> b!116796 m!132781))

(declare-fun m!132783 () Bool)

(assert (=> b!116796 m!132783))

(declare-fun m!132785 () Bool)

(assert (=> b!116796 m!132785))

(assert (=> b!116796 m!132785))

(declare-fun m!132787 () Bool)

(assert (=> b!116796 m!132787))

(assert (=> b!116796 m!132781))

(declare-fun m!132789 () Bool)

(assert (=> b!116796 m!132789))

(declare-fun m!132791 () Bool)

(assert (=> b!116796 m!132791))

(declare-fun m!132793 () Bool)

(assert (=> b!116796 m!132793))

(declare-fun m!132795 () Bool)

(assert (=> bm!12490 m!132795))

(declare-fun m!132797 () Bool)

(assert (=> b!116793 m!132797))

(declare-fun m!132799 () Bool)

(assert (=> b!116797 m!132799))

(assert (=> b!116795 m!132749))

(assert (=> b!116795 m!132749))

(assert (=> b!116795 m!132759))

(assert (=> bm!12493 m!132791))

(declare-fun m!132801 () Bool)

(assert (=> bm!12496 m!132801))

(declare-fun m!132803 () Bool)

(assert (=> d!32627 m!132803))

(declare-fun m!132805 () Bool)

(assert (=> b!116804 m!132805))

(assert (=> b!116685 d!32627))

(declare-fun d!32629 () Bool)

(assert (=> d!32629 (= (map!1363 newMap!16) (getCurrentListMap!526 (_keys!4445 newMap!16) (_values!2705 newMap!16) (mask!6942 newMap!16) (extraKeys!2511 newMap!16) (zeroValue!2589 newMap!16) (minValue!2589 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2722 newMap!16)))))

(declare-fun bs!4743 () Bool)

(assert (= bs!4743 d!32629))

(declare-fun m!132807 () Bool)

(assert (=> bs!4743 m!132807))

(assert (=> b!116685 d!32629))

(declare-fun mapIsEmpty!4349 () Bool)

(declare-fun mapRes!4349 () Bool)

(assert (=> mapIsEmpty!4349 mapRes!4349))

(declare-fun mapNonEmpty!4349 () Bool)

(declare-fun tp!10685 () Bool)

(declare-fun e!76326 () Bool)

(assert (=> mapNonEmpty!4349 (= mapRes!4349 (and tp!10685 e!76326))))

(declare-fun mapRest!4349 () (Array (_ BitVec 32) ValueCell!1056))

(declare-fun mapValue!4349 () ValueCell!1056)

(declare-fun mapKey!4349 () (_ BitVec 32))

(assert (=> mapNonEmpty!4349 (= mapRest!4340 (store mapRest!4349 mapKey!4349 mapValue!4349))))

(declare-fun b!116821 () Bool)

(assert (=> b!116821 (= e!76326 tp_is_empty!2799)))

(declare-fun condMapEmpty!4349 () Bool)

(declare-fun mapDefault!4349 () ValueCell!1056)

(assert (=> mapNonEmpty!4340 (= condMapEmpty!4349 (= mapRest!4340 ((as const (Array (_ BitVec 32) ValueCell!1056)) mapDefault!4349)))))

(declare-fun e!76327 () Bool)

(assert (=> mapNonEmpty!4340 (= tp!10670 (and e!76327 mapRes!4349))))

(declare-fun b!116822 () Bool)

(assert (=> b!116822 (= e!76327 tp_is_empty!2799)))

(assert (= (and mapNonEmpty!4340 condMapEmpty!4349) mapIsEmpty!4349))

(assert (= (and mapNonEmpty!4340 (not condMapEmpty!4349)) mapNonEmpty!4349))

(assert (= (and mapNonEmpty!4349 ((_ is ValueCellFull!1056) mapValue!4349)) b!116821))

(assert (= (and mapNonEmpty!4340 ((_ is ValueCellFull!1056) mapDefault!4349)) b!116822))

(declare-fun m!132809 () Bool)

(assert (=> mapNonEmpty!4349 m!132809))

(declare-fun mapIsEmpty!4350 () Bool)

(declare-fun mapRes!4350 () Bool)

(assert (=> mapIsEmpty!4350 mapRes!4350))

(declare-fun mapNonEmpty!4350 () Bool)

(declare-fun tp!10686 () Bool)

(declare-fun e!76328 () Bool)

(assert (=> mapNonEmpty!4350 (= mapRes!4350 (and tp!10686 e!76328))))

(declare-fun mapRest!4350 () (Array (_ BitVec 32) ValueCell!1056))

(declare-fun mapKey!4350 () (_ BitVec 32))

(declare-fun mapValue!4350 () ValueCell!1056)

(assert (=> mapNonEmpty!4350 (= mapRest!4339 (store mapRest!4350 mapKey!4350 mapValue!4350))))

(declare-fun b!116823 () Bool)

(assert (=> b!116823 (= e!76328 tp_is_empty!2799)))

(declare-fun condMapEmpty!4350 () Bool)

(declare-fun mapDefault!4350 () ValueCell!1056)

(assert (=> mapNonEmpty!4339 (= condMapEmpty!4350 (= mapRest!4339 ((as const (Array (_ BitVec 32) ValueCell!1056)) mapDefault!4350)))))

(declare-fun e!76329 () Bool)

(assert (=> mapNonEmpty!4339 (= tp!10667 (and e!76329 mapRes!4350))))

(declare-fun b!116824 () Bool)

(assert (=> b!116824 (= e!76329 tp_is_empty!2799)))

(assert (= (and mapNonEmpty!4339 condMapEmpty!4350) mapIsEmpty!4350))

(assert (= (and mapNonEmpty!4339 (not condMapEmpty!4350)) mapNonEmpty!4350))

(assert (= (and mapNonEmpty!4350 ((_ is ValueCellFull!1056) mapValue!4350)) b!116823))

(assert (= (and mapNonEmpty!4339 ((_ is ValueCellFull!1056) mapDefault!4350)) b!116824))

(declare-fun m!132811 () Bool)

(assert (=> mapNonEmpty!4350 m!132811))

(declare-fun b_lambda!5181 () Bool)

(assert (= b_lambda!5179 (or (and b!116680 b_free!2765) (and b!116682 b_free!2767 (= (defaultEntry!2722 newMap!16) (defaultEntry!2722 (v!3058 (underlying!420 thiss!992))))) b_lambda!5181)))

(check-sat (not b!116804) (not b_next!2767) (not b!116799) (not b!116748) (not bm!12496) (not b!116797) (not bm!12493) (not bm!12490) b_and!7279 (not d!32619) (not b!116793) (not b_next!2765) (not b!116746) (not d!32629) (not b!116796) (not b!116744) tp_is_empty!2799 (not b_lambda!5181) (not d!32617) (not b!116747) (not d!32627) (not mapNonEmpty!4349) (not b!116795) (not b!116749) (not b!116800) (not d!32625) b_and!7281 (not mapNonEmpty!4350) (not b!116745) (not bm!12492) (not b!116792))
(check-sat b_and!7279 b_and!7281 (not b_next!2765) (not b_next!2767))
