; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9426 () Bool)

(assert start!9426)

(declare-fun b!68543 () Bool)

(declare-fun b_free!2085 () Bool)

(declare-fun b_next!2085 () Bool)

(assert (=> b!68543 (= b_free!2085 (not b_next!2085))))

(declare-fun tp!8416 () Bool)

(declare-fun b_and!4227 () Bool)

(assert (=> b!68543 (= tp!8416 b_and!4227)))

(declare-fun b!68537 () Bool)

(declare-fun b_free!2087 () Bool)

(declare-fun b_next!2087 () Bool)

(assert (=> b!68537 (= b_free!2087 (not b_next!2087))))

(declare-fun tp!8417 () Bool)

(declare-fun b_and!4229 () Bool)

(assert (=> b!68537 (= tp!8417 b_and!4229)))

(declare-fun b!68527 () Bool)

(declare-fun e!44929 () Bool)

(declare-fun e!44927 () Bool)

(assert (=> b!68527 (= e!44929 e!44927)))

(declare-fun res!36870 () Bool)

(assert (=> b!68527 (=> (not res!36870) (not e!44927))))

(declare-datatypes ((V!2925 0))(
  ( (V!2926 (val!1274 Int)) )
))
(declare-datatypes ((tuple2!2104 0))(
  ( (tuple2!2105 (_1!1063 (_ BitVec 64)) (_2!1063 V!2925)) )
))
(declare-datatypes ((List!1471 0))(
  ( (Nil!1468) (Cons!1467 (h!2052 tuple2!2104) (t!4978 List!1471)) )
))
(declare-datatypes ((ListLongMap!1409 0))(
  ( (ListLongMap!1410 (toList!720 List!1471)) )
))
(declare-fun lt!29924 () ListLongMap!1409)

(declare-fun lt!29934 () ListLongMap!1409)

(assert (=> b!68527 (= res!36870 (= lt!29924 lt!29934))))

(declare-datatypes ((array!3859 0))(
  ( (array!3860 (arr!1843 (Array (_ BitVec 32) (_ BitVec 64))) (size!2079 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!886 0))(
  ( (ValueCellFull!886 (v!2495 V!2925)) (EmptyCell!886) )
))
(declare-datatypes ((array!3861 0))(
  ( (array!3862 (arr!1844 (Array (_ BitVec 32) ValueCell!886)) (size!2080 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!680 0))(
  ( (LongMapFixedSize!681 (defaultEntry!2169 Int) (mask!6114 (_ BitVec 32)) (extraKeys!2036 (_ BitVec 32)) (zeroValue!2075 V!2925) (minValue!2075 V!2925) (_size!389 (_ BitVec 32)) (_keys!3813 array!3859) (_values!2152 array!3861) (_vacant!389 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!680)

(declare-fun map!1141 (LongMapFixedSize!680) ListLongMap!1409)

(assert (=> b!68527 (= lt!29934 (map!1141 newMap!16))))

(declare-datatypes ((Cell!486 0))(
  ( (Cell!487 (v!2496 LongMapFixedSize!680)) )
))
(declare-datatypes ((LongMap!486 0))(
  ( (LongMap!487 (underlying!254 Cell!486)) )
))
(declare-fun thiss!992 () LongMap!486)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!418 (array!3859 array!3861 (_ BitVec 32) (_ BitVec 32) V!2925 V!2925 (_ BitVec 32) Int) ListLongMap!1409)

(assert (=> b!68527 (= lt!29924 (getCurrentListMap!418 (_keys!3813 (v!2496 (underlying!254 thiss!992))) (_values!2152 (v!2496 (underlying!254 thiss!992))) (mask!6114 (v!2496 (underlying!254 thiss!992))) (extraKeys!2036 (v!2496 (underlying!254 thiss!992))) (zeroValue!2075 (v!2496 (underlying!254 thiss!992))) (minValue!2075 (v!2496 (underlying!254 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2169 (v!2496 (underlying!254 thiss!992)))))))

(declare-fun b!68528 () Bool)

(declare-fun e!44934 () Bool)

(declare-fun e!44925 () Bool)

(assert (=> b!68528 (= e!44934 (not e!44925))))

(declare-fun res!36865 () Bool)

(assert (=> b!68528 (=> res!36865 e!44925)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!68528 (= res!36865 (not (validMask!0 (mask!6114 (v!2496 (underlying!254 thiss!992))))))))

(declare-fun lt!29932 () ListLongMap!1409)

(declare-fun lt!29931 () tuple2!2104)

(declare-fun lt!29929 () tuple2!2104)

(declare-fun +!91 (ListLongMap!1409 tuple2!2104) ListLongMap!1409)

(assert (=> b!68528 (= (+!91 (+!91 lt!29932 lt!29931) lt!29929) (+!91 (+!91 lt!29932 lt!29929) lt!29931))))

(assert (=> b!68528 (= lt!29929 (tuple2!2105 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2075 (v!2496 (underlying!254 thiss!992)))))))

(declare-fun lt!29933 () V!2925)

(assert (=> b!68528 (= lt!29931 (tuple2!2105 (select (arr!1843 (_keys!3813 (v!2496 (underlying!254 thiss!992)))) from!355) lt!29933))))

(declare-datatypes ((Unit!1923 0))(
  ( (Unit!1924) )
))
(declare-fun lt!29923 () Unit!1923)

(declare-fun addCommutativeForDiffKeys!10 (ListLongMap!1409 (_ BitVec 64) V!2925 (_ BitVec 64) V!2925) Unit!1923)

(assert (=> b!68528 (= lt!29923 (addCommutativeForDiffKeys!10 lt!29932 (select (arr!1843 (_keys!3813 (v!2496 (underlying!254 thiss!992)))) from!355) lt!29933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2075 (v!2496 (underlying!254 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!56 (array!3859 array!3861 (_ BitVec 32) (_ BitVec 32) V!2925 V!2925 (_ BitVec 32) Int) ListLongMap!1409)

(assert (=> b!68528 (= lt!29932 (getCurrentListMapNoExtraKeys!56 (_keys!3813 (v!2496 (underlying!254 thiss!992))) (_values!2152 (v!2496 (underlying!254 thiss!992))) (mask!6114 (v!2496 (underlying!254 thiss!992))) (extraKeys!2036 (v!2496 (underlying!254 thiss!992))) (zeroValue!2075 (v!2496 (underlying!254 thiss!992))) (minValue!2075 (v!2496 (underlying!254 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2169 (v!2496 (underlying!254 thiss!992)))))))

(declare-fun b!68529 () Bool)

(declare-fun e!44923 () Unit!1923)

(declare-fun Unit!1925 () Unit!1923)

(assert (=> b!68529 (= e!44923 Unit!1925)))

(declare-fun b!68530 () Bool)

(declare-fun e!44930 () Bool)

(declare-fun tp_is_empty!2459 () Bool)

(assert (=> b!68530 (= e!44930 tp_is_empty!2459)))

(declare-fun b!68531 () Bool)

(declare-fun e!44921 () Bool)

(assert (=> b!68531 (= e!44921 tp_is_empty!2459)))

(declare-fun b!68532 () Bool)

(assert (=> b!68532 (= e!44925 (or (not (= (size!2080 (_values!2152 (v!2496 (underlying!254 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6114 (v!2496 (underlying!254 thiss!992)))))) (= (size!2079 (_keys!3813 (v!2496 (underlying!254 thiss!992)))) (size!2080 (_values!2152 (v!2496 (underlying!254 thiss!992)))))))))

(declare-fun b!68533 () Bool)

(declare-fun res!36866 () Bool)

(assert (=> b!68533 (=> (not res!36866) (not e!44929))))

(assert (=> b!68533 (= res!36866 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2079 (_keys!3813 (v!2496 (underlying!254 thiss!992)))))))))

(declare-fun b!68534 () Bool)

(declare-fun res!36863 () Bool)

(assert (=> b!68534 (=> (not res!36863) (not e!44929))))

(assert (=> b!68534 (= res!36863 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6114 newMap!16)) (_size!389 (v!2496 (underlying!254 thiss!992)))))))

(declare-fun mapIsEmpty!3107 () Bool)

(declare-fun mapRes!3108 () Bool)

(assert (=> mapIsEmpty!3107 mapRes!3108))

(declare-fun b!68535 () Bool)

(declare-fun e!44932 () Bool)

(declare-fun e!44928 () Bool)

(declare-fun mapRes!3107 () Bool)

(assert (=> b!68535 (= e!44932 (and e!44928 mapRes!3107))))

(declare-fun condMapEmpty!3107 () Bool)

(declare-fun mapDefault!3107 () ValueCell!886)

