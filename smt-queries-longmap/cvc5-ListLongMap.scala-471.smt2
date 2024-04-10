; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9212 () Bool)

(assert start!9212)

(declare-fun b!65654 () Bool)

(declare-fun b_free!2041 () Bool)

(declare-fun b_next!2041 () Bool)

(assert (=> b!65654 (= b_free!2041 (not b_next!2041))))

(declare-fun tp!8274 () Bool)

(declare-fun b_and!4035 () Bool)

(assert (=> b!65654 (= tp!8274 b_and!4035)))

(declare-fun b!65653 () Bool)

(declare-fun b_free!2043 () Bool)

(declare-fun b_next!2043 () Bool)

(assert (=> b!65653 (= b_free!2043 (not b_next!2043))))

(declare-fun tp!8271 () Bool)

(declare-fun b_and!4037 () Bool)

(assert (=> b!65653 (= tp!8271 b_and!4037)))

(declare-fun b!65640 () Bool)

(declare-datatypes ((Unit!1814 0))(
  ( (Unit!1815) )
))
(declare-fun e!43010 () Unit!1814)

(declare-fun Unit!1816 () Unit!1814)

(assert (=> b!65640 (= e!43010 Unit!1816)))

(declare-fun b!65641 () Bool)

(declare-fun res!35683 () Bool)

(declare-fun e!43011 () Bool)

(assert (=> b!65641 (=> (not res!35683) (not e!43011))))

(declare-datatypes ((V!2897 0))(
  ( (V!2898 (val!1263 Int)) )
))
(declare-datatypes ((array!3811 0))(
  ( (array!3812 (arr!1821 (Array (_ BitVec 32) (_ BitVec 64))) (size!2056 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!875 0))(
  ( (ValueCellFull!875 (v!2462 V!2897)) (EmptyCell!875) )
))
(declare-datatypes ((array!3813 0))(
  ( (array!3814 (arr!1822 (Array (_ BitVec 32) ValueCell!875)) (size!2057 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!658 0))(
  ( (LongMapFixedSize!659 (defaultEntry!2137 Int) (mask!6067 (_ BitVec 32)) (extraKeys!2008 (_ BitVec 32)) (zeroValue!2045 V!2897) (minValue!2045 V!2897) (_size!378 (_ BitVec 32)) (_keys!3777 array!3811) (_values!2120 array!3813) (_vacant!378 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!658)

(declare-datatypes ((Cell!466 0))(
  ( (Cell!467 (v!2463 LongMapFixedSize!658)) )
))
(declare-datatypes ((LongMap!466 0))(
  ( (LongMap!467 (underlying!244 Cell!466)) )
))
(declare-fun thiss!992 () LongMap!466)

(assert (=> b!65641 (= res!35683 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6067 newMap!16)) (_size!378 (v!2463 (underlying!244 thiss!992)))))))

(declare-fun b!65642 () Bool)

(declare-fun e!43017 () Bool)

(assert (=> b!65642 (= e!43017 false)))

(declare-datatypes ((tuple2!2072 0))(
  ( (tuple2!2073 (_1!1047 (_ BitVec 64)) (_2!1047 V!2897)) )
))
(declare-datatypes ((List!1456 0))(
  ( (Nil!1453) (Cons!1452 (h!2036 tuple2!2072) (t!4910 List!1456)) )
))
(declare-datatypes ((ListLongMap!1391 0))(
  ( (ListLongMap!1392 (toList!711 List!1456)) )
))
(declare-fun lt!28176 () ListLongMap!1391)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!49 (array!3811 array!3813 (_ BitVec 32) (_ BitVec 32) V!2897 V!2897 (_ BitVec 32) Int) ListLongMap!1391)

(assert (=> b!65642 (= lt!28176 (getCurrentListMapNoExtraKeys!49 (_keys!3777 (v!2463 (underlying!244 thiss!992))) (_values!2120 (v!2463 (underlying!244 thiss!992))) (mask!6067 (v!2463 (underlying!244 thiss!992))) (extraKeys!2008 (v!2463 (underlying!244 thiss!992))) (zeroValue!2045 (v!2463 (underlying!244 thiss!992))) (minValue!2045 (v!2463 (underlying!244 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2137 (v!2463 (underlying!244 thiss!992)))))))

(declare-fun b!65643 () Bool)

(declare-fun e!43006 () Bool)

(declare-fun tp_is_empty!2437 () Bool)

(assert (=> b!65643 (= e!43006 tp_is_empty!2437)))

(declare-fun mapNonEmpty!3029 () Bool)

(declare-fun mapRes!3030 () Bool)

(declare-fun tp!8273 () Bool)

(assert (=> mapNonEmpty!3029 (= mapRes!3030 (and tp!8273 e!43006))))

(declare-fun mapValue!3029 () ValueCell!875)

(declare-fun mapRest!3030 () (Array (_ BitVec 32) ValueCell!875))

(declare-fun mapKey!3030 () (_ BitVec 32))

(assert (=> mapNonEmpty!3029 (= (arr!1822 (_values!2120 (v!2463 (underlying!244 thiss!992)))) (store mapRest!3030 mapKey!3030 mapValue!3029))))

(declare-fun b!65644 () Bool)

(declare-fun e!43009 () Bool)

(assert (=> b!65644 (= e!43009 tp_is_empty!2437)))

(declare-fun b!65646 () Bool)

(declare-fun e!43019 () Bool)

(declare-fun e!43018 () Bool)

(declare-fun mapRes!3029 () Bool)

(assert (=> b!65646 (= e!43019 (and e!43018 mapRes!3029))))

(declare-fun condMapEmpty!3030 () Bool)

(declare-fun mapDefault!3029 () ValueCell!875)

