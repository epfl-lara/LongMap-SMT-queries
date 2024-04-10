; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9112 () Bool)

(assert start!9112)

(declare-fun b!64633 () Bool)

(declare-fun b_free!2017 () Bool)

(declare-fun b_next!2017 () Bool)

(assert (=> b!64633 (= b_free!2017 (not b_next!2017))))

(declare-fun tp!8193 () Bool)

(declare-fun b_and!3963 () Bool)

(assert (=> b!64633 (= tp!8193 b_and!3963)))

(declare-fun b!64623 () Bool)

(declare-fun b_free!2019 () Bool)

(declare-fun b_next!2019 () Bool)

(assert (=> b!64623 (= b_free!2019 (not b_next!2019))))

(declare-fun tp!8194 () Bool)

(declare-fun b_and!3965 () Bool)

(assert (=> b!64623 (= tp!8194 b_and!3965)))

(declare-fun mapIsEmpty!2987 () Bool)

(declare-fun mapRes!2988 () Bool)

(assert (=> mapIsEmpty!2987 mapRes!2988))

(declare-fun b!64622 () Bool)

(declare-fun e!42361 () Bool)

(declare-fun e!42347 () Bool)

(assert (=> b!64622 (= e!42361 e!42347)))

(declare-fun res!35240 () Bool)

(assert (=> b!64622 (=> (not res!35240) (not e!42347))))

(declare-datatypes ((V!2881 0))(
  ( (V!2882 (val!1257 Int)) )
))
(declare-datatypes ((array!3785 0))(
  ( (array!3786 (arr!1809 (Array (_ BitVec 32) (_ BitVec 64))) (size!2043 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!869 0))(
  ( (ValueCellFull!869 (v!2444 V!2881)) (EmptyCell!869) )
))
(declare-datatypes ((array!3787 0))(
  ( (array!3788 (arr!1810 (Array (_ BitVec 32) ValueCell!869)) (size!2044 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!646 0))(
  ( (LongMapFixedSize!647 (defaultEntry!2121 Int) (mask!6043 (_ BitVec 32)) (extraKeys!1994 (_ BitVec 32)) (zeroValue!2030 V!2881) (minValue!2030 V!2881) (_size!372 (_ BitVec 32)) (_keys!3759 array!3785) (_values!2104 array!3787) (_vacant!372 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!454 0))(
  ( (Cell!455 (v!2445 LongMapFixedSize!646)) )
))
(declare-datatypes ((LongMap!454 0))(
  ( (LongMap!455 (underlying!238 Cell!454)) )
))
(declare-fun thiss!992 () LongMap!454)

(declare-datatypes ((tuple2!2054 0))(
  ( (tuple2!2055 (_1!1038 (_ BitVec 64)) (_2!1038 V!2881)) )
))
(declare-datatypes ((List!1447 0))(
  ( (Nil!1444) (Cons!1443 (h!2027 tuple2!2054) (t!4873 List!1447)) )
))
(declare-datatypes ((ListLongMap!1381 0))(
  ( (ListLongMap!1382 (toList!706 List!1447)) )
))
(declare-fun lt!27564 () ListLongMap!1381)

(declare-fun lt!27562 () ListLongMap!1381)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!64622 (= res!35240 (and (= lt!27562 lt!27564) (not (= (select (arr!1809 (_keys!3759 (v!2445 (underlying!238 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1809 (_keys!3759 (v!2445 (underlying!238 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!646)

(declare-fun map!1121 (LongMapFixedSize!646) ListLongMap!1381)

(assert (=> b!64622 (= lt!27564 (map!1121 newMap!16))))

(declare-fun getCurrentListMap!408 (array!3785 array!3787 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) ListLongMap!1381)

(assert (=> b!64622 (= lt!27562 (getCurrentListMap!408 (_keys!3759 (v!2445 (underlying!238 thiss!992))) (_values!2104 (v!2445 (underlying!238 thiss!992))) (mask!6043 (v!2445 (underlying!238 thiss!992))) (extraKeys!1994 (v!2445 (underlying!238 thiss!992))) (zeroValue!2030 (v!2445 (underlying!238 thiss!992))) (minValue!2030 (v!2445 (underlying!238 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2445 (underlying!238 thiss!992)))))))

(declare-fun mapIsEmpty!2988 () Bool)

(declare-fun mapRes!2987 () Bool)

(assert (=> mapIsEmpty!2988 mapRes!2987))

(declare-fun tp_is_empty!2425 () Bool)

(declare-fun e!42358 () Bool)

(declare-fun e!42360 () Bool)

(declare-fun array_inv!1115 (array!3785) Bool)

(declare-fun array_inv!1116 (array!3787) Bool)

(assert (=> b!64623 (= e!42360 (and tp!8194 tp_is_empty!2425 (array_inv!1115 (_keys!3759 newMap!16)) (array_inv!1116 (_values!2104 newMap!16)) e!42358))))

(declare-fun b!64624 () Bool)

(declare-fun e!42355 () Bool)

(declare-fun e!42353 () Bool)

(assert (=> b!64624 (= e!42355 (and e!42353 mapRes!2988))))

(declare-fun condMapEmpty!2987 () Bool)

(declare-fun mapDefault!2988 () ValueCell!869)

