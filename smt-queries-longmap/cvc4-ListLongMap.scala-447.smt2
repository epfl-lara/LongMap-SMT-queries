; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8298 () Bool)

(assert start!8298)

(declare-fun b!54063 () Bool)

(declare-fun b_free!1761 () Bool)

(declare-fun b_next!1761 () Bool)

(assert (=> b!54063 (= b_free!1761 (not b_next!1761))))

(declare-fun tp!7383 () Bool)

(declare-fun b_and!3063 () Bool)

(assert (=> b!54063 (= tp!7383 b_and!3063)))

(declare-fun b!54072 () Bool)

(declare-fun b_free!1763 () Bool)

(declare-fun b_next!1763 () Bool)

(assert (=> b!54072 (= b_free!1763 (not b_next!1763))))

(declare-fun tp!7384 () Bool)

(declare-fun b_and!3065 () Bool)

(assert (=> b!54072 (= tp!7384 b_and!3065)))

(declare-fun b!54055 () Bool)

(declare-fun e!35297 () Bool)

(declare-fun tp_is_empty!2297 () Bool)

(assert (=> b!54055 (= e!35297 tp_is_empty!2297)))

(declare-fun b!54056 () Bool)

(declare-fun e!35293 () Bool)

(declare-fun e!35291 () Bool)

(assert (=> b!54056 (= e!35293 e!35291)))

(declare-fun res!30610 () Bool)

(declare-fun e!35284 () Bool)

(assert (=> start!8298 (=> (not res!30610) (not e!35284))))

(declare-datatypes ((V!2709 0))(
  ( (V!2710 (val!1193 Int)) )
))
(declare-datatypes ((array!3517 0))(
  ( (array!3518 (arr!1681 (Array (_ BitVec 32) (_ BitVec 64))) (size!1910 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!805 0))(
  ( (ValueCellFull!805 (v!2272 V!2709)) (EmptyCell!805) )
))
(declare-datatypes ((array!3519 0))(
  ( (array!3520 (arr!1682 (Array (_ BitVec 32) ValueCell!805)) (size!1911 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!518 0))(
  ( (LongMapFixedSize!519 (defaultEntry!1973 Int) (mask!5814 (_ BitVec 32)) (extraKeys!1864 (_ BitVec 32)) (zeroValue!1891 V!2709) (minValue!1891 V!2709) (_size!308 (_ BitVec 32)) (_keys!3593 array!3517) (_values!1956 array!3519) (_vacant!308 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!334 0))(
  ( (Cell!335 (v!2273 LongMapFixedSize!518)) )
))
(declare-datatypes ((LongMap!334 0))(
  ( (LongMap!335 (underlying!178 Cell!334)) )
))
(declare-fun thiss!992 () LongMap!334)

(declare-fun valid!199 (LongMap!334) Bool)

(assert (=> start!8298 (= res!30610 (valid!199 thiss!992))))

(assert (=> start!8298 e!35284))

(assert (=> start!8298 e!35293))

(assert (=> start!8298 true))

(declare-fun e!35288 () Bool)

(assert (=> start!8298 e!35288))

(declare-fun b!54057 () Bool)

(declare-fun res!30615 () Bool)

(declare-fun e!35286 () Bool)

(assert (=> b!54057 (=> (not res!30615) (not e!35286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54057 (= res!30615 (validMask!0 (mask!5814 (v!2273 (underlying!178 thiss!992)))))))

(declare-fun b!54058 () Bool)

(declare-fun res!30619 () Bool)

(assert (=> b!54058 (=> (not res!30619) (not e!35284))))

(declare-fun newMap!16 () LongMapFixedSize!518)

(assert (=> b!54058 (= res!30619 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5814 newMap!16)) (_size!308 (v!2273 (underlying!178 thiss!992)))))))

(declare-fun b!54059 () Bool)

(declare-fun e!35290 () Bool)

(assert (=> b!54059 (= e!35290 e!35286)))

(declare-fun res!30611 () Bool)

(assert (=> b!54059 (=> (not res!30611) (not e!35286))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1904 0))(
  ( (tuple2!1905 (_1!963 (_ BitVec 64)) (_2!963 V!2709)) )
))
(declare-datatypes ((List!1367 0))(
  ( (Nil!1364) (Cons!1363 (h!1943 tuple2!1904) (t!4497 List!1367)) )
))
(declare-datatypes ((ListLongMap!1299 0))(
  ( (ListLongMap!1300 (toList!665 List!1367)) )
))
(declare-fun lt!21580 () ListLongMap!1299)

(declare-fun contains!639 (ListLongMap!1299 (_ BitVec 64)) Bool)

(assert (=> b!54059 (= res!30611 (contains!639 lt!21580 (select (arr!1681 (_keys!3593 (v!2273 (underlying!178 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1906 0))(
  ( (tuple2!1907 (_1!964 Bool) (_2!964 LongMapFixedSize!518)) )
))
(declare-fun lt!21581 () tuple2!1906)

(declare-fun update!47 (LongMapFixedSize!518 (_ BitVec 64) V!2709) tuple2!1906)

(declare-fun get!1001 (ValueCell!805 V!2709) V!2709)

(declare-fun dynLambda!278 (Int (_ BitVec 64)) V!2709)

(assert (=> b!54059 (= lt!21581 (update!47 newMap!16 (select (arr!1681 (_keys!3593 (v!2273 (underlying!178 thiss!992)))) from!355) (get!1001 (select (arr!1682 (_values!1956 (v!2273 (underlying!178 thiss!992)))) from!355) (dynLambda!278 (defaultEntry!1973 (v!2273 (underlying!178 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54060 () Bool)

(declare-fun res!30618 () Bool)

(assert (=> b!54060 (=> (not res!30618) (not e!35286))))

(assert (=> b!54060 (= res!30618 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1910 (_keys!3593 (v!2273 (underlying!178 thiss!992)))))))))

(declare-fun b!54061 () Bool)

(declare-fun e!35289 () Bool)

(assert (=> b!54061 (= e!35291 e!35289)))

(declare-fun b!54062 () Bool)

(assert (=> b!54062 (= e!35286 false)))

(declare-fun lt!21582 () ListLongMap!1299)

(declare-fun lt!21579 () Bool)

(assert (=> b!54062 (= lt!21579 (contains!639 lt!21582 (select (arr!1681 (_keys!3593 (v!2273 (underlying!178 thiss!992)))) from!355)))))

(declare-fun e!35287 () Bool)

(declare-fun array_inv!1039 (array!3517) Bool)

(declare-fun array_inv!1040 (array!3519) Bool)

(assert (=> b!54063 (= e!35289 (and tp!7383 tp_is_empty!2297 (array_inv!1039 (_keys!3593 (v!2273 (underlying!178 thiss!992)))) (array_inv!1040 (_values!1956 (v!2273 (underlying!178 thiss!992)))) e!35287))))

(declare-fun mapNonEmpty!2561 () Bool)

(declare-fun mapRes!2562 () Bool)

(declare-fun tp!7386 () Bool)

(declare-fun e!35292 () Bool)

(assert (=> mapNonEmpty!2561 (= mapRes!2562 (and tp!7386 e!35292))))

(declare-fun mapRest!2561 () (Array (_ BitVec 32) ValueCell!805))

(declare-fun mapKey!2562 () (_ BitVec 32))

(declare-fun mapValue!2562 () ValueCell!805)

(assert (=> mapNonEmpty!2561 (= (arr!1682 (_values!1956 (v!2273 (underlying!178 thiss!992)))) (store mapRest!2561 mapKey!2562 mapValue!2562))))

(declare-fun mapIsEmpty!2561 () Bool)

(declare-fun mapRes!2561 () Bool)

(assert (=> mapIsEmpty!2561 mapRes!2561))

(declare-fun b!54064 () Bool)

(declare-fun e!35283 () Bool)

(declare-fun e!35296 () Bool)

(assert (=> b!54064 (= e!35283 (and e!35296 mapRes!2561))))

(declare-fun condMapEmpty!2562 () Bool)

(declare-fun mapDefault!2561 () ValueCell!805)

