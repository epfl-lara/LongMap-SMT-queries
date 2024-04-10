; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11352 () Bool)

(assert start!11352)

(declare-fun b!94090 () Bool)

(declare-fun b_free!2397 () Bool)

(declare-fun b_next!2397 () Bool)

(assert (=> b!94090 (= b_free!2397 (not b_next!2397))))

(declare-fun tp!9457 () Bool)

(declare-fun b_and!5747 () Bool)

(assert (=> b!94090 (= tp!9457 b_and!5747)))

(declare-fun b!94075 () Bool)

(declare-fun b_free!2399 () Bool)

(declare-fun b_next!2399 () Bool)

(assert (=> b!94075 (= b_free!2399 (not b_next!2399))))

(declare-fun tp!9458 () Bool)

(declare-fun b_and!5749 () Bool)

(assert (=> b!94075 (= tp!9458 b_and!5749)))

(declare-fun mapIsEmpty!3681 () Bool)

(declare-fun mapRes!3682 () Bool)

(assert (=> mapIsEmpty!3681 mapRes!3682))

(declare-fun e!61445 () Bool)

(declare-fun tp_is_empty!2615 () Bool)

(declare-datatypes ((V!3133 0))(
  ( (V!3134 (val!1352 Int)) )
))
(declare-datatypes ((array!4205 0))(
  ( (array!4206 (arr!1999 (Array (_ BitVec 32) (_ BitVec 64))) (size!2247 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!964 0))(
  ( (ValueCellFull!964 (v!2763 V!3133)) (EmptyCell!964) )
))
(declare-datatypes ((array!4207 0))(
  ( (array!4208 (arr!2000 (Array (_ BitVec 32) ValueCell!964)) (size!2248 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!836 0))(
  ( (LongMapFixedSize!837 (defaultEntry!2437 Int) (mask!6512 (_ BitVec 32)) (extraKeys!2266 (_ BitVec 32)) (zeroValue!2324 V!3133) (minValue!2324 V!3133) (_size!467 (_ BitVec 32)) (_keys!4119 array!4205) (_values!2420 array!4207) (_vacant!467 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!836)

(declare-fun e!61440 () Bool)

(declare-fun array_inv!1245 (array!4205) Bool)

(declare-fun array_inv!1246 (array!4207) Bool)

(assert (=> b!94075 (= e!61440 (and tp!9458 tp_is_empty!2615 (array_inv!1245 (_keys!4119 newMap!16)) (array_inv!1246 (_values!2420 newMap!16)) e!61445))))

(declare-fun mapNonEmpty!3681 () Bool)

(declare-fun mapRes!3681 () Bool)

(declare-fun tp!9459 () Bool)

(declare-fun e!61449 () Bool)

(assert (=> mapNonEmpty!3681 (= mapRes!3681 (and tp!9459 e!61449))))

(declare-datatypes ((Cell!636 0))(
  ( (Cell!637 (v!2764 LongMapFixedSize!836)) )
))
(declare-datatypes ((LongMap!636 0))(
  ( (LongMap!637 (underlying!329 Cell!636)) )
))
(declare-fun thiss!992 () LongMap!636)

(declare-fun mapValue!3681 () ValueCell!964)

(declare-fun mapRest!3682 () (Array (_ BitVec 32) ValueCell!964))

(declare-fun mapKey!3682 () (_ BitVec 32))

(assert (=> mapNonEmpty!3681 (= (arr!2000 (_values!2420 (v!2764 (underlying!329 thiss!992)))) (store mapRest!3682 mapKey!3682 mapValue!3681))))

(declare-fun b!94076 () Bool)

(declare-fun e!61438 () Bool)

(assert (=> b!94076 (= e!61438 tp_is_empty!2615)))

(declare-fun b!94077 () Bool)

(declare-fun res!47662 () Bool)

(declare-fun e!61441 () Bool)

(assert (=> b!94077 (=> (not res!47662) (not e!61441))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!94077 (= res!47662 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2247 (_keys!4119 (v!2764 (underlying!329 thiss!992)))))))))

(declare-fun b!94078 () Bool)

(declare-datatypes ((Unit!2802 0))(
  ( (Unit!2803) )
))
(declare-fun e!61447 () Unit!2802)

(declare-fun Unit!2804 () Unit!2802)

(assert (=> b!94078 (= e!61447 Unit!2804)))

(declare-fun b!94079 () Bool)

(declare-fun e!61437 () Bool)

(assert (=> b!94079 (= e!61437 tp_is_empty!2615)))

(declare-fun b!94080 () Bool)

(declare-fun res!47666 () Bool)

(declare-fun e!61443 () Bool)

(assert (=> b!94080 (=> (not res!47666) (not e!61443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!94080 (= res!47666 (validMask!0 (mask!6512 (v!2764 (underlying!329 thiss!992)))))))

(declare-fun mapIsEmpty!3682 () Bool)

(assert (=> mapIsEmpty!3682 mapRes!3681))

(declare-fun res!47663 () Bool)

(assert (=> start!11352 (=> (not res!47663) (not e!61441))))

(declare-fun valid!375 (LongMap!636) Bool)

(assert (=> start!11352 (= res!47663 (valid!375 thiss!992))))

(assert (=> start!11352 e!61441))

(declare-fun e!61442 () Bool)

(assert (=> start!11352 e!61442))

(assert (=> start!11352 true))

(assert (=> start!11352 e!61440))

(declare-fun b!94081 () Bool)

(assert (=> b!94081 (= e!61449 tp_is_empty!2615)))

(declare-fun b!94082 () Bool)

(declare-fun res!47667 () Bool)

(assert (=> b!94082 (=> (not res!47667) (not e!61441))))

(assert (=> b!94082 (= res!47667 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6512 newMap!16)) (_size!467 (v!2764 (underlying!329 thiss!992)))))))

(declare-fun b!94083 () Bool)

(declare-fun e!61450 () Bool)

(declare-fun e!61446 () Bool)

(assert (=> b!94083 (= e!61450 e!61446)))

(declare-fun b!94084 () Bool)

(declare-fun e!61452 () Bool)

(assert (=> b!94084 (= e!61441 e!61452)))

(declare-fun res!47661 () Bool)

(assert (=> b!94084 (=> (not res!47661) (not e!61452))))

(declare-datatypes ((tuple2!2314 0))(
  ( (tuple2!2315 (_1!1168 (_ BitVec 64)) (_2!1168 V!3133)) )
))
(declare-datatypes ((List!1570 0))(
  ( (Nil!1567) (Cons!1566 (h!2158 tuple2!2314) (t!5476 List!1570)) )
))
(declare-datatypes ((ListLongMap!1523 0))(
  ( (ListLongMap!1524 (toList!777 List!1570)) )
))
(declare-fun lt!46603 () ListLongMap!1523)

(declare-fun lt!46600 () ListLongMap!1523)

(assert (=> b!94084 (= res!47661 (and (= lt!46603 lt!46600) (not (= (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1244 (LongMapFixedSize!836) ListLongMap!1523)

(assert (=> b!94084 (= lt!46600 (map!1244 newMap!16))))

(declare-fun getCurrentListMap!469 (array!4205 array!4207 (_ BitVec 32) (_ BitVec 32) V!3133 V!3133 (_ BitVec 32) Int) ListLongMap!1523)

(assert (=> b!94084 (= lt!46603 (getCurrentListMap!469 (_keys!4119 (v!2764 (underlying!329 thiss!992))) (_values!2420 (v!2764 (underlying!329 thiss!992))) (mask!6512 (v!2764 (underlying!329 thiss!992))) (extraKeys!2266 (v!2764 (underlying!329 thiss!992))) (zeroValue!2324 (v!2764 (underlying!329 thiss!992))) (minValue!2324 (v!2764 (underlying!329 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2437 (v!2764 (underlying!329 thiss!992)))))))

(declare-fun b!94085 () Bool)

(assert (=> b!94085 (= e!61452 e!61443)))

(declare-fun res!47664 () Bool)

(assert (=> b!94085 (=> (not res!47664) (not e!61443))))

(declare-datatypes ((tuple2!2316 0))(
  ( (tuple2!2317 (_1!1169 Bool) (_2!1169 LongMapFixedSize!836)) )
))
(declare-fun lt!46599 () tuple2!2316)

(assert (=> b!94085 (= res!47664 (and (_1!1169 lt!46599) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!46601 () Unit!2802)

(assert (=> b!94085 (= lt!46601 e!61447)))

(declare-fun c!15664 () Bool)

(declare-fun contains!790 (ListLongMap!1523 (_ BitVec 64)) Bool)

(assert (=> b!94085 (= c!15664 (contains!790 lt!46600 (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355)))))

(declare-fun update!134 (LongMapFixedSize!836 (_ BitVec 64) V!3133) tuple2!2316)

(declare-fun get!1262 (ValueCell!964 V!3133) V!3133)

(declare-fun dynLambda!362 (Int (_ BitVec 64)) V!3133)

(assert (=> b!94085 (= lt!46599 (update!134 newMap!16 (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355) (get!1262 (select (arr!2000 (_values!2420 (v!2764 (underlying!329 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2437 (v!2764 (underlying!329 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!94086 () Bool)

(declare-fun Unit!2805 () Unit!2802)

(assert (=> b!94086 (= e!61447 Unit!2805)))

(declare-fun lt!46602 () Unit!2802)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!85 (array!4205 array!4207 (_ BitVec 32) (_ BitVec 32) V!3133 V!3133 (_ BitVec 64) (_ BitVec 32) Int) Unit!2802)

(assert (=> b!94086 (= lt!46602 (lemmaListMapContainsThenArrayContainsFrom!85 (_keys!4119 (v!2764 (underlying!329 thiss!992))) (_values!2420 (v!2764 (underlying!329 thiss!992))) (mask!6512 (v!2764 (underlying!329 thiss!992))) (extraKeys!2266 (v!2764 (underlying!329 thiss!992))) (zeroValue!2324 (v!2764 (underlying!329 thiss!992))) (minValue!2324 (v!2764 (underlying!329 thiss!992))) (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2437 (v!2764 (underlying!329 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!94086 (arrayContainsKey!0 (_keys!4119 (v!2764 (underlying!329 thiss!992))) (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!46604 () Unit!2802)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4205 (_ BitVec 32) (_ BitVec 32)) Unit!2802)

(assert (=> b!94086 (= lt!46604 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4119 (v!2764 (underlying!329 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1571 0))(
  ( (Nil!1568) (Cons!1567 (h!2159 (_ BitVec 64)) (t!5477 List!1571)) )
))
(declare-fun arrayNoDuplicates!0 (array!4205 (_ BitVec 32) List!1571) Bool)

(assert (=> b!94086 (arrayNoDuplicates!0 (_keys!4119 (v!2764 (underlying!329 thiss!992))) from!355 Nil!1568)))

(declare-fun lt!46598 () Unit!2802)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4205 (_ BitVec 32) (_ BitVec 64) List!1571) Unit!2802)

(assert (=> b!94086 (= lt!46598 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4119 (v!2764 (underlying!329 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355) (Cons!1567 (select (arr!1999 (_keys!4119 (v!2764 (underlying!329 thiss!992)))) from!355) Nil!1568)))))

(assert (=> b!94086 false))

(declare-fun b!94087 () Bool)

(declare-fun e!61448 () Bool)

(assert (=> b!94087 (= e!61448 tp_is_empty!2615)))

(declare-fun b!94088 () Bool)

(declare-fun res!47665 () Bool)

(assert (=> b!94088 (=> (not res!47665) (not e!61441))))

(declare-fun valid!376 (LongMapFixedSize!836) Bool)

(assert (=> b!94088 (= res!47665 (valid!376 newMap!16))))

(declare-fun b!94089 () Bool)

(assert (=> b!94089 (= e!61445 (and e!61437 mapRes!3682))))

(declare-fun condMapEmpty!3682 () Bool)

(declare-fun mapDefault!3682 () ValueCell!964)

