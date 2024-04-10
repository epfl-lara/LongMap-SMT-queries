; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9260 () Bool)

(assert start!9260)

(declare-fun b!66289 () Bool)

(declare-fun b_free!2065 () Bool)

(declare-fun b_next!2065 () Bool)

(assert (=> b!66289 (= b_free!2065 (not b_next!2065))))

(declare-fun tp!8349 () Bool)

(declare-fun b_and!4095 () Bool)

(assert (=> b!66289 (= tp!8349 b_and!4095)))

(declare-fun b!66293 () Bool)

(declare-fun b_free!2067 () Bool)

(declare-fun b_next!2067 () Bool)

(assert (=> b!66293 (= b_free!2067 (not b_next!2067))))

(declare-fun tp!8347 () Bool)

(declare-fun b_and!4097 () Bool)

(assert (=> b!66293 (= tp!8347 b_and!4097)))

(declare-fun b!66287 () Bool)

(declare-fun e!43495 () Bool)

(declare-fun tp_is_empty!2449 () Bool)

(assert (=> b!66287 (= e!43495 tp_is_empty!2449)))

(declare-fun b!66288 () Bool)

(declare-fun e!43496 () Bool)

(declare-fun e!43481 () Bool)

(assert (=> b!66288 (= e!43496 e!43481)))

(declare-fun res!35923 () Bool)

(assert (=> b!66288 (=> (not res!35923) (not e!43481))))

(declare-datatypes ((V!2913 0))(
  ( (V!2914 (val!1269 Int)) )
))
(declare-datatypes ((array!3837 0))(
  ( (array!3838 (arr!1833 (Array (_ BitVec 32) (_ BitVec 64))) (size!2068 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!881 0))(
  ( (ValueCellFull!881 (v!2475 V!2913)) (EmptyCell!881) )
))
(declare-datatypes ((array!3839 0))(
  ( (array!3840 (arr!1834 (Array (_ BitVec 32) ValueCell!881)) (size!2069 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!670 0))(
  ( (LongMapFixedSize!671 (defaultEntry!2146 Int) (mask!6081 (_ BitVec 32)) (extraKeys!2017 (_ BitVec 32)) (zeroValue!2054 V!2913) (minValue!2054 V!2913) (_size!384 (_ BitVec 32)) (_keys!3786 array!3837) (_values!2129 array!3839) (_vacant!384 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!476 0))(
  ( (Cell!477 (v!2476 LongMapFixedSize!670)) )
))
(declare-datatypes ((LongMap!476 0))(
  ( (LongMap!477 (underlying!249 Cell!476)) )
))
(declare-fun thiss!992 () LongMap!476)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!66288 (= res!35923 (and (not (= (select (arr!1833 (_keys!3786 (v!2476 (underlying!249 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1833 (_keys!3786 (v!2476 (underlying!249 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28590 () V!2913)

(declare-fun get!1115 (ValueCell!881 V!2913) V!2913)

(declare-fun dynLambda!318 (Int (_ BitVec 64)) V!2913)

(assert (=> b!66288 (= lt!28590 (get!1115 (select (arr!1834 (_values!2129 (v!2476 (underlying!249 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2146 (v!2476 (underlying!249 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!43485 () Bool)

(declare-fun e!43497 () Bool)

(declare-fun array_inv!1127 (array!3837) Bool)

(declare-fun array_inv!1128 (array!3839) Bool)

(assert (=> b!66289 (= e!43497 (and tp!8349 tp_is_empty!2449 (array_inv!1127 (_keys!3786 (v!2476 (underlying!249 thiss!992)))) (array_inv!1128 (_values!2129 (v!2476 (underlying!249 thiss!992)))) e!43485))))

(declare-fun b!66290 () Bool)

(declare-fun e!43480 () Bool)

(declare-fun e!43483 () Bool)

(assert (=> b!66290 (= e!43480 (not e!43483))))

(declare-fun res!35922 () Bool)

(assert (=> b!66290 (=> res!35922 e!43483)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!66290 (= res!35922 (not (validMask!0 (mask!6081 (v!2476 (underlying!249 thiss!992))))))))

(declare-datatypes ((tuple2!2090 0))(
  ( (tuple2!2091 (_1!1056 (_ BitVec 64)) (_2!1056 V!2913)) )
))
(declare-datatypes ((List!1464 0))(
  ( (Nil!1461) (Cons!1460 (h!2044 tuple2!2090) (t!4942 List!1464)) )
))
(declare-datatypes ((ListLongMap!1401 0))(
  ( (ListLongMap!1402 (toList!716 List!1464)) )
))
(declare-fun lt!28582 () ListLongMap!1401)

(declare-fun lt!28589 () tuple2!2090)

(declare-fun lt!28588 () tuple2!2090)

(declare-fun +!88 (ListLongMap!1401 tuple2!2090) ListLongMap!1401)

(assert (=> b!66290 (= (+!88 (+!88 lt!28582 lt!28589) lt!28588) (+!88 (+!88 lt!28582 lt!28588) lt!28589))))

(assert (=> b!66290 (= lt!28588 (tuple2!2091 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2054 (v!2476 (underlying!249 thiss!992)))))))

(assert (=> b!66290 (= lt!28589 (tuple2!2091 (select (arr!1833 (_keys!3786 (v!2476 (underlying!249 thiss!992)))) from!355) lt!28590))))

(declare-datatypes ((Unit!1836 0))(
  ( (Unit!1837) )
))
(declare-fun lt!28581 () Unit!1836)

(declare-fun addCommutativeForDiffKeys!7 (ListLongMap!1401 (_ BitVec 64) V!2913 (_ BitVec 64) V!2913) Unit!1836)

(assert (=> b!66290 (= lt!28581 (addCommutativeForDiffKeys!7 lt!28582 (select (arr!1833 (_keys!3786 (v!2476 (underlying!249 thiss!992)))) from!355) lt!28590 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2054 (v!2476 (underlying!249 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!53 (array!3837 array!3839 (_ BitVec 32) (_ BitVec 32) V!2913 V!2913 (_ BitVec 32) Int) ListLongMap!1401)

(assert (=> b!66290 (= lt!28582 (getCurrentListMapNoExtraKeys!53 (_keys!3786 (v!2476 (underlying!249 thiss!992))) (_values!2129 (v!2476 (underlying!249 thiss!992))) (mask!6081 (v!2476 (underlying!249 thiss!992))) (extraKeys!2017 (v!2476 (underlying!249 thiss!992))) (zeroValue!2054 (v!2476 (underlying!249 thiss!992))) (minValue!2054 (v!2476 (underlying!249 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2146 (v!2476 (underlying!249 thiss!992)))))))

(declare-fun b!66291 () Bool)

(declare-fun e!43488 () Bool)

(assert (=> b!66291 (= e!43488 tp_is_empty!2449)))

(declare-fun b!66292 () Bool)

(declare-fun e!43482 () Bool)

(assert (=> b!66292 (= e!43482 tp_is_empty!2449)))

(declare-fun e!43493 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!670)

(declare-fun e!43489 () Bool)

(assert (=> b!66293 (= e!43493 (and tp!8347 tp_is_empty!2449 (array_inv!1127 (_keys!3786 newMap!16)) (array_inv!1128 (_values!2129 newMap!16)) e!43489))))

(declare-fun b!66294 () Bool)

(declare-fun e!43487 () Bool)

(assert (=> b!66294 (= e!43487 e!43496)))

(declare-fun res!35925 () Bool)

(assert (=> b!66294 (=> (not res!35925) (not e!43496))))

(declare-fun lt!28584 () ListLongMap!1401)

(declare-fun lt!28586 () ListLongMap!1401)

(assert (=> b!66294 (= res!35925 (= lt!28584 lt!28586))))

(declare-fun map!1135 (LongMapFixedSize!670) ListLongMap!1401)

(assert (=> b!66294 (= lt!28586 (map!1135 newMap!16))))

(declare-fun getCurrentListMap!414 (array!3837 array!3839 (_ BitVec 32) (_ BitVec 32) V!2913 V!2913 (_ BitVec 32) Int) ListLongMap!1401)

(assert (=> b!66294 (= lt!28584 (getCurrentListMap!414 (_keys!3786 (v!2476 (underlying!249 thiss!992))) (_values!2129 (v!2476 (underlying!249 thiss!992))) (mask!6081 (v!2476 (underlying!249 thiss!992))) (extraKeys!2017 (v!2476 (underlying!249 thiss!992))) (zeroValue!2054 (v!2476 (underlying!249 thiss!992))) (minValue!2054 (v!2476 (underlying!249 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2146 (v!2476 (underlying!249 thiss!992)))))))

(declare-fun b!66295 () Bool)

(declare-fun res!35924 () Bool)

(assert (=> b!66295 (=> (not res!35924) (not e!43487))))

(declare-fun valid!277 (LongMapFixedSize!670) Bool)

(assert (=> b!66295 (= res!35924 (valid!277 newMap!16))))

(declare-fun b!66296 () Bool)

(declare-fun e!43494 () Bool)

(declare-fun mapRes!3070 () Bool)

(assert (=> b!66296 (= e!43489 (and e!43494 mapRes!3070))))

(declare-fun condMapEmpty!3070 () Bool)

(declare-fun mapDefault!3069 () ValueCell!881)

