; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8318 () Bool)

(assert start!8318)

(declare-fun b!54674 () Bool)

(declare-fun b_free!1801 () Bool)

(declare-fun b_next!1801 () Bool)

(assert (=> b!54674 (= b_free!1801 (not b_next!1801))))

(declare-fun tp!7503 () Bool)

(declare-fun b_and!3143 () Bool)

(assert (=> b!54674 (= tp!7503 b_and!3143)))

(declare-fun b!54663 () Bool)

(declare-fun b_free!1803 () Bool)

(declare-fun b_next!1803 () Bool)

(assert (=> b!54663 (= b_free!1803 (not b_next!1803))))

(declare-fun tp!7505 () Bool)

(declare-fun b_and!3145 () Bool)

(assert (=> b!54663 (= tp!7505 b_and!3145)))

(declare-fun b!54661 () Bool)

(declare-fun e!35754 () Bool)

(declare-fun e!35749 () Bool)

(assert (=> b!54661 (= e!35754 e!35749)))

(declare-fun b!54662 () Bool)

(declare-fun e!35751 () Bool)

(declare-fun e!35756 () Bool)

(assert (=> b!54662 (= e!35751 e!35756)))

(declare-fun res!30899 () Bool)

(assert (=> b!54662 (=> (not res!30899) (not e!35756))))

(declare-datatypes ((V!2737 0))(
  ( (V!2738 (val!1203 Int)) )
))
(declare-datatypes ((array!3557 0))(
  ( (array!3558 (arr!1701 (Array (_ BitVec 32) (_ BitVec 64))) (size!1930 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!815 0))(
  ( (ValueCellFull!815 (v!2292 V!2737)) (EmptyCell!815) )
))
(declare-datatypes ((array!3559 0))(
  ( (array!3560 (arr!1702 (Array (_ BitVec 32) ValueCell!815)) (size!1931 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!538 0))(
  ( (LongMapFixedSize!539 (defaultEntry!1983 Int) (mask!5832 (_ BitVec 32)) (extraKeys!1874 (_ BitVec 32)) (zeroValue!1901 V!2737) (minValue!1901 V!2737) (_size!318 (_ BitVec 32)) (_keys!3603 array!3557) (_values!1966 array!3559) (_vacant!318 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!354 0))(
  ( (Cell!355 (v!2293 LongMapFixedSize!538)) )
))
(declare-datatypes ((LongMap!354 0))(
  ( (LongMap!355 (underlying!188 Cell!354)) )
))
(declare-fun thiss!992 () LongMap!354)

(declare-datatypes ((tuple2!1930 0))(
  ( (tuple2!1931 (_1!976 (_ BitVec 64)) (_2!976 V!2737)) )
))
(declare-datatypes ((List!1378 0))(
  ( (Nil!1375) (Cons!1374 (h!1954 tuple2!1930) (t!4548 List!1378)) )
))
(declare-datatypes ((ListLongMap!1313 0))(
  ( (ListLongMap!1314 (toList!672 List!1378)) )
))
(declare-fun lt!21712 () ListLongMap!1313)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!645 (ListLongMap!1313 (_ BitVec 64)) Bool)

(assert (=> b!54662 (= res!30899 (contains!645 lt!21712 (select (arr!1701 (_keys!3603 (v!2293 (underlying!188 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!538)

(declare-datatypes ((tuple2!1932 0))(
  ( (tuple2!1933 (_1!977 Bool) (_2!977 LongMapFixedSize!538)) )
))
(declare-fun lt!21710 () tuple2!1932)

(declare-fun update!53 (LongMapFixedSize!538 (_ BitVec 64) V!2737) tuple2!1932)

(declare-fun get!1015 (ValueCell!815 V!2737) V!2737)

(declare-fun dynLambda!284 (Int (_ BitVec 64)) V!2737)

(assert (=> b!54662 (= lt!21710 (update!53 newMap!16 (select (arr!1701 (_keys!3603 (v!2293 (underlying!188 thiss!992)))) from!355) (get!1015 (select (arr!1702 (_values!1966 (v!2293 (underlying!188 thiss!992)))) from!355) (dynLambda!284 (defaultEntry!1983 (v!2293 (underlying!188 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!35747 () Bool)

(declare-fun tp_is_empty!2317 () Bool)

(declare-fun e!35745 () Bool)

(declare-fun array_inv!1051 (array!3557) Bool)

(declare-fun array_inv!1052 (array!3559) Bool)

(assert (=> b!54663 (= e!35747 (and tp!7505 tp_is_empty!2317 (array_inv!1051 (_keys!3603 newMap!16)) (array_inv!1052 (_values!1966 newMap!16)) e!35745))))

(declare-fun b!54664 () Bool)

(declare-fun e!35752 () Bool)

(assert (=> b!54664 (= e!35752 true)))

(declare-fun lt!21714 () Bool)

(declare-datatypes ((List!1379 0))(
  ( (Nil!1376) (Cons!1375 (h!1955 (_ BitVec 64)) (t!4549 List!1379)) )
))
(declare-fun arrayNoDuplicates!0 (array!3557 (_ BitVec 32) List!1379) Bool)

(assert (=> b!54664 (= lt!21714 (arrayNoDuplicates!0 (_keys!3603 (v!2293 (underlying!188 thiss!992))) #b00000000000000000000000000000000 Nil!1376))))

(declare-fun b!54665 () Bool)

(declare-fun res!30897 () Bool)

(declare-fun e!35748 () Bool)

(assert (=> b!54665 (=> (not res!30897) (not e!35748))))

(assert (=> b!54665 (= res!30897 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1930 (_keys!3603 (v!2293 (underlying!188 thiss!992)))))))))

(declare-fun res!30898 () Bool)

(assert (=> start!8318 (=> (not res!30898) (not e!35748))))

(declare-fun valid!210 (LongMap!354) Bool)

(assert (=> start!8318 (= res!30898 (valid!210 thiss!992))))

(assert (=> start!8318 e!35748))

(assert (=> start!8318 e!35754))

(assert (=> start!8318 true))

(assert (=> start!8318 e!35747))

(declare-fun mapIsEmpty!2621 () Bool)

(declare-fun mapRes!2622 () Bool)

(assert (=> mapIsEmpty!2621 mapRes!2622))

(declare-fun b!54666 () Bool)

(declare-fun e!35750 () Bool)

(assert (=> b!54666 (= e!35750 tp_is_empty!2317)))

(declare-fun b!54667 () Bool)

(assert (=> b!54667 (= e!35756 (not e!35752))))

(declare-fun res!30902 () Bool)

(assert (=> b!54667 (=> res!30902 e!35752)))

(assert (=> b!54667 (= res!30902 (or (bvsge (size!1930 (_keys!3603 (v!2293 (underlying!188 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1930 (_keys!3603 (v!2293 (underlying!188 thiss!992))))) (bvsgt from!355 (size!1930 (_keys!3603 (v!2293 (underlying!188 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54667 (arrayContainsKey!0 (_keys!3603 (v!2293 (underlying!188 thiss!992))) (select (arr!1701 (_keys!3603 (v!2293 (underlying!188 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1435 0))(
  ( (Unit!1436) )
))
(declare-fun lt!21711 () Unit!1435)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!7 (array!3557 array!3559 (_ BitVec 32) (_ BitVec 32) V!2737 V!2737 (_ BitVec 64) (_ BitVec 32) Int) Unit!1435)

(assert (=> b!54667 (= lt!21711 (lemmaListMapContainsThenArrayContainsFrom!7 (_keys!3603 (v!2293 (underlying!188 thiss!992))) (_values!1966 (v!2293 (underlying!188 thiss!992))) (mask!5832 (v!2293 (underlying!188 thiss!992))) (extraKeys!1874 (v!2293 (underlying!188 thiss!992))) (zeroValue!1901 (v!2293 (underlying!188 thiss!992))) (minValue!1901 (v!2293 (underlying!188 thiss!992))) (select (arr!1701 (_keys!3603 (v!2293 (underlying!188 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1983 (v!2293 (underlying!188 thiss!992)))))))

(declare-fun b!54668 () Bool)

(assert (=> b!54668 (= e!35748 e!35751)))

(declare-fun res!30900 () Bool)

(assert (=> b!54668 (=> (not res!30900) (not e!35751))))

(declare-fun lt!21713 () ListLongMap!1313)

(assert (=> b!54668 (= res!30900 (and (= lt!21713 lt!21712) (not (= (select (arr!1701 (_keys!3603 (v!2293 (underlying!188 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1701 (_keys!3603 (v!2293 (underlying!188 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1059 (LongMapFixedSize!538) ListLongMap!1313)

(assert (=> b!54668 (= lt!21712 (map!1059 newMap!16))))

(declare-fun getCurrentListMap!382 (array!3557 array!3559 (_ BitVec 32) (_ BitVec 32) V!2737 V!2737 (_ BitVec 32) Int) ListLongMap!1313)

(assert (=> b!54668 (= lt!21713 (getCurrentListMap!382 (_keys!3603 (v!2293 (underlying!188 thiss!992))) (_values!1966 (v!2293 (underlying!188 thiss!992))) (mask!5832 (v!2293 (underlying!188 thiss!992))) (extraKeys!1874 (v!2293 (underlying!188 thiss!992))) (zeroValue!1901 (v!2293 (underlying!188 thiss!992))) (minValue!1901 (v!2293 (underlying!188 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1983 (v!2293 (underlying!188 thiss!992)))))))

(declare-fun b!54669 () Bool)

(declare-fun e!35755 () Bool)

(assert (=> b!54669 (= e!35755 tp_is_empty!2317)))

(declare-fun b!54670 () Bool)

(declare-fun e!35758 () Bool)

(declare-fun e!35759 () Bool)

(assert (=> b!54670 (= e!35758 (and e!35759 mapRes!2622))))

(declare-fun condMapEmpty!2621 () Bool)

(declare-fun mapDefault!2621 () ValueCell!815)

