; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3462 () Bool)

(assert start!3462)

(declare-fun b!22633 () Bool)

(declare-fun b_free!745 () Bool)

(declare-fun b_next!745 () Bool)

(assert (=> b!22633 (= b_free!745 (not b_next!745))))

(declare-fun tp!3478 () Bool)

(declare-fun b_and!1457 () Bool)

(assert (=> b!22633 (= tp!3478 b_and!1457)))

(declare-fun bm!1714 () Bool)

(declare-datatypes ((V!1171 0))(
  ( (V!1172 (val!531 Int)) )
))
(declare-datatypes ((ValueCell!305 0))(
  ( (ValueCellFull!305 (v!1588 V!1171)) (EmptyCell!305) )
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
(declare-datatypes ((tuple2!932 0))(
  ( (tuple2!933 (_1!472 Bool) (_2!472 LongMapFixedSize!196)) )
))
(declare-fun call!1717 () tuple2!932)

(declare-fun call!1718 () tuple2!932)

(assert (=> bm!1714 (= call!1717 call!1718)))

(declare-fun b!22627 () Bool)

(declare-datatypes ((Cell!196 0))(
  ( (Cell!197 (v!1589 LongMapFixedSize!196)) )
))
(declare-datatypes ((tuple2!934 0))(
  ( (tuple2!935 (_1!473 Bool) (_2!473 Cell!196)) )
))
(declare-fun e!14674 () tuple2!934)

(declare-fun e!14681 () tuple2!934)

(assert (=> b!22627 (= e!14674 e!14681)))

(declare-fun c!2810 () Bool)

(declare-fun lt!7828 () Bool)

(declare-datatypes ((LongMap!196 0))(
  ( (LongMap!197 (underlying!109 Cell!196)) )
))
(declare-fun thiss!938 () LongMap!196)

(assert (=> b!22627 (= c!2810 (and (not lt!7828) (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22628 () Bool)

(declare-fun c!2812 () Bool)

(assert (=> b!22628 (= c!2812 (and (not (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7828))))

(declare-fun e!14673 () tuple2!934)

(assert (=> b!22628 (= e!14681 e!14673)))

(declare-fun b!22629 () Bool)

(declare-fun lt!7821 () Cell!196)

(declare-fun lt!7824 () tuple2!932)

(declare-datatypes ((tuple3!12 0))(
  ( (tuple3!13 (_1!474 Bool) (_2!474 Cell!196) (_3!6 LongMap!196)) )
))
(declare-fun e!14678 () tuple3!12)

(assert (=> b!22629 (= e!14678 (ite (_1!472 lt!7824) (tuple3!13 true (underlying!109 thiss!938) (LongMap!197 lt!7821)) (tuple3!13 false lt!7821 thiss!938)))))

(declare-fun lt!7827 () tuple2!934)

(declare-fun repackFrom!5 (LongMap!196 LongMapFixedSize!196 (_ BitVec 32)) tuple2!932)

(assert (=> b!22629 (= lt!7824 (repackFrom!5 thiss!938 (v!1589 (_2!473 lt!7827)) (bvsub (size!681 (_keys!3157 (v!1589 (underlying!109 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22629 (= lt!7821 (Cell!197 (_2!472 lt!7824)))))

(declare-fun mapIsEmpty!1001 () Bool)

(declare-fun mapRes!1001 () Bool)

(assert (=> mapIsEmpty!1001 mapRes!1001))

(declare-fun b!22630 () Bool)

(declare-fun e!14680 () Bool)

(declare-fun tp_is_empty!1009 () Bool)

(assert (=> b!22630 (= e!14680 tp_is_empty!1009)))

(declare-fun mapNonEmpty!1001 () Bool)

(declare-fun tp!3479 () Bool)

(declare-fun e!14679 () Bool)

(assert (=> mapNonEmpty!1001 (= mapRes!1001 (and tp!3479 e!14679))))

(declare-fun mapRest!1001 () (Array (_ BitVec 32) ValueCell!305))

(declare-fun mapKey!1001 () (_ BitVec 32))

(declare-fun mapValue!1001 () ValueCell!305)

(assert (=> mapNonEmpty!1001 (= (arr!584 (_values!1722 (v!1589 (underlying!109 thiss!938)))) (store mapRest!1001 mapKey!1001 mapValue!1001))))

(declare-fun b!22631 () Bool)

(declare-fun e!14682 () Bool)

(declare-fun e!14677 () Bool)

(assert (=> b!22631 (= e!14682 e!14677)))

(declare-fun b!22632 () Bool)

(assert (=> b!22632 (= e!14679 tp_is_empty!1009)))

(declare-fun e!14676 () Bool)

(declare-fun array_inv!415 (array!1237) Bool)

(declare-fun array_inv!416 (array!1235) Bool)

(assert (=> b!22633 (= e!14677 (and tp!3478 tp_is_empty!1009 (array_inv!415 (_keys!3157 (v!1589 (underlying!109 thiss!938)))) (array_inv!416 (_values!1722 (v!1589 (underlying!109 thiss!938)))) e!14676))))

(declare-fun b!22634 () Bool)

(declare-fun e!14684 () Bool)

(assert (=> b!22634 (= e!14684 e!14682)))

(declare-fun b!22635 () Bool)

(declare-fun lt!7826 () LongMapFixedSize!196)

(assert (=> b!22635 (= e!14673 (tuple2!935 true (Cell!197 lt!7826)))))

(declare-fun res!14204 () Bool)

(declare-fun e!14675 () Bool)

(assert (=> start!3462 (=> (not res!14204) (not e!14675))))

(declare-fun valid!114 (LongMap!196) Bool)

(assert (=> start!3462 (= res!14204 (valid!114 thiss!938))))

(assert (=> start!3462 e!14675))

(assert (=> start!3462 e!14684))

(declare-fun b!22636 () Bool)

(assert (=> b!22636 (= e!14678 (tuple3!13 false (_2!473 lt!7827) thiss!938))))

(declare-fun b!22637 () Bool)

(declare-fun lt!7829 () tuple2!932)

(assert (=> b!22637 (= lt!7829 call!1717)))

(assert (=> b!22637 (= e!14681 (tuple2!935 (_1!472 lt!7829) (Cell!197 (_2!472 lt!7829))))))

(declare-fun b!22638 () Bool)

(assert (=> b!22638 (= e!14675 false)))

(declare-fun lt!7823 () tuple3!12)

(assert (=> b!22638 (= lt!7823 e!14678)))

(declare-fun c!2811 () Bool)

(assert (=> b!22638 (= c!2811 (not (_1!473 lt!7827)))))

(assert (=> b!22638 (= lt!7827 e!14674)))

(declare-fun c!2809 () Bool)

(assert (=> b!22638 (= c!2809 (and (not lt!7828) (not (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22638 (= lt!7828 (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!32 ((_ BitVec 32) Int) LongMapFixedSize!196)

(declare-fun computeNewMask!27 (LongMap!196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22638 (= lt!7826 (getNewLongMapFixedSize!32 (computeNewMask!27 thiss!938 (mask!4717 (v!1589 (underlying!109 thiss!938))) (_vacant!142 (v!1589 (underlying!109 thiss!938))) (_size!142 (v!1589 (underlying!109 thiss!938)))) (defaultEntry!1735 (v!1589 (underlying!109 thiss!938)))))))

(declare-fun lt!7822 () tuple2!932)

(declare-fun bm!1715 () Bool)

(declare-fun update!35 (LongMapFixedSize!196 (_ BitVec 64) V!1171) tuple2!932)

(assert (=> bm!1715 (= call!1718 (update!35 (ite c!2809 (_2!472 lt!7822) lt!7826) (ite c!2809 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2810 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2809 (minValue!1659 (v!1589 (underlying!109 thiss!938))) (ite c!2810 (zeroValue!1659 (v!1589 (underlying!109 thiss!938))) (minValue!1659 (v!1589 (underlying!109 thiss!938)))))))))

(declare-fun b!22639 () Bool)

(declare-fun lt!7830 () tuple2!932)

(assert (=> b!22639 (= e!14674 (tuple2!935 (and (_1!472 lt!7822) (_1!472 lt!7830)) (Cell!197 (_2!472 lt!7830))))))

(assert (=> b!22639 (= lt!7822 (update!35 lt!7826 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1659 (v!1589 (underlying!109 thiss!938)))))))

(assert (=> b!22639 (= lt!7830 call!1718)))

(declare-fun b!22640 () Bool)

(declare-fun lt!7825 () tuple2!932)

(assert (=> b!22640 (= e!14673 (tuple2!935 (_1!472 lt!7825) (Cell!197 (_2!472 lt!7825))))))

(assert (=> b!22640 (= lt!7825 call!1717)))

(declare-fun b!22641 () Bool)

(assert (=> b!22641 (= e!14676 (and e!14680 mapRes!1001))))

(declare-fun condMapEmpty!1001 () Bool)

(declare-fun mapDefault!1001 () ValueCell!305)

(assert (=> b!22641 (= condMapEmpty!1001 (= (arr!584 (_values!1722 (v!1589 (underlying!109 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!305)) mapDefault!1001)))))

(assert (= (and start!3462 res!14204) b!22638))

(assert (= (and b!22638 c!2809) b!22639))

(assert (= (and b!22638 (not c!2809)) b!22627))

(assert (= (and b!22627 c!2810) b!22637))

(assert (= (and b!22627 (not c!2810)) b!22628))

(assert (= (and b!22628 c!2812) b!22640))

(assert (= (and b!22628 (not c!2812)) b!22635))

(assert (= (or b!22637 b!22640) bm!1714))

(assert (= (or b!22639 bm!1714) bm!1715))

(assert (= (and b!22638 c!2811) b!22636))

(assert (= (and b!22638 (not c!2811)) b!22629))

(assert (= (and b!22641 condMapEmpty!1001) mapIsEmpty!1001))

(assert (= (and b!22641 (not condMapEmpty!1001)) mapNonEmpty!1001))

(get-info :version)

(assert (= (and mapNonEmpty!1001 ((_ is ValueCellFull!305) mapValue!1001)) b!22632))

(assert (= (and b!22641 ((_ is ValueCellFull!305) mapDefault!1001)) b!22630))

(assert (= b!22633 b!22641))

(assert (= b!22631 b!22633))

(assert (= b!22634 b!22631))

(assert (= start!3462 b!22634))

(declare-fun m!16414 () Bool)

(assert (=> bm!1715 m!16414))

(declare-fun m!16416 () Bool)

(assert (=> start!3462 m!16416))

(declare-fun m!16418 () Bool)

(assert (=> b!22629 m!16418))

(declare-fun m!16420 () Bool)

(assert (=> b!22638 m!16420))

(assert (=> b!22638 m!16420))

(declare-fun m!16422 () Bool)

(assert (=> b!22638 m!16422))

(declare-fun m!16424 () Bool)

(assert (=> b!22639 m!16424))

(declare-fun m!16426 () Bool)

(assert (=> mapNonEmpty!1001 m!16426))

(declare-fun m!16428 () Bool)

(assert (=> b!22633 m!16428))

(declare-fun m!16430 () Bool)

(assert (=> b!22633 m!16430))

(check-sat tp_is_empty!1009 (not b!22638) (not start!3462) (not b!22639) (not mapNonEmpty!1001) (not b!22629) (not b_next!745) (not bm!1715) (not b!22633) b_and!1457)
(check-sat b_and!1457 (not b_next!745))
