; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3456 () Bool)

(assert start!3456)

(declare-fun b!22611 () Bool)

(declare-fun b_free!745 () Bool)

(declare-fun b_next!745 () Bool)

(assert (=> b!22611 (= b_free!745 (not b_next!745))))

(declare-fun tp!3478 () Bool)

(declare-fun b_and!1457 () Bool)

(assert (=> b!22611 (= tp!3478 b_and!1457)))

(declare-fun c!2803 () Bool)

(declare-fun c!2802 () Bool)

(declare-datatypes ((V!1171 0))(
  ( (V!1172 (val!531 Int)) )
))
(declare-datatypes ((ValueCell!305 0))(
  ( (ValueCellFull!305 (v!1587 V!1171)) (EmptyCell!305) )
))
(declare-datatypes ((array!1235 0))(
  ( (array!1236 (arr!584 (Array (_ BitVec 32) ValueCell!305)) (size!680 (_ BitVec 32))) )
))
(declare-datatypes ((array!1237 0))(
  ( (array!1238 (arr!585 (Array (_ BitVec 32) (_ BitVec 64))) (size!681 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!196 0))(
  ( (LongMapFixedSize!197 (defaultEntry!1735 Int) (mask!4717 (_ BitVec 32)) (extraKeys!1634 (_ BitVec 32)) (zeroValue!1659 V!1171) (minValue!1659 V!1171) (_size!142 (_ BitVec 32)) (_keys!3157 array!1237) (_values!1722 array!1235) (_vacant!142 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!196 0))(
  ( (Cell!197 (v!1588 LongMapFixedSize!196)) )
))
(declare-datatypes ((LongMap!196 0))(
  ( (LongMap!197 (underlying!109 Cell!196)) )
))
(declare-fun thiss!938 () LongMap!196)

(declare-datatypes ((tuple2!934 0))(
  ( (tuple2!935 (_1!473 Bool) (_2!473 LongMapFixedSize!196)) )
))
(declare-fun call!1718 () tuple2!934)

(declare-fun lt!7825 () LongMapFixedSize!196)

(declare-fun lt!7824 () tuple2!934)

(declare-fun bm!1714 () Bool)

(declare-fun update!34 (LongMapFixedSize!196 (_ BitVec 64) V!1171) tuple2!934)

(assert (=> bm!1714 (= call!1718 (update!34 (ite c!2803 (_2!473 lt!7824) lt!7825) (ite c!2803 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2802 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2803 (minValue!1659 (v!1588 (underlying!109 thiss!938))) (ite c!2802 (zeroValue!1659 (v!1588 (underlying!109 thiss!938))) (minValue!1659 (v!1588 (underlying!109 thiss!938)))))))))

(declare-fun b!22603 () Bool)

(declare-fun e!14658 () Bool)

(declare-fun e!14667 () Bool)

(assert (=> b!22603 (= e!14658 e!14667)))

(declare-fun b!22604 () Bool)

(declare-fun e!14656 () Bool)

(declare-fun tp_is_empty!1009 () Bool)

(assert (=> b!22604 (= e!14656 tp_is_empty!1009)))

(declare-fun b!22605 () Bool)

(declare-fun lt!7821 () tuple2!934)

(declare-fun call!1717 () tuple2!934)

(assert (=> b!22605 (= lt!7821 call!1717)))

(declare-datatypes ((tuple2!936 0))(
  ( (tuple2!937 (_1!474 Bool) (_2!474 Cell!196)) )
))
(declare-fun e!14664 () tuple2!936)

(assert (=> b!22605 (= e!14664 (tuple2!937 (_1!473 lt!7821) (Cell!197 (_2!473 lt!7821))))))

(declare-fun b!22606 () Bool)

(declare-fun e!14662 () tuple2!936)

(declare-fun lt!7817 () tuple2!934)

(assert (=> b!22606 (= e!14662 (tuple2!937 (and (_1!473 lt!7824) (_1!473 lt!7817)) (Cell!197 (_2!473 lt!7817))))))

(assert (=> b!22606 (= lt!7824 (update!34 lt!7825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1659 (v!1588 (underlying!109 thiss!938)))))))

(assert (=> b!22606 (= lt!7817 call!1718)))

(declare-fun res!14194 () Bool)

(declare-fun e!14659 () Bool)

(assert (=> start!3456 (=> (not res!14194) (not e!14659))))

(declare-fun valid!110 (LongMap!196) Bool)

(assert (=> start!3456 (= res!14194 (valid!110 thiss!938))))

(assert (=> start!3456 e!14659))

(declare-fun e!14665 () Bool)

(assert (=> start!3456 e!14665))

(declare-fun b!22607 () Bool)

(assert (=> b!22607 (= e!14665 e!14658)))

(declare-fun b!22608 () Bool)

(assert (=> b!22608 (= e!14662 e!14664)))

(declare-fun lt!7826 () Bool)

(assert (=> b!22608 (= c!2802 (and (not lt!7826) (= (bvand (extraKeys!1634 (v!1588 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22609 () Bool)

(declare-fun e!14666 () tuple2!936)

(declare-fun lt!7818 () tuple2!934)

(assert (=> b!22609 (= e!14666 (tuple2!937 (_1!473 lt!7818) (Cell!197 (_2!473 lt!7818))))))

(assert (=> b!22609 (= lt!7818 call!1717)))

(declare-fun b!22610 () Bool)

(assert (=> b!22610 (= e!14666 (tuple2!937 true (Cell!197 lt!7825)))))

(declare-fun mapNonEmpty!1001 () Bool)

(declare-fun mapRes!1001 () Bool)

(declare-fun tp!3479 () Bool)

(declare-fun e!14660 () Bool)

(assert (=> mapNonEmpty!1001 (= mapRes!1001 (and tp!3479 e!14660))))

(declare-fun mapValue!1001 () ValueCell!305)

(declare-fun mapRest!1001 () (Array (_ BitVec 32) ValueCell!305))

(declare-fun mapKey!1001 () (_ BitVec 32))

(assert (=> mapNonEmpty!1001 (= (arr!584 (_values!1722 (v!1588 (underlying!109 thiss!938)))) (store mapRest!1001 mapKey!1001 mapValue!1001))))

(declare-fun mapIsEmpty!1001 () Bool)

(assert (=> mapIsEmpty!1001 mapRes!1001))

(declare-fun e!14663 () Bool)

(declare-fun array_inv!413 (array!1237) Bool)

(declare-fun array_inv!414 (array!1235) Bool)

(assert (=> b!22611 (= e!14667 (and tp!3478 tp_is_empty!1009 (array_inv!413 (_keys!3157 (v!1588 (underlying!109 thiss!938)))) (array_inv!414 (_values!1722 (v!1588 (underlying!109 thiss!938)))) e!14663))))

(declare-fun lt!7822 () Cell!196)

(declare-fun b!22612 () Bool)

(declare-fun lt!7820 () tuple2!934)

(declare-datatypes ((tuple3!12 0))(
  ( (tuple3!13 (_1!475 Bool) (_2!475 Cell!196) (_3!6 LongMap!196)) )
))
(declare-fun e!14661 () tuple3!12)

(assert (=> b!22612 (= e!14661 (ite (_1!473 lt!7820) (tuple3!13 true (underlying!109 thiss!938) (LongMap!197 lt!7822)) (tuple3!13 false lt!7822 thiss!938)))))

(declare-fun lt!7823 () tuple2!936)

(declare-fun repackFrom!6 (LongMap!196 LongMapFixedSize!196 (_ BitVec 32)) tuple2!934)

(assert (=> b!22612 (= lt!7820 (repackFrom!6 thiss!938 (v!1588 (_2!474 lt!7823)) (bvsub (size!681 (_keys!3157 (v!1588 (underlying!109 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22612 (= lt!7822 (Cell!197 (_2!473 lt!7820)))))

(declare-fun b!22613 () Bool)

(assert (=> b!22613 (= e!14659 false)))

(declare-fun lt!7819 () tuple3!12)

(assert (=> b!22613 (= lt!7819 e!14661)))

(declare-fun c!2804 () Bool)

(assert (=> b!22613 (= c!2804 (not (_1!474 lt!7823)))))

(assert (=> b!22613 (= lt!7823 e!14662)))

(assert (=> b!22613 (= c!2803 (and (not lt!7826) (not (= (bvand (extraKeys!1634 (v!1588 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22613 (= lt!7826 (= (bvand (extraKeys!1634 (v!1588 (underlying!109 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!30 ((_ BitVec 32) Int) LongMapFixedSize!196)

(declare-fun computeNewMask!27 (LongMap!196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22613 (= lt!7825 (getNewLongMapFixedSize!30 (computeNewMask!27 thiss!938 (mask!4717 (v!1588 (underlying!109 thiss!938))) (_vacant!142 (v!1588 (underlying!109 thiss!938))) (_size!142 (v!1588 (underlying!109 thiss!938)))) (defaultEntry!1735 (v!1588 (underlying!109 thiss!938)))))))

(declare-fun b!22614 () Bool)

(assert (=> b!22614 (= e!14663 (and e!14656 mapRes!1001))))

(declare-fun condMapEmpty!1001 () Bool)

(declare-fun mapDefault!1001 () ValueCell!305)

(assert (=> b!22614 (= condMapEmpty!1001 (= (arr!584 (_values!1722 (v!1588 (underlying!109 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!305)) mapDefault!1001)))))

(declare-fun b!22615 () Bool)

(assert (=> b!22615 (= e!14660 tp_is_empty!1009)))

(declare-fun b!22616 () Bool)

(declare-fun c!2805 () Bool)

(assert (=> b!22616 (= c!2805 (and (not (= (bvand (extraKeys!1634 (v!1588 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7826))))

(assert (=> b!22616 (= e!14664 e!14666)))

(declare-fun b!22617 () Bool)

(assert (=> b!22617 (= e!14661 (tuple3!13 false (_2!474 lt!7823) thiss!938))))

(declare-fun bm!1715 () Bool)

(assert (=> bm!1715 (= call!1717 call!1718)))

(assert (= (and start!3456 res!14194) b!22613))

(assert (= (and b!22613 c!2803) b!22606))

(assert (= (and b!22613 (not c!2803)) b!22608))

(assert (= (and b!22608 c!2802) b!22605))

(assert (= (and b!22608 (not c!2802)) b!22616))

(assert (= (and b!22616 c!2805) b!22609))

(assert (= (and b!22616 (not c!2805)) b!22610))

(assert (= (or b!22605 b!22609) bm!1715))

(assert (= (or b!22606 bm!1715) bm!1714))

(assert (= (and b!22613 c!2804) b!22617))

(assert (= (and b!22613 (not c!2804)) b!22612))

(assert (= (and b!22614 condMapEmpty!1001) mapIsEmpty!1001))

(assert (= (and b!22614 (not condMapEmpty!1001)) mapNonEmpty!1001))

(get-info :version)

(assert (= (and mapNonEmpty!1001 ((_ is ValueCellFull!305) mapValue!1001)) b!22615))

(assert (= (and b!22614 ((_ is ValueCellFull!305) mapDefault!1001)) b!22604))

(assert (= b!22611 b!22614))

(assert (= b!22603 b!22611))

(assert (= b!22607 b!22603))

(assert (= start!3456 b!22607))

(declare-fun m!16396 () Bool)

(assert (=> mapNonEmpty!1001 m!16396))

(declare-fun m!16398 () Bool)

(assert (=> b!22606 m!16398))

(declare-fun m!16400 () Bool)

(assert (=> start!3456 m!16400))

(declare-fun m!16402 () Bool)

(assert (=> b!22611 m!16402))

(declare-fun m!16404 () Bool)

(assert (=> b!22611 m!16404))

(declare-fun m!16406 () Bool)

(assert (=> b!22612 m!16406))

(declare-fun m!16408 () Bool)

(assert (=> b!22613 m!16408))

(assert (=> b!22613 m!16408))

(declare-fun m!16410 () Bool)

(assert (=> b!22613 m!16410))

(declare-fun m!16412 () Bool)

(assert (=> bm!1714 m!16412))

(check-sat (not b_next!745) (not mapNonEmpty!1001) (not start!3456) (not bm!1714) (not b!22613) (not b!22611) (not b!22612) b_and!1457 (not b!22606) tp_is_empty!1009)
(check-sat b_and!1457 (not b_next!745))
