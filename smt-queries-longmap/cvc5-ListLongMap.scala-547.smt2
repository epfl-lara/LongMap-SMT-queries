; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14568 () Bool)

(assert start!14568)

(declare-fun b!137496 () Bool)

(declare-fun b_free!2953 () Bool)

(declare-fun b_next!2953 () Bool)

(assert (=> b!137496 (= b_free!2953 (not b_next!2953))))

(declare-fun tp!11319 () Bool)

(declare-fun b_and!8515 () Bool)

(assert (=> b!137496 (= tp!11319 b_and!8515)))

(declare-fun b!137488 () Bool)

(declare-fun b_free!2955 () Bool)

(declare-fun b_next!2955 () Bool)

(assert (=> b!137488 (= b_free!2955 (not b_next!2955))))

(declare-fun tp!11321 () Bool)

(declare-fun b_and!8517 () Bool)

(assert (=> b!137488 (= tp!11321 b_and!8517)))

(declare-fun b!137485 () Bool)

(declare-fun e!89507 () Bool)

(declare-fun tp_is_empty!2893 () Bool)

(assert (=> b!137485 (= e!89507 tp_is_empty!2893)))

(declare-fun mapIsEmpty!4709 () Bool)

(declare-fun mapRes!4710 () Bool)

(assert (=> mapIsEmpty!4709 mapRes!4710))

(declare-fun b!137486 () Bool)

(declare-fun e!89517 () Bool)

(declare-fun e!89512 () Bool)

(assert (=> b!137486 (= e!89517 e!89512)))

(declare-fun res!65917 () Bool)

(assert (=> b!137486 (=> (not res!65917) (not e!89512))))

(declare-datatypes ((V!3505 0))(
  ( (V!3506 (val!1491 Int)) )
))
(declare-datatypes ((tuple2!2650 0))(
  ( (tuple2!2651 (_1!1336 (_ BitVec 64)) (_2!1336 V!3505)) )
))
(declare-datatypes ((List!1726 0))(
  ( (Nil!1723) (Cons!1722 (h!2329 tuple2!2650) (t!6230 List!1726)) )
))
(declare-datatypes ((ListLongMap!1719 0))(
  ( (ListLongMap!1720 (toList!875 List!1726)) )
))
(declare-fun lt!71943 () ListLongMap!1719)

(declare-datatypes ((array!4817 0))(
  ( (array!4818 (arr!2277 (Array (_ BitVec 32) (_ BitVec 64))) (size!2548 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1103 0))(
  ( (ValueCellFull!1103 (v!3234 V!3505)) (EmptyCell!1103) )
))
(declare-datatypes ((array!4819 0))(
  ( (array!4820 (arr!2278 (Array (_ BitVec 32) ValueCell!1103)) (size!2549 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1114 0))(
  ( (LongMapFixedSize!1115 (defaultEntry!2909 Int) (mask!7233 (_ BitVec 32)) (extraKeys!2666 (_ BitVec 32)) (zeroValue!2760 V!3505) (minValue!2760 V!3505) (_size!606 (_ BitVec 32)) (_keys!4666 array!4817) (_values!2892 array!4819) (_vacant!606 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!902 0))(
  ( (Cell!903 (v!3235 LongMapFixedSize!1114)) )
))
(declare-datatypes ((LongMap!902 0))(
  ( (LongMap!903 (underlying!462 Cell!902)) )
))
(declare-fun thiss!992 () LongMap!902)

(declare-fun lt!71942 () ListLongMap!1719)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!137486 (= res!65917 (and (= lt!71942 lt!71943) (not (= (select (arr!2277 (_keys!4666 (v!3235 (underlying!462 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2277 (_keys!4666 (v!3235 (underlying!462 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1114)

(declare-fun map!1420 (LongMapFixedSize!1114) ListLongMap!1719)

(assert (=> b!137486 (= lt!71943 (map!1420 newMap!16))))

(declare-fun getCurrentListMap!551 (array!4817 array!4819 (_ BitVec 32) (_ BitVec 32) V!3505 V!3505 (_ BitVec 32) Int) ListLongMap!1719)

(assert (=> b!137486 (= lt!71942 (getCurrentListMap!551 (_keys!4666 (v!3235 (underlying!462 thiss!992))) (_values!2892 (v!3235 (underlying!462 thiss!992))) (mask!7233 (v!3235 (underlying!462 thiss!992))) (extraKeys!2666 (v!3235 (underlying!462 thiss!992))) (zeroValue!2760 (v!3235 (underlying!462 thiss!992))) (minValue!2760 (v!3235 (underlying!462 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2909 (v!3235 (underlying!462 thiss!992)))))))

(declare-fun b!137487 () Bool)

(declare-fun e!89521 () Bool)

(assert (=> b!137487 (= e!89521 tp_is_empty!2893)))

(declare-fun e!89513 () Bool)

(declare-fun e!89510 () Bool)

(declare-fun array_inv!1433 (array!4817) Bool)

(declare-fun array_inv!1434 (array!4819) Bool)

(assert (=> b!137488 (= e!89510 (and tp!11321 tp_is_empty!2893 (array_inv!1433 (_keys!4666 newMap!16)) (array_inv!1434 (_values!2892 newMap!16)) e!89513))))

(declare-fun b!137489 () Bool)

(declare-fun e!89519 () Bool)

(declare-fun e!89511 () Bool)

(assert (=> b!137489 (= e!89519 e!89511)))

(declare-fun mapIsEmpty!4710 () Bool)

(declare-fun mapRes!4709 () Bool)

(assert (=> mapIsEmpty!4710 mapRes!4709))

(declare-fun b!137490 () Bool)

(declare-fun res!65918 () Bool)

(assert (=> b!137490 (=> (not res!65918) (not e!89517))))

(assert (=> b!137490 (= res!65918 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7233 newMap!16)) (_size!606 (v!3235 (underlying!462 thiss!992)))))))

(declare-fun b!137491 () Bool)

(declare-fun e!89514 () Bool)

(assert (=> b!137491 (= e!89511 e!89514)))

(declare-fun b!137492 () Bool)

(declare-fun e!89516 () Bool)

(assert (=> b!137492 (= e!89512 e!89516)))

(declare-fun res!65920 () Bool)

(assert (=> b!137492 (=> (not res!65920) (not e!89516))))

(declare-fun contains!909 (ListLongMap!1719 (_ BitVec 64)) Bool)

(assert (=> b!137492 (= res!65920 (contains!909 lt!71943 (select (arr!2277 (_keys!4666 (v!3235 (underlying!462 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2652 0))(
  ( (tuple2!2653 (_1!1337 Bool) (_2!1337 LongMapFixedSize!1114)) )
))
(declare-fun lt!71944 () tuple2!2652)

(declare-fun update!200 (LongMapFixedSize!1114 (_ BitVec 64) V!3505) tuple2!2652)

(declare-fun get!1500 (ValueCell!1103 V!3505) V!3505)

(declare-fun dynLambda!431 (Int (_ BitVec 64)) V!3505)

(assert (=> b!137492 (= lt!71944 (update!200 newMap!16 (select (arr!2277 (_keys!4666 (v!3235 (underlying!462 thiss!992)))) from!355) (get!1500 (select (arr!2278 (_values!2892 (v!3235 (underlying!462 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2909 (v!3235 (underlying!462 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!4709 () Bool)

(declare-fun tp!11322 () Bool)

(declare-fun e!89508 () Bool)

(assert (=> mapNonEmpty!4709 (= mapRes!4709 (and tp!11322 e!89508))))

(declare-fun mapRest!4710 () (Array (_ BitVec 32) ValueCell!1103))

(declare-fun mapKey!4709 () (_ BitVec 32))

(declare-fun mapValue!4710 () ValueCell!1103)

(assert (=> mapNonEmpty!4709 (= (arr!2278 (_values!2892 newMap!16)) (store mapRest!4710 mapKey!4709 mapValue!4710))))

(declare-fun b!137493 () Bool)

(declare-fun res!65919 () Bool)

(assert (=> b!137493 (=> (not res!65919) (not e!89517))))

(assert (=> b!137493 (= res!65919 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2548 (_keys!4666 (v!3235 (underlying!462 thiss!992)))))))))

(declare-fun b!137494 () Bool)

(assert (=> b!137494 (= e!89516 (not true))))

(declare-fun arrayContainsKey!0 (array!4817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137494 (arrayContainsKey!0 (_keys!4666 (v!3235 (underlying!462 thiss!992))) (select (arr!2277 (_keys!4666 (v!3235 (underlying!462 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4334 0))(
  ( (Unit!4335) )
))
(declare-fun lt!71941 () Unit!4334)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!130 (array!4817 array!4819 (_ BitVec 32) (_ BitVec 32) V!3505 V!3505 (_ BitVec 64) (_ BitVec 32) Int) Unit!4334)

(assert (=> b!137494 (= lt!71941 (lemmaListMapContainsThenArrayContainsFrom!130 (_keys!4666 (v!3235 (underlying!462 thiss!992))) (_values!2892 (v!3235 (underlying!462 thiss!992))) (mask!7233 (v!3235 (underlying!462 thiss!992))) (extraKeys!2666 (v!3235 (underlying!462 thiss!992))) (zeroValue!2760 (v!3235 (underlying!462 thiss!992))) (minValue!2760 (v!3235 (underlying!462 thiss!992))) (select (arr!2277 (_keys!4666 (v!3235 (underlying!462 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2909 (v!3235 (underlying!462 thiss!992)))))))

(declare-fun b!137495 () Bool)

(assert (=> b!137495 (= e!89508 tp_is_empty!2893)))

(declare-fun e!89518 () Bool)

(assert (=> b!137496 (= e!89514 (and tp!11319 tp_is_empty!2893 (array_inv!1433 (_keys!4666 (v!3235 (underlying!462 thiss!992)))) (array_inv!1434 (_values!2892 (v!3235 (underlying!462 thiss!992)))) e!89518))))

(declare-fun res!65916 () Bool)

(assert (=> start!14568 (=> (not res!65916) (not e!89517))))

(declare-fun valid!535 (LongMap!902) Bool)

(assert (=> start!14568 (= res!65916 (valid!535 thiss!992))))

(assert (=> start!14568 e!89517))

(assert (=> start!14568 e!89519))

(assert (=> start!14568 true))

(assert (=> start!14568 e!89510))

(declare-fun b!137497 () Bool)

(declare-fun res!65921 () Bool)

(assert (=> b!137497 (=> (not res!65921) (not e!89517))))

(declare-fun valid!536 (LongMapFixedSize!1114) Bool)

(assert (=> b!137497 (= res!65921 (valid!536 newMap!16))))

(declare-fun b!137498 () Bool)

(declare-fun e!89515 () Bool)

(assert (=> b!137498 (= e!89515 tp_is_empty!2893)))

(declare-fun b!137499 () Bool)

(assert (=> b!137499 (= e!89513 (and e!89515 mapRes!4709))))

(declare-fun condMapEmpty!4709 () Bool)

(declare-fun mapDefault!4709 () ValueCell!1103)

