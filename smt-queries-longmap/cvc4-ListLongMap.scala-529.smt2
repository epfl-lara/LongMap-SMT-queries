; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13206 () Bool)

(assert start!13206)

(declare-fun b!116318 () Bool)

(declare-fun b_free!2745 () Bool)

(declare-fun b_next!2745 () Bool)

(assert (=> b!116318 (= b_free!2745 (not b_next!2745))))

(declare-fun tp!10603 () Bool)

(declare-fun b_and!7243 () Bool)

(assert (=> b!116318 (= tp!10603 b_and!7243)))

(declare-fun b!116324 () Bool)

(declare-fun b_free!2747 () Bool)

(declare-fun b_next!2747 () Bool)

(assert (=> b!116324 (= b_free!2747 (not b_next!2747))))

(declare-fun tp!10605 () Bool)

(declare-fun b_and!7245 () Bool)

(assert (=> b!116324 (= tp!10605 b_and!7245)))

(declare-fun e!75956 () Bool)

(declare-datatypes ((V!3365 0))(
  ( (V!3366 (val!1439 Int)) )
))
(declare-datatypes ((array!4583 0))(
  ( (array!4584 (arr!2173 (Array (_ BitVec 32) (_ BitVec 64))) (size!2434 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1051 0))(
  ( (ValueCellFull!1051 (v!3047 V!3365)) (EmptyCell!1051) )
))
(declare-datatypes ((array!4585 0))(
  ( (array!4586 (arr!2174 (Array (_ BitVec 32) ValueCell!1051)) (size!2435 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1010 0))(
  ( (LongMapFixedSize!1011 (defaultEntry!2716 Int) (mask!6932 (_ BitVec 32)) (extraKeys!2505 (_ BitVec 32)) (zeroValue!2583 V!3365) (minValue!2583 V!3365) (_size!554 (_ BitVec 32)) (_keys!4439 array!4583) (_values!2699 array!4585) (_vacant!554 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!808 0))(
  ( (Cell!809 (v!3048 LongMapFixedSize!1010)) )
))
(declare-datatypes ((LongMap!808 0))(
  ( (LongMap!809 (underlying!415 Cell!808)) )
))
(declare-fun thiss!992 () LongMap!808)

(declare-fun tp_is_empty!2789 () Bool)

(declare-fun e!75960 () Bool)

(declare-fun array_inv!1367 (array!4583) Bool)

(declare-fun array_inv!1368 (array!4585) Bool)

(assert (=> b!116318 (= e!75956 (and tp!10603 tp_is_empty!2789 (array_inv!1367 (_keys!4439 (v!3048 (underlying!415 thiss!992)))) (array_inv!1368 (_values!2699 (v!3048 (underlying!415 thiss!992)))) e!75960))))

(declare-fun mapIsEmpty!4305 () Bool)

(declare-fun mapRes!4306 () Bool)

(assert (=> mapIsEmpty!4305 mapRes!4306))

(declare-fun b!116319 () Bool)

(declare-fun e!75959 () Bool)

(assert (=> b!116319 (= e!75959 e!75956)))

(declare-fun b!116320 () Bool)

(declare-fun e!75966 () Bool)

(declare-fun e!75958 () Bool)

(assert (=> b!116320 (= e!75966 e!75958)))

(declare-fun res!57013 () Bool)

(assert (=> b!116320 (=> (not res!57013) (not e!75958))))

(declare-datatypes ((tuple2!2538 0))(
  ( (tuple2!2539 (_1!1280 Bool) (_2!1280 LongMapFixedSize!1010)) )
))
(declare-fun lt!60315 () tuple2!2538)

(assert (=> b!116320 (= res!57013 (_1!1280 lt!60315))))

(declare-fun newMap!16 () LongMapFixedSize!1010)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun repackFrom!17 (LongMap!808 LongMapFixedSize!1010 (_ BitVec 32)) tuple2!2538)

(assert (=> b!116320 (= lt!60315 (repackFrom!17 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!116321 () Bool)

(declare-fun res!57008 () Bool)

(assert (=> b!116321 (=> (not res!57008) (not e!75966))))

(assert (=> b!116321 (= res!57008 (and (or (= (select (arr!2173 (_keys!4439 (v!3048 (underlying!415 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2173 (_keys!4439 (v!3048 (underlying!415 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun b!116322 () Bool)

(declare-fun valid!480 (LongMapFixedSize!1010) Bool)

(assert (=> b!116322 (= e!75958 (not (valid!480 (v!3048 (underlying!415 thiss!992)))))))

(declare-fun mapIsEmpty!4306 () Bool)

(declare-fun mapRes!4305 () Bool)

(assert (=> mapIsEmpty!4306 mapRes!4305))

(declare-fun e!75961 () Bool)

(declare-fun e!75962 () Bool)

(assert (=> b!116324 (= e!75961 (and tp!10605 tp_is_empty!2789 (array_inv!1367 (_keys!4439 newMap!16)) (array_inv!1368 (_values!2699 newMap!16)) e!75962))))

(declare-fun b!116325 () Bool)

(declare-fun e!75957 () Bool)

(assert (=> b!116325 (= e!75962 (and e!75957 mapRes!4306))))

(declare-fun condMapEmpty!4306 () Bool)

(declare-fun mapDefault!4306 () ValueCell!1051)

