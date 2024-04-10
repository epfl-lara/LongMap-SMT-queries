; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8288 () Bool)

(assert start!8288)

(declare-fun b!53745 () Bool)

(declare-fun b_free!1741 () Bool)

(declare-fun b_next!1741 () Bool)

(assert (=> b!53745 (= b_free!1741 (not b_next!1741))))

(declare-fun tp!7324 () Bool)

(declare-fun b_and!3023 () Bool)

(assert (=> b!53745 (= tp!7324 b_and!3023)))

(declare-fun b!53740 () Bool)

(declare-fun b_free!1743 () Bool)

(declare-fun b_next!1743 () Bool)

(assert (=> b!53740 (= b_free!1743 (not b_next!1743))))

(declare-fun tp!7325 () Bool)

(declare-fun b_and!3025 () Bool)

(assert (=> b!53740 (= tp!7325 b_and!3025)))

(declare-fun b!53730 () Bool)

(declare-fun res!30445 () Bool)

(declare-fun e!35060 () Bool)

(assert (=> b!53730 (=> (not res!30445) (not e!35060))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2697 0))(
  ( (V!2698 (val!1188 Int)) )
))
(declare-datatypes ((array!3497 0))(
  ( (array!3498 (arr!1671 (Array (_ BitVec 32) (_ BitVec 64))) (size!1900 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!800 0))(
  ( (ValueCellFull!800 (v!2263 V!2697)) (EmptyCell!800) )
))
(declare-datatypes ((array!3499 0))(
  ( (array!3500 (arr!1672 (Array (_ BitVec 32) ValueCell!800)) (size!1901 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!508 0))(
  ( (LongMapFixedSize!509 (defaultEntry!1968 Int) (mask!5807 (_ BitVec 32)) (extraKeys!1859 (_ BitVec 32)) (zeroValue!1886 V!2697) (minValue!1886 V!2697) (_size!303 (_ BitVec 32)) (_keys!3588 array!3497) (_values!1951 array!3499) (_vacant!303 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!326 0))(
  ( (Cell!327 (v!2264 LongMapFixedSize!508)) )
))
(declare-datatypes ((LongMap!326 0))(
  ( (LongMap!327 (underlying!174 Cell!326)) )
))
(declare-fun thiss!992 () LongMap!326)

(assert (=> b!53730 (= res!30445 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1900 (_keys!3588 (v!2264 (underlying!174 thiss!992)))))))))

(declare-fun b!53731 () Bool)

(declare-fun res!30449 () Bool)

(declare-fun e!35071 () Bool)

(assert (=> b!53731 (=> (not res!30449) (not e!35071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3497 (_ BitVec 32)) Bool)

(assert (=> b!53731 (= res!30449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3588 (v!2264 (underlying!174 thiss!992))) (mask!5807 (v!2264 (underlying!174 thiss!992)))))))

(declare-fun b!53732 () Bool)

(declare-fun e!35068 () Bool)

(assert (=> b!53732 (= e!35060 e!35068)))

(declare-fun res!30446 () Bool)

(assert (=> b!53732 (=> (not res!30446) (not e!35068))))

(declare-datatypes ((tuple2!1894 0))(
  ( (tuple2!1895 (_1!958 (_ BitVec 64)) (_2!958 V!2697)) )
))
(declare-datatypes ((List!1362 0))(
  ( (Nil!1359) (Cons!1358 (h!1938 tuple2!1894) (t!4472 List!1362)) )
))
(declare-datatypes ((ListLongMap!1293 0))(
  ( (ListLongMap!1294 (toList!662 List!1362)) )
))
(declare-fun lt!21519 () ListLongMap!1293)

(declare-fun lt!21522 () ListLongMap!1293)

(assert (=> b!53732 (= res!30446 (and (= lt!21522 lt!21519) (not (= (select (arr!1671 (_keys!3588 (v!2264 (underlying!174 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1671 (_keys!3588 (v!2264 (underlying!174 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!508)

(declare-fun map!1040 (LongMapFixedSize!508) ListLongMap!1293)

(assert (=> b!53732 (= lt!21519 (map!1040 newMap!16))))

(declare-fun getCurrentListMap!373 (array!3497 array!3499 (_ BitVec 32) (_ BitVec 32) V!2697 V!2697 (_ BitVec 32) Int) ListLongMap!1293)

(assert (=> b!53732 (= lt!21522 (getCurrentListMap!373 (_keys!3588 (v!2264 (underlying!174 thiss!992))) (_values!1951 (v!2264 (underlying!174 thiss!992))) (mask!5807 (v!2264 (underlying!174 thiss!992))) (extraKeys!1859 (v!2264 (underlying!174 thiss!992))) (zeroValue!1886 (v!2264 (underlying!174 thiss!992))) (minValue!1886 (v!2264 (underlying!174 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1968 (v!2264 (underlying!174 thiss!992)))))))

(declare-fun b!53733 () Bool)

(declare-fun res!30453 () Bool)

(assert (=> b!53733 (=> (not res!30453) (not e!35071))))

(assert (=> b!53733 (= res!30453 (and (= (size!1901 (_values!1951 (v!2264 (underlying!174 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5807 (v!2264 (underlying!174 thiss!992))))) (= (size!1900 (_keys!3588 (v!2264 (underlying!174 thiss!992)))) (size!1901 (_values!1951 (v!2264 (underlying!174 thiss!992))))) (bvsge (mask!5807 (v!2264 (underlying!174 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1859 (v!2264 (underlying!174 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1859 (v!2264 (underlying!174 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53734 () Bool)

(declare-fun e!35070 () Bool)

(declare-fun tp_is_empty!2287 () Bool)

(assert (=> b!53734 (= e!35070 tp_is_empty!2287)))

(declare-fun b!53735 () Bool)

(declare-fun e!35062 () Bool)

(declare-fun mapRes!2532 () Bool)

(assert (=> b!53735 (= e!35062 (and e!35070 mapRes!2532))))

(declare-fun condMapEmpty!2532 () Bool)

(declare-fun mapDefault!2531 () ValueCell!800)

