; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8420 () Bool)

(assert start!8420)

(declare-fun b!57091 () Bool)

(declare-fun b_free!1945 () Bool)

(declare-fun b_next!1945 () Bool)

(assert (=> b!57091 (= b_free!1945 (not b_next!1945))))

(declare-fun tp!7940 () Bool)

(declare-fun b_and!3435 () Bool)

(assert (=> b!57091 (= tp!7940 b_and!3435)))

(declare-fun b!57092 () Bool)

(declare-fun b_free!1947 () Bool)

(declare-fun b_next!1947 () Bool)

(assert (=> b!57092 (= b_free!1947 (not b_next!1947))))

(declare-fun tp!7942 () Bool)

(declare-fun b_and!3437 () Bool)

(assert (=> b!57092 (= tp!7942 b_and!3437)))

(declare-fun b!57084 () Bool)

(declare-fun e!37620 () Bool)

(declare-fun e!37626 () Bool)

(assert (=> b!57084 (= e!37620 e!37626)))

(declare-fun res!31993 () Bool)

(assert (=> b!57084 (=> (not res!31993) (not e!37626))))

(declare-datatypes ((V!2833 0))(
  ( (V!2834 (val!1239 Int)) )
))
(declare-datatypes ((array!3703 0))(
  ( (array!3704 (arr!1773 (Array (_ BitVec 32) (_ BitVec 64))) (size!2002 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!851 0))(
  ( (ValueCellFull!851 (v!2365 V!2833)) (EmptyCell!851) )
))
(declare-datatypes ((array!3705 0))(
  ( (array!3706 (arr!1774 (Array (_ BitVec 32) ValueCell!851)) (size!2003 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!610 0))(
  ( (LongMapFixedSize!611 (defaultEntry!2021 Int) (mask!5895 (_ BitVec 32)) (extraKeys!1912 (_ BitVec 32)) (zeroValue!1939 V!2833) (minValue!1939 V!2833) (_size!354 (_ BitVec 32)) (_keys!3641 array!3703) (_values!2004 array!3705) (_vacant!354 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2012 0))(
  ( (tuple2!2013 (_1!1017 Bool) (_2!1017 LongMapFixedSize!610)) )
))
(declare-fun lt!22566 () tuple2!2012)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!57084 (= res!31993 (and (_1!1017 lt!22566) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1487 0))(
  ( (Unit!1488) )
))
(declare-fun lt!22570 () Unit!1487)

(declare-fun e!37628 () Unit!1487)

(assert (=> b!57084 (= lt!22570 e!37628)))

(declare-datatypes ((Cell!424 0))(
  ( (Cell!425 (v!2366 LongMapFixedSize!610)) )
))
(declare-datatypes ((LongMap!424 0))(
  ( (LongMap!425 (underlying!223 Cell!424)) )
))
(declare-fun thiss!992 () LongMap!424)

(declare-fun c!7036 () Bool)

(declare-datatypes ((tuple2!2014 0))(
  ( (tuple2!2015 (_1!1018 (_ BitVec 64)) (_2!1018 V!2833)) )
))
(declare-datatypes ((List!1426 0))(
  ( (Nil!1423) (Cons!1422 (h!2002 tuple2!2014) (t!4740 List!1426)) )
))
(declare-datatypes ((ListLongMap!1359 0))(
  ( (ListLongMap!1360 (toList!695 List!1426)) )
))
(declare-fun lt!22571 () ListLongMap!1359)

(declare-fun contains!678 (ListLongMap!1359 (_ BitVec 64)) Bool)

(assert (=> b!57084 (= c!7036 (contains!678 lt!22571 (select (arr!1773 (_keys!3641 (v!2366 (underlying!223 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!610)

(declare-fun update!71 (LongMapFixedSize!610 (_ BitVec 64) V!2833) tuple2!2012)

(declare-fun get!1059 (ValueCell!851 V!2833) V!2833)

(declare-fun dynLambda!302 (Int (_ BitVec 64)) V!2833)

(assert (=> b!57084 (= lt!22566 (update!71 newMap!16 (select (arr!1773 (_keys!3641 (v!2366 (underlying!223 thiss!992)))) from!355) (get!1059 (select (arr!1774 (_values!2004 (v!2366 (underlying!223 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2021 (v!2366 (underlying!223 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!2841 () Bool)

(declare-fun mapRes!2842 () Bool)

(assert (=> mapIsEmpty!2841 mapRes!2842))

(declare-fun b!57085 () Bool)

(declare-fun e!37627 () Bool)

(declare-fun e!37623 () Bool)

(assert (=> b!57085 (= e!37627 e!37623)))

(declare-fun b!57086 () Bool)

(declare-fun Unit!1489 () Unit!1487)

(assert (=> b!57086 (= e!37628 Unit!1489)))

(declare-fun b!57087 () Bool)

(declare-fun e!37625 () Bool)

(declare-fun tp_is_empty!2389 () Bool)

(assert (=> b!57087 (= e!37625 tp_is_empty!2389)))

(declare-fun mapIsEmpty!2842 () Bool)

(declare-fun mapRes!2841 () Bool)

(assert (=> mapIsEmpty!2842 mapRes!2841))

(declare-fun b!57089 () Bool)

(declare-fun e!37622 () Bool)

(assert (=> b!57089 (= e!37622 tp_is_empty!2389)))

(declare-fun b!57090 () Bool)

(declare-fun Unit!1490 () Unit!1487)

(assert (=> b!57090 (= e!37628 Unit!1490)))

(declare-fun lt!22569 () Unit!1487)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!28 (array!3703 array!3705 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) (_ BitVec 32) Int) Unit!1487)

(assert (=> b!57090 (= lt!22569 (lemmaListMapContainsThenArrayContainsFrom!28 (_keys!3641 (v!2366 (underlying!223 thiss!992))) (_values!2004 (v!2366 (underlying!223 thiss!992))) (mask!5895 (v!2366 (underlying!223 thiss!992))) (extraKeys!1912 (v!2366 (underlying!223 thiss!992))) (zeroValue!1939 (v!2366 (underlying!223 thiss!992))) (minValue!1939 (v!2366 (underlying!223 thiss!992))) (select (arr!1773 (_keys!3641 (v!2366 (underlying!223 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2366 (underlying!223 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!57090 (arrayContainsKey!0 (_keys!3641 (v!2366 (underlying!223 thiss!992))) (select (arr!1773 (_keys!3641 (v!2366 (underlying!223 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22568 () Unit!1487)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3703 (_ BitVec 32) (_ BitVec 32)) Unit!1487)

(assert (=> b!57090 (= lt!22568 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3641 (v!2366 (underlying!223 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1427 0))(
  ( (Nil!1424) (Cons!1423 (h!2003 (_ BitVec 64)) (t!4741 List!1427)) )
))
(declare-fun arrayNoDuplicates!0 (array!3703 (_ BitVec 32) List!1427) Bool)

(assert (=> b!57090 (arrayNoDuplicates!0 (_keys!3641 (v!2366 (underlying!223 thiss!992))) from!355 Nil!1424)))

(declare-fun lt!22567 () Unit!1487)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3703 (_ BitVec 32) (_ BitVec 64) List!1427) Unit!1487)

(assert (=> b!57090 (= lt!22567 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3641 (v!2366 (underlying!223 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1773 (_keys!3641 (v!2366 (underlying!223 thiss!992)))) from!355) (Cons!1423 (select (arr!1773 (_keys!3641 (v!2366 (underlying!223 thiss!992)))) from!355) Nil!1424)))))

(assert (=> b!57090 false))

(declare-fun e!37624 () Bool)

(declare-fun e!37631 () Bool)

(declare-fun array_inv!1097 (array!3703) Bool)

(declare-fun array_inv!1098 (array!3705) Bool)

(assert (=> b!57091 (= e!37624 (and tp!7940 tp_is_empty!2389 (array_inv!1097 (_keys!3641 (v!2366 (underlying!223 thiss!992)))) (array_inv!1098 (_values!2004 (v!2366 (underlying!223 thiss!992)))) e!37631))))

(declare-fun mapNonEmpty!2841 () Bool)

(declare-fun tp!7941 () Bool)

(assert (=> mapNonEmpty!2841 (= mapRes!2841 (and tp!7941 e!37622))))

(declare-fun mapKey!2842 () (_ BitVec 32))

(declare-fun mapValue!2842 () ValueCell!851)

(declare-fun mapRest!2841 () (Array (_ BitVec 32) ValueCell!851))

(assert (=> mapNonEmpty!2841 (= (arr!1774 (_values!2004 (v!2366 (underlying!223 thiss!992)))) (store mapRest!2841 mapKey!2842 mapValue!2842))))

(declare-fun e!37632 () Bool)

(declare-fun e!37633 () Bool)

(assert (=> b!57092 (= e!37632 (and tp!7942 tp_is_empty!2389 (array_inv!1097 (_keys!3641 newMap!16)) (array_inv!1098 (_values!2004 newMap!16)) e!37633))))

(declare-fun b!57093 () Bool)

(declare-fun res!31996 () Bool)

(declare-fun e!37630 () Bool)

(assert (=> b!57093 (=> (not res!31996) (not e!37630))))

(assert (=> b!57093 (= res!31996 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2002 (_keys!3641 (v!2366 (underlying!223 thiss!992)))))))))

(declare-fun b!57094 () Bool)

(declare-fun res!31997 () Bool)

(assert (=> b!57094 (=> (not res!31997) (not e!37626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!57094 (= res!31997 (validMask!0 (mask!5895 (v!2366 (underlying!223 thiss!992)))))))

(declare-fun mapNonEmpty!2842 () Bool)

(declare-fun tp!7939 () Bool)

(assert (=> mapNonEmpty!2842 (= mapRes!2842 (and tp!7939 e!37625))))

(declare-fun mapRest!2842 () (Array (_ BitVec 32) ValueCell!851))

(declare-fun mapKey!2841 () (_ BitVec 32))

(declare-fun mapValue!2841 () ValueCell!851)

(assert (=> mapNonEmpty!2842 (= (arr!1774 (_values!2004 newMap!16)) (store mapRest!2842 mapKey!2841 mapValue!2841))))

(declare-fun b!57095 () Bool)

(declare-fun e!37619 () Bool)

(assert (=> b!57095 (= e!37631 (and e!37619 mapRes!2841))))

(declare-fun condMapEmpty!2841 () Bool)

(declare-fun mapDefault!2842 () ValueCell!851)

