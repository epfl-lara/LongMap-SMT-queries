; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3470 () Bool)

(assert start!3470)

(declare-fun b!22728 () Bool)

(declare-fun b_free!749 () Bool)

(declare-fun b_next!749 () Bool)

(assert (=> b!22728 (= b_free!749 (not b_next!749))))

(declare-fun tp!3491 () Bool)

(declare-fun b_and!1467 () Bool)

(assert (=> b!22728 (= tp!3491 b_and!1467)))

(declare-fun b!22723 () Bool)

(declare-fun e!14760 () Bool)

(assert (=> b!22723 (= e!14760 false)))

(declare-datatypes ((V!1175 0))(
  ( (V!1176 (val!533 Int)) )
))
(declare-datatypes ((ValueCell!307 0))(
  ( (ValueCellFull!307 (v!1592 V!1175)) (EmptyCell!307) )
))
(declare-datatypes ((array!1261 0))(
  ( (array!1262 (arr!597 (Array (_ BitVec 32) ValueCell!307)) (size!693 (_ BitVec 32))) )
))
(declare-datatypes ((array!1263 0))(
  ( (array!1264 (arr!598 (Array (_ BitVec 32) (_ BitVec 64))) (size!694 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!200 0))(
  ( (LongMapFixedSize!201 (defaultEntry!1737 Int) (mask!4719 (_ BitVec 32)) (extraKeys!1636 (_ BitVec 32)) (zeroValue!1661 V!1175) (minValue!1661 V!1175) (_size!144 (_ BitVec 32)) (_keys!3159 array!1263) (_values!1724 array!1261) (_vacant!144 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!200 0))(
  ( (Cell!201 (v!1593 LongMapFixedSize!200)) )
))
(declare-datatypes ((LongMap!200 0))(
  ( (LongMap!201 (underlying!111 Cell!200)) )
))
(declare-datatypes ((tuple3!16 0))(
  ( (tuple3!17 (_1!475 Bool) (_2!475 Cell!200) (_3!8 LongMap!200)) )
))
(declare-fun lt!7883 () tuple3!16)

(declare-fun e!14768 () tuple3!16)

(assert (=> b!22723 (= lt!7883 e!14768)))

(declare-fun c!2827 () Bool)

(declare-datatypes ((tuple2!934 0))(
  ( (tuple2!935 (_1!476 Bool) (_2!476 Cell!200)) )
))
(declare-fun lt!7887 () tuple2!934)

(assert (=> b!22723 (= c!2827 (not (_1!476 lt!7887)))))

(declare-fun e!14762 () tuple2!934)

(assert (=> b!22723 (= lt!7887 e!14762)))

(declare-fun c!2828 () Bool)

(declare-fun lt!7884 () Bool)

(declare-fun thiss!938 () LongMap!200)

(assert (=> b!22723 (= c!2828 (and (not lt!7884) (not (= (bvand (extraKeys!1636 (v!1593 (underlying!111 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22723 (= lt!7884 (= (bvand (extraKeys!1636 (v!1593 (underlying!111 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!7882 () LongMapFixedSize!200)

(declare-fun getNewLongMapFixedSize!30 ((_ BitVec 32) Int) LongMapFixedSize!200)

(declare-fun computeNewMask!26 (LongMap!200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22723 (= lt!7882 (getNewLongMapFixedSize!30 (computeNewMask!26 thiss!938 (mask!4719 (v!1593 (underlying!111 thiss!938))) (_vacant!144 (v!1593 (underlying!111 thiss!938))) (_size!144 (v!1593 (underlying!111 thiss!938)))) (defaultEntry!1737 (v!1593 (underlying!111 thiss!938)))))))

(declare-fun b!22724 () Bool)

(declare-fun e!14765 () Bool)

(declare-fun tp_is_empty!1013 () Bool)

(assert (=> b!22724 (= e!14765 tp_is_empty!1013)))

(declare-fun b!22725 () Bool)

(declare-fun lt!7889 () Cell!200)

(declare-datatypes ((tuple2!936 0))(
  ( (tuple2!937 (_1!477 Bool) (_2!477 LongMapFixedSize!200)) )
))
(declare-fun lt!7881 () tuple2!936)

(assert (=> b!22725 (= e!14768 (ite (_1!477 lt!7881) (tuple3!17 true (underlying!111 thiss!938) (LongMap!201 lt!7889)) (tuple3!17 false lt!7889 thiss!938)))))

(declare-fun repackFrom!8 (LongMap!200 LongMapFixedSize!200 (_ BitVec 32)) tuple2!936)

(assert (=> b!22725 (= lt!7881 (repackFrom!8 thiss!938 (v!1593 (_2!476 lt!7887)) (bvsub (size!694 (_keys!3159 (v!1593 (underlying!111 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22725 (= lt!7889 (Cell!201 (_2!477 lt!7881)))))

(declare-fun b!22726 () Bool)

(declare-fun lt!7885 () tuple2!936)

(declare-fun lt!7886 () tuple2!936)

(assert (=> b!22726 (= e!14762 (tuple2!935 (and (_1!477 lt!7885) (_1!477 lt!7886)) (Cell!201 (_2!477 lt!7886))))))

(declare-fun update!29 (LongMapFixedSize!200 (_ BitVec 64) V!1175) tuple2!936)

(assert (=> b!22726 (= lt!7885 (update!29 lt!7882 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1661 (v!1593 (underlying!111 thiss!938)))))))

(declare-fun call!1729 () tuple2!936)

(assert (=> b!22726 (= lt!7886 call!1729)))

(declare-fun b!22727 () Bool)

(assert (=> b!22727 (= e!14768 (tuple3!17 false (_2!476 lt!7887) thiss!938))))

(declare-fun mapIsEmpty!1007 () Bool)

(declare-fun mapRes!1007 () Bool)

(assert (=> mapIsEmpty!1007 mapRes!1007))

(declare-fun e!14761 () Bool)

(declare-fun e!14767 () Bool)

(declare-fun array_inv!403 (array!1263) Bool)

(declare-fun array_inv!404 (array!1261) Bool)

(assert (=> b!22728 (= e!14767 (and tp!3491 tp_is_empty!1013 (array_inv!403 (_keys!3159 (v!1593 (underlying!111 thiss!938)))) (array_inv!404 (_values!1724 (v!1593 (underlying!111 thiss!938)))) e!14761))))

(declare-fun b!22729 () Bool)

(declare-fun e!14769 () Bool)

(declare-fun e!14759 () Bool)

(assert (=> b!22729 (= e!14769 e!14759)))

(declare-fun b!22730 () Bool)

(declare-fun c!2825 () Bool)

(assert (=> b!22730 (= c!2825 (and (not (= (bvand (extraKeys!1636 (v!1593 (underlying!111 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7884))))

(declare-fun e!14764 () tuple2!934)

(declare-fun e!14763 () tuple2!934)

(assert (=> b!22730 (= e!14764 e!14763)))

(declare-fun b!22731 () Bool)

(assert (=> b!22731 (= e!14762 e!14764)))

(declare-fun c!2826 () Bool)

(assert (=> b!22731 (= c!2826 (and (not lt!7884) (= (bvand (extraKeys!1636 (v!1593 (underlying!111 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1726 () Bool)

(declare-fun call!1730 () tuple2!936)

(assert (=> bm!1726 (= call!1730 call!1729)))

(declare-fun bm!1727 () Bool)

(assert (=> bm!1727 (= call!1729 (update!29 (ite c!2828 (_2!477 lt!7885) lt!7882) (ite c!2828 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2826 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2828 (minValue!1661 (v!1593 (underlying!111 thiss!938))) (ite c!2826 (zeroValue!1661 (v!1593 (underlying!111 thiss!938))) (minValue!1661 (v!1593 (underlying!111 thiss!938)))))))))

(declare-fun b!22732 () Bool)

(assert (=> b!22732 (= e!14759 e!14767)))

(declare-fun res!14232 () Bool)

(assert (=> start!3470 (=> (not res!14232) (not e!14760))))

(declare-fun valid!99 (LongMap!200) Bool)

(assert (=> start!3470 (= res!14232 (valid!99 thiss!938))))

(assert (=> start!3470 e!14760))

(assert (=> start!3470 e!14769))

(declare-fun b!22733 () Bool)

(declare-fun e!14770 () Bool)

(assert (=> b!22733 (= e!14761 (and e!14770 mapRes!1007))))

(declare-fun condMapEmpty!1007 () Bool)

(declare-fun mapDefault!1007 () ValueCell!307)

