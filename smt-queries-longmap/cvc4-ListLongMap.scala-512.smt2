; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12516 () Bool)

(assert start!12516)

(declare-fun b!107456 () Bool)

(declare-fun b_free!2541 () Bool)

(declare-fun b_next!2541 () Bool)

(assert (=> b!107456 (= b_free!2541 (not b_next!2541))))

(declare-fun tp!9954 () Bool)

(declare-fun b_and!6627 () Bool)

(assert (=> b!107456 (= tp!9954 b_and!6627)))

(declare-fun b!107457 () Bool)

(declare-fun b_free!2543 () Bool)

(declare-fun b_next!2543 () Bool)

(assert (=> b!107457 (= b_free!2543 (not b_next!2543))))

(declare-fun tp!9956 () Bool)

(declare-fun b_and!6629 () Bool)

(assert (=> b!107457 (= tp!9956 b_and!6629)))

(declare-fun b!107453 () Bool)

(declare-fun e!69947 () Bool)

(declare-fun e!69934 () Bool)

(assert (=> b!107453 (= e!69947 e!69934)))

(declare-fun res!53359 () Bool)

(assert (=> b!107453 (=> (not res!53359) (not e!69934))))

(declare-datatypes ((V!3229 0))(
  ( (V!3230 (val!1388 Int)) )
))
(declare-datatypes ((array!4367 0))(
  ( (array!4368 (arr!2071 (Array (_ BitVec 32) (_ BitVec 64))) (size!2327 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1000 0))(
  ( (ValueCellFull!1000 (v!2909 V!3229)) (EmptyCell!1000) )
))
(declare-datatypes ((array!4369 0))(
  ( (array!4370 (arr!2072 (Array (_ BitVec 32) ValueCell!1000)) (size!2328 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!908 0))(
  ( (LongMapFixedSize!909 (defaultEntry!2604 Int) (mask!6760 (_ BitVec 32)) (extraKeys!2405 (_ BitVec 32)) (zeroValue!2477 V!3229) (minValue!2477 V!3229) (_size!503 (_ BitVec 32)) (_keys!4314 array!4367) (_values!2587 array!4369) (_vacant!503 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2420 0))(
  ( (tuple2!2421 (_1!1221 Bool) (_2!1221 LongMapFixedSize!908)) )
))
(declare-fun lt!55115 () tuple2!2420)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!107453 (= res!53359 (and (_1!1221 lt!55115) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3317 0))(
  ( (Unit!3318) )
))
(declare-fun lt!55117 () Unit!3317)

(declare-fun e!69935 () Unit!3317)

(assert (=> b!107453 (= lt!55117 e!69935)))

(declare-fun c!18843 () Bool)

(declare-datatypes ((Cell!708 0))(
  ( (Cell!709 (v!2910 LongMapFixedSize!908)) )
))
(declare-datatypes ((LongMap!708 0))(
  ( (LongMap!709 (underlying!365 Cell!708)) )
))
(declare-fun thiss!992 () LongMap!708)

(declare-datatypes ((tuple2!2422 0))(
  ( (tuple2!2423 (_1!1222 (_ BitVec 64)) (_2!1222 V!3229)) )
))
(declare-datatypes ((List!1623 0))(
  ( (Nil!1620) (Cons!1619 (h!2217 tuple2!2422) (t!5731 List!1623)) )
))
(declare-datatypes ((ListLongMap!1581 0))(
  ( (ListLongMap!1582 (toList!806 List!1623)) )
))
(declare-fun lt!55118 () ListLongMap!1581)

(declare-fun contains!832 (ListLongMap!1581 (_ BitVec 64)) Bool)

(assert (=> b!107453 (= c!18843 (contains!832 lt!55118 (select (arr!2071 (_keys!4314 (v!2910 (underlying!365 thiss!992)))) from!355)))))

(declare-fun lt!55119 () V!3229)

(declare-fun newMap!16 () LongMapFixedSize!908)

(declare-fun update!158 (LongMapFixedSize!908 (_ BitVec 64) V!3229) tuple2!2420)

(assert (=> b!107453 (= lt!55115 (update!158 newMap!16 (select (arr!2071 (_keys!4314 (v!2910 (underlying!365 thiss!992)))) from!355) lt!55119))))

(declare-fun b!107454 () Bool)

(declare-fun e!69938 () Bool)

(declare-fun e!69946 () Bool)

(assert (=> b!107454 (= e!69938 e!69946)))

(declare-fun res!53353 () Bool)

(assert (=> b!107454 (=> (not res!53353) (not e!69946))))

(declare-fun lt!55112 () ListLongMap!1581)

(assert (=> b!107454 (= res!53353 (= lt!55112 lt!55118))))

(declare-fun map!1290 (LongMapFixedSize!908) ListLongMap!1581)

(assert (=> b!107454 (= lt!55118 (map!1290 newMap!16))))

(declare-fun getCurrentListMap!491 (array!4367 array!4369 (_ BitVec 32) (_ BitVec 32) V!3229 V!3229 (_ BitVec 32) Int) ListLongMap!1581)

(assert (=> b!107454 (= lt!55112 (getCurrentListMap!491 (_keys!4314 (v!2910 (underlying!365 thiss!992))) (_values!2587 (v!2910 (underlying!365 thiss!992))) (mask!6760 (v!2910 (underlying!365 thiss!992))) (extraKeys!2405 (v!2910 (underlying!365 thiss!992))) (zeroValue!2477 (v!2910 (underlying!365 thiss!992))) (minValue!2477 (v!2910 (underlying!365 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2604 (v!2910 (underlying!365 thiss!992)))))))

(declare-fun b!107455 () Bool)

(declare-fun res!53360 () Bool)

(assert (=> b!107455 (=> (not res!53360) (not e!69938))))

(assert (=> b!107455 (= res!53360 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2327 (_keys!4314 (v!2910 (underlying!365 thiss!992)))))))))

(declare-fun tp_is_empty!2687 () Bool)

(declare-fun e!69932 () Bool)

(declare-fun e!69941 () Bool)

(declare-fun array_inv!1305 (array!4367) Bool)

(declare-fun array_inv!1306 (array!4369) Bool)

(assert (=> b!107456 (= e!69941 (and tp!9954 tp_is_empty!2687 (array_inv!1305 (_keys!4314 (v!2910 (underlying!365 thiss!992)))) (array_inv!1306 (_values!2587 (v!2910 (underlying!365 thiss!992)))) e!69932))))

(declare-fun e!69933 () Bool)

(declare-fun e!69949 () Bool)

(assert (=> b!107457 (= e!69949 (and tp!9956 tp_is_empty!2687 (array_inv!1305 (_keys!4314 newMap!16)) (array_inv!1306 (_values!2587 newMap!16)) e!69933))))

(declare-fun b!107458 () Bool)

(declare-fun res!53354 () Bool)

(assert (=> b!107458 (=> (not res!53354) (not e!69938))))

(assert (=> b!107458 (= res!53354 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6760 newMap!16)) (_size!503 (v!2910 (underlying!365 thiss!992)))))))

(declare-fun b!107459 () Bool)

(declare-fun e!69948 () Bool)

(declare-fun mapRes!3962 () Bool)

(assert (=> b!107459 (= e!69933 (and e!69948 mapRes!3962))))

(declare-fun condMapEmpty!3961 () Bool)

(declare-fun mapDefault!3962 () ValueCell!1000)

