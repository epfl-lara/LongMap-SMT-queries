; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14578 () Bool)

(assert start!14578)

(declare-fun b!137749 () Bool)

(declare-fun b_free!2973 () Bool)

(declare-fun b_next!2973 () Bool)

(assert (=> b!137749 (= b_free!2973 (not b_next!2973))))

(declare-fun tp!11381 () Bool)

(declare-fun b_and!8555 () Bool)

(assert (=> b!137749 (= tp!11381 b_and!8555)))

(declare-fun b!137748 () Bool)

(declare-fun b_free!2975 () Bool)

(declare-fun b_next!2975 () Bool)

(assert (=> b!137748 (= b_free!2975 (not b_next!2975))))

(declare-fun tp!11379 () Bool)

(declare-fun b_and!8557 () Bool)

(assert (=> b!137748 (= tp!11379 b_and!8557)))

(declare-fun b!137735 () Bool)

(declare-fun res!66011 () Bool)

(declare-fun e!89737 () Bool)

(assert (=> b!137735 (=> (not res!66011) (not e!89737))))

(declare-datatypes ((V!3517 0))(
  ( (V!3518 (val!1496 Int)) )
))
(declare-datatypes ((array!4837 0))(
  ( (array!4838 (arr!2287 (Array (_ BitVec 32) (_ BitVec 64))) (size!2558 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1108 0))(
  ( (ValueCellFull!1108 (v!3244 V!3517)) (EmptyCell!1108) )
))
(declare-datatypes ((array!4839 0))(
  ( (array!4840 (arr!2288 (Array (_ BitVec 32) ValueCell!1108)) (size!2559 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1124 0))(
  ( (LongMapFixedSize!1125 (defaultEntry!2914 Int) (mask!7240 (_ BitVec 32)) (extraKeys!2671 (_ BitVec 32)) (zeroValue!2765 V!3517) (minValue!2765 V!3517) (_size!611 (_ BitVec 32)) (_keys!4671 array!4837) (_values!2897 array!4839) (_vacant!611 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1124)

(declare-datatypes ((Cell!912 0))(
  ( (Cell!913 (v!3245 LongMapFixedSize!1124)) )
))
(declare-datatypes ((LongMap!912 0))(
  ( (LongMap!913 (underlying!467 Cell!912)) )
))
(declare-fun thiss!992 () LongMap!912)

(assert (=> b!137735 (= res!66011 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7240 newMap!16)) (_size!611 (v!3245 (underlying!467 thiss!992)))))))

(declare-fun b!137736 () Bool)

(declare-fun e!89732 () Bool)

(assert (=> b!137736 (= e!89737 e!89732)))

(declare-fun res!66008 () Bool)

(assert (=> b!137736 (=> (not res!66008) (not e!89732))))

(declare-datatypes ((tuple2!2664 0))(
  ( (tuple2!2665 (_1!1343 (_ BitVec 64)) (_2!1343 V!3517)) )
))
(declare-datatypes ((List!1730 0))(
  ( (Nil!1727) (Cons!1726 (h!2333 tuple2!2664) (t!6254 List!1730)) )
))
(declare-datatypes ((ListLongMap!1727 0))(
  ( (ListLongMap!1728 (toList!879 List!1730)) )
))
(declare-fun lt!72003 () ListLongMap!1727)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!72004 () ListLongMap!1727)

(assert (=> b!137736 (= res!66008 (and (= lt!72003 lt!72004) (not (= (select (arr!2287 (_keys!4671 (v!3245 (underlying!467 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2287 (_keys!4671 (v!3245 (underlying!467 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1426 (LongMapFixedSize!1124) ListLongMap!1727)

(assert (=> b!137736 (= lt!72004 (map!1426 newMap!16))))

(declare-fun getCurrentListMap!555 (array!4837 array!4839 (_ BitVec 32) (_ BitVec 32) V!3517 V!3517 (_ BitVec 32) Int) ListLongMap!1727)

(assert (=> b!137736 (= lt!72003 (getCurrentListMap!555 (_keys!4671 (v!3245 (underlying!467 thiss!992))) (_values!2897 (v!3245 (underlying!467 thiss!992))) (mask!7240 (v!3245 (underlying!467 thiss!992))) (extraKeys!2671 (v!3245 (underlying!467 thiss!992))) (zeroValue!2765 (v!3245 (underlying!467 thiss!992))) (minValue!2765 (v!3245 (underlying!467 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2914 (v!3245 (underlying!467 thiss!992)))))))

(declare-fun b!137737 () Bool)

(declare-fun e!89734 () Bool)

(declare-fun e!89743 () Bool)

(assert (=> b!137737 (= e!89734 e!89743)))

(declare-fun b!137738 () Bool)

(declare-fun e!89742 () Bool)

(declare-fun tp_is_empty!2903 () Bool)

(assert (=> b!137738 (= e!89742 tp_is_empty!2903)))

(declare-fun b!137739 () Bool)

(declare-fun e!89733 () Bool)

(assert (=> b!137739 (= e!89733 (not (or (bvsge (size!2558 (_keys!4671 (v!3245 (underlying!467 thiss!992)))) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!2558 (_keys!4671 (v!3245 (underlying!467 thiss!992))))))))))

(declare-fun arrayContainsKey!0 (array!4837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137739 (arrayContainsKey!0 (_keys!4671 (v!3245 (underlying!467 thiss!992))) (select (arr!2287 (_keys!4671 (v!3245 (underlying!467 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4340 0))(
  ( (Unit!4341) )
))
(declare-fun lt!72001 () Unit!4340)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!133 (array!4837 array!4839 (_ BitVec 32) (_ BitVec 32) V!3517 V!3517 (_ BitVec 64) (_ BitVec 32) Int) Unit!4340)

(assert (=> b!137739 (= lt!72001 (lemmaListMapContainsThenArrayContainsFrom!133 (_keys!4671 (v!3245 (underlying!467 thiss!992))) (_values!2897 (v!3245 (underlying!467 thiss!992))) (mask!7240 (v!3245 (underlying!467 thiss!992))) (extraKeys!2671 (v!3245 (underlying!467 thiss!992))) (zeroValue!2765 (v!3245 (underlying!467 thiss!992))) (minValue!2765 (v!3245 (underlying!467 thiss!992))) (select (arr!2287 (_keys!4671 (v!3245 (underlying!467 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2914 (v!3245 (underlying!467 thiss!992)))))))

(declare-fun b!137740 () Bool)

(declare-fun e!89745 () Bool)

(assert (=> b!137740 (= e!89745 tp_is_empty!2903)))

(declare-fun b!137741 () Bool)

(declare-fun e!89746 () Bool)

(assert (=> b!137741 (= e!89746 tp_is_empty!2903)))

(declare-fun b!137742 () Bool)

(assert (=> b!137742 (= e!89732 e!89733)))

(declare-fun res!66010 () Bool)

(assert (=> b!137742 (=> (not res!66010) (not e!89733))))

(declare-fun contains!912 (ListLongMap!1727 (_ BitVec 64)) Bool)

(assert (=> b!137742 (= res!66010 (contains!912 lt!72004 (select (arr!2287 (_keys!4671 (v!3245 (underlying!467 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2666 0))(
  ( (tuple2!2667 (_1!1344 Bool) (_2!1344 LongMapFixedSize!1124)) )
))
(declare-fun lt!72002 () tuple2!2666)

(declare-fun update!203 (LongMapFixedSize!1124 (_ BitVec 64) V!3517) tuple2!2666)

(declare-fun get!1505 (ValueCell!1108 V!3517) V!3517)

(declare-fun dynLambda!434 (Int (_ BitVec 64)) V!3517)

(assert (=> b!137742 (= lt!72002 (update!203 newMap!16 (select (arr!2287 (_keys!4671 (v!3245 (underlying!467 thiss!992)))) from!355) (get!1505 (select (arr!2288 (_values!2897 (v!3245 (underlying!467 thiss!992)))) from!355) (dynLambda!434 (defaultEntry!2914 (v!3245 (underlying!467 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!4739 () Bool)

(declare-fun mapRes!4740 () Bool)

(declare-fun tp!11382 () Bool)

(declare-fun e!89735 () Bool)

(assert (=> mapNonEmpty!4739 (= mapRes!4740 (and tp!11382 e!89735))))

(declare-fun mapValue!4739 () ValueCell!1108)

(declare-fun mapKey!4739 () (_ BitVec 32))

(declare-fun mapRest!4739 () (Array (_ BitVec 32) ValueCell!1108))

(assert (=> mapNonEmpty!4739 (= (arr!2288 (_values!2897 newMap!16)) (store mapRest!4739 mapKey!4739 mapValue!4739))))

(declare-fun b!137743 () Bool)

(declare-fun e!89744 () Bool)

(assert (=> b!137743 (= e!89744 (and e!89742 mapRes!4740))))

(declare-fun condMapEmpty!4740 () Bool)

(declare-fun mapDefault!4739 () ValueCell!1108)

