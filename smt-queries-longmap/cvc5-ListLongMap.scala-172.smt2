; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3292 () Bool)

(assert start!3292)

(declare-fun b!20166 () Bool)

(declare-fun b_free!709 () Bool)

(declare-fun b_next!709 () Bool)

(assert (=> b!20166 (= b_free!709 (not b_next!709))))

(declare-fun tp!3355 () Bool)

(declare-fun b_and!1385 () Bool)

(assert (=> b!20166 (= tp!3355 b_and!1385)))

(declare-fun mapIsEmpty!931 () Bool)

(declare-fun mapRes!931 () Bool)

(assert (=> mapIsEmpty!931 mapRes!931))

(declare-datatypes ((V!1123 0))(
  ( (V!1124 (val!513 Int)) )
))
(declare-datatypes ((ValueCell!287 0))(
  ( (ValueCellFull!287 (v!1543 V!1123)) (EmptyCell!287) )
))
(declare-datatypes ((array!1171 0))(
  ( (array!1172 (arr!557 (Array (_ BitVec 32) ValueCell!287)) (size!650 (_ BitVec 32))) )
))
(declare-datatypes ((array!1173 0))(
  ( (array!1174 (arr!558 (Array (_ BitVec 32) (_ BitVec 64))) (size!651 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!160 0))(
  ( (LongMapFixedSize!161 (defaultEntry!1703 Int) (mask!4665 (_ BitVec 32)) (extraKeys!1609 (_ BitVec 32)) (zeroValue!1633 V!1123) (minValue!1633 V!1123) (_size!118 (_ BitVec 32)) (_keys!3127 array!1173) (_values!1695 array!1171) (_vacant!118 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!838 0))(
  ( (tuple2!839 (_1!422 Bool) (_2!422 LongMapFixedSize!160)) )
))
(declare-fun lt!5863 () tuple2!838)

(declare-fun c!2163 () Bool)

(declare-fun bm!978 () Bool)

(declare-fun lt!5866 () LongMapFixedSize!160)

(declare-fun call!982 () tuple2!838)

(declare-fun c!2162 () Bool)

(declare-datatypes ((Cell!160 0))(
  ( (Cell!161 (v!1544 LongMapFixedSize!160)) )
))
(declare-datatypes ((LongMap!160 0))(
  ( (LongMap!161 (underlying!91 Cell!160)) )
))
(declare-fun thiss!938 () LongMap!160)

(declare-fun update!15 (LongMapFixedSize!160 (_ BitVec 64) V!1123) tuple2!838)

(assert (=> bm!978 (= call!982 (update!15 (ite c!2162 (_2!422 lt!5863) lt!5866) (ite c!2162 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2163 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2162 (minValue!1633 (v!1544 (underlying!91 thiss!938))) (ite c!2163 (zeroValue!1633 (v!1544 (underlying!91 thiss!938))) (minValue!1633 (v!1544 (underlying!91 thiss!938)))))))))

(declare-fun b!20157 () Bool)

(declare-fun c!2161 () Bool)

(declare-fun lt!5864 () Bool)

(assert (=> b!20157 (= c!2161 (and (not (= (bvand (extraKeys!1609 (v!1544 (underlying!91 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5864))))

(declare-datatypes ((tuple2!840 0))(
  ( (tuple2!841 (_1!423 Bool) (_2!423 Cell!160)) )
))
(declare-fun e!13160 () tuple2!840)

(declare-fun e!13155 () tuple2!840)

(assert (=> b!20157 (= e!13160 e!13155)))

(declare-fun b!20158 () Bool)

(declare-fun e!13159 () Bool)

(declare-fun e!13154 () Bool)

(assert (=> b!20158 (= e!13159 e!13154)))

(declare-fun b!20159 () Bool)

(declare-fun lt!5865 () tuple2!838)

(declare-fun call!981 () tuple2!838)

(assert (=> b!20159 (= lt!5865 call!981)))

(assert (=> b!20159 (= e!13160 (tuple2!841 (_1!422 lt!5865) (Cell!161 (_2!422 lt!5865))))))

(declare-fun b!20160 () Bool)

(declare-fun e!13158 () Bool)

(declare-fun e!13157 () Bool)

(assert (=> b!20160 (= e!13158 (and e!13157 mapRes!931))))

(declare-fun condMapEmpty!931 () Bool)

(declare-fun mapDefault!931 () ValueCell!287)

