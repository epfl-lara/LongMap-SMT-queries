; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3318 () Bool)

(assert start!3318)

(declare-fun b!20625 () Bool)

(declare-fun b_free!721 () Bool)

(declare-fun b_next!721 () Bool)

(assert (=> b!20625 (= b_free!721 (not b_next!721))))

(declare-fun tp!3393 () Bool)

(declare-fun b_and!1401 () Bool)

(assert (=> b!20625 (= tp!3393 b_and!1401)))

(declare-fun b!20612 () Bool)

(declare-fun e!13469 () Bool)

(declare-datatypes ((V!1139 0))(
  ( (V!1140 (val!519 Int)) )
))
(declare-datatypes ((array!1197 0))(
  ( (array!1198 (arr!569 (Array (_ BitVec 32) (_ BitVec 64))) (size!662 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!293 0))(
  ( (ValueCellFull!293 (v!1556 V!1139)) (EmptyCell!293) )
))
(declare-datatypes ((array!1199 0))(
  ( (array!1200 (arr!570 (Array (_ BitVec 32) ValueCell!293)) (size!663 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!172 0))(
  ( (LongMapFixedSize!173 (defaultEntry!1710 Int) (mask!4677 (_ BitVec 32)) (extraKeys!1615 (_ BitVec 32)) (zeroValue!1639 V!1139) (minValue!1639 V!1139) (_size!125 (_ BitVec 32)) (_keys!3133 array!1197) (_values!1701 array!1199) (_vacant!125 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!172 0))(
  ( (Cell!173 (v!1557 LongMapFixedSize!172)) )
))
(declare-datatypes ((tuple2!862 0))(
  ( (tuple2!863 (_1!434 Bool) (_2!434 Cell!172)) )
))
(declare-fun lt!6162 () tuple2!862)

(declare-fun valid!84 (LongMapFixedSize!172) Bool)

(assert (=> b!20612 (= e!13469 (not (valid!84 (v!1557 (_2!434 lt!6162)))))))

(declare-fun bm!1110 () Bool)

(declare-fun lt!6168 () LongMapFixedSize!172)

(declare-datatypes ((tuple2!864 0))(
  ( (tuple2!865 (_1!435 Bool) (_2!435 LongMapFixedSize!172)) )
))
(declare-fun lt!6164 () tuple2!864)

(declare-datatypes ((LongMap!172 0))(
  ( (LongMap!173 (underlying!97 Cell!172)) )
))
(declare-fun thiss!938 () LongMap!172)

(declare-fun c!2277 () Bool)

(declare-fun c!2276 () Bool)

(declare-fun call!1113 () tuple2!864)

(declare-fun update!19 (LongMapFixedSize!172 (_ BitVec 64) V!1139) tuple2!864)

(assert (=> bm!1110 (= call!1113 (update!19 (ite c!2276 (_2!435 lt!6164) lt!6168) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938)))))))))

(declare-fun b!20614 () Bool)

(declare-fun e!13466 () tuple2!862)

(declare-fun e!13475 () tuple2!862)

(assert (=> b!20614 (= e!13466 e!13475)))

(declare-fun lt!6163 () Bool)

(assert (=> b!20614 (= c!2277 (and (not lt!6163) (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!20615 () Bool)

(declare-fun e!13468 () tuple2!862)

(assert (=> b!20615 (= e!13468 (tuple2!863 true (Cell!173 lt!6168)))))

(declare-fun b!20616 () Bool)

(declare-fun res!13518 () Bool)

(assert (=> b!20616 (=> (not res!13518) (not e!13469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20616 (= res!13518 (validMask!0 (mask!4677 (v!1557 (underlying!97 thiss!938)))))))

(declare-fun b!20617 () Bool)

(declare-fun e!13473 () Bool)

(declare-fun e!13471 () Bool)

(assert (=> b!20617 (= e!13473 e!13471)))

(declare-fun b!20618 () Bool)

(declare-fun lt!6167 () tuple2!864)

(assert (=> b!20618 (= e!13466 (tuple2!863 (and (_1!435 lt!6164) (_1!435 lt!6167)) (Cell!173 (_2!435 lt!6167))))))

(assert (=> b!20618 (= lt!6164 (update!19 lt!6168 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938)))))))

(assert (=> b!20618 (= lt!6167 call!1113)))

(declare-fun b!20619 () Bool)

(declare-fun c!2278 () Bool)

(assert (=> b!20619 (= c!2278 (and (not (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6163))))

(assert (=> b!20619 (= e!13475 e!13468)))

(declare-fun b!20620 () Bool)

(declare-fun e!13467 () Bool)

(assert (=> b!20620 (= e!13471 e!13467)))

(declare-fun b!20621 () Bool)

(declare-fun e!13464 () Bool)

(declare-fun tp_is_empty!985 () Bool)

(assert (=> b!20621 (= e!13464 tp_is_empty!985)))

(declare-fun bm!1111 () Bool)

(declare-fun call!1114 () tuple2!864)

(assert (=> bm!1111 (= call!1114 call!1113)))

(declare-fun res!13517 () Bool)

(declare-fun e!13472 () Bool)

(assert (=> start!3318 (=> (not res!13517) (not e!13472))))

(declare-fun valid!85 (LongMap!172) Bool)

(assert (=> start!3318 (= res!13517 (valid!85 thiss!938))))

(assert (=> start!3318 e!13472))

(assert (=> start!3318 e!13473))

(declare-fun b!20613 () Bool)

(declare-fun lt!6166 () tuple2!864)

(assert (=> b!20613 (= lt!6166 call!1114)))

(assert (=> b!20613 (= e!13475 (tuple2!863 (_1!435 lt!6166) (Cell!173 (_2!435 lt!6166))))))

(declare-fun b!20622 () Bool)

(assert (=> b!20622 (= e!13472 e!13469)))

(declare-fun res!13516 () Bool)

(assert (=> b!20622 (=> (not res!13516) (not e!13469))))

(assert (=> b!20622 (= res!13516 (_1!434 lt!6162))))

(assert (=> b!20622 (= lt!6162 e!13466)))

(assert (=> b!20622 (= c!2276 (and (not lt!6163) (not (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20622 (= lt!6163 (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!23 ((_ BitVec 32) Int) LongMapFixedSize!172)

(declare-fun computeNewMask!19 (LongMap!172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20622 (= lt!6168 (getNewLongMapFixedSize!23 (computeNewMask!19 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) (defaultEntry!1710 (v!1557 (underlying!97 thiss!938)))))))

(declare-fun mapIsEmpty!952 () Bool)

(declare-fun mapRes!952 () Bool)

(assert (=> mapIsEmpty!952 mapRes!952))

(declare-fun b!20623 () Bool)

(declare-fun lt!6165 () tuple2!864)

(assert (=> b!20623 (= e!13468 (tuple2!863 (_1!435 lt!6165) (Cell!173 (_2!435 lt!6165))))))

(assert (=> b!20623 (= lt!6165 call!1114)))

(declare-fun b!20624 () Bool)

(declare-fun e!13465 () Bool)

(assert (=> b!20624 (= e!13465 (and e!13464 mapRes!952))))

(declare-fun condMapEmpty!952 () Bool)

(declare-fun mapDefault!952 () ValueCell!293)

