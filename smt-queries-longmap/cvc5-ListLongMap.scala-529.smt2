; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13202 () Bool)

(assert start!13202)

(declare-fun b!116211 () Bool)

(declare-fun b_free!2737 () Bool)

(declare-fun b_next!2737 () Bool)

(assert (=> b!116211 (= b_free!2737 (not b_next!2737))))

(declare-fun tp!10579 () Bool)

(declare-fun b_and!7235 () Bool)

(assert (=> b!116211 (= tp!10579 b_and!7235)))

(declare-fun b!116222 () Bool)

(declare-fun b_free!2739 () Bool)

(declare-fun b_next!2739 () Bool)

(assert (=> b!116222 (= b_free!2739 (not b_next!2739))))

(declare-fun tp!10581 () Bool)

(declare-fun b_and!7237 () Bool)

(assert (=> b!116222 (= tp!10581 b_and!7237)))

(declare-fun b!116210 () Bool)

(declare-fun res!56964 () Bool)

(declare-fun e!75873 () Bool)

(assert (=> b!116210 (=> (not res!56964) (not e!75873))))

(declare-datatypes ((V!3361 0))(
  ( (V!3362 (val!1437 Int)) )
))
(declare-datatypes ((array!4575 0))(
  ( (array!4576 (arr!2169 (Array (_ BitVec 32) (_ BitVec 64))) (size!2430 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1049 0))(
  ( (ValueCellFull!1049 (v!3043 V!3361)) (EmptyCell!1049) )
))
(declare-datatypes ((array!4577 0))(
  ( (array!4578 (arr!2170 (Array (_ BitVec 32) ValueCell!1049)) (size!2431 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1006 0))(
  ( (LongMapFixedSize!1007 (defaultEntry!2714 Int) (mask!6930 (_ BitVec 32)) (extraKeys!2503 (_ BitVec 32)) (zeroValue!2581 V!3361) (minValue!2581 V!3361) (_size!552 (_ BitVec 32)) (_keys!4437 array!4575) (_values!2697 array!4577) (_vacant!552 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1006)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!804 0))(
  ( (Cell!805 (v!3044 LongMapFixedSize!1006)) )
))
(declare-datatypes ((LongMap!804 0))(
  ( (LongMap!805 (underlying!413 Cell!804)) )
))
(declare-fun thiss!992 () LongMap!804)

(declare-datatypes ((tuple2!2530 0))(
  ( (tuple2!2531 (_1!1276 (_ BitVec 64)) (_2!1276 V!3361)) )
))
(declare-datatypes ((List!1677 0))(
  ( (Nil!1674) (Cons!1673 (h!2273 tuple2!2530) (t!5939 List!1677)) )
))
(declare-datatypes ((ListLongMap!1651 0))(
  ( (ListLongMap!1652 (toList!841 List!1677)) )
))
(declare-fun getCurrentListMap!522 (array!4575 array!4577 (_ BitVec 32) (_ BitVec 32) V!3361 V!3361 (_ BitVec 32) Int) ListLongMap!1651)

(declare-fun map!1355 (LongMapFixedSize!1006) ListLongMap!1651)

(assert (=> b!116210 (= res!56964 (= (getCurrentListMap!522 (_keys!4437 (v!3044 (underlying!413 thiss!992))) (_values!2697 (v!3044 (underlying!413 thiss!992))) (mask!6930 (v!3044 (underlying!413 thiss!992))) (extraKeys!2503 (v!3044 (underlying!413 thiss!992))) (zeroValue!2581 (v!3044 (underlying!413 thiss!992))) (minValue!2581 (v!3044 (underlying!413 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3044 (underlying!413 thiss!992)))) (map!1355 newMap!16)))))

(declare-fun e!75874 () Bool)

(declare-fun e!75875 () Bool)

(declare-fun tp_is_empty!2785 () Bool)

(declare-fun array_inv!1363 (array!4575) Bool)

(declare-fun array_inv!1364 (array!4577) Bool)

(assert (=> b!116211 (= e!75874 (and tp!10579 tp_is_empty!2785 (array_inv!1363 (_keys!4437 (v!3044 (underlying!413 thiss!992)))) (array_inv!1364 (_values!2697 (v!3044 (underlying!413 thiss!992)))) e!75875))))

(declare-fun b!116212 () Bool)

(declare-fun e!75884 () Bool)

(assert (=> b!116212 (= e!75873 e!75884)))

(declare-fun res!56960 () Bool)

(assert (=> b!116212 (=> (not res!56960) (not e!75884))))

(declare-datatypes ((tuple2!2532 0))(
  ( (tuple2!2533 (_1!1277 Bool) (_2!1277 LongMapFixedSize!1006)) )
))
(declare-fun lt!60309 () tuple2!2532)

(assert (=> b!116212 (= res!56960 (_1!1277 lt!60309))))

(declare-fun repackFrom!15 (LongMap!804 LongMapFixedSize!1006 (_ BitVec 32)) tuple2!2532)

(assert (=> b!116212 (= lt!60309 (repackFrom!15 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!116213 () Bool)

(declare-fun valid!477 (LongMapFixedSize!1006) Bool)

(assert (=> b!116213 (= e!75884 (not (valid!477 (v!3044 (underlying!413 thiss!992)))))))

(declare-fun b!116214 () Bool)

(declare-fun e!75883 () Bool)

(declare-fun mapRes!4294 () Bool)

(assert (=> b!116214 (= e!75875 (and e!75883 mapRes!4294))))

(declare-fun condMapEmpty!4293 () Bool)

(declare-fun mapDefault!4294 () ValueCell!1049)

