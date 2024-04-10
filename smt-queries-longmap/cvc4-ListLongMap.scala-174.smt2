; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3322 () Bool)

(assert start!3322)

(declare-fun b!20709 () Bool)

(declare-fun b_free!725 () Bool)

(declare-fun b_next!725 () Bool)

(assert (=> b!20709 (= b_free!725 (not b_next!725))))

(declare-fun tp!3406 () Bool)

(declare-fun b_and!1405 () Bool)

(assert (=> b!20709 (= tp!3406 b_and!1405)))

(declare-fun b!20708 () Bool)

(declare-datatypes ((V!1143 0))(
  ( (V!1144 (val!521 Int)) )
))
(declare-datatypes ((array!1205 0))(
  ( (array!1206 (arr!573 (Array (_ BitVec 32) (_ BitVec 64))) (size!666 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!295 0))(
  ( (ValueCellFull!295 (v!1560 V!1143)) (EmptyCell!295) )
))
(declare-datatypes ((array!1207 0))(
  ( (array!1208 (arr!574 (Array (_ BitVec 32) ValueCell!295)) (size!667 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!176 0))(
  ( (LongMapFixedSize!177 (defaultEntry!1712 Int) (mask!4679 (_ BitVec 32)) (extraKeys!1617 (_ BitVec 32)) (zeroValue!1641 V!1143) (minValue!1641 V!1143) (_size!127 (_ BitVec 32)) (_keys!3135 array!1205) (_values!1703 array!1207) (_vacant!127 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!176 0))(
  ( (Cell!177 (v!1561 LongMapFixedSize!176)) )
))
(declare-datatypes ((tuple2!870 0))(
  ( (tuple2!871 (_1!438 Bool) (_2!438 Cell!176)) )
))
(declare-fun e!13547 () tuple2!870)

(declare-fun e!13542 () tuple2!870)

(assert (=> b!20708 (= e!13547 e!13542)))

(declare-fun c!2295 () Bool)

(declare-fun lt!6208 () Bool)

(declare-datatypes ((LongMap!176 0))(
  ( (LongMap!177 (underlying!99 Cell!176)) )
))
(declare-fun thiss!938 () LongMap!176)

(assert (=> b!20708 (= c!2295 (and (not lt!6208) (= (bvand (extraKeys!1617 (v!1561 (underlying!99 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun tp_is_empty!989 () Bool)

(declare-fun e!13541 () Bool)

(declare-fun e!13545 () Bool)

(declare-fun array_inv!387 (array!1205) Bool)

(declare-fun array_inv!388 (array!1207) Bool)

(assert (=> b!20709 (= e!13545 (and tp!3406 tp_is_empty!989 (array_inv!387 (_keys!3135 (v!1561 (underlying!99 thiss!938)))) (array_inv!388 (_values!1703 (v!1561 (underlying!99 thiss!938)))) e!13541))))

(declare-fun bm!1122 () Bool)

(declare-datatypes ((tuple2!872 0))(
  ( (tuple2!873 (_1!439 Bool) (_2!439 LongMapFixedSize!176)) )
))
(declare-fun call!1125 () tuple2!872)

(declare-fun call!1126 () tuple2!872)

(assert (=> bm!1122 (= call!1125 call!1126)))

(declare-fun b!20710 () Bool)

(declare-fun e!13540 () Bool)

(assert (=> b!20710 (= e!13540 tp_is_empty!989)))

(declare-fun mapNonEmpty!958 () Bool)

(declare-fun mapRes!958 () Bool)

(declare-fun tp!3405 () Bool)

(declare-fun e!13538 () Bool)

(assert (=> mapNonEmpty!958 (= mapRes!958 (and tp!3405 e!13538))))

(declare-fun mapRest!958 () (Array (_ BitVec 32) ValueCell!295))

(declare-fun mapKey!958 () (_ BitVec 32))

(declare-fun mapValue!958 () ValueCell!295)

(assert (=> mapNonEmpty!958 (= (arr!574 (_values!1703 (v!1561 (underlying!99 thiss!938)))) (store mapRest!958 mapKey!958 mapValue!958))))

(declare-fun mapIsEmpty!958 () Bool)

(assert (=> mapIsEmpty!958 mapRes!958))

(declare-fun b!20711 () Bool)

(declare-fun e!13539 () Bool)

(declare-fun e!13537 () Bool)

(assert (=> b!20711 (= e!13539 e!13537)))

(declare-fun b!20712 () Bool)

(declare-fun c!2296 () Bool)

(assert (=> b!20712 (= c!2296 (and (not (= (bvand (extraKeys!1617 (v!1561 (underlying!99 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6208))))

(declare-fun e!13536 () tuple2!870)

(assert (=> b!20712 (= e!13542 e!13536)))

(declare-fun res!13539 () Bool)

(declare-fun e!13543 () Bool)

(assert (=> start!3322 (=> (not res!13539) (not e!13543))))

(declare-fun valid!88 (LongMap!176) Bool)

(assert (=> start!3322 (= res!13539 (valid!88 thiss!938))))

(assert (=> start!3322 e!13543))

(assert (=> start!3322 e!13539))

(declare-fun b!20713 () Bool)

(declare-fun lt!6207 () tuple2!872)

(assert (=> b!20713 (= lt!6207 call!1125)))

(assert (=> b!20713 (= e!13542 (tuple2!871 (_1!439 lt!6207) (Cell!177 (_2!439 lt!6207))))))

(declare-fun b!20714 () Bool)

(declare-fun lt!6210 () tuple2!872)

(assert (=> b!20714 (= e!13536 (tuple2!871 (_1!439 lt!6210) (Cell!177 (_2!439 lt!6210))))))

(assert (=> b!20714 (= lt!6210 call!1125)))

(declare-fun b!20715 () Bool)

(assert (=> b!20715 (= e!13541 (and e!13540 mapRes!958))))

(declare-fun condMapEmpty!958 () Bool)

(declare-fun mapDefault!958 () ValueCell!295)

