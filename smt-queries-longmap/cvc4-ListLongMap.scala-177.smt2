; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3450 () Bool)

(assert start!3450)

(declare-fun b!22353 () Bool)

(declare-fun b_free!743 () Bool)

(declare-fun b_next!743 () Bool)

(assert (=> b!22353 (= b_free!743 (not b_next!743))))

(declare-fun tp!3470 () Bool)

(declare-fun b_and!1455 () Bool)

(assert (=> b!22353 (= tp!3470 b_and!1455)))

(declare-fun b!22340 () Bool)

(declare-fun c!2708 () Bool)

(declare-datatypes ((V!1167 0))(
  ( (V!1168 (val!530 Int)) )
))
(declare-datatypes ((ValueCell!304 0))(
  ( (ValueCellFull!304 (v!1585 V!1167)) (EmptyCell!304) )
))
(declare-datatypes ((array!1247 0))(
  ( (array!1248 (arr!591 (Array (_ BitVec 32) ValueCell!304)) (size!687 (_ BitVec 32))) )
))
(declare-datatypes ((array!1249 0))(
  ( (array!1250 (arr!592 (Array (_ BitVec 32) (_ BitVec 64))) (size!688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!194 0))(
  ( (LongMapFixedSize!195 (defaultEntry!1733 Int) (mask!4713 (_ BitVec 32)) (extraKeys!1633 (_ BitVec 32)) (zeroValue!1658 V!1167) (minValue!1658 V!1167) (_size!140 (_ BitVec 32)) (_keys!3156 array!1249) (_values!1721 array!1247) (_vacant!140 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!194 0))(
  ( (Cell!195 (v!1586 LongMapFixedSize!194)) )
))
(declare-datatypes ((LongMap!194 0))(
  ( (LongMap!195 (underlying!108 Cell!194)) )
))
(declare-fun thiss!938 () LongMap!194)

(declare-fun lt!7517 () Bool)

(assert (=> b!22340 (= c!2708 (and (not (= (bvand (extraKeys!1633 (v!1586 (underlying!108 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7517))))

(declare-datatypes ((tuple2!918 0))(
  ( (tuple2!919 (_1!464 Bool) (_2!464 Cell!194)) )
))
(declare-fun e!14520 () tuple2!918)

(declare-fun e!14517 () tuple2!918)

(assert (=> b!22340 (= e!14520 e!14517)))

(declare-fun b!22342 () Bool)

(declare-datatypes ((tuple3!10 0))(
  ( (tuple3!11 (_1!465 Bool) (_2!465 Cell!194) (_3!5 LongMap!194)) )
))
(declare-fun e!14519 () tuple3!10)

(declare-datatypes ((tuple2!920 0))(
  ( (tuple2!921 (_1!466 Bool) (_2!466 LongMapFixedSize!194)) )
))
(declare-fun lt!7519 () tuple2!920)

(declare-fun lt!7521 () Cell!194)

(assert (=> b!22342 (= e!14519 (ite (_1!466 lt!7519) (tuple3!11 true (underlying!108 thiss!938) (LongMap!195 lt!7521)) (tuple3!11 false lt!7521 thiss!938)))))

(declare-fun lt!7513 () tuple2!918)

(declare-fun repackFrom!5 (LongMap!194 LongMapFixedSize!194 (_ BitVec 32)) tuple2!920)

(assert (=> b!22342 (= lt!7519 (repackFrom!5 thiss!938 (v!1586 (_2!464 lt!7513)) (bvsub (size!688 (_keys!3156 (v!1586 (underlying!108 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22342 (= lt!7521 (Cell!195 (_2!466 lt!7519)))))

(declare-fun bm!1573 () Bool)

(declare-fun call!1577 () tuple2!920)

(declare-fun call!1576 () tuple2!920)

(assert (=> bm!1573 (= call!1577 call!1576)))

(declare-fun b!22343 () Bool)

(declare-fun e!14522 () tuple2!918)

(assert (=> b!22343 (= e!14522 e!14520)))

(declare-fun c!2709 () Bool)

(assert (=> b!22343 (= c!2709 (and (not lt!7517) (= (bvand (extraKeys!1633 (v!1586 (underlying!108 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22344 () Bool)

(assert (=> b!22344 (= e!14519 (tuple3!11 false (_2!464 lt!7513) thiss!938))))

(declare-fun mapNonEmpty!995 () Bool)

(declare-fun mapRes!995 () Bool)

(declare-fun tp!3469 () Bool)

(declare-fun e!14525 () Bool)

(assert (=> mapNonEmpty!995 (= mapRes!995 (and tp!3469 e!14525))))

(declare-fun mapValue!995 () ValueCell!304)

(declare-fun mapRest!995 () (Array (_ BitVec 32) ValueCell!304))

(declare-fun mapKey!995 () (_ BitVec 32))

(assert (=> mapNonEmpty!995 (= (arr!591 (_values!1721 (v!1586 (underlying!108 thiss!938)))) (store mapRest!995 mapKey!995 mapValue!995))))

(declare-fun b!22345 () Bool)

(declare-fun lt!7515 () tuple2!920)

(assert (=> b!22345 (= lt!7515 call!1577)))

(assert (=> b!22345 (= e!14520 (tuple2!919 (_1!466 lt!7515) (Cell!195 (_2!466 lt!7515))))))

(declare-fun b!22346 () Bool)

(declare-fun e!14528 () Bool)

(declare-fun e!14523 () Bool)

(assert (=> b!22346 (= e!14528 (and e!14523 mapRes!995))))

(declare-fun condMapEmpty!995 () Bool)

(declare-fun mapDefault!995 () ValueCell!304)

