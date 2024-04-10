; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8262 () Bool)

(assert start!8262)

(declare-fun b!52901 () Bool)

(declare-fun b_free!1689 () Bool)

(declare-fun b_next!1689 () Bool)

(assert (=> b!52901 (= b_free!1689 (not b_next!1689))))

(declare-fun tp!7167 () Bool)

(declare-fun b_and!2919 () Bool)

(assert (=> b!52901 (= tp!7167 b_and!2919)))

(declare-fun b!52897 () Bool)

(declare-fun b_free!1691 () Bool)

(declare-fun b_next!1691 () Bool)

(assert (=> b!52897 (= b_free!1691 (not b_next!1691))))

(declare-fun tp!7170 () Bool)

(declare-fun b_and!2921 () Bool)

(assert (=> b!52897 (= tp!7170 b_and!2921)))

(declare-fun b!52885 () Bool)

(declare-fun e!34485 () Bool)

(declare-fun e!34474 () Bool)

(assert (=> b!52885 (= e!34485 e!34474)))

(declare-fun res!30017 () Bool)

(assert (=> b!52885 (=> (not res!30017) (not e!34474))))

(declare-datatypes ((V!2661 0))(
  ( (V!2662 (val!1175 Int)) )
))
(declare-datatypes ((array!3445 0))(
  ( (array!3446 (arr!1645 (Array (_ BitVec 32) (_ BitVec 64))) (size!1874 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!787 0))(
  ( (ValueCellFull!787 (v!2239 V!2661)) (EmptyCell!787) )
))
(declare-datatypes ((array!3447 0))(
  ( (array!3448 (arr!1646 (Array (_ BitVec 32) ValueCell!787)) (size!1875 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!482 0))(
  ( (LongMapFixedSize!483 (defaultEntry!1955 Int) (mask!5784 (_ BitVec 32)) (extraKeys!1846 (_ BitVec 32)) (zeroValue!1873 V!2661) (minValue!1873 V!2661) (_size!290 (_ BitVec 32)) (_keys!3575 array!3445) (_values!1938 array!3447) (_vacant!290 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!304 0))(
  ( (Cell!305 (v!2240 LongMapFixedSize!482)) )
))
(declare-datatypes ((LongMap!304 0))(
  ( (LongMap!305 (underlying!163 Cell!304)) )
))
(declare-fun thiss!992 () LongMap!304)

(declare-datatypes ((tuple2!1868 0))(
  ( (tuple2!1869 (_1!945 (_ BitVec 64)) (_2!945 V!2661)) )
))
(declare-datatypes ((List!1349 0))(
  ( (Nil!1346) (Cons!1345 (h!1925 tuple2!1868) (t!4407 List!1349)) )
))
(declare-datatypes ((ListLongMap!1275 0))(
  ( (ListLongMap!1276 (toList!653 List!1349)) )
))
(declare-fun lt!21364 () ListLongMap!1275)

(declare-fun lt!21363 () ListLongMap!1275)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52885 (= res!30017 (and (= lt!21364 lt!21363) (not (= (select (arr!1645 (_keys!3575 (v!2240 (underlying!163 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1645 (_keys!3575 (v!2240 (underlying!163 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!482)

(declare-fun map!1022 (LongMapFixedSize!482) ListLongMap!1275)

(assert (=> b!52885 (= lt!21363 (map!1022 newMap!16))))

(declare-fun getCurrentListMap!365 (array!3445 array!3447 (_ BitVec 32) (_ BitVec 32) V!2661 V!2661 (_ BitVec 32) Int) ListLongMap!1275)

(assert (=> b!52885 (= lt!21364 (getCurrentListMap!365 (_keys!3575 (v!2240 (underlying!163 thiss!992))) (_values!1938 (v!2240 (underlying!163 thiss!992))) (mask!5784 (v!2240 (underlying!163 thiss!992))) (extraKeys!1846 (v!2240 (underlying!163 thiss!992))) (zeroValue!1873 (v!2240 (underlying!163 thiss!992))) (minValue!1873 (v!2240 (underlying!163 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1955 (v!2240 (underlying!163 thiss!992)))))))

(declare-fun b!52886 () Bool)

(declare-fun res!30025 () Bool)

(declare-fun e!34478 () Bool)

(assert (=> b!52886 (=> (not res!30025) (not e!34478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52886 (= res!30025 (validMask!0 (mask!5784 (v!2240 (underlying!163 thiss!992)))))))

(declare-fun mapIsEmpty!2453 () Bool)

(declare-fun mapRes!2454 () Bool)

(assert (=> mapIsEmpty!2453 mapRes!2454))

(declare-fun b!52887 () Bool)

(declare-fun e!34481 () Bool)

(declare-fun tp_is_empty!2261 () Bool)

(assert (=> b!52887 (= e!34481 tp_is_empty!2261)))

(declare-fun b!52888 () Bool)

(assert (=> b!52888 (= e!34478 false)))

(declare-fun lt!21366 () Bool)

(declare-fun contains!629 (ListLongMap!1275 (_ BitVec 64)) Bool)

(assert (=> b!52888 (= lt!21366 (contains!629 lt!21364 (select (arr!1645 (_keys!3575 (v!2240 (underlying!163 thiss!992)))) from!355)))))

(declare-fun b!52889 () Bool)

(declare-fun e!34482 () Bool)

(declare-fun e!34483 () Bool)

(declare-fun mapRes!2453 () Bool)

(assert (=> b!52889 (= e!34482 (and e!34483 mapRes!2453))))

(declare-fun condMapEmpty!2453 () Bool)

(declare-fun mapDefault!2454 () ValueCell!787)

