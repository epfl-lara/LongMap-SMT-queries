; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3288 () Bool)

(assert start!3288)

(declare-fun b!20138 () Bool)

(declare-fun b_free!709 () Bool)

(declare-fun b_next!709 () Bool)

(assert (=> b!20138 (= b_free!709 (not b_next!709))))

(declare-fun tp!3354 () Bool)

(declare-fun b_and!1379 () Bool)

(assert (=> b!20138 (= tp!3354 b_and!1379)))

(declare-fun b!20127 () Bool)

(declare-fun e!13131 () Bool)

(declare-fun e!13132 () Bool)

(assert (=> b!20127 (= e!13131 e!13132)))

(declare-fun b!20128 () Bool)

(declare-datatypes ((V!1123 0))(
  ( (V!1124 (val!513 Int)) )
))
(declare-datatypes ((array!1153 0))(
  ( (array!1154 (arr!548 (Array (_ BitVec 32) (_ BitVec 64))) (size!641 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!287 0))(
  ( (ValueCellFull!287 (v!1543 V!1123)) (EmptyCell!287) )
))
(declare-datatypes ((array!1155 0))(
  ( (array!1156 (arr!549 (Array (_ BitVec 32) ValueCell!287)) (size!642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!160 0))(
  ( (LongMapFixedSize!161 (defaultEntry!1703 Int) (mask!4665 (_ BitVec 32)) (extraKeys!1609 (_ BitVec 32)) (zeroValue!1633 V!1123) (minValue!1633 V!1123) (_size!118 (_ BitVec 32)) (_keys!3127 array!1153) (_values!1695 array!1155) (_vacant!118 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!160 0))(
  ( (Cell!161 (v!1544 LongMapFixedSize!160)) )
))
(declare-datatypes ((tuple2!848 0))(
  ( (tuple2!849 (_1!427 Bool) (_2!427 Cell!160)) )
))
(declare-fun e!13129 () tuple2!848)

(declare-fun e!13130 () tuple2!848)

(assert (=> b!20128 (= e!13129 e!13130)))

(declare-fun c!2158 () Bool)

(declare-fun lt!5864 () Bool)

(declare-datatypes ((LongMap!160 0))(
  ( (LongMap!161 (underlying!91 Cell!160)) )
))
(declare-fun thiss!938 () LongMap!160)

(assert (=> b!20128 (= c!2158 (and (not lt!5864) (= (bvand (extraKeys!1609 (v!1544 (underlying!91 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!978 () Bool)

(declare-datatypes ((tuple2!850 0))(
  ( (tuple2!851 (_1!428 Bool) (_2!428 LongMapFixedSize!160)) )
))
(declare-fun call!982 () tuple2!850)

(declare-fun call!981 () tuple2!850)

(assert (=> bm!978 (= call!982 call!981)))

(declare-fun b!20129 () Bool)

(declare-fun e!13127 () Bool)

(assert (=> b!20129 (= e!13132 e!13127)))

(declare-fun mapIsEmpty!931 () Bool)

(declare-fun mapRes!931 () Bool)

(assert (=> mapIsEmpty!931 mapRes!931))

(declare-fun b!20130 () Bool)

(declare-fun e!13124 () tuple2!848)

(declare-fun lt!5868 () LongMapFixedSize!160)

(assert (=> b!20130 (= e!13124 (tuple2!849 true (Cell!161 lt!5868)))))

(declare-fun res!13386 () Bool)

(declare-fun e!13125 () Bool)

(assert (=> start!3288 (=> (not res!13386) (not e!13125))))

(declare-fun valid!92 (LongMap!160) Bool)

(assert (=> start!3288 (= res!13386 (valid!92 thiss!938))))

(assert (=> start!3288 e!13125))

(assert (=> start!3288 e!13131))

(declare-fun b!20131 () Bool)

(declare-fun lt!5867 () tuple2!850)

(assert (=> b!20131 (= e!13124 (tuple2!849 (_1!428 lt!5867) (Cell!161 (_2!428 lt!5867))))))

(assert (=> b!20131 (= lt!5867 call!982)))

(declare-fun b!20132 () Bool)

(declare-fun e!13133 () Bool)

(declare-fun e!13128 () Bool)

(assert (=> b!20132 (= e!13133 (and e!13128 mapRes!931))))

(declare-fun condMapEmpty!931 () Bool)

(declare-fun mapDefault!931 () ValueCell!287)

(assert (=> b!20132 (= condMapEmpty!931 (= (arr!549 (_values!1695 (v!1544 (underlying!91 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!287)) mapDefault!931)))))

(declare-fun lt!5862 () tuple2!850)

(declare-fun c!2159 () Bool)

(declare-fun bm!979 () Bool)

(declare-fun update!19 (LongMapFixedSize!160 (_ BitVec 64) V!1123) tuple2!850)

(assert (=> bm!979 (= call!981 (update!19 (ite c!2159 (_2!428 lt!5862) lt!5868) (ite c!2159 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2158 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2159 (minValue!1633 (v!1544 (underlying!91 thiss!938))) (ite c!2158 (zeroValue!1633 (v!1544 (underlying!91 thiss!938))) (minValue!1633 (v!1544 (underlying!91 thiss!938)))))))))

(declare-fun b!20133 () Bool)

(declare-fun lt!5866 () tuple2!850)

(assert (=> b!20133 (= lt!5866 call!982)))

(assert (=> b!20133 (= e!13130 (tuple2!849 (_1!428 lt!5866) (Cell!161 (_2!428 lt!5866))))))

(declare-fun b!20134 () Bool)

(assert (=> b!20134 (= e!13125 false)))

(declare-fun lt!5865 () tuple2!848)

(assert (=> b!20134 (= lt!5865 e!13129)))

(assert (=> b!20134 (= c!2159 (and (not lt!5864) (not (= (bvand (extraKeys!1609 (v!1544 (underlying!91 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20134 (= lt!5864 (= (bvand (extraKeys!1609 (v!1544 (underlying!91 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!20 ((_ BitVec 32) Int) LongMapFixedSize!160)

(declare-fun computeNewMask!15 (LongMap!160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20134 (= lt!5868 (getNewLongMapFixedSize!20 (computeNewMask!15 thiss!938 (mask!4665 (v!1544 (underlying!91 thiss!938))) (_vacant!118 (v!1544 (underlying!91 thiss!938))) (_size!118 (v!1544 (underlying!91 thiss!938)))) (defaultEntry!1703 (v!1544 (underlying!91 thiss!938)))))))

(declare-fun b!20135 () Bool)

(declare-fun c!2157 () Bool)

(assert (=> b!20135 (= c!2157 (and (not (= (bvand (extraKeys!1609 (v!1544 (underlying!91 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5864))))

(assert (=> b!20135 (= e!13130 e!13124)))

(declare-fun b!20136 () Bool)

(declare-fun tp_is_empty!973 () Bool)

(assert (=> b!20136 (= e!13128 tp_is_empty!973)))

(declare-fun b!20137 () Bool)

(declare-fun lt!5863 () tuple2!850)

(assert (=> b!20137 (= e!13129 (tuple2!849 (and (_1!428 lt!5862) (_1!428 lt!5863)) (Cell!161 (_2!428 lt!5863))))))

(assert (=> b!20137 (= lt!5862 (update!19 lt!5868 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1633 (v!1544 (underlying!91 thiss!938)))))))

(assert (=> b!20137 (= lt!5863 call!981)))

(declare-fun array_inv!387 (array!1153) Bool)

(declare-fun array_inv!388 (array!1155) Bool)

(assert (=> b!20138 (= e!13127 (and tp!3354 tp_is_empty!973 (array_inv!387 (_keys!3127 (v!1544 (underlying!91 thiss!938)))) (array_inv!388 (_values!1695 (v!1544 (underlying!91 thiss!938)))) e!13133))))

(declare-fun b!20139 () Bool)

(declare-fun e!13134 () Bool)

(assert (=> b!20139 (= e!13134 tp_is_empty!973)))

(declare-fun mapNonEmpty!931 () Bool)

(declare-fun tp!3355 () Bool)

(assert (=> mapNonEmpty!931 (= mapRes!931 (and tp!3355 e!13134))))

(declare-fun mapKey!931 () (_ BitVec 32))

(declare-fun mapValue!931 () ValueCell!287)

(declare-fun mapRest!931 () (Array (_ BitVec 32) ValueCell!287))

(assert (=> mapNonEmpty!931 (= (arr!549 (_values!1695 (v!1544 (underlying!91 thiss!938)))) (store mapRest!931 mapKey!931 mapValue!931))))

(assert (= (and start!3288 res!13386) b!20134))

(assert (= (and b!20134 c!2159) b!20137))

(assert (= (and b!20134 (not c!2159)) b!20128))

(assert (= (and b!20128 c!2158) b!20133))

(assert (= (and b!20128 (not c!2158)) b!20135))

(assert (= (and b!20135 c!2157) b!20131))

(assert (= (and b!20135 (not c!2157)) b!20130))

(assert (= (or b!20133 b!20131) bm!978))

(assert (= (or b!20137 bm!978) bm!979))

(assert (= (and b!20132 condMapEmpty!931) mapIsEmpty!931))

(assert (= (and b!20132 (not condMapEmpty!931)) mapNonEmpty!931))

(get-info :version)

(assert (= (and mapNonEmpty!931 ((_ is ValueCellFull!287) mapValue!931)) b!20139))

(assert (= (and b!20132 ((_ is ValueCellFull!287) mapDefault!931)) b!20136))

(assert (= b!20138 b!20132))

(assert (= b!20129 b!20138))

(assert (= b!20127 b!20129))

(assert (= start!3288 b!20127))

(declare-fun m!14131 () Bool)

(assert (=> start!3288 m!14131))

(declare-fun m!14133 () Bool)

(assert (=> b!20137 m!14133))

(declare-fun m!14135 () Bool)

(assert (=> b!20138 m!14135))

(declare-fun m!14137 () Bool)

(assert (=> b!20138 m!14137))

(declare-fun m!14139 () Bool)

(assert (=> bm!979 m!14139))

(declare-fun m!14141 () Bool)

(assert (=> b!20134 m!14141))

(assert (=> b!20134 m!14141))

(declare-fun m!14143 () Bool)

(assert (=> b!20134 m!14143))

(declare-fun m!14145 () Bool)

(assert (=> mapNonEmpty!931 m!14145))

(check-sat (not b!20134) (not b!20138) (not start!3288) b_and!1379 (not bm!979) (not mapNonEmpty!931) tp_is_empty!973 (not b!20137) (not b_next!709))
(check-sat b_and!1379 (not b_next!709))
