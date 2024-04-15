; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3282 () Bool)

(assert start!3282)

(declare-fun b!20107 () Bool)

(declare-fun b_free!709 () Bool)

(declare-fun b_next!709 () Bool)

(assert (=> b!20107 (= b_free!709 (not b_next!709))))

(declare-fun tp!3355 () Bool)

(declare-fun b_and!1379 () Bool)

(assert (=> b!20107 (= tp!3355 b_and!1379)))

(declare-fun bm!978 () Bool)

(declare-datatypes ((V!1123 0))(
  ( (V!1124 (val!513 Int)) )
))
(declare-datatypes ((ValueCell!287 0))(
  ( (ValueCellFull!287 (v!1542 V!1123)) (EmptyCell!287) )
))
(declare-datatypes ((array!1153 0))(
  ( (array!1154 (arr!548 (Array (_ BitVec 32) ValueCell!287)) (size!641 (_ BitVec 32))) )
))
(declare-datatypes ((array!1155 0))(
  ( (array!1156 (arr!549 (Array (_ BitVec 32) (_ BitVec 64))) (size!642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!160 0))(
  ( (LongMapFixedSize!161 (defaultEntry!1703 Int) (mask!4665 (_ BitVec 32)) (extraKeys!1609 (_ BitVec 32)) (zeroValue!1633 V!1123) (minValue!1633 V!1123) (_size!118 (_ BitVec 32)) (_keys!3127 array!1155) (_values!1695 array!1153) (_vacant!118 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!842 0))(
  ( (tuple2!843 (_1!424 Bool) (_2!424 LongMapFixedSize!160)) )
))
(declare-fun call!981 () tuple2!842)

(declare-fun call!982 () tuple2!842)

(assert (=> bm!978 (= call!981 call!982)))

(declare-fun b!20103 () Bool)

(declare-fun e!13115 () Bool)

(assert (=> b!20103 (= e!13115 false)))

(declare-datatypes ((Cell!160 0))(
  ( (Cell!161 (v!1543 LongMapFixedSize!160)) )
))
(declare-datatypes ((tuple2!844 0))(
  ( (tuple2!845 (_1!425 Bool) (_2!425 Cell!160)) )
))
(declare-fun lt!5859 () tuple2!844)

(declare-fun e!13108 () tuple2!844)

(assert (=> b!20103 (= lt!5859 e!13108)))

(declare-fun c!2150 () Bool)

(declare-fun lt!5862 () Bool)

(declare-datatypes ((LongMap!160 0))(
  ( (LongMap!161 (underlying!91 Cell!160)) )
))
(declare-fun thiss!938 () LongMap!160)

(assert (=> b!20103 (= c!2150 (and (not lt!5862) (not (= (bvand (extraKeys!1609 (v!1543 (underlying!91 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20103 (= lt!5862 (= (bvand (extraKeys!1609 (v!1543 (underlying!91 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!5861 () LongMapFixedSize!160)

(declare-fun getNewLongMapFixedSize!17 ((_ BitVec 32) Int) LongMapFixedSize!160)

(declare-fun computeNewMask!14 (LongMap!160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20103 (= lt!5861 (getNewLongMapFixedSize!17 (computeNewMask!14 thiss!938 (mask!4665 (v!1543 (underlying!91 thiss!938))) (_vacant!118 (v!1543 (underlying!91 thiss!938))) (_size!118 (v!1543 (underlying!91 thiss!938)))) (defaultEntry!1703 (v!1543 (underlying!91 thiss!938)))))))

(declare-fun b!20104 () Bool)

(declare-fun e!13112 () Bool)

(declare-fun tp_is_empty!973 () Bool)

(assert (=> b!20104 (= e!13112 tp_is_empty!973)))

(declare-fun mapNonEmpty!931 () Bool)

(declare-fun mapRes!931 () Bool)

(declare-fun tp!3354 () Bool)

(assert (=> mapNonEmpty!931 (= mapRes!931 (and tp!3354 e!13112))))

(declare-fun mapRest!931 () (Array (_ BitVec 32) ValueCell!287))

(declare-fun mapKey!931 () (_ BitVec 32))

(declare-fun mapValue!931 () ValueCell!287)

(assert (=> mapNonEmpty!931 (= (arr!548 (_values!1695 (v!1543 (underlying!91 thiss!938)))) (store mapRest!931 mapKey!931 mapValue!931))))

(declare-fun b!20105 () Bool)

(declare-fun e!13111 () Bool)

(assert (=> b!20105 (= e!13111 tp_is_empty!973)))

(declare-fun b!20106 () Bool)

(declare-fun e!13114 () tuple2!844)

(assert (=> b!20106 (= e!13114 (tuple2!845 true (Cell!161 lt!5861)))))

(declare-fun bm!979 () Bool)

(declare-fun c!2152 () Bool)

(declare-fun lt!5860 () tuple2!842)

(declare-fun update!18 (LongMapFixedSize!160 (_ BitVec 64) V!1123) tuple2!842)

(assert (=> bm!979 (= call!982 (update!18 (ite c!2150 (_2!424 lt!5860) lt!5861) (ite c!2150 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2152 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2150 (minValue!1633 (v!1543 (underlying!91 thiss!938))) (ite c!2152 (zeroValue!1633 (v!1543 (underlying!91 thiss!938))) (minValue!1633 (v!1543 (underlying!91 thiss!938)))))))))

(declare-fun res!13376 () Bool)

(assert (=> start!3282 (=> (not res!13376) (not e!13115))))

(declare-fun valid!91 (LongMap!160) Bool)

(assert (=> start!3282 (= res!13376 (valid!91 thiss!938))))

(assert (=> start!3282 e!13115))

(declare-fun e!13107 () Bool)

(assert (=> start!3282 e!13107))

(declare-fun e!13113 () Bool)

(declare-fun e!13117 () Bool)

(declare-fun array_inv!387 (array!1155) Bool)

(declare-fun array_inv!388 (array!1153) Bool)

(assert (=> b!20107 (= e!13113 (and tp!3355 tp_is_empty!973 (array_inv!387 (_keys!3127 (v!1543 (underlying!91 thiss!938)))) (array_inv!388 (_values!1695 (v!1543 (underlying!91 thiss!938)))) e!13117))))

(declare-fun b!20108 () Bool)

(declare-fun e!13116 () Bool)

(assert (=> b!20108 (= e!13107 e!13116)))

(declare-fun b!20109 () Bool)

(declare-fun lt!5863 () tuple2!842)

(assert (=> b!20109 (= lt!5863 call!981)))

(declare-fun e!13110 () tuple2!844)

(assert (=> b!20109 (= e!13110 (tuple2!845 (_1!424 lt!5863) (Cell!161 (_2!424 lt!5863))))))

(declare-fun b!20110 () Bool)

(assert (=> b!20110 (= e!13117 (and e!13111 mapRes!931))))

(declare-fun condMapEmpty!931 () Bool)

(declare-fun mapDefault!931 () ValueCell!287)

(assert (=> b!20110 (= condMapEmpty!931 (= (arr!548 (_values!1695 (v!1543 (underlying!91 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!287)) mapDefault!931)))))

(declare-fun b!20111 () Bool)

(declare-fun c!2151 () Bool)

(assert (=> b!20111 (= c!2151 (and (not (= (bvand (extraKeys!1609 (v!1543 (underlying!91 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5862))))

(assert (=> b!20111 (= e!13110 e!13114)))

(declare-fun b!20112 () Bool)

(assert (=> b!20112 (= e!13116 e!13113)))

(declare-fun b!20113 () Bool)

(declare-fun lt!5858 () tuple2!842)

(assert (=> b!20113 (= e!13114 (tuple2!845 (_1!424 lt!5858) (Cell!161 (_2!424 lt!5858))))))

(assert (=> b!20113 (= lt!5858 call!981)))

(declare-fun b!20114 () Bool)

(assert (=> b!20114 (= e!13108 e!13110)))

(assert (=> b!20114 (= c!2152 (and (not lt!5862) (= (bvand (extraKeys!1609 (v!1543 (underlying!91 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!931 () Bool)

(assert (=> mapIsEmpty!931 mapRes!931))

(declare-fun b!20115 () Bool)

(declare-fun lt!5864 () tuple2!842)

(assert (=> b!20115 (= e!13108 (tuple2!845 (and (_1!424 lt!5860) (_1!424 lt!5864)) (Cell!161 (_2!424 lt!5864))))))

(assert (=> b!20115 (= lt!5860 (update!18 lt!5861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1633 (v!1543 (underlying!91 thiss!938)))))))

(assert (=> b!20115 (= lt!5864 call!982)))

(assert (= (and start!3282 res!13376) b!20103))

(assert (= (and b!20103 c!2150) b!20115))

(assert (= (and b!20103 (not c!2150)) b!20114))

(assert (= (and b!20114 c!2152) b!20109))

(assert (= (and b!20114 (not c!2152)) b!20111))

(assert (= (and b!20111 c!2151) b!20113))

(assert (= (and b!20111 (not c!2151)) b!20106))

(assert (= (or b!20109 b!20113) bm!978))

(assert (= (or b!20115 bm!978) bm!979))

(assert (= (and b!20110 condMapEmpty!931) mapIsEmpty!931))

(assert (= (and b!20110 (not condMapEmpty!931)) mapNonEmpty!931))

(get-info :version)

(assert (= (and mapNonEmpty!931 ((_ is ValueCellFull!287) mapValue!931)) b!20104))

(assert (= (and b!20110 ((_ is ValueCellFull!287) mapDefault!931)) b!20105))

(assert (= b!20107 b!20110))

(assert (= b!20112 b!20107))

(assert (= b!20108 b!20112))

(assert (= start!3282 b!20108))

(declare-fun m!14117 () Bool)

(assert (=> b!20115 m!14117))

(declare-fun m!14119 () Bool)

(assert (=> b!20103 m!14119))

(assert (=> b!20103 m!14119))

(declare-fun m!14121 () Bool)

(assert (=> b!20103 m!14121))

(declare-fun m!14123 () Bool)

(assert (=> b!20107 m!14123))

(declare-fun m!14125 () Bool)

(assert (=> b!20107 m!14125))

(declare-fun m!14127 () Bool)

(assert (=> mapNonEmpty!931 m!14127))

(declare-fun m!14129 () Bool)

(assert (=> bm!979 m!14129))

(declare-fun m!14131 () Bool)

(assert (=> start!3282 m!14131))

(check-sat (not b!20103) (not bm!979) b_and!1379 (not b!20107) (not start!3282) (not b!20115) (not b_next!709) (not mapNonEmpty!931) tp_is_empty!973)
(check-sat b_and!1379 (not b_next!709))
