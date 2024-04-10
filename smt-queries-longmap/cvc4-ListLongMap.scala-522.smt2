; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13126 () Bool)

(assert start!13126)

(declare-fun b!115059 () Bool)

(declare-fun b_free!2661 () Bool)

(declare-fun b_next!2661 () Bool)

(assert (=> b!115059 (= b_free!2661 (not b_next!2661))))

(declare-fun tp!10345 () Bool)

(declare-fun b_and!7127 () Bool)

(assert (=> b!115059 (= tp!10345 b_and!7127)))

(declare-fun b!115050 () Bool)

(declare-fun b_free!2663 () Bool)

(declare-fun b_next!2663 () Bool)

(assert (=> b!115050 (= b_free!2663 (not b_next!2663))))

(declare-fun tp!10347 () Bool)

(declare-fun b_and!7129 () Bool)

(assert (=> b!115050 (= tp!10347 b_and!7129)))

(declare-fun mapIsEmpty!4173 () Bool)

(declare-fun mapRes!4173 () Bool)

(assert (=> mapIsEmpty!4173 mapRes!4173))

(declare-fun b!115046 () Bool)

(declare-fun e!74929 () Bool)

(declare-fun e!74932 () Bool)

(assert (=> b!115046 (= e!74929 e!74932)))

(declare-fun b!115047 () Bool)

(declare-fun e!74925 () Bool)

(assert (=> b!115047 (= e!74925 false)))

(declare-datatypes ((Unit!3600 0))(
  ( (Unit!3601) )
))
(declare-fun lt!59956 () Unit!3600)

(declare-fun e!74927 () Unit!3600)

(assert (=> b!115047 (= lt!59956 e!74927)))

(declare-datatypes ((V!3309 0))(
  ( (V!3310 (val!1418 Int)) )
))
(declare-datatypes ((tuple2!2500 0))(
  ( (tuple2!2501 (_1!1261 (_ BitVec 64)) (_2!1261 V!3309)) )
))
(declare-datatypes ((List!1663 0))(
  ( (Nil!1660) (Cons!1659 (h!2259 tuple2!2500) (t!5917 List!1663)) )
))
(declare-datatypes ((ListLongMap!1625 0))(
  ( (ListLongMap!1626 (toList!828 List!1663)) )
))
(declare-fun lt!59953 () ListLongMap!1625)

(declare-datatypes ((array!4497 0))(
  ( (array!4498 (arr!2131 (Array (_ BitVec 32) (_ BitVec 64))) (size!2391 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1030 0))(
  ( (ValueCellFull!1030 (v!3005 V!3309)) (EmptyCell!1030) )
))
(declare-datatypes ((array!4499 0))(
  ( (array!4500 (arr!2132 (Array (_ BitVec 32) ValueCell!1030)) (size!2392 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!968 0))(
  ( (LongMapFixedSize!969 (defaultEntry!2693 Int) (mask!6893 (_ BitVec 32)) (extraKeys!2482 (_ BitVec 32)) (zeroValue!2560 V!3309) (minValue!2560 V!3309) (_size!533 (_ BitVec 32)) (_keys!4415 array!4497) (_values!2676 array!4499) (_vacant!533 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!768 0))(
  ( (Cell!769 (v!3006 LongMapFixedSize!968)) )
))
(declare-datatypes ((LongMap!768 0))(
  ( (LongMap!769 (underlying!395 Cell!768)) )
))
(declare-fun thiss!992 () LongMap!768)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun c!20525 () Bool)

(declare-fun contains!860 (ListLongMap!1625 (_ BitVec 64)) Bool)

(assert (=> b!115047 (= c!20525 (contains!860 lt!59953 (select (arr!2131 (_keys!4415 (v!3006 (underlying!395 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!968)

(declare-datatypes ((tuple2!2502 0))(
  ( (tuple2!2503 (_1!1262 Bool) (_2!1262 LongMapFixedSize!968)) )
))
(declare-fun lt!59957 () tuple2!2502)

(declare-fun update!176 (LongMapFixedSize!968 (_ BitVec 64) V!3309) tuple2!2502)

(declare-fun get!1387 (ValueCell!1030 V!3309) V!3309)

(declare-fun dynLambda!403 (Int (_ BitVec 64)) V!3309)

(assert (=> b!115047 (= lt!59957 (update!176 newMap!16 (select (arr!2131 (_keys!4415 (v!3006 (underlying!395 thiss!992)))) from!355) (get!1387 (select (arr!2132 (_values!2676 (v!3006 (underlying!395 thiss!992)))) from!355) (dynLambda!403 (defaultEntry!2693 (v!3006 (underlying!395 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!4173 () Bool)

(declare-fun tp!10348 () Bool)

(declare-fun e!74924 () Bool)

(assert (=> mapNonEmpty!4173 (= mapRes!4173 (and tp!10348 e!74924))))

(declare-fun mapRest!4174 () (Array (_ BitVec 32) ValueCell!1030))

(declare-fun mapKey!4173 () (_ BitVec 32))

(declare-fun mapValue!4173 () ValueCell!1030)

(assert (=> mapNonEmpty!4173 (= (arr!2132 (_values!2676 (v!3006 (underlying!395 thiss!992)))) (store mapRest!4174 mapKey!4173 mapValue!4173))))

(declare-fun b!115048 () Bool)

(declare-fun e!74931 () Bool)

(declare-fun e!74936 () Bool)

(assert (=> b!115048 (= e!74931 (and e!74936 mapRes!4173))))

(declare-fun condMapEmpty!4174 () Bool)

(declare-fun mapDefault!4173 () ValueCell!1030)

