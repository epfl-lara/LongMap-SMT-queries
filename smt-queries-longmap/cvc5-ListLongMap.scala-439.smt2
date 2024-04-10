; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8246 () Bool)

(assert start!8246)

(declare-fun b!52426 () Bool)

(declare-fun b_free!1657 () Bool)

(declare-fun b_next!1657 () Bool)

(assert (=> b!52426 (= b_free!1657 (not b_next!1657))))

(declare-fun tp!7073 () Bool)

(declare-fun b_and!2867 () Bool)

(assert (=> b!52426 (= tp!7073 b_and!2867)))

(declare-fun b!52429 () Bool)

(declare-fun b_free!1659 () Bool)

(declare-fun b_next!1659 () Bool)

(assert (=> b!52429 (= b_free!1659 (not b_next!1659))))

(declare-fun tp!7074 () Bool)

(declare-fun b_and!2869 () Bool)

(assert (=> b!52429 (= tp!7074 b_and!2869)))

(declare-fun b!52420 () Bool)

(declare-fun e!34129 () Bool)

(declare-fun tp_is_empty!2245 () Bool)

(assert (=> b!52420 (= e!34129 tp_is_empty!2245)))

(declare-fun b!52421 () Bool)

(declare-fun res!29803 () Bool)

(declare-fun e!34134 () Bool)

(assert (=> b!52421 (=> (not res!29803) (not e!34134))))

(declare-datatypes ((V!2641 0))(
  ( (V!2642 (val!1167 Int)) )
))
(declare-datatypes ((array!3413 0))(
  ( (array!3414 (arr!1629 (Array (_ BitVec 32) (_ BitVec 64))) (size!1858 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!779 0))(
  ( (ValueCellFull!779 (v!2223 V!2641)) (EmptyCell!779) )
))
(declare-datatypes ((array!3415 0))(
  ( (array!3416 (arr!1630 (Array (_ BitVec 32) ValueCell!779)) (size!1859 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!466 0))(
  ( (LongMapFixedSize!467 (defaultEntry!1947 Int) (mask!5772 (_ BitVec 32)) (extraKeys!1838 (_ BitVec 32)) (zeroValue!1865 V!2641) (minValue!1865 V!2641) (_size!282 (_ BitVec 32)) (_keys!3567 array!3413) (_values!1930 array!3415) (_vacant!282 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!466)

(declare-fun valid!168 (LongMapFixedSize!466) Bool)

(assert (=> b!52421 (= res!29803 (valid!168 newMap!16))))

(declare-fun b!52422 () Bool)

(declare-fun res!29801 () Bool)

(assert (=> b!52422 (=> (not res!29801) (not e!34134))))

(declare-datatypes ((Cell!288 0))(
  ( (Cell!289 (v!2224 LongMapFixedSize!466)) )
))
(declare-datatypes ((LongMap!288 0))(
  ( (LongMap!289 (underlying!155 Cell!288)) )
))
(declare-fun thiss!992 () LongMap!288)

(assert (=> b!52422 (= res!29801 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5772 newMap!16)) (_size!282 (v!2224 (underlying!155 thiss!992)))))))

(declare-fun res!29804 () Bool)

(assert (=> start!8246 (=> (not res!29804) (not e!34134))))

(declare-fun valid!169 (LongMap!288) Bool)

(assert (=> start!8246 (= res!29804 (valid!169 thiss!992))))

(assert (=> start!8246 e!34134))

(declare-fun e!34137 () Bool)

(assert (=> start!8246 e!34137))

(assert (=> start!8246 true))

(declare-fun e!34133 () Bool)

(assert (=> start!8246 e!34133))

(declare-fun b!52423 () Bool)

(declare-fun e!34128 () Bool)

(assert (=> b!52423 (= e!34128 tp_is_empty!2245)))

(declare-fun b!52424 () Bool)

(declare-fun e!34135 () Bool)

(assert (=> b!52424 (= e!34135 tp_is_empty!2245)))

(declare-fun b!52425 () Bool)

(declare-fun res!29802 () Bool)

(assert (=> b!52425 (=> (not res!29802) (not e!34134))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52425 (= res!29802 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1858 (_keys!3567 (v!2224 (underlying!155 thiss!992)))))))))

(declare-fun e!34136 () Bool)

(declare-fun e!34130 () Bool)

(declare-fun array_inv!1005 (array!3413) Bool)

(declare-fun array_inv!1006 (array!3415) Bool)

(assert (=> b!52426 (= e!34136 (and tp!7073 tp_is_empty!2245 (array_inv!1005 (_keys!3567 (v!2224 (underlying!155 thiss!992)))) (array_inv!1006 (_values!1930 (v!2224 (underlying!155 thiss!992)))) e!34130))))

(declare-fun b!52427 () Bool)

(declare-fun e!34127 () Bool)

(assert (=> b!52427 (= e!34127 tp_is_empty!2245)))

(declare-fun mapIsEmpty!2405 () Bool)

(declare-fun mapRes!2405 () Bool)

(assert (=> mapIsEmpty!2405 mapRes!2405))

(declare-fun b!52428 () Bool)

(assert (=> b!52428 (= e!34134 false)))

(declare-datatypes ((tuple2!1848 0))(
  ( (tuple2!1849 (_1!935 (_ BitVec 64)) (_2!935 V!2641)) )
))
(declare-datatypes ((List!1340 0))(
  ( (Nil!1337) (Cons!1336 (h!1916 tuple2!1848) (t!4374 List!1340)) )
))
(declare-datatypes ((ListLongMap!1263 0))(
  ( (ListLongMap!1264 (toList!647 List!1340)) )
))
(declare-fun lt!21282 () ListLongMap!1263)

(declare-fun map!1013 (LongMapFixedSize!466) ListLongMap!1263)

(assert (=> b!52428 (= lt!21282 (map!1013 newMap!16))))

(declare-fun lt!21281 () ListLongMap!1263)

(declare-fun getCurrentListMap!360 (array!3413 array!3415 (_ BitVec 32) (_ BitVec 32) V!2641 V!2641 (_ BitVec 32) Int) ListLongMap!1263)

(assert (=> b!52428 (= lt!21281 (getCurrentListMap!360 (_keys!3567 (v!2224 (underlying!155 thiss!992))) (_values!1930 (v!2224 (underlying!155 thiss!992))) (mask!5772 (v!2224 (underlying!155 thiss!992))) (extraKeys!1838 (v!2224 (underlying!155 thiss!992))) (zeroValue!1865 (v!2224 (underlying!155 thiss!992))) (minValue!1865 (v!2224 (underlying!155 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1947 (v!2224 (underlying!155 thiss!992)))))))

(declare-fun e!34139 () Bool)

(assert (=> b!52429 (= e!34133 (and tp!7074 tp_is_empty!2245 (array_inv!1005 (_keys!3567 newMap!16)) (array_inv!1006 (_values!1930 newMap!16)) e!34139))))

(declare-fun b!52430 () Bool)

(assert (=> b!52430 (= e!34139 (and e!34127 mapRes!2405))))

(declare-fun condMapEmpty!2405 () Bool)

(declare-fun mapDefault!2406 () ValueCell!779)

