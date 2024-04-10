; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12140 () Bool)

(assert start!12140)

(declare-fun b!102466 () Bool)

(declare-fun b_free!2485 () Bool)

(declare-fun b_next!2485 () Bool)

(assert (=> b!102466 (= b_free!2485 (not b_next!2485))))

(declare-fun tp!9765 () Bool)

(declare-fun b_and!6319 () Bool)

(assert (=> b!102466 (= tp!9765 b_and!6319)))

(declare-fun b!102473 () Bool)

(declare-fun b_free!2487 () Bool)

(declare-fun b_next!2487 () Bool)

(assert (=> b!102473 (= b_free!2487 (not b_next!2487))))

(declare-fun tp!9767 () Bool)

(declare-fun b_and!6321 () Bool)

(assert (=> b!102473 (= tp!9767 b_and!6321)))

(declare-fun b!102465 () Bool)

(declare-datatypes ((Unit!3125 0))(
  ( (Unit!3126) )
))
(declare-fun e!66709 () Unit!3125)

(declare-fun Unit!3127 () Unit!3125)

(assert (=> b!102465 (= e!66709 Unit!3127)))

(declare-fun lt!52096 () Unit!3125)

(declare-datatypes ((V!3193 0))(
  ( (V!3194 (val!1374 Int)) )
))
(declare-datatypes ((array!4305 0))(
  ( (array!4306 (arr!2043 (Array (_ BitVec 32) (_ BitVec 64))) (size!2297 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!986 0))(
  ( (ValueCellFull!986 (v!2859 V!3193)) (EmptyCell!986) )
))
(declare-datatypes ((array!4307 0))(
  ( (array!4308 (arr!2044 (Array (_ BitVec 32) ValueCell!986)) (size!2298 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!880 0))(
  ( (LongMapFixedSize!881 (defaultEntry!2551 Int) (mask!6682 (_ BitVec 32)) (extraKeys!2360 (_ BitVec 32)) (zeroValue!2428 V!3193) (minValue!2428 V!3193) (_size!489 (_ BitVec 32)) (_keys!4253 array!4305) (_values!2534 array!4307) (_vacant!489 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!680 0))(
  ( (Cell!681 (v!2860 LongMapFixedSize!880)) )
))
(declare-datatypes ((LongMap!680 0))(
  ( (LongMap!681 (underlying!351 Cell!680)) )
))
(declare-fun thiss!992 () LongMap!680)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!99 (array!4305 array!4307 (_ BitVec 32) (_ BitVec 32) V!3193 V!3193 (_ BitVec 64) (_ BitVec 32) Int) Unit!3125)

(assert (=> b!102465 (= lt!52096 (lemmaListMapContainsThenArrayContainsFrom!99 (_keys!4253 (v!2860 (underlying!351 thiss!992))) (_values!2534 (v!2860 (underlying!351 thiss!992))) (mask!6682 (v!2860 (underlying!351 thiss!992))) (extraKeys!2360 (v!2860 (underlying!351 thiss!992))) (zeroValue!2428 (v!2860 (underlying!351 thiss!992))) (minValue!2428 (v!2860 (underlying!351 thiss!992))) (select (arr!2043 (_keys!4253 (v!2860 (underlying!351 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2551 (v!2860 (underlying!351 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102465 (arrayContainsKey!0 (_keys!4253 (v!2860 (underlying!351 thiss!992))) (select (arr!2043 (_keys!4253 (v!2860 (underlying!351 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52098 () Unit!3125)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4305 (_ BitVec 32) (_ BitVec 32)) Unit!3125)

(assert (=> b!102465 (= lt!52098 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4253 (v!2860 (underlying!351 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1601 0))(
  ( (Nil!1598) (Cons!1597 (h!2193 (_ BitVec 64)) (t!5635 List!1601)) )
))
(declare-fun arrayNoDuplicates!0 (array!4305 (_ BitVec 32) List!1601) Bool)

(assert (=> b!102465 (arrayNoDuplicates!0 (_keys!4253 (v!2860 (underlying!351 thiss!992))) from!355 Nil!1598)))

(declare-fun lt!52092 () Unit!3125)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4305 (_ BitVec 32) (_ BitVec 64) List!1601) Unit!3125)

(assert (=> b!102465 (= lt!52092 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4253 (v!2860 (underlying!351 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2043 (_keys!4253 (v!2860 (underlying!351 thiss!992)))) from!355) (Cons!1597 (select (arr!2043 (_keys!4253 (v!2860 (underlying!351 thiss!992)))) from!355) Nil!1598)))))

(assert (=> b!102465 false))

(declare-fun mapNonEmpty!3857 () Bool)

(declare-fun mapRes!3858 () Bool)

(declare-fun tp!9768 () Bool)

(declare-fun e!66701 () Bool)

(assert (=> mapNonEmpty!3857 (= mapRes!3858 (and tp!9768 e!66701))))

(declare-fun mapRest!3857 () (Array (_ BitVec 32) ValueCell!986))

(declare-fun mapKey!3857 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!880)

(declare-fun mapValue!3857 () ValueCell!986)

(assert (=> mapNonEmpty!3857 (= (arr!2044 (_values!2534 newMap!16)) (store mapRest!3857 mapKey!3857 mapValue!3857))))

(declare-fun e!66698 () Bool)

(declare-fun tp_is_empty!2659 () Bool)

(declare-fun e!66708 () Bool)

(declare-fun array_inv!1281 (array!4305) Bool)

(declare-fun array_inv!1282 (array!4307) Bool)

(assert (=> b!102466 (= e!66708 (and tp!9765 tp_is_empty!2659 (array_inv!1281 (_keys!4253 (v!2860 (underlying!351 thiss!992)))) (array_inv!1282 (_values!2534 (v!2860 (underlying!351 thiss!992)))) e!66698))))

(declare-fun b!102467 () Bool)

(declare-fun e!66705 () Bool)

(assert (=> b!102467 (= e!66705 e!66708)))

(declare-fun b!102468 () Bool)

(declare-fun res!51280 () Bool)

(declare-fun e!66707 () Bool)

(assert (=> b!102468 (=> (not res!51280) (not e!66707))))

(assert (=> b!102468 (= res!51280 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2297 (_keys!4253 (v!2860 (underlying!351 thiss!992)))))))))

(declare-fun b!102469 () Bool)

(declare-fun res!51275 () Bool)

(assert (=> b!102469 (=> (not res!51275) (not e!66707))))

(declare-fun valid!405 (LongMapFixedSize!880) Bool)

(assert (=> b!102469 (= res!51275 (valid!405 newMap!16))))

(declare-fun res!51277 () Bool)

(assert (=> start!12140 (=> (not res!51277) (not e!66707))))

(declare-fun valid!406 (LongMap!680) Bool)

(assert (=> start!12140 (= res!51277 (valid!406 thiss!992))))

(assert (=> start!12140 e!66707))

(declare-fun e!66712 () Bool)

(assert (=> start!12140 e!66712))

(assert (=> start!12140 true))

(declare-fun e!66713 () Bool)

(assert (=> start!12140 e!66713))

(declare-fun b!102470 () Bool)

(assert (=> b!102470 (= e!66701 tp_is_empty!2659)))

(declare-fun b!102471 () Bool)

(assert (=> b!102471 (= e!66712 e!66705)))

(declare-fun b!102472 () Bool)

(declare-fun e!66704 () Bool)

(declare-fun mapRes!3857 () Bool)

(assert (=> b!102472 (= e!66698 (and e!66704 mapRes!3857))))

(declare-fun condMapEmpty!3858 () Bool)

(declare-fun mapDefault!3858 () ValueCell!986)

