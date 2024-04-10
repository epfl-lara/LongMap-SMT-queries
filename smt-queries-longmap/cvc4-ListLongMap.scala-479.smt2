; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10026 () Bool)

(assert start!10026)

(declare-fun b!76048 () Bool)

(declare-fun b_free!2145 () Bool)

(declare-fun b_next!2145 () Bool)

(assert (=> b!76048 (= b_free!2145 (not b_next!2145))))

(declare-fun tp!8626 () Bool)

(declare-fun b_and!4655 () Bool)

(assert (=> b!76048 (= tp!8626 b_and!4655)))

(declare-fun b!76051 () Bool)

(declare-fun b_free!2147 () Bool)

(declare-fun b_next!2147 () Bool)

(assert (=> b!76051 (= b_free!2147 (not b_next!2147))))

(declare-fun tp!8627 () Bool)

(declare-fun b_and!4657 () Bool)

(assert (=> b!76051 (= tp!8627 b_and!4657)))

(declare-fun b!76043 () Bool)

(declare-fun e!49683 () Bool)

(declare-fun tp_is_empty!2489 () Bool)

(assert (=> b!76043 (= e!49683 tp_is_empty!2489)))

(declare-fun b!76044 () Bool)

(declare-fun e!49698 () Bool)

(assert (=> b!76044 (= e!49698 tp_is_empty!2489)))

(declare-fun b!76045 () Bool)

(declare-fun e!49685 () Bool)

(declare-datatypes ((V!2965 0))(
  ( (V!2966 (val!1289 Int)) )
))
(declare-datatypes ((array!3927 0))(
  ( (array!3928 (arr!1873 (Array (_ BitVec 32) (_ BitVec 64))) (size!2113 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!901 0))(
  ( (ValueCellFull!901 (v!2560 V!2965)) (EmptyCell!901) )
))
(declare-datatypes ((array!3929 0))(
  ( (array!3930 (arr!1874 (Array (_ BitVec 32) ValueCell!901)) (size!2114 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!710 0))(
  ( (LongMapFixedSize!711 (defaultEntry!2248 Int) (mask!6231 (_ BitVec 32)) (extraKeys!2101 (_ BitVec 32)) (zeroValue!2147 V!2965) (minValue!2147 V!2965) (_size!404 (_ BitVec 32)) (_keys!3906 array!3927) (_values!2231 array!3929) (_vacant!404 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!512 0))(
  ( (Cell!513 (v!2561 LongMapFixedSize!710)) )
))
(declare-datatypes ((LongMap!512 0))(
  ( (LongMap!513 (underlying!267 Cell!512)) )
))
(declare-fun thiss!992 () LongMap!512)

(declare-datatypes ((List!1490 0))(
  ( (Nil!1487) (Cons!1486 (h!2074 (_ BitVec 64)) (t!5088 List!1490)) )
))
(declare-fun arrayNoDuplicates!0 (array!3927 (_ BitVec 32) List!1490) Bool)

(assert (=> b!76045 (= e!49685 (arrayNoDuplicates!0 (_keys!3906 (v!2561 (underlying!267 thiss!992))) #b00000000000000000000000000000000 Nil!1487))))

(declare-fun mapNonEmpty!3227 () Bool)

(declare-fun mapRes!3227 () Bool)

(declare-fun tp!8628 () Bool)

(assert (=> mapNonEmpty!3227 (= mapRes!3227 (and tp!8628 e!49698))))

(declare-fun mapKey!3227 () (_ BitVec 32))

(declare-fun mapValue!3228 () ValueCell!901)

(declare-fun mapRest!3227 () (Array (_ BitVec 32) ValueCell!901))

(assert (=> mapNonEmpty!3227 (= (arr!1874 (_values!2231 (v!2561 (underlying!267 thiss!992)))) (store mapRest!3227 mapKey!3227 mapValue!3228))))

(declare-fun b!76046 () Bool)

(declare-datatypes ((Unit!2197 0))(
  ( (Unit!2198) )
))
(declare-fun e!49697 () Unit!2197)

(declare-fun Unit!2199 () Unit!2197)

(assert (=> b!76046 (= e!49697 Unit!2199)))

(declare-fun b!76047 () Bool)

(declare-fun e!49694 () Bool)

(declare-fun e!49696 () Bool)

(assert (=> b!76047 (= e!49694 e!49696)))

(declare-fun res!40061 () Bool)

(assert (=> b!76047 (=> (not res!40061) (not e!49696))))

(declare-datatypes ((tuple2!2144 0))(
  ( (tuple2!2145 (_1!1083 Bool) (_2!1083 LongMapFixedSize!710)) )
))
(declare-fun lt!34542 () tuple2!2144)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!76047 (= res!40061 (and (_1!1083 lt!34542) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!34536 () Unit!2197)

(assert (=> b!76047 (= lt!34536 e!49697)))

(declare-datatypes ((tuple2!2146 0))(
  ( (tuple2!2147 (_1!1084 (_ BitVec 64)) (_2!1084 V!2965)) )
))
(declare-datatypes ((List!1491 0))(
  ( (Nil!1488) (Cons!1487 (h!2075 tuple2!2146) (t!5089 List!1491)) )
))
(declare-datatypes ((ListLongMap!1431 0))(
  ( (ListLongMap!1432 (toList!731 List!1491)) )
))
(declare-fun lt!34541 () ListLongMap!1431)

(declare-fun c!11562 () Bool)

(declare-fun contains!732 (ListLongMap!1431 (_ BitVec 64)) Bool)

(assert (=> b!76047 (= c!11562 (contains!732 lt!34541 (select (arr!1873 (_keys!3906 (v!2561 (underlying!267 thiss!992)))) from!355)))))

(declare-fun lt!34534 () V!2965)

(declare-fun newMap!16 () LongMapFixedSize!710)

(declare-fun update!101 (LongMapFixedSize!710 (_ BitVec 64) V!2965) tuple2!2144)

(assert (=> b!76047 (= lt!34542 (update!101 newMap!16 (select (arr!1873 (_keys!3906 (v!2561 (underlying!267 thiss!992)))) from!355) lt!34534))))

(declare-fun e!49693 () Bool)

(declare-fun e!49700 () Bool)

(declare-fun array_inv!1157 (array!3927) Bool)

(declare-fun array_inv!1158 (array!3929) Bool)

(assert (=> b!76048 (= e!49700 (and tp!8626 tp_is_empty!2489 (array_inv!1157 (_keys!3906 (v!2561 (underlying!267 thiss!992)))) (array_inv!1158 (_values!2231 (v!2561 (underlying!267 thiss!992)))) e!49693))))

(declare-fun b!76049 () Bool)

(declare-fun e!49688 () Bool)

(assert (=> b!76049 (= e!49688 e!49694)))

(declare-fun res!40060 () Bool)

(assert (=> b!76049 (=> (not res!40060) (not e!49694))))

(assert (=> b!76049 (= res!40060 (and (not (= (select (arr!1873 (_keys!3906 (v!2561 (underlying!267 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1873 (_keys!3906 (v!2561 (underlying!267 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1155 (ValueCell!901 V!2965) V!2965)

(declare-fun dynLambda!331 (Int (_ BitVec 64)) V!2965)

(assert (=> b!76049 (= lt!34534 (get!1155 (select (arr!1874 (_values!2231 (v!2561 (underlying!267 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2248 (v!2561 (underlying!267 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76050 () Bool)

(declare-fun e!49686 () Bool)

(declare-fun e!49684 () Bool)

(declare-fun mapRes!3228 () Bool)

(assert (=> b!76050 (= e!49686 (and e!49684 mapRes!3228))))

(declare-fun condMapEmpty!3228 () Bool)

(declare-fun mapDefault!3228 () ValueCell!901)

