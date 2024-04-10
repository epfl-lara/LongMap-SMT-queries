; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10136 () Bool)

(assert start!10136)

(declare-fun b!77140 () Bool)

(declare-fun b_free!2161 () Bool)

(declare-fun b_next!2161 () Bool)

(assert (=> b!77140 (= b_free!2161 (not b_next!2161))))

(declare-fun tp!8682 () Bool)

(declare-fun b_and!4723 () Bool)

(assert (=> b!77140 (= tp!8682 b_and!4723)))

(declare-fun b!77134 () Bool)

(declare-fun b_free!2163 () Bool)

(declare-fun b_next!2163 () Bool)

(assert (=> b!77134 (= b_free!2163 (not b_next!2163))))

(declare-fun tp!8680 () Bool)

(declare-fun b_and!4725 () Bool)

(assert (=> b!77134 (= tp!8680 b_and!4725)))

(declare-fun e!50389 () Bool)

(declare-fun tp_is_empty!2497 () Bool)

(declare-datatypes ((V!2977 0))(
  ( (V!2978 (val!1293 Int)) )
))
(declare-datatypes ((array!3945 0))(
  ( (array!3946 (arr!1881 (Array (_ BitVec 32) (_ BitVec 64))) (size!2122 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!905 0))(
  ( (ValueCellFull!905 (v!2575 V!2977)) (EmptyCell!905) )
))
(declare-datatypes ((array!3947 0))(
  ( (array!3948 (arr!1882 (Array (_ BitVec 32) ValueCell!905)) (size!2123 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!718 0))(
  ( (LongMapFixedSize!719 (defaultEntry!2262 Int) (mask!6253 (_ BitVec 32)) (extraKeys!2113 (_ BitVec 32)) (zeroValue!2160 V!2977) (minValue!2160 V!2977) (_size!408 (_ BitVec 32)) (_keys!3922 array!3945) (_values!2245 array!3947) (_vacant!408 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!718)

(declare-fun e!50394 () Bool)

(declare-fun array_inv!1161 (array!3945) Bool)

(declare-fun array_inv!1162 (array!3947) Bool)

(assert (=> b!77134 (= e!50394 (and tp!8680 tp_is_empty!2497 (array_inv!1161 (_keys!3922 newMap!16)) (array_inv!1162 (_values!2245 newMap!16)) e!50389))))

(declare-fun mapNonEmpty!3257 () Bool)

(declare-fun mapRes!3258 () Bool)

(declare-fun tp!8681 () Bool)

(declare-fun e!50390 () Bool)

(assert (=> mapNonEmpty!3257 (= mapRes!3258 (and tp!8681 e!50390))))

(declare-fun mapValue!3257 () ValueCell!905)

(declare-fun mapKey!3257 () (_ BitVec 32))

(declare-fun mapRest!3258 () (Array (_ BitVec 32) ValueCell!905))

(assert (=> mapNonEmpty!3257 (= (arr!1882 (_values!2245 newMap!16)) (store mapRest!3258 mapKey!3257 mapValue!3257))))

(declare-fun b!77135 () Bool)

(declare-fun e!50387 () Bool)

(declare-fun e!50388 () Bool)

(assert (=> b!77135 (= e!50387 e!50388)))

(declare-fun res!40543 () Bool)

(assert (=> b!77135 (=> (not res!40543) (not e!50388))))

(declare-datatypes ((tuple2!2154 0))(
  ( (tuple2!2155 (_1!1088 (_ BitVec 64)) (_2!1088 V!2977)) )
))
(declare-datatypes ((List!1497 0))(
  ( (Nil!1494) (Cons!1493 (h!2081 tuple2!2154) (t!5115 List!1497)) )
))
(declare-datatypes ((ListLongMap!1437 0))(
  ( (ListLongMap!1438 (toList!734 List!1497)) )
))
(declare-fun lt!35288 () ListLongMap!1437)

(declare-fun lt!35299 () ListLongMap!1437)

(assert (=> b!77135 (= res!40543 (= lt!35288 lt!35299))))

(declare-fun map!1166 (LongMapFixedSize!718) ListLongMap!1437)

(assert (=> b!77135 (= lt!35299 (map!1166 newMap!16))))

(declare-datatypes ((Cell!520 0))(
  ( (Cell!521 (v!2576 LongMapFixedSize!718)) )
))
(declare-datatypes ((LongMap!520 0))(
  ( (LongMap!521 (underlying!271 Cell!520)) )
))
(declare-fun thiss!992 () LongMap!520)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!429 (array!3945 array!3947 (_ BitVec 32) (_ BitVec 32) V!2977 V!2977 (_ BitVec 32) Int) ListLongMap!1437)

(assert (=> b!77135 (= lt!35288 (getCurrentListMap!429 (_keys!3922 (v!2576 (underlying!271 thiss!992))) (_values!2245 (v!2576 (underlying!271 thiss!992))) (mask!6253 (v!2576 (underlying!271 thiss!992))) (extraKeys!2113 (v!2576 (underlying!271 thiss!992))) (zeroValue!2160 (v!2576 (underlying!271 thiss!992))) (minValue!2160 (v!2576 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2262 (v!2576 (underlying!271 thiss!992)))))))

(declare-fun b!77136 () Bool)

(declare-fun res!40546 () Bool)

(assert (=> b!77136 (=> (not res!40546) (not e!50387))))

(assert (=> b!77136 (= res!40546 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2122 (_keys!3922 (v!2576 (underlying!271 thiss!992)))))))))

(declare-fun mapNonEmpty!3258 () Bool)

(declare-fun mapRes!3257 () Bool)

(declare-fun tp!8679 () Bool)

(declare-fun e!50380 () Bool)

(assert (=> mapNonEmpty!3258 (= mapRes!3257 (and tp!8679 e!50380))))

(declare-fun mapRest!3257 () (Array (_ BitVec 32) ValueCell!905))

(declare-fun mapValue!3258 () ValueCell!905)

(declare-fun mapKey!3258 () (_ BitVec 32))

(assert (=> mapNonEmpty!3258 (= (arr!1882 (_values!2245 (v!2576 (underlying!271 thiss!992)))) (store mapRest!3257 mapKey!3258 mapValue!3258))))

(declare-fun b!77137 () Bool)

(declare-fun res!40545 () Bool)

(assert (=> b!77137 (=> (not res!40545) (not e!50387))))

(assert (=> b!77137 (= res!40545 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6253 newMap!16)) (_size!408 (v!2576 (underlying!271 thiss!992)))))))

(declare-fun b!77138 () Bool)

(declare-fun e!50384 () Bool)

(assert (=> b!77138 (= e!50389 (and e!50384 mapRes!3258))))

(declare-fun condMapEmpty!3257 () Bool)

(declare-fun mapDefault!3258 () ValueCell!905)

