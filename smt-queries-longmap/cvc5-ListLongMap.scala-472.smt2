; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9218 () Bool)

(assert start!9218)

(declare-fun b!65820 () Bool)

(declare-fun b_free!2053 () Bool)

(declare-fun b_next!2053 () Bool)

(assert (=> b!65820 (= b_free!2053 (not b_next!2053))))

(declare-fun tp!8307 () Bool)

(declare-fun b_and!4059 () Bool)

(assert (=> b!65820 (= tp!8307 b_and!4059)))

(declare-fun b!65822 () Bool)

(declare-fun b_free!2055 () Bool)

(declare-fun b_next!2055 () Bool)

(assert (=> b!65822 (= b_free!2055 (not b_next!2055))))

(declare-fun tp!8309 () Bool)

(declare-fun b_and!4061 () Bool)

(assert (=> b!65822 (= tp!8309 b_and!4061)))

(declare-fun mapIsEmpty!3047 () Bool)

(declare-fun mapRes!3047 () Bool)

(assert (=> mapIsEmpty!3047 mapRes!3047))

(declare-fun b!65810 () Bool)

(declare-fun e!43168 () Bool)

(declare-fun e!43154 () Bool)

(assert (=> b!65810 (= e!43168 e!43154)))

(declare-fun mapIsEmpty!3048 () Bool)

(declare-fun mapRes!3048 () Bool)

(assert (=> mapIsEmpty!3048 mapRes!3048))

(declare-fun b!65811 () Bool)

(declare-datatypes ((Unit!1821 0))(
  ( (Unit!1822) )
))
(declare-fun e!43158 () Unit!1821)

(declare-fun Unit!1823 () Unit!1821)

(assert (=> b!65811 (= e!43158 Unit!1823)))

(declare-fun mapNonEmpty!3047 () Bool)

(declare-fun tp!8308 () Bool)

(declare-fun e!43153 () Bool)

(assert (=> mapNonEmpty!3047 (= mapRes!3047 (and tp!8308 e!43153))))

(declare-datatypes ((V!2905 0))(
  ( (V!2906 (val!1266 Int)) )
))
(declare-datatypes ((ValueCell!878 0))(
  ( (ValueCellFull!878 (v!2467 V!2905)) (EmptyCell!878) )
))
(declare-fun mapValue!3048 () ValueCell!878)

(declare-fun mapRest!3047 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapKey!3047 () (_ BitVec 32))

(declare-datatypes ((array!3823 0))(
  ( (array!3824 (arr!1827 (Array (_ BitVec 32) (_ BitVec 64))) (size!2062 (_ BitVec 32))) )
))
(declare-datatypes ((array!3825 0))(
  ( (array!3826 (arr!1828 (Array (_ BitVec 32) ValueCell!878)) (size!2063 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!664 0))(
  ( (LongMapFixedSize!665 (defaultEntry!2140 Int) (mask!6072 (_ BitVec 32)) (extraKeys!2011 (_ BitVec 32)) (zeroValue!2048 V!2905) (minValue!2048 V!2905) (_size!381 (_ BitVec 32)) (_keys!3780 array!3823) (_values!2123 array!3825) (_vacant!381 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!470 0))(
  ( (Cell!471 (v!2468 LongMapFixedSize!664)) )
))
(declare-datatypes ((LongMap!470 0))(
  ( (LongMap!471 (underlying!246 Cell!470)) )
))
(declare-fun thiss!992 () LongMap!470)

(assert (=> mapNonEmpty!3047 (= (arr!1828 (_values!2123 (v!2468 (underlying!246 thiss!992)))) (store mapRest!3047 mapKey!3047 mapValue!3048))))

(declare-fun b!65812 () Bool)

(declare-fun Unit!1824 () Unit!1821)

(assert (=> b!65812 (= e!43158 Unit!1824)))

(declare-fun lt!28266 () Unit!1821)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!42 (array!3823 array!3825 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) (_ BitVec 32) Int) Unit!1821)

(assert (=> b!65812 (= lt!28266 (lemmaListMapContainsThenArrayContainsFrom!42 (_keys!3780 (v!2468 (underlying!246 thiss!992))) (_values!2123 (v!2468 (underlying!246 thiss!992))) (mask!6072 (v!2468 (underlying!246 thiss!992))) (extraKeys!2011 (v!2468 (underlying!246 thiss!992))) (zeroValue!2048 (v!2468 (underlying!246 thiss!992))) (minValue!2048 (v!2468 (underlying!246 thiss!992))) (select (arr!1827 (_keys!3780 (v!2468 (underlying!246 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2468 (underlying!246 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65812 (arrayContainsKey!0 (_keys!3780 (v!2468 (underlying!246 thiss!992))) (select (arr!1827 (_keys!3780 (v!2468 (underlying!246 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28259 () Unit!1821)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3823 (_ BitVec 32) (_ BitVec 32)) Unit!1821)

(assert (=> b!65812 (= lt!28259 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3780 (v!2468 (underlying!246 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1459 0))(
  ( (Nil!1456) (Cons!1455 (h!2039 (_ BitVec 64)) (t!4925 List!1459)) )
))
(declare-fun arrayNoDuplicates!0 (array!3823 (_ BitVec 32) List!1459) Bool)

(assert (=> b!65812 (arrayNoDuplicates!0 (_keys!3780 (v!2468 (underlying!246 thiss!992))) from!355 Nil!1456)))

(declare-fun lt!28257 () Unit!1821)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3823 (_ BitVec 32) (_ BitVec 64) List!1459) Unit!1821)

(assert (=> b!65812 (= lt!28257 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3780 (v!2468 (underlying!246 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1827 (_keys!3780 (v!2468 (underlying!246 thiss!992)))) from!355) (Cons!1455 (select (arr!1827 (_keys!3780 (v!2468 (underlying!246 thiss!992)))) from!355) Nil!1456)))))

(assert (=> b!65812 false))

(declare-fun b!65813 () Bool)

(declare-fun res!35741 () Bool)

(declare-fun e!43167 () Bool)

(assert (=> b!65813 (=> (not res!35741) (not e!43167))))

(declare-fun newMap!16 () LongMapFixedSize!664)

(assert (=> b!65813 (= res!35741 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6072 newMap!16)) (_size!381 (v!2468 (underlying!246 thiss!992)))))))

(declare-fun b!65814 () Bool)

(declare-fun e!43165 () Bool)

(declare-fun e!43152 () Bool)

(assert (=> b!65814 (= e!43165 e!43152)))

(declare-fun res!35737 () Bool)

(assert (=> b!65814 (=> (not res!35737) (not e!43152))))

(declare-datatypes ((tuple2!2078 0))(
  ( (tuple2!2079 (_1!1050 Bool) (_2!1050 LongMapFixedSize!664)) )
))
(declare-fun lt!28264 () tuple2!2078)

(assert (=> b!65814 (= res!35737 (and (_1!1050 lt!28264) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28258 () Unit!1821)

(assert (=> b!65814 (= lt!28258 e!43158)))

(declare-datatypes ((tuple2!2080 0))(
  ( (tuple2!2081 (_1!1051 (_ BitVec 64)) (_2!1051 V!2905)) )
))
(declare-datatypes ((List!1460 0))(
  ( (Nil!1457) (Cons!1456 (h!2040 tuple2!2080) (t!4926 List!1460)) )
))
(declare-datatypes ((ListLongMap!1395 0))(
  ( (ListLongMap!1396 (toList!713 List!1460)) )
))
(declare-fun lt!28261 () ListLongMap!1395)

(declare-fun c!9035 () Bool)

(declare-fun contains!705 (ListLongMap!1395 (_ BitVec 64)) Bool)

(assert (=> b!65814 (= c!9035 (contains!705 lt!28261 (select (arr!1827 (_keys!3780 (v!2468 (underlying!246 thiss!992)))) from!355)))))

(declare-fun lt!28265 () V!2905)

(declare-fun update!86 (LongMapFixedSize!664 (_ BitVec 64) V!2905) tuple2!2078)

(assert (=> b!65814 (= lt!28264 (update!86 newMap!16 (select (arr!1827 (_keys!3780 (v!2468 (underlying!246 thiss!992)))) from!355) lt!28265))))

(declare-fun b!65816 () Bool)

(declare-fun e!43162 () Bool)

(declare-fun tp_is_empty!2443 () Bool)

(assert (=> b!65816 (= e!43162 tp_is_empty!2443)))

(declare-fun mapNonEmpty!3048 () Bool)

(declare-fun tp!8310 () Bool)

(declare-fun e!43156 () Bool)

(assert (=> mapNonEmpty!3048 (= mapRes!3048 (and tp!8310 e!43156))))

(declare-fun mapValue!3047 () ValueCell!878)

(declare-fun mapRest!3048 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapKey!3048 () (_ BitVec 32))

(assert (=> mapNonEmpty!3048 (= (arr!1828 (_values!2123 newMap!16)) (store mapRest!3048 mapKey!3048 mapValue!3047))))

(declare-fun b!65817 () Bool)

(declare-fun e!43166 () Bool)

(assert (=> b!65817 (= e!43166 tp_is_empty!2443)))

(declare-fun b!65818 () Bool)

(assert (=> b!65818 (= e!43156 tp_is_empty!2443)))

(declare-fun b!65819 () Bool)

(declare-fun e!43155 () Bool)

(assert (=> b!65819 (= e!43155 (and e!43162 mapRes!3048))))

(declare-fun condMapEmpty!3047 () Bool)

(declare-fun mapDefault!3047 () ValueCell!878)

