; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3466 () Bool)

(assert start!3466)

(declare-fun b!22642 () Bool)

(declare-fun b_free!745 () Bool)

(declare-fun b_next!745 () Bool)

(assert (=> b!22642 (= b_free!745 (not b_next!745))))

(declare-fun tp!3478 () Bool)

(declare-fun b_and!1463 () Bool)

(assert (=> b!22642 (= tp!3478 b_and!1463)))

(declare-fun bm!1714 () Bool)

(declare-datatypes ((V!1171 0))(
  ( (V!1172 (val!531 Int)) )
))
(declare-datatypes ((ValueCell!305 0))(
  ( (ValueCellFull!305 (v!1588 V!1171)) (EmptyCell!305) )
))
(declare-datatypes ((array!1253 0))(
  ( (array!1254 (arr!593 (Array (_ BitVec 32) ValueCell!305)) (size!689 (_ BitVec 32))) )
))
(declare-datatypes ((array!1255 0))(
  ( (array!1256 (arr!594 (Array (_ BitVec 32) (_ BitVec 64))) (size!690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!196 0))(
  ( (LongMapFixedSize!197 (defaultEntry!1735 Int) (mask!4717 (_ BitVec 32)) (extraKeys!1634 (_ BitVec 32)) (zeroValue!1659 V!1171) (minValue!1659 V!1171) (_size!142 (_ BitVec 32)) (_keys!3157 array!1255) (_values!1722 array!1253) (_vacant!142 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!926 0))(
  ( (tuple2!927 (_1!469 Bool) (_2!469 LongMapFixedSize!196)) )
))
(declare-fun call!1717 () tuple2!926)

(declare-fun call!1718 () tuple2!926)

(assert (=> bm!1714 (= call!1717 call!1718)))

(declare-fun b!22633 () Bool)

(declare-fun lt!7822 () tuple2!926)

(assert (=> b!22633 (= lt!7822 call!1717)))

(declare-datatypes ((Cell!196 0))(
  ( (Cell!197 (v!1589 LongMapFixedSize!196)) )
))
(declare-datatypes ((tuple2!928 0))(
  ( (tuple2!929 (_1!470 Bool) (_2!470 Cell!196)) )
))
(declare-fun e!14698 () tuple2!928)

(assert (=> b!22633 (= e!14698 (tuple2!929 (_1!469 lt!7822) (Cell!197 (_2!469 lt!7822))))))

(declare-fun b!22634 () Bool)

(declare-fun e!14694 () Bool)

(declare-fun e!14695 () Bool)

(assert (=> b!22634 (= e!14694 e!14695)))

(declare-fun b!22635 () Bool)

(declare-fun e!14689 () tuple2!928)

(declare-fun lt!7821 () tuple2!926)

(declare-fun lt!7827 () tuple2!926)

(assert (=> b!22635 (= e!14689 (tuple2!929 (and (_1!469 lt!7821) (_1!469 lt!7827)) (Cell!197 (_2!469 lt!7827))))))

(assert (=> b!22635 (= lt!7821 call!1718)))

(declare-datatypes ((LongMap!196 0))(
  ( (LongMap!197 (underlying!109 Cell!196)) )
))
(declare-fun thiss!938 () LongMap!196)

(declare-fun update!27 (LongMapFixedSize!196 (_ BitVec 64) V!1171) tuple2!926)

(assert (=> b!22635 (= lt!7827 (update!27 (_2!469 lt!7821) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1659 (v!1589 (underlying!109 thiss!938)))))))

(declare-fun mapIsEmpty!1001 () Bool)

(declare-fun mapRes!1001 () Bool)

(assert (=> mapIsEmpty!1001 mapRes!1001))

(declare-fun b!22636 () Bool)

(declare-fun e!14691 () tuple2!928)

(declare-fun lt!7829 () tuple2!926)

(assert (=> b!22636 (= e!14691 (tuple2!929 (_1!469 lt!7829) (Cell!197 (_2!469 lt!7829))))))

(assert (=> b!22636 (= lt!7829 call!1717)))

(declare-fun b!22637 () Bool)

(declare-fun e!14688 () Bool)

(declare-fun tp_is_empty!1009 () Bool)

(assert (=> b!22637 (= e!14688 tp_is_empty!1009)))

(declare-fun lt!7830 () LongMapFixedSize!196)

(declare-fun c!2802 () Bool)

(declare-fun c!2803 () Bool)

(declare-fun bm!1715 () Bool)

(assert (=> bm!1715 (= call!1718 (update!27 lt!7830 (ite (or c!2803 c!2802) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2803 c!2802) (zeroValue!1659 (v!1589 (underlying!109 thiss!938))) (minValue!1659 (v!1589 (underlying!109 thiss!938))))))))

(declare-fun b!22638 () Bool)

(declare-fun e!14693 () Bool)

(assert (=> b!22638 (= e!14693 e!14694)))

(declare-fun b!22639 () Bool)

(declare-fun e!14697 () Bool)

(assert (=> b!22639 (= e!14697 tp_is_empty!1009)))

(declare-fun b!22640 () Bool)

(declare-fun c!2801 () Bool)

(declare-fun lt!7825 () Bool)

(assert (=> b!22640 (= c!2801 (and (not (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7825))))

(assert (=> b!22640 (= e!14698 e!14691)))

(declare-fun b!22641 () Bool)

(declare-datatypes ((tuple3!12 0))(
  ( (tuple3!13 (_1!471 Bool) (_2!471 Cell!196) (_3!6 LongMap!196)) )
))
(declare-fun e!14690 () tuple3!12)

(declare-fun lt!7828 () tuple2!928)

(assert (=> b!22641 (= e!14690 (tuple3!13 false (_2!470 lt!7828) thiss!938))))

(declare-fun b!22643 () Bool)

(assert (=> b!22643 (= e!14689 e!14698)))

(assert (=> b!22643 (= c!2802 (and (not lt!7825) (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1001 () Bool)

(declare-fun tp!3479 () Bool)

(assert (=> mapNonEmpty!1001 (= mapRes!1001 (and tp!3479 e!14697))))

(declare-fun mapRest!1001 () (Array (_ BitVec 32) ValueCell!305))

(declare-fun mapKey!1001 () (_ BitVec 32))

(declare-fun mapValue!1001 () ValueCell!305)

(assert (=> mapNonEmpty!1001 (= (arr!593 (_values!1722 (v!1589 (underlying!109 thiss!938)))) (store mapRest!1001 mapKey!1001 mapValue!1001))))

(declare-fun b!22644 () Bool)

(declare-fun e!14696 () Bool)

(assert (=> b!22644 (= e!14696 false)))

(declare-fun lt!7824 () tuple3!12)

(assert (=> b!22644 (= lt!7824 e!14690)))

(declare-fun c!2804 () Bool)

(assert (=> b!22644 (= c!2804 (not (_1!470 lt!7828)))))

(assert (=> b!22644 (= lt!7828 e!14689)))

(assert (=> b!22644 (= c!2803 (and (not lt!7825) (not (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22644 (= lt!7825 (= (bvand (extraKeys!1634 (v!1589 (underlying!109 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!28 ((_ BitVec 32) Int) LongMapFixedSize!196)

(declare-fun computeNewMask!24 (LongMap!196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22644 (= lt!7830 (getNewLongMapFixedSize!28 (computeNewMask!24 thiss!938 (mask!4717 (v!1589 (underlying!109 thiss!938))) (_vacant!142 (v!1589 (underlying!109 thiss!938))) (_size!142 (v!1589 (underlying!109 thiss!938)))) (defaultEntry!1735 (v!1589 (underlying!109 thiss!938)))))))

(declare-fun b!22645 () Bool)

(assert (=> b!22645 (= e!14691 (tuple2!929 true (Cell!197 lt!7830)))))

(declare-fun b!22646 () Bool)

(declare-fun lt!7826 () tuple2!926)

(declare-fun lt!7823 () Cell!196)

(assert (=> b!22646 (= e!14690 (ite (_1!469 lt!7826) (tuple3!13 true (underlying!109 thiss!938) (LongMap!197 lt!7823)) (tuple3!13 false lt!7823 thiss!938)))))

(declare-fun repackFrom!6 (LongMap!196 LongMapFixedSize!196 (_ BitVec 32)) tuple2!926)

(assert (=> b!22646 (= lt!7826 (repackFrom!6 thiss!938 (v!1589 (_2!470 lt!7828)) (bvsub (size!690 (_keys!3157 (v!1589 (underlying!109 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22646 (= lt!7823 (Cell!197 (_2!469 lt!7826)))))

(declare-fun b!22647 () Bool)

(declare-fun e!14687 () Bool)

(assert (=> b!22647 (= e!14687 (and e!14688 mapRes!1001))))

(declare-fun condMapEmpty!1001 () Bool)

(declare-fun mapDefault!1001 () ValueCell!305)

